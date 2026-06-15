#!/usr/bin/env python3
"""Targeted ex286 symmetry-cofactor mux/share probes."""

import csv
import json
import re
import shutil
import subprocess
import sys
import time
from pathlib import Path


HERE = Path(__file__).resolve()
ROOT = None
for parent in HERE.parents:
    if (parent / "evaluate.py").is_file():
        ROOT = parent
        break
if ROOT is None:
    raise RuntimeError("could not find project root")
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from student.frontends.truth import TruthTable  # noqa: E402
from student.frontends.yosys_synth import SynthError, run_command  # noqa: E402
from student.generators.fp8_ex240_ex244_frontend import script_default  # noqa: E402
from student.generators.unknown_symmetry_cofactor_search import render, verify_outputs  # noqa: E402


RUN_ID = "ex286_frontend_targeted_symcof_mux_probe_20260613_0403"
AGENT_ID = "local-ex286-symcof"
CASE = "ex286"
DOMAIN = "unknown"
CURRENT_FRONTEND_ADP = 20190
REFERENCE_ADP = 2376
CAMPAIGN = ROOT / "student/frontend_campaigns/campaigns" / RUN_ID
RESULTS = CAMPAIGN / "results"
SHARD = CAMPAIGN / "agent_shards" / AGENT_ID
SUMMARY = CAMPAIGN / "agent_summaries" / (AGENT_ID + ".md")
WORK = ROOT / "student/work" / RUN_ID / AGENT_ID / CASE
RUN = ROOT / "student/runs" / DOMAIN / RUN_ID / AGENT_ID / CASE
YOSYS = ROOT / "student/tools/conda-env/bin/yosys"
PAIRS = [(4, 5), (6, 7)]


CANDIDATE_FIELDS = [
    "case",
    "domain",
    "agent_id",
    "candidate_id",
    "hypothesis",
    "variant",
    "method_signature",
    "representation",
    "shared_structure",
    "synth_flow",
    "semantics",
    "output_grouping",
    "verilog_path",
    "aig_path",
    "evaluate_log",
    "verified_truth",
    "equivalent",
    "area",
    "delay",
    "adp",
    "current_frontend_adp",
    "reference_adp",
    "beats_current_frontend",
    "beats_reference",
    "notes",
]
EVAL_FIELDS = [
    "case",
    "domain",
    "agent_id",
    "candidate_id",
    "method_signature",
    "evaluate_status",
    "equivalent",
    "area",
    "delay",
    "adp",
    "verilog_path",
    "aig_path",
    "evaluate_log",
    "notes",
]
FAILED_FIELDS = ["case", "domain", "agent_id", "hypothesis", "method_signature", "status", "evidence_path", "notes"]
STRUCT_FIELDS = ["case", "agent_id", "hypothesis", "representation", "shared_structure", "expected_sharing", "observed_result", "notes"]
SIM_FIELDS = ["case", "domain", "agent_id", "candidate_id", "simulation_status", "sim_log", "notes"]
BEST_FIELDS = [
    "case",
    "domain",
    "agent_id",
    "candidate_id",
    "old_frontend_adp",
    "new_frontend_adp",
    "area",
    "delay",
    "reference_adp",
    "method_signature",
    "verilog_path",
    "aig_path",
    "evaluate_log",
    "notes",
]


def rel(path):
    return str(Path(path).resolve().relative_to(ROOT))


def write_text(path, text):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(text)


def write_csv(path, fields, rows):
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields)
        writer.writeheader()
        for row in rows:
            writer.writerow({field: row.get(field, "") for field in fields})


def parse_eval(text):
    match = re.search(r"^ex286\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s*$", text, re.MULTILINE)
    if not match:
        return "ERROR", "", "", ""
    status, area, delay, adp = match.groups()
    if status != "OK":
        return status, "", "", ""
    return status, area, delay, adp


def run_yosys(script, log_path):
    script_path = log_path.with_suffix(".ys")
    write_text(script_path, script)
    code, log = run_command([str(YOSYS), "-s", str(script_path)], timeout=900)
    write_text(log_path, log)
    if code != 0:
        raise SynthError("Yosys failed with exit code {0}".format(code))


