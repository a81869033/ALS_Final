#!/usr/bin/env python3
"""Layer-wise combination-rank and Johnson-neighborhood diagnostics.

These checks target conservative unknown cases where every output preserves
Hamming weight.  A reference-scale source might be a compact transform inside
each popcount layer, for example a combination-rank permutation/unranking rule
or a low-distortion map on the Johnson graph.
"""

import argparse
import csv
import itertools
import math
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from student.frontends.truth import TruthTable
from student.generators.unknown_bucket_count_classifier import onehot_slots


RANK_FIELDS = [
    "case",
    "layer",
    "layer_size",
    "rank",
    "input_order",
    "output_order",
    "input_scheme",
    "output_scheme",
    "transform",
    "matches",
    "match_ratio",
    "param",
    "mean_abs_cyclic_displacement",
    "max_abs_cyclic_displacement",
    "notes",
]

JOHNSON_FIELDS = [
    "case",
    "layer",
    "adjacent_pairs",
    "same_output",
    "distance2",
    "distance4",
    "distance_ge6",
    "avg_output_distance",
    "max_output_distance",
    "notes",
]


def parse_cases(text):
    return [item.strip() for item in text.split(",") if item.strip()]


def popcount(value):
    return bin(value).count("1")


def bits(value, width):
    return [bit for bit in range(width) if (value >> bit) & 1]


def bit_reverse(value, width):
    out = 0
    for index in range(width):
        if (value >> index) & 1:
            out |= 1 << (width - 1 - index)
    return out


def gray(value):
    return value ^ (value >> 1)


def ungray(value):
    out = value
    shift = 1
    while (value >> shift) != 0:
        out ^= value >> shift
        shift += 1
    return out


def cyclic_distance(left, right, size):
    diff = abs(left - right)
    return min(diff, size - diff)


def candidate_orders(outputs, width):
    slots = onehot_slots(outputs, width)
    base = list(range(width))
    center = (width - 1) / 2.0
    raw = [
        ("natural", base),
        ("reverse", list(reversed(base))),
        ("center", sorted(base, key=lambda bit: (abs(bit - center), bit))),
        ("outside", sorted(base, key=lambda bit: (-abs(bit - center), bit))),
        ("onehot_slot", sorted(base, key=lambda bit: (slots[bit], bit))),
        ("onehot_slot_rev", sorted(base, key=lambda bit: (-slots[bit], bit))),
    ]
    out = []
    seen = set()
    for name, order in raw:
        key = tuple(order)
        if key not in seen:
            seen.add(key)
            out.append((name, order))
    return out


def layer_rank_maps(width, order, schemes):
    bit_to_pos = {bit: pos for pos, bit in enumerate(order)}
    maps = {}
    for layer in range(width + 1):
        combos = list(itertools.combinations(range(width), layer))
        for scheme in schemes:
            if scheme == "lex":
                ordered = combos
            elif scheme == "revlex":
                ordered = list(reversed(combos))
            elif scheme == "colex":
                ordered = sorted(combos, key=lambda item: tuple(reversed(item)))
            elif scheme == "revcolex":
                ordered = list(reversed(sorted(combos, key=lambda item: tuple(reversed(item)))))
            else:
                raise RuntimeError("unknown rank scheme {0}".format(scheme))
            rank_map = {}
            for rank, combo in enumerate(ordered):
                value = 0
                for pos in combo:
                    value |= 1 << order[pos]
                rank_map[value] = rank
            maps[(layer, scheme)] = rank_map
    return maps


def transform_values(size):
    width = max(1, (size - 1).bit_length())
    transforms = []
    transforms.append(("identity", lambda x: x, ""))
    transforms.append(("reverse", lambda x: size - 1 - x, ""))
    transforms.append(("gray", lambda x: gray(x), "valid_if_less_than_size"))
    transforms.append(("ungray", lambda x: ungray(x), "valid_if_less_than_size"))
    transforms.append(("bit_reverse", lambda x: bit_reverse(x, width), "valid_if_less_than_size"))
    transforms.append(("reverse_bit_reverse", lambda x: size - 1 - bit_reverse(x, width), "valid_if_less_than_size"))
    return transforms


