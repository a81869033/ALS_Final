#!/usr/bin/env python3
"""Collect per-case manifest variant rows into a flat CSV."""

import argparse
import csv
import json
from pathlib import Path


DEFAULT_FIELDNAMES = [
    "case",
    "candidate_id",
    "hypothesis/function_guess",
    "variant",
    "verilog_path",
    "aig_path",
    "verified_truth",
    "synthesized",
    "equivalent",
    "area",
    "delay",
    "adp",
    "reference_adp",
    "adp_ratio_to_reference",
    "within_1p5_reference",
    "beats_reference",
    "runtime_sec",
    "items",
    "classification",
    "notes",
]


def read_manifest(path):
    with Path(path).open() as handle:
        data = json.load(handle)
    return data.get("variants", [])


def collect_rows(work_dir):
    rows = []
    for manifest in sorted(Path(work_dir).glob("ex*/manifest.json")):
        rows.extend(read_manifest(manifest))
    rows.sort(key=lambda row: (row.get("case", ""), row.get("candidate_id", ""), row.get("variant", "")))
    return rows


def fieldnames_for(rows):
    names = list(DEFAULT_FIELDNAMES)
    seen = set(names)
    for row in rows:
        for key in row:
            if key not in seen:
                names.append(key)
                seen.add(key)
    return names


def write_csv(path, rows):
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    fieldnames = fieldnames_for(rows)
    with path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fieldnames)
        writer.writeheader()
        for row in rows:
            writer.writerow({name: row.get(name, "") for name in fieldnames})


def parse_args(argv=None):
    parser = argparse.ArgumentParser(description="Collect manifest variants into a CSV.")
    parser.add_argument("--work-dir", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    return parser.parse_args(argv)


def main(argv=None):
    args = parse_args(argv)
    rows = collect_rows(args.work_dir)
    write_csv(args.output, rows)
    cases = sorted(set(row.get("case", "") for row in rows))
    print("rows={0}".format(len(rows)))
    print("cases={0}".format(len(cases)))
    print("output={0}".format(args.output))
    return 0 if rows else 1


if __name__ == "__main__":
    raise SystemExit(main())
