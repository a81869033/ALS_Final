#!/usr/bin/env python3
"""Split-domain self-duality diagnostics for conservative unknown cases."""

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


def reverse_bits(value, width):
    out = 0
    for bit in range(width):
        if (value >> bit) & 1:
            out |= 1 << (width - 1 - bit)
    return out


def permute_bits(value, perm):
    out = 0
    for src, dst in enumerate(perm):
        if (value >> src) & 1:
            out |= 1 << dst
    return out


def pair_swap_perm(width, pairs):
    perm = list(range(width))
    for left, right in pairs:
        perm[left], perm[right] = perm[right], perm[left]
    return perm


def pairs_for_case(case):
    return {
        "ex286": [(4, 5), (6, 7)],
        "ex287": [(4, 5), (6, 7), (8, 9)],
        "ex288": [(4, 5), (6, 7), (8, 9)],
        "ex289": [(4, 5), (6, 7), (8, 9), (10, 11)],
    }.get(case, [])


def transform_input(index, width, name, split_bit):
    full = (1 << width) - 1
    if name == "comp_all":
        return index ^ full
    if name == "comp_except_split":
        return index ^ (full ^ (1 << split_bit))
    if name == "reverse_comp_all":
        return reverse_bits(index ^ full, width)
    if name == "reverse_comp_except_split":
        return reverse_bits(index ^ (full ^ (1 << split_bit)), width)
    if name == "reverse":
        return reverse_bits(index, width)
    raise RuntimeError("unknown input transform {0}".format(name))


def transform_output(value, width, name, pair_perm):
    full = (1 << width) - 1
    if name == "identity":
        return value
    if name == "comp":
        return value ^ full
    if name == "reverse":
        return reverse_bits(value, width)
    if name == "comp_reverse":
        return reverse_bits(value, width) ^ full
    if name == "pair_swap":
        return permute_bits(value, pair_perm)
    if name == "comp_pair_swap":
        return permute_bits(value, pair_perm) ^ full
    raise RuntimeError("unknown output transform {0}".format(name))


def run_case(case, benchmarks, input_transforms, output_transforms):
    table = TruthTable(benchmarks / "{0}.truth".format(case))
    outputs = list(table.iter_outputs())
    width = table.input_width
    rows = []
    pair_perm = pair_swap_perm(width, pairs_for_case(case))
    for split_bit in range(width):
        half_mask = 1 << split_bit
        for input_name in input_transforms:
            mapped_in_domain = 0
            for index in range(1 << width):
                if index & half_mask:
                    continue
                partner = transform_input(index, width, input_name, split_bit)
                if partner & half_mask:
                    mapped_in_domain += 1
            if mapped_in_domain == 0:
                continue
            for output_name in output_transforms:
                matches = 0
                examples = []
                for index in range(1 << width):
                    if index & half_mask:
                        continue
                    partner = transform_input(index, width, input_name, split_bit)
                    if not (partner & half_mask):
                        continue
                    predicted = transform_output(outputs[index], width, output_name, pair_perm)
                    expected = outputs[partner]
                    if predicted == expected:
                        matches += 1
                    elif len(examples) < 3:
                        examples.append("x=0x{0:x}:p=0x{1:x}:pred=0x{2:x}:exp=0x{3:x}".format(index, partner, predicted, expected))
                rows.append(
                    {
                        "case": case,
                        "input_width": width,
                        "split_bit": split_bit,
                        "input_transform": input_name,
                        "output_transform": output_name,
                        "matches": matches,
                        "total": mapped_in_domain,
                        "exact": "1" if matches == mapped_in_domain else "0",
                        "match_ratio": "{0:.6f}".format(float(matches) / mapped_in_domain),
                        "examples": ";".join(examples),
                    }
                )
    return rows


def main(argv=None):
    parser = argparse.ArgumentParser()
    parser.add_argument("--cases", required=True)
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--input-transforms", default="comp_all,comp_except_split,reverse_comp_all,reverse_comp_except_split,reverse")
    parser.add_argument("--output-transforms", default="identity,comp,reverse,comp_reverse,pair_swap,comp_pair_swap")
    parser.add_argument("--results", type=Path, required=True)
    args = parser.parse_args(argv)

    rows = []
    for case in parse_cases(args.cases):
        rows.extend(
            run_case(
                case,
                args.benchmarks,
                parse_cases(args.input_transforms),
                parse_cases(args.output_transforms),
            )
        )
    fields = [
        "case",
        "input_width",
        "split_bit",
        "input_transform",
        "output_transform",
        "matches",
        "total",
        "exact",
        "match_ratio",
        "examples",
    ]
    args.results.parent.mkdir(parents=True, exist_ok=True)
    with args.results.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields)
        writer.writeheader()
        writer.writerows(rows)
    for case in sorted({row["case"] for row in rows}):
        best = max([row for row in rows if row["case"] == case], key=lambda row: int(row["matches"]))
        print(
            "{case} best split={split_bit} in={input_transform} out={output_transform} matches={matches}/{total} exact={exact}".format(
                **best
            )
        )
    print("rows={0} output={1}".format(len(rows), args.results))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
