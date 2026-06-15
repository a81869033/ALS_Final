#!/usr/bin/env python3
"""Merge round6 blocker-focused campaign results."""

from __future__ import print_function

import csv
from pathlib import Path


RUN_ID = "ex200_ex299_frontend_refgap_round6_20260612_1807"
HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[3]
SHARDS = HERE / "agent_shards"
RESULTS = HERE / "results"

FIELDS = {
    "candidates.csv": [
        "case", "domain", "agent_id", "candidate_id", "hypothesis",
        "variant", "method_signature", "representation", "shared_structure",
        "synth_flow", "semantics", "output_grouping", "verilog_path",
        "aig_path", "evaluate_log", "verified_truth", "equivalent", "area",
        "delay", "adp", "current_frontend_adp", "reference_adp",
        "beats_current_frontend", "beats_reference", "notes",
    ],
    "best_improvements.csv": [
        "case", "domain", "agent_id", "candidate_id", "hypothesis",
        "variant", "method_signature", "representation", "shared_structure",
        "synth_flow", "semantics", "output_grouping", "verilog_path",
        "aig_path", "evaluate_log", "verified_truth", "equivalent", "area",
        "delay", "adp", "current_frontend_adp", "reference_adp",
        "beats_current_frontend", "beats_reference", "notes",
    ],
    "failed_hypotheses.csv": [
        "case", "domain", "agent_id", "hypothesis", "method_signature",
        "status", "reason", "verilog_path", "evaluate_log", "notes",
    ],
    "simulation_results.csv": [
        "case", "agent_id", "candidate_id", "simulator", "status",
        "log_path", "notes",
    ],
    "evaluation_results.csv": [
        "case", "domain", "agent_id", "candidate_id", "method_signature",
        "evaluate_status", "equivalent", "area", "delay", "adp",
        "verilog_path", "aig_path", "evaluate_log", "notes",
    ],
    "shared_structure_report.csv": [
        "case", "agent_id", "candidate_id", "structure_family",
        "shared_nodes_or_terms", "outputs_covered", "expected_benefit",
        "observed_qor", "notes",
    ],
}


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


def load_registry():
    rows = {}
    with (ROOT / "student/frontend_campaigns/frontend_best_registry.csv").open(newline="") as handle:
        for row in csv.DictReader(handle):
            rows[row["case"]] = row
    return rows


def as_int(value):
    try:
        return int(float(value))
    except Exception:
        return None


def main():
    merged = {}
    for name in FIELDS:
        rows = []
        for path in sorted(SHARDS.glob("*/" + name)):
            rows.extend(read_rows(path))
        if name == "failed_hypotheses.csv":
            rows = dedupe(rows, lambda r: (r.get("case", ""), r.get("method_signature", ""), r.get("status", "")))
        elif name in ("candidates.csv", "evaluation_results.csv"):
            rows = dedupe(rows, lambda r: (r.get("case", ""), r.get("candidate_id", "") or r.get("method_signature", "")))
        else:
            rows = dedupe(rows, lambda r: tuple(r.get(field, "") for field in FIELDS[name][:3]))
        rows.sort(key=lambda r: (r.get("case", ""), r.get("agent_id", ""), r.get("method_signature", "")))
        merged[name] = rows
        write_rows(RESULTS / name, FIELDS[name], rows)

    registry = load_registry()
    attempted = sorted(set(row.get("case", "") for row in merged["failed_hypotheses.csv"] if row.get("case")))
    outcome_fields = [
        "case", "domain", "round6_candidates", "round6_best_candidate",
        "round6_best_adp", "frontend_best_adp_now", "reference_adp",
        "frontend_ratio_to_reference", "round6_improved_frontend",
        "beats_reference", "next_recommendation",
    ]
    outcomes = []
    for case in attempted:
        reg = registry.get(case, {})
        front = as_int(reg.get("frontend_best_adp"))
        ref = as_int(reg.get("reference_adp"))
        ratio = ""
        if front is not None and ref:
            ratio = "{:.6f}".format(float(front) / ref)
        outcomes.append({
            "case": case,
            "domain": reg.get("domain", ""),
            "round6_candidates": "0",
            "round6_best_candidate": "",
            "round6_best_adp": "",
            "frontend_best_adp_now": reg.get("frontend_best_adp", ""),
            "reference_adp": reg.get("reference_adp", ""),
            "frontend_ratio_to_reference": ratio,
            "round6_improved_frontend": "0",
            "beats_reference": "0",
            "next_recommendation": "blocked by repeated low-value families; needs new external semantic insight or deeper custom diagnostic",
        })
    write_rows(RESULTS / "case_outcomes.csv", outcome_fields, outcomes)

    report = []
    report.append("# Coordinator Report: {0}".format(RUN_ID))
    report.append("")
    report.append("Status: merged. Round6 produced no official candidate rows; all four agents wrote blocker rows after method-signature filtering.")
    report.append("")
    report.append("Validation:")
    report.append("- Equivalent candidate rows: {0}".format(len(merged["candidates.csv"])))
    report.append("- Best improvements accepted: {0}".format(len(merged["best_improvements.csv"])))
    report.append("- Failed/blocker rows: {0}".format(len(merged["failed_hypotheses.csv"])))
    report.append("- Evaluation rows: {0}".format(len(merged["evaluation_results.csv"])))
    report.append("")
    report.append("Blocked Case Groups:")
    for row in merged["failed_hypotheses.csv"]:
        report.append("- `{0}` `{1}`: {2}".format(row.get("case"), row.get("status"), row.get("reason", "")[:180]))
    report.append("")
    report.append("Interpretation:")
    report.append("- Round6 confirms that the current prompt-level families are exhausted for these cases.")
    report.append("- Further gains likely require deeper handwritten semantic reverse-engineering, not more table/cofactor/BDD/synth-flow variants.")
    report.append("")
    report.append("Artifacts:")
    report.append("- Failed hypotheses: `student/frontend_campaigns/campaigns/{0}/results/failed_hypotheses.csv`".format(RUN_ID))
    report.append("- Case outcomes: `student/frontend_campaigns/campaigns/{0}/results/case_outcomes.csv`".format(RUN_ID))
    (HERE / "COORDINATOR_REPORT.md").write_text("\n".join(report) + "\n")

    print("candidates", len(merged["candidates.csv"]))
    print("best_improvements", len(merged["best_improvements.csv"]))
    print("failed_hypotheses", len(merged["failed_hypotheses.csv"]))
    print("evaluation_results", len(merged["evaluation_results.csv"]))


if __name__ == "__main__":
    main()
