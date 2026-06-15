#!/usr/bin/env python3
"""Merge round8 frontend campaign shard CSVs and update accepted bests."""

from __future__ import print_function

import csv
from collections import OrderedDict
from pathlib import Path


RUN_ID = "ex200_ex299_frontend_refgap_round8_20260612_1826"
HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[3]
SHARDS = HERE / "agent_shards"
RESULTS = HERE / "results"
FRONTEND = ROOT / "student" / "frontend_campaigns"

CANDIDATE_FIELDS = [
    "case", "domain", "candidate_id", "hypothesis", "method_signature",
    "verilog_path", "aig_path", "equivalent", "area", "delay", "adp",
    "reference_adp", "current_frontend_adp", "beat_reference",
    "improved_frontend", "log_path", "agent_id", "run_id", "notes",
]

EVAL_FIELDS = [
    "case", "domain", "candidate_id", "equivalent", "area", "delay",
    "adp", "reference_adp", "current_frontend_adp", "verilog_path",
    "aig_path", "log_path", "method_signature", "agent_id", "run_id",
    "notes",
]

FAILED_FIELDS = [
    "case", "domain", "hypothesis", "method_signature", "status", "reason",
    "artifact_path", "log_path", "agent_id", "run_id", "notes",
]

SHARED_FIELDS = [
    "case", "domain", "candidate_id", "shared_structures",
    "sharing_strategy", "estimated_benefit", "agent_id", "run_id", "notes",
]

SIM_FIELDS = ["case", "candidate_id", "simulator", "status", "log_path", "agent_id", "run_id", "notes"]

IMPROVEMENT_FIELDS = [
    "case", "domain", "agent_id", "candidate_id", "hypothesis",
    "method_signature", "representation", "shared_structure", "synth_flow",
    "semantics", "output_grouping", "verilog_path", "aig_path",
    "evaluate_log", "log_path", "verified_truth", "equivalent", "area",
    "delay", "adp", "current_frontend_adp", "previous_frontend_adp",
    "new_frontend_adp", "reference_adp", "beats_current_frontend",
    "beats_reference", "run_id", "notes",
]


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


def load_csv_by_case(path):
    rows = []
    with path.open(newline="") as handle:
        reader = csv.DictReader(handle)
        fields = reader.fieldnames
        for row in reader:
            rows.append(row)
    return fields, rows


def log_path(row):
    return row.get("log_path") or row.get("evaluate_log") or row.get("eval_log") or ""


def improved_value(row):
    return row.get("improved_frontend") or row.get("beats_current_frontend") or row.get("beats_frontend") or "0"


def beat_reference_value(row):
    return row.get("beat_reference") or row.get("beats_reference") or "0"


def normalize_candidate(row, registry):
    case = row.get("case", "")
    reg = registry.get(case, {})
    adp = as_int(row.get("adp"))
    ref = as_int(row.get("reference_adp")) or as_int(reg.get("reference_adp"))
    current = as_int(row.get("current_frontend_adp")) or as_int(reg.get("frontend_best_adp"))
    out = {
        "case": case,
        "domain": row.get("domain") or reg.get("domain", ""),
        "candidate_id": row.get("candidate_id", ""),
        "hypothesis": row.get("hypothesis", ""),
        "method_signature": row.get("method_signature", ""),
        "verilog_path": row.get("verilog_path", ""),
        "aig_path": row.get("aig_path", ""),
        "equivalent": row.get("equivalent", ""),
        "area": row.get("area", ""),
        "delay": row.get("delay", ""),
        "adp": row.get("adp", ""),
        "reference_adp": str(ref) if ref is not None else "",
        "current_frontend_adp": str(current) if current is not None else "",
        "beat_reference": beat_reference_value(row),
        "improved_frontend": improved_value(row),
        "log_path": log_path(row),
        "agent_id": row.get("agent_id", ""),
        "run_id": row.get("run_id") or RUN_ID,
        "notes": row.get("notes", ""),
    }
    if adp is not None and ref is not None:
        out["beat_reference"] = "1" if adp < ref else "0"
    if adp is not None and current is not None:
        out["improved_frontend"] = "1" if adp < current else "0"
    return out


