#!/usr/bin/env python3
"""Piecewise/min-max diagnostics for output adjacent-pair counts.

Finite-field linear checks reject simple affine count formulas.  This script
tests comparator-friendly integer structures instead: min/max/abs/sums,
thresholds, and shallow decision trees over the exact bucket-count state.
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
    "leaves",
    "notes",
]


def popcount(value):
    return bin(value).count("1")


def output_pair_counts(value, width):
    out = []
    for bit in range(0, width - 1, 2):
        out.append(((value >> bit) & 1) + ((value >> (bit + 1)) & 1))
    if width & 1:
        out.append((value >> (width - 1)) & 1)
    return tuple(out)


def build_context(case, benchmarks, max_selectors):
    table = TruthTable(benchmarks / "{0}.truth".format(case))
    outputs = list(table.iter_outputs())
    buckets = bucket_info(onehot_slots(outputs, table.input_width))
    features = feature_candidates(case, table.input_width)
    rows = []
    for value, output in enumerate(outputs):
        rows.append(
            (
                bucket_counts(value, buckets),
                tuple(feature_value(feature, value) for feature in features),
                output,
            )
        )
    selected, _trace = greedy_selectors(rows, features, len(outputs), max_selectors)
    selected_names = ":".join(feature_name(features[index]) for index in selected)
    state = []
    targets = []
    for value, output in enumerate(outputs):
        counts = bucket_counts(value, buckets)
        selectors = tuple(feature_value(features[index], value) for index in selected)
        state.append((counts, selectors))
        targets.append(output_pair_counts(output, table.output_width))
    return table, buckets, selected_names, state, targets


def primitive_values(counts, selectors):
    items = []
    for index, count in enumerate(counts):
        items.append(("cnt{0}".format(index), count))
        items.append(("cnt{0}_clip1".format(index), 1 if count else 0))
        items.append(("cnt{0}_clip2".format(index), 2 if count >= 2 else count))
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
        items.append(("pref{0}".format(index), value))
        items.append(("pref{0}_mod3".format(index), value % 3))
        items.append(("pref{0}_clip2".format(index), min(value, 2)))
    for index, value in enumerate(suffix):
        items.append(("suff{0}".format(index), value))
        items.append(("suff{0}_mod3".format(index), value % 3))
        items.append(("suff{0}_clip2".format(index), min(value, 2)))
    for index, selector in enumerate(selectors):
        items.append(("sel{0}".format(index), selector))
    for left, right in itertools.combinations(range(len(counts)), 2):
        a = counts[left]
        b = counts[right]
        items.append(("min{0}_{1}".format(left, right), min(a, b)))
        items.append(("max{0}_{1}".format(left, right), max(a, b)))
        items.append(("abs{0}_{1}".format(left, right), abs(a - b)))
        items.append(("sum{0}_{1}_clip2".format(left, right), min(a + b, 2)))
        items.append(("gt{0}_{1}".format(left, right), 1 if a > b else 0))
        items.append(("eq{0}_{1}".format(left, right), 1 if a == b else 0))
    return items


def majority_match(keys, targets):
    hist = {}
    for key, target in zip(keys, targets):
        bucket = hist.setdefault(key, {})
        bucket[target] = bucket.get(target, 0) + 1
    matches = 0
    max_conflict = 0
    for bucket in hist.values():
        total = sum(bucket.values())
        best = max(bucket.values())
        matches += best
        max_conflict = max(max_conflict, total - best)
    return matches, len(hist), max_conflict


def exact_tree(rows_mask, target_values, predicates, all_mask, depth):
    if rows_mask == 0:
        return True, 0
    first = None
    same = True
    row = rows_mask
    while row:
        low = row & -row
        index = low.bit_length() - 1
        if first is None:
            first = target_values[index]
        elif target_values[index] != first:
            same = False
            break
        row ^= low
    if same:
        return True, 1
    if depth == 0:
        return False, 1
    best = None
    for name, mask in predicates:
        left = rows_mask & mask
        right = rows_mask & (all_mask ^ mask)
        if left == 0 or right == 0:
            continue
        score = 0
        for side in (left, right):
            hist = {}
            row = side
            while row:
                low = row & -row
                index = low.bit_length() - 1
                value = target_values[index]
                hist[value] = hist.get(value, 0) + 1
                row ^= low
            score += max(hist.values())
        balance = min(popcount(left), popcount(right))
        candidate = (score, balance, name, mask)
        if best is None or candidate > best:
            best = candidate
    if best is None:
        return False, 1
    mask = best[3]
    left_ok, left_leaves = exact_tree(rows_mask & mask, target_values, predicates, all_mask, depth - 1)
    right_ok, right_leaves = exact_tree(rows_mask & (all_mask ^ mask), target_values, predicates, all_mask, depth - 1)
    return left_ok and right_ok, left_leaves + right_leaves


def run_case(case, benchmarks, max_selectors, tree_depth, skip_tree, max_pair_primitives):
    table, buckets, selected_names, state, pair_targets = build_context(case, benchmarks, max_selectors)
    primitive_rows = [primitive_values(counts, selectors) for counts, selectors in state]
    primitive_names = [name for name, _value in primitive_rows[0]]
    primitive_columns = []
    for index, name in enumerate(primitive_names):
        primitive_columns.append((name, [row[index][1] for row in primitive_rows]))
    all_mask = (1 << len(state)) - 1
    predicates = []
    for name, values in primitive_columns:
        for threshold in sorted(set(values)):
            mask = 0
            for row, value in enumerate(values):
                if value <= threshold:
                    mask |= 1 << row
            if mask != 0 and mask != all_mask:
                predicates.append(("{0}<={1}".format(name, threshold), mask))
    rows = []
    target_count = len(pair_targets[0])
    for target_index in range(target_count):
        targets = [items[target_index] for items in pair_targets]
        for name, values in primitive_columns:
            for transform_name, keys in (
                ("value", values),
                ("clip2", [min(value, 2) for value in values]),
                ("mod3", [value % 3 for value in values]),
                ("eq0", [1 if value == 0 else 0 for value in values]),
                ("ge1", [1 if value >= 1 else 0 for value in values]),
                ("ge2", [1 if value >= 2 else 0 for value in values]),
            ):
                matches, key_count, _conflict = majority_match(keys, targets)
                if matches == len(targets):
                    rows.append(
                        {
                            "case": case,
                            "target": "pair_count_{0}".format(target_index),
                            "family": "single_primitive",
                            "name": "{0}:{1}".format(name, transform_name),
                            "matches": matches,
                            "total_rows": len(targets),
                            "exact": "1",
                            "key_count": key_count,
                            "leaves": "",
                            "notes": "buckets={0}; selectors={1}".format(len(buckets), selected_names),
                        }
                    )
        best_pairs = []
        pair_columns = primitive_columns[:max_pair_primitives]
        for (left_name, left_values), (right_name, right_values) in itertools.combinations(pair_columns, 2):
            keys = list(zip(left_values, right_values))
            matches, key_count, _conflict = majority_match(keys, targets)
            best_pairs.append((matches, -key_count, left_name, right_name, key_count))
        best_pairs.sort(reverse=True)
        for matches, neg_key_count, left_name, right_name, key_count in best_pairs[:10]:
            rows.append(
                {
                    "case": case,
                    "target": "pair_count_{0}".format(target_index),
                    "family": "top_pair_key",
                    "name": "{0}:{1}".format(left_name, right_name),
                    "matches": matches,
                    "total_rows": len(targets),
                    "exact": "1" if matches == len(targets) else "0",
                    "key_count": key_count,
                    "leaves": "",
                    "notes": "buckets={0}; selectors={1}".format(len(buckets), selected_names),
                }
            )
        if not skip_tree:
            tree_ok, leaves = exact_tree(all_mask, targets, predicates, all_mask, tree_depth)
            rows.append(
                {
                    "case": case,
                    "target": "pair_count_{0}".format(target_index),
                    "family": "greedy_predicate_tree",
                    "name": "depth{0}".format(tree_depth),
                    "matches": len(targets) if tree_ok else 0,
                    "total_rows": len(targets),
                    "exact": "1" if tree_ok else "0",
                    "key_count": "",
                    "leaves": leaves,
                    "notes": "buckets={0}; selectors={1}; predicates={2}".format(
                        len(buckets), selected_names, len(predicates)
                    ),
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
    candidate_fields = [
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
    summary_fields = [
        "case",
        "candidate_id",
        "hypothesis",
        "variant",
        "verilog_path",
        "aig_path",
        "verified_truth",
        "equivalent",
        "area",
        "delay",
        "adp",
        "notes",
    ]
    for name in ("candidates.csv", "best.csv"):
        write_csv(results_dir / name, candidate_fields, [])
    for name in ("summary.csv", "evaluate_check.csv"):
        write_csv(results_dir / name, summary_fields, [])


def parse_args(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--cases", type=parse_cases, required=True)
    parser.add_argument("--run-id", required=True)
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--max-selectors", type=int, default=8)
    parser.add_argument("--tree-depth", type=int, default=4)
    parser.add_argument("--skip-tree", action="store_true")
    parser.add_argument("--max-pair-primitives", type=int, default=96)
    return parser.parse_args(argv)


def main(argv=None):
    args = parse_args(argv)
    run_dir = ROOT / "student" / "runs" / "unknown" / args.run_id
    results_dir = run_dir / "results"
    rows = []
    for case in args.cases:
        case_rows = run_case(
            case,
            args.benchmarks,
            args.max_selectors,
            args.tree_depth,
            args.skip_tree,
            args.max_pair_primitives,
        )
        rows.extend(case_rows)
        exact = sum(1 for row in case_rows if row["exact"] == "1")
        best = max(case_rows, key=lambda row: int(row["matches"]))
        print(
            "{0} exact_rows={1} best={2} {3} {4}/{5}".format(
                case, exact, best["target"], best["family"], best["matches"], best["total_rows"]
            ),
            flush=True,
        )
    write_csv(results_dir / "paircount_piecewise_diagnostics.csv", FIELDS, rows)
    write_empty_frontend_csvs(results_dir)
    with (run_dir / "MANIFEST.md").open("w") as handle:
        handle.write("# {0}\n\n".format(args.run_id))
        handle.write("Diagnostic-only piecewise/min-max search for output adjacent-pair counts.\n\n")
        handle.write("Purpose: test whether pair-count fields can be compact comparator/min/max/clamp logic over input bucket counts and selector features.\n\n")
        handle.write("Inputs:\n")
        handle.write("- Cases: `{0}`\n".format(",".join(args.cases)))
        handle.write("- Tree depth: `{0}`\n".format(args.tree_depth))
        handle.write("- Script: `student/generators/unknown_paircount_piecewise_diag.py`\n\n")
        handle.write("Artifacts:\n")
        handle.write("- `results/paircount_piecewise_diagnostics.csv`\n")
        handle.write("- Empty frontend CSVs: `results/summary.csv`, `results/candidates.csv`, `results/best.csv`, `results/evaluate_check.csv`\n\n")
        exact = [row for row in rows if row["exact"] == "1"]
        if exact:
            handle.write("Notes:\n- Exact piecewise/min-max hit found; inspect diagnostics before RTL generation.\n")
        else:
            handle.write("Notes:\n- No exact compact piecewise pair-count formula found; no Verilog/AIG candidates emitted.\n")
        handle.write("- `student/seeds` and `output/` are intentionally untouched.\n")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
