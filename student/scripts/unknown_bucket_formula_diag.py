#!/usr/bin/env python3
"""Formula diagnostics for exact bucket-count decompositions."""

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
    build_mapping,
    encode_key,
    feature_candidates,
    feature_name,
    feature_value,
    greedy_selectors,
    onehot_slots,
    parse_cases,
)


def popcount(value):
    return bin(value).count("1")


def degree(value):
    return popcount(value)


def anf_stats(values, width, output_width):
    stats = []
    size = 1 << width
    for bit in range(output_width):
        plane = [1 if (value >> bit) & 1 else 0 for value in values]
        step = 1
        while step < size:
            jump = step << 1
            for base in range(0, size, jump):
                for offset in range(step):
                    plane[base + step + offset] ^= plane[base + offset]
            step = jump
        terms = 0
        max_degree = 0
        degree_hist = {}
        for mask, coeff in enumerate(plane):
            if not coeff:
                continue
            terms += 1
            deg = degree(mask)
            max_degree = max(max_degree, deg)
            degree_hist[deg] = degree_hist.get(deg, 0) + 1
        stats.append((bit, terms, max_degree, degree_hist))
    return stats


def make_feature_masks(case, outputs, buckets, selected_features, all_features):
    width = len(buckets)
    row_count = len(outputs)
    masks = []
    feature_names = []
    count_values = []
    selector_values = []
    for row in range(row_count):
        count_values.append(bucket_counts(row, buckets))
        selector_values.append([feature_value(all_features[index], row) for index in selected_features])

    for bucket_index, (_slot, members, _bits) in enumerate(buckets):
        max_count = len(members)
        for value in range(max_count + 1):
            mask = 0
            for row, counts in enumerate(count_values):
                if counts[bucket_index] == value:
                    mask |= 1 << row
            masks.append(mask)
            feature_names.append("cnt{0}=={1}".format(bucket_index, value))
        for value in range(1, max_count + 1):
            mask = 0
            for row, counts in enumerate(count_values):
                if counts[bucket_index] >= value:
                    mask |= 1 << row
            masks.append(mask)
            feature_names.append("cnt{0}>={1}".format(bucket_index, value))
        if max_count >= 2:
            mask = 0
            for row, counts in enumerate(count_values):
                if counts[bucket_index] & 1:
                    mask |= 1 << row
            masks.append(mask)
            feature_names.append("cnt{0}_odd".format(bucket_index))

    for idx, feature_index in enumerate(selected_features):
        mask = 0
        for row, selectors in enumerate(selector_values):
            if selectors[idx]:
                mask |= 1 << row
        masks.append(mask)
        feature_names.append("sel_{0}_{1}".format(idx, feature_name(all_features[feature_index])))

    for left in range(len(buckets)):
        for right in range(left + 1, len(buckets)):
            for op in (">=", "=="):
                mask = 0
                for row, counts in enumerate(count_values):
                    if op == ">=":
                        ok = counts[left] >= counts[right]
                    else:
                        ok = counts[left] == counts[right]
                    if ok:
                        mask |= 1 << row
                masks.append(mask)
                feature_names.append("cnt{0}{1}cnt{2}".format(left, op, right))
    return feature_names, masks


def target_mask(outputs, bit):
    mask = 0
    for row, output in enumerate(outputs):
        if (output >> bit) & 1:
            mask |= 1 << row
    return mask


def best_single(features, masks, target, all_rows, row_count):
    best = None
    for name, mask in zip(features, masks):
        for inverted in (False, True):
            candidate = mask ^ all_rows if inverted else mask
            match = row_count - popcount(candidate ^ target)
            item = (match, name, inverted)
            if best is None or item > best:
                best = item
    return best


def greedy_tree_search(features, masks, target, all_rows, max_depth):
    def recurse(rows_mask, depth):
        if rows_mask == 0:
            return True, 0
        ones = popcount(rows_mask & target)
        total = popcount(rows_mask)
        if ones == 0 or ones == total:
            return True, 1
        if depth == 0:
            return False, 1
        best = None
        for mask in masks:
            left = rows_mask & mask
            right = rows_mask & (all_rows ^ mask)
            if left == 0 or right == 0:
                continue
            left_ones = popcount(left & target)
            right_ones = popcount(right & target)
            left_total = popcount(left)
            right_total = popcount(right)
            majority = max(left_ones, left_total - left_ones) + max(right_ones, right_total - right_ones)
            balance = min(left_total, right_total)
            candidate = (majority, balance, mask)
            if best is None or candidate > best:
                best = candidate
        if best is None:
            return False, 1
        mask = best[2]
        left_exact, left_leaves = recurse(rows_mask & mask, depth - 1)
        right_exact, right_leaves = recurse(rows_mask & (all_rows ^ mask), depth - 1)
        return left_exact and right_exact, left_leaves + right_leaves

    return recurse(all_rows, max_depth)