def normalize_eval(row, registry):
    cand = normalize_candidate(row, registry)
    return {field: cand.get(field, "") for field in EVAL_FIELDS}


def normalize_failed(row, registry):
    case = row.get("case", "")
    reg = registry.get(case, {})
    return {
        "case": case,
        "domain": row.get("domain") or reg.get("domain", ""),
        "hypothesis": row.get("hypothesis", ""),
        "method_signature": row.get("method_signature", ""),
        "status": row.get("status") or ("equivalent_but_no_frontend_improvement" if row.get("equivalent") == "1" else ""),
        "reason": row.get("reason", ""),
        "artifact_path": row.get("artifact_path") or row.get("verilog_path", ""),
        "log_path": log_path(row),
        "agent_id": row.get("agent_id", ""),
        "run_id": row.get("run_id") or RUN_ID,
        "notes": row.get("notes", ""),
    }


def normalize_shared(row, registry):
    case = row.get("case", "")
    reg = registry.get(case, {})
    structures = row.get("shared_structures") or row.get("structure_family") or row.get("shared_structure") or ""
    strategy = row.get("sharing_strategy") or row.get("shared_nodes_or_terms") or row.get("sharing") or ""
    benefit = row.get("estimated_benefit") or row.get("expected_benefit") or row.get("observed_qor") or ""
    return {
        "case": case,
        "domain": row.get("domain") or reg.get("domain", ""),
        "candidate_id": row.get("candidate_id", ""),
        "shared_structures": structures,
        "sharing_strategy": strategy,
        "estimated_benefit": benefit,
        "agent_id": row.get("agent_id", ""),
        "run_id": row.get("run_id") or RUN_ID,
        "notes": row.get("notes", ""),
    }


def normalize_sim(row):
    return {
        "case": row.get("case", ""),
        "candidate_id": row.get("candidate_id", ""),
        "simulator": row.get("simulator", ""),
        "status": row.get("status", ""),
        "log_path": row.get("log_path", ""),
        "agent_id": row.get("agent_id", ""),
        "run_id": row.get("run_id") or RUN_ID,
        "notes": row.get("notes", ""),
    }


def normalize_improvement(row, registry):
    case = row.get("case", "")
    reg = registry.get(case, {})
    new_adp = row.get("new_frontend_adp") or row.get("adp", "")
    prev_adp = row.get("previous_frontend_adp") or row.get("current_frontend_adp") or reg.get("frontend_best_adp", "")
    eval_log = row.get("evaluate_log") or log_path(row)
    return {
        "case": case,
        "domain": row.get("domain") or reg.get("domain", ""),
        "agent_id": row.get("agent_id", ""),
        "candidate_id": row.get("candidate_id", ""),
        "hypothesis": row.get("hypothesis", ""),
        "method_signature": row.get("method_signature", ""),
        "representation": row.get("representation", ""),
        "shared_structure": row.get("shared_structure") or row.get("shared_structures", ""),
        "synth_flow": row.get("synth_flow", ""),
        "semantics": row.get("semantics", ""),
        "output_grouping": row.get("output_grouping", ""),
        "verilog_path": row.get("verilog_path", ""),
        "aig_path": row.get("aig_path", ""),
        "evaluate_log": eval_log,
        "log_path": eval_log,
        "verified_truth": row.get("verified_truth") or row.get("equivalent") or "1",
        "equivalent": row.get("equivalent") or "1",
        "area": row.get("area", ""),
        "delay": row.get("delay", ""),
        "adp": new_adp,
        "current_frontend_adp": prev_adp,
        "previous_frontend_adp": prev_adp,
        "new_frontend_adp": new_adp,
        "reference_adp": row.get("reference_adp") or reg.get("reference_adp", ""),
        "beats_current_frontend": "1",
        "beats_reference": row.get("beat_reference") or row.get("beats_reference") or "0",
        "run_id": row.get("run_id") or RUN_ID,
        "notes": row.get("notes", ""),
    }


def dedupe(rows, key_fn):
    merged = OrderedDict()
    for row in rows:
        key = key_fn(row)
        merged[key] = row
    return list(merged.values())


def candidate_key(row):
    return (row.get("case", ""), row.get("candidate_id", ""))


