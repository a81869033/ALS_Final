#!/usr/bin/env python3
"""Collect BF16 generator manifests into results, best, and summary CSV files."""

import argparse
import csv
import json
from pathlib import Path


ALL_FIELDNAMES = [
    "case",
    "candidate_id",
    "hypothesis",
    "variant",
    "verilog_path",
    "aig_path",
    "verified_truth",
    "synthesized",
    "equivalent",
    "area",
    "delay",
    "adp",
    "runtime_sec",
    "items",
    "notes",
]

BEST_FIELDNAMES = [
    "case",
    "candidate_id",
    "hypothesis",
    "variant",
    "verilog_path",
    "aig_path",
    "area",
    "delay",
    "adp",
    "items",
    "notes",
]

SUMMARY_FIELDNAMES = [
    "case",
    "best_candidate_id",
    "hypothesis",
    "best_variant",
    "best_area",
    "best_delay",
    "best_adp",
    "num_candidates",
    "num_synthesized",
    "num_equivalent",
    "best_verilog_path",
    "best_aig_path",
]


def write_csv(path, fieldnames, rows):
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(rows)


def read_manifest(path):
    with Path(path).open() as handle:
        data = json.load(handle)
    return data.get("variants", [])


def collect_rows(work_dir):
    rows = []
    for manifest in sorted(Path(work_dir).glob("ex*/manifest.json")):
        for row in read_manifest(manifest):
            rows.append({name: row.get(name, "") for name in ALL_FIELDNAMES})
    rows.sort(key=lambda row: (row["case"], row["candidate_id"]))
    return rows


def best_for_case(rows):
    valid = [row for row in rows if row.get("equivalent") == "1" and row.get("adp")]
    if not valid:
        return None
    return min(valid, key=lambda row: int(row["adp"]))


def summarize(rows):
    grouped = {}
    for row in rows:
        grouped.setdefault(row["case"], []).append(row)

    best_rows = []
    summary_rows = []
    for case in sorted(grouped):
        case_rows = grouped[case]
        best = best_for_case(case_rows)
        if best is not None:
            best_rows.append({name: best.get(name, "") for name in BEST_FIELDNAMES})
        summary_rows.append(
            {
                "case": case,
                "best_candidate_id": "" if best is None else best["candidate_id"],
                "hypothesis": case_rows[0].get("hypothesis", "") if case_rows else "",
                "best_variant": "" if best is None else best["variant"],
                "best_area": "" if best is None else best["area"],
                "best_delay": "" if best is None else best["delay"],
                "best_adp": "" if best is None else best["adp"],
                "num_candidates": str(len(case_rows)),
                "num_synthesized": str(sum(row.get("synthesized") == "1" for row in case_rows)),
                "num_equivalent": str(sum(row.get("equivalent") == "1" for row in case_rows)),
                "best_verilog_path": "" if best is None else best["verilog_path"],
                "best_aig_path": "" if best is None else best["aig_path"],
            }
        )
    return best_rows, summary_rows


def parse_args(argv=None):
    parser = argparse.ArgumentParser(description="Collect live BF16 deep-search manifest results.")
    parser.add_argument("--work-dir", type=Path, required=True)
    parser.add_argument("--results", type=Path, required=True)
    parser.add_argument("--best-results", type=Path, required=True)
    parser.add_argument("--summary", type=Path, required=True)
    return parser.parse_args(argv)


def main(argv=None):
    args = parse_args(argv)
    rows = collect_rows(args.work_dir)
    best_rows, summary_rows = summarize(rows)
    write_csv(args.results, ALL_FIELDNAMES, rows)
    write_csv(args.best_results, BEST_FIELDNAMES, best_rows)
    write_csv(args.summary, SUMMARY_FIELDNAMES, summary_rows)

    total_adp = sum(int(row["adp"]) for row in best_rows if row.get("adp"))
    complete = sum(1 for row in summary_rows if row.get("best_adp"))
    print("rows={0}".format(len(rows)))
    print("best_cases={0}/{1}".format(complete, len(summary_rows)))
    print("best_total_adp={0}".format(total_adp))
    print("results={0}".format(args.results))
    print("best={0}".format(args.best_results))
    print("summary={0}".format(args.summary))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
