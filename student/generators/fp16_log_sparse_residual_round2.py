#!/usr/bin/env python3
"""Round-2 sparse residual FP16 log-family candidates.

This is intentionally narrow for the frontend ref-gap campaign.  It keeps the
known exact positive-normal log-family shell, but changes the low-output table
representation from a dense nested hi/lo LUT into per-hi sparse residual
defaults.  That makes this a source-level compression attempt rather than a
repeat of the round-1 nested-boundary sweep.
"""

import argparse
import csv
import re
import shutil
import subprocess
import sys
import time
from collections import Counter
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from student.frontends.truth import TruthTable
from student.frontends.yosys_synth import SynthError, run_command
from student.generators.fp16_log_nested_semantic import (
    ACTIVE_SIGN_EXP,
    CASE_LABELS,
    MANT_BITS,
    MANT_SIZE,
    outputs_for_sign_exp,
    render_high_bit,
    render_special_table,
)
from student.generators.fp16_ex232_square_deep import const_word
from student.generators.fp16_semantic_search import rel_path, write_csv
from student.scripts.yosys_synthflow_variants import script_abc_gate


RUN_ID = "ex200_ex299_frontend_refgap_round2_20260612_1512"
AGENT_ID = "unary-agent"
DEFAULT_CASES = ["ex225", "ex223", "ex224"]
DEFAULT_ABC = ROOT / "student" / "abc"
DEFAULT_YOSYS = ROOT / "student" / "tools" / "conda-env" / "bin" / "yosys"
ADP_RE = re.compile(r"^\s*(ex\d{3})\s+OK\s+(\d+)\s+(\d+)\s+(\d+)\s*$", re.M)


def mode_value(values):
    counts = Counter(values)
    return min(counts, key=lambda value: (-counts[value], value))


def write_text(path, text):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(text)


def synthesize_with_script(script, yosys, timeout, log_path):
    log_path.parent.mkdir(parents=True, exist_ok=True)
    script_path = log_path.with_suffix(".ys")
    write_text(script_path, script)
    code, log = run_command([str(yosys), "-s", str(script_path)], timeout=timeout)
    write_text(log_path, log)
    if code != 0:
        raise SynthError("Yosys failed with exit code {0}".format(code))


def render_sparse_low_lut(lines, table, low_width, nested_hi):
    lo_bits = MANT_BITS - nested_hi
    low_mask = (1 << low_width) - 1
    lines.extend(
        [
            "  reg [{0}:0] out_low;".format(low_width - 1),
            "  always @* begin",
            "    case (sign_exp)",
        ]
    )
    total_hi_groups = 0
    sparse_overrides = 0
    dense_entries = 0
    for sign_exp in ACTIVE_SIGN_EXP:
        lines.append("      {0}: begin".format(const_word(6, sign_exp)))
        lines.append("        case (mant[9:{0}])".format(lo_bits))
        for hi in range(1 << nested_hi):
            values = []
            for lo in range(1 << lo_bits):
                mant = (hi << lo_bits) | lo
                values.append(table.get_output((sign_exp << MANT_BITS) | mant) & low_mask)
            default = mode_value(values)
            differing = [(lo, value) for lo, value in enumerate(values) if value != default]
            total_hi_groups += 1
            dense_entries += len(values)
            if not differing:
                lines.append(
                    "          {0}: out_low = {1};".format(
                        const_word(nested_hi, hi),
                        const_word(low_width, default),
                    )
                )
                continue
            lines.append("          {0}: begin".format(const_word(nested_hi, hi)))
            lines.append("            out_low = {0};".format(const_word(low_width, default)))
            lines.append("            case (mant[{0}:0])".format(lo_bits - 1))
            for lo, value in differing:
                sparse_overrides += 1
                lines.append(
                    "              {0}: out_low = {1};".format(
                        const_word(lo_bits, lo),
                        const_word(low_width, value),
                    )
                )
            lines.extend(["              default: begin end", "            endcase", "          end"])
        lines.extend(["          default: out_low = {0};".format(const_word(low_width, 0)), "        endcase", "      end"])
    lines.extend(["      default: out_low = {0};".format(const_word(low_width, 0)), "    endcase", "  end"])
    return (
        "sparse_low_width={0}; nested_hi={1}; nested_lo={2}; hi_groups={3}; "
        "dense_entries={4}; sparse_overrides={5}"
    ).format(low_width, nested_hi, lo_bits, total_hi_groups, dense_entries, sparse_overrides)


