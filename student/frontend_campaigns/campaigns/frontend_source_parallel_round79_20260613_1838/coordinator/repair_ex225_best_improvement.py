#!/usr/bin/env python3
"""Repair the round79 ex225 improvement row for campaign indexing."""

from __future__ import print_function

import csv
from pathlib import Path


ROOT = Path(__file__).resolve().parents[5]
RUN_ID = "frontend_source_parallel_round79_20260613_1838"
CANDIDATE_ID = "ex225_r79_split_hi3_keep_highrun_abc_g_aig"
PREVIOUS_ID = "ex225_log_sparse_residual_low14_hi5_abc_g_aig"
PREVIOUS_ADP = "218728"
NEW_ADP = "218595"

PATHS = [
    ROOT / "student" / "frontend_campaigns" / "campaigns" / RUN_ID / "results" / "best_improvements.csv",
    ROOT / "student" / "frontend_campaigns" / "campaigns" / RUN_ID / "agent_shards" / "sub-fp16-source-r79" / "best_improvements.csv",
]


def read_rows(path):
    with path.open(newline="") as handle:
        return list(csv.DictReader(handle))


def repair_csv(path):
    with path.open(newline="") as handle:
        reader = csv.DictReader(handle)
        fieldnames = list(reader.fieldnames or [])
        rows = list(reader)

    if "new_frontend_adp" not in fieldnames:
        insert_at = fieldnames.index("frontend_best_adp") if "frontend_best_adp" in fieldnames else len(fieldnames)
        fieldnames.insert(insert_at, "new_frontend_adp")
    for name in ("previous_candidate_id", "previous_adp", "new_candidate_id", "new_adp"):
        if name not in fieldnames:
            fieldnames.append(name)

    has_ex225 = any(
        row.get("case") == "ex225" and row.get("candidate_id") in ("", CANDIDATE_ID)
        for row in rows
    )
    if not has_ex225:
        candidate_path = path.parent / "candidates.csv"
        for candidate in read_rows(candidate_path):
            if candidate.get("case") == "ex225" and candidate.get("candidate_id") == CANDIDATE_ID:
                for name in candidate:
                    if name not in fieldnames:
                        fieldnames.append(name)
                rows.append(candidate)
                break

    changed = False
    for row in rows:
        if row.get("case") != "ex225":
            continue
        if row.get("candidate_id") not in ("", CANDIDATE_ID):
            continue
        if row.get("new_candidate_id", "") in ("", CANDIDATE_ID):
            row["new_candidate_id"] = CANDIDATE_ID
        if row.get("previous_candidate_id", "") == "":
            row["previous_candidate_id"] = PREVIOUS_ID
        if row.get("previous_adp", "") == "":
            row["previous_adp"] = PREVIOUS_ADP
        if row.get("new_adp", "") == "":
            row["new_adp"] = NEW_ADP
        row["new_frontend_adp"] = NEW_ADP
        changed = True

    if not changed:
        raise SystemExit("no ex225 row repaired in {0}".format(path))

    with path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(rows)
    print("repaired {0}".format(path.relative_to(ROOT)))


def main():
    for path in PATHS:
        repair_csv(path)


if __name__ == "__main__":
    main()
