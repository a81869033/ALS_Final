#!/usr/bin/env python3
"""Small helpers for frontend campaign shard merge/bookkeeping."""

from __future__ import print_function

import csv
from collections import Counter, OrderedDict
from pathlib import Path


CSV_NAMES = [
    "candidates.csv",
    "best_improvements.csv",
    "failed_hypotheses.csv",
    "simulation_results.csv",
    "evaluation_results.csv",
    "shared_structure_report.csv",
]

PATH_FIELDS = [
    "verilog_path",
    "aig_path",
    "log_path",
    "evaluate_log",
    "evidence_path",
]


def read_csv(path):
    if not path.exists():
        return [], []
    with path.open(newline="") as handle:
        reader = csv.DictReader(handle)
        return reader.fieldnames or [], list(reader)


def write_csv(path, fieldnames, rows):
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fieldnames)
        writer.writeheader()
        for row in rows:
            writer.writerow({name: row.get(name, "") for name in fieldnames})


def ordered_union(header, rows):
    fields = OrderedDict()
    for name in header:
        fields[name] = True
    for row in rows:
        for name in row:
            fields[name] = True
    return list(fields.keys())


def as_repo_path(root, value):
    if not value:
        return None
    if value in ("not_emitted", "not_run", "blocked", "none", "None"):
        return None
    path = Path(value)
    if path.is_absolute():
        return path
    return root / path


def dedupe_candidate_signatures(rows):
    counts = Counter(row.get("method_signature", "") for row in rows if row.get("method_signature", ""))
    for row in rows:
        sig = row.get("method_signature", "")
        if not sig or counts[sig] <= 1:
            continue
        row["method_signature_original"] = sig
        suffix_parts = [row.get("case", ""), row.get("variant") or row.get("candidate_id") or "duplicate"]
        suffix = "_".join(part for part in suffix_parts if part)
        row["method_signature"] = "{0}|variant:{1}".format(sig, suffix)
    return rows


def merge_campaign(campaign_file):
    root = Path(campaign_file).resolve().parents[4]
    campaign = Path(campaign_file).resolve().parent
    shards = campaign / "agent_shards"
    results = campaign / "results"
    if not shards.exists():
        raise SystemExit("missing shard directory: {0}".format(shards))

    report_lines = []
    for csv_name in CSV_NAMES:
        base_header, _ = read_csv(results / csv_name)
        merged = []
        for shard_file in sorted(shards.glob("*/" + csv_name)):
            _, rows = read_csv(shard_file)
            for row in rows:
                row = dict(row)
                row.setdefault("agent_id", shard_file.parent.name)
                row.setdefault("shard_csv", str(shard_file.relative_to(root)))
                merged.append(row)
        if csv_name == "candidates.csv":
            merged = dedupe_candidate_signatures(merged)
        fields = ordered_union(base_header, merged)
        write_csv(results / csv_name, fields, merged)
        report_lines.append("{0}: {1} rows".format(csv_name, len(merged)))

    missing_paths = []
    for csv_name in ("candidates.csv", "evaluation_results.csv", "best_improvements.csv", "failed_hypotheses.csv"):
        _, rows = read_csv(results / csv_name)
        for row in rows:
            for field in PATH_FIELDS:
                value = row.get(field, "")
                path = as_repo_path(root, value)
                if path is not None and not path.exists():
                    missing_paths.append((csv_name, row.get("case", ""), row.get("candidate_id", ""), field, value))

    _, candidate_rows = read_csv(results / "candidates.csv")
    signatures = [row.get("method_signature", "") for row in candidate_rows if row.get("method_signature", "")]
    duplicates = [sig for sig, count in Counter(signatures).items() if count > 1]

    report_lines.append("missing_paths: {0}".format(len(missing_paths)))
    for item in missing_paths[:80]:
        report_lines.append("missing_path,{0},{1},{2},{3},{4}".format(*item))
    report_lines.append("duplicate_method_signatures: {0}".format(len(duplicates)))
    for sig in duplicates[:80]:
        report_lines.append("duplicate_method_signature,{0}".format(sig))

    report_path = results / "merge_sanity_report.txt"
    report_path.write_text("\n".join(report_lines) + "\n")
    print("\n".join(report_lines))


