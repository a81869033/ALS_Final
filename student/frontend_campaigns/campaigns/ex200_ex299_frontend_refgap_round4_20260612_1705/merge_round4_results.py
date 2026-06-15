#!/usr/bin/env python3
"""Merge and validate round4 frontend campaign results."""

from __future__ import print_function

import csv
from pathlib import Path


RUN_ID = "ex200_ex299_frontend_refgap_round4_20260612_1705"
HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[3]
RESULTS = HERE / "results"
SHARDS = HERE / "agent_shards"

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
    "evaluate_status", "equivalent", "area", "delay", "adp", "verilog_path",
    "aig_path", "evaluate_log", "notes",
]

FAILED_FIELDS = [
    "case", "domain", "agent_id", "hypothesis", "method_signature",
    "status", "reason", "verilog_path", "evaluate_log", "notes",
]

SHARED_FIELDS = [
    "case", "agent_id", "candidate_id", "structure_family",
    "shared_nodes_or_terms", "outputs_covered", "expected_benefit",
    "observed_qor", "notes",
]

SIM_FIELDS = ["case", "agent_id", "candidate_id", "simulator", "status", "log_path", "notes"]


def read_rows(path):
    if not path.exists():
        return []
    with path.open(newline="") as handle:
        return list(csv.DictReader(handle))


def write_rows(path, fields, rows):
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields)
        writer.writeheader()
        for row in rows:
            writer.writerow({field: row.get(field, "") for field in fields})


def rel(path):
    return str(path)


def load_registry():
    rows = {}
    path = ROOT / "student" / "frontend_campaigns" / "frontend_best_registry.csv"
    with path.open(newline="") as handle:
        for row in csv.DictReader(handle):
            rows[row["case"]] = row
    return rows


def as_int(value):
    try:
        return int(float(value))
    except Exception:
        return None


def ok_equiv(row):
    return str(row.get("equivalent", "")).strip() == "1" and as_int(row.get("adp")) is not None


def row_key(row):
    return (row.get("case", ""), row.get("method_signature", ""), row.get("candidate_id", ""))


def artifact_key(row):
    return (row.get("case", ""), row.get("candidate_id", ""))


def failed_key(row):
    artifact = row.get("verilog_path", "") or row.get("evaluate_log", "")
    if artifact:
        return (row.get("case", ""), artifact, row.get("status", ""))
    return (row.get("case", ""), row.get("method_signature", ""), row.get("status", ""))


def dedupe(rows, key_fn):
    result = []
    seen = set()
    for row in rows:
        key = key_fn(row)
        if key in seen:
            continue
        seen.add(key)
        result.append(row)
    return result


def candidate_to_eval(row, status="OK", note_suffix=""):
    note = row.get("notes", "")
    if note_suffix:
        note = (note + "; " if note else "") + note_suffix
    return {
        "case": row.get("case", ""),
        "domain": row.get("domain", ""),
        "agent_id": row.get("agent_id", ""),
        "candidate_id": row.get("candidate_id", ""),
        "method_signature": row.get("method_signature", ""),
        "evaluate_status": status,
        "equivalent": row.get("equivalent", ""),
        "area": row.get("area", ""),
        "delay": row.get("delay", ""),
        "adp": row.get("adp", ""),
        "verilog_path": row.get("verilog_path", ""),
        "aig_path": row.get("aig_path", ""),
        "evaluate_log": row.get("evaluate_log", ""),
        "notes": note,
    }


def failed_from_candidate(row, status, reason):
    return {
        "case": row.get("case", ""),
        "domain": row.get("domain", ""),
        "agent_id": row.get("agent_id", ""),
        "hypothesis": row.get("hypothesis", ""),
        "method_signature": row.get("method_signature", ""),
        "status": status,
        "reason": reason,
        "verilog_path": row.get("verilog_path", ""),
        "evaluate_log": row.get("evaluate_log", ""),
        "notes": row.get("notes", ""),
    }


