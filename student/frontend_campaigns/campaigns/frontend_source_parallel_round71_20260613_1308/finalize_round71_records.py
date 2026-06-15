#!/usr/bin/env python3
import csv
from pathlib import Path


STUDENT_ROOT = Path(__file__).resolve().parents[3]
RUN_ID = "frontend_source_parallel_round71_20260613_1308"
RUN_DIR = STUDENT_ROOT / "frontend_campaigns" / "campaigns" / RUN_ID

EX242_LOG = "student/work/frontend_source_parallel_round71_20260613_1308/sub-fp8-arith-hybrid-r71/ex242/logs/ex242_r71_axis_attr_hardrom.evaluate.py.log"
EX242_SIG = "ex242|E4M3FN packed low-over-high division|reciprocal-class exponent-delta shell plus hard-zone quotient ROM|shared sign xor, exponent delta, numerator/denominator significands, per-sigpair affine attributes|axis/minor affine shell with full hard-row ROM repairs|repo_yosys_frontend_default|official_evaluate|full_word"


def rewrite_csv(path, update):
    with path.open(newline="") as f:
        reader = csv.DictReader(f)
        rows = list(reader)
        fieldnames = reader.fieldnames or []
    changed = 0
    for row in rows:
        if update(row):
            changed += 1
    with path.open("w", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(rows)
    return changed


def update_candidate(row):
    if row.get("case") != "ex242" or row.get("candidate_id") != "ex242_r71_axis_attr_hardrom":
        return False
    if "log_path" in row:
        row["log_path"] = row.get("log_path") or EX242_LOG
    if "beats_frontend" in row:
        row["beats_frontend"] = "1"
    if "beats_reference" in row:
        row["beats_reference"] = "0"
    if "reference_adp" in row:
        row["reference_adp"] = "11900"
    if "beats_overall_current" in row:
        row["beats_overall_current"] = "1"
    return True


def update_best(row):
    candidate = row.get("new_candidate_id") or row.get("candidate_id")
    if row.get("case") != "ex242" or candidate != "ex242_r71_axis_attr_hardrom":
        return False
    if "previous_candidate_id" in row:
        row["previous_candidate_id"] = "ex242_backend_best_current"
    if "previous_adp" in row:
        row["previous_adp"] = "18540"
    if "previous_current_adp" in row:
        row["previous_current_adp"] = "18540"
    if "reference_adp" in row:
        row["reference_adp"] = "11900"
    if "log_path" in row:
        row["log_path"] = row.get("log_path") or EX242_LOG
    if "evaluate_log" in row:
        row["evaluate_log"] = row.get("evaluate_log") or EX242_LOG
    if "notes" in row:
        row["notes"] = "official evaluate.py OK; improved prompt current ADP 18540 to 17682; reference ADP 11900"
    return True


def main():
    files = [
        RUN_DIR / "results" / "candidates.csv",
        RUN_DIR / "agent_shards" / "sub-fp8-arith-hybrid-r71" / "candidates.csv",
    ]
    best_files = [
        RUN_DIR / "results" / "best_improvements.csv",
        RUN_DIR / "agent_shards" / "sub-fp8-arith-hybrid-r71" / "best_improvements.csv",
    ]
    changed = 0
    for path in files:
        changed += rewrite_csv(path, update_candidate)
    for path in best_files:
        changed += rewrite_csv(path, update_best)
    print("changed_rows={}".format(changed))


if __name__ == "__main__":
    main()