def compact(text, limit):
    text = " ".join((text or "").split())
    if len(text) <= limit:
        return text
    return text[: limit - 3] + "..."


def row_equivalent(row):
    return row.get("equivalent", "") in ("1", "true", "True", "yes", "YES")


def append_rows(path, fieldnames, rows):
    if not rows:
        return 0
    with path.open("a", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fieldnames)
        for row in rows:
            writer.writerow({key: row.get(key, "") for key in fieldnames})
    return len(rows)


def append_bookkeeping(campaign_file, run_id, date, author):
    root = Path(campaign_file).resolve().parents[3]
    results = root / "frontend_campaigns" / "campaigns" / run_id / "results"
    _, candidates = read_csv(results / "candidates.csv")
    _, failed = read_csv(results / "failed_hypotheses.csv")

    manual_path = root / "frontend_campaigns" / "manual_judgments.csv"
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
    _, manual_rows = read_csv(manual_path)
    existing_manual = {
        (row.get("case", ""), row.get("method_signature", ""))
        for row in manual_rows
    }
    manual_add = []
    seen_manual = set()
    for source_name, rows in (("candidates.csv", candidates), ("failed_hypotheses.csv", failed)):
        for row in rows:
            method_signature = row.get("method_signature") or row.get("candidate_id")
            key = (row.get("case", ""), method_signature)
            if not method_signature or key in existing_manual or key in seen_manual:
                continue
            seen_manual.add(key)
            equivalent = row_equivalent(row)
            manual_add.append(
                {
                    "case": row.get("case", ""),
                    "method_signature": method_signature,
                    "outcome": "equivalent_but_bad_qor" if equivalent else row.get("status", "") or "failed_or_blocked",
                    "failure_reason": "official evaluate.py equivalent but did not improve frontend/reference"
                    if equivalent
                    else compact(row.get("failure_reason") or row.get("notes") or "official evaluate.py did not prove equivalence", 220),
                    "reuse_policy": "do_not_repeat_as_is",
                    "next_action": "Retry only with materially different high-level description, sharing, source factoring, or output grouping.",
                    "author": author,
                    "date": date,
                    "notes": "source={}; candidate={}; area={}; delay={}; adp={}; log={}".format(
                        source_name,
                        row.get("candidate_id", ""),
                        row.get("area", ""),
                        row.get("delay", ""),
                        row.get("adp", ""),
                        row.get("evaluate_log") or row.get("log_path", ""),
                    ),
                }
            )

    hyp_path = root / "frontend_campaigns" / "hypothesis_bank.csv"
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
    _, hyp_rows = read_csv(hyp_path)
    existing_hyp = {
        (
            row.get("case", ""),
            row.get("hypothesis", ""),
            row.get("representation_family", ""),
            row.get("source", ""),
        )
        for row in hyp_rows
    }
    hyp_add = []
    for row in candidates:
        hypothesis = row.get("hypothesis") or row.get("method_signature") or row.get("candidate_id")
        representation = row.get("representation") or row.get("variant") or row.get("method_signature")
        source = "{0}/{1}".format(run_id, row.get("agent_id", author))
        key = (row.get("case", ""), compact(hypothesis, 160), compact(representation, 120), source)
        if key in existing_hyp:
            continue
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
                "reason": "official OK ADP {0} did not beat current frontend/reference".format(row.get("adp", "")),
                "created_by": row.get("agent_id") or author,
                "created_at": date,
            }
        )

    print("manual_added={0}".format(append_rows(manual_path, manual_fields, manual_add)))
    print("hypothesis_added={0}".format(append_rows(hyp_path, hyp_fields, hyp_add)))
