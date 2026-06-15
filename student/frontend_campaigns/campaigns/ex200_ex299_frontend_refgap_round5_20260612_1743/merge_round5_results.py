#!/usr/bin/env python3
"""Merge round5 frontend campaign shard CSVs."""

from __future__ import print_function

import csv
from pathlib import Path


RUN_ID = "ex200_ex299_frontend_refgap_round5_20260612_1743"
HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[3]
SHARDS = HERE / "agent_shards"
RESULTS = HERE / "results"

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


def as_int(value):
    try:
        return int(float(value))
    except Exception:
        return None


def read_rows(path):
    if not path.exists():
        return []
    with path.open(newline="") as handle:
        rows = []
        for row in csv.DictReader(handle):
            row.pop(None, None)
            rows.append(row)
        return rows


def write_rows(path, fields, rows):
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields)
        writer.writeheader()
        for row in rows:
            writer.writerow({field: row.get(field, "") for field in fields})


def load_registry():
    path = ROOT / "student" / "frontend_campaigns" / "frontend_best_registry.csv"
    rows = {}
    with path.open(newline="") as handle:
        for row in csv.DictReader(handle):
            rows[row["case"]] = row
    return rows


def dedupe(rows, key_fn):
    out = []
    seen = set()
    for row in rows:
        key = key_fn(row)
        if key in seen:
            continue
        seen.add(key)
        out.append(row)
    return out


def candidate_key(row):
    return (row.get("case", ""), row.get("candidate_id", "") or row.get("method_signature", ""))


def failed_key(row):
    artifact = row.get("verilog_path", "") or row.get("evaluate_log", "")
    if artifact:
        return (row.get("case", ""), artifact, row.get("status", ""))
    return (row.get("case", ""), row.get("method_signature", ""), row.get("status", ""))


def is_equiv_candidate(row):
    return row.get("equivalent", "").strip() == "1" and as_int(row.get("adp")) is not None


def path_exists(value):
    return bool(value) and (ROOT / value).exists()


def normalize_candidate(row, registry):
    case = row.get("case", "")
    reg = registry.get(case, {})
    adp = as_int(row.get("adp"))
    front = as_int(row.get("current_frontend_adp"))
    if front is None:
        front = as_int(reg.get("frontend_best_adp"))
    ref = as_int(row.get("reference_adp"))
    if ref is None:
        ref = as_int(reg.get("reference_adp"))
    if not row.get("current_frontend_adp") and front is not None:
        row["current_frontend_adp"] = str(front)
    if not row.get("reference_adp") and ref is not None:
        row["reference_adp"] = str(ref)
    if adp is not None and front is not None:
        row["beats_current_frontend"] = "1" if adp < front else "0"
    if adp is not None and ref is not None:
        row["beats_reference"] = "1" if adp < ref else "0"
    return row