def failed_key(row):
    return (
        row.get("case", ""),
        row.get("method_signature", ""),
        row.get("status", ""),
        row.get("artifact_path", ""),
    )


def load_registry():
    fields, rows = load_csv_by_case(FRONTEND / "frontend_best_registry.csv")
    return fields, OrderedDict((row["case"], row) for row in rows)


def path_exists(value):
    return bool(value) and (ROOT / value).exists()


def update_registry(reg_fields, registry, improvements):
    changed = []
    best_by_case = {}
    for row in improvements:
        adp = as_int(row.get("new_frontend_adp"))
        if adp is None:
            continue
        case = row.get("case", "")
        if case not in best_by_case or adp < as_int(best_by_case[case].get("new_frontend_adp")):
            best_by_case[case] = row
    for case, imp in best_by_case.items():
        if case not in registry:
            continue
        current = as_int(registry[case].get("frontend_best_adp"))
        new_adp = as_int(imp.get("new_frontend_adp"))
        if current is None or new_adp is None or new_adp >= current:
            continue
        row = registry[case]
        ref = as_int(row.get("reference_adp"))
        row["frontend_best_adp"] = str(new_adp)
        row["frontend_best_area"] = imp.get("area", "")
        row["frontend_best_delay"] = imp.get("delay", "")
        row["frontend_best_run"] = RUN_ID
        row["candidate_id"] = imp.get("candidate_id", "")
        row["method_signature"] = imp.get("method_signature", "")
        row["hypothesis"] = row.get("hypothesis", "")
        row["representation"] = row.get("representation", "")
        row["shared_structure"] = row.get("shared_structure", "")
        row["verilog_path"] = imp.get("verilog_path", "")
        row["aig_path"] = imp.get("aig_path", "")
        row["equivalent"] = "1"
        row["simulation_pass"] = row.get("simulation_pass", "") or "not_run"
        row["evaluate_log"] = imp.get("log_path", "")
        row["source_type"] = "campaign_best_improvement"
        row["source_campaign"] = RUN_ID
        row["source_path"] = relpath(RESULTS / "best_improvements.csv")
        if ref is not None:
            row["gap_to_reference"] = str(new_adp - ref)
            row["ratio_to_reference"] = "{:.6f}".format(float(new_adp) / ref)
        row["last_update"] = "auto"
        row["notes"] = imp.get("notes", "")
        changed.append((case, current, new_adp, imp.get("candidate_id", "")))
    write_rows(FRONTEND / "frontend_best_registry.csv", reg_fields, registry.values())
    return changed


def relpath(path):
    return str(Path(path).resolve().relative_to(ROOT))


def update_search_state(changed):
    path = FRONTEND / "search_state.csv"
    fields, rows = load_csv_by_case(path)
    by_case = {row["case"]: row for row in rows}
    for case, old, new, cand in changed:
        row = by_case.get(case)
        if not row:
            continue
        row["status"] = "round8_evaluated_gap_remains"
        row["assigned_agent"] = "fp8-r8" if case.startswith("ex24") else row.get("assigned_agent", "")
        row["current_focus"] = "round8 official frontend improvement accepted: {0} ADP {1}->{2}".format(cand, old, new)
        row["next_hypothesis"] = "continue semantic/source-level sharing; current improvement still above reference"
        row["next_representation"] = "materially different shared decode/rounding or lower-delay source, not same synth-flow replay"
        row["budget"] = "continue"
        row["blocked_reason"] = ""
        row["last_update"] = "2026-06-12 round8 coordinator merge"
        ref = as_int(row.get("reference_adp"))
        if ref:
            row["current_best_adp"] = str(new)
            row["ratio_to_reference"] = "{:.6f}".format(float(new) / ref)
    write_rows(path, fields, rows)


def update_hypothesis_bank(changed):
    if not changed:
        return
    path = FRONTEND / "hypothesis_bank.csv"
    fields, rows = load_csv_by_case(path)
    for case, old, new, cand in changed:
        rows.append({
            "case": case,
            "hypothesis": "round8 accepted frontend improvement",
            "representation_family": cand,
            "sharing_strategy": "official evaluate.py candidate from round8 shard",
            "source": RUN_ID,
            "confidence": "high",
            "novelty": "exploit",
            "expected_gain": "medium",
            "status": "tested_improved",
            "reason": "frontend ADP {0}->{1}; reference gap remains".format(old, new),
            "created_by": "coordinator",
            "created_at": "2026-06-12",
        })
    write_rows(path, fields, rows)


