#!/usr/bin/env python3
"""Tiny piecewise diagnostics for output adjacent-pair counts.

This is a bounded version of the pair-count piecewise search.  It tests only
very cheap hardware-friendly coordinates before deciding whether a broader
piecewise RTL attempt is justified.
"""

import argparse
import csv
import itertools
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from student.frontends.truth import TruthTable
from student.generators.unknown_bucket_count_classifier import (
    bucket_counts,
    bucket_info,
    feature_candidates,
    feature_name,
    feature_value,
    greedy_selectors,
    onehot_slots,
    parse_cases,
)


FIELDS = [
    "case",
    "target",
    "family",
    "name",
    "matches",
    "total_rows",
    "exact",
    "key_count",
    "notes",
]


def output_pair_counts(value, width):
    out = []
    for bit in range(0, width - 1, 2):
        out.append(((value >> bit) & 1) + ((value >> (bit + 1)) & 1))
    if width & 1:
        out.append((value >> (width - 1)) & 1)
    return tuple(out)


def context(case, benchmarks, max_selectors):
    table = TruthTable(benchmarks / "{0}.truth".format(case))
    outputs = list(table.iter_outputs())
    buckets = bucket_info(onehot_slots(outputs, table.input_width))
    features = feature_candidates(case, table.input_width)
    rows = []
    for value, output in enumerate(outputs):
        rows.append((bucket_counts(value, buckets), tuple(feature_value(f, value) for f in features), output))
    selected, _trace = greedy_selectors(rows, features, len(outputs), max_selectors)
    selected_names = ":".join(feature_name(features[index]) for index in selected)
    states = []
    targets = []
    for value, output in enumerate(outputs):
        counts = bucket_counts(value, buckets)
        selectors = tuple(feature_value(features[index], value) for index in selected)
        states.append((counts, selectors))
        targets.append(output_pair_counts(output, table.output_width))
    return table, len(buckets), selected_names, states, targets


def primitives(counts, selectors):
    items = []
    for index, count in enumerate(counts):
        items.append(("c{0}".format(index), count))
        items.append(("c{0}z".format(index), 1 if count == 0 else 0))
        items.append(("c{0}ge1".format(index), 1 if count >= 1 else 0))
        items.append(("c{0}ge2".format(index), 1 if count >= 2 else 0))
    prefix = []
    total = 0
    for count in counts:
        total += count
        prefix.append(total)
    suffix = []
    total = 0
    for count in reversed(counts):
        total += count
        suffix.append(total)
    suffix = list(reversed(suffix))
    for index, value in enumerate(prefix):
        items.append(("p{0}".format(index), min(value, 3)))
    for index, value in enumerate(suffix):
        items.append(("s{0}".format(index), min(value, 3)))
    for index, selector in enumerate(selectors):
        items.append(("sel{0}".format(index), selector))
    for left, right in itertools.combinations(range(len(counts)), 2):
        a = counts[left]
        b = counts[right]
        items.append(("mn{0}_{1}".format(left, right), min(a, b)))
        items.append(("mx{0}_{1}".format(left, right), max(a, b)))
        items.append(("sc{0}_{1}".format(left, right), min(a + b, 2)))
    return items


def majority(keys, targets):
    hist = {}
    for key, target in zip(keys, targets):
        bucket = hist.setdefault(key, {})
        bucket[target] = bucket.get(target, 0) + 1
    matches = 0
    for bucket in hist.values():
        matches += max(bucket.values())
    return matches, len(hist)


