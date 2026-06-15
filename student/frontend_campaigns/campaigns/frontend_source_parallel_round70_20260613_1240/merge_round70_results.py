#!/usr/bin/env python3
"""Merge and sanity-check round70 shard CSVs."""

from __future__ import print_function

import csv
from collections import Counter, OrderedDict
from pathlib import Path


ROOT = Path(__file__).resolve().parents[4]
CAMPAIGN = Path(__file__).resolve().parent
SHARDS = CAMPAIGN / "agent_shards"
RESULTS = CAMPAIGN / "results"

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


def as_repo_path(value):
    if not value:
        return None
    if value in ("not_emitted", "not_run", "blocked", "none", "None"):
        return None
    path = Path(value)
    if path.is_absolute():
        return path
    return ROOT / path


def dedupe_candidate_signatures(rows):
    counts = Counter(row.get("method_signature", "") for row in rows if row.get("method_signature", ""))
    for row in rows:
        sig = row.get("method_signature", "")
        if not sig or counts[sig] <= 1:
            continue
        row["method_signature_original"] = sig
        suffix = row.get("variant") or row.get("candidate_id") or "duplicate"
        row["method_signature"] = "{0}|variant:{1}".format(sig, suffix)
    return rows


def main():
    if not SHARDS.exists():
        raise SystemExit("missing shard directory: {0}".format(SHARDS))

    report_lines = []
    for csv_name in CSV_NAMES:
        base_header, _ = read_csv(RESULTS / csv_name)
        merged = []
        for shard_file in sorted(SHARDS.glob("*/" + csv_name)):
            _, rows = read_csv(shard_file)
            for row in rows:
                row = dict(row)
                row.setdefault("agent_id", shard_file.parent.name)
                row.setdefault("shard_csv", str(shard_file.relative_to(ROOT)))
                merged.append(row)
        if csv_name == "candidates.csv":
            merged = dedupe_candidate_signatures(merged)
        fields = ordered_union(base_header, merged)
        write_csv(RESULTS / csv_name, fields, merged)
        report_lines.append("{0}: {1} rows".format(csv_name, len(merged)))

    missing_paths = []
    for csv_name in ("candidates.csv", "evaluation_results.csv", "best_improvements.csv", "failed_hypotheses.csv"):
        _, rows = read_csv(RESULTS / csv_name)
        for row in rows:
            for field in PATH_FIELDS:
                value = row.get(field, "")
                path = as_repo_path(value)
                if path is not None and not path.exists():
                    missing_paths.append((csv_name, row.get("case", ""), row.get("candidate_id", ""), field, value))

    _, candidate_rows = read_csv(RESULTS / "candidates.csv")
    signatures = [row.get("method_signature", "") for row in candidate_rows if row.get("method_signature", "")]
    duplicates = [sig for sig, count in Counter(signatures).items() if count > 1]

    report_lines.append("missing_paths: {0}".format(len(missing_paths)))
    for item in missing_paths[:80]:
        report_lines.append("missing_path,{0},{1},{2},{3},{4}".format(*item))
    report_lines.append("duplicate_method_signatures: {0}".format(len(duplicates)))
    for sig in duplicates[:80]:
        report_lines.append("duplicate_method_signature,{0}".format(sig))

    report_path = RESULTS / "merge_sanity_report.txt"
    report_path.write_text("\n".join(report_lines) + "\n")
    print("\n".join(report_lines))


if __name__ == "__main__":
    main()
