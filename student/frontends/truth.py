#!/usr/bin/env python3
"""Parser for ALS bit-plane truth tables.

Each benchmark line stores one output bit-plane.  The default interpretation
matches the project evaluator's ``read_truth -xf`` convention:
``input_index -> raw_index ^ ((1 << input_width) - 1)`` and
``line 0 -> output bit 0``.
"""

import argparse
import os
import sys


VALID_BIT_ORDERS = ("lsb_first", "msb_first")
VALID_INPUT_ORDERS = ("abc_xf", "raw")
ZERO = ord("0")
ONE = ord("1")


def case_from_path(path):
    base = os.path.basename(str(path))
    return os.path.splitext(base)[0]


def parse_int(value):
    try:
        return int(value, 0)
    except ValueError:
        raise argparse.ArgumentTypeError("invalid integer: {0}".format(value))


def is_power_of_two(value):
    return value > 0 and (value & (value - 1)) == 0


def log2_power_of_two(value):
    if not is_power_of_two(value):
        raise ValueError("expected a power of two, got {0}".format(value))
    return value.bit_length() - 1


def format_word(value, width):
    hex_digits = (width + 3) // 4
    if hex_digits < 1:
        hex_digits = 1
    return "0x{0:0{1}x}".format(value, hex_digits)


class TruthTable(object):
    """Bit-plane truth table with integer output lookup."""

    def __init__(self, path, bit_order="lsb_first", input_order="abc_xf"):
        if bit_order not in VALID_BIT_ORDERS:
            raise ValueError(
                "bit_order must be one of {0}".format(", ".join(VALID_BIT_ORDERS))
            )
        if input_order not in VALID_INPUT_ORDERS:
            raise ValueError(
                "input_order must be one of {0}".format(", ".join(VALID_INPUT_ORDERS))
            )

        self.path = str(path)
        self.case = case_from_path(path)
        self.bit_order = bit_order
        self.input_order = input_order
        self._planes = self._read_planes(self.path)

        self.output_width = len(self._planes)
        self.num_inputs = len(self._planes[0])
        self.input_width = log2_power_of_two(self.num_inputs)
        self.input_mask = self.num_inputs - 1

    @staticmethod
    def _read_planes(path):
        with open(path, "rb") as handle:
            planes = handle.read().splitlines()

        if not planes:
            raise ValueError("empty truth table: {0}".format(path))

        line_length = len(planes[0])
        if line_length == 0:
            raise ValueError("empty first bit-plane in {0}".format(path))

        for line_index, plane in enumerate(planes):
            if len(plane) != line_length:
                raise ValueError(
                    "line {0} has length {1}, expected {2}".format(
                        line_index + 1, len(plane), line_length
                    )
                )
            for char in plane:
                if char != ZERO and char != ONE:
                    raise ValueError(
                        "line {0} contains a non-binary character".format(
                            line_index + 1
                        )
                    )

        if not is_power_of_two(line_length):
            raise ValueError(
                "bit-plane length must be a power of two, got {0}".format(
                    line_length
                )
            )

        return planes

    def line_bit_index(self, line_index):
        if line_index < 0 or line_index >= self.output_width:
            raise IndexError("line index out of range: {0}".format(line_index))
        if self.bit_order == "lsb_first":
            return line_index
        return self.output_width - 1 - line_index

    def bit_line_index(self, bit_index):
        if bit_index < 0 or bit_index >= self.output_width:
            raise IndexError("output bit out of range: {0}".format(bit_index))
        if self.bit_order == "lsb_first":
            return bit_index
        return self.output_width - 1 - bit_index

    def truth_index(self, index):
        if index < 0 or index >= self.num_inputs:
            raise IndexError("input index out of range: {0}".format(index))
        if self.input_order == "raw":
            return index
        return self.input_mask ^ index

    def get_output_bit(self, index, bit_index):
        raw_index = self.truth_index(index)
        line_index = self.bit_line_index(bit_index)
        return 1 if self._planes[line_index][raw_index] == ONE else 0

    def get_output(self, index):
        raw_index = self.truth_index(index)

        value = 0
        for line_index, plane in enumerate(self._planes):
            if plane[raw_index] == ONE:
                value |= 1 << self.line_bit_index(line_index)
        return value

    def iter_outputs(self, limit=None):
        if limit is None:
            count = self.num_inputs
        else:
            if limit < 0:
                raise ValueError("limit must be non-negative")
            count = min(limit, self.num_inputs)

        for index in range(count):
            yield self.get_output(index)

    def bit_counts(self):
        counts = [0] * self.output_width
        for line_index, plane in enumerate(self._planes):
            counts[self.line_bit_index(line_index)] = plane.count(b"1")
        return counts

    def constant_bits(self):
        constants = []
        for bit_index, one_count in enumerate(self.bit_counts()):
            if one_count == 0:
                constants.append((bit_index, 0))
            elif one_count == self.num_inputs:
                constants.append((bit_index, 1))
        return constants

    def summary(self):
        return {
            "case": self.case,
            "path": self.path,
            "input_width": self.input_width,
            "output_width": self.output_width,
            "num_inputs": self.num_inputs,
            "bit_order": self.bit_order,
            "input_order": self.input_order,
        }


def print_summary(table):
    summary = table.summary()
    print("case: {0}".format(summary["case"]))
    print("path: {0}".format(summary["path"]))
    print("input_width: {0}".format(summary["input_width"]))
    print("output_width: {0}".format(summary["output_width"]))
    print("num_inputs: {0}".format(summary["num_inputs"]))
    print(
        "bit_order: {0} (line 0 -> output bit {1})".format(
            summary["bit_order"], table.line_bit_index(0)
        )
    )
    print("input_order: {0}".format(summary["input_order"]))

    constants = table.constant_bits()
    if constants:
        text = ", ".join(
            "out[{0}]={1}".format(bit_index, value)
            for bit_index, value in constants
        )
        print("constant_bits: {0}".format(text))
    else:
        print("constant_bits: none")

    counts = table.bit_counts()
    text = ", ".join(
        "out[{0}]={1}".format(bit_index, count)
        for bit_index, count in enumerate(counts)
    )
    print("one_counts: {0}".format(text))


def parse_args(argv):
    parser = argparse.ArgumentParser(description="Inspect an ALS truth table.")
    parser.add_argument("truth", help="Path to benchmarks/exNNN.truth.")
    parser.add_argument(
        "--bit-order",
        choices=VALID_BIT_ORDERS,
        default="lsb_first",
        help="Map file lines to output bit positions.",
    )
    parser.add_argument(
        "--input-order",
        choices=VALID_INPUT_ORDERS,
        default="abc_xf",
        help="Map numeric input index to truth-file character index.",
    )
    parser.add_argument(
        "--index",
        action="append",
        type=parse_int,
        default=[],
        help="Input index to decode. May be repeated.",
    )
    parser.add_argument(
        "--summary",
        action="store_true",
        help="Print width and bit-plane summary.",
    )
    return parser.parse_args(argv)


def main(argv=None):
    args = parse_args(argv)
    try:
        table = TruthTable(args.truth, bit_order=args.bit_order, input_order=args.input_order)
        if args.summary or not args.index:
            print_summary(table)
        for index in args.index:
            value = table.get_output(index)
            print(
                "index {0}: {1} ({2})".format(
                    index, format_word(value, table.output_width), value
                )
            )
    except (IOError, OSError, ValueError, IndexError) as error:
        print("truth.py: {0}".format(error), file=sys.stderr)
        return 2
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
