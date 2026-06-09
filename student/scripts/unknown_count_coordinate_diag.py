#!/usr/bin/env python3
"""Diagnostic count-coordinate predicates for conservative unknown cases."""

import argparse
import csv
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from student.frontends.truth import TruthTable


def popcount(value):
    return bin(value).count("1")


def parse_cases(text):
    return [item.strip() for item in text.split(",") if item.strip()]


def bitmask_for_output(outputs, bit):
    mask = 0
    for index, value in enumerate(outputs):
        if (value >> bit) & 1:
            mask |= 1 << index
    return mask


def count_feature_masks(width, feature_limit):
    rows = 1 << width
    features = {}
    for lo in range(width + 1):
        hi_values = range(lo, min(width, lo + feature_limit) + 1)
        for hi in hi_values:
            if lo == hi:
                continue
            counts = [0] * rows
            for index in range(rows):
                counts[index] = popcount((index >> lo) & ((1 << (hi - lo)) - 1))
            span = hi - lo
            for op in (">=", "==", "<="):
                for threshold in range(span + 1):
                    mask = 0
                    for index, count in enumerate(counts):
                        if op == ">=":
                            bit = count >= threshold
                        elif op == "==":
                            bit = count == threshold
                        else:
                            bit = count <= threshold
                        if bit:
                            mask |= 1 << index
                    features["cnt[{0}:{1}){2}{3}".format(lo, hi, op, threshold)] = mask
    return features


def run_case(case, benchmarks, feature_limit):
    table = TruthTable(benchmarks / "{0}.truth".format(case))
    outputs = list(table.iter_outputs())
    rows = 1 << table.input_width
    all_mask = (1 << rows) - 1
    features = count_feature_masks(table.input_width, feature_limit)
    out = []
    for bit in range(table.output_width):
        target = bitmask_for_output(outputs, bit)
        best_name = ""
        best_match = -1
        best_inverted = False
        for name, mask in features.items():
            diff = target ^ mask
            match = rows - popcount(diff)
            inv_diff = target ^ (mask ^ all_mask)
            inv_match = rows - popcount(inv_diff)
            if match > best_match:
                best_name = name
                best_match = match
                best_inverted = False
            if inv_match > best_match:
                best_name = name
                best_match = inv_match
                best_inverted = True
        out.append(
            {
                "case": case,
                "output_bit": bit,
                "input_width": table.input_width,
                "best_predicate": best_name,
                "inverted": "1" if best_inverted else "0",
                "matching_rows": best_match,
                "total_rows": rows,
                "exact": "1" if best_match == rows else "0",
            }
        )
    return out


def main(argv=None):
    parser = argparse.ArgumentParser()
    parser.add_argument("--cases", required=True)
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--feature-limit", type=int, default=16)
    parser.add_argument("--results", type=Path, required=True)
    args = parser.parse_args(argv)

    rows = []
    for case in parse_cases(args.cases):
        rows.extend(run_case(case, args.benchmarks, args.feature_limit))
    args.results.parent.mkdir(parents=True, exist_ok=True)
    fields = [
        "case",
        "output_bit",
        "input_width",
        "best_predicate",
        "inverted",
        "matching_rows",
        "total_rows",
        "exact",
    ]
    with args.results.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields)
        writer.writeheader()
        writer.writerows(rows)
    for row in rows:
        if row["exact"] == "1":
            print("{case} bit{output_bit} exact {best_predicate} inv={inverted}".format(**row))
    print("rows={0} output={1}".format(len(rows), args.results))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