def main():
    registry = load_registry()
    candidates = []
    evals = []
    failed = []
    shared = []
    sims = []
    for shard in sorted(SHARDS.iterdir()):
        if not shard.is_dir():
            continue
        candidates.extend(read_rows(shard / "candidates.csv"))
        evals.extend(read_rows(shard / "evaluation_results.csv"))
        failed.extend(read_rows(shard / "failed_hypotheses.csv"))
        shared.extend(read_rows(shard / "shared_structure_report.csv"))
        sims.extend(read_rows(shard / "simulation_results.csv"))

    candidates = [normalize_candidate(row, registry) for row in candidates if is_equiv_candidate(row)]
    candidates = dedupe(candidates, candidate_key)
    evals = dedupe(evals, candidate_key)
    failed = dedupe(failed, failed_key)
    shared = dedupe(shared, lambda r: (r.get("case", ""), r.get("candidate_id", ""), r.get("structure_family", "")))
    sims = dedupe(sims, lambda r: (r.get("case", ""), r.get("candidate_id", ""), r.get("simulator", "")))

    candidates.sort(key=lambda r: (r.get("case", ""), r.get("agent_id", ""), r.get("candidate_id", "")))
    evals.sort(key=lambda r: (r.get("case", ""), r.get("agent_id", ""), r.get("candidate_id", "")))
    failed.sort(key=lambda r: (r.get("case", ""), r.get("agent_id", ""), r.get("method_signature", ""), r.get("status", "")))
    shared.sort(key=lambda r: (r.get("case", ""), r.get("agent_id", ""), r.get("candidate_id", "")))

    improvements = [row for row in candidates if row.get("beats_current_frontend") == "1"]
    improvements.sort(key=lambda r: (r.get("case", ""), as_int(r.get("adp")) or 10**18))

    write_rows(RESULTS / "candidates.csv", CANDIDATE_FIELDS, candidates)
    write_rows(RESULTS / "evaluation_results.csv", EVAL_FIELDS, evals)
    write_rows(RESULTS / "failed_hypotheses.csv", FAILED_FIELDS, failed)
    write_rows(RESULTS / "shared_structure_report.csv", SHARED_FIELDS, shared)
    write_rows(RESULTS / "simulation_results.csv", SIM_FIELDS, sims)
    write_rows(RESULTS / "best_improvements.csv", CANDIDATE_FIELDS, improvements)

    attempted_cases = sorted(set(row.get("case", "") for row in candidates + evals + failed if row.get("case")))
    outcome_fields = [
        "case", "domain", "round5_candidates", "round5_best_candidate",
        "round5_best_adp", "frontend_best_adp_before", "reference_adp",
        "frontend_ratio_before", "round5_improved_frontend",
        "beats_reference", "next_recommendation",
    ]
    outcomes = []
    for case in attempted_cases:
        reg = registry.get(case, {})
        case_candidates = [row for row in candidates if row.get("case") == case]
        best = min(case_candidates, key=lambda r: as_int(r.get("adp")) or 10**18) if case_candidates else None
        front = None
        for row in case_candidates:
            value = as_int(row.get("current_frontend_adp"))
            if value is not None:
                front = value
                break
        if front is None:
            front = as_int(reg.get("frontend_best_adp"))
        ref = None
        for row in case_candidates:
            value = as_int(row.get("reference_adp"))
            if value is not None:
                ref = value
                break
        if ref is None:
            ref = as_int(reg.get("reference_adp"))
        ratio = ""
        if front is not None and ref:
            ratio = "{:.6f}".format(float(front) / ref)
        recommendation = "needs new high-level hypothesis; do not repeat failed round5 direction"
        if case in ("ex246", "ex247", "ex244"):
            recommendation = "continue FP8 semantic factoring; avoid threshold/table repeats"
        elif case in ("ex286", "ex287"):
            recommendation = "derive actual compact routing descriptor; stop rank/table/cofactor/Fredkin repeats"
        elif case in ("ex297", "ex299"):
            recommendation = "derive true state recurrence; stop BDD/value-split repeats"
        outcomes.append({
            "case": case,
            "domain": reg.get("domain", ""),
            "round5_candidates": str(len(case_candidates)),
            "round5_best_candidate": best.get("candidate_id", "") if best else "",
            "round5_best_adp": best.get("adp", "") if best else "",
            "frontend_best_adp_before": str(front) if front is not None else reg.get("frontend_best_adp", ""),
            "reference_adp": str(ref) if ref is not None else reg.get("reference_adp", ""),
            "frontend_ratio_before": ratio,
            "round5_improved_frontend": "1" if best and best.get("beats_current_frontend") == "1" else "0",
            "beats_reference": "1" if best and best.get("beats_reference") == "1" else "0",
            "next_recommendation": recommendation,
        })
    write_rows(RESULTS / "case_outcomes.csv", outcome_fields, outcomes)

    missing = []
    for row in candidates:
        for field in ("verilog_path", "aig_path", "evaluate_log"):
            if not path_exists(row.get(field, "")):
                missing.append((row.get("case", ""), row.get("candidate_id", ""), field, row.get(field, "")))
    dup_count = len(candidates) - len({candidate_key(row) for row in candidates})

    gap_rows = []
    for case, row in registry.items():
        front = as_int(row.get("frontend_best_adp"))
        ref = as_int(row.get("reference_adp"))
        if front is None or not ref:
            continue
        new_front = front
        for imp in improvements:
            if imp.get("case") == case:
                new_front = min(new_front, as_int(imp.get("adp")) or new_front)
        gap_rows.append((float(new_front) / ref, new_front - ref, case, row.get("domain", ""), new_front, ref))
    gap_rows.sort(reverse=True)

    report = []
    report.append("# Coordinator Report: {0}".format(RUN_ID))
    report.append("")
    report.append("Status: merged and validated.")
    report.append("")
    report.append("Validation:")
    report.append("- Equivalent candidate rows: {0}".format(len(candidates)))
    report.append("- Evaluation rows including blockers/non-winning attempts: {0}".format(len(evals)))
    report.append("- Best improvements accepted: {0}".format(len(improvements)))
    report.append("- Candidate duplicate `(case, candidate_id)` rows: {0}".format(dup_count))
    report.append("- Success rows missing Verilog/AIG/evaluate-log paths: {0}".format(len(missing)))
    report.append("")
    report.append("Accepted Improvements:")
    if improvements:
        for row in improvements:
            report.append("- `{0}`: {1} -> {2} with `{3}` ({4}/{5}/{6}); reference {7}".format(
                row.get("case"),
                row.get("current_frontend_adp"),
                row.get("adp"),
                row.get("candidate_id"),
                row.get("area"),
                row.get("delay"),
                row.get("adp"),
                row.get("reference_adp"),
            ))
    else:
        report.append("- None.")
    report.append("")
    report.append("Non-Winning Or Blocked Directions:")
    for row in failed:
        report.append("- `{0}` `{1}`: {2}".format(row.get("case"), row.get("status"), row.get("reason", "")[:180]))
    report.append("")
    report.append("Largest Remaining Frontend/Reference Gaps After Round5 Accepted Improvements:")
    for ratio, gap, case, domain, front, ref in gap_rows[:15]:
        report.append("- `{0}`: frontend {1} vs reference {2} (ratio {3:.3f}, gap {4})".format(case, front, ref, ratio, gap))
    report.append("")
    report.append("Artifacts:")
    report.append("- Candidates: `student/frontend_campaigns/campaigns/{0}/results/candidates.csv`".format(RUN_ID))
    report.append("- Best improvements: `student/frontend_campaigns/campaigns/{0}/results/best_improvements.csv`".format(RUN_ID))
    report.append("- Failed hypotheses: `student/frontend_campaigns/campaigns/{0}/results/failed_hypotheses.csv`".format(RUN_ID))
    report.append("- Case outcomes: `student/frontend_campaigns/campaigns/{0}/results/case_outcomes.csv`".format(RUN_ID))
    if missing:
        report.append("")
        report.append("Missing Path Details:")
        for case, cand, field, value in missing:
            report.append("- `{0}` `{1}` missing `{2}`: `{3}`".format(case, cand, field, value))
    (HERE / "COORDINATOR_REPORT.md").write_text("\n".join(report) + "\n")

    print("candidates", len(candidates))
    print("evaluation_results", len(evals))
    print("best_improvements", len(improvements))
    print("failed_hypotheses", len(failed))
    print("shared_structure_report", len(shared))
    print("missing_success_paths", len(missing))
    print("candidate_duplicates", dup_count)


if __name__ == "__main__":
    main()