def candidate_specs():
    specs = []
    base_bits = (0, 12, 1, 10)
    for policy in ["f00", "f10"]:
        for mux_style, share in [
            ("case", "group"),
            ("tree", "group"),
            ("onehot", "global"),
            ("case", "global"),
            ("tree", "global"),
        ]:
            specs.append((policy, base_bits, mux_style, share, "muxshare"))
    for bits in [
        (0, 1, 10, 12),
        (0, 12, 10, 1),
        (12, 0, 1, 10),
        (0, 12, 1, 11),
        (0, 12, 2, 10),
        (0, 2, 1, 10),
    ]:
        specs.append(("f00", bits, "onehot", "group", "selector"))
    return specs


def variant_name(policy, bits, mux_style, share):
    return "{0}_bits_{1}_{2}_{3}".format(policy, "_".join(str(bit) for bit in bits), mux_style, share)


def load_outputs():
    table = TruthTable(ROOT / "benchmarks/ex286.truth")
    return table, list(table.iter_outputs())


def run_candidate(table, outputs, spec):
    policy, bits, mux_style, share, family = spec
    variant = variant_name(policy, bits, mux_style, share)
    candidate_id = "ex286_r25_symcof_{0}_abc_g_aig".format(variant)
    verilog_path = WORK / "verilog" / (candidate_id + ".v")
    aig_path = WORK / "aigs" / (candidate_id + ".aig")
    yosys_log = WORK / "logs" / (candidate_id + ".yosys.log")
    eval_dir = WORK / "eval_outputs" / candidate_id
    eval_aig = eval_dir / "ex286.aig"
    eval_log = WORK / "logs" / (candidate_id + ".evaluate.py.log")
    note_path = WORK / "notes" / (candidate_id + ".md")
    method_signature = (
        "ex286|hamming_weight_preserving_lossy_routing_normalizer|symcof_outer_bitset_{bits}_{mux}_{share}|"
        "known_pair_symmetry_key_and_class_mux_bdd_share|yosys_abc_g_aig_official_evaluate|"
        "exact_popcount_preserving_unknown|full_word_class_mux"
    ).format(bits="_".join(str(bit) for bit in bits), mux=mux_style, share=share)

    status = "ERROR"
    area = delay = adp = ""
    equivalent = "0"
    verified = "0"
    notes = ""
    start = time.time()
    try:
        verilog, items, model = render(
            outputs,
            candidate_id,
            table.input_width,
            table.output_width,
            PAIRS,
            "interleave",
            policy,
            len(bits),
            explicit_outer_bits=bits,
            mux_style=mux_style,
            bdd_share_style=share,
        )
        ok, verify_note = verify_outputs(outputs, model)
        verified = "1" if ok else "0"
        notes = verify_note + "; " + items
        write_text(verilog_path, verilog)
        if not ok:
            status = "MODEL_NOT_EXACT"
        else:
            aig_path.parent.mkdir(parents=True, exist_ok=True)
            run_yosys(script_default(verilog_path, candidate_id, aig_path, "aig", False), yosys_log)
            eval_dir.mkdir(parents=True, exist_ok=True)
            shutil.copyfile(str(aig_path), str(eval_aig))
            result = subprocess.run(
                [
                    sys.executable,
                    str(ROOT / "evaluate.py"),
                    "--case",
                    "ex286",
                    "--output",
                    str(eval_dir),
                    "--timeout",
                    "180",
                ],
                cwd=str(ROOT),
                stdout=subprocess.PIPE,
                stderr=subprocess.STDOUT,
                universal_newlines=True,
                timeout=240,
            )
            write_text(eval_log, result.stdout)
            status, area, delay, adp = parse_eval(result.stdout)
            equivalent = "1" if status == "OK" else "0"
    except Exception as exc:
        write_text(eval_log, str(exc) + "\n")
        notes = str(exc).splitlines()[0][:240]

    runtime = time.time() - start
    write_text(
        note_path,
        "# {0}\n\nvariant: `{1}`\n\nmethod_signature: `{2}`\n\nstatus: `{3}`\n\nruntime_sec: `{4:.3f}`\n\nverilog: `{5}`\n\naig: `{6}`\n\nevaluate_log: `{7}`\n\nnotes: {8}\n".format(
            candidate_id,
            variant,
            method_signature,
            status,
            runtime,
            rel(verilog_path),
            rel(aig_path) if aig_path.is_file() else "",
            rel(eval_log),
            notes,
        ),
    )
    candidate_row = {
        "case": CASE,
        "domain": DOMAIN,
        "agent_id": AGENT_ID,
        "candidate_id": candidate_id,
        "hypothesis": "hamming_weight_preserving_lossy_routing_normalizer",
        "variant": variant,
        "method_signature": method_signature,
        "representation": "symmetry-cofactor class mux with explicit outer bitset and {0}/{1} source structure".format(mux_style, share),
        "shared_structure": "canonical key for exact input swap pairs (4,5),(6,7); shared BDD cofactors; class mux over outer bitset",
        "synth_flow": "yosys abc -g aig plus official evaluate.py",
        "semantics": "exact_popcount_preserving_unknown_ex286",
        "output_grouping": "full_word_class_mux",
        "verilog_path": rel(verilog_path),
        "aig_path": rel(aig_path) if aig_path.is_file() else "",
        "evaluate_log": rel(eval_log),
        "verified_truth": verified,
        "equivalent": equivalent,
        "area": area,
        "delay": delay,
        "adp": adp,
        "current_frontend_adp": str(CURRENT_FRONTEND_ADP),
        "reference_adp": str(REFERENCE_ADP),
        "beats_current_frontend": "1" if adp and int(adp) < CURRENT_FRONTEND_ADP else "0",
        "beats_reference": "1" if adp and int(adp) < REFERENCE_ADP else "0",
        "notes": notes,
    }
    eval_row = {
        "case": CASE,
        "domain": DOMAIN,
        "agent_id": AGENT_ID,
        "candidate_id": candidate_id,
        "method_signature": method_signature,
        "evaluate_status": status,
        "equivalent": equivalent,
        "area": area,
        "delay": delay,
        "adp": adp,
        "verilog_path": rel(verilog_path),
        "aig_path": rel(aig_path) if aig_path.is_file() else "",
        "evaluate_log": rel(eval_log),
        "notes": notes,
    }
    failed_row = None
    if equivalent != "1" or not adp or int(adp) >= CURRENT_FRONTEND_ADP:
        failed_row = {
            "case": CASE,
            "domain": DOMAIN,
            "agent_id": AGENT_ID,
            "hypothesis": "hamming_weight_preserving_lossy_routing_normalizer",
            "method_signature": method_signature,
            "status": "EQUIVALENT_BUT_NO_FRONTEND_IMPROVEMENT" if equivalent == "1" else status,
            "evidence_path": rel(note_path),
            "notes": notes,
        }
    best_row = None
    if adp and int(adp) < CURRENT_FRONTEND_ADP:
        best_row = {
            "case": CASE,
            "domain": DOMAIN,
            "agent_id": AGENT_ID,
            "candidate_id": candidate_id,
            "old_frontend_adp": str(CURRENT_FRONTEND_ADP),
            "new_frontend_adp": adp,
            "area": area,
            "delay": delay,
            "reference_adp": str(REFERENCE_ADP),
            "method_signature": method_signature,
            "verilog_path": rel(verilog_path),
            "aig_path": rel(aig_path),
            "evaluate_log": rel(eval_log),
            "notes": notes,
        }
    print("ex286 {0} status={1} area={2} delay={3} adp={4}".format(candidate_id, status, area or "-", delay or "-", adp or "-"))
    sys.stdout.flush()
    return candidate_row, eval_row, failed_row, best_row, family


