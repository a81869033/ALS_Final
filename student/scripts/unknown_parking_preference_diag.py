#!/usr/bin/env python3
"""Greedy parking/preference diagnostics for conservative unknown cases."""

import argparse
import csv
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from student.frontends.truth import TruthTable


def parse_csv(text):
    return [item.strip() for item in text.split(",") if item.strip()]


def popcount(value):
    return bin(value).count("1")


def bits_of(value, width):
    return [bit for bit in range(width) if (value >> bit) & 1]


def bit_reverse(value, width):
    out = 0
    for bit in range(width):
        if (value >> bit) & 1:
            out |= 1 << (width - 1 - bit)
    return out


def unique(items):
    seen = set()
    out = []
    for item in items:
        if item in seen:
            continue
        seen.add(item)
        out.append(item)
    return out


def pair_sym_order(case, width):
    pairs = {
        "ex286": [(4, 5), (6, 7)],
        "ex287": [(4, 5), (6, 7), (8, 9)],
        "ex288": [(4, 5), (6, 7), (8, 9)],
        "ex289": [(4, 5), (6, 7), (8, 9), (10, 11)],
    }.get(case, [])
    used = set()
    out = []
    for left, right in pairs:
        out.extend([left, right])
        used.add(left)
        used.add(right)
    out.extend(bit for bit in range(width) if bit not in used)
    return out


def center_order(width):
    center = (width - 1) / 2.0
    return sorted(range(width), key=lambda bit: (abs(bit - center), bit))


def outside_order(width):
    out = []
    lo = 0
    hi = width - 1
    while lo <= hi:
        out.append(lo)
        if lo != hi:
            out.append(hi)
        lo += 1
        hi -= 1
    return out


def token_order(name, case, width, onehot_slot):
    if name == "natural":
        return list(range(width))
    if name == "reverse":
        return list(reversed(range(width)))
    if name == "home":
        return sorted(range(width), key=lambda bit: (onehot_slot[bit], bit))
    if name == "home_reverse":
        return sorted(range(width), key=lambda bit: (-onehot_slot[bit], bit))
    if name == "center":
        return center_order(width)
    if name == "outside":
        return outside_order(width)
    if name == "sym":
        return pair_sym_order(case, width)
    raise RuntimeError("unknown token order: {0}".format(name))


def circular_slots(home, width, direction):
    if direction == "cw":
        return [(home + offset) % width for offset in range(width)]
    if direction == "ccw":
        return [(home - offset) % width for offset in range(width)]
    if direction == "bidir":
        out = [home]
        for offset in range(1, width):
            out.append((home + offset) % width)
            out.append((home - offset) % width)
        return unique(out)
    if direction == "bidir_rev":
        out = [home]
        for offset in range(1, width):
            out.append((home - offset) % width)
            out.append((home + offset) % width)
        return unique(out)
    raise RuntimeError("unknown direction: {0}".format(direction))


def pair_frequency_preferences(outputs, width, onehot_slot):
    counts = [[0] * width for _ in range(width)]
    first_seen = [[] for _ in range(width)]
    for left in range(width):
        for right in range(left + 1, width):
            out_bits = bits_of(outputs[(1 << left) | (1 << right)], width)
            for token in (left, right):
                for slot in out_bits:
                    counts[token][slot] += 1
                    first_seen[token].append(slot)

    freq = []
    first = []
    for token in range(width):
        home = onehot_slot[token]
        freq.append(
            sorted(
                range(width),
                key=lambda slot: (
                    -counts[token][slot],
                    min((slot - home) % width, (home - slot) % width),
                    slot,
                ),
            )
        )
        first.append(unique([home] + first_seen[token] + list(range(width))))
    return freq, first


def preference_lists(width, onehot_slot, style, pair_freq, pair_first):
    out = []
    for token in range(width):
        home = onehot_slot[token]
        if style == "home_cw":
            prefs = circular_slots(home, width, "cw")
        elif style == "home_ccw":
            prefs = circular_slots(home, width, "ccw")
        elif style == "home_bidir":
            prefs = circular_slots(home, width, "bidir")
        elif style == "home_bidir_rev":
            prefs = circular_slots(home, width, "bidir_rev")
        elif style == "pair_freq":
            prefs = pair_freq[token]
        elif style == "pair_freq_cw":
            prefs = unique(pair_freq[token] + circular_slots(home, width, "cw"))
        elif style == "pair_freq_ccw":
            prefs = unique(pair_freq[token] + circular_slots(home, width, "ccw"))
        elif style == "pair_first":
            prefs = pair_first[token]
        elif style == "pair_first_cw":
            prefs = unique(pair_first[token] + circular_slots(home, width, "cw"))
        elif style == "pair_first_ccw":
            prefs = unique(pair_first[token] + circular_slots(home, width, "ccw"))
        else:
            raise RuntimeError("unknown preference style: {0}".format(style))
        out.append(prefs)
    return out


def park_mask(mask, width, order, prefs):
    occupied = 0
    for token in order:
        if not ((mask >> token) & 1):
            continue
        for slot in prefs[token]:
            if not ((occupied >> slot) & 1):
                occupied |= 1 << slot
                break
        else:
            raise RuntimeError("no parking slot for token {0}".format(token))
    return occupied


