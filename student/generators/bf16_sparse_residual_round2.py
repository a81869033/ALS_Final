#!/usr/bin/env python3
"""Round-2 sparse residual BF16 unary candidates for unary-agent."""

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
from student.generators.fp16_ex232_square_deep import const_word
from student.generators.fp16_semantic_search import rel_path, write_csv
from student.scripts.yosys_synthflow_variants import script_abc_gate


RUN_ID = "ex200_ex299_frontend_refgap_round2_20260612_1512"
AGENT_ID = "unary-agent"
DEFAULT_CASES = ["ex200", "ex204", "ex205"]
DEFAULT_ABC = ROOT / "student" / "abc"
DEFAULT_YOSYS = ROOT / "student" / "tools" / "conda-env" / "bin" / "yosys"
ADP_RE = re.compile(r"^\s*(ex\d{3})\s+OK\s+(\d+)\s+(\d+)\s+(\d+)\s*$", re.M)


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


CASE_INFO = {
    "ex200": {
        "domain": "bf16",
        "hypothesis": "bf16_exp_sparse_residual_compression",
        "frontend": 59232,
        "overall": 52740,
        "reference": 40052,
        "gate": "aig",
    },
    "ex204": {
        "domain": "bf16",
        "hypothesis": "bf16_log2_sparse_residual_compression",
        "frontend": 25670,
        "overall": 21150,
        "reference": 15180,
        "gate": "gates",
    },
    "ex205": {
        "domain": "bf16",
        "hypothesis": "bf16_log10_sparse_residual_compression",
        "frontend": 71104,
        "overall": 64944,
        "reference": 47128,
        "gate": "aig",
    },
}


def write_text(path, text):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(text)


def mode_value(values):
    counts = Counter(values)
    return min(counts, key=lambda value: (-counts[value], value))


def synthesize_with_script(script, yosys, timeout, log_path):
    log_path.parent.mkdir(parents=True, exist_ok=True)
    script_path = log_path.with_suffix(".ys")
    write_text(script_path, script)
    code, log = run_command([str(yosys), "-s", str(script_path)], timeout=timeout)
    write_text(log_path, log)
    if code != 0:
        raise SynthError("Yosys failed with exit code {0}".format(code))


def render_sparse_bf16(case, table, module, hi_bits):
    lo_bits = 7 - hi_bits
    lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [15:0] out;",
        "  wire [8:0] sign_exp = in[15:7];",
        "  wire [6:0] mant = in[6:0];",
        "  wire [{0}:0] mant_hi = mant[6:{1}];".format(hi_bits - 1, lo_bits),
        "  wire [{0}:0] mant_lo = mant[{0}:0];".format(lo_bits - 1),
        "  reg [15:0] out_r;",
        "  always @* begin",
        "    out_r = 16'h0000;",
        "    case (sign_exp)",
    ]
    const_groups = 0
    variable_groups = 0
    dense_entries = 0
    sparse_overrides = 0
    hi_groups = 0
    for sign_exp in range(512):
        values = [table.get_output((sign_exp << 7) | mant) for mant in range(128)]
        if len(set(values)) == 1:
            const_groups += 1
            if values[0] != 0:
                lines.append("      {0}: out_r = {1};".format(const_word(9, sign_exp), const_word(16, values[0])))
            continue
        variable_groups += 1
        lines.append("      {0}: begin".format(const_word(9, sign_exp)))
        lines.append("        case (mant_hi)")
        for hi in range(1 << hi_bits):
            group_values = [values[(hi << lo_bits) | lo] for lo in range(1 << lo_bits)]
            default = mode_value(group_values)
            differing = [(lo, value) for lo, value in enumerate(group_values) if value != default]
            hi_groups += 1
            dense_entries += len(group_values)
            if not differing:
                lines.append("          {0}: out_r = {1};".format(const_word(hi_bits, hi), const_word(16, default)))
                continue
            lines.append("          {0}: begin".format(const_word(hi_bits, hi)))
            lines.append("            out_r = {0};".format(const_word(16, default)))
            lines.append("            case (mant_lo)")
            for lo, value in differing:
                sparse_overrides += 1
                lines.append("              {0}: out_r = {1};".format(const_word(lo_bits, lo), const_word(16, value)))
            lines.extend(["              default: begin end", "            endcase", "          end"])
        lines.extend(["          default: begin end", "        endcase", "      end"])
    lines.extend(["      default: begin end", "    endcase", "  end", "  assign out = out_r;", "endmodule", ""])
    note = (
        "bf16 sparse sign_exp residual table; hi_bits={0}; lo_bits={1}; "
        "const_groups={2}; variable_groups={3}; hi_groups={4}; dense_entries={5}; sparse_overrides={6}"
    ).format(hi_bits, lo_bits, const_groups, variable_groups, hi_groups, dense_entries, sparse_overrides)
    return "\n".join(lines), note


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
        return "OK", match.group(2), match.group(3), match.group(4), rel_path(log_path), time.time() - start
    return "FAIL", "", "", "", rel_path(log_path), time.time() - start


