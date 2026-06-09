#!/usr/bin/env python3
"""Linear-threshold diagnostics for conservative unknown cases."""

import argparse
import csv
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from student.frontends.truth import TruthTable


def parse_cases(text):
    return [item.strip() for item in text.split(",") if item.strip()]


def pairs_for_case(case):
    return {
        "ex286": [(4, 5), (6, 7)],
        "ex287": [(4, 5), (6, 7), (8, 9)],
        "ex288": [(4, 5), (6, 7), (8, 9)],
        "ex289": [(4, 5), (6, 7), (8, 9), (10, 11)],
    }.get(case, [])


def feature_raw(index, width):
    return [1] + [1 if (index >> bit) & 1 else 0 for bit in range(width)]


def feature_raw_pm(index, width):
    return [1] + [1 if (index >> bit) & 1 else -1 for bit in range(width)]


def feature_symkey(index, width, pairs, plus_minus):
    values = [1]
    used = set()
    for left, right in pairs:
        left_bit = (index >> left) & 1
        right_bit = (index >> right) & 1
        used.add(left)
        used.add(right)
        pair_values = [left_bit | right_bit, left_bit & right_bit]
        if plus_minus:
            pair_values = [1 if value else -1 for value in pair_values]
        values.extend(pair_values)
    for bit in range(width):
        if bit in used:
            continue
        value = (index >> bit) & 1
        values.append(1 if value else (-1 if plus_minus else 0))
    return values


def build_features(case, width, mode):
    pairs = pairs_for_case(case)
    out = []
    for index in range(1 << width):
        if mode == "raw01":
            out.append(feature_raw(index, width))
        elif mode == "rawpm":
            out.append(feature_raw_pm(index, width))
        elif mode == "symkey01":
            out.append(feature_symkey(index, width, pairs, False))
        elif mode == "symkeypm":
            out.append(feature_symkey(index, width, pairs, True))
        else:
            raise RuntimeError("unknown feature mode {0}".format(mode))
    return out


def dot(weights, features):
    total = 0
    for weight, value in zip(weights, features):
        total += weight * value
    return total


def train_ltf(features, labels, max_epochs):
    weights = [0] * len(features[0])
    best_weights = list(weights)
    best_match = -1
    rows = len(features)
    for epoch in range(max_epochs):
        mistakes = 0
        for vector, label in zip(features, labels):
            score = dot(weights, vector)
            if label * score <= 0:
                mistakes += 1
                for idx, value in enumerate(vector):
                    weights[idx] += label * value
        match = rows - mistakes
        if match > best_match:
            best_match = match
            best_weights = list(weights)
        if mistakes == 0:
            return best_weights, rows, epoch + 1
    final_match = sum(1 for vector, label in zip(features, labels) if label * dot(best_weights, vector) > 0)
    return best_weights, final_match, max_epochs


def run_case(case, benchmarks, modes, max_epochs):
    table = TruthTable(benchmarks / "{0}.truth".format(case))
    outputs = list(table.iter_outputs())
    rows = []
    feature_cache = {}
    for mode in modes:
        feature_cache[mode] = build_features(case, table.input_width, mode)
    for bit in range(table.output_width):
        labels = [1 if (value >> bit) & 1 else -1 for value in outputs]
        for mode in modes:
            weights, match, epochs = train_ltf(feature_cache[mode], labels, max_epochs)
            rows.append(
                {
                    "case": case,
                    "output_bit": bit,
                    "input_width": table.input_width,
                    "feature_mode": mode,
                    "matching_rows": match,
                    "total_rows": len(outputs),
                    "exact": "1" if match == len(outputs) else "0",
                    "epochs": epochs,
                    "weights": ":".join(str(weight) for weight in weights),
                }
            )
    return rows


def main(argv=None):
    parser = argparse.ArgumentParser()
    parser.add_argument("--cases", required=True)
    parser.add_argument("--modes", default="raw01,rawpm,symkey01,symkeypm")
    parser.add_argument("--max-epochs", type=int, default=20)
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--results", type=Path, required=True)
    args = parser.parse_args(argv)
    modes = [item.strip() for item in args.modes.split(",") if item.strip()]

    rows = []
    for case in parse_cases(args.cases):
        rows.extend(run_case(case, args.benchmarks, modes, args.max_epochs))
    args.results.parent.mkdir(parents=True, exist_ok=True)
    fields = [
        "case",
        "output_bit",
        "input_width",
        "feature_mode",
        "matching_rows",
        "total_rows",
        "exact",
        "epochs",
        "weights",
    ]
    with args.results.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields)
        writer.writeheader()
        writer.writerows(rows)
    for row in rows:
        if row["exact"] == "1":
            print("{case} bit{output_bit} exact {feature_mode}".format(**row))
    print("rows={0} output={1}".format(len(rows), args.results))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
