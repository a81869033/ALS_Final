#!/usr/bin/env python3
"""Field-support diagnostics for bucket-count key functions."""

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


def build_rows(case, benchmarks, max_selectors):
    table = TruthTable(benchmarks / "{0}.truth".format(case))
    outputs = list(table.iter_outputs())
    buckets = bucket_info(onehot_slots(outputs, table.input_width))
    features = feature_candidates(case, table.input_width)
    base_rows = []
    for value, output in enumerate(outputs):
        base_rows.append(
            (
                bucket_counts(value, buckets),
                tuple(feature_value(feature, value) for feature in features),
                output,
            )
        )
    selected, _trace = greedy_selectors(base_rows, features, len(outputs), max_selectors)
    field_names = []
    rows = []
    for index in range(len(buckets)):
        field_names.append("cnt{0}".format(index))
    for pos, feature_index in enumerate(selected):
        field_names.append("sel{0}_{1}".format(pos, feature_name(features[feature_index])))
    for counts, feature_values, output in base_rows:
        fields = list(counts)
        fields.extend(feature_values[index] for index in selected)
        rows.append((tuple(fields), output))
    return table, field_names, rows


def subset_stats(rows, bit, subset):
    seen = {}
    conflicts = 0
    majority = {}
    for fields, output in rows:
        key = tuple(fields[index] for index in subset)
        value = (output >> bit) & 1
        if key in seen and seen[key] != value:
            conflicts += 1
        else:
            seen[key] = value
        counts = majority.setdefault(key, [0, 0])
        counts[value] += 1
    match = sum(max(counts) for counts in majority.values())
    return conflicts, match, len(seen)


def greedy_subset(rows, bit, field_count):
    selected = []
    remaining = set(range(field_count))
    trace = []
    while remaining:
        best = None
        for index in sorted(remaining):
            subset = selected + [index]
            conflicts, match, keys = subset_stats(rows, bit, subset)
            candidate = (match, -conflicts, -keys, index, conflicts, keys)
            if best is None or candidate > best:
                best = candidate
        selected.append(best[3])
        remaining.remove(best[3])
        trace.append((tuple(selected), best[4], best[0], best[5]))
        if best[4] == 0:
            break
    return trace


def find_small_exact(rows, bit, field_count, max_size):
    best_match = -1
    best_subset = ()
    best_conflicts = 0
    best_keys = 0
    for size in range(1, max_size + 1):
        for subset in itertools.combinations(range(field_count), size):
            conflicts, match, keys = subset_stats(rows, bit, subset)
            if match > best_match:
                best_match = match
                best_subset = subset
                best_conflicts = conflicts
                best_keys = keys
            if conflicts == 0:
                return subset, conflicts, match, keys
    return best_subset, best_conflicts, best_match, best_keys


def run_case(case, benchmarks, max_selectors, max_subset, greedy_only):
    table, field_names, rows = build_rows(case, benchmarks, max_selectors)
    out = []
    for bit in range(table.output_width):
        greedy = greedy_subset(rows, bit, len(field_names))
        greedy_subset_final, greedy_conflicts, greedy_match, greedy_keys = greedy[-1]
        if greedy_only:
            subset = ()
            conflicts = -1
            match = 0
            keys = 0
        else:
            subset, conflicts, match, keys = find_small_exact(rows, bit, len(field_names), max_subset)
        out.append(
            {
                "case": case,
                "output_bit": bit,
                "input_width": table.input_width,
                "output_width": table.output_width,
                "field_count": len(field_names),
                "fields": ":".join(field_names),
                "max_subset": max_subset,
                "best_subset": ":".join(field_names[index] for index in subset),
                "best_subset_size": len(subset),
                "best_conflicts": conflicts,
                "best_match": match,
                "best_keys": keys,
                "total_rows": len(rows),
                "small_exact": "1" if conflicts == 0 else "0",
                "greedy_subset": ":".join(field_names[index] for index in greedy_subset_final),
                "greedy_subset_size": len(greedy_subset_final),
                "greedy_conflicts": greedy_conflicts,
                "greedy_match": greedy_match,
                "greedy_keys": greedy_keys,
            }
        )
    return out


def main(argv=None):
    parser = argparse.ArgumentParser()
    parser.add_argument("--cases", required=True)
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--max-selectors", type=int, default=8)
    parser.add_argument("--max-subset", type=int, default=5)
    parser.add_argument("--greedy-only", action="store_true")
    parser.add_argument("--results", type=Path, required=True)
    args = parser.parse_args(argv)

    rows = []
    for case in parse_cases(args.cases):
        rows.extend(run_case(case, args.benchmarks, args.max_selectors, args.max_subset, args.greedy_only))
    fields = [
        "case",
        "output_bit",
        "input_width",
        "output_width",
        "field_count",
        "fields",
        "max_subset",
        "best_subset",
        "best_subset_size",
        "best_conflicts",
        "best_match",
        "best_keys",
        "total_rows",
        "small_exact",
        "greedy_subset",
        "greedy_subset_size",
        "greedy_conflicts",
        "greedy_match",
        "greedy_keys",
    ]
    args.results.parent.mkdir(parents=True, exist_ok=True)
    with args.results.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields)
        writer.writeheader()
        writer.writerows(rows)
    for case in sorted({row["case"] for row in rows}):
        case_rows = [row for row in rows if row["case"] == case]
        exact = sum(1 for row in case_rows if row["small_exact"] == "1")
        greedy_exact = sum(1 for row in case_rows if row["greedy_conflicts"] == "0")
        best = max(case_rows, key=lambda row: int(row["best_match"]))
        print(
            "{0} small_exact_bits={1} greedy_exact_bits={2} best=bit{3} {4}/{5}".format(
                case, exact, greedy_exact, best["output_bit"], best["best_match"], best["total_rows"]
            )
        )
    print("rows={0} output={1}".format(len(rows), args.results))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
