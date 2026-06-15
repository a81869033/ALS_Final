#!/usr/bin/env python3
"""Targeted ex287 symmetry-cofactor mux/share probes."""

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


RUN_ID = "ex287_frontend_targeted_symcof_mux_probe_20260613_0407"
AGENT_ID = "local-ex287-symcof"
CASE = "ex287"
DOMAIN = "unknown"
CURRENT_FRONTEND_ADP = 27480
REFERENCE_ADP = 5782
CAMPAIGN = ROOT / "student/frontend_campaigns/campaigns" / RUN_ID
RESULTS = CAMPAIGN / "results"
SHARD = CAMPAIGN / "agent_shards" / AGENT_ID
SUMMARY = CAMPAIGN / "agent_summaries" / (AGENT_ID + ".md")
WORK = ROOT / "student/work" / RUN_ID / AGENT_ID / CASE
RUN = ROOT / "student/runs" / DOMAIN / RUN_ID / AGENT_ID / CASE
YOSYS = ROOT / "student/tools/conda-env/bin/yosys"
PAIRS = [(4, 5), (6, 7), (8, 9)]


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
EVAL_FIELDS = ["case", "domain", "agent_id", "candidate_id", "method_signature", "evaluate_status", "equivalent", "area", "delay", "adp", "verilog_path", "aig_path", "evaluate_log", "notes"]
FAILED_FIELDS = ["case", "domain", "agent_id", "hypothesis", "method_signature", "status", "evidence_path", "notes"]
STRUCT_FIELDS = ["case", "agent_id", "hypothesis", "representation", "shared_structure", "expected_sharing", "observed_result", "notes"]
SIM_FIELDS = ["case", "domain", "agent_id", "candidate_id", "simulation_status", "sim_log", "notes"]
BEST_FIELDS = ["case", "domain", "agent_id", "candidate_id", "old_frontend_adp", "new_frontend_adp", "area", "delay", "reference_adp", "method_signature", "verilog_path", "aig_path", "evaluate_log", "notes"]


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
    match = re.search(r"^ex287\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s*$", text, re.MULTILINE)
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
    for policy in ["f00", "f10"]:
        for mux_style, share in [
            ("onehot", "group"),
            ("case", "group"),
            ("tree", "group"),
            ("onehot", "global"),
            ("case", "global"),
            ("tree", "global"),
        ]:
            specs.append((policy, None, 5, mux_style, share, "k5_muxshare"))
    for policy in ["f00", "f10"]:
        for count in [4, 6]:
            specs.append((policy, None, count, "onehot", "group", "k_neighbor"))
    for bits in [
        (0, 13, 1, 12, 2),
        (0, 1, 13, 12, 2),
        (13, 0, 1, 12, 2),
        (0, 13, 1, 12, 3),
        (0, 13, 1, 11, 2),
        (0, 13, 2, 12, 1),
    ]:
        specs.append(("f00", bits, len(bits), "onehot", "group", "selector"))
    return specs


def variant_name(policy, bits, count, mux_style, share):
    if bits is None:
        return "{0}_k{1}_{2}_{3}".format(policy, count, mux_style, share)
    return "{0}_bits_{1}_{2}_{3}".format(policy, "_".join(str(bit) for bit in bits), mux_style, share)


