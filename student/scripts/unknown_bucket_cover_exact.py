#!/usr/bin/env python3
"""Bitset exact greedy cube-cover diagnostics for bucket-count key functions."""

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
    feature_candidates,
    feature_name,
    feature_value,
    greedy_selectors,
    onehot_slots,
    parse_cases,
)


def popcount(value):
    return bin(value).count("1")


def literal_masks(width):
    universe = 1 << width
    zero = []
    one = []
    for bit in range(width):
        z = 0
        o = 0
        for key in range(universe):
            if (key >> bit) & 1:
                o |= 1 << key
            else:
                z |= 1 << key
        zero.append(z)
        one.append(o)
    return zero, one


def cube_mask(care, value, width, zero_masks, one_masks, cache):
    key = (care, value)
    if key in cache:
        return cache[key]
    mask = (1 << (1 << width)) - 1
    for bit in range(width):
        if (care >> bit) & 1:
            mask &= one_masks[bit] if ((value >> bit) & 1) else zero_masks[bit]
    cache[key] = mask
    return mask


def expand_cube(seed, off_mask, width, order, zero_masks, one_masks, cache):
    care = (1 << width) - 1
    value = seed
    current = cube_mask(care, value, width, zero_masks, one_masks, cache)
    for bit in order:
        new_care = care & ~(1 << bit)
        new_value = value & new_care
        new_mask = cube_mask(new_care, new_value, width, zero_masks, one_masks, cache)
        if not (new_mask & off_mask):
            care = new_care
            value = new_value
            current = new_mask
    return care, value, current


def key_set_mask(keys):
    mask = 0
    for key in keys:
        mask |= 1 << key
    return mask


def representative_keys(mask):
    out = []
    while mask:
        low = mask & -mask
        out.append(low.bit_length() - 1)
        mask ^= low
    return out


def exact_greedy_cover(on_keys, off_keys, width, order, max_candidates):
    zero_masks, one_masks = literal_masks(width)
    cache = {}
    on_mask = key_set_mask(on_keys)
    off_mask = key_set_mask(off_keys)
    seeds = sorted(on_keys)
    if max_candidates and len(seeds) > max_candidates:
        step = float(len(seeds) - 1) / float(max_candidates - 1)
        seeds = [seeds[int(round(index * step))] for index in range(max_candidates)]
        seeds = sorted(set(seeds))
    candidates = {}
    for seed in seeds:
        care, value, mask = expand_cube(seed, off_mask, width, order, zero_masks, one_masks, cache)
        cover = mask & on_mask
        if cover:
            candidates[(care, value)] = cover
    uncovered = on_mask
    cubes = []
    while uncovered:
        best = None
        best_cover = 0
        for cube, cover in candidates.items():
            useful = cover & uncovered
            count = popcount(useful)
            if count > best_cover or (
                count == best_cover and best is not None and popcount(cube[0]) < popcount(best[0])
            ):
                best = cube
                best_cover = count
        if not best or best_cover == 0:
            seed = representative_keys(uncovered)[0]
            best = ((1 << width) - 1, seed)
            best_cover = 1
        cubes.append(best)
        uncovered &= ~candidates.get(best, (1 << best[1]))
        if best not in candidates:
            uncovered &= ~(1 << best[1])
    literals = sum(popcount(care) for care, _value in cubes)
    return cubes, literals, len(candidates)


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


def run_case(case, benchmarks, max_selectors, order_name, max_candidates):
    table, features, selected, mapping, key_width = build_case(case, benchmarks, max_selectors)
    if order_name == "lsb":
        order = list(range(key_width))
    elif order_name == "msb":
        order = list(reversed(range(key_width)))
    elif order_name == "middle":
        order = sorted(range(key_width), key=lambda bit: (abs(bit - (key_width - 1) / 2.0), bit))
    else:
        raise RuntimeError("unknown order {0}".format(order_name))
    reachable = set(mapping)
    rows = []
    for bit in range(table.output_width):
        on_keys = {key for key, output in mapping.items() if (output >> bit) & 1}
        off_keys = reachable - on_keys
        cubes, literals, candidate_count = exact_greedy_cover(on_keys, off_keys, key_width, order, max_candidates)
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
                "cube_count": len(cubes),
                "literal_count": literals,
                "candidate_count": candidate_count,
                "max_candidates": max_candidates,
                "avg_literals_per_cube": "{0:.3f}".format(float(literals) / len(cubes)) if cubes else "0.000",
            }
        )
    return rows


def main(argv=None):
    parser = argparse.ArgumentParser()
    parser.add_argument("--cases", required=True)
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--max-selectors", type=int, default=8)
    parser.add_argument("--order", default="lsb")
    parser.add_argument("--max-candidates", type=int, default=0)
    parser.add_argument("--results", type=Path, required=True)
    args = parser.parse_args(argv)

    rows = []
    for case in parse_cases(args.cases):
        rows.extend(run_case(case, args.benchmarks, args.max_selectors, args.order, args.max_candidates))
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
        "cube_count",
        "literal_count",
        "candidate_count",
        "max_candidates",
        "avg_literals_per_cube",
    ]
    args.results.parent.mkdir(parents=True, exist_ok=True)
    with args.results.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields)
        writer.writeheader()
        writer.writerows(rows)
    for case in sorted({row["case"] for row in rows}):
        case_rows = [row for row in rows if row["case"] == case]
        best = min(case_rows, key=lambda row: int(row["literal_count"]))
        worst = max(case_rows, key=lambda row: int(row["literal_count"]))
        print(
            "{0} cubes={1}..{2} literals={3}..{4}".format(
                case,
                min(int(row["cube_count"]) for row in case_rows),
                max(int(row["cube_count"]) for row in case_rows),
                best["literal_count"],
                worst["literal_count"],
            )
        )
    print("rows={0} output={1}".format(len(rows), args.results))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
