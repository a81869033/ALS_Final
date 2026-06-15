#!/usr/bin/env python3
import csv
from decimal import Decimal, ROUND_HALF_UP
from pathlib import Path


ROOT = Path(__file__).resolve().parents[3]
RUN_ID = "frontend_source_parallel_round77_20260613_1733"
CASE = "ex223"
CANDIDATE = "ex223_r77_frontendbest_split_output_assigns_abc_g_aig"


def read_rows(path):
    if not path.exists():
        return [], []
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
    candidates_path = ROOT / "frontend_campaigns" / "campaigns" / RUN_ID / "results" / "candidates.csv"
    _, candidates = read_rows(candidates_path)
    best = None
    for row in candidates:
        if row.get("case") == CASE and row.get("candidate_id") == CANDIDATE:
            best = row
            break
    if best is None:
        raise SystemExit("missing candidate row for {0}".format(CANDIDATE))

    previous_adp = "203756"
    reference = "120549"
    gap = str(int(best["adp"]) - int(reference))
    ratio_value = ratio(best["adp"], reference)

    improvement_fields = [
        "case",
        "previous_candidate_id",
        "previous_adp",
        "new_candidate_id",
        "new_adp",
        "area",
        "delay",
        "verilog_path",
        "aig_path",
        "log_path",
        "method_signature",
        "agent_id",
        "notes",
    ]
    improvement = {
        "case": CASE,
        "previous_candidate_id": "ex223_semantic_special_nested_low14_hi5_abc_g_aig",
        "previous_adp": previous_adp,
        "new_candidate_id": CANDIDATE,
        "new_adp": best["adp"],
        "area": best["area"],
        "delay": best["delay"],
        "verilog_path": best["verilog_path"],
        "aig_path": best["aig_path"],
        "log_path": best["evaluate_log"],
        "method_signature": best["method_signature"],
        "agent_id": "sub-fp16-source-r77",
        "notes": "official evaluate.py frontend-best improvement via source output-boundary variant",
    }
    for rel in [
        "results/best_improvements.csv",
        "agent_shards/sub-fp16-source-r77/best_improvements.csv",
    ]:
        path = ROOT / "frontend_campaigns" / "campaigns" / RUN_ID / rel
        fields, rows = read_rows(path)
        if not fields:
            fields = improvement_fields
        rows = [row for row in rows if not (row.get("case") == CASE and row.get("new_candidate_id") == CANDIDATE)]
        rows.append(improvement)
        write_rows(path, fields, rows)

    registry_path = ROOT / "frontend_campaigns" / "frontend_best_registry.csv"
    registry_fields, registry_rows = read_rows(registry_path)
    for row in registry_rows:
        if row.get("case") != CASE:
            continue
        row.update(
            {
                "domain": "fp16",
                "frontend_best_adp": best["adp"],
                "frontend_best_area": best["area"],
                "frontend_best_delay": best["delay"],
                "frontend_best_run": RUN_ID,
                "candidate_id": CANDIDATE,
                "method_signature": best["method_signature"],
                "hypothesis": "fp16 log source-boundary variant around current frontend best",
                "representation": best["representation"],
                "shared_structure": best["shared_structure"],
                "verilog_path": best["verilog_path"],
                "aig_path": best["aig_path"],
                "equivalent": "1",
                "simulation_pass": "not_run",
                "evaluate_log": best["evaluate_log"],
                "source_type": "campaign_best_improvement",
                "source_campaign": RUN_ID,
                "source_path": "student/frontend_campaigns/campaigns/{0}/results/best_improvements.csv".format(RUN_ID),
                "reference_adp": reference,
                "gap_to_reference": gap,
                "ratio_to_reference": ratio_value,
                "last_update": "2026-06-13",
                "notes": "official evaluate.py frontend-best improvement; improves frontend ADP by {0} vs {1}".format(
                    int(previous_adp) - int(best["adp"]),
                    previous_adp,
                ),
            }
        )
        break
    else:
        raise SystemExit("missing registry row for {0}".format(CASE))
    write_rows(registry_path, registry_fields, registry_rows)
    print("{0} promoted to frontend ADP {1} ratio {2}".format(CASE, best["adp"], ratio_value))


if __name__ == "__main__":
    main()