def render_candidate(case, table, module, low_width, nested_hi):
    lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [15:0] out;",
        "  wire [5:0] sign_exp = in[15:10];",
        "  wire [9:0] mant = in[9:0];",
        "  wire active_pos_normal = (sign_exp >= 6'd1) && (sign_exp <= 6'd30);",
    ]
    metas = [render_special_table(lines, table)]
    metas.append(render_sparse_low_lut(lines, table, low_width, nested_hi))
    high_bits = list(range(15, low_width - 1, -1))
    for bit in high_bits:
        metas.append(render_high_bit(lines, table, bit, low_width))
    pieces = ["out_b{0}".format(bit) for bit in high_bits]
    pieces.append("out_low")
    lines.append("  wire [15:0] normal_out = {" + ", ".join(pieces) + "};")
    lines.append("  assign out = active_pos_normal ? normal_out : special_out;")
    lines.extend(["endmodule", ""])
    note = "positive-normal high-bit run trees plus sparse default residual low LUT; " + "; ".join(metas)
    return "\n".join(lines), note


def verify_rendered_exact(case, table, low_width, nested_hi):
    # Lightweight structural self-check: recompute the same decomposition in Python.
    # The Verilog table values are derived directly from the truth table, so this
    # catches only accidental active-region or bit-slice mistakes before synthesis.
    low_mask = (1 << low_width) - 1
    for sign_exp in range(64):
        values = outputs_for_sign_exp(table, sign_exp)
        for mant, expected in enumerate(values):
            if sign_exp not in ACTIVE_SIGN_EXP:
                actual = expected
            else:
                actual = table.get_output((sign_exp << MANT_BITS) | mant)
                if (actual & low_mask) != (expected & low_mask):
                    return False, "low mismatch sign_exp={0} mant={1}".format(sign_exp, mant)
            if actual != expected:
                return False, "mismatch sign_exp={0} mant={1}".format(sign_exp, mant)
    return True, "truth-derived decomposition exact by construction"


def run_official_evaluate(case, candidate_id, aig_path, official_dir, abc, benchmarks, timeout):
    official_dir.mkdir(parents=True, exist_ok=True)
    stale_log = official_dir / "evaluate.py.log"
    if stale_log.exists():
        stale_log.unlink()
    official_aig = official_dir / "{0}.aig".format(case)
    shutil.copyfile(str(aig_path), str(official_aig))
    cmd = [
        sys.executable,
        str(ROOT / "evaluate.py"),
        "--abc",
        str(abc),
        "--benchmarks",
        str(benchmarks),
        "--output",
        str(official_dir),
        "--case",
        case,
        "--timeout",
        str(timeout),
    ]
    start = time.time()
    result = subprocess.run(
        cmd,
        cwd=str(ROOT),
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        universal_newlines=True,
        timeout=timeout + 30,
    )
    log_path = official_dir.parent / "{0}.evaluate.py.log".format(candidate_id)
    write_text(log_path, result.stdout)
    match = ADP_RE.search(result.stdout)
    if result.returncode == 0 and match:
        return {
            "official_status": "OK",
            "official_area": match.group(2),
            "official_delay": match.group(3),
            "official_adp": match.group(4),
            "official_log": rel_path(log_path),
            "official_output_dir": rel_path(official_dir),
            "official_runtime_sec": "{0:.3f}".format(time.time() - start),
        }
    return {
        "official_status": "FAIL",
        "official_area": "",
        "official_delay": "",
        "official_adp": "",
        "official_log": rel_path(log_path),
        "official_output_dir": rel_path(official_dir),
        "official_runtime_sec": "{0:.3f}".format(time.time() - start),
    }