def run_case(case, benchmarks, max_selectors, tree_depth):
    table = TruthTable(benchmarks / "{0}.truth".format(case))
    outputs = list(table.iter_outputs())
    onehot = onehot_slots(outputs, table.input_width)
    buckets = bucket_info(onehot)
    all_features = feature_candidates(case, table.input_width)
    row_data = []
    for row, output in enumerate(outputs):
        row_data.append(
            (
                bucket_counts(row, buckets),
                tuple(feature_value(feature, row) for feature in all_features),
                output,
            )
        )
    selected, trace = greedy_selectors(row_data, all_features, len(outputs), max_selectors)
    mapping = build_mapping(outputs, buckets, all_features, selected)
    key_width = sum(bucket[2] for bucket in buckets) + len(selected)
    key_outputs = [0] * (1 << key_width)
    for key, output in mapping.items():
        key_outputs[key] = output

    features, masks = make_feature_masks(case, outputs, buckets, selected, all_features)
    all_rows = (1 << len(outputs)) - 1
    anf_by_bit = {bit: (terms, max_degree, degree_hist) for bit, terms, max_degree, degree_hist in anf_stats(key_outputs, key_width, table.output_width)}

    rows = []
    for bit in range(table.output_width):
        target = target_mask(outputs, bit)
        match, feature, inverted = best_single(features, masks, target, all_rows, len(outputs))
        exact_tree, leaves = greedy_tree_search(features, masks, target, all_rows, tree_depth)
        terms, max_degree, degree_hist = anf_by_bit[bit]
        rows.append(
            {
                "case": case,
                "output_bit": bit,
                "input_width": table.input_width,
                "bucket_count": len(buckets),
                "selected_features": ":".join(feature_name(all_features[index]) for index in selected),
                "key_width": key_width,
                "mapped_keys": len(mapping),
                "primitive_count": len(features),
                "best_single": feature,
                "best_single_inverted": "1" if inverted else "0",
                "best_single_match": match,
                "total_rows": len(outputs),
                "best_single_exact": "1" if match == len(outputs) else "0",
                "tree_depth": tree_depth,
                "tree_exact": "1" if exact_tree else "0",
                "tree_leaves": leaves,
                "key_anf_terms": terms,
                "key_anf_max_degree": max_degree,
                "key_anf_degree_hist": ";".join("{0}:{1}".format(deg, degree_hist[deg]) for deg in sorted(degree_hist)),
            }
        )
    return rows


def main(argv=None):
    parser = argparse.ArgumentParser()
    parser.add_argument("--cases", required=True)
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--max-selectors", type=int, default=8)
    parser.add_argument("--tree-depth", type=int, default=4)
    parser.add_argument("--results", type=Path, required=True)
    args = parser.parse_args(argv)

    rows = []
    for case in parse_cases(args.cases):
        rows.extend(run_case(case, args.benchmarks, args.max_selectors, args.tree_depth))
    fields = [
        "case",
        "output_bit",
        "input_width",
        "bucket_count",
        "selected_features",
        "key_width",
        "mapped_keys",
        "primitive_count",
        "best_single",
        "best_single_inverted",
        "best_single_match",
        "total_rows",
        "best_single_exact",
        "tree_depth",
        "tree_exact",
        "tree_leaves",
        "key_anf_terms",
        "key_anf_max_degree",
        "key_anf_degree_hist",
    ]
    args.results.parent.mkdir(parents=True, exist_ok=True)
    with args.results.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields)
        writer.writeheader()
        writer.writerows(rows)
    for case in sorted({row["case"] for row in rows}):
        case_rows = [row for row in rows if row["case"] == case]
        exact_single = sum(1 for row in case_rows if row["best_single_exact"] == "1")
        exact_tree = sum(1 for row in case_rows if row["tree_exact"] == "1")
        min_terms = min(int(row["key_anf_terms"]) for row in case_rows)
        max_terms = max(int(row["key_anf_terms"]) for row in case_rows)
        print(
            "{0} exact_single_bits={1} exact_tree_bits={2} anf_terms_range={3}..{4}".format(
                case, exact_single, exact_tree, min_terms, max_terms
            )
        )
    print("rows={0} output={1}".format(len(rows), args.results))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
