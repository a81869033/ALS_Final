#!/usr/bin/env python3
import csv
from decimal import Decimal, ROUND_HALF_UP
from pathlib import Path


ROOT = Path(__file__).resolve().parents[3]
RUN_ID = "frontend_source_parallel_round75_20260613_1450"
CASE = "ex299"
CANDIDATE = "ex299_r75_sel2_pairsel_cluster_static"


def read_rows(path):
    with path.open(newline="") as handle:
        reader = csv.DictReader(handle)
        return reader.fieldnames or [], list(reader)


def write_rows(path, fields, rows):
    with path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields)
        writer.writeheader()
        for row in rows:
            writer.writerow({field: row.get(field, "") for field in fields})


def ratio(adp, reference):
    return str((Decimal(adp) / Decimal(reference)).quantize(Decimal("0.000001"), rounding=ROUND_HALF_UP))


def main():
    best_path = ROOT / "frontend_campaigns" / "campaigns" / RUN_ID / "results" / "best_improvements.csv"
    _, best_rows = read_rows(best_path)
    best = None
    for row in best_rows:
        if row.get("case") == CASE and row.get("new_candidate_id") == CANDIDATE:
            best = row
            break
    if best is None:
        raise SystemExit("missing best improvement row for {0}".format(CANDIDATE))

    reference = "1013807"
    gap = str(int(best["new_adp"]) - int(reference))
    ratio_value = ratio(best["new_adp"], reference)
    method = best["method_signature"]
    parts = method.split("|")
    hypothesis = "cyclic 2-bit selector/cell with static bitcone graft"
    representation = parts[2] if len(parts) > 2 else "static selected output-bit source graft"
    sharing = parts[3] if len(parts) > 3 else "sel2 cluster source plus pairsel output-bit cones"

    registry_path = ROOT / "frontend_campaigns" / "frontend_best_registry.csv"
    registry_fields, registry_rows = read_rows(registry_path)
    for row in registry_rows:
        if row.get("case") != CASE:
            continue
        row.update(
            {
                "domain": "unknown",
                "frontend_best_adp": best["new_adp"],
                "frontend_best_area": best["area"],
                "frontend_best_delay": best["delay"],
                "frontend_best_run": RUN_ID,
                "candidate_id": CANDIDATE,
                "method_signature": method,
                "hypothesis": hypothesis,
                "representation": representation,
                "shared_structure": sharing,
                "verilog_path": best["verilog_path"],
                "aig_path": best["aig_path"],
                "equivalent": "1",
                "simulation_pass": "not_run",
                "evaluate_log": best["log_path"],
                "source_type": "campaign_best_improvement",
                "source_campaign": RUN_ID,
                "source_path": "student/frontend_campaigns/campaigns/{0}/results/best_improvements.csv".format(RUN_ID),
                "reference_adp": reference,
                "gap_to_reference": gap,
                "ratio_to_reference": ratio_value,
                "last_update": "2026-06-13",
                "notes": "official evaluate.py improvement from static pairsel bitcone graft; improves frontend ADP by 576 vs 1777806",
            }
        )
        break
    else:
        raise SystemExit("missing registry row for {0}".format(CASE))
    write_rows(registry_path, registry_fields, registry_rows)

    state_path = ROOT / "frontend_campaigns" / "search_state.csv"
    state_fields, state_rows = read_rows(state_path)
    for row in state_rows:
        if row.get("case") != CASE:
            continue
        row.update(
            {
                "domain": "unknown",
                "status": "round75_source_improved_gap_remains",
                "assigned_agent": "sub-unknown-large-redesc-r75",
                "current_focus": "static selector/source bitcone graft improved ex299; keep searching smaller shared selector/cell structure",
                "next_hypothesis": "Find a source-level representation that shares selector-2 cluster logic with pairsel/cell-local cones without duplicating low-tail logic.",
                "next_representation": "cyclic selector/cell descriptors plus targeted output-bit grafts and compact cofactors",
                "blocked_reason": "",
                "last_update": "2026-06-13 round75 source improvement",
                "priority": "frontend_high",
                "current_best_adp": best["new_adp"],
                "reference_adp": reference,
                "ratio_to_reference": ratio_value,
                "recommendation": "Continue creative source factoring around sel2 pairsel bitcones; avoid broad table descriptors and unchanged r73/r75 grafts.",
            }
        )
        break
    else:
        raise SystemExit("missing search_state row for {0}".format(CASE))
    write_rows(state_path, state_fields, state_rows)

    print("{0} promoted to {1} ratio {2}".format(CASE, best["new_adp"], ratio_value))


if __name__ == "__main__":
    main()