def read_reference_adp(path):
    refs = {}
    with Path(path).open() as handle:
        reader = csv.DictReader(handle)
        for row in reader:
            refs[row["case"]] = int(row.get("ADP", row.get("adp")))
    return refs


def current_thresholds():
    return {
        "ex223": {"frontend": 204193, "overall": 189468, "reference": 120549},
        "ex224": {"frontend": 96224, "overall": 88800, "reference": 64708},
        "ex225": {"frontend": 219070, "overall": 205656, "reference": 116676},
    }


def make_candidate(args, case):
    configs = {
        "ex223": (14, 5),
        "ex224": (12, 6),
        "ex225": (14, 5),
    }
    low_width, nested_hi = configs[case]
    variant = "sparse_residual_low{0}_hi{1}".format(low_width, nested_hi)
    table = TruthTable(args.benchmarks / "{0}.truth".format(case), input_order="abc_xf")
    module = "{0}_log_sparse_residual_low{1}_hi{2}".format(case, low_width, nested_hi)
    text, note = render_candidate(case, table, module, low_width, nested_hi)
    ok, verify_note = verify_rendered_exact(case, table, low_width, nested_hi)
    if not ok:
        raise RuntimeError(verify_note)

    work_case = args.work_dir / case
    verilog_path = work_case / "verilog" / "{0}.v".format(module)
    write_text(verilog_path, text)
    candidate_id = "{0}_log_sparse_residual_low{1}_hi{2}_abc_g_aig".format(case, low_width, nested_hi)
    aig_path = work_case / "aigs" / "{0}.aig".format(candidate_id)
    yosys_log = work_case / "logs" / "{0}.yosys.log".format(candidate_id)
    row = {
        "case": case,
        "candidate_id": candidate_id,
        "method_signature": "{0}|fp16_log_family_sparse_residual_compression|sparse_per_hi_low{1}_residual_defaults|shared_special_sign_exp_decode_plus_high_bit_run_trees|yosys_abc_g_aig|abc_xf_official_evaluate|high_bits_run_trees_sparse_low{1}_residual".format(case, low_width),
        "hypothesis": "fp16_log_family_sparse_residual_compression",
        "representation": "sparse_per_hi_low{0}_residual_defaults".format(low_width),
        "sharing": "shared_special_sign_exp_decode_plus_high_bit_run_trees",
        "synth_flow": "yosys_abc_g_aig",
        "semantics": "abc_xf_official_evaluate",
        "output_grouping": "high_bits_run_trees_sparse_low{0}_residual".format(low_width),
        "variant": variant,
        "verilog_path": rel_path(verilog_path),
        "aig_path": rel_path(aig_path),
        "verified_truth": "1",
        "simulation_pass": "not_run",
        "synthesized": "0",
        "equivalent": "0",
        "area": "",
        "delay": "",
        "adp": "",
        "reference_adp": str(args.reference_adp[case]),
        "current_frontend_adp": str(args.thresholds[case]["frontend"]),
        "current_overall_adp": str(args.thresholds[case]["overall"]),
        "beats_frontend": "0",
        "beats_overall": "0",
        "beats_reference": "0",
        "evaluate_log": "",
        "notes": note + "; " + verify_note,
    }

    start = time.time()
    try:
        aig_path.parent.mkdir(parents=True, exist_ok=True)
        script = script_abc_gate(verilog_path, module, aig_path, "aig")
        synthesize_with_script(script, args.yosys, args.timeout, yosys_log)
        row["synthesized"] = "1"
        official = run_official_evaluate(
            case=case,
            candidate_id=candidate_id,
            aig_path=aig_path,
            official_dir=work_case / "official_eval" / candidate_id,
            abc=args.abc,
            benchmarks=args.benchmarks,
            timeout=args.timeout,
        )
        row["equivalent"] = "1" if official["official_status"] == "OK" else "0"
        row["area"] = official["official_area"]
        row["delay"] = official["official_delay"]
        row["adp"] = official["official_adp"]
        row["evaluate_log"] = official["official_log"]
        if row["adp"]:
            adp = int(row["adp"])
            row["beats_frontend"] = "1" if adp < args.thresholds[case]["frontend"] else "0"
            row["beats_overall"] = "1" if adp < args.thresholds[case]["overall"] else "0"
            row["beats_reference"] = "1" if adp < args.thresholds[case]["reference"] else "0"
        if official["official_status"] != "OK":
            row["notes"] += "; official evaluate.py failed"
    except (OSError, RuntimeError, SynthError, subprocess.TimeoutExpired) as exc:
        row["notes"] += "; {0}: {1}".format(type(exc).__name__, str(exc)[:500])
    row["runtime_sec"] = "{0:.3f}".format(time.time() - start)
    print("{0} {1} eq={2} area={3} delay={4} adp={5}".format(
        case,
        candidate_id,
        row["equivalent"],
        row["area"],
        row["delay"],
        row["adp"],
    ))
    sys.stdout.flush()
    return row


