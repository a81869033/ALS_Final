#!/usr/bin/env python3
import csv
from pathlib import Path


RUN_ID = "frontend_source_parallel_round72_20260613_1338"
STUDENT_ROOT = Path(__file__).resolve().parents[3]
REPO_ROOT = STUDENT_ROOT.parent
RUN_DIR = STUDENT_ROOT / "frontend_campaigns" / "campaigns" / RUN_ID
SHARDS = RUN_DIR / "agent_shards"
RESULTS = RUN_DIR / "results"

FILES = [
    "candidates.csv",
    "best_improvements.csv",
    "failed_hypotheses.csv",
    "simulation_results.csv",
    "evaluation_results.csv",
    "shared_structure_report.csv",
]


def merge_csv(name):
    out = RESULTS / name
    shard_files = sorted(SHARDS.glob("*/" + name))
    rows = []
    fieldnames = None
    for path in shard_files:
        with path.open(newline="") as f:
            reader = csv.DictReader(f)
            if fieldnames is None:
                fieldnames = reader.fieldnames or []
            for row in reader:
                row.setdefault("shard_csv", str(path.relative_to(REPO_ROOT)))
                rows.append(row)
    if fieldnames is None:
        with out.open(newline="") as f:
            fieldnames = next(csv.reader(f))
    with out.open("w", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=fieldnames)
        writer.writeheader()
        for row in rows:
            writer.writerow({key: row.get(key, "") for key in fieldnames})
    return rows


def path_exists(value):
    if not value:
        return True
    path = Path(value)
    if not path.is_absolute():
        path = REPO_ROOT / path
    return path.exists()


def main():
    counts = {}
    for name in FILES:
        counts[name] = len(merge_csv(name))

    missing = []
    for name in ("candidates.csv", "evaluation_results.csv", "best_improvements.csv"):
        for row in csv.DictReader((RESULTS / name).open(newline="")):
            for key in ("verilog_path", "aig_path", "evaluate_log", "log_path"):
                value = row.get(key, "")
                if value and not path_exists(value):
                    missing.append((name, row.get("case", ""), row.get("candidate_id") or row.get("new_candidate_id", ""), key, value))

    sigs = {}
    duplicate_sigs = []
    for row in csv.DictReader((RESULTS / "candidates.csv").open(newline="")):
        sig = row.get("method_signature", "")
        if not sig:
            continue
        if sig in sigs:
            duplicate_sigs.append((sig, sigs[sig], row.get("candidate_id", "")))
        sigs[sig] = row.get("candidate_id", "")

    report = RESULTS / "merge_sanity_report.txt"
    with report.open("w") as f:
        for name in FILES:
            f.write("{}: {} rows\n".format(name, counts[name]))
        f.write("missing_paths: {}\n".format(len(missing)))
        f.write("duplicate_method_signatures: {}\n".format(len(duplicate_sigs)))
        for item in missing[:50]:
            f.write("missing: {}\n".format(item))
        for item in duplicate_sigs[:50]:
            f.write("duplicate_signature: {}\n".format(item))

    for name in FILES:
        print("{}: {} rows".format(name, counts[name]))
    print("missing_paths:", len(missing))
    print("duplicate_method_signatures:", len(duplicate_sigs))


if __name__ == "__main__":
    main()
