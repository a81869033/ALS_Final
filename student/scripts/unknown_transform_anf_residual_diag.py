#!/usr/bin/env python3
"""Transform-aware low-degree ANF residual diagnostics."""

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
from student.generators.unknown_bucket_count_classifier import onehot_slots


def parse_cases(text):
    return [item.strip() for item in text.split(",") if item.strip()]


def exact_pairs(case):
    return {
        "ex286": [(4, 5), (6, 7)],
        "ex287": [(4, 5), (6, 7), (8, 9)],
        "ex288": [(4, 5), (6, 7), (8, 9)],
        "ex289": [(4, 5), (6, 7), (8, 9), (10, 11)],
    }.get(case, [])


def popcount(value):
    return bin(value).count("1")


def order_by_name(width, outputs, name):
    if name == "natural":
        return list(range(width))
    if name == "reverse":
        return list(reversed(range(width)))
    if name == "onehot_slot":
        slots = onehot_slots(outputs, width)
        return sorted(range(width), key=lambda bit: (slots[bit], bit))
    raise RuntimeError("unknown order {0}".format(name))


def transform_index(index, width, outputs, case, transform):
    if transform == "raw":
        return index
    if transform == "pair_key":
        key = 0
        used = set()
        for left, right in exact_pairs(case):
            lb = (index >> left) & 1
            rb = (index >> right) & 1
            if lb | rb:
                key |= 1 << left
            if lb & rb:
                key |= 1 << right
            used.add(left)
            used.add(right)
        for bit in range(width):
            if bit not in used and ((index >> bit) & 1):
                key |= 1 << bit
        return key
    if transform.startswith("prefix_") or transform.startswith("suffix_"):
        _kind, order_name = transform.split("_", 1)
        order = order_by_name(width, outputs, order_name)
        out = 0
        acc = 0
        iterable = order if transform.startswith("prefix_") else list(reversed(order))
        temp = {}
        for bit in iterable:
            acc ^= (index >> bit) & 1
            temp[bit] = acc
        for bit in range(width):
            if temp[bit]:
                out |= 1 << bit
        return out
    raise RuntimeError("unknown transform {0}".format(transform))


def transformed_outputs(outputs, width, case, transform):
    values = [0] * len(outputs)
    for index, output in enumerate(outputs):
        values[transform_index(index, width, outputs, case, transform)] = output
    return values


def anf_coefficients(bit_values, width):
    coeffs = list(bit_values)
    for pos in range(width):
        step = 1 << pos
        for mask in range(1 << width):
            if mask & step:
                coeffs[mask] ^= coeffs[mask ^ step]
    return coeffs


def eval_low_anf(coeffs, width, degree):
    values = [
        coeff if popcount(mask) <= degree else 0
        for mask, coeff in enumerate(coeffs)
    ]
    for pos in range(width):
        step = 1 << pos
        for mask in range(1 << width):
            if mask & step:
                values[mask] ^= values[mask ^ step]
    return values


def bdd_nodes_for_bit(values, width):
    order = list(range(width))
    builder = SharedBddBuilder(order)
    root = builder.build(permute_plane(bytes(values), order), 0)
    return len(builder.nodes), root


def run_case(case, benchmarks, transforms, degrees):
    table = TruthTable(benchmarks / "{0}.truth".format(case))
    outputs = list(table.iter_outputs())
    width = table.input_width
    rows = []
    for transform in transforms:
        transformed = transformed_outputs(outputs, width, case, transform)
        raw_bit_nodes = []
        coeffs_by_bit = []
        for bit in range(width):
            bit_values = [((value >> bit) & 1) for value in transformed]
            raw_nodes, _root = bdd_nodes_for_bit(bit_values, width)
            raw_bit_nodes.append(raw_nodes)
            coeffs_by_bit.append(anf_coefficients(bit_values, width))
        for degree in degrees:
            total_terms = 0
            low_terms = 0
            residual_nodes = []
            exact_bits = 0
            max_degree = 0
            for bit, coeffs in enumerate(coeffs_by_bit):
                masks = [mask for mask, coeff in enumerate(coeffs) if coeff]
                if masks:
                    max_degree = max(max_degree, max(popcount(mask) for mask in masks))
                low_masks = [mask for mask in masks if popcount(mask) <= degree]
                total_terms += len(masks)
                low_terms += len(low_masks)
                low_values = eval_low_anf(coeffs, width, degree)
                residual = [
                    ((transformed[index] >> bit) & 1) ^ low_values[index]
                    for index in range(1 << width)
                ]
                if not any(residual):
                    exact_bits += 1
                    residual_nodes.append(0)
                else:
                    nodes, _root = bdd_nodes_for_bit(residual, width)
                    residual_nodes.append(nodes)
            rows.append(
                {
                    "case": case,
                    "input_width": width,
                    "transform": transform,
                    "degree": degree,
                    "total_anf_terms": total_terms,
                    "low_degree_terms": low_terms,
                    "max_anf_degree": max_degree,
                    "exact_low_degree_bits": exact_bits,
                    "raw_bdd_nodes_sum": sum(raw_bit_nodes),
                    "residual_bdd_nodes_sum": sum(residual_nodes),
                    "best_bit_residual_nodes": min(residual_nodes),
                    "worst_bit_residual_nodes": max(residual_nodes),
                    "raw_bit_nodes": ":".join(str(item) for item in raw_bit_nodes),
                    "residual_bit_nodes": ":".join(str(item) for item in residual_nodes),
                }
            )
            print(
                "{0} {1} deg{2} exact_bits={3} low_terms={4} residual_nodes={5} raw_nodes={6}".format(
                    case,
                    transform,
                    degree,
                    exact_bits,
                    low_terms,
                    sum(residual_nodes),
                    sum(raw_bit_nodes),
                ),
                flush=True,
            )
    return rows


def write_csv(path, rows):
    path.parent.mkdir(parents=True, exist_ok=True)
    fields = [
        "case",
        "input_width",
        "transform",
        "degree",
        "total_anf_terms",
        "low_degree_terms",
        "max_anf_degree",
        "exact_low_degree_bits",
        "raw_bdd_nodes_sum",
        "residual_bdd_nodes_sum",
        "best_bit_residual_nodes",
        "worst_bit_residual_nodes",
        "raw_bit_nodes",
        "residual_bit_nodes",
    ]
    with path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields)
        writer.writeheader()
        writer.writerows(rows)


def parse_args():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--cases", type=parse_cases, required=True)
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument(
        "--transforms",
        type=parse_cases,
        default=parse_cases(
            "raw,pair_key,prefix_natural,suffix_natural,prefix_reverse,prefix_onehot_slot,suffix_onehot_slot"
        ),
    )
    parser.add_argument("--degrees", type=parse_cases, default=parse_cases("1,2,3"))
    parser.add_argument("--results", type=Path, required=True)
    return parser.parse_args()


def main():
    args = parse_args()
    degrees = [int(item) for item in args.degrees]
    rows = []
    for case in args.cases:
        rows.extend(run_case(case, args.benchmarks, args.transforms, degrees))
        write_csv(args.results, rows)
    print("rows={0} output={1}".format(len(rows), args.results))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
