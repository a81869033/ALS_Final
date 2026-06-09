#!/usr/bin/env python3
"""Insertion-delta diagnostics for conservative unknown truth tables."""

import argparse
import csv
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from student.frontends.truth import TruthTable
from student.generators.unknown_bdd_search import (
    SharedBddBuilder,
    permute_plane,
    plane_for_outputs,
)
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


def hist_text(items):
    counts = {}
    for item in items:
        counts[item] = counts.get(item, 0) + 1
    return ";".join("{0}:{1}".format(key, counts[key]) for key in sorted(counts))


def majority_stats(pairs):
    buckets = {}
    for key, value in pairs:
        hist = buckets.setdefault(key, {})
        hist[value] = hist.get(value, 0) + 1
    conflicts = sum(1 for hist in buckets.values() if len(hist) > 1)
    majority = sum(max(hist.values()) for hist in buckets.values())
    max_fanout = max((len(hist) for hist in buckets.values()), default=0)
    return len(buckets), conflicts, majority, max_fanout


def compact_index(index, width, removed_bit):
    out = 0
    pos = 0
    for bit in range(width):
        if bit == removed_bit:
            continue
        if (index >> bit) & 1:
            out |= 1 << pos
        pos += 1
    return out


def delta_values_for_insert(outputs, width, insert_bit):
    count = 1 << (width - 1)
    values = [0] * count
    transitions = []
    bit = 1 << insert_bit
    for index in range(1 << width):
        if index & bit:
            continue
        compact = compact_index(index, width, insert_bit)
        before = outputs[index]
        after = outputs[index | bit]
        delta = before ^ after
        values[compact] = delta
        transitions.append((index, before, after, delta))
    return values, transitions


def bdd_node_sum(values, input_width, output_width):
    order = list(range(input_width))
    builder = SharedBddBuilder(order)
    roots = []
    for bit in range(output_width):
        roots.append(builder.build(permute_plane(plane_for_outputs(values, bit), order), 0))
    return len(builder.nodes)


def selected_bucket_model(case, outputs, width):
    buckets = bucket_info(onehot_slots(outputs, width))
    features = feature_candidates(case, width)
    rows = []
    for value, output in enumerate(outputs):
        rows.append(
            (
                bucket_counts(value, buckets),
                tuple(feature_value(feature, value) for feature in features),
                output,
            )
        )
    selected, _trace = greedy_selectors(rows, features, len(outputs), 8)
    return buckets, features, selected


def run_case(case, benchmarks):
    table = TruthTable(benchmarks / "{0}.truth".format(case))
    outputs = list(table.iter_outputs())
    width = table.input_width
    buckets, features, selected = selected_bucket_model(case, outputs, width)
    selected_names = [feature_name(features[index]) for index in selected]
    rows = []
    for insert_bit in range(width):
        values, transitions = delta_values_for_insert(outputs, width, insert_bit)
        delta_pops = [popcount(delta) for _index, _before, _after, delta in transitions]
        unique_deltas = len(set(delta for _index, _before, _after, delta in transitions))
        majority_delta = max(
            (delta_pops.count(value), value) for value in set(delta_pops)
        )[0]

        before_pairs = [(before, delta) for _index, before, _after, delta in transitions]
        before_keys, before_conflicts, before_majority, before_max_fanout = majority_stats(before_pairs)

        before_layer_pairs = [
            ((before, popcount(index)), delta)
            for index, before, _after, delta in transitions
        ]
        layer_keys, layer_conflicts, layer_majority, layer_max_fanout = majority_stats(before_layer_pairs)

        bucket_pairs = []
        for index, before, _after, delta in transitions:
            counts = bucket_counts(index, buckets)
            selectors = tuple(feature_value(features[item], index) for item in selected)
            bucket_pairs.append(((before, counts, selectors), delta))
        bucket_keys, bucket_conflicts, bucket_majority, bucket_max_fanout = majority_stats(bucket_pairs)

        delta_nodes = bdd_node_sum(values, width - 1, width)
        rows.append(
            {
                "case": case,
                "insert_bit": insert_bit,
                "input_width": width,
                "transition_count": len(transitions),
                "unique_deltas": unique_deltas,
                "delta_popcount_hist": hist_text(delta_pops),
                "majority_delta_popcount_match": majority_delta,
                "before_output_keys": before_keys,
                "before_output_conflicts": before_conflicts,
                "before_output_majority_match": before_majority,
                "before_output_max_delta_fanout": before_max_fanout,
                "before_layer_keys": layer_keys,
                "before_layer_conflicts": layer_conflicts,
                "before_layer_majority_match": layer_majority,
                "before_layer_max_delta_fanout": layer_max_fanout,
                "bucket_state_keys": bucket_keys,
                "bucket_state_conflicts": bucket_conflicts,
                "bucket_state_majority_match": bucket_majority,
                "bucket_state_max_delta_fanout": bucket_max_fanout,
                "delta_bdd_nodes": delta_nodes,
                "delta_bdd_output_width": width,
                "selected_features": ":".join(selected_names),
            }
        )
        print(
            "{0} insert{1} unique_delta={2} before_conflicts={3} bucket_conflicts={4} bdd_nodes={5}".format(
                case,
                insert_bit,
                unique_deltas,
                before_conflicts,
                bucket_conflicts,
                delta_nodes,
            ),
            flush=True,
        )
    return rows


def write_csv(path, rows):
    path.parent.mkdir(parents=True, exist_ok=True)
    fields = [
        "case",
        "insert_bit",
        "input_width",
        "transition_count",
        "unique_deltas",
        "delta_popcount_hist",
        "majority_delta_popcount_match",
        "before_output_keys",
        "before_output_conflicts",
        "before_output_majority_match",
        "before_output_max_delta_fanout",
        "before_layer_keys",
        "before_layer_conflicts",
        "before_layer_majority_match",
        "before_layer_max_delta_fanout",
        "bucket_state_keys",
        "bucket_state_conflicts",
        "bucket_state_majority_match",
        "bucket_state_max_delta_fanout",
        "delta_bdd_nodes",
        "delta_bdd_output_width",
        "selected_features",
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
    return parser.parse_args()


def main():
    args = parse_args()
    rows = []
    for case in args.cases:
        rows.extend(run_case(case, args.benchmarks))
        write_csv(args.results, rows)
    print("rows={0} output={1}".format(len(rows), args.results))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
