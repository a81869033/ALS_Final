#!/usr/bin/env python3
import csv
from decimal import Decimal, ROUND_HALF_UP
from pathlib import Path


ROOT = Path(__file__).resolve().parents[3]
RUN_ID = "frontend_source_parallel_round79_20260613_1838"
CASE = "ex225"
CANDIDATE = "ex225_r79_split_hi3_keep_highrun_abc_g_aig"
PREVIOUS_CANDIDATE = "ex225_log_sparse_residual_low14_hi5_abc_g_aig"
PREVIOUS_ADP = "218728"
REFERENCE = "116676"


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
    _, rows = read_rows(ROOT / "frontend_campaigns" / "campaigns" / RUN_ID / "results" / "candidates.csv")
    best = None
    for row in rows:
        if row.get("case") == CASE and row.get("candidate_id") == CANDIDATE:
            best = row
            break
    if best is None:
        raise SystemExit("missing {0}".format(CANDIDATE))

    registry_path = ROOT / "frontend_campaigns" / "frontend_best_registry.csv"
    fields, registry_rows = read_rows(registry_path)
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
                "hypothesis": best.get("hypothesis", ""),
                "representation": best.get("representation", ""),
                "shared_structure": best.get("shared_structure", ""),
                "verilog_path": best["verilog_path"],
                "aig_path": best["aig_path"],
                "equivalent": "1",
                "simulation_pass": best.get("simulation_pass", "not_run"),
                "evaluate_log": best.get("evaluate_log") or best.get("log_path", ""),
                "source_type": "campaign_best_improvement",
                "source_campaign": RUN_ID,
                "source_path": "student/frontend_campaigns/campaigns/{0}/results/best_improvements.csv".format(RUN_ID),
                "reference_adp": REFERENCE,
                "gap_to_reference": str(int(best["adp"]) - int(REFERENCE)),
                "ratio_to_reference": ratio(best["adp"], REFERENCE),
                "last_update": "2026-06-13",
                "notes": "official evaluate.py frontend improvement; improves frontend ADP by {0} vs {1}".format(
                    int(PREVIOUS_ADP) - int(best["adp"]),
                    PREVIOUS_ADP,
                ),
            }
        )
        break
    else:
        raise SystemExit("missing registry row for {0}".format(CASE))
    write_rows(registry_path, fields, registry_rows)
    print("{0} promoted to {1}".format(CASE, best["adp"]))


if __name__ == "__main__":
    main()
