#!/usr/bin/env python3
import csv
from decimal import Decimal, ROUND_HALF_UP
from pathlib import Path


ROOT = Path(__file__).resolve().parents[3]
RUN_ID = "frontend_source_parallel_round78_20260613_1744"

PROMOTIONS = {
    "ex299": {
        "candidate_id": "ex299_r78_static_celllocal_pair89",
        "previous_candidate_id": "ex299_r75_sel2_pairsel_cluster_static",
        "previous_adp": "1777230",
        "reference_adp": "1013807",
        "domain": "unknown",
    },
    "ex260": {
        "candidate_id": "ex260_r78_keep_common_abc_g_aig",
        "previous_candidate_id": "ex260_current_frontend_best",
        "previous_adp": "1144",
        "reference_adp": "657",
        "domain": "integer",
    },
}


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


def find_candidate(case, candidate_id):
    _, candidates = read_rows(ROOT / "frontend_campaigns" / "campaigns" / RUN_ID / "results" / "candidates.csv")
    for row in candidates:
        if row.get("case") == case and row.get("candidate_id") == candidate_id:
            return row
    raise SystemExit("missing candidate row for {0} {1}".format(case, candidate_id))


def upsert_improvement(case, best, meta, relpath):
    path = ROOT / "frontend_campaigns" / "campaigns" / RUN_ID / relpath
    fields, rows = read_rows(path)
    if not fields:
        fields = [
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
    rows = [
        row
        for row in rows
        if not (row.get("case") == case and (row.get("new_candidate_id") or row.get("candidate_id")) == best["candidate_id"])
    ]
    rows.append(
        {
            "case": case,
            "previous_candidate_id": meta["previous_candidate_id"],
            "previous_adp": meta["previous_adp"],
            "new_candidate_id": best["candidate_id"],
            "new_adp": best["adp"],
            "area": best["area"],
            "delay": best["delay"],
            "verilog_path": best["verilog_path"],
            "aig_path": best["aig_path"],
            "log_path": best.get("evaluate_log") or best.get("log_path", ""),
            "method_signature": best["method_signature"],
            "agent_id": best.get("agent_id", ""),
            "notes": "official evaluate.py frontend improvement vs {0}".format(meta["previous_adp"]),
        }
    )
    write_rows(path, fields, rows)


def update_registry(case, best, meta):
    registry_path = ROOT / "frontend_campaigns" / "frontend_best_registry.csv"
    fields, rows = read_rows(registry_path)
    reference = meta["reference_adp"]
    gap = str(int(best["adp"]) - int(reference))
    ratio_value = ratio(best["adp"], reference)
    for row in rows:
        if row.get("case") != case:
            continue
        row.update(
            {
                "domain": meta["domain"],
                "frontend_best_adp": best["adp"],
                "frontend_best_area": best["area"],
                "frontend_best_delay": best["delay"],
                "frontend_best_run": RUN_ID,
                "candidate_id": best["candidate_id"],
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
                "reference_adp": reference,
                "gap_to_reference": gap,
                "ratio_to_reference": ratio_value,
                "last_update": "2026-06-13",
                "notes": "official evaluate.py frontend improvement; improves frontend ADP by {0} vs {1}".format(
                    int(meta["previous_adp"]) - int(best["adp"]),
                    meta["previous_adp"],
                ),
            }
        )
        break
    else:
        raise SystemExit("missing registry row for {0}".format(case))
    write_rows(registry_path, fields, rows)


def update_search_state_ex299(best):
    state_path = ROOT / "frontend_campaigns" / "search_state.csv"
    fields, rows = read_rows(state_path)
    reference = PROMOTIONS["ex299"]["reference_adp"]
    for row in rows:
        if row.get("case") != "ex299":
            continue
        row.update(
            {
                "status": "round78_source_improved_gap_remains",
                "assigned_agent": "sub-unknown-bitcluster-r78",
                "current_focus": "selected output bitcluster mix improved ex299; continue small cofactor/source cluster search",
                "next_hypothesis": "Explore additional tiny source-level output bit clusters around current sel2/celllocal pair89 mix without broad table descriptors.",
                "next_representation": "bounded selected-output/cofactor source variants over current ex299 best",
                "last_update": "2026-06-13 round78 source improvement",
                "priority": "frontend_high",
                "current_best_adp": best["adp"],
                "reference_adp": reference,
                "ratio_to_reference": ratio(best["adp"], reference),
                "recommendation": "Continue tiny bitcluster search; avoid static r78 celllocal pair89 as-is.",
            }
        )
        break
    write_rows(state_path, fields, rows)


def main():
    for case, meta in PROMOTIONS.items():
        best = find_candidate(case, meta["candidate_id"])
        upsert_improvement(case, best, meta, "results/best_improvements.csv")
        agent = best.get("agent_id", "")
        if agent:
            shard_path = "agent_shards/{0}/best_improvements.csv".format(agent)
            if (ROOT / "frontend_campaigns" / "campaigns" / RUN_ID / shard_path).exists():
                upsert_improvement(case, best, meta, shard_path)
        update_registry(case, best, meta)
        if case == "ex299":
            update_search_state_ex299(best)
        print("{0} promoted to {1}".format(case, best["adp"]))


if __name__ == "__main__":
    main()
