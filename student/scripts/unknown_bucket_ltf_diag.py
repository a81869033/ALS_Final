#!/usr/bin/env python3
"""Bucket-count linear threshold diagnostics."""

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


def build_model_rows(case, benchmarks, max_selectors):
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
    vectors = []
    for counts, feature_values, output in base_rows:
        vector = [1]
        vector.extend(counts)
        vector.extend(feature_values[index] for index in selected)
        for left in range(len(counts)):
            for right in range(left + 1, len(counts)):
                vector.append(counts[left] - counts[right])
        vectors.append((vector, output))
    feature_names = ["bias"]
    feature_names.extend("cnt{0}".format(index) for index in range(len(buckets)))
    feature_names.extend("sel_{0}_{1}".format(pos, feature_name(features[index])) for pos, index in enumerate(selected))
    for left in range(len(buckets)):
        for right in range(left + 1, len(buckets)):
            feature_names.append("cnt{0}-cnt{1}".format(left, right))
    return table, selected, features, feature_names, vectors


def dot(weights, vector):
    total = 0
    for weight, value in zip(weights, vector):
        total += weight * value
    return total


def train_perceptron(vectors, bit, epochs):
    weights = [0] * len(vectors[0][0])
    best_weights = list(weights)
    best_match = -1
    for epoch in range(epochs):
        mistakes = 0
        for vector, output in vectors:
            label = 1 if ((output >> bit) & 1) else -1
            score = dot(weights, vector)
            if label * score <= 0:
                mistakes += 1
                for index, value in enumerate(vector):
                    weights[index] += label * value
        match = len(vectors) - mistakes
        if match > best_match:
            best_match = match
            best_weights = list(weights)
        if mistakes == 0:
            return best_weights, len(vectors), epoch + 1
    final_match = 0
    for vector, output in vectors:
        label = 1 if ((output >> bit) & 1) else -1
        if label * dot(best_weights, vector) > 0:
            final_match += 1
    return best_weights, final_match, epochs


def run_case(case, benchmarks, max_selectors, epochs):
    table, selected, selected_features, feature_names, vectors = build_model_rows(case, benchmarks, max_selectors)
    rows = []
    selected_text = ":".join(feature_name(selected_features[index]) for index in selected)
    for bit in range(table.output_width):
        weights, match, used_epochs = train_perceptron(vectors, bit, epochs)
        nonzero = sum(1 for weight in weights if weight)
        top_weights = sorted(
            [(abs(weight), feature_names[index], weight) for index, weight in enumerate(weights) if weight],
            reverse=True,
        )[:12]
        rows.append(
            {
                "case": case,
                "output_bit": bit,
                "input_width": table.input_width,
                "output_width": table.output_width,
                "selected_features": selected_text,
                "feature_count": len(feature_names),
                "nonzero_weights": nonzero,
                "matching_rows": match,
                "total_rows": len(vectors),
                "exact": "1" if match == len(vectors) else "0",
                "epochs": used_epochs,
                "top_weights": ";".join("{0}:{1}".format(name, weight) for _abs, name, weight in top_weights),
            }
        )
    return rows


def main(argv=None):
    parser = argparse.ArgumentParser()
    parser.add_argument("--cases", required=True)
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--max-selectors", type=int, default=8)
    parser.add_argument("--epochs", type=int, default=40)
    parser.add_argument("--results", type=Path, required=True)
    args = parser.parse_args(argv)

    rows = []
    for case in parse_cases(args.cases):
        rows.extend(run_case(case, args.benchmarks, args.max_selectors, args.epochs))
    fields = [
        "case",
        "output_bit",
        "input_width",
        "output_width",
        "selected_features",
        "feature_count",
        "nonzero_weights",
        "matching_rows",
        "total_rows",
        "exact",
        "epochs",
        "top_weights",
    ]
    args.results.parent.mkdir(parents=True, exist_ok=True)
    with args.results.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields)
        writer.writeheader()
        writer.writerows(rows)
    for case in sorted({row["case"] for row in rows}):
        case_rows = [row for row in rows if row["case"] == case]
        exact = sum(1 for row in case_rows if row["exact"] == "1")
        best = max(case_rows, key=lambda row: int(row["matching_rows"]))
        print("{0} exact_bits={1} best=bit{2} {3}/{4}".format(case, exact, best["output_bit"], best["matching_rows"], best["total_rows"]))
    print("rows={0} output={1}".format(len(rows), args.results))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