def main():
    for path in [RESULTS, SHARD, SUMMARY.parent, WORK, RUN / "results"]:
        path.mkdir(parents=True, exist_ok=True)
    table, outputs = load_outputs()
    candidate_rows = []
    eval_rows = []
    failed_rows = []
    best_rows = []
    sim_rows = []
    struct_rows = []
    for spec in candidate_specs():
        cand, ev, failed, best, family = run_candidate(table, outputs, spec)
        candidate_rows.append(cand)
        eval_rows.append(ev)
        if failed:
            failed_rows.append(failed)
        if best:
            best_rows.append(best)
        sim_rows.append(
            {
                "case": CASE,
                "domain": DOMAIN,
                "agent_id": AGENT_ID,
                "candidate_id": cand["candidate_id"],
                "simulation_status": "not_run_debug_only",
                "sim_log": "",
                "notes": "official evaluate.py was run for exact candidates",
            }
        )
        struct_rows.append(
            {
                "case": CASE,
                "agent_id": AGENT_ID,
                "hypothesis": cand["hypothesis"],
                "representation": cand["representation"],
                "shared_structure": cand["shared_structure"],
                "expected_sharing": "reduce current class mux delay or cofactor duplication without changing exact pair-symmetry key",
                "observed_result": "{0}/{1}/{2}".format(cand["area"], cand["delay"], cand["adp"]) if cand["adp"] else cand["notes"][:120],
                "notes": cand["method_signature"],
            }
        )
    write_csv(RESULTS / "candidates.csv", CANDIDATE_FIELDS, candidate_rows)
    write_csv(RESULTS / "evaluation_results.csv", EVAL_FIELDS, eval_rows)
    write_csv(RESULTS / "failed_hypotheses.csv", FAILED_FIELDS, failed_rows)
    write_csv(RESULTS / "best_improvements.csv", BEST_FIELDS, best_rows)
    write_csv(RESULTS / "simulation_results.csv", SIM_FIELDS, sim_rows)
    write_csv(RESULTS / "shared_structure_report.csv", STRUCT_FIELDS, struct_rows)
    write_csv(SHARD / "candidates.csv", CANDIDATE_FIELDS, candidate_rows)
    write_csv(SHARD / "evaluation_results.csv", EVAL_FIELDS, eval_rows)
    write_csv(SHARD / "failed_hypotheses.csv", FAILED_FIELDS, failed_rows)
    write_csv(SHARD / "best_improvements.csv", BEST_FIELDS, best_rows)
    write_csv(SHARD / "simulation_results.csv", SIM_FIELDS, sim_rows)
    write_csv(SHARD / "shared_structure_report.csv", STRUCT_FIELDS, struct_rows)
    write_text(
        CAMPAIGN / "MANIFEST.md",
        "# {0}\n\nRun ID: `{0}`\n\nPurpose: targeted ex286 symmetry-cofactor mux/share and outer-bitset probes.\n\nArtifacts:\n- Work directory: `{1}`\n- Results: `{2}`\n\nNo `student/seeds` curation is performed.\n".format(RUN_ID, rel(WORK), rel(RESULTS)),
    )
    write_text(
        CAMPAIGN / "task_assignments.md",
        "# Task Assignments\n\n| agent_id | cases | status | notes |\n|---|---|---|---|\n| `{0}` | `ex286` | completed | targeted symcof mux/share selector probes |\n".format(AGENT_ID),
    )
    eq_rows = [row for row in candidate_rows if row["equivalent"] == "1" and row["adp"]]
    best_line = "no equivalent candidates"
    if eq_rows:
        best = min(eq_rows, key=lambda row: int(row["adp"]))
        best_line = "`{0}` `{1}/{2}/{3}`".format(best["candidate_id"], best["area"], best["delay"], best["adp"])
    write_text(
        SUMMARY,
        "# {0}\n\nRun ID: `{1}`\n\nOfficial equivalent candidates: `{2}`.\nFrontend improvements: `{3}`.\nBest observed: {4} vs frontend `{5}` and reference `{6}`.\n".format(
            AGENT_ID, RUN_ID, sum(1 for row in candidate_rows if row["equivalent"] == "1"), len(best_rows), best_line, CURRENT_FRONTEND_ADP, REFERENCE_ADP
        ),
    )
    write_text(
        WORK / "manifest.json",
        json.dumps(
            {
                "run_id": RUN_ID,
                "agent_id": AGENT_ID,
                "case": CASE,
                "rows": len(candidate_rows),
                "equivalent": sum(1 for row in candidate_rows if row["equivalent"] == "1"),
                "best_improvements": len(best_rows),
            },
            indent=2,
            sort_keys=True,
        )
        + "\n",
    )
    print("wrote {0}".format(rel(RESULTS / "candidates.csv")))
    print("equivalent {0}/{1}".format(sum(1 for row in candidate_rows if row["equivalent"] == "1"), len(candidate_rows)))
    print("best_improvements {0}".format(len(best_rows)))


if __name__ == "__main__":
    main()