def score_direct_transform(pairs, size, name, func, note):
    matches = 0
    distances = []
    for x_rank, y_rank in pairs:
        predicted = func(x_rank)
        if predicted >= size:
            continue
        if predicted == y_rank:
            matches += 1
        distances.append(cyclic_distance(predicted, y_rank, size))
    if not distances:
        mean = size
        max_dist = size
    else:
        mean = sum(distances) / float(len(distances))
        max_dist = max(distances)
    return matches, "", mean, max_dist, note


def score_affine_candidates(pairs, size):
    best = None
    candidates = [1, -1, 2, -2, 3, -3, 5, -5, 7, -7]
    for raw_a in candidates:
        a = raw_a % size
        if math.gcd(a, size) != 1:
            continue
        hist = {}
        for x_rank, y_rank in pairs:
            b = (y_rank - a * x_rank) % size
            hist[b] = hist.get(b, 0) + 1
        if not hist:
            continue
        b, matches = max(hist.items(), key=lambda item: (item[1], -item[0]))
        distances = [
            cyclic_distance((a * x_rank + b) % size, y_rank, size)
            for x_rank, y_rank in pairs
        ]
        row = (
            matches,
            "a={0};b={1}".format(raw_a, b),
            sum(distances) / float(len(distances)),
            max(distances),
            "best small-multiplier affine modulo layer size",
        )
        if best is None or (row[0], -row[2], -row[3]) > (best[0], -best[2], -best[3]):
            best = row
    if best is None:
        return 0, "", float(size), size, "no coprime small multiplier"
    return best


def rank_rows_for_case(case, benchmarks, schemes, top_per_layer):
    table = TruthTable(benchmarks / "{0}.truth".format(case))
    outputs = list(table.iter_outputs())
    width = table.input_width
    orders = candidate_orders(outputs, width)
    rank_maps = {
        name: layer_rank_maps(width, order, schemes)
        for name, order in orders
    }
    rows = []
    for layer in range(width + 1):
        values = [value for value in range(1 << width) if popcount(value) == layer]
        size = len(values)
        if size <= 1:
            continue
        layer_rows = []
        for in_name, _in_order in orders:
            for out_name, _out_order in orders:
                for in_scheme in schemes:
                    x_rank_map = rank_maps[in_name][(layer, in_scheme)]
                    for out_scheme in schemes:
                        y_rank_map = rank_maps[out_name][(layer, out_scheme)]
                        pairs = [(x_rank_map[value], y_rank_map[outputs[value]]) for value in values]
                        transforms = []
                        for name, func, note in transform_values(size):
                            transforms.append((name,) + score_direct_transform(pairs, size, name, func, note))
                        transforms.append(("affine_small",) + score_affine_candidates(pairs, size))
                        for transform, matches, param, mean, max_dist, note in transforms:
                            layer_rows.append(
                                {
                                    "case": case,
                                    "layer": layer,
                                    "layer_size": size,
                                    "rank": 0,
                                    "input_order": in_name,
                                    "output_order": out_name,
                                    "input_scheme": in_scheme,
                                    "output_scheme": out_scheme,
                                    "transform": transform,
                                    "matches": matches,
                                    "match_ratio": "{0:.6f}".format(matches / float(size)),
                                    "param": param,
                                    "mean_abs_cyclic_displacement": "{0:.6f}".format(mean),
                                    "max_abs_cyclic_displacement": max_dist,
                                    "notes": note,
                                }
                            )
        layer_rows.sort(
            key=lambda row: (
                int(row["matches"]),
                -float(row["mean_abs_cyclic_displacement"]),
                -int(row["max_abs_cyclic_displacement"]),
            ),
            reverse=True,
        )
        for rank, row in enumerate(layer_rows[:top_per_layer], 1):
            row["rank"] = rank
            rows.append(row)
        print(
            "{0} layer={1} size={2} best={3}/{2} {4} {5}->{6}".format(
                case,
                layer,
                size,
                layer_rows[0]["matches"],
                layer_rows[0]["transform"],
                layer_rows[0]["input_order"],
                layer_rows[0]["output_order"],
            ),
            flush=True,
        )
    return rows


