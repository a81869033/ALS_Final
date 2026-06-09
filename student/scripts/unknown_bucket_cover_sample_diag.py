#!/usr/bin/env python3
"""Sampled cube-expansion diagnostics for bucket-count key functions."""

import argparse
import csv
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from student.generators.unknown_bucket_count_classifier import (
    bucket_counts,
    bucket_info,
    build_mapping,
    feature_candidates,
    feature_name,
    feature_value,
    greedy_selectors,
    onehot_slots,
    parse_cases,
)
from student.frontends.truth import TruthTable


def popcount(value):
    return bin(value).count("1")


def cube_intersects(care, value, keys):
    for key in keys:
        if (key & care) == value:
            return True
    return False


def cube_cover_count(care, value, keys):
    count = 0
    for key in keys:
        if (key & care) == value:
            count += 1
    return count


def expand(seed, off_keys, key_width, order):
    care = (1 << key_width) - 1
    value = seed
    for bit in order:
        new_care = care & ~(1 << bit)
        new_value = value & new_care
        if not cube_intersects(new_care, new_value, off_keys):
            care = new_care
            value = new_value
    return care, value


def sample_keys(keys, limit):
    ordered = sorted(keys)
    if len(ordered) <= limit:
        return ordered
    out = []
    for idx in range(limit):
        out.append(ordered[(idx * (len(ordered) - 1)) // (limit - 1)])
    return sorted(set(out))


def build_case(case, benchmarks, max_selectors):
    table = TruthTable(benchmarks / "{0}.truth".format(case))
    outputs = list(table.iter_outputs())
    onehot = onehot_slots(outputs, table.input_width)
    buckets = bucket_info(onehot)
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
    mapping = build_mapping(outputs, buckets, features, selected)
    key_width = sum(bucket[2] for bucket in buckets) + len(selected)
    return table, features, selected, mapping, key_width


def run_case(case, benchmarks, max_selectors, sample_limit):
    table, features, selected, mapping, key_width = build_case(case, benchmarks, max_selectors)
    orders = {
        "lsb": list(range(key_width)),
        "msb": list(reversed(range(key_width))),
        "middle": sorted(range(key_width), key=lambda bit: (abs(bit - (key_width - 1) / 2.0), bit)),
    }
    reachable = set(mapping)
    rows = []
    for bit in range(table.output_width):
        on_keys = {key for key, output in mapping.items() if (output >> bit) & 1}
        off_keys = reachable - on_keys
        seeds = sample_keys(on_keys, sample_limit)
        for order_name, order in orders.items():
            best_cover = 0
            best_literals = key_width
            total_cover = 0
            for seed in seeds:
                care, value = expand(seed, off_keys, key_width, order)
                cover = cube_cover_count(care, value, on_keys)
                literals = popcount(care)
                total_cover += cover
                if cover > best_cover or (cover == best_cover and literals < best_literals):
                    best_cover = cover
                    best_literals = literals
            lower_bound = (len(on_keys) + best_cover - 1) // best_cover if best_cover else 0
            rows.append(
                {
                    "case": case,
                    "output_bit": bit,
                    "order_name": order_name,
                    "input_width": table.input_width,
                    "output_width": table.output_width,
                    "selected_features": ":".join(feature_name(features[index]) for index in selected),
                    "key_width": key_width,
                    "mapped_keys": len(mapping),
                    "on_keys": len(on_keys),
                    "off_keys": len(off_keys),
                    "sampled_on_keys": len(seeds),
                    "best_cube_on_cover": best_cover,
                    "best_cube_literals": best_literals,
                    "best_cube_free_bits": key_width - best_literals,
                    "avg_sample_cover": "{0:.3f}".format(float(total_cover) / len(seeds)) if seeds else "0.000",
                    "cube_count_lower_bound": lower_bound,
                }
            )
    return rows


def main(argv=None):
    parser = argparse.ArgumentParser()
    parser.add_argument("--cases", required=True)
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--max-selectors", type=int, default=8)
    parser.add_argument("--sample-limit", type=int, default=256)
    parser.add_argument("--results", type=Path, required=True)
    args = parser.parse_args(argv)

    rows = []
    for case in parse_cases(args.cases):
        rows.extend(run_case(case, args.benchmarks, args.max_selectors, args.sample_limit))
    fields = [
        "case",
        "output_bit",
        "order_name",
        "input_width",
        "output_width",
        "selected_features",
        "key_width",
        "mapped_keys",
        "on_keys",
        "off_keys",
        "sampled_on_keys",
        "best_cube_on_cover",
        "best_cube_literals",
        "best_cube_free_bits",
        "avg_sample_cover",
        "cube_count_lower_bound",
    ]
    args.results.parent.mkdir(parents=True, exist_ok=True)
    with args.results.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields)
        writer.writeheader()
        writer.writerows(rows)
    for case in sorted({row["case"] for row in rows}):
        best = max([row for row in rows if row["case"] == case], key=lambda row: int(row["best_cube_on_cover"]))
        print(
            "{case} best bit{output_bit} order={order_name} cover={best_cube_on_cover} literals={best_cube_literals} lower_bound={cube_count_lower_bound}".format(
                **best
            )
        )
    print("rows={0} output={1}".format(len(rows), args.results))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
