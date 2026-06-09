#!/usr/bin/env python3
"""Diagnose bucket-count top-k score models for conservative unknown cases."""

import argparse
import csv
import random
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
)


def parse_cases(text):
    return [item.strip() for item in text.split(",") if item.strip()]


def popcount(value):
    return bin(value).count("1")


def output_bits(value, width):
    return set(bit for bit in range(width) if (value >> bit) & 1)


def build_rows(case, benchmarks, feature_mode):
    table = TruthTable(benchmarks / "{0}.truth".format(case))
    outputs = list(table.iter_outputs())
    width = table.input_width
    buckets = bucket_info(onehot_slots(outputs, width))
    all_features = feature_candidates(case, width)
    selector_rows = []
    for value, output in enumerate(outputs):
        selector_rows.append(
            (
                bucket_counts(value, buckets),
                tuple(feature_value(feature, value) for feature in all_features),
                output,
            )
        )
    selected, _trace = greedy_selectors(selector_rows, all_features, len(outputs), 8)
    selector_names = [feature_name(all_features[index]) for index in selected]

    rows = []
    for value, output in enumerate(outputs):
        counts = bucket_counts(value, buckets)
        selectors = [feature_value(all_features[index], value) for index in selected]
        features = [1]
        names = ["bias"]
        if feature_mode in ("counts", "counts_selectors", "counts_selectors_quad"):
            for index, count in enumerate(counts):
                features.append(count)
                names.append("cnt{0}".format(index))
        if feature_mode in ("counts_selectors", "counts_selectors_quad"):
            for index, selector in enumerate(selectors):
                features.append(selector)
                names.append("sel{0}_{1}".format(index, selector_names[index]))
        if feature_mode == "counts_selectors_quad":
            for left in range(len(counts)):
                for right in range(left, len(counts)):
                    features.append(counts[left] * counts[right])
                    names.append("cnt{0}cnt{1}".format(left, right))
            for count_index, count in enumerate(counts):
                for selector_index, selector in enumerate(selectors):
                    features.append(count * selector)
                    names.append("cnt{0}sel{1}".format(count_index, selector_index))
        rows.append((features, output_bits(output, width), popcount(value), output))
    return table, buckets, selector_names, names, rows


def dot(weights, features):
    return sum(weight * feature for weight, feature in zip(weights, features))


def predict(weights_by_bit, features, k):
    scores = []
    for bit, weights in enumerate(weights_by_bit):
        scores.append((dot(weights, features), -bit, bit))
    scores.sort(reverse=True)
    value = 0
    for _score, _neg_bit, bit in scores[:k]:
        value |= 1 << bit
    return value


def evaluate(weights_by_bit, rows):
    exact = 0
    bit_mismatches = 0
    total_bits = 0
    for features, _out_set, k, output in rows:
        predicted = predict(weights_by_bit, features, k)
        if predicted == output:
            exact += 1
        bit_mismatches += popcount(predicted ^ output)
        total_bits += len(weights_by_bit)
    return exact, bit_mismatches, total_bits


def train(width, feature_count, rows, epochs, seed, learning_rate):
    rng = random.Random(seed)
    weights = [[0] * feature_count for _ in range(width)]
    order = list(range(len(rows)))
    best = None
    best_weights = None
    for epoch in range(epochs):
        rng.shuffle(order)
        for row_index in order:
            features, out_set, k, _output = rows[row_index]
            scores = [(dot(weights[bit], features), -bit, bit) for bit in range(width)]
            scores.sort(reverse=True)
            predicted = set(bit for _score, _neg_bit, bit in scores[:k])
            missing = sorted(out_set - predicted)
            extra = sorted(predicted - out_set)
            for good, bad in zip(missing, extra):
                for index, feature in enumerate(features):
                    delta = learning_rate * feature
                    weights[good][index] += delta
                    weights[bad][index] -= delta
        exact, bit_mismatches, total_bits = evaluate(weights, rows)
        score = (exact, -bit_mismatches)
        if best is None or score > best:
            best = score
            best_weights = [item[:] for item in weights]
    exact, bit_mismatches, total_bits = evaluate(best_weights, rows)
    return best_weights, exact, bit_mismatches, total_bits


def run_case(case, args, result_rows):
    out_rows = []
    for feature_mode in args.feature_modes:
        table, buckets, selector_names, feature_names, data_rows = build_rows(
            case, args.benchmarks, feature_mode
        )
        best = None
        for seed in range(args.seeds):
            _weights, exact, bit_mismatches, total_bits = train(
                table.input_width,
                len(feature_names),
                data_rows,
                args.epochs,
                args.seed_base + seed,
                args.learning_rate,
            )
            item = (exact, -bit_mismatches, seed)
            if best is None or item > best:
                best = item
        exact, neg_bit_mismatches, best_seed = best
        bit_mismatches = -neg_bit_mismatches
        out_rows.append(
            {
                "case": case,
                "input_width": table.input_width,
                "bucket_count": len(buckets),
                "selected_features": ":".join(selector_names),
                "feature_mode": feature_mode,
                "feature_count": len(feature_names),
                "epochs": args.epochs,
                "seeds": args.seeds,
                "best_seed": best_seed,
                "exact_rows": exact,
                "total_rows": len(data_rows),
                "row_match_ratio": "{0:.6f}".format(float(exact) / float(len(data_rows))),
                "bit_mismatches": bit_mismatches,
                "total_bits": len(data_rows) * table.input_width,
                "bit_match_ratio": "{0:.6f}".format(
                    1.0 - float(bit_mismatches) / float(len(data_rows) * table.input_width)
                ),
                "notes": "linear top-k score over exact bucket-count features",
            }
        )
        result_rows.extend(out_rows[-1:])
        write_csv(args.results, result_rows)
        print(
            "{0} {1} exact={2}/{3} bit_mis={4}".format(
                case, feature_mode, exact, len(data_rows), bit_mismatches
            ),
            flush=True,
        )
    return out_rows


def write_csv(path, rows):
    path.parent.mkdir(parents=True, exist_ok=True)
    if rows:
        fields = list(rows[0].keys())
    else:
        fields = [
            "case",
            "input_width",
            "bucket_count",
            "selected_features",
            "feature_mode",
            "feature_count",
            "epochs",
            "seeds",
            "best_seed",
            "exact_rows",
            "total_rows",
            "row_match_ratio",
            "bit_mismatches",
            "total_bits",
            "bit_match_ratio",
            "notes",
        ]
    with path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields)
        writer.writeheader()
        writer.writerows(rows)


def parse_args():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--cases", type=parse_cases, required=True)
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--results", type=Path, required=True)
    parser.add_argument(
        "--feature-modes",
        type=parse_cases,
        default=parse_cases("counts,counts_selectors,counts_selectors_quad"),
    )
    parser.add_argument("--epochs", type=int, default=16)
    parser.add_argument("--seeds", type=int, default=4)
    parser.add_argument("--seed-base", type=int, default=1000)
    parser.add_argument("--learning-rate", type=int, default=1)
    return parser.parse_args()


def main():
    args = parse_args()
    rows = []
    for case in args.cases:
        run_case(case, args, rows)
    write_csv(args.results, rows)
    print("rows={0} output={1}".format(len(rows), args.results))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