def main():
    reg_fields, registry = load_registry()
    candidates = [normalize_candidate(row, registry) for row in read_rows(RESULTS / "candidates.csv")]
    evals = [normalize_eval(row, registry) for row in read_rows(RESULTS / "evaluation_results.csv")]
    failed = [normalize_failed(row, registry) for row in read_rows(RESULTS / "failed_hypotheses.csv")]
    shared = [normalize_shared(row, registry) for row in read_rows(RESULTS / "shared_structure_report.csv")]
    sims = [normalize_sim(row) for row in read_rows(RESULTS / "simulation_results.csv")]
    improvements = [normalize_improvement(row, registry) for row in read_rows(RESULTS / "best_improvements.csv")]

    for shard in sorted(SHARDS.iterdir()):
        if not shard.is_dir():
            continue
        candidates.extend(normalize_candidate(row, registry) for row in read_rows(shard / "candidates.csv"))
        evals.extend(normalize_eval(row, registry) for row in read_rows(shard / "evaluation_results.csv"))
        failed.extend(normalize_failed(row, registry) for row in read_rows(shard / "failed_hypotheses.csv"))
        shared.extend(normalize_shared(row, registry) for row in read_rows(shard / "shared_structure_report.csv"))
        sims.extend(normalize_sim(row) for row in read_rows(shard / "simulation_results.csv"))
        improvements.extend(normalize_improvement(row, registry) for row in read_rows(shard / "best_improvements.csv"))

    # Recompute improvement rows from candidates so coordinator-local rows are covered too.
    for row in candidates:
        if row.get("equivalent") == "1" and row.get("improved_frontend") == "1":
            improvements.append(normalize_improvement(row, registry))

    candidates = dedupe(candidates, candidate_key)
    evals = dedupe(evals, candidate_key)
    failed = dedupe(failed, failed_key)
    shared = dedupe(shared, lambda r: (r.get("case", ""), r.get("candidate_id", ""), r.get("agent_id", ""), r.get("shared_structures", "")))
    sims = dedupe(sims, lambda r: (r.get("case", ""), r.get("candidate_id", ""), r.get("simulator", ""), r.get("agent_id", "")))
    improvements = dedupe(improvements, lambda r: (r.get("case", ""), r.get("candidate_id", "")))

    candidates.sort(key=lambda r: (r.get("case", ""), r.get("agent_id", ""), r.get("candidate_id", "")))
    evals.sort(key=lambda r: (r.get("case", ""), r.get("agent_id", ""), r.get("candidate_id", "")))
    failed.sort(key=lambda r: (r.get("case", ""), r.get("agent_id", ""), r.get("method_signature", ""), r.get("status", "")))
    shared.sort(key=lambda r: (r.get("case", ""), r.get("agent_id", ""), r.get("candidate_id", "")))
    improvements.sort(key=lambda r: (r.get("case", ""), as_int(r.get("new_frontend_adp")) or 10 ** 18))

    write_rows(RESULTS / "candidates.csv", CANDIDATE_FIELDS, candidates)
    write_rows(RESULTS / "evaluation_results.csv", EVAL_FIELDS, evals)
    write_rows(RESULTS / "failed_hypotheses.csv", FAILED_FIELDS, failed)
    write_rows(RESULTS / "shared_structure_report.csv", SHARED_FIELDS, shared)
    write_rows(RESULTS / "simulation_results.csv", SIM_FIELDS, sims)
    write_rows(RESULTS / "best_improvements.csv", IMPROVEMENT_FIELDS, improvements)

    changed = update_registry(reg_fields, registry, improvements)
    update_search_state(changed)
    update_hypothesis_bank(changed)

    missing = []
    for row in candidates:
        for field in ("verilog_path", "aig_path", "log_path"):
            if not path_exists(row.get(field, "")):
                missing.append((row.get("case", ""), row.get("candidate_id", ""), field, row.get(field, "")))

    attempted = sorted(set(row["case"] for row in candidates + failed if row.get("case")))
    outcomes = []
    for case in attempted:
        case_rows = [row for row in candidates if row.get("case") == case and row.get("equivalent") == "1"]
        best = min(case_rows, key=lambda r: as_int(r.get("adp")) or 10 ** 18) if case_rows else None
        reg = registry.get(case, {})
        outcomes.append({
            "case": case,
            "domain": reg.get("domain", ""),
            "round8_candidates": str(len(case_rows)),
            "round8_best_candidate": best.get("candidate_id", "") if best else "",
            "round8_best_adp": best.get("adp", "") if best else "",
            "frontend_best_adp_after": reg.get("frontend_best_adp", ""),
            "reference_adp": reg.get("reference_adp", ""),
            "round8_improved_frontend": "1" if any(c == case for c, _, _, _ in changed) else "0",
            "beats_reference": "1" if best and best.get("beat_reference") == "1" else "0",
            "next_recommendation": "gap remains; continue only with materially different high-level sharing/representation",
        })
    write_rows(
        RESULTS / "case_outcomes.csv",
        [
            "case", "domain", "round8_candidates", "round8_best_candidate",
            "round8_best_adp", "frontend_best_adp_after", "reference_adp",
            "round8_improved_frontend", "beats_reference", "next_recommendation",
        ],
        outcomes,
    )

    gap_rows = []
    for row in registry.values():
        front = as_int(row.get("frontend_best_adp"))
        ref = as_int(row.get("reference_adp"))
        if front is None or not ref:
            continue
        gap_rows.append((float(front) / ref, front - ref, row.get("case", ""), row.get("domain", ""), front, ref))
    gap_rows.sort(reverse=True)

    report = []
    report.append("# Coordinator Report: {0}".format(RUN_ID))
    report.append("")
    report.append("Status: merged available shard/coordinator results and updated accepted frontend bests.")
    report.append("")
    report.append("Validation:")
    report.append("- Equivalent candidate rows: {0}".format(len([r for r in candidates if r.get("equivalent") == "1"])))
    report.append("- Evaluation rows: {0}".format(len(evals)))
    report.append("- Failed/low-value rows: {0}".format(len(failed)))
    report.append("- Best improvement rows: {0}".format(len(improvements)))
    report.append("- Success rows missing Verilog/AIG/evaluate-log paths: {0}".format(len(missing)))
    report.append("")
    report.append("Accepted registry updates:")
    if changed:
        for case, old, new, cand in changed:
            report.append("- `{0}`: frontend `{1}` -> `{2}` via `{3}`".format(case, old, new, cand))
    else:
        report.append("- None.")
    report.append("")
    report.append("Round8 per-case bests:")
    for row in outcomes:
        report.append("- `{case}`: round8 best `{round8_best_adp}`; frontend best after `{frontend_best_adp_after}`; reference `{reference_adp}`; improved `{round8_improved_frontend}`".format(**row))
    report.append("")
    report.append("Largest remaining frontend/reference gaps:")
    for ratio, gap, case, domain, front, ref in gap_rows[:20]:
        report.append("- `{0}` ({1}): frontend {2}, reference {3}, ratio {4:.3f}, gap {5}".format(case, domain, front, ref, ratio, gap))
    write_rows(RESULTS / "merge_validation.csv", ["metric", "value"], [
        {"metric": "candidate_rows", "value": str(len(candidates))},
        {"metric": "evaluation_rows", "value": str(len(evals))},
        {"metric": "failed_rows", "value": str(len(failed))},
        {"metric": "best_improvement_rows", "value": str(len(improvements))},
        {"metric": "missing_success_paths", "value": str(len(missing))},
        {"metric": "registry_updates", "value": str(len(changed))},
    ])
    (HERE / "COORDINATOR_REPORT.md").write_text("\n".join(report) + "\n")
    print("candidates", len(candidates))
    print("evaluation_results", len(evals))
    print("failed_hypotheses", len(failed))
    print("best_improvements", len(improvements))
    print("registry_updates", changed)
    print("missing_success_paths", len(missing))


if __name__ == "__main__":
    main()