def merge_write_csv(path, fieldnames, rows, key_fields=("case", "candidate_id")):
    merged = {}
    if path.exists():
        with path.open() as handle:
            reader = csv.DictReader(handle)
            for row in reader:
                key = tuple(row.get(field, "") for field in key_fields)
                merged[key] = {field: row.get(field, "") for field in fieldnames}
    for row in rows:
        key = tuple(row.get(field, "") for field in key_fields)
        merged[key] = {field: row.get(field, "") for field in fieldnames}
    write_csv(path, fieldnames, list(merged.values()))


def make_candidate(args, case):
    info = CASE_INFO[case]
    hi_bits = 3
    gate = info["gate"]
    flow = "yosys_abc_g_{0}".format(gate)
    variant = "sparse_signexp_hilo{0}".format(hi_bits)
    table = TruthTable(args.benchmarks / "{0}.truth".format(case), input_order="abc_xf")
    module = "{0}_bf16_sparse_residual_hilo{1}".format(case, hi_bits)
    text, note = render_sparse_bf16(case, table, module, hi_bits)
    work_case = args.work_dir / case
    verilog_path = work_case / "verilog" / "{0}.v".format(module)
    write_text(verilog_path, text)
    candidate_id = "{0}_bf16_sparse_residual_hilo{1}_abc_g_{2}".format(case, hi_bits, gate)
    aig_path = work_case / "aigs" / "{0}.aig".format(candidate_id)
    yosys_log = work_case / "logs" / "{0}.yosys.log".format(candidate_id)
    row = {
        "case": case,
        "candidate_id": candidate_id,
        "method_signature": "{0}|{1}|sparse_signexp_hilo{2}_residual_defaults|shared_sign_exp_decode_per_hi_sparse_residual|{3}|abc_xf_official_evaluate|full_word_sparse_signexp_hilo".format(case, info["hypothesis"], hi_bits, flow),
        "hypothesis": info["hypothesis"],
        "representation": "sparse_signexp_hilo{0}_residual_defaults".format(hi_bits),
        "sharing": "shared_sign_exp_decode_per_hi_sparse_residual",
        "synth_flow": flow,
        "semantics": "abc_xf_official_evaluate",
        "output_grouping": "full_word_sparse_signexp_hilo",
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
        "reference_adp": str(info["reference"]),
        "current_frontend_adp": str(info["frontend"]),
        "current_overall_adp": str(info["overall"]),
        "beats_frontend": "0",
        "beats_overall": "0",
        "beats_reference": "0",
        "evaluate_log": "",
        "runtime_sec": "0.000",
        "notes": note,
    }
    start = time.time()
    try:
        aig_path.parent.mkdir(parents=True, exist_ok=True)
        script = script_abc_gate(verilog_path, module, aig_path, gate)
        synthesize_with_script(script, args.yosys, args.timeout, yosys_log)
        row["synthesized"] = "1"
        status, area, delay, adp, eval_log, eval_sec = run_official_evaluate(
            case,
            candidate_id,
            aig_path,
            work_case / "official_eval" / candidate_id,
            args.abc,
            args.benchmarks,
            args.timeout,
        )
        row["equivalent"] = "1" if status == "OK" else "0"
        row["area"] = area
        row["delay"] = delay
        row["adp"] = adp
        row["evaluate_log"] = eval_log
        if adp:
            value = int(adp)
            row["beats_frontend"] = "1" if value < info["frontend"] else "0"
            row["beats_overall"] = "1" if value < info["overall"] else "0"
            row["beats_reference"] = "1" if value < info["reference"] else "0"
    except (OSError, RuntimeError, SynthError, subprocess.TimeoutExpired) as exc:
        row["notes"] += "; {0}: {1}".format(type(exc).__name__, str(exc)[:500])
    row["runtime_sec"] = "{0:.3f}".format(time.time() - start)
    print("{0} {1} eq={2} area={3} delay={4} adp={5}".format(case, candidate_id, row["equivalent"], row["area"], row["delay"], row["adp"]))
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
        "Purpose: round-2 BF16 sparse sign/exponent residual source-level candidate.",
        "",
        "Artifacts:",
        "- Work directory: `{0}`".format(rel_path(args.work_dir / case)),
        "- Results: `{0}`".format(rel_path(results_dir)),
        "",
        "Best result:",
    ]
    if best:
        row = best[0]
        manifest.append("- `{0}` `{1}/{2}/{3}` equivalent by official `evaluate.py`.".format(row["candidate_id"], row["area"], row["delay"], row["adp"]))
    else:
        manifest.append("- No equivalent synthesized candidate.")
    manifest.append("")
    write_text(run_dir / "MANIFEST.md", "\n".join(manifest))


