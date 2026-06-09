#!/usr/bin/env python3
"""Prefix residual diagnostics for scan-like unknown functions."""

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


def parse_orders(text):
    return [item.strip() for item in text.split(",") if item.strip()]


def exact_pairs(case):
    return {
        "ex286": [(4, 5), (6, 7)],
        "ex287": [(4, 5), (6, 7), (8, 9)],
        "ex288": [(4, 5), (6, 7), (8, 9)],
        "ex289": [(4, 5), (6, 7), (8, 9), (10, 11)],
    }.get(case, [])


def order_by_name(case, width, name):
    if name == "natural":
        return list(range(width))
    if name == "reverse":
        return list(reversed(range(width)))
    if name == "bitrev":
        bits = max(1, (width - 1).bit_length())
        return sorted(range(width), key=lambda value: int(("{0:0%db}" % bits).format(value)[::-1], 2))
    if name == "center":
        center = (width - 1) / 2.0
        return sorted(range(width), key=lambda bit: (abs(bit - center), bit))
    if name == "sym_orand":
        pairs = exact_pairs(case)
        used = set()
        out = []
        for left, right in pairs:
            out.extend([left, right])
            used.add(left)
            used.add(right)
        out.extend(bit for bit in range(width) if bit not in used)
        return out
    if name == "sym_interleave":
        pairs = exact_pairs(case)
        lefts = [left for left, _right in pairs]
        rights = [right for _left, right in pairs]
        used = set(lefts + rights)
        rest = [bit for bit in range(width) if bit not in used]
        return rest[:2] + lefts + rights + rest[2:]
    raise RuntimeError("unknown order: {0}".format(name))


def make_index(prefix, suffix, order, k):
    value = 0
    for pos, bit in enumerate(order[:k]):
        if (prefix >> pos) & 1:
            value |= 1 << bit
    for pos, bit in enumerate(order[k:]):
        if (suffix >> pos) & 1:
            value |= 1 << bit
    return value


def residual_counts(outputs, width, order, max_suffix_bits):
    rows = []
    for k in range(width + 1):
        suffix_width = width - k
        if suffix_width > max_suffix_bits:
            continue
        signatures = {}
        for prefix in range(1 << k):
            sig = tuple(outputs[make_index(prefix, suffix, order, k)] for suffix in range(1 << suffix_width))
            signatures.setdefault(sig, 0)
            signatures[sig] += 1
        class_sizes = sorted(signatures.values(), reverse=True)
        rows.append(
            {
                "prefix_len": k,
                "suffix_width": suffix_width,
                "prefixes": 1 << k,
                "residual_classes": len(signatures),
                "max_class_size": class_sizes[0] if class_sizes else 0,
                "top_class_sizes": ":".join(str(item) for item in class_sizes[:8]),
            }
        )
    return rows


def run_case(case, benchmarks, orders, max_suffix_bits):
    table = TruthTable(benchmarks / "{0}.truth".format(case))
    outputs = list(table.iter_outputs())
    rows = []
    for order_name in orders:
        order = order_by_name(case, table.input_width, order_name)
        for row in residual_counts(outputs, table.input_width, order, max_suffix_bits):
            row.update(
                {
                    "case": case,
                    "input_width": table.input_width,
                    "order_name": order_name,
                    "order_bits": ":".join(str(bit) for bit in order),
                }
            )
            rows.append(row)
    return rows


def main(argv=None):
    parser = argparse.ArgumentParser()
    parser.add_argument("--cases", required=True)
    parser.add_argument("--orders", type=parse_orders, default=parse_orders("natural,reverse,center,sym_orand,sym_interleave"))
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--max-suffix-bits", type=int, default=12)
    parser.add_argument("--results", type=Path, required=True)
    args = parser.parse_args(argv)

    rows = []
    for case in parse_cases(args.cases):
        rows.extend(run_case(case, args.benchmarks, args.orders, args.max_suffix_bits))
    args.results.parent.mkdir(parents=True, exist_ok=True)
    fields = [
        "case",
        "input_width",
        "order_name",
        "order_bits",
        "prefix_len",
        "suffix_width",
        "prefixes",
        "residual_classes",
        "max_class_size",
        "top_class_sizes",
    ]
    with args.results.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields)
        writer.writeheader()
        writer.writerows(rows)
    for row in rows:
        if int(row["residual_classes"]) < int(row["prefixes"]):
            print(
                "{case} {order_name} k={prefix_len} classes={residual_classes}/{prefixes} top={top_class_sizes}".format(
                    **row
                )
            )
    print("rows={0} output={1}".format(len(rows), args.results))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
