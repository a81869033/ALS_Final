#!/usr/bin/env python3
"""Targeted ex286 symcof inner-BDD order probes."""

import csv
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


RUN_ID = "ex286_frontend_inner_order_probe_20260613_0424"
AGENT_ID = "local-ex286-innerorder"
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
OUTER_BITS = (0, 12, 1, 10)


CANDIDATE_FIELDS = [
    "case", "domain", "agent_id", "candidate_id", "hypothesis", "variant",
    "method_signature", "representation", "shared_structure", "synth_flow",
    "semantics", "output_grouping", "verilog_path", "aig_path",
    "evaluate_log", "verified_truth", "equivalent", "area", "delay", "adp",
    "current_frontend_adp", "reference_adp", "beats_current_frontend",
    "beats_reference", "notes",
]
EVAL_FIELDS = [
    "case", "domain", "agent_id", "candidate_id", "method_signature",
    "evaluate_status", "equivalent", "area", "delay", "adp",
    "verilog_path", "aig_path", "evaluate_log", "notes",
]
FAILED_FIELDS = [
    "case", "domain", "agent_id", "hypothesis", "method_signature",
    "status", "evidence_path", "notes",
]
STRUCT_FIELDS = [
    "case", "agent_id", "hypothesis", "representation", "shared_structure",
    "expected_sharing", "observed_result", "notes",
]
SIM_FIELDS = ["case", "domain", "agent_id", "candidate_id", "simulation_status", "sim_log", "notes"]
BEST_FIELDS = [
    "case", "domain", "agent_id", "candidate_id", "hypothesis",
    "representation", "shared_structure", "old_frontend_adp", "new_frontend_adp",
    "adp", "area", "delay", "reference_adp", "method_signature",
    "verilog_path", "aig_path", "evaluate_log", "equivalent", "notes",
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


def full_order(inner_order):
    used = set(inner_order)
    tail = [bit for bit in range(13) if bit not in used]
    return tuple(inner_order) + tuple(tail)


def order_name(order):
    return "bits_" + "_".join(str(bit) for bit in order)


def candidate_specs():
    return [
        ("outside_in", (11, 2, 9, 3, 8, 4, 7, 5, 6), "onehot"),
        ("outside_in", (11, 2, 9, 3, 8, 4, 7, 5, 6), "case"),
        ("sym_last", (2, 3, 8, 9, 11, 4, 5, 6, 7), "onehot"),
        ("sym_last", (2, 3, 8, 9, 11, 4, 5, 6, 7), "case"),
    ]


def load_outputs():
    table = TruthTable(ROOT / "benchmarks/ex286.truth")
    return table, list(table.iter_outputs())


def run_candidate(table, outputs, spec):
    order_label, inner_order, mux_style = spec
    order = full_order(inner_order)
    variant = "{0}_inner_{1}_{2}".format("f00_bits_0_12_1_10", order_label, mux_style)
    candidate_id = "ex286_r26_symcof_{0}_abc_g_aig".format(variant)
    verilog_path = WORK / "verilog" / (candidate_id + ".v")
    aig_path = WORK / "aigs" / (candidate_id + ".aig")
    yosys_log = WORK / "logs" / (candidate_id + ".yosys.log")
    eval_dir = WORK / "eval_outputs" / candidate_id
    eval_aig = eval_dir / "ex286.aig"
    eval_log = WORK / "logs" / (candidate_id + ".evaluate.py.log")
    note_path = WORK / "notes" / (candidate_id + ".md")
    method_signature = (
        "ex286|hamming_weight_preserving_lossy_routing_normalizer|symcof_outer_0_12_1_10_inner_order_{order}_{mux}|"
        "known_pair_symmetry_key_group_bdd_reordered_inner_vars|yosys_abc_g_aig_official_evaluate|"
        "exact_popcount_preserving_unknown|full_word_class_mux"
    ).format(order=order_label, mux=mux_style)

    status = "ERROR"
    area = delay = adp = ""
    equivalent = "0"
    verified = "0"
    notes = ""
    try:
        verilog, items, model = render(
            outputs,
            candidate_id,
            table.input_width,
            table.output_width,
            PAIRS,
            order_name(order),
            "f00",
            len(OUTER_BITS),
            explicit_outer_bits=OUTER_BITS,
            mux_style=mux_style,
            bdd_share_style="group",
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
                    CASE,
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

    observed = "{0}/{1}/{2}".format(area, delay, adp) if adp else status
    write_text(
        note_path,
        "# {0}\n\nvariant: `{1}`\n\nmethod_signature: `{2}`\n\nstatus: `{3}`\n\nverilog: `{4}`\n\naig: `{5}`\n\nevaluate_log: `{6}`\n\nnotes: {7}\n".format(
            candidate_id, variant, method_signature, status,
            rel(verilog_path), rel(aig_path), rel(eval_log), notes,
        ),
    )
    row = {
        "case": CASE,
        "domain": DOMAIN,
        "agent_id": AGENT_ID,
        "candidate_id": candidate_id,
        "hypothesis": "hamming_weight_preserving_lossy_routing_normalizer",
        "variant": variant,
        "method_signature": method_signature,
        "representation": "explicit outer-bit symcof with reordered inner BDD variables",
        "shared_structure": "known input pair symmetries (4,5),(6,7); fixed outer bits 0:12:1:10; group-shared class BDDs with inner order {0}".format(":".join(str(bit) for bit in inner_order)),
        "synth_flow": "yosys abc -g aig plus official evaluate.py",
        "semantics": "exact_popcount_preserving_unknown_ex286",
        "output_grouping": "full_word_class_mux",
        "verilog_path": rel(verilog_path),
        "aig_path": rel(aig_path),
        "evaluate_log": rel(eval_log),
        "verified_truth": verified,
        "equivalent": equivalent,
        "area": area,
        "delay": delay,
        "adp": adp,
        "current_frontend_adp": str(CURRENT_FRONTEND_ADP),
        "reference_adp": str(REFERENCE_ADP),
        "beats_current_frontend": "1" if equivalent == "1" and adp and int(adp) < CURRENT_FRONTEND_ADP else "0",
        "beats_reference": "1" if equivalent == "1" and adp and int(adp) <= REFERENCE_ADP else "0",
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
        "aig_path": rel(aig_path),
        "evaluate_log": rel(eval_log),
        "notes": notes,
    }
    struct_row = {
        "case": CASE,
        "agent_id": AGENT_ID,
        "hypothesis": row["hypothesis"],
        "representation": row["representation"],
        "shared_structure": row["shared_structure"],
        "expected_sharing": "lower total group BDD nodes than current interleave order while preserving exact class mux semantics",
        "observed_result": observed,
        "notes": method_signature,
    }
    failed_row = None
    if equivalent != "1":
        status_text = "NON_EQUIVALENT_OR_SYNTH_FAILED"
    elif adp and int(adp) >= CURRENT_FRONTEND_ADP:
        status_text = "EQUIVALENT_BUT_NO_FRONTEND_IMPROVEMENT"
    else:
        status_text = ""
    if status_text:
        failed_row = {
            "case": CASE,
            "domain": DOMAIN,
            "agent_id": AGENT_ID,
            "hypothesis": row["hypothesis"],
            "method_signature": method_signature,
            "status": status_text,
            "evidence_path": rel(note_path),
            "notes": notes,
        }
    print("{0} status={1} area={2} delay={3} adp={4}".format(candidate_id, status, area, delay, adp))
    return row, eval_row, struct_row, failed_row


def write_run_records(best):
    results = RUN / "results"
    write_text(
        RUN / "MANIFEST.md",
        "# ex286 inner-order probe\n\nRun ID: `{0}`\nAgent: `{1}`\nCase: `{2}`\n\nNo `student/seeds` files were created or updated.\n".format(RUN_ID, AGENT_ID, CASE),
    )
    if best:
        write_csv(results / "summary.csv", CANDIDATE_FIELDS, [best])
        write_csv(results / "best.csv", CANDIDATE_FIELDS, [best])
    else:
        write_csv(results / "summary.csv", CANDIDATE_FIELDS, [])
        write_csv(results / "best.csv", CANDIDATE_FIELDS, [])


def main():
    start = time.time()
    table, outputs = load_outputs()
    rows = []
    eval_rows = []
    struct_rows = []
    failed_rows = []
    for spec in candidate_specs():
        row, eval_row, struct_row, failed_row = run_candidate(table, outputs, spec)
        rows.append(row)
        eval_rows.append(eval_row)
        struct_rows.append(struct_row)
        if failed_row:
            failed_rows.append(failed_row)

    equivalent = [row for row in rows if row["equivalent"] == "1" and row["adp"]]
    best = min(equivalent, key=lambda row: int(row["adp"])) if equivalent else None
    best_rows = []
    if best and int(best["adp"]) < CURRENT_FRONTEND_ADP:
        best_rows.append({
            "case": CASE,
            "domain": DOMAIN,
            "agent_id": AGENT_ID,
            "candidate_id": best["candidate_id"],
            "hypothesis": best["hypothesis"],
            "representation": best["representation"],
            "shared_structure": best["shared_structure"],
            "old_frontend_adp": str(CURRENT_FRONTEND_ADP),
            "new_frontend_adp": best["adp"],
            "adp": best["adp"],
            "area": best["area"],
            "delay": best["delay"],
            "reference_adp": str(REFERENCE_ADP),
            "method_signature": best["method_signature"],
            "verilog_path": best["verilog_path"],
            "aig_path": best["aig_path"],
            "evaluate_log": best["evaluate_log"],
            "equivalent": best["equivalent"],
            "notes": best["notes"],
        })

    for base in (RESULTS, SHARD):
        write_csv(base / "candidates.csv", CANDIDATE_FIELDS, rows)
        write_csv(base / "evaluation_results.csv", EVAL_FIELDS, eval_rows)
        write_csv(base / "shared_structure_report.csv", STRUCT_FIELDS, struct_rows)
        write_csv(base / "failed_hypotheses.csv", FAILED_FIELDS, failed_rows)
        write_csv(base / "simulation_results.csv", SIM_FIELDS, [])
        write_csv(base / "best_improvements.csv", BEST_FIELDS, best_rows)

    write_text(
        CAMPAIGN / "MANIFEST.md",
        "# {0}\n\nRun ID: `{0}`\n\nPurpose: targeted ex286 inner BDD variable order probes around current explicit outer-bit symcof source.\n\nArtifacts:\n- Work directory: `{1}`\n- Results: `{2}`\n\nNo `student/seeds` curation is performed.\n".format(RUN_ID, rel(WORK), rel(RESULTS)),
    )
    write_text(
        CAMPAIGN / "task_assignments.md",
        "# Task Assignments\n\n- `{0}`: `{1}`\n".format(AGENT_ID, CASE),
    )
    best_text = "none"
    if best:
        best_text = "`{0}` `{1}/{2}/{3}` vs frontend `{4}` and reference `{5}`".format(
            best["candidate_id"], best["area"], best["delay"], best["adp"], CURRENT_FRONTEND_ADP, REFERENCE_ADP,
        )
    write_text(
        SUMMARY,
        "# {0}\n\nCases: `{1}`\n\nHypothesis: fixed current outer-bit symcof partition, but reorder inner BDD variables to improve class BDD sharing.\n\nOfficial evaluate.py rows: `{2}/{3}` equivalent.\n\nBest observed: {4}.\n\nRuntime seconds: `{5:.3f}`\n".format(AGENT_ID, CASE, len(equivalent), len(rows), best_text, time.time() - start),
    )
    write_run_records(best)
    print("wrote", rel(RESULTS / "candidates.csv"))
    print("equivalent {0}/{1}".format(len(equivalent), len(rows)))
    print("best_improvements", len(best_rows))


if __name__ == "__main__":
    main()