def write_shard(args, rows):
    shard = args.shard_dir
    shard.mkdir(parents=True, exist_ok=True)
    eq_rows = [row for row in rows if row["equivalent"] == "1"]
    fail_rows = [row for row in rows if row["equivalent"] != "1"]
    improvements = [row for row in eq_rows if row["beats_frontend"] == "1"]
    merge_write_csv(shard / "candidates.csv", CANDIDATE_FIELDS, eq_rows)
    merge_write_csv(shard / "failed_hypotheses.csv", CANDIDATE_FIELDS, fail_rows)
    merge_write_csv(shard / "best_improvements.csv", CANDIDATE_FIELDS, improvements)
    merge_write_csv(shard / "proposed_frontend_best_updates.csv", CANDIDATE_FIELDS, improvements)
    eval_fields = ["case", "candidate_id", "equivalent", "area", "delay", "adp", "reference_adp", "current_frontend_adp", "current_overall_adp", "beats_frontend", "beats_overall", "beats_reference", "evaluate_log", "notes"]
    merge_write_csv(shard / "evaluation_results.csv", eval_fields, [{k: row[k] for k in eval_fields} for row in rows])
    sim_fields = ["case", "candidate_id", "simulation_pass", "notes"]
    merge_write_csv(shard / "simulation_results.csv", sim_fields, [{k: row[k] for k in sim_fields} for row in rows])
    structure_fields = ["case", "candidate_id", "method_signature", "hypothesis", "representation", "sharing", "output_grouping", "notes"]
    merge_write_csv(shard / "shared_structure_report.csv", structure_fields, [{k: row[k] for k in structure_fields} for row in rows])
    hyp_fields = ["case", "hypothesis", "representation_family", "sharing_strategy", "source", "confidence", "novelty", "expected_gain", "status", "reason", "created_by", "created_at"]
    hyp_rows = []
    for row in rows:
        status = "tested_promising" if row["beats_frontend"] == "1" else ("tested_equivalent_nonwinning" if row["equivalent"] == "1" else "tested_bad")
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
            "reason": "official evaluate.py ADP={0}; current_frontend={1}; reference={2}".format(row["adp"], row["current_frontend_adp"], row["reference_adp"]),
            "created_by": AGENT_ID,
            "created_at": "2026-06-12",
        })
    merge_write_csv(shard / "proposed_hypothesis_updates.csv", hyp_fields, hyp_rows)
    search_fields = ["case", "domain", "status", "assigned_agent", "current_focus", "next_hypothesis", "next_representation", "budget", "last_update", "priority", "current_best_adp", "reference_adp", "ratio_to_reference", "recommendation"]
    search_rows = []
    for row in rows:
        info = CASE_INFO[row["case"]]
        search_rows.append({
            "case": row["case"],
            "domain": "bf16",
            "status": "round2_evaluated_gap_remains",
            "assigned_agent": AGENT_ID,
            "current_focus": "BF16 sparse residual source-level compression evaluated by official evaluate.py",
            "next_hypothesis": "derive smaller semantic residual formulas instead of sparse truth-table residuals",
            "next_representation": "shared exponent-base normalizer or selected-bit residual predicate",
            "budget": "continue",
            "last_update": "2026-06-12 unary-agent shard",
            "priority": "frontend_high",
            "current_best_adp": row["current_overall_adp"],
            "reference_adp": row["reference_adp"],
            "ratio_to_reference": "{0:.6f}".format(info["overall"] / info["reference"]),
            "recommendation": "continue source-level frontend search; sparse residual candidate did not close reference gap",
        })
    merge_write_csv(shard / "proposed_search_state_updates.csv", search_fields, search_rows)
    manual_fields = ["case", "method_signature", "outcome", "failure_reason", "reuse_policy", "next_action", "author", "date", "notes"]
    manual_rows = []
    for row in rows:
        if row["beats_frontend"] == "1":
            outcome = "frontend_improvement_gap_remains"
            failure = "does not beat reference"
            reuse = "worth_extending_with_new_structure"
        elif row["equivalent"] == "1":
            outcome = "equivalent_but_bad_qor"
            failure = "official equivalent but did not beat current frontend"
            reuse = "do_not_repeat_as_is"
        else:
            outcome = "not_equivalent_or_synthesis_failed"
            failure = "synthesis or official evaluate.py failed"
            reuse = "do_not_repeat_as_is"
        manual_rows.append({
            "case": row["case"],
            "method_signature": row["method_signature"],
            "outcome": outcome,
            "failure_reason": failure,
            "reuse_policy": reuse,
            "next_action": "Only repeat with a materially different residual representation or semantic formula.",
            "author": AGENT_ID,
            "date": "2026-06-12",
            "notes": row["notes"][:500],
        })
    merge_write_csv(shard / "proposed_manual_judgments.csv", manual_fields, manual_rows)