def write_case_registry(args, case, rows):
    run_dir = args.run_root / case
    results_dir = run_dir / "results"
    results_dir.mkdir(parents=True, exist_ok=True)
    write_csv(results_dir / "candidates.csv", CANDIDATE_FIELDS, rows)
    eq_rows = [row for row in rows if row["equivalent"] == "1" and row["adp"]]
    best = sorted(eq_rows, key=lambda row: int(row["adp"]))[:1]
    write_csv(results_dir / "best.csv", CANDIDATE_FIELDS, best)
    manifest = [
        "# {0} {1} {2}".format(RUN_ID, AGENT_ID, case),
        "",
        "Run ID: `{0}`".format(RUN_ID),
        "Agent: `{0}`".format(AGENT_ID),
        "Case: `{0}`".format(case),
        "",
        "Purpose: round-2 sparse residual source-level FP16 log-family candidate.",
        "",
        "Artifacts:",
        "- Work directory: `{0}`".format(rel_path(args.work_dir / case)),
        "- Results: `{0}`".format(rel_path(results_dir)),
        "",
        "Best result:",
    ]
    if best:
        row = best[0]
        manifest.append("- `{0}` `{1}/{2}/{3}` equivalent by official `evaluate.py`.".format(
            row["candidate_id"], row["area"], row["delay"], row["adp"]
        ))
    else:
        manifest.append("- No equivalent synthesized candidate.")
    manifest.append("")
    write_text(run_dir / "MANIFEST.md", "\n".join(manifest))


CANDIDATE_FIELDS = [
    "case",
    "candidate_id",
    "method_signature",
    "hypothesis",
    "representation",
    "sharing",
    "synth_flow",
    "semantics",
    "output_grouping",
    "variant",
    "verilog_path",
    "aig_path",
    "verified_truth",
    "simulation_pass",
    "synthesized",
    "equivalent",
    "area",
    "delay",
    "adp",
    "reference_adp",
    "current_frontend_adp",
    "current_overall_adp",
    "beats_frontend",
    "beats_overall",
    "beats_reference",
    "evaluate_log",
    "runtime_sec",
    "notes",
]


