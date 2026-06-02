#!/usr/bin/env python3
"""Rebuild summary and best-candidate CSV files from candidate history."""

import argparse
import csv
import shutil
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]

SUMMARY_FIELDNAMES = [
    "case",
    "baseline_area",
    "baseline_delay",
    "baseline_adp",
    "best_candidate_id",
    "best_flow",
    "best_area",
    "best_delay",
    "best_adp",
    "improvement_percent",
    "num_candidates",
    "num_equivalent",
    "best_aig_path",
]


CANDIDATE_FIELDNAMES = [
    "case",
    "candidate_id",
    "parent_id",
    "source",
    "tool_chain",
    "aig_path",
    "area",
    "delay",
    "adp",
    "equivalent",
    "runtime_sec",
    "notes",
]


def int_or_none(value):
    if value == "" or value is None:
        return None
    return int(value)


def is_equivalent(row):
    return row.get("equivalent") in ("1", "yes", "true", "True")


def resolve_path(path):
    path = Path(path)
    if path.is_absolute():
        return path
    return ROOT / path


def best_row(rows):
    valid = [row for row in rows if is_equivalent(row) and row.get("adp")]
    if not valid:
        return None
    return min(valid, key=lambda row: int(row["adp"]))


def improvement_percent(baseline, best):
    if baseline is None or best is None:
        return ""
    baseline_adp = int_or_none(baseline.get("adp"))
    best_adp = int_or_none(best.get("adp"))
    if baseline_adp in (None, 0) or best_adp is None:
        return ""
    return "{0:.2f}".format(100.0 * (baseline_adp - best_adp) / baseline_adp)


def write_csv(path, fieldnames, rows):
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fieldnames)
        writer.writeheader()
        for row in rows:
            writer.writerow(row)


def parse_args():
    parser = argparse.ArgumentParser(description="Summarize candidate_history.csv.")
    parser.add_argument("--history", type=Path, required=True)
    parser.add_argument("--summary", type=Path, required=True)
    parser.add_argument("--best-results", type=Path, required=True)
    parser.add_argument("--best-dir", type=Path, required=True)
    return parser.parse_args()


def main():
    args = parse_args()
    with args.history.open(newline="") as handle:
        rows = list(csv.DictReader(handle))

    by_case = {}
    for row in rows:
        by_case.setdefault(row["case"], []).append(row)

    summary_rows = []
    best_rows = []
    args.best_dir.mkdir(parents=True, exist_ok=True)

    for case in sorted(by_case):
        case_rows = by_case[case]
        baseline = next((row for row in case_rows if row.get("source") == "baseline"), None)
        best = best_row(case_rows)
        best_aig_path = ""
        if best is not None:
            source_aig = resolve_path(best["aig_path"])
            best_aig = args.best_dir / "{0}.aig".format(case)
            if source_aig != best_aig:
                shutil.copyfile(str(source_aig), str(best_aig))
            best_aig_path = str(best_aig)

            best_out = {name: best.get(name, "") for name in CANDIDATE_FIELDNAMES}
            best_out["aig_path"] = best_aig_path
            best_rows.append(best_out)

        summary_rows.append(
            {
                "case": case,
                "baseline_area": "" if baseline is None else baseline.get("area", ""),
                "baseline_delay": "" if baseline is None else baseline.get("delay", ""),
                "baseline_adp": "" if baseline is None else baseline.get("adp", ""),
                "best_candidate_id": "" if best is None else best.get("candidate_id", ""),
                "best_flow": "" if best is None else best.get("tool_chain", ""),
                "best_area": "" if best is None else best.get("area", ""),
                "best_delay": "" if best is None else best.get("delay", ""),
                "best_adp": "" if best is None else best.get("adp", ""),
                "improvement_percent": improvement_percent(baseline, best),
                "num_candidates": str(len(case_rows)),
                "num_equivalent": str(len([row for row in case_rows if is_equivalent(row)])),
                "best_aig_path": best_aig_path,
            }
        )

    write_csv(args.summary, SUMMARY_FIELDNAMES, summary_rows)
    write_csv(args.best_results, CANDIDATE_FIELDNAMES, best_rows)
    print("Summary: {0}".format(args.summary))
    print("Best candidates: {0}".format(args.best_results))
    print("Best AIG directory: {0}".format(args.best_dir))
    print("Cases: {0}".format(len(summary_rows)))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