def run_candidate(table, outputs, spec):
    policy, bits, count, mux_style, share, family = spec
    variant = variant_name(policy, bits, count, mux_style, share)
    candidate_id = "ex287_r25_symcof_{0}_abc_g_aig".format(variant)
    verilog_path = WORK / "verilog" / (candidate_id + ".v")
    aig_path = WORK / "aigs" / (candidate_id + ".aig")
    yosys_log = WORK / "logs" / (candidate_id + ".yosys.log")
    eval_dir = WORK / "eval_outputs" / candidate_id
    eval_aig = eval_dir / "ex287.aig"
    eval_log = WORK / "logs" / (candidate_id + ".evaluate.py.log")
    note_path = WORK / "notes" / (candidate_id + ".md")
    bits_text = "k{0}".format(count) if bits is None else "_".join(str(bit) for bit in bits)
    method_signature = (
        "ex287|hamming_weight_preserving_lossy_routing_normalizer|symcof_outer_{bits}_{mux}_{share}|"
        "known_three_pair_symmetry_key_and_class_mux_bdd_share|yosys_abc_g_aig_official_evaluate|"
        "exact_popcount_preserving_unknown|full_word_class_mux"
    ).format(bits=bits_text, mux=mux_style, share=share)
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
            count,
            explicit_outer_bits=bits,
            mux_style=mux_style,
            bdd_share_style=share,
        )
        ok, verify_note = verify_outputs(outputs, model)
        verified = "1" if ok else "0"
        notes = verify_note + "; " + items
        write_text(verilog_path, verilog)
        if ok:
            aig_path.parent.mkdir(parents=True, exist_ok=True)
            run_yosys(script_default(verilog_path, candidate_id, aig_path, "aig", False), yosys_log)
            eval_dir.mkdir(parents=True, exist_ok=True)
            shutil.copyfile(str(aig_path), str(eval_aig))
            result = subprocess.run(
                [sys.executable, str(ROOT / "evaluate.py"), "--case", "ex287", "--output", str(eval_dir), "--timeout", "180"],
                cwd=str(ROOT),
                stdout=subprocess.PIPE,
                stderr=subprocess.STDOUT,
                universal_newlines=True,
                timeout=240,
            )
            write_text(eval_log, result.stdout)
            status, area, delay, adp = parse_eval(result.stdout)
            equivalent = "1" if status == "OK" else "0"
        else:
            status = "MODEL_NOT_EXACT"
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
    cand = {
        "case": CASE,
        "domain": DOMAIN,
        "agent_id": AGENT_ID,
        "candidate_id": candidate_id,
        "hypothesis": "hamming_weight_preserving_lossy_routing_normalizer",
        "variant": variant,
        "method_signature": method_signature,
        "representation": "three-pair symcof class mux with {0}/{1} source structure".format(mux_style, share),
        "shared_structure": "canonical key for exact input swap pairs (4,5),(6,7),(8,9); shared BDD cofactors; class mux",
        "synth_flow": "yosys abc -g aig plus official evaluate.py",
        "semantics": "exact_popcount_preserving_unknown_ex287",
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
    ev = {
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
    failed = None
    if equivalent != "1" or not adp or int(adp) >= CURRENT_FRONTEND_ADP:
        failed = {
            "case": CASE,
            "domain": DOMAIN,
            "agent_id": AGENT_ID,
            "hypothesis": cand["hypothesis"],
            "method_signature": method_signature,
            "status": "EQUIVALENT_BUT_NO_FRONTEND_IMPROVEMENT" if equivalent == "1" else status,
            "evidence_path": rel(note_path),
            "notes": notes,
        }
    best = None
    if adp and int(adp) < CURRENT_FRONTEND_ADP:
        best = {
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
    print("ex287 {0} status={1} area={2} delay={3} adp={4}".format(candidate_id, status, area or "-", delay or "-", adp or "-"))
    sys.stdout.flush()
    return cand, ev, failed, best


def main():
    for path in [RESULTS, SHARD, SUMMARY.parent, WORK, RUN / "results"]:
        path.mkdir(parents=True, exist_ok=True)
    table = TruthTable(ROOT / "benchmarks/ex287.truth")
    outputs = list(table.iter_outputs())
    candidates = []
    evals = []
    failed = []
    best_rows = []
    sims = []
    structs = []
    for spec in candidate_specs():
        cand, ev, fail, best = run_candidate(table, outputs, spec)
        candidates.append(cand)
        evals.append(ev)
        if fail:
            failed.append(fail)
        if best:
            best_rows.append(best)
        sims.append({"case": CASE, "domain": DOMAIN, "agent_id": AGENT_ID, "candidate_id": cand["candidate_id"], "simulation_status": "not_run_debug_only", "sim_log": "", "notes": "official evaluate.py was run for exact candidates"})
        structs.append({"case": CASE, "agent_id": AGENT_ID, "hypothesis": cand["hypothesis"], "representation": cand["representation"], "shared_structure": cand["shared_structure"], "expected_sharing": "reduce current class mux delay or cofactor duplication without changing exact three-pair symmetry key", "observed_result": "{0}/{1}/{2}".format(cand["area"], cand["delay"], cand["adp"]) if cand["adp"] else cand["notes"][:120], "notes": cand["method_signature"]})
    write_csv(RESULTS / "candidates.csv", CANDIDATE_FIELDS, candidates)
    write_csv(RESULTS / "evaluation_results.csv", EVAL_FIELDS, evals)
    write_csv(RESULTS / "failed_hypotheses.csv", FAILED_FIELDS, failed)
    write_csv(RESULTS / "best_improvements.csv", BEST_FIELDS, best_rows)
    write_csv(RESULTS / "simulation_results.csv", SIM_FIELDS, sims)
    write_csv(RESULTS / "shared_structure_report.csv", STRUCT_FIELDS, structs)
    write_csv(SHARD / "candidates.csv", CANDIDATE_FIELDS, candidates)
    write_csv(SHARD / "evaluation_results.csv", EVAL_FIELDS, evals)
    write_csv(SHARD / "failed_hypotheses.csv", FAILED_FIELDS, failed)
    write_csv(SHARD / "best_improvements.csv", BEST_FIELDS, best_rows)
    write_csv(SHARD / "simulation_results.csv", SIM_FIELDS, sims)
    write_csv(SHARD / "shared_structure_report.csv", STRUCT_FIELDS, structs)
    write_text(CAMPAIGN / "MANIFEST.md", "# {0}\n\nRun ID: `{0}`\n\nPurpose: targeted ex287 symmetry-cofactor mux/share and k-neighbor probes.\n\nArtifacts:\n- Work directory: `{1}`\n- Results: `{2}`\n\nNo `student/seeds` curation is performed.\n".format(RUN_ID, rel(WORK), rel(RESULTS)))
    write_text(CAMPAIGN / "task_assignments.md", "# Task Assignments\n\n| agent_id | cases | status | notes |\n|---|---|---|---|\n| `{0}` | `ex287` | completed | targeted symcof mux/share selector probes |\n".format(AGENT_ID))
    eq = [row for row in candidates if row["equivalent"] == "1" and row["adp"]]
    best_line = "no equivalent candidates"
    if eq:
        row = min(eq, key=lambda item: int(item["adp"]))
        best_line = "`{0}` `{1}/{2}/{3}`".format(row["candidate_id"], row["area"], row["delay"], row["adp"])
    write_text(SUMMARY, "# {0}\n\nRun ID: `{1}`\n\nOfficial equivalent candidates: `{2}`.\nFrontend improvements: `{3}`.\nBest observed: {4} vs frontend `{5}` and reference `{6}`.\n".format(AGENT_ID, RUN_ID, sum(1 for row in candidates if row["equivalent"] == "1"), len(best_rows), best_line, CURRENT_FRONTEND_ADP, REFERENCE_ADP))
    write_text(WORK / "manifest.json", json.dumps({"run_id": RUN_ID, "agent_id": AGENT_ID, "case": CASE, "rows": len(candidates), "equivalent": sum(1 for row in candidates if row["equivalent"] == "1"), "best_improvements": len(best_rows)}, indent=2, sort_keys=True) + "\n")
    print("wrote {0}".format(rel(RESULTS / "candidates.csv")))
    print("equivalent {0}/{1}".format(sum(1 for row in candidates if row["equivalent"] == "1"), len(candidates)))
    print("best_improvements {0}".format(len(best_rows)))


if __name__ == "__main__":
    main()