def johnson_rows_for_case(case, benchmarks):
    table = TruthTable(benchmarks / "{0}.truth".format(case))
    outputs = list(table.iter_outputs())
    width = table.input_width
    by_layer = {}
    for value in range(1 << width):
        by_layer.setdefault(popcount(value), []).append(value)
    rows = []
    for layer, values in sorted(by_layer.items()):
        if layer == 0 or layer == width:
            continue
        value_set = set(values)
        adjacent_pairs = 0
        hist = {}
        total_distance = 0
        max_distance = 0
        for value in values:
            ones = bits(value, width)
            zeros = [bit for bit in range(width) if not ((value >> bit) & 1)]
            for one in ones:
                cleared = value & ~(1 << one)
                for zero in zeros:
                    other = cleared | (1 << zero)
                    if other <= value or other not in value_set:
                        continue
                    distance = popcount(outputs[value] ^ outputs[other])
                    hist[distance] = hist.get(distance, 0) + 1
                    adjacent_pairs += 1
                    total_distance += distance
                    max_distance = max(max_distance, distance)
        rows.append(
            {
                "case": case,
                "layer": layer,
                "adjacent_pairs": adjacent_pairs,
                "same_output": hist.get(0, 0),
                "distance2": hist.get(2, 0),
                "distance4": hist.get(4, 0),
                "distance_ge6": sum(count for dist, count in hist.items() if dist >= 6),
                "avg_output_distance": "{0:.6f}".format(
                    total_distance / float(adjacent_pairs) if adjacent_pairs else 0.0
                ),
                "max_output_distance": max_distance,
                "notes": "output Hamming distance for adjacent input subsets in the Johnson graph",
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
    candidate_header = [
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
    write_csv(results_dir / "candidates.csv", candidate_header, [])
    write_csv(results_dir / "best.csv", candidate_header, [])
    write_csv(results_dir / "evaluate_check.csv", candidate_header, [])


def parse_args(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--cases", type=parse_cases, required=True)
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--results-dir", type=Path, required=True)
    parser.add_argument(
        "--schemes",
        type=parse_cases,
        default=parse_cases("lex,revlex,colex,revcolex"),
    )
    parser.add_argument("--top-per-layer", type=int, default=8)
    return parser.parse_args(argv)


def main(argv=None):
    args = parse_args(argv)
    rank_rows = []
    johnson_rows = []
    for case in args.cases:
        rank_rows.extend(rank_rows_for_case(case, args.benchmarks, args.schemes, args.top_per_layer))
        johnson_rows.extend(johnson_rows_for_case(case, args.benchmarks))
        write_csv(args.results_dir / "layer_rank_transform_diagnostics.csv", RANK_FIELDS, rank_rows)
        write_csv(args.results_dir / "johnson_neighborhood_diagnostics.csv", JOHNSON_FIELDS, johnson_rows)

    summary_rows = []
    for case in args.cases:
        case_rank = [row for row in rank_rows if row["case"] == case]
        best = max(case_rank, key=lambda row: int(row["matches"]))
        exact_layers = sum(
            1
            for row in case_rank
            if row["rank"] == 1 and int(row["matches"]) == int(row["layer_size"])
        )
        central = max(
            [row for row in johnson_rows if row["case"] == case],
            key=lambda row: int(row["adjacent_pairs"]),
        )
        summary_rows.append(
            {
                "case": case,
                "verified": 0,
                "equivalent": 0,
                "best_rank_layer": best["layer"],
                "best_rank_matches": best["matches"],
                "best_rank_layer_size": best["layer_size"],
                "best_rank_match_ratio": best["match_ratio"],
                "best_rank_transform": best["transform"],
                "exact_rank_layers": exact_layers,
                "central_johnson_layer": central["layer"],
                "central_avg_output_distance": central["avg_output_distance"],
                "central_distance2_ratio": "{0:.6f}".format(
                    int(central["distance2"]) / float(int(central["adjacent_pairs"]))
                ),
                "notes": "diagnostic-only; no exact compact layer-rank/unrank structure emitted",
            }
        )
    write_csv(
        args.results_dir / "summary.csv",
        [
            "case",
            "verified",
            "equivalent",
            "best_rank_layer",
            "best_rank_matches",
            "best_rank_layer_size",
            "best_rank_match_ratio",
            "best_rank_transform",
            "exact_rank_layers",
            "central_johnson_layer",
            "central_avg_output_distance",
            "central_distance2_ratio",
            "notes",
        ],
        summary_rows,
    )
    write_empty_frontend_csvs(args.results_dir)
    print("rank_rows={0} johnson_rows={1} results={2}".format(len(rank_rows), len(johnson_rows), args.results_dir))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