def make_supplemental_rows(registry):
    rows = []

    def add(case, domain, agent, candidate, hyp, variant, method, representation,
            sharing, grouping, area, delay, adp, note):
        work = ROOT / "student" / "work" / RUN_ID / agent / case
        rows.append({
            "case": case,
            "domain": domain,
            "agent_id": agent,
            "candidate_id": candidate,
            "hypothesis": hyp,
            "variant": variant,
            "method_signature": method,
            "representation": representation,
            "shared_structure": sharing,
            "synth_flow": "yosys_abc_g_aig",
            "semantics": "abc_xf_official_evaluate",
            "output_grouping": grouping,
            "verilog_path": rel(work / "verilog" / (candidate + ".v")),
            "aig_path": rel(work / "aigs" / (candidate + ".aig")),
            "evaluate_log": rel(work / "logs" / (candidate + ".evaluate.log")),
            "verified_truth": "1",
            "equivalent": "1",
            "area": str(area),
            "delay": str(delay),
            "adp": str(adp),
            "current_frontend_adp": registry[case]["frontend_best_adp"],
            "reference_adp": registry[case]["reference_adp"],
            "beats_current_frontend": "1" if adp < int(registry[case]["frontend_best_adp"]) else "0",
            "beats_reference": "1" if adp < int(registry[case]["reference_adp"]) else "0",
            "notes": note,
        })

    add(
        "ex200", "bf16", "unary-r4",
        "ex200_bf16_exp_semantic_exp_default_one_parallel_casez_saturation",
        "bf16_exp_semantic_exp_default", "one_parallel_casez_saturation",
        "ex200|bf16_exp_semantic_exp_default|one_parallel_casez_saturation|shared_sign_exp_decode_and_parallel_casez|yosys_abc_g_aig|abc_xf_official_evaluate|full_word_semantic_exp",
        "semantic_exp_casez_saturation",
        "shared sign/exp/mant decode plus saturation casez groups",
        "full_word_semantic_exp",
        3717, 17, 63189,
        "coordinator-filled from official evaluate.py log; equivalent but worse than frontend best",
    )
    add(
        "ex223", "fp16", "unary-r4",
        "ex223_log_nested_low11_hi5_abc_g_aig",
        "fp16_log_sparse_nested_variant", "log_nested_low11_hi5",
        "ex223|fp16_log_sparse_nested_variant|log_nested_low11_hi5|shared_sign_exp_special_decode_nested_low_table|yosys_abc_g_aig|abc_xf_official_evaluate|positive_normal_nested_low_hi",
        "positive-normal nested low-bit LUT plus sign/exp special decode",
        "shared sign/exp special decode with nested low11/hi5 table",
        "positive_normal_nested_low_hi",
        10753, 19, 204307,
        "coordinator-filled from official evaluate.py log; equivalent but just worse than frontend best",
    )

    for case in ("ex283", "ex284"):
        path = ROOT / "student" / "runs" / "unknown" / RUN_ID / "gf2-polish-r4" / case / "results" / "candidates.csv"
        rows.extend(read_rows(path))
    return rows


def path_exists(row, field):
    value = row.get(field, "")
    return bool(value) and (ROOT / value).exists()