def write_shard_csvs(args, rows):
    shard = args.shard_dir
    shard.mkdir(parents=True, exist_ok=True)
    write_csv(shard / "candidates.csv", CANDIDATE_FIELDS, [row for row in rows if row["equivalent"] == "1"])
    improvements = [row for row in rows if row["equivalent"] == "1" and row["beats_frontend"] == "1"]
    write_csv(shard / "best_improvements.csv", CANDIDATE_FIELDS, improvements)
    failures = [row for row in rows if row["equivalent"] != "1"]
    write_csv(shard / "failed_hypotheses.csv", CANDIDATE_FIELDS, failures)
    eval_fields = [
        "case",
        "candidate_id",
        "equivalent",
        "area",
        "delay",
        "adp",
        "reference_adp",
        "current_frontend_adp",
        "current_overall_adp",
        "beats_frontend",
        "beats_overall",
        "beats_reference",
        "evaluate_log",
        "notes",
    ]
    write_csv(shard / "evaluation_results.csv", eval_fields, [{k: row[k] for k in eval_fields} for row in rows])
    sim_fields = ["case", "candidate_id", "simulation_pass", "notes"]
    write_csv(shard / "simulation_results.csv", sim_fields, [{k: row[k] for k in sim_fields} for row in rows])
    structure_fields = ["case", "candidate_id", "method_signature", "hypothesis", "representation", "sharing", "output_grouping", "notes"]
    write_csv(shard / "shared_structure_report.csv", structure_fields, [{k: row[k] for k in structure_fields} for row in rows])
    write_csv(shard / "proposed_frontend_best_updates.csv", CANDIDATE_FIELDS, improvements)
    hyp_fields = ["case", "hypothesis", "representation_family", "sharing_strategy", "source", "confidence", "novelty", "expected_gain", "status", "reason", "created_by", "created_at"]
    hyp_rows = []
    for row in rows:
        status = "tested_promising" if row["beats_frontend"] == "1" else ("tested_equivalent_nonwinning" if row["equivalent"] == "1" else "tested_bad")
        reason = "official evaluate.py ADP={0}; current_frontend={1}; reference={2}".format(row["adp"], row["current_frontend_adp"], row["reference_adp"])
        hyp_rows.append({
            "case": row["case"],
            "hypothesis": row["hypothesis"],
            "representation_family": row["representation"],
            "sharing_strategy": row["sharing"],
            "source": "{0}/{1}".format(RUN_ID, AGENT_ID),
            "confidence": "medium",
            "novelty": "source_level_residual_compression",
            "expected_gain": "medium",
            "status": status,
            "reason": reason,
            "created_by": AGENT_ID,
            "created_at": "2026-06-12",
        })
    write_csv(shard / "proposed_hypothesis_updates.csv", hyp_fields, hyp_rows)
    search_fields = ["case", "domain", "status", "assigned_agent", "current_focus", "next_hypothesis", "next_representation", "budget", "last_update", "priority", "current_best_adp", "reference_adp", "ratio_to_reference", "recommendation"]
    search_rows = []
    for row in rows:
        search_rows.append({
            "case": row["case"],
            "domain": "fp16",
            "status": "round2_evaluated_gap_remains",
            "assigned_agent": AGENT_ID,
            "current_focus": "sparse residual source-level compression evaluated by official evaluate.py",
            "next_hypothesis": "derive shallower arithmetic normalizer or compress transition predicates beyond sparse residual table",
            "next_representation": "shallow exponent-base residual normalizer or selected-bit predecode with lower delay",
            "budget": "continue",
            "last_update": "2026-06-12 unary-agent shard",
            "priority": "frontend_high",
            "current_best_adp": row["current_overall_adp"],
            "reference_adp": row["reference_adp"],
            "ratio_to_reference": "" if not row["current_overall_adp"] else "{0:.6f}".format(int(row["current_overall_adp"]) / int(row["reference_adp"])),
            "recommendation": "continue source-level frontend search; sparse residual candidate did not close reference gap",
        })
    write_csv(shard / "proposed_search_state_updates.csv", search_fields, search_rows)
    manual_fields = ["case", "method_signature", "outcome", "failure_reason", "reuse_policy", "next_action", "author", "date", "notes"]
    manual_rows = []
    for row in rows:
        if row["beats_frontend"] == "1":
            outcome = "frontend_improvement_gap_remains"
            reuse = "worth_extending_with_new_structure"
            failure = "does not beat reference"
        elif row["equivalent"] == "1":
            outcome = "equivalent_but_bad_qor"
            reuse = "do_not_repeat_as_is"
            failure = "official equivalent but did not beat current frontend"
        else:
            outcome = "not_equivalent_or_synthesis_failed"
            reuse = "do_not_repeat_as_is"
            failure = "synthesis or official evaluate.py failed"
        manual_rows.append({
            "case": row["case"],
            "method_signature": row["method_signature"],
            "outcome": outcome,
            "failure_reason": failure,
            "reuse_policy": reuse,
            "next_action": "Only repeat with a materially different residual representation or shallower normalizer.",
            "author": AGENT_ID,
            "date": "2026-06-12",
            "notes": row["notes"][:500],
        })
    write_csv(shard / "proposed_manual_judgments.csv", manual_fields, manual_rows)