def read_rows(path):
    if not path.exists():
        return []
    with path.open() as handle:
        return list(csv.DictReader(handle))


def update_summary(args):
    eval_rows = read_rows(args.shard_dir / "evaluation_results.csv")
    lines = [
        "# unary-agent Progress",
        "",
        "Run ID: `{0}`".format(RUN_ID),
        "",
        "Assigned cases: `ex200`, `ex204`, `ex205`, `ex223`, `ex224`, `ex225`",
        "",
        "## Evaluated Round-2 Rows",
        "",
        "| case | candidate | official result | vs frontend | vs overall | vs reference |",
        "|---|---|---:|---:|---:|---:|",
    ]
    for row in sorted(eval_rows, key=lambda item: (item.get("case", ""), item.get("candidate_id", ""))):
        result = "not equivalent"
        if row.get("equivalent") == "1":
            result = "{0}/{1}/{2}".format(row.get("area"), row.get("delay"), row.get("adp"))
        lines.append("| `{0}` | `{1}` | {2} | {3} | {4} | {5} |".format(
            row.get("case"),
            row.get("candidate_id"),
            result,
            "beat" if row.get("beats_frontend") == "1" else "no",
            "beat" if row.get("beats_overall") == "1" else "no",
            "beat" if row.get("beats_reference") == "1" else "no",
        ))
    lines.extend(
        [
            "",
            "## Notes",
            "",
            "- FP16 prioritized pass used sparse per-hi residual defaults plus shared special sign/exp decode and high-bit run trees.",
            "- BF16 pass used sparse sign/exponent residual defaults over BF16 mantissa hi/lo groups.",
            "- `iverilog` simulation was not run; official `evaluate.py` is the validity gate for these rows.",
            "",
            "Next hypotheses:",
            "- `ex225`: derive a shallower exponent-base/log10 residual normalizer, or compress bit12/bit9 transition predicates without returning to 21+ delay.",
            "- `ex223`: test a natural-log-specific selected-bit/predecode structure that avoids the ULP patch arithmetic path.",
            "- `ex200`/`ex204`/`ex205`: replace sparse residual tables with smaller semantic residual formulas or selected-bit predicates that preserve delay.",
        ]
    )
    write_text(args.summary_path, "\n".join(lines) + "\n")


def parse_args(argv):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--cases", nargs="+", default=DEFAULT_CASES)
    parser.add_argument("--work-dir", type=Path, default=ROOT / "student/work" / RUN_ID / AGENT_ID)
    parser.add_argument("--run-root", type=Path, default=ROOT / "student/runs/bf16" / RUN_ID / AGENT_ID)
    parser.add_argument("--shard-dir", type=Path, default=ROOT / "student/frontend_campaigns/campaigns" / RUN_ID / "agent_shards" / AGENT_ID)
    parser.add_argument("--summary-path", type=Path, default=ROOT / "student/frontend_campaigns/campaigns" / RUN_ID / "agent_summaries" / "{0}.md".format(AGENT_ID))
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--abc", type=Path, default=DEFAULT_ABC)
    parser.add_argument("--yosys", type=Path, default=DEFAULT_YOSYS)
    parser.add_argument("--timeout", type=int, default=120)
    return parser.parse_args(argv)


def main(argv=None):
    args = parse_args(argv)
    rows = []
    for case in args.cases:
        if case not in CASE_INFO:
            raise SystemExit("unsupported case for this focused script: {0}".format(case))
        row = make_candidate(args, case)
        rows.append(row)
        write_case_registry(args, case, [row])
        write_shard(args, [row])
        update_summary(args)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