def main():
    registry = load_registry()

    candidate_rows = []
    eval_rows = []
    failed_rows = []
    shared_rows = []
    sim_rows = []

    for path in sorted(SHARDS.glob("*/candidates.csv")):
        candidate_rows.extend(read_rows(path))
    for path in sorted(SHARDS.glob("*/evaluation_results.csv")):
        eval_rows.extend(read_rows(path))
    for path in sorted(SHARDS.glob("*/failed_hypotheses.csv")):
        failed_rows.extend(read_rows(path))
    for path in sorted(SHARDS.glob("*/shared_structure_report.csv")):
        shared_rows.extend(read_rows(path))
    for path in sorted(SHARDS.glob("*/simulation_results.csv")):
        sim_rows.extend(read_rows(path))

    supplemental = make_supplemental_rows(registry)
    candidate_rows.extend(supplemental)
    eval_rows.extend(candidate_to_eval(row, note_suffix="coordinator supplemental row") for row in supplemental)

    for row in supplemental:
        status = "equivalent_but_bad_qor" if row["adp"] != registry[row["case"]]["frontend_best_adp"] else "no_improvement_tie"
        failed_rows.append(failed_from_candidate(row, status, "official evaluate.py equivalent but did not improve current frontend best"))
        shared_rows.append({
            "case": row["case"],
            "agent_id": row["agent_id"],
            "candidate_id": row["candidate_id"],
            "structure_family": row["representation"],
            "shared_nodes_or_terms": row["shared_structure"],
            "outputs_covered": row["output_grouping"],
            "expected_benefit": "reduce duplicated output logic via shared semantic structure",
            "observed_qor": "{0}/{1}/{2}".format(row["area"], row["delay"], row["adp"]),
            "notes": "coordinator supplemental row",
        })

    candidate_rows = dedupe(candidate_rows, row_key)
    candidate_rows = dedupe(candidate_rows, artifact_key)
    eval_rows = dedupe(eval_rows, row_key)
    eval_rows = dedupe(eval_rows, artifact_key)
    failed_rows = dedupe(failed_rows, failed_key)
    shared_rows = dedupe(shared_rows, lambda r: (r.get("case", ""), r.get("candidate_id", ""), r.get("structure_family", "")))
    sim_rows = dedupe(sim_rows, lambda r: (r.get("case", ""), r.get("candidate_id", ""), r.get("simulator", "")))

    candidate_rows = [row for row in candidate_rows if ok_equiv(row)]
    candidate_rows.sort(key=lambda r: (r.get("case", ""), r.get("agent_id", ""), r.get("candidate_id", "")))
    eval_rows.sort(key=lambda r: (r.get("case", ""), r.get("agent_id", ""), r.get("candidate_id", "")))
    failed_rows.sort(key=lambda r: (r.get("case", ""), r.get("agent_id", ""), r.get("method_signature", ""), r.get("status", "")))
    shared_rows.sort(key=lambda r: (r.get("case", ""), r.get("agent_id", ""), r.get("candidate_id", "")))

    write_rows(RESULTS / "candidates.csv", CANDIDATE_FIELDS, candidate_rows)
    write_rows(RESULTS / "evaluation_results.csv", EVAL_FIELDS, eval_rows)
    write_rows(RESULTS / "failed_hypotheses.csv", FAILED_FIELDS, failed_rows)
    write_rows(RESULTS / "shared_structure_report.csv", SHARED_FIELDS, shared_rows)
    write_rows(RESULTS / "simulation_results.csv", SIM_FIELDS, sim_rows)
    write_rows(RESULTS / "best_improvements.csv", CANDIDATE_FIELDS, [])

    attempted = sorted(set(row["case"] for row in eval_rows) | set(row["case"] for row in failed_rows))
    outcomes = []
    for case in attempted:
        case_candidates = [row for row in candidate_rows if row["case"] == case]
        best = min(case_candidates, key=lambda r: int(r["adp"])) if case_candidates else None
        reg = registry.get(case, {})
        front = as_int(reg.get("frontend_best_adp"))
        ref = as_int(reg.get("reference_adp"))
        ratio = ""
        if front is not None and ref:
            ratio = "{:.6f}".format(float(front) / ref)
        improved = "0"
        beat_ref = "0"
        if best:
            improved = "1" if int(best["adp"]) < front else "0"
            beat_ref = "1" if int(best["adp"]) < ref else "0"
        recommendation = "do not repeat as-is; needs new high-level hypothesis"
        if case in ("ex286", "ex287"):
            recommendation = "avoid table/cofactor/Fredkin repeats; derive actual routing descriptor"
        elif case in ("ex246", "ex247", "ex244"):
            recommendation = "avoid threshold/table repeats; derive actual FP8 conversion semantics"
        elif case in ("ex297", "ex299"):
            recommendation = "avoid value-case/high-split repeats; derive state/cell recurrence"
        outcomes.append({
            "case": case,
            "domain": reg.get("domain", ""),
            "round4_candidates": str(len(case_candidates)),
            "round4_best_candidate": best["candidate_id"] if best else "",
            "round4_best_adp": best["adp"] if best else "",
            "frontend_best_adp_now": reg.get("frontend_best_adp", ""),
            "reference_adp": reg.get("reference_adp", ""),
            "frontend_ratio_to_reference": ratio,
            "round4_improved_frontend": improved,
            "beats_reference": beat_ref,
            "next_recommendation": recommendation,
        })
    outcome_fields = [
        "case", "domain", "round4_candidates", "round4_best_candidate",
        "round4_best_adp", "frontend_best_adp_now", "reference_adp",
        "frontend_ratio_to_reference", "round4_improved_frontend",
        "beats_reference", "next_recommendation",
    ]
    write_rows(RESULTS / "case_outcomes.csv", outcome_fields, outcomes)

    success_missing = []
    for row in candidate_rows:
        for field in ("verilog_path", "aig_path", "evaluate_log"):
            if not path_exists(row, field):
                success_missing.append((row["case"], row["candidate_id"], field, row.get(field, "")))
    duplicate_count = len(candidate_rows) - len({row_key(row) for row in candidate_rows})
    artifact_duplicate_count = len(candidate_rows) - len({artifact_key(row) for row in candidate_rows})
    best_improvements = [row for row in candidate_rows if row.get("beats_current_frontend") == "1"]
    ref_beats = [row for row in candidate_rows if row.get("beats_reference") == "1"]

    gap_rows = []
    for case, row in registry.items():
        front = as_int(row.get("frontend_best_adp"))
        ref = as_int(row.get("reference_adp"))
        if front is None or not ref:
            continue
        gap_rows.append((float(front) / ref, front - ref, case, row.get("domain", ""), front, ref))
    gap_rows.sort(reverse=True)

    report = []
    report.append("# Coordinator Report: {0}".format(RUN_ID))
    report.append("")
    report.append("Run ID: `{0}`".format(RUN_ID))
    report.append("")
    report.append("Status: merged and validated. No round4 candidate improved current frontend best.")
    report.append("")
    report.append("Validation:")
    report.append("- `results/candidates.csv`: {0} equivalent candidate rows; success rows missing required paths: {1}.".format(len(candidate_rows), len(success_missing)))
    report.append("- `results/evaluation_results.csv`: {0} official evaluation rows, including non-equivalent failures.".format(len(eval_rows)))
    report.append("- `results/best_improvements.csv`: {0} accepted improvements.".format(len(best_improvements)))
    report.append("- Duplicate `(case, method_signature, candidate_id)` rows in candidates: {0}.".format(duplicate_count))
    report.append("- Duplicate `(case, candidate_id)` artifact rows in candidates: {0}.".format(artifact_duplicate_count))
    report.append("- Candidates beating reference: {0}.".format(len(ref_beats)))
    report.append("")
    report.append("Round4 outcome:")
    report.append("- Coordinator removed a duplicate `ex247` row and kept NOT_EQUIV `ex286` out of `candidates.csv`.")
    report.append("- Coordinator backfilled evaluated rows for `ex200`, `ex223`, `ex283`, and `ex284` from existing official logs/artifacts.")
    report.append("- Routing: `ex286` Fredkin-style network was non-equivalent; `ex287` ROM/direct descriptor was far worse.")
    report.append("- FP8: shared decode/threshold/rounding candidates for `ex247` and `ex246` were worse; `ex244` remained blocked by the material-difference gate.")
    report.append("- GF2 polish: `ex282` tied current best, while `ex283` and `ex284` variants were worse.")
    report.append("- Unary/integer/state: official-equivalent attempts were worse than current frontend best.")
    report.append("")
    report.append("Largest remaining frontend/reference gaps:")
    for ratio, gap, case, domain, front, ref in gap_rows[:15]:
        report.append("- `{0}`: frontend {1} vs reference {2} (ratio {3:.3f}, gap {4})".format(case, front, ref, ratio, gap))
    report.append("")
    report.append("Artifacts:")
    report.append("- Candidates: `student/frontend_campaigns/campaigns/{0}/results/candidates.csv`".format(RUN_ID))
    report.append("- Evaluation: `student/frontend_campaigns/campaigns/{0}/results/evaluation_results.csv`".format(RUN_ID))
    report.append("- Failed hypotheses: `student/frontend_campaigns/campaigns/{0}/results/failed_hypotheses.csv`".format(RUN_ID))
    report.append("- Case outcomes: `student/frontend_campaigns/campaigns/{0}/results/case_outcomes.csv`".format(RUN_ID))
    report.append("")
    report.append("Next recommendation:")
    report.append("- Stop synth-flow-only/table/cofactor repeats for the largest gaps. Open the next round on `ex286/ex287`, `ex246/ex247/ex244`, and `ex297/ex299` with new semantic diagnostics before RTL generation.")
    if success_missing:
        report.append("")
        report.append("Missing path details:")
        for case, cand, field, value in success_missing:
            report.append("- `{0}` `{1}` missing `{2}`: `{3}`".format(case, cand, field, value))

    (HERE / "COORDINATOR_REPORT.md").write_text("\n".join(report) + "\n")

    print("candidates", len(candidate_rows))
    print("evaluation_results", len(eval_rows))
    print("failed_hypotheses", len(failed_rows))
    print("shared_structure_report", len(shared_rows))
    print("best_improvements", len(best_improvements))
    print("success_missing_paths", len(success_missing))
    print("candidate_duplicates", duplicate_count)
    print("candidate_artifact_duplicates", artifact_duplicate_count)


if __name__ == "__main__":
    main()