def run_case(case, benchmarks, max_selectors):
    table, bucket_count, selected_names, states, all_targets = context(case, benchmarks, max_selectors)
    primitive_rows = [primitives(counts, selectors) for counts, selectors in states]
    names = [name for name, _value in primitive_rows[0]]
    cols = [(name, [row[index][1] for row in primitive_rows]) for index, name in enumerate(names)]
    rows = []
    for target_index in range(len(all_targets[0])):
        targets = [target[target_index] for target in all_targets]
        singles = []
        for name, values in cols:
            for label, keys in (
                ("v", values),
                ("clip2", [min(value, 2) for value in values]),
                ("mod3", [value % 3 for value in values]),
            ):
                matches, key_count = majority(keys, targets)
                singles.append((matches, -key_count, name, label, key_count))
        singles.sort(reverse=True)
        for matches, neg_key_count, name, label, key_count in singles[:12]:
            rows.append(
                {
                    "case": case,
                    "target": "pair_count_{0}".format(target_index),
                    "family": "single",
                    "name": "{0}:{1}".format(name, label),
                    "matches": matches,
                    "total_rows": len(targets),
                    "exact": "1" if matches == len(targets) else "0",
                    "key_count": key_count,
                    "notes": "buckets={0}; selectors={1}".format(bucket_count, selected_names),
                }
            )
        pair_source = [cols[names.index(item[2])] for item in singles[:24]]
        seen = set()
        pairs = []
        for left, right in itertools.combinations(pair_source, 2):
            pair_name = (left[0], right[0])
            if pair_name in seen:
                continue
            seen.add(pair_name)
            keys = list(zip(left[1], right[1]))
            matches, key_count = majority(keys, targets)
            pairs.append((matches, -key_count, left[0], right[0], key_count))
        pairs.sort(reverse=True)
        for matches, neg_key_count, left, right, key_count in pairs[:12]:
            rows.append(
                {
                    "case": case,
                    "target": "pair_count_{0}".format(target_index),
                    "family": "pair",
                    "name": "{0}:{1}".format(left, right),
                    "matches": matches,
                    "total_rows": len(targets),
                    "exact": "1" if matches == len(targets) else "0",
                    "key_count": key_count,
                    "notes": "buckets={0}; selectors={1}".format(bucket_count, selected_names),
                }
            )
    return rows


def write_csv(path, fields, rows):
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields)
        writer.writeheader()
        writer.writerows(rows)


def write_empty_frontend_csvs(results_dir):
    candidate_fields = ["case", "candidate_id", "hypothesis", "variant", "verilog_path", "aig_path", "area", "delay", "adp", "items", "notes"]
    summary_fields = ["case", "candidate_id", "hypothesis", "variant", "verilog_path", "aig_path", "verified_truth", "equivalent", "area", "delay", "adp", "notes"]
    write_csv(results_dir / "candidates.csv", candidate_fields, [])
    write_csv(results_dir / "best.csv", candidate_fields, [])
    write_csv(results_dir / "summary.csv", summary_fields, [])
    write_csv(results_dir / "evaluate_check.csv", summary_fields, [])


def parse_args(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--cases", type=parse_cases, required=True)
    parser.add_argument("--run-id", required=True)
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--max-selectors", type=int, default=8)
    return parser.parse_args(argv)


def main(argv=None):
    args = parse_args(argv)
    run_dir = ROOT / "student" / "runs" / "unknown" / args.run_id
    results_dir = run_dir / "results"
    rows = []
    for case in args.cases:
        case_rows = run_case(case, args.benchmarks, args.max_selectors)
        rows.extend(case_rows)
        exact = sum(1 for row in case_rows if row["exact"] == "1")
        best = max(case_rows, key=lambda row: int(row["matches"]))
        print(
            "{0} exact_rows={1} best={2} {3} {4}/{5}".format(
                case, exact, best["target"], best["name"], best["matches"], best["total_rows"]
            ),
            flush=True,
        )
    write_csv(results_dir / "paircount_piecewise_tiny_diagnostics.csv", FIELDS, rows)
    write_empty_frontend_csvs(results_dir)
    with (run_dir / "MANIFEST.md").open("w") as handle:
        handle.write("# {0}\n\n".format(args.run_id))
        handle.write("Diagnostic-only tiny piecewise/min-max search for output adjacent-pair counts.\n\n")
        handle.write("Purpose: bounded gate for cheap comparator/min/max/clamp pair-count formulas before any RTL generation.\n\n")
        handle.write("Inputs:\n- Cases: `{0}`\n- Script: `student/generators/unknown_paircount_piecewise_tiny_diag.py`\n\n".format(",".join(args.cases)))
        handle.write("Artifacts:\n- `results/paircount_piecewise_tiny_diagnostics.csv`\n- Empty frontend CSVs: `results/summary.csv`, `results/candidates.csv`, `results/best.csv`, `results/evaluate_check.csv`\n\n")
        exact = [row for row in rows if row["exact"] == "1"]
        if exact:
            handle.write("Notes:\n- Exact tiny piecewise hit found; inspect diagnostics before RTL generation.\n")
        else:
            handle.write("Notes:\n- No exact tiny piecewise pair-count formula found; no Verilog/AIG candidates emitted.\n")
        handle.write("- `student/seeds` and `output/` are intentionally untouched.\n")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
