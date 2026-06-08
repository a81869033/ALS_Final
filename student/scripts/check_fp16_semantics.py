#!/usr/bin/env python3
"""Check FP16 unary semantic hypotheses against benchmark truth tables."""

import argparse
import csv
import math
import struct
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from student.frontends.truth import TruthTable


CANONICAL_NAN = 0x7E00

CASE_OPS = {
    "ex225": "log10",
    "ex226": "sin",
    "ex227": "tan",
    "ex228": "sinh",
    "ex229": "tanh",
    "ex230": "sigmoid",
    "ex231": "reciprocal",
    "ex232": "square",
    "ex233": "sqrt",
    "ex234": "reciprocal_square",
}

FIELDNAMES = [
    "case",
    "op",
    "matches",
    "mismatches",
    "first_mismatch_input",
    "expected",
    "actual",
    "notes",
]


def half_to_float(bits):
    return struct.unpack(">e", struct.pack(">H", bits & 0xFFFF))[0]


def float_to_half_bits(value):
    if math.isnan(value):
        return CANONICAL_NAN
    try:
        bits = struct.unpack(">H", struct.pack(">e", float(value)))[0]
    except OverflowError:
        return 0xFC00 if math.copysign(1.0, value) < 0 else 0x7C00
    # FTZ: flush half subnormal results to signed zero.
    exp = (bits >> 10) & 0x1F
    mant = bits & 0x03FF
    if exp == 0 and mant != 0:
        return bits & 0x8000
    if exp == 0x1F and mant != 0:
        return CANONICAL_NAN
    return bits


def daz_input(bits):
    sign = bits & 0x8000
    exp = (bits >> 10) & 0x1F
    mant = bits & 0x03FF
    if exp == 0 and mant != 0:
        return sign
    return bits


def model(bits, op):
    bits = daz_input(bits)
    sign = bits & 0x8000
    exp = (bits >> 10) & 0x1F
    mant = bits & 0x03FF
    if exp == 0x1F and mant != 0:
        return CANONICAL_NAN
    if op == "log10":
        if exp == 0 and mant == 0:
            return 0xFC00
        if sign:
            return CANONICAL_NAN
        if exp == 0x1F:
            return 0x7C00
        return float_to_half_bits(math.log10(half_to_float(bits)))
    if op == "sin":
        if exp == 0x1F:
            return CANONICAL_NAN
        return float_to_half_bits(math.sin(half_to_float(bits)))
    if op == "tan":
        if exp == 0x1F:
            return CANONICAL_NAN
        return float_to_half_bits(math.tan(half_to_float(bits)))
    if op == "sinh":
        if exp == 0x1F:
            return (sign | 0x7C00) if mant == 0 else CANONICAL_NAN
        try:
            value = math.sinh(half_to_float(bits))
        except OverflowError:
            value = math.copysign(float("inf"), half_to_float(bits))
        return float_to_half_bits(value)
    if op == "tanh":
        if exp == 0x1F:
            return (sign | 0x3C00) if mant == 0 else CANONICAL_NAN
        return float_to_half_bits(math.tanh(half_to_float(bits)))
    if op == "sigmoid":
        if exp == 0x1F:
            if mant != 0:
                return CANONICAL_NAN
            return 0x0000 if sign else 0x3C00
        value = half_to_float(bits)
        try:
            return float_to_half_bits(1.0 / (1.0 + math.exp(-value)))
        except OverflowError:
            return 0x0000
    if op == "reciprocal":
        if exp == 0 and mant == 0:
            return sign | 0x7C00
        if exp == 0x1F:
            return CANONICAL_NAN if mant != 0 else sign
        return float_to_half_bits(1.0 / half_to_float(bits))
    if op == "square":
        if exp == 0x1F:
            return CANONICAL_NAN if mant != 0 else 0x7C00
        value = half_to_float(bits)
        return float_to_half_bits(value * value)
    if op == "sqrt":
        if exp == 0x1F:
            return CANONICAL_NAN if sign or mant != 0 else 0x7C00
        if sign and (exp != 0 or mant != 0):
            return CANONICAL_NAN
        return float_to_half_bits(math.sqrt(half_to_float(bits)))
    if op == "reciprocal_square":
        if exp == 0 and mant == 0:
            return 0x7C00
        if exp == 0x1F:
            return CANONICAL_NAN if mant != 0 else 0x0000
        value = half_to_float(bits)
        return float_to_half_bits(1.0 / (value * value))
    raise RuntimeError("unknown op: {0}".format(op))


def parse_cases(text):
    cases = []
    for item in text.split(","):
        item = item.strip()
        if not item:
            continue
        if "-" in item:
            start, end = item.split("-", 1)
            for number in range(int(start[2:]), int(end[2:]) + 1):
                cases.append("ex{0:03d}".format(number))
        else:
            cases.append(item)
    return cases


def check_case(case, benchmarks):
    op = CASE_OPS[case]
    table = TruthTable(benchmarks / "{0}.truth".format(case))
    mismatches = []
    for index in range(1 << 16):
        actual = table.get_output(index)
        expected = model(index, op)
        if actual != expected:
            mismatches.append((index, expected, actual))
            if len(mismatches) >= 8:
                break
    first = mismatches[0] if mismatches else None
    return {
        "case": case,
        "op": op,
        "matches": "1" if not mismatches else "0",
        "mismatches": str(len(mismatches)) if mismatches else "0",
        "first_mismatch_input": "" if first is None else "0x{0:04x}".format(first[0]),
        "expected": "" if first is None else "0x{0:04x}".format(first[1]),
        "actual": "" if first is None else "0x{0:04x}".format(first[2]),
        "notes": "DAZ input, FTZ output, RNE via struct half, canonical NaN",
    }


def parse_args():
    parser = argparse.ArgumentParser(description="Check FP16 semantic hypotheses.")
    parser.add_argument("--cases", default="ex225-ex229")
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--output", type=Path, required=True)
    return parser.parse_args()


def main():
    args = parse_args()
    rows = [check_case(case, args.benchmarks) for case in parse_cases(args.cases)]
    args.output.parent.mkdir(parents=True, exist_ok=True)
    with args.output.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=FIELDNAMES)
        writer.writeheader()
        writer.writerows(rows)
    for row in rows:
        print(
            "{case} {op} matches={matches} first={first_mismatch_input} expected={expected} actual={actual}".format(
                **row
            )
        )
    return 0 if all(row["matches"] == "1" for row in rows) else 1


if __name__ == "__main__":
    raise SystemExit(main())
