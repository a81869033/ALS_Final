#!/usr/bin/env python3
"""Hidden-order local-rule diagnostics for conservative unknown cases."""

import argparse
import csv
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from student.frontends.truth import TruthTable
from student.generators.unknown_verilog_search import parse_cases


FIELDS = [
    "case",
    "rank",
    "input_order",
    "output_order",
    "shift",
    "radius",
    "ring",
    "include_popcount",
    "sample_exact_bits",
    "sample_conflicts",
    "full_exact_bits",
    "full_conflicts",
    "max_keys",
    "notes",
]


def popcount(value):
    return bin(value).count("1")


def bits(value, width):
    return [bit for bit in range(width) if (value >> bit) & 1]


def onehot_slots(outputs, width):
    slots = []
    for bit in range(width):
        output = outputs[1 << bit]
        ones = bits(output, width)
        if len(ones) != 1:
            raise RuntimeError("one-hot row is not one-hot")
        slots.append(ones[0])
    return slots


def candidate_orders(slots, width):
    base = list(range(width))
    raw = [
        ("natural", base),
        ("reverse", list(reversed(base))),
        ("slot_bit", sorted(base, key=lambda bit: (slots[bit], bit))),
        ("slot_revbit", sorted(base, key=lambda bit: (slots[bit], -bit))),
        ("revslot_bit", sorted(base, key=lambda bit: (-slots[bit], bit))),
        ("revslot_revbit", sorted(base, key=lambda bit: (-slots[bit], -bit))),
    ]
    out = []
    seen = set()
    for name, order in raw:
        key = tuple(order)
        if key not in seen:
            seen.add(key)
            out.append((name, order))
    return out


def sample_indices(width):
    rows = 1 << width
    selected = set([0, rows - 1])
    for bit in range(width):
        selected.add(1 << bit)
    for a in range(width):
        for b in range(a + 1, width):
            selected.add((1 << a) | (1 << b))
    step = max(1, rows // 512)
    for index in range(0, rows, step):
        selected.add(index)
    return sorted(selected)


def eval_config(outputs, width, input_order, output_order, shift, radius, ring, include_popcount, indices):
    exact_bits = 0
    conflicts = 0
    max_keys = 0
    for pos, out_bit in enumerate(output_order):
        center = (pos + shift) % width
        seen = {}
        bit_conflicts = 0
        for index in indices:
            fields = []
            if include_popcount:
                fields.append(popcount(index))
            for off in range(-radius, radius + 1):
                cursor = center + off
                if ring:
                    in_bit = input_order[cursor % width]
                    fields.append((index >> in_bit) & 1)
                elif 0 <= cursor < width:
                    in_bit = input_order[cursor]
                    fields.append((index >> in_bit) & 1)
                else:
                    fields.append(0)
            key = tuple(fields)
            value = (outputs[index] >> out_bit) & 1
            old = seen.get(key)
            if old is None:
                seen[key] = value
            elif old != value:
                bit_conflicts += 1
        if bit_conflicts == 0:
            exact_bits += 1
        conflicts += bit_conflicts
        max_keys = max(max_keys, len(seen))
    return exact_bits, conflicts, max_keys


def run_case(case, benchmarks, max_radius, sample_top, full_top):
    table = TruthTable(benchmarks / "{0}.truth".format(case))
    outputs = list(table.iter_outputs())
    width = table.input_width
    orders = candidate_orders(onehot_slots(outputs, width), width)
    sample = sample_indices(width)
    sampled = []
    for in_name, in_order in orders:
        for out_name, out_order in orders:
            for shift in range(width):
                for radius in range(max_radius + 1):
                    for ring in (0, 1):
                        for include_popcount in (0, 1):
                            exact, conflicts, max_keys = eval_config(
                                outputs,
                                width,
                                in_order,
                                out_order,
                                shift,
                                radius,
                                ring,
                                include_popcount,
                                sample,
                            )
                            sampled.append(
                                (
                                    exact,
                                    -conflicts,
                                    -max_keys,
                                    in_name,
                                    out_name,
                                    shift,
                                    radius,
                                    ring,
                                    include_popcount,
                                    conflicts,
                                    max_keys,
                                )
                            )
    sampled.sort(reverse=True)
    rows = []
    full_indices = list(range(1 << width))
    for rank, item in enumerate(sampled[:full_top], 1):
        sample_exact, neg_conflicts, neg_max_keys, in_name, out_name, shift, radius, ring, include_popcount, sample_conflicts, sample_max_keys = item
        in_order = dict(orders)[in_name]
        out_order = dict(orders)[out_name]
        full_exact, full_conflicts, full_max_keys = eval_config(
            outputs,
            width,
            in_order,
            out_order,
            shift,
            radius,
            ring,
            include_popcount,
            full_indices,
        )
        rows.append(
            {
                "case": case,
                "rank": rank,
                "input_order": in_name,
                "output_order": out_name,
                "shift": shift,
                "radius": radius,
                "ring": ring,
                "include_popcount": include_popcount,
                "sample_exact_bits": sample_exact,
                "sample_conflicts": sample_conflicts,
                "full_exact_bits": full_exact,
                "full_conflicts": full_conflicts,
                "max_keys": full_max_keys,
                "notes": "sample_top={0}; sample_size={1}".format(sample_top, len(sample)),
            }
        )
    return rows


def main(argv=None):
    parser = argparse.ArgumentParser()
    parser.add_argument("--cases", type=parse_cases, required=True)
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--max-radius", type=int, default=4)
    parser.add_argument("--sample-top", type=int, default=100)
    parser.add_argument("--full-top", type=int, default=12)
    parser.add_argument("--results", type=Path, required=True)
    args = parser.parse_args(argv)

    rows = []
    for case in args.cases:
        case_rows = run_case(case, args.benchmarks, args.max_radius, args.sample_top, args.full_top)
        rows.extend(case_rows)
        best = case_rows[0]
        print(
            "{0} best full_exact_bits={1} full_conflicts={2} order={3}->{4} r={5}".format(
                case,
                best["full_exact_bits"],
                best["full_conflicts"],
                best["input_order"],
                best["output_order"],
                best["radius"],
            )
        )
    args.results.parent.mkdir(parents=True, exist_ok=True)
    with args.results.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=FIELDS)
        writer.writeheader()
        writer.writerows(rows)
    print("rows={0} output={1}".format(len(rows), args.results))


if __name__ == "__main__":
    raise SystemExit(main())
