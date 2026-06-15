#!/usr/bin/env python3
"""Merge and sanity-check round64 shard CSVs."""

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


def normalize_best_improvement(row):
    """Convert shard-local improvement columns into coordinator columns."""
    if row.get("new_frontend_adp") or not row.get("adp"):
        return row
    previous = row.get("previous_frontend_adp") or row.get("frontend_best_adp")
    new_adp = row.get("adp")
    row["previous_frontend_adp"] = previous
    row["new_frontend_adp"] = new_adp
    row["frontend_best_adp"] = new_adp
    try:
        row["delta_adp"] = str(int(previous) - int(new_adp)) if previous else ""
    except Exception:
        row["delta_adp"] = ""
    try:
        reference = row.get("reference_adp")
        row["ratio_to_reference"] = "{0:.6f}".format(float(new_adp) / float(reference)) if reference else row.get("ratio_to_reference", "")
    except Exception:
        pass
    return row


def as_repo_path(value):
    if not value:
        return None
    path = Path(value)
    if path.is_absolute():
        return path
    return ROOT / path


def main():
    report_lines = []
    if not SHARDS.exists():
        raise SystemExit("missing shard directory: {0}".format(SHARDS))

    for csv_name in CSV_NAMES:
        base_header, _ = read_csv(RESULTS / csv_name)
        merged = []
        for shard_file in sorted(SHARDS.glob("*/" + csv_name)):
            candidate_by_id = {}
            if csv_name == "best_improvements.csv":
                _, candidate_rows = read_csv(shard_file.parent / "candidates.csv")
                candidate_by_id = {row.get("candidate_id", ""): row for row in candidate_rows}
            _, rows = read_csv(shard_file)
            for row in rows:
                row = dict(row)
                row.setdefault("agent_id", shard_file.parent.name)
                row.setdefault("shard_csv", str(shard_file.relative_to(ROOT)))
                if csv_name == "best_improvements.csv":
                    row = normalize_best_improvement(row)
                    candidate = candidate_by_id.get(row.get("candidate_id", ""), {})
                    for field in ("method_signature", "hypothesis", "representation", "shared_structure"):
                        if not row.get(field) and candidate.get(field):
                            row[field] = candidate.get(field)
                merged.append(row)
        fields = ordered_union(base_header, merged)
        write_csv(RESULTS / csv_name, fields, merged)
        report_lines.append("{0}: {1} rows".format(csv_name, len(merged)))

    missing_paths = []
    path_rows = []
    for csv_name in ("candidates.csv", "evaluation_results.csv", "best_improvements.csv", "failed_hypotheses.csv"):
        _, rows = read_csv(RESULTS / csv_name)
        for row in rows:
            path_rows.append((csv_name, row))
    for csv_name, row in path_rows:
        for field in PATH_FIELDS:
            value = row.get(field, "")
            if not value or value in ("not_emitted", "not_run", "blocked"):
                continue
            path = as_repo_path(value)
            if path is not None and not path.exists():
                missing_paths.append((csv_name, row.get("case", ""), row.get("candidate_id", ""), field, value))

    signatures = []
    _, candidate_rows = read_csv(RESULTS / "candidates.csv")
    for row in candidate_rows:
        sig = row.get("method_signature", "")
        if sig:
            signatures.append(sig)
    duplicates = [sig for sig, count in Counter(signatures).items() if count > 1]

    report_lines.append("missing_paths: {0}".format(len(missing_paths)))
    for item in missing_paths[:50]:
        report_lines.append("missing_path,{0},{1},{2},{3},{4}".format(*item))
    report_lines.append("duplicate_method_signatures: {0}".format(len(duplicates)))
    for sig in duplicates[:50]:
        report_lines.append("duplicate_method_signature,{0}".format(sig))

    report_path = RESULTS / "merge_sanity_report.txt"
    report_path.write_text("\n".join(report_lines) + "\n")
    print("\n".join(report_lines))


if __name__ == "__main__":
    main()