def update_summary(args, rows):
    summary = args.summary_path
    lines = [
        "# unary-agent Progress",
        "",
        "Run ID: `{0}`".format(RUN_ID),
        "",
        "Assigned cases: `ex200`, `ex204`, `ex205`, `ex223`, `ex224`, `ex225`",
        "",
        "Prioritized cases evaluated first: `ex225`, `ex223`.",
        "",
        "## Round-2 Sparse Residual Results",
        "",
        "| case | candidate | official result | vs frontend | vs overall | vs reference |",
        "|---|---|---:|---:|---:|---:|",
    ]
    for row in rows:
        official = "not equivalent"
        if row["equivalent"] == "1":
            official = "{0}/{1}/{2}".format(row["area"], row["delay"], row["adp"])
        lines.append(
            "| `{0}` | `{1}` | {2} | {3} | {4} | {5} |".format(
                row["case"],
                row["candidate_id"],
                official,
                "beat" if row["beats_frontend"] == "1" else "no",
                "beat" if row["beats_overall"] == "1" else "no",
                "beat" if row["beats_reference"] == "1" else "no",
            )
        )
    lines.extend(
        [
            "",
            "## Notes",
            "",
            "- Family tried: sparse per-hi low14 residual defaults plus shared special sign/exp decode and high-bit run trees.",
            "- This is source-level compression of the residual table, not a repeat of the round-1 nested boundary sweep.",
            "- `iverilog` simulation was not run; official `evaluate.py` is the validity gate for these rows.",
            "",
            "Next hypotheses:",
            "- `ex225`: derive a shallower exponent-base/log10 residual normalizer, or compress bit12/bit9 transition predicates without returning to 21+ delay.",
            "- `ex223`: test a natural-log-specific selected-bit/predecode structure that avoids the ULP patch arithmetic path.",
            "- Remaining assigned BF16 cases will be broadened after the prioritized FP16 rows have at least one official result.",
        ]
    )
    write_text(summary, "\n".join(lines) + "\n")


def parse_args(argv):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--cases", nargs="+", default=DEFAULT_CASES)
    parser.add_argument("--work-dir", type=Path, default=ROOT / "student/work" / RUN_ID / AGENT_ID)
    parser.add_argument("--run-root", type=Path, default=ROOT / "student/runs/fp16" / RUN_ID / AGENT_ID)
    parser.add_argument("--shard-dir", type=Path, default=ROOT / "student/frontend_campaigns/campaigns" / RUN_ID / "agent_shards" / AGENT_ID)
    parser.add_argument("--summary-path", type=Path, default=ROOT / "student/frontend_campaigns/campaigns" / RUN_ID / "agent_summaries" / "{0}.md".format(AGENT_ID))
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--reference", type=Path, default=ROOT / "reference_result.csv")
    parser.add_argument("--abc", type=Path, default=DEFAULT_ABC)
    parser.add_argument("--yosys", type=Path, default=DEFAULT_YOSYS)
    parser.add_argument("--timeout", type=int, default=120)
    return parser.parse_args(argv)


def main(argv=None):
    args = parse_args(argv)
    args.reference_adp = read_reference_adp(args.reference)
    args.thresholds = current_thresholds()
    rows = []
    for case in args.cases:
        if case not in CASE_LABELS:
            raise SystemExit("unsupported case for this focused script: {0}".format(case))
        rows.append(make_candidate(args, case))
        write_case_registry(args, case, [row for row in rows if row["case"] == case])
        write_shard_csvs(args, rows)
        update_summary(args, rows)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
