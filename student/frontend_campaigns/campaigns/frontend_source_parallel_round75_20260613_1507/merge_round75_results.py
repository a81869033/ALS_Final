#!/usr/bin/env python3
import csv
from pathlib import Path


RUN_ID = "frontend_source_parallel_round75_20260613_1507"
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

PREFERRED_FIELDS = [
    "round",
    "run_id",
    "agent_id",
    "case",
    "domain",
    "candidate_id",
    "new_candidate_id",
    "family",
    "hypothesis",
    "representation",
    "sharing_strategy",
    "shared_structure",
    "synth_flow",
    "method_signature",
    "verilog_path",
    "aig_path",
    "log_path",
    "evaluate_log",
    "official_log",
    "official_status",
    "equivalent",
    "verified_truth",
    "simulation_pass",
    "area",
    "delay",
    "adp",
    "new_adp",
    "reference_adp",
    "current_adp",
    "current_target_adp",
    "frontend_best_adp",
    "beats_current",
    "beats_frontend",
    "beats_reference",
    "beats_overall_current",
    "notes",
    "shard_csv",
]


def merge_csv(name):
    out = RESULTS / name
    rows = []
    fieldnames = []
    for path in sorted(SHARDS.glob("*/" + name)):
        with path.open(newline="") as handle:
            reader = csv.DictReader(handle)
            for field in reader.fieldnames or []:
                if field not in fieldnames:
                    fieldnames.append(field)
            for row in reader:
                row.setdefault("shard_csv", str(path.relative_to(REPO_ROOT)))
                rows.append(row)
    if not fieldnames:
        with out.open(newline="") as handle:
            fieldnames = next(csv.reader(handle))
    ordered = [field for field in PREFERRED_FIELDS if field in fieldnames]
    ordered.extend(field for field in fieldnames if field not in ordered)
    with out.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=ordered)
        writer.writeheader()
        for row in rows:
            writer.writerow({key: row.get(key, "") for key in ordered})
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
            for key in ("verilog_path", "aig_path", "evaluate_log", "log_path", "official_log"):
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
    with report.open("w") as handle:
        for name in FILES:
            handle.write("{}: {} rows\n".format(name, counts[name]))
        handle.write("missing_paths: {}\n".format(len(missing)))
        handle.write("duplicate_method_signatures: {}\n".format(len(duplicate_sigs)))
        for item in missing[:50]:
            handle.write("missing: {}\n".format(item))
        for item in duplicate_sigs[:50]:
            handle.write("duplicate_signature: {}\n".format(item))

    for name in FILES:
        print("{}: {} rows".format(name, counts[name]))
    print("missing_paths:", len(missing))
    print("duplicate_method_signatures:", len(duplicate_sigs))


if __name__ == "__main__":
    main()
