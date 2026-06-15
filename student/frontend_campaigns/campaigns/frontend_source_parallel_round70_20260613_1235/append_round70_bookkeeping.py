#!/usr/bin/env python3
import csv
from pathlib import Path


STUDENT_ROOT = Path(__file__).resolve().parents[3]
RUN_ID = "frontend_source_parallel_round70_20260613_1235"
RUN_DIR = STUDENT_ROOT / "frontend_campaigns" / "campaigns" / RUN_ID
RESULTS = RUN_DIR / "results"
DATE = "2026-06-13"


def read_rows(path):
    with path.open(newline="") as f:
        return list(csv.DictReader(f))


def append_rows(path, fieldnames, rows):
    if not rows:
        return 0
    with path.open("a", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=fieldnames)
        for row in rows:
            writer.writerow({k: row.get(k, "") for k in fieldnames})
    return len(rows)


def compact(text, limit=180):
    text = " ".join((text or "").split())
    if len(text) <= limit:
        return text
    return text[: limit - 3] + "..."


def main():
    candidates = read_rows(RESULTS / "candidates.csv")

    manual_path = STUDENT_ROOT / "frontend_campaigns" / "manual_judgments.csv"
    manual_fieldnames = [
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
    seen = set()
    for row in candidates:
        method_signature = row.get("method_signature") or row.get("candidate_id")
        key = (row.get("case", ""), method_signature)
        if key in existing_manual or key in seen:
            continue
        seen.add(key)
        manual_add.append(
            {
                "case": row.get("case", ""),
                "method_signature": method_signature,
                "outcome": "equivalent_but_bad_qor"
                if row.get("equivalent") in ("1", "true", "True")
                else "non_equivalent",
                "failure_reason": "official evaluate.py equivalent but did not improve frontend/reference"
                if row.get("equivalent") in ("1", "true", "True")
                else "official evaluate.py did not prove equivalence",
                "reuse_policy": "do_not_repeat_as_is",
                "next_action": "Retry only with materially different high-level description, sharing, source factoring, or output grouping.",
                "author": "coordinator-round70",
                "date": DATE,
                "notes": "candidate={}; area={}; delay={}; adp={}; log={}".format(
                    row.get("candidate_id", ""),
                    row.get("area", ""),
                    row.get("delay", ""),
                    row.get("adp", ""),
                    row.get("evaluate_log") or row.get("log_path", ""),
                ),
            }
        )

    hyp_path = STUDENT_ROOT / "frontend_campaigns" / "hypothesis_bank.csv"
    hyp_fieldnames = [
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
        hypothesis = row.get("hypothesis") or row.get("method_signature") or row.get("candidate_id")
        representation = row.get("representation") or row.get("variant") or row.get("method_signature")
        source = "{}/{}".format(RUN_ID, row.get("agent_id", "coordinator-round70"))
        key = (row.get("case", ""), compact(hypothesis, 160), compact(representation, 120), source)
        if key in existing_hyp or key in seen_hyp:
            continue
        seen_hyp.add(key)
        hyp_add.append(
            {
                "case": row.get("case", ""),
                "hypothesis": key[1],
                "representation_family": key[2],
                "sharing_strategy": compact(row.get("sharing_strategy") or row.get("shared_structure") or row.get("notes"), 180),
                "source": source,
                "confidence": "medium",
                "novelty": "explore",
                "expected_gain": "medium",
                "status": "tested_nonwinning",
                "reason": "official OK ADP {} did not beat current frontend/reference".format(
                    row.get("adp", "")
                ),
                "created_by": row.get("agent_id") or "coordinator-round70",
                "created_at": DATE,
            }
        )

    print("manual_added={}".format(append_rows(manual_path, manual_fieldnames, manual_add)))
    print("hypothesis_added={}".format(append_rows(hyp_path, hyp_fieldnames, hyp_add)))


if __name__ == "__main__":
    main()