def transformed_output(value, width, transform):
    if transform == "identity":
        return value
    if transform == "reverse":
        return bit_reverse(value, width)
    if transform == "rotate_left1":
        return ((value << 1) | (value >> (width - 1))) & ((1 << width) - 1)
    if transform == "rotate_right1":
        return ((value >> 1) | ((value & 1) << (width - 1))) & ((1 << width) - 1)
    raise RuntimeError("unknown output transform: {0}".format(transform))


def onehot_slots(outputs, width):
    slots = []
    valid = True
    for token in range(width):
        value = outputs[1 << token]
        if popcount(value) != 1:
            valid = False
            slots.append(0)
        else:
            slots.append(bits_of(value, width)[0])
    return slots, valid


def score_model(outputs, width, order, prefs, transform):
    total_rows = len(outputs)
    row_matches = 0
    bit_matches = 0
    first_mismatch = ""
    for mask, expected in enumerate(outputs):
        predicted = transformed_output(park_mask(mask, width, order, prefs), width, transform)
        if predicted == expected:
            row_matches += 1
        elif not first_mismatch:
            first_mismatch = "in=0x{0:x}:pred=0x{1:x}:exp=0x{2:x}".format(mask, predicted, expected)
        bit_matches += width - popcount(predicted ^ expected)
    return row_matches, bit_matches, total_rows, total_rows * width, first_mismatch


def run_case(case, benchmarks, order_names, pref_styles, transforms):
    table = TruthTable(benchmarks / "{0}.truth".format(case))
    if table.input_width != table.output_width:
        raise RuntimeError("{0} input/output width mismatch: {1}/{2}".format(case, table.input_width, table.output_width))
    outputs = list(table.iter_outputs())
    width = table.input_width
    onehot_slot, onehot_valid = onehot_slots(outputs, width)
    pair_freq, pair_first = pair_frequency_preferences(outputs, width, onehot_slot)
    rows = []
    for order_name in order_names:
        order = token_order(order_name, case, width, onehot_slot)
        for pref_style in pref_styles:
            prefs = preference_lists(width, onehot_slot, pref_style, pair_freq, pair_first)
            for transform in transforms:
                row_matches, bit_matches, total_rows, total_bits, mismatch = score_model(
                    outputs, width, order, prefs, transform
                )
                rows.append(
                    {
                        "case": case,
                        "input_width": width,
                        "output_width": table.output_width,
                        "onehot_valid": "1" if onehot_valid else "0",
                        "token_order": order_name,
                        "preference_style": pref_style,
                        "output_transform": transform,
                        "row_matches": row_matches,
                        "total_rows": total_rows,
                        "bit_matches": bit_matches,
                        "total_bits": total_bits,
                        "exact": "1" if row_matches == total_rows else "0",
                        "onehot_slots": ":".join(str(slot) for slot in onehot_slot),
                        "order_bits": ":".join(str(bit) for bit in order),
                        "first_mismatch": mismatch,
                    }
                )
    return rows


def main(argv=None):
    parser = argparse.ArgumentParser()
    parser.add_argument("--cases", required=True)
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument(
        "--orders",
        default="natural,reverse,home,home_reverse,center,outside,sym",
    )
    parser.add_argument(
        "--preference-styles",
        default="home_cw,home_ccw,home_bidir,home_bidir_rev,pair_freq,pair_freq_cw,pair_freq_ccw,pair_first,pair_first_cw,pair_first_ccw",
    )
    parser.add_argument(
        "--output-transforms",
        default="identity,reverse,rotate_left1,rotate_right1",
    )
    parser.add_argument("--results", type=Path, required=True)
    args = parser.parse_args(argv)

    rows = []
    for case in parse_csv(args.cases):
        rows.extend(
            run_case(
                case,
                args.benchmarks,
                parse_csv(args.orders),
                parse_csv(args.preference_styles),
                parse_csv(args.output_transforms),
            )
        )

    args.results.parent.mkdir(parents=True, exist_ok=True)
    fields = [
        "case",
        "input_width",
        "output_width",
        "onehot_valid",
        "token_order",
        "preference_style",
        "output_transform",
        "row_matches",
        "total_rows",
        "bit_matches",
        "total_bits",
        "exact",
        "onehot_slots",
        "order_bits",
        "first_mismatch",
    ]
    with args.results.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields)
        writer.writeheader()
        writer.writerows(rows)

    by_case = {}
    for row in rows:
        current = by_case.get(row["case"])
        if current is None or int(row["row_matches"]) > int(current["row_matches"]):
            by_case[row["case"]] = row
    for case in sorted(by_case):
        row = by_case[case]
        print(
            "{0} best {1}/{2} rows order={3} prefs={4} transform={5}".format(
                case,
                row["row_matches"],
                row["total_rows"],
                row["token_order"],
                row["preference_style"],
                row["output_transform"],
            )
        )
    print("rows={0} output={1}".format(len(rows), args.results))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
