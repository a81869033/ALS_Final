#!/usr/bin/env python3
from __future__ import print_function

import csv
from pathlib import Path


STUDENT_ROOT = Path(__file__).resolve().parents[3]
RUN_ID = "frontend_source_parallel_round74_20260613_1439"
RUN_DIR = STUDENT_ROOT / "frontend_campaigns" / "campaigns" / RUN_ID
RESULTS = RUN_DIR / "results"
DATE = "2026-06-13"


def read_rows(path):
    if not path.exists():
        return []
    with path.open(newline="") as handle:
        return list(csv.DictReader(handle))


def append_rows(path, fieldnames, rows):
    if not rows:
        return 0
    with path.open("a", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fieldnames)
        for row in rows:
            writer.writerow({key: row.get(key, "") for key in fieldnames})
    return len(rows)


def compact(text, limit=180):
    text = " ".join((text or "").split())
    if len(text) <= limit:
        return text
    return text[: limit - 3] + "..."


def first_value(row, keys):
    for key in keys:
        value = row.get(key, "")
        if value not in ("", None):
            return value
    return ""


def row_equivalent(row):
    return first_value(row, ["equivalent", "verified_truth"]) in ("1", "true", "True", "yes", "YES", "OK")


def candidate_id(row):
    return first_value(row, ["candidate_id", "new_candidate_id"])


def log_path(row):
    return first_value(row, ["evaluate_log", "log_path", "official_log"])


def main():
    candidates = read_rows(RESULTS / "candidates.csv")
    failed = read_rows(RESULTS / "failed_hypotheses.csv")

    manual_path = STUDENT_ROOT / "frontend_campaigns" / "manual_judgments.csv"
    manual_fields = [
        "case",
        "method_signature",
        "outcome",
        "failure_reason",
        "reuse_policy",
        "next_action",
        "author",
        "date",
        "notes",
    ]
    existing_manual = {
        (row.get("case", ""), row.get("method_signature", ""))
        for row in read_rows(manual_path)
    }
    manual_add = []
    seen_manual = set()
    for source_name, rows in (("candidates.csv", candidates), ("failed_hypotheses.csv", failed)):
        for row in rows:
            method_signature = row.get("method_signature") or candidate_id(row)
            key = (row.get("case", ""), method_signature)
            if not method_signature or key in existing_manual or key in seen_manual:
                continue
            seen_manual.add(key)
            equivalent = row_equivalent(row)
            manual_add.append({
                "case": row.get("case", ""),
                "method_signature": method_signature,
                "outcome": "equivalent_but_bad_qor" if equivalent else first_value(row, ["status", "outcome", "failure_type"]) or "failed_or_blocked",
                "failure_reason": "official evaluate.py equivalent but did not improve current global frontend best/reference"
                if equivalent
                else compact(first_value(row, ["failure_reason", "reason", "details", "notes"]) or "official evaluate.py did not prove equivalence", 220),
                "reuse_policy": "do_not_repeat_as_is",
                "next_action": "Retry only with materially different high-level description, sharing, source factoring, or output grouping.",
                "author": "coordinator-round74",
                "date": DATE,
                "notes": "source={}; candidate={}; area={}; delay={}; adp={}; log={}".format(
                    source_name,
                    candidate_id(row),
                    row.get("area", ""),
                    row.get("delay", ""),
                    first_value(row, ["adp", "new_adp"]),
                    log_path(row),
                ),
            })

    hyp_path = STUDENT_ROOT / "frontend_campaigns" / "hypothesis_bank.csv"
    hyp_fields = [
        "case",
        "hypothesis",
        "representation_family",
        "sharing_strategy",
        "source",
        "confidence",
        "novelty",
        "expected_gain",
        "status",
        "reason",
        "created_by",
        "created_at",
    ]
    existing_hyp = {
        (
            row.get("case", ""),
            row.get("hypothesis", ""),
            row.get("representation_family", ""),
            row.get("source", ""),
        )
        for row in read_rows(hyp_path)
    }
    hyp_add = []
    seen_hyp = set()
    for row in candidates:
        hypothesis = row.get("hypothesis") or row.get("method_signature") or candidate_id(row)
        representation = row.get("representation") or row.get("variant") or row.get("method_signature")
        source = "{}/{}".format(RUN_ID, row.get("agent_id", "coordinator-round74"))
        key = (row.get("case", ""), compact(hypothesis, 160), compact(representation, 120), source)
        if key in existing_hyp or key in seen_hyp:
            continue
        seen_hyp.add(key)
        hyp_add.append({
            "case": row.get("case", ""),
            "hypothesis": key[1],
            "representation_family": key[2],
            "sharing_strategy": compact(row.get("sharing_strategy") or row.get("shared_structure") or row.get("notes"), 180),
            "source": source,
            "confidence": "medium",
            "novelty": "explore",
            "expected_gain": "medium",
            "status": "tested_nonwinning",
            "reason": "official OK ADP {} did not beat current global frontend best/reference".format(first_value(row, ["adp", "new_adp"])),
            "created_by": row.get("agent_id") or "coordinator-round74",
            "created_at": DATE,
        })

    print("manual_added={}".format(append_rows(manual_path, manual_fields, manual_add)))
    print("hypothesis_added={}".format(append_rows(hyp_path, hyp_fields, hyp_add)))


if __name__ == "__main__":
    main()
