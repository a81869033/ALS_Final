#!/usr/bin/env python3
"""Linear diagnostics for output adjacent-pair counts.

Component-pair orientation is cheap for some cases, but the pair-count fields
dominate.  This diagnostic checks whether those output pair-counts are compact
linear/affine functions of the exact input bucket-count state and selector
features.  It uses finite-field exactness as a strict gate: an integer affine
formula must also be exact modulo the tested prime.
"""

import argparse
import csv
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
    "feature_count",
    "prime",
    "exact",
    "rank",
    "pivots",
    "matches",
    "total_rows",
    "first_mismatch",
    "notes",
]


def output_pair_counts(value, width):
    counts = []
    for bit in range(0, width - 1, 2):
        counts.append(((value >> bit) & 1) + ((value >> (bit + 1)) & 1))
    if width & 1:
        counts.append((value >> (width - 1)) & 1)
    return tuple(counts)


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
    return table, outputs, buckets, features, selected, selected_names


def feature_vector(counts, selectors, family):
    vector = [1]
    if family in ("counts", "counts_selectors", "counts_selprod", "counts_quad", "counts_indicators"):
        vector.extend(counts)
    if family in ("counts_selectors", "counts_selprod", "counts_quad", "counts_indicators"):
        vector.extend(selectors)
    if family in ("counts_selprod", "counts_quad"):
        for count in counts:
            for selector in selectors:
                vector.append(count * selector)
    if family == "counts_quad":
        for left in range(len(counts)):
            for right in range(left, len(counts)):
                vector.append(counts[left] * counts[right])
    if family == "counts_indicators":
        for count in counts:
            for value in range(4):
                vector.append(1 if count == value else 0)
            for value in range(1, 4):
                vector.append(1 if count >= value else 0)
    if family == "prefix_selectors":
        total = 0
        for count in counts:
            total += count
            vector.append(total)
        vector.extend(selectors)
    if family == "prefix_mod_selectors":
        total = 0
        for count in counts:
            total += count
            vector.append(total & 1)
            vector.append(total % 3)
            vector.append(total % 4)
        vector.extend(selectors)
    return vector


def mod_inverse(value, prime):
    return pow(value % prime, prime - 2, prime)


def solve_mod(features, targets, prime):
    width = len(features[0])
    basis = {}
    pivot_cols = []
    for vector, target in zip(features, targets):
        row = [item % prime for item in vector] + [target % prime]
        while True:
            pivot = None
            for col in range(width):
                if row[col] % prime:
                    pivot = col
                    break
            if pivot is None:
                if row[width] % prime:
                    return False, len(pivot_cols), pivot_cols, None
                break
            if pivot not in basis:
                inv = mod_inverse(row[pivot], prime)
                row = [(value * inv) % prime for value in row]
                basis[pivot] = row
                pivot_cols.append(pivot)
                break
            factor = row[pivot] % prime
            row = [
                (value - factor * pivot_value) % prime
                for value, pivot_value in zip(row, basis[pivot])
            ]
    rank = len(pivot_cols)
    coeffs = [0] * width
    for col in sorted(pivot_cols, reverse=True):
        row = list(basis[col])
        value = row[width]
        for later_col in range(col + 1, width):
            value = (value - row[later_col] * coeffs[later_col]) % prime
        coeffs[col] = value
    return True, rank, pivot_cols, coeffs


def score(coeffs, features, targets, prime):
    matches = 0
    first = ""
    for index, (vector, target) in enumerate(zip(features, targets)):
        value = sum((coef * item) for coef, item in zip(coeffs, vector)) % prime
        if value == (target % prime):
            matches += 1
        elif not first:
            first = "row={0}:pred={1}:target={2}:target_mod={3}".format(
                index, value, target, target % prime
            )
    return matches, first


def run_case(case, benchmarks, max_selectors, prime):
    table, outputs, buckets, all_features, selected, selected_names = build_context(
        case, benchmarks, max_selectors
    )
    base_data = []
    for value in range(1 << table.input_width):
        counts = bucket_counts(value, buckets)
        selectors = tuple(feature_value(all_features[index], value) for index in selected)
        base_data.append((counts, selectors))
    pair_targets = [output_pair_counts(output, table.output_width) for output in outputs]
    target_count = len(pair_targets[0])
    families = [
        "counts",
        "counts_selectors",
        "prefix_selectors",
        "prefix_mod_selectors",
        "counts_selprod",
        "counts_quad",
        "counts_indicators",
    ]
    rows = []
    for family in families:
        feature_rows = [feature_vector(counts, selectors, family) for counts, selectors in base_data]
        for target_index in range(target_count):
            targets = [items[target_index] for items in pair_targets]
            ok, rank, pivots, coeffs = solve_mod(feature_rows, targets, prime)
            if ok:
                matches, first = score(coeffs, feature_rows, targets, prime)
            else:
                matches, first = 0, "inconsistent linear system"
            rows.append(
                {
                    "case": case,
                    "target": "pair_count_{0}".format(target_index),
                    "family": family,
                    "feature_count": len(feature_rows[0]),
                    "prime": prime,
                    "exact": "1" if ok and matches == len(outputs) else "0",
                    "rank": rank,
                    "pivots": len(pivots),
                    "matches": matches,
                    "total_rows": len(outputs),
                    "first_mismatch": first,
                    "notes": "buckets={0}; selectors={1}".format(len(buckets), selected_names),
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
    parser.add_argument("--prime", type=int, default=101)
    return parser.parse_args(argv)


def main(argv=None):
    args = parse_args(argv)
    run_dir = ROOT / "student" / "runs" / "unknown" / args.run_id
    results_dir = run_dir / "results"
    rows = []
    for case in args.cases:
        case_rows = run_case(case, args.benchmarks, args.max_selectors, args.prime)
        rows.extend(case_rows)
        exact = sum(1 for row in case_rows if row["exact"] == "1")
        best = max(case_rows, key=lambda row: int(row["matches"]))
        print(
            "{0} exact={1}/{2} best={3} {4} {5}/{6}".format(
                case,
                exact,
                len(case_rows),
                best["target"],
                best["family"],
                best["matches"],
                best["total_rows"],
            ),
            flush=True,
        )
    write_csv(results_dir / "paircount_linear_diagnostics.csv", FIELDS, rows)
    write_empty_frontend_csvs(results_dir)
    with (run_dir / "MANIFEST.md").open("w") as handle:
        handle.write("# {0}\n\n".format(args.run_id))
        handle.write("Diagnostic-only finite-field linear search for output adjacent-pair counts.\n\n")
        handle.write("Purpose: test whether the pair-count half of component output encoding is a compact affine/integer function of input bucket counts and selector features.\n\n")
        handle.write("Inputs:\n")
        handle.write("- Cases: `{0}`\n".format(",".join(args.cases)))
        handle.write("- Prime: `{0}`\n".format(args.prime))
        handle.write("- Script: `student/generators/unknown_paircount_linear_diag.py`\n\n")
        handle.write("Artifacts:\n")
        handle.write("- `results/paircount_linear_diagnostics.csv`\n")
        handle.write("- Empty frontend CSVs: `results/summary.csv`, `results/candidates.csv`, `results/best.csv`, `results/evaluate_check.csv`\n\n")
        exact = [row for row in rows if row["exact"] == "1"]
        if exact:
            handle.write("Notes:\n- Exact finite-field linear hit found; inspect before RTL generation.\n")
        else:
            handle.write("Notes:\n- No exact finite-field linear pair-count formula found; no Verilog/AIG candidates emitted.\n")
        handle.write("- `student/seeds` and `output/` are intentionally untouched.\n")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
