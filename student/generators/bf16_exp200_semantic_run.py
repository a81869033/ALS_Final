#!/usr/bin/env python3
"""Focused semantic BF16 exp reconstruction run for ex200.

This is not a broad variant search.  It first verifies that the truth table is
exactly DAZ + real exp + BF16 RNE + FTZ, then emits a few RTL shapes that encode
that semantic behavior with explicit BF16 field handling.
"""

import argparse
import csv
import json
import math
import struct
import subprocess
import sys
import time
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from student.backends.abc_flow import evaluate_aig
from student.frontends.truth import TruthTable
from student.frontends.yosys_synth import SynthError, synthesize_verilog


CASE = "ex200"
WIDTH = 16
EXP_BITS = 8
MANT_BITS = 7
EXP_MAX = 255
MANT_SIZE = 128
CANONICAL_NAN = 0x7FC0

FIELDNAMES = [
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

SUMMARY_FIELDNAMES = [
    "case",
    "best_candidate_id",
    "best_variant",
    "best_area",
    "best_delay",
    "best_adp",
    "reference_adp",
    "ratio_to_reference",
    "previous_best_adp",
    "ratio_to_previous_best",
    "notes",
]


def rel_path(path):
    return str(Path(path).resolve().relative_to(ROOT))


def const_word(width, value):
    digits = max(1, (width + 3) // 4)
    return "{0}'h{1:0{2}x}".format(width, value & ((1 << width) - 1), digits)


def write_text(path, text):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(text)


def write_csv(path, fieldnames, rows):
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(rows)


def bf16_to_float(bits):
    sign = (bits >> 15) & 1
    exp = (bits >> MANT_BITS) & 0xFF
    mant = bits & 0x7F
    if exp == 0:
        return -0.0 if sign else 0.0
    if exp == 0xFF:
        if mant:
            return float("nan")
        return float("-inf") if sign else float("inf")
    scale = 2.0 ** (exp - 127)
    return (-1.0 if sign else 1.0) * (1.0 + mant / 128.0) * scale


def float32_bits(value):
    return struct.unpack(">I", struct.pack(">f", value))[0]


def float_to_bf16_rne(value):
    if math.isnan(value):
        return CANONICAL_NAN
    if math.isinf(value):
        return 0x7F80 if value > 0 else 0xFF80
    if value == 0.0:
        return 0x8000 if math.copysign(1.0, value) < 0 else 0
    try:
        bits = float32_bits(value)
    except OverflowError:
        return 0x7F80 if value > 0 else 0xFF80
    lsb = (bits >> 16) & 1
    rounded = bits + 0x7FFF + lsb
    bf16 = (rounded >> 16) & 0xFFFF
    exp = (bf16 >> MANT_BITS) & 0xFF
    mant = bf16 & 0x7F
    if exp == 0:
        return bf16 & 0x8000
    if exp == 0xFF and mant != 0:
        return CANONICAL_NAN
    return bf16


def semantic_exp_model(bits):
    value = bf16_to_float(bits)
    if math.isnan(value):
        return CANONICAL_NAN
    if value == float("inf"):
        return 0x7F80
    if value == float("-inf"):
        return 0x0000
    try:
        result = math.exp(value)
    except OverflowError:
        return 0x7F80
    bf16 = float_to_bf16_rne(result)
    if ((bf16 >> MANT_BITS) & 0xFF) == 0:
        return 0x0000
    return bf16


def verify_semantic_model(outputs):
    mismatches = []
    for index, expected in enumerate(outputs):
        actual = semantic_exp_model(index)
        if actual != expected:
            mismatches.append((index, expected, actual))
            if len(mismatches) >= 5:
                break
    if mismatches:
        return False, "semantic model mismatches: {0}".format(mismatches)
    return True, "truth table equals DAZ + exp + BF16 RNE + FTZ"


def verify_outputs(outputs, model):
    for index, expected in enumerate(outputs):
        actual = model(index)
        if actual != expected:
            return False, "first mismatch index=0x{0:04x} expected=0x{1:04x} actual=0x{2:04x}".format(
                index,
                expected,
                actual,
            )
    return True, "exact over 65536 inputs"


def runs_for_values(values):
    runs = []
    start = 0
    prev = values[0]
    for index, value in enumerate(values[1:], 1):
        if value == prev:
            continue
        runs.append((start, index - 1, prev))
        start = index
        prev = value
    runs.append((start, len(values) - 1, prev))
    return runs


def active_exps(outputs, sign, low_const_exp, high_const_exp):
    exps = []
    for exp in range(1, EXP_MAX):
        if exp <= low_const_exp or exp >= high_const_exp:
            continue
        values = [outputs[(sign << 15) | (exp << MANT_BITS) | mant] for mant in range(MANT_SIZE)]
        if len(set(values)) != 1:
            exps.append(exp)
    return exps


def emit_mant_run_assign(lines, indent, values, target):
    runs = runs_for_values(values)
    for index, (start, end, value) in enumerate(runs):
        prefix = "if" if index == 0 else "else if"
        if index == len(runs) - 1:
            lines.append("{0}else {1} = {2};".format(indent, target, value))
        elif start == end:
            lines.append("{0}{1} (mant == {2}) {3} = {4};".format(indent, prefix, const_word(7, start), target, value))
        else:
            lines.append("{0}{1} (mant <= {2}) {3} = {4};".format(indent, prefix, const_word(7, end), target, value))
    return len(runs)


def module_header(module):
    return [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [15:0] out;",
        "  wire sign = in[15];",
        "  wire [7:0] exp = in[14:7];",
        "  wire [6:0] mant = in[6:0];",
    ]


def render_word_runs(outputs, module):
    lines = module_header(module)
    lines.extend(
        [
            "  reg [15:0] out_r;",
            "  always @* begin",
            "    if (exp == 8'hff && mant != 7'h00)",
            "      out_r = 16'h7fc0;",
            "    else if (exp == 8'hff)",
            "      out_r = sign ? 16'h0000 : 16'h7f80;",
            "    else if (exp == 8'h00)",
            "      out_r = 16'h3f80;",
            "    else if (!sign) begin",
            "      if (exp <= 8'd118)",
            "        out_r = 16'h3f80;",
            "      else if (exp == 8'd119)",
            "        out_r = 16'h3f81;",
            "      else if (exp >= 8'd134)",
            "        out_r = 16'h7f80;",
            "      else begin",
            "        case (exp)",
        ]
    )
    items = 0
    for exp in active_exps(outputs, 0, 119, 134):
        values = ["16'h{0:04x}".format(outputs[(exp << MANT_BITS) | mant]) for mant in range(MANT_SIZE)]
        lines.append("          8'd{0}: begin".format(exp))
        items += emit_mant_run_assign(lines, "            ", values, "out_r")
        lines.append("          end")
    lines.extend(
        [
            "          default: out_r = 16'h3f80;",
            "        endcase",
            "      end",
            "    end else begin",
            "      if (exp <= 8'd117)",
            "        out_r = 16'h3f80;",
            "      else if (exp >= 8'd134)",
            "        out_r = 16'h0000;",
            "      else begin",
            "        case (exp)",
        ]
    )
    for exp in active_exps(outputs, 1, 117, 134):
        values = ["16'h{0:04x}".format(outputs[0x8000 | (exp << MANT_BITS) | mant]) for mant in range(MANT_SIZE)]
        lines.append("          8'd{0}: begin".format(exp))
        items += emit_mant_run_assign(lines, "            ", values, "out_r")
        lines.append("          end")
    lines.extend(
        [
            "          default: out_r = 16'h3f80;",
            "        endcase",
            "      end",
            "    end",
            "  end",
            "  assign out = out_r;",
            "endmodule",
            "",
        ]
    )

    def model(index):
        return outputs[index]

    return "\n".join(lines), model, "semantic word run-length ranges={0}".format(items)


def emit_full_mant_case(lines, indent, values, target):
    lines.append("{0}case (mant)".format(indent))
    for mant, value in enumerate(values):
        lines.append("{0}  {1}: {2} = {3};".format(indent, const_word(7, mant), target, value))
    lines.append("{0}  default: {1} = {2};".format(indent, target, values[0]))
    lines.append("{0}endcase".format(indent))
    return len(values)


def emit_full_mant_parallel_case(lines, indent, values, target):
    lines.append("{0}(* parallel_case, full_case *) case (mant)".format(indent))
    for mant, value in enumerate(values):
        lines.append("{0}  {1}: {2} = {3};".format(indent, const_word(7, mant), target, value))
    lines.append("{0}  default: {1} = {2};".format(indent, target, values[0]))
    lines.append("{0}endcase".format(indent))
    return len(values)


def mode_value(values):
    counts = {}
    first = {}
    for index, value in enumerate(values):
        counts[value] = counts.get(value, 0) + 1
        first.setdefault(value, index)
    return min(counts, key=lambda value: (-counts[value], first[value], value))


def emit_mant_mode_exceptions(lines, indent, values, target):
    default = mode_value(values)
    lines.append("{0}{1} = {2};".format(indent, target, default))
    lines.append("{0}case (mant)".format(indent))
    items = 1
    for mant, value in enumerate(values):
        if value == default:
            continue
        lines.append("{0}  {1}: {2} = {3};".format(indent, const_word(7, mant), target, value))
        items += 1
    lines.append("{0}  default: begin end".format(indent))
    lines.append("{0}endcase".format(indent))
    return items


def casez_pattern(width, start, size):
    floating = int(math.log(size, 2))
    bits = []
    for bit in range(width - 1, -1, -1):
        if bit < floating:
            bits.append("?")
        else:
            bits.append("1" if (start >> bit) & 1 else "0")
    return "{0}'b{1}".format(width, "".join(bits))


def range_casez_patterns(width, start, end):
    patterns = []
    value = start
    while value <= end:
        lowbit = value & -value
        size = lowbit if lowbit else 1 << width
        while value + size - 1 > end:
            size >>= 1
        patterns.append(casez_pattern(width, value, size))
        value += size
    return patterns


def emit_mant_casez_runs(lines, indent, values, target):
    default = mode_value(values)
    lines.append("{0}{1} = {2};".format(indent, target, default))
    lines.append("{0}casez (mant)".format(indent))
    items = 1
    for start, end, value in runs_for_values(values):
        if value == default:
            continue
        for pattern in range_casez_patterns(7, start, end):
            lines.append("{0}  {1}: {2} = {3};".format(indent, pattern, target, value))
            items += 1
    lines.append("{0}  default: begin end".format(indent))
    lines.append("{0}endcase".format(indent))
    return items


def emit_mant_casez_all_runs(lines, indent, values, target):
    lines.append("{0}casez (mant)".format(indent))
    items = 0
    for start, end, value in runs_for_values(values):
        for pattern in range_casez_patterns(7, start, end):
            lines.append("{0}  {1}: {2} = {3};".format(indent, pattern, target, value))
            items += 1
    lines.append("{0}  default: {1} = {2};".format(indent, target, values[0]))
    lines.append("{0}endcase".format(indent))
    return items


def render_active_mant_cases(outputs, module):
    lines = module_header(module)
    lines.extend(
        [
            "  reg [15:0] out_r;",
            "  always @* begin",
            "    if (exp == 8'hff && mant != 7'h00)",
            "      out_r = 16'h7fc0;",
            "    else if (exp == 8'hff)",
            "      out_r = sign ? 16'h0000 : 16'h7f80;",
            "    else if (exp == 8'h00)",
            "      out_r = 16'h3f80;",
            "    else if (!sign) begin",
            "      if (exp <= 8'd118)",
            "        out_r = 16'h3f80;",
            "      else if (exp == 8'd119)",
            "        out_r = 16'h3f81;",
            "      else if (exp >= 8'd134)",
            "        out_r = 16'h7f80;",
            "      else begin",
            "        case (exp)",
        ]
    )
    items = 0
    for exp in active_exps(outputs, 0, 119, 134):
        values = ["16'h{0:04x}".format(outputs[(exp << MANT_BITS) | mant]) for mant in range(MANT_SIZE)]
        lines.append("          8'd{0}: begin".format(exp))
        items += emit_full_mant_case(lines, "            ", values, "out_r")
        lines.append("          end")
    lines.extend(
        [
            "          default: out_r = 16'h3f80;",
            "        endcase",
            "      end",
            "    end else begin",
            "      if (exp <= 8'd117)",
            "        out_r = 16'h3f80;",
            "      else if (exp >= 8'd134)",
            "        out_r = 16'h0000;",
            "      else begin",
            "        case (exp)",
        ]
    )
    for exp in active_exps(outputs, 1, 117, 134):
        values = ["16'h{0:04x}".format(outputs[0x8000 | (exp << MANT_BITS) | mant]) for mant in range(MANT_SIZE)]
        lines.append("          8'd{0}: begin".format(exp))
        items += emit_full_mant_case(lines, "            ", values, "out_r")
        lines.append("          end")
    lines.extend(
        [
            "          default: out_r = 16'h3f80;",
            "        endcase",
            "      end",
            "    end",
            "  end",
            "  assign out = out_r;",
            "endmodule",
            "",
        ]
    )

    def model(index):
        return outputs[index]

    return "\n".join(lines), model, "semantic active-exponent full mantissa cases={0}".format(items)


def render_default_one_overrides(outputs, module):
    lines = module_header(module)
    lines.extend(
        [
            "  wire [8:0] sign_exp = in[15:7];",
            "  reg [15:0] out_r;",
            "  always @* begin",
            "    out_r = 16'h3f80;",
            "    if (exp == 8'hff && mant != 7'h00) begin",
            "      out_r = 16'h7fc0;",
            "    end else begin",
            "      case (sign_exp)",
            "        9'h077: out_r = 16'h3f81;",
        ]
    )
    items = 1
    for exp in active_exps(outputs, 0, 119, 134):
        values = ["16'h{0:04x}".format(outputs[(exp << MANT_BITS) | mant]) for mant in range(MANT_SIZE)]
        lines.append("        {0}: begin".format(const_word(9, exp)))
        items += emit_full_mant_case(lines, "          ", values, "out_r")
        lines.append("        end")
    for exp in range(134, 255):
        lines.append("        {0}: out_r = 16'h7f80;".format(const_word(9, exp)))
        items += 1
    for exp in active_exps(outputs, 1, 117, 134):
        sign_exp = 0x100 | exp
        values = ["16'h{0:04x}".format(outputs[0x8000 | (exp << MANT_BITS) | mant]) for mant in range(MANT_SIZE)]
        lines.append("        {0}: begin".format(const_word(9, sign_exp)))
        items += emit_full_mant_case(lines, "          ", values, "out_r")
        lines.append("        end")
    for exp in range(134, 255):
        lines.append("        {0}: out_r = 16'h0000;".format(const_word(9, 0x100 | exp)))
        items += 1
    lines.extend(
        [
            "        9'h0ff: out_r = 16'h7f80;",
            "        9'h1ff: out_r = 16'h0000;",
            "        default: begin end",
            "      endcase",
            "    end",
            "  end",
            "  assign out = out_r;",
            "endmodule",
            "",
        ]
    )
    items += 2

    def model(index):
        return outputs[index]

    return "\n".join(lines), model, "semantic default-one override cases={0}".format(items)


def render_default_one_casez_saturation(outputs, module):
    lines = module_header(module)
    lines.extend(
        [
            "  wire [8:0] sign_exp = in[15:7];",
            "  reg [15:0] out_r;",
            "  always @* begin",
            "    out_r = 16'h3f80;",
            "    if (exp == 8'hff && mant != 7'h00) begin",
            "      out_r = 16'h7fc0;",
            "    end else begin",
            "      casez (sign_exp)",
            "        9'h077: out_r = 16'h3f81;",
        ]
    )
    items = 1
    for pattern in range_casez_patterns(9, 134, 254):
        lines.append("        {0}: out_r = 16'h7f80;".format(pattern))
        items += 1
    for pattern in range_casez_patterns(9, 0x100 | 134, 0x100 | 254):
        lines.append("        {0}: out_r = 16'h0000;".format(pattern))
        items += 1
    for exp in active_exps(outputs, 0, 119, 134):
        values = ["16'h{0:04x}".format(outputs[(exp << MANT_BITS) | mant]) for mant in range(MANT_SIZE)]
        lines.append("        {0}: begin".format(const_word(9, exp)))
        items += emit_full_mant_case(lines, "          ", values, "out_r")
        lines.append("        end")
    for exp in active_exps(outputs, 1, 117, 134):
        sign_exp = 0x100 | exp
        values = ["16'h{0:04x}".format(outputs[0x8000 | (exp << MANT_BITS) | mant]) for mant in range(MANT_SIZE)]
        lines.append("        {0}: begin".format(const_word(9, sign_exp)))
        items += emit_full_mant_case(lines, "          ", values, "out_r")
        lines.append("        end")
    lines.extend(
        [
            "        9'h0ff: out_r = 16'h7f80;",
            "        9'h1ff: out_r = 16'h0000;",
            "        default: begin end",
            "      endcase",
            "    end",
            "  end",
            "  assign out = out_r;",
            "endmodule",
            "",
        ]
    )
    items += 2

    def model(index):
        return outputs[index]

    return "\n".join(lines), model, "semantic default-one casez saturation items={0}".format(items)


def render_default_one_casez_active_first(outputs, module):
    lines = module_header(module)
    lines.extend(
        [
            "  wire [8:0] sign_exp = in[15:7];",
            "  reg [15:0] out_r;",
            "  always @* begin",
            "    out_r = 16'h3f80;",
            "    if (exp == 8'hff && mant != 7'h00) begin",
            "      out_r = 16'h7fc0;",
            "    end else begin",
            "      casez (sign_exp)",
            "        9'h077: out_r = 16'h3f81;",
        ]
    )
    items = 1
    for exp in active_exps(outputs, 0, 119, 134):
        values = ["16'h{0:04x}".format(outputs[(exp << MANT_BITS) | mant]) for mant in range(MANT_SIZE)]
        lines.append("        {0}: begin".format(const_word(9, exp)))
        items += emit_full_mant_case(lines, "          ", values, "out_r")
        lines.append("        end")
    for exp in active_exps(outputs, 1, 117, 134):
        sign_exp = 0x100 | exp
        values = ["16'h{0:04x}".format(outputs[0x8000 | (exp << MANT_BITS) | mant]) for mant in range(MANT_SIZE)]
        lines.append("        {0}: begin".format(const_word(9, sign_exp)))
        items += emit_full_mant_case(lines, "          ", values, "out_r")
        lines.append("        end")
    for pattern in range_casez_patterns(9, 134, 254):
        lines.append("        {0}: out_r = 16'h7f80;".format(pattern))
        items += 1
    for pattern in range_casez_patterns(9, 0x100 | 134, 0x100 | 254):
        lines.append("        {0}: out_r = 16'h0000;".format(pattern))
        items += 1
    lines.extend(
        [
            "        9'h0ff: out_r = 16'h7f80;",
            "        9'h1ff: out_r = 16'h0000;",
            "        default: begin end",
            "      endcase",
            "    end",
            "  end",
            "  assign out = out_r;",
            "endmodule",
            "",
        ]
    )
    items += 2

    def model(index):
        return outputs[index]

    return "\n".join(lines), model, "semantic default-one casez active-first items={0}".format(items)


def render_default_one_parallel_casez_saturation(outputs, module):
    lines = module_header(module)
    lines.extend(
        [
            "  wire [8:0] sign_exp = in[15:7];",
            "  reg [15:0] out_r;",
            "  always @* begin",
            "    out_r = 16'h3f80;",
            "    if (exp == 8'hff && mant != 7'h00) begin",
            "      out_r = 16'h7fc0;",
            "    end else begin",
            "      (* parallel_case, full_case *) casez (sign_exp)",
            "        9'h077: out_r = 16'h3f81;",
        ]
    )
    items = 1
    for pattern in range_casez_patterns(9, 134, 254):
        lines.append("        {0}: out_r = 16'h7f80;".format(pattern))
        items += 1
    for pattern in range_casez_patterns(9, 0x100 | 134, 0x100 | 254):
        lines.append("        {0}: out_r = 16'h0000;".format(pattern))
        items += 1
    for exp in active_exps(outputs, 0, 119, 134):
        values = ["16'h{0:04x}".format(outputs[(exp << MANT_BITS) | mant]) for mant in range(MANT_SIZE)]
        lines.append("        {0}: begin".format(const_word(9, exp)))
        items += emit_full_mant_parallel_case(lines, "          ", values, "out_r")
        lines.append("        end")
    for exp in active_exps(outputs, 1, 117, 134):
        sign_exp = 0x100 | exp
        values = ["16'h{0:04x}".format(outputs[0x8000 | (exp << MANT_BITS) | mant]) for mant in range(MANT_SIZE)]
        lines.append("        {0}: begin".format(const_word(9, sign_exp)))
        items += emit_full_mant_parallel_case(lines, "          ", values, "out_r")
        lines.append("        end")
    lines.extend(
        [
            "        9'h0ff: out_r = 16'h7f80;",
            "        9'h1ff: out_r = 16'h0000;",
            "        default: begin end",
            "      endcase",
            "    end",
            "  end",
            "  assign out = out_r;",
            "endmodule",
            "",
        ]
    )
    items += 2

    def model(index):
        return outputs[index]

    return "\n".join(lines), model, "semantic default-one parallel casez saturation items={0}".format(items)


def emit_bit_casez_runs(lines, indent, bit_values, bit_index, default_bit):
    selected = [(start, end, value) for start, end, value in runs_for_values(bit_values) if value != default_bit]
    if not selected:
        return 0
    lines.append("{0}casez (mant)".format(indent))
    items = 0
    for start, end, value in selected:
        for pattern in range_casez_patterns(7, start, end):
            lines.append("{0}  {1}: out_r[{2}] = 1'b{3};".format(indent, pattern, bit_index, value))
            items += 1
    lines.append("{0}  default: begin end".format(indent))
    lines.append("{0}endcase".format(indent))
    return items


def render_bitplane_casez(outputs, module):
    default_word = 0x3F80
    lines = module_header(module)
    lines.extend(
        [
            "  wire [8:0] sign_exp = in[15:7];",
            "  reg [15:0] out_r;",
            "  always @* begin",
            "    out_r = 16'h3f80;",
            "    if (exp == 8'hff && mant != 7'h00) begin",
            "      out_r = 16'h7fc0;",
            "    end else begin",
        ]
    )
    items = 0
    for bit in range(15):
        default_bit = (default_word >> bit) & 1
        bit_items = 0
        bit_lines = ["      casez (sign_exp)"]

        for sign_exp, value in ((0x077, 0x3F81), (0x0FF, 0x7F80), (0x1FF, 0x0000)):
            bit_value = (value >> bit) & 1
            if bit_value != default_bit:
                bit_lines.append("        {0}: out_r[{1}] = 1'b{2};".format(const_word(9, sign_exp), bit, bit_value))
                bit_items += 1

        for pattern in range_casez_patterns(9, 134, 254):
            bit_value = (0x7F80 >> bit) & 1
            if bit_value != default_bit:
                bit_lines.append("        {0}: out_r[{1}] = 1'b{2};".format(pattern, bit, bit_value))
                bit_items += 1
        for pattern in range_casez_patterns(9, 0x100 | 134, 0x100 | 254):
            bit_value = 0
            if bit_value != default_bit:
                bit_lines.append("        {0}: out_r[{1}] = 1'b{2};".format(pattern, bit, bit_value))
                bit_items += 1

        for exp in active_exps(outputs, 0, 119, 134):
            bit_values = [((outputs[(exp << MANT_BITS) | mant] >> bit) & 1) for mant in range(MANT_SIZE)]
            local = []
            local_items = emit_bit_casez_runs(local, "          ", bit_values, bit, default_bit)
            if local_items:
                bit_lines.append("        {0}: begin".format(const_word(9, exp)))
                bit_lines.extend(local)
                bit_lines.append("        end")
                bit_items += local_items
        for exp in active_exps(outputs, 1, 117, 134):
            sign_exp = 0x100 | exp
            bit_values = [((outputs[0x8000 | (exp << MANT_BITS) | mant] >> bit) & 1) for mant in range(MANT_SIZE)]
            local = []
            local_items = emit_bit_casez_runs(local, "          ", bit_values, bit, default_bit)
            if local_items:
                bit_lines.append("        {0}: begin".format(const_word(9, sign_exp)))
                bit_lines.extend(local)
                bit_lines.append("        end")
                bit_items += local_items

        if bit_items:
            bit_lines.append("        default: begin end")
            bit_lines.append("      endcase")
            lines.extend(bit_lines)
            items += bit_items
    lines.extend(
        [
            "    end",
            "  end",
            "  assign out = out_r;",
            "endmodule",
            "",
        ]
    )

    def model(index):
        return outputs[index]

    return "\n".join(lines), model, "semantic bitplane casez items={0}".format(items)


def render_delta_add(outputs, module):
    lines = module_header(module)
    lines.extend(
        [
            "  wire [8:0] sign_exp = in[15:7];",
            "  reg [14:0] base_mag;",
            "  reg [14:0] delta_mag;",
            "  reg sub_delta;",
            "  reg is_nan;",
            "  reg [15:0] out_r;",
            "  wire [14:0] normal_mag = sub_delta ? (base_mag - delta_mag) : (base_mag + delta_mag);",
            "  always @* begin",
            "    base_mag = 15'h3f80;",
            "    delta_mag = 15'h0000;",
            "    sub_delta = 1'b0;",
            "    is_nan = 1'b0;",
            "    casez (sign_exp)",
            "      9'h077: begin base_mag = 15'h3f81; end",
        ]
    )
    items = 1
    for pattern in range_casez_patterns(9, 134, 254):
        lines.append("      {0}: begin base_mag = 15'h7f80; end".format(pattern))
        items += 1
    for pattern in range_casez_patterns(9, 0x100 | 134, 0x100 | 254):
        lines.append("      {0}: begin base_mag = 15'h0000; end".format(pattern))
        items += 1
    lines.extend(
        [
            "      9'h0ff: begin base_mag = 15'h7f80; end",
            "      9'h1ff: begin base_mag = 15'h0000; end",
        ]
    )
    items += 2
    for exp in active_exps(outputs, 0, 119, 134):
        mags = [outputs[(exp << MANT_BITS) | mant] & 0x7FFF for mant in range(MANT_SIZE)]
        base = mags[0]
        deltas = ["15'h{0:04x}".format(value - base) for value in mags]
        lines.append("      {0}: begin".format(const_word(9, exp)))
        lines.append("        base_mag = 15'h{0:04x};".format(base))
        items += emit_full_mant_case(lines, "        ", deltas, "delta_mag")
        lines.append("      end")
    for exp in active_exps(outputs, 1, 117, 134):
        sign_exp = 0x100 | exp
        mags = [outputs[0x8000 | (exp << MANT_BITS) | mant] & 0x7FFF for mant in range(MANT_SIZE)]
        base = mags[0]
        deltas = ["15'h{0:04x}".format(base - value) for value in mags]
        lines.append("      {0}: begin".format(const_word(9, sign_exp)))
        lines.append("        base_mag = 15'h{0:04x};".format(base))
        lines.append("        sub_delta = 1'b1;")
        items += emit_full_mant_case(lines, "        ", deltas, "delta_mag")
        lines.append("      end")
    lines.extend(
        [
            "      default: begin end",
            "    endcase",
            "    if (exp == 8'hff && mant != 7'h00)",
            "      is_nan = 1'b1;",
            "    out_r = is_nan ? 16'h7fc0 : {1'b0, normal_mag};",
            "  end",
            "  assign out = out_r;",
            "endmodule",
            "",
        ]
    )

    def model(index):
        return outputs[index]

    return "\n".join(lines), model, "semantic base plus delta table items={0}".format(items)


def render_default_one_bool_saturation(outputs, module):
    lines = module_header(module)
    lines.extend(
        [
            "  wire [8:0] sign_exp = in[15:7];",
            "  wire exp_ge_134 = exp[7] & (|exp[6:3] | (exp[2] & exp[1]));",
            "  reg [15:0] out_r;",
            "  always @* begin",
            "    out_r = 16'h3f80;",
            "    if (exp == 8'hff && mant != 7'h00) begin",
            "      out_r = 16'h7fc0;",
            "    end else if (exp_ge_134) begin",
            "      out_r = sign ? 16'h0000 : 16'h7f80;",
            "    end else begin",
            "      case (sign_exp)",
            "        9'h077: out_r = 16'h3f81;",
        ]
    )
    items = 1
    for exp in active_exps(outputs, 0, 119, 134):
        values = ["16'h{0:04x}".format(outputs[(exp << MANT_BITS) | mant]) for mant in range(MANT_SIZE)]
        lines.append("        {0}: begin".format(const_word(9, exp)))
        items += emit_full_mant_case(lines, "          ", values, "out_r")
        lines.append("        end")
    for exp in active_exps(outputs, 1, 117, 134):
        sign_exp = 0x100 | exp
        values = ["16'h{0:04x}".format(outputs[0x8000 | (exp << MANT_BITS) | mant]) for mant in range(MANT_SIZE)]
        lines.append("        {0}: begin".format(const_word(9, sign_exp)))
        items += emit_full_mant_case(lines, "          ", values, "out_r")
        lines.append("        end")
    lines.extend(
        [
            "        default: begin end",
            "      endcase",
            "    end",
            "  end",
            "  assign out = out_r;",
            "endmodule",
            "",
        ]
    )

    def model(index):
        return outputs[index]

    return "\n".join(lines), model, "semantic default-one boolean saturation items={0}".format(items)


def render_default_one_sign_split_casez(outputs, module):
    lines = module_header(module)
    lines.extend(
        [
            "  reg [15:0] out_r;",
            "  always @* begin",
            "    out_r = 16'h3f80;",
            "    if (exp == 8'hff && mant != 7'h00) begin",
            "      out_r = 16'h7fc0;",
            "    end else if (!sign) begin",
            "      casez (exp)",
            "        8'd119: out_r = 16'h3f81;",
        ]
    )
    items = 1
    for pattern in range_casez_patterns(8, 134, 254):
        lines.append("        {0}: out_r = 16'h7f80;".format(pattern))
        items += 1
    lines.append("        8'hff: out_r = 16'h7f80;")
    items += 1
    for exp in active_exps(outputs, 0, 119, 134):
        values = ["16'h{0:04x}".format(outputs[(exp << MANT_BITS) | mant]) for mant in range(MANT_SIZE)]
        lines.append("        8'd{0}: begin".format(exp))
        items += emit_full_mant_case(lines, "          ", values, "out_r")
        lines.append("        end")
    lines.extend(
        [
            "        default: begin end",
            "      endcase",
            "    end else begin",
            "      casez (exp)",
        ]
    )
    for pattern in range_casez_patterns(8, 134, 254):
        lines.append("        {0}: out_r = 16'h0000;".format(pattern))
        items += 1
    lines.append("        8'hff: out_r = 16'h0000;")
    items += 1
    for exp in active_exps(outputs, 1, 117, 134):
        values = ["16'h{0:04x}".format(outputs[0x8000 | (exp << MANT_BITS) | mant]) for mant in range(MANT_SIZE)]
        lines.append("        8'd{0}: begin".format(exp))
        items += emit_full_mant_case(lines, "          ", values, "out_r")
        lines.append("        end")
    lines.extend(
        [
            "        default: begin end",
            "      endcase",
            "    end",
            "  end",
            "  assign out = out_r;",
            "endmodule",
            "",
        ]
    )

    def model(index):
        return outputs[index]

    return "\n".join(lines), model, "semantic default-one sign-split casez items={0}".format(items)


def render_default_one_per_exp_mode(outputs, module):
    return render_default_one_custom_mant(
        outputs,
        module,
        emit_mant_mode_exceptions,
        "semantic default-one per-exp mode exceptions",
    )


def render_default_one_per_exp_casez_runs(outputs, module):
    return render_default_one_custom_mant(
        outputs,
        module,
        emit_mant_casez_runs,
        "semantic default-one per-exp casez runs",
    )


def render_default_one_per_exp_full_casez_runs(outputs, module):
    return render_default_one_custom_mant(
        outputs,
        module,
        emit_mant_casez_all_runs,
        "semantic default-one per-exp full casez runs",
    )


def render_default_one_custom_mant(outputs, module, emit_mant, label):
    lines = module_header(module)
    lines.extend(
        [
            "  wire [8:0] sign_exp = in[15:7];",
            "  reg [15:0] out_r;",
            "  always @* begin",
            "    out_r = 16'h3f80;",
            "    if (exp == 8'hff && mant != 7'h00) begin",
            "      out_r = 16'h7fc0;",
            "    end else begin",
            "      casez (sign_exp)",
            "        9'h077: out_r = 16'h3f81;",
        ]
    )
    items = 1
    for pattern in range_casez_patterns(9, 134, 254):
        lines.append("        {0}: out_r = 16'h7f80;".format(pattern))
        items += 1
    for pattern in range_casez_patterns(9, 0x100 | 134, 0x100 | 254):
        lines.append("        {0}: out_r = 16'h0000;".format(pattern))
        items += 1
    for exp in active_exps(outputs, 0, 119, 134):
        values = ["16'h{0:04x}".format(outputs[(exp << MANT_BITS) | mant]) for mant in range(MANT_SIZE)]
        lines.append("        {0}: begin".format(const_word(9, exp)))
        items += emit_mant(lines, "          ", values, "out_r")
        lines.append("        end")
    for exp in active_exps(outputs, 1, 117, 134):
        sign_exp = 0x100 | exp
        values = ["16'h{0:04x}".format(outputs[0x8000 | (exp << MANT_BITS) | mant]) for mant in range(MANT_SIZE)]
        lines.append("        {0}: begin".format(const_word(9, sign_exp)))
        items += emit_mant(lines, "          ", values, "out_r")
        lines.append("        end")
    lines.extend(
        [
            "        9'h0ff: out_r = 16'h7f80;",
            "        9'h1ff: out_r = 16'h0000;",
            "        default: begin end",
            "      endcase",
            "    end",
            "  end",
            "  assign out = out_r;",
            "endmodule",
            "",
        ]
    )
    items += 2

    def model(index):
        return outputs[index]

    return "\n".join(lines), model, "{0} items={1}".format(label, items)


def render_default_one_hybrid_low_runs(outputs, module, max_runs):
    lines = module_header(module)
    lines.extend(
        [
            "  wire [8:0] sign_exp = in[15:7];",
            "  reg [15:0] out_r;",
            "  always @* begin",
            "    out_r = 16'h3f80;",
            "    if (exp == 8'hff && mant != 7'h00) begin",
            "      out_r = 16'h7fc0;",
            "    end else begin",
            "      casez (sign_exp)",
            "        9'h077: out_r = 16'h3f81;",
        ]
    )
    items = 1
    compressed = 0
    full = 0
    for pattern in range_casez_patterns(9, 134, 254):
        lines.append("        {0}: out_r = 16'h7f80;".format(pattern))
        items += 1
    for pattern in range_casez_patterns(9, 0x100 | 134, 0x100 | 254):
        lines.append("        {0}: out_r = 16'h0000;".format(pattern))
        items += 1
    for sign, low_const, high_const in ((0, 119, 134), (1, 117, 134)):
        for exp in active_exps(outputs, sign, low_const, high_const):
            sign_exp = (sign << 8) | exp
            values = [
                "16'h{0:04x}".format(outputs[(sign << 15) | (exp << MANT_BITS) | mant])
                for mant in range(MANT_SIZE)
            ]
            lines.append("        {0}: begin".format(const_word(9, sign_exp)))
            if len(runs_for_values(values)) <= max_runs:
                items += emit_mant_casez_all_runs(lines, "          ", values, "out_r")
                compressed += 1
            else:
                items += emit_full_mant_case(lines, "          ", values, "out_r")
                full += 1
            lines.append("        end")
    lines.extend(
        [
            "        9'h0ff: out_r = 16'h7f80;",
            "        9'h1ff: out_r = 16'h0000;",
            "        default: begin end",
            "      endcase",
            "    end",
            "  end",
            "  assign out = out_r;",
            "endmodule",
            "",
        ]
    )
    items += 2

    def model(index):
        return outputs[index]

    return (
        "\n".join(lines),
        model,
        "semantic hybrid low-run compression max_runs={0}; compressed_exps={1}; full_exps={2}; items={3}".format(
            max_runs,
            compressed,
            full,
            items,
        ),
    )


def render_default_one_hybrid_low_runs20(outputs, module):
    return render_default_one_hybrid_low_runs(outputs, module, 20)


def render_default_one_hybrid_low_runs48(outputs, module):
    return render_default_one_hybrid_low_runs(outputs, module, 48)


def lut_name(sign, exp):
    return ("p" if sign == 0 else "n") + str(exp)


def render_predecoded_active_luts(outputs, module):
    lines = module_header(module)
    lines.append("  wire [8:0] sign_exp = in[15:7];")
    items = 0
    active = []
    for sign, low_const, high_const in ((0, 119, 134), (1, 117, 134)):
        for exp in active_exps(outputs, sign, low_const, high_const):
            active.append((sign, exp))
            name = lut_name(sign, exp)
            lines.append("  reg [15:0] lut_{0};".format(name))
            lines.append("  always @* begin")
            lines.append("    case (mant)")
            for mant in range(MANT_SIZE):
                value = outputs[(sign << 15) | (exp << MANT_BITS) | mant]
                lines.append("      {0}: lut_{1} = 16'h{2:04x};".format(const_word(7, mant), name, value))
                items += 1
            lines.append("      default: lut_{0} = 16'h{1:04x};".format(name, outputs[(sign << 15) | (exp << MANT_BITS)]))
            lines.append("    endcase")
            lines.append("  end")
    lines.extend(
        [
            "  reg [15:0] out_r;",
            "  always @* begin",
            "    out_r = 16'h3f80;",
            "    if (exp == 8'hff && mant != 7'h00) begin",
            "      out_r = 16'h7fc0;",
            "    end else begin",
            "      casez (sign_exp)",
            "        9'h077: out_r = 16'h3f81;",
        ]
    )
    items += 1
    for pattern in range_casez_patterns(9, 134, 254):
        lines.append("        {0}: out_r = 16'h7f80;".format(pattern))
        items += 1
    for pattern in range_casez_patterns(9, 0x100 | 134, 0x100 | 254):
        lines.append("        {0}: out_r = 16'h0000;".format(pattern))
        items += 1
    for sign, exp in active:
        lines.append("        {0}: out_r = lut_{1};".format(const_word(9, (sign << 8) | exp), lut_name(sign, exp)))
        items += 1
    lines.extend(
        [
            "        9'h0ff: out_r = 16'h7f80;",
            "        9'h1ff: out_r = 16'h0000;",
            "        default: begin end",
            "      endcase",
            "    end",
            "  end",
            "  assign out = out_r;",
            "endmodule",
            "",
        ]
    )
    items += 2

    def model(index):
        return outputs[index]

    return "\n".join(lines), model, "semantic predecoded active LUTs items={0}".format(items)


def render_default_one_casez_all_special(outputs, module):
    lines = module_header(module)
    lines.extend(
        [
            "  wire [8:0] sign_exp = in[15:7];",
            "  reg [15:0] out_r;",
            "  always @* begin",
            "    out_r = 16'h3f80;",
            "    casez (sign_exp)",
            "      9'h077: out_r = 16'h3f81;",
        ]
    )
    items = 1
    for pattern in range_casez_patterns(9, 134, 254):
        lines.append("      {0}: out_r = 16'h7f80;".format(pattern))
        items += 1
    for pattern in range_casez_patterns(9, 0x100 | 134, 0x100 | 254):
        lines.append("      {0}: out_r = 16'h0000;".format(pattern))
        items += 1
    for exp in active_exps(outputs, 0, 119, 134):
        values = ["16'h{0:04x}".format(outputs[(exp << MANT_BITS) | mant]) for mant in range(MANT_SIZE)]
        lines.append("      {0}: begin".format(const_word(9, exp)))
        items += emit_full_mant_case(lines, "        ", values, "out_r")
        lines.append("      end")
    for exp in active_exps(outputs, 1, 117, 134):
        sign_exp = 0x100 | exp
        values = ["16'h{0:04x}".format(outputs[0x8000 | (exp << MANT_BITS) | mant]) for mant in range(MANT_SIZE)]
        lines.append("      {0}: begin".format(const_word(9, sign_exp)))
        items += emit_full_mant_case(lines, "        ", values, "out_r")
        lines.append("      end")
    lines.extend(
        [
            "      9'h0ff: out_r = (mant == 7'h00) ? 16'h7f80 : 16'h7fc0;",
            "      9'h1ff: out_r = (mant == 7'h00) ? 16'h0000 : 16'h7fc0;",
            "      default: begin end",
            "    endcase",
            "  end",
            "  assign out = out_r;",
            "endmodule",
            "",
        ]
    )
    items += 2

    def model(index):
        return outputs[index]

    return "\n".join(lines), model, "semantic default-one casez all-special items={0}".format(items)


def render_field_split(outputs, module):
    lines = module_header(module)
    lines.extend(
        [
            "  reg [7:0] out_exp;",
            "  reg [6:0] out_mant;",
            "  always @* begin",
            "    out_exp = 8'h7f;",
            "    out_mant = 7'h00;",
            "    if (exp == 8'hff && mant != 7'h00) begin",
            "      out_exp = 8'hff; out_mant = 7'h40;",
            "    end else if (exp == 8'hff) begin",
            "      out_exp = sign ? 8'h00 : 8'hff; out_mant = 7'h00;",
            "    end else if (exp == 8'h00) begin",
            "      out_exp = 8'h7f; out_mant = 7'h00;",
            "    end else if (!sign) begin",
            "      if (exp <= 8'd118) begin",
            "        out_exp = 8'h7f; out_mant = 7'h00;",
            "      end else if (exp == 8'd119) begin",
            "        out_exp = 8'h7f; out_mant = 7'h01;",
            "      end else if (exp >= 8'd134) begin",
            "        out_exp = 8'hff; out_mant = 7'h00;",
            "      end else begin",
            "        case (exp)",
        ]
    )
    items = 0
    for exp in active_exps(outputs, 0, 119, 134):
        exp_values = ["8'h{0:02x}".format((outputs[(exp << MANT_BITS) | mant] >> MANT_BITS) & 0xFF) for mant in range(MANT_SIZE)]
        mant_values = ["7'h{0:02x}".format(outputs[(exp << MANT_BITS) | mant] & 0x7F) for mant in range(MANT_SIZE)]
        lines.append("          8'd{0}: begin".format(exp))
        items += emit_mant_run_assign(lines, "            ", exp_values, "out_exp")
        items += emit_mant_run_assign(lines, "            ", mant_values, "out_mant")
        lines.append("          end")
    lines.extend(
        [
            "          default: begin end",
            "        endcase",
            "      end",
            "    end else begin",
            "      if (exp <= 8'd117) begin",
            "        out_exp = 8'h7f; out_mant = 7'h00;",
            "      end else if (exp >= 8'd134) begin",
            "        out_exp = 8'h00; out_mant = 7'h00;",
            "      end else begin",
            "        case (exp)",
        ]
    )
    for exp in active_exps(outputs, 1, 117, 134):
        exp_values = ["8'h{0:02x}".format((outputs[0x8000 | (exp << MANT_BITS) | mant] >> MANT_BITS) & 0xFF) for mant in range(MANT_SIZE)]
        mant_values = ["7'h{0:02x}".format(outputs[0x8000 | (exp << MANT_BITS) | mant] & 0x7F) for mant in range(MANT_SIZE)]
        lines.append("          8'd{0}: begin".format(exp))
        items += emit_mant_run_assign(lines, "            ", exp_values, "out_exp")
        items += emit_mant_run_assign(lines, "            ", mant_values, "out_mant")
        lines.append("          end")
    lines.extend(
        [
            "          default: begin end",
            "        endcase",
            "      end",
            "    end",
            "  end",
            "  assign out = {1'b0, out_exp, out_mant};",
            "endmodule",
            "",
        ]
    )

    def model(index):
        return outputs[index]

    return "\n".join(lines), model, "semantic field-split ranges={0}".format(items)


def emit_mag_thresholds(lines, indent, pairs, target):
    runs = []
    if pairs:
        start_mag, prev_value = pairs[0]
        prev_mag = start_mag
        for mag, value in pairs[1:]:
            if value == prev_value and mag == prev_mag + 1:
                prev_mag = mag
                continue
            runs.append((start_mag, prev_mag, prev_value))
            start_mag, prev_mag, prev_value = mag, mag, value
        runs.append((start_mag, prev_mag, prev_value))
    for index, (_start, end, value) in enumerate(runs):
        prefix = "if" if index == 0 else "else if"
        if index == len(runs) - 1:
            lines.append("{0}else {1} = {2};".format(indent, target, value))
        else:
            lines.append("{0}{1} (mag <= {2}) {3} = {4};".format(indent, prefix, const_word(15, end), target, value))
    return len(runs)


def render_monotonic_threshold(outputs, module):
    lines = module_header(module)
    lines.extend(
        [
            "  wire [14:0] mag = in[14:0];",
            "  reg [15:0] out_r;",
            "  always @* begin",
            "    if (exp == 8'hff && mant != 7'h00)",
            "      out_r = 16'h7fc0;",
            "    else if (exp == 8'hff)",
            "      out_r = sign ? 16'h0000 : 16'h7f80;",
            "    else if (exp == 8'h00)",
            "      out_r = 16'h3f80;",
            "    else if (!sign) begin",
            "      if (exp <= 8'd118)",
            "        out_r = 16'h3f80;",
            "      else if (exp >= 8'd134)",
            "        out_r = 16'h7f80;",
            "      else begin",
        ]
    )
    pos_pairs = []
    for exp in range(119, 134):
        for mant in range(MANT_SIZE):
            mag = (exp << MANT_BITS) | mant
            pos_pairs.append((mag, "16'h{0:04x}".format(outputs[mag])))
    items = emit_mag_thresholds(lines, "        ", pos_pairs, "out_r")
    lines.extend(
        [
            "      end",
            "    end else begin",
            "      if (exp <= 8'd117)",
            "        out_r = 16'h3f80;",
            "      else if (exp >= 8'd134)",
            "        out_r = 16'h0000;",
            "      else begin",
        ]
    )
    neg_pairs = []
    for exp in range(118, 134):
        for mant in range(MANT_SIZE):
            mag = (exp << MANT_BITS) | mant
            neg_pairs.append((mag, "16'h{0:04x}".format(outputs[0x8000 | mag])))
    items += emit_mag_thresholds(lines, "        ", neg_pairs, "out_r")
    lines.extend(
        [
            "      end",
            "    end",
            "  end",
            "  assign out = out_r;",
            "endmodule",
            "",
        ]
    )

    def model(index):
        return outputs[index]

    return "\n".join(lines), model, "semantic monotonic thresholds={0}".format(items)


VARIANTS = [
    ("semantic_exp_predecoded_active_luts", render_predecoded_active_luts),
    ("semantic_exp_hybrid_low_runs48", render_default_one_hybrid_low_runs48),
    ("semantic_exp_hybrid_low_runs20", render_default_one_hybrid_low_runs20),
    ("semantic_exp_default_one_per_exp_full_casez_runs", render_default_one_per_exp_full_casez_runs),
    ("semantic_exp_default_one_bool_saturation", render_default_one_bool_saturation),
    ("semantic_exp_delta_add", render_delta_add),
    ("semantic_exp_bitplane_casez", render_bitplane_casez),
    ("semantic_exp_default_one_casez_active_first", render_default_one_casez_active_first),
    ("semantic_exp_default_one_sign_split_casez", render_default_one_sign_split_casez),
    ("semantic_exp_default_one_parallel_casez_saturation", render_default_one_parallel_casez_saturation),
    ("semantic_exp_default_one_per_exp_casez_runs", render_default_one_per_exp_casez_runs),
    ("semantic_exp_default_one_per_exp_mode", render_default_one_per_exp_mode),
    ("semantic_exp_default_one_casez_all_special", render_default_one_casez_all_special),
    ("semantic_exp_default_one_casez_saturation", render_default_one_casez_saturation),
    ("semantic_exp_default_one_overrides", render_default_one_overrides),
    ("semantic_exp_active_mant_cases", render_active_mant_cases),
    ("semantic_exp_word_runs", render_word_runs),
    ("semantic_exp_field_split", render_field_split),
    ("semantic_exp_monotonic_thresholds", render_monotonic_threshold),
]


def load_reference_adp(path, case):
    if not path.is_file():
        return None
    with path.open(newline="") as handle:
        for row in csv.DictReader(handle):
            if row.get("case") == case:
                return int(float(row.get("adp", "0")))
    return None


def parse_args(argv=None):
    parser = argparse.ArgumentParser(description="Run focused ex200 BF16 exp semantic RTL candidates.")
    parser.add_argument("--work-dir", type=Path, required=True)
    parser.add_argument("--run-dir", type=Path, required=True)
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--reference", type=Path, default=ROOT / "reference_result.csv")
    parser.add_argument("--previous-best-adp", type=int, default=63733)
    parser.add_argument("--abc", type=Path, default=ROOT / "student" / "abc")
    parser.add_argument("--yosys", type=Path, default=ROOT / "student" / "tools" / "conda-env" / "bin" / "yosys")
    parser.add_argument("--timeout", type=int, default=900)
    parser.add_argument(
        "--variants",
        default=",".join(name for name, _renderer in VARIANTS),
        help="Comma-separated variant names to run.",
    )
    return parser.parse_args(argv)


def main(argv=None):
    args = parse_args(argv)
    truth_path = args.benchmarks / "{0}.truth".format(CASE)
    outputs = list(TruthTable(truth_path).iter_outputs())
    semantic_ok, semantic_note = verify_semantic_model(outputs)
    if not semantic_ok:
        raise RuntimeError(semantic_note)

    case_work = args.work_dir / CASE
    verilog_dir = case_work / "verilog"
    aig_dir = case_work / "aigs"
    log_dir = case_work / "logs"
    result_dir = args.run_dir / "results"
    rows = []

    requested = set(item.strip() for item in args.variants.split(",") if item.strip())
    selected = [(variant, renderer) for variant, renderer in VARIANTS if variant in requested]
    if not selected:
        raise RuntimeError("no variants selected from: {0}".format(args.variants))

    for variant, renderer in selected:
        candidate_id = "{0}_bf16_exp_{1}".format(CASE, variant)
        module = candidate_id
        verilog_path = verilog_dir / "{0}.v".format(candidate_id)
        aig_path = aig_dir / "{0}.aig".format(candidate_id)
        script_path = log_dir / "{0}.ys".format(candidate_id)
        log_path = log_dir / "{0}.yosys.log".format(candidate_id)
        row = {
            "case": CASE,
            "candidate_id": candidate_id,
            "hypothesis": "bf16_exp_daz_rne_ftz",
            "variant": variant,
            "verilog_path": rel_path(verilog_path),
            "aig_path": rel_path(aig_path),
            "verified_truth": "0",
            "equivalent": "0",
            "area": "",
            "delay": "",
            "adp": "",
            "notes": "",
        }
        try:
            verilog, model, meta = renderer(outputs, module)
            verified, verify_note = verify_outputs(outputs, model)
            row["verified_truth"] = "1" if verified else "0"
            row["notes"] = "{0}; {1}; {2}".format(semantic_note, meta, verify_note)
            write_text(verilog_path, verilog)
            if verified:
                yosys_log = synthesize_verilog(
                    verilog=verilog_path,
                    module=module,
                    output=aig_path,
                    yosys=args.yosys,
                    timeout=args.timeout,
                    use_abc=True,
                    script_out=script_path,
                )
                write_text(log_path, yosys_log)
                evaluated = evaluate_aig(
                    case=CASE,
                    candidate_id=candidate_id,
                    parent_id="bf16_exp_semantic",
                    source="semantic_verilog",
                    tool_chain="yosys_frontend",
                    aig_path=aig_path,
                    truth=truth_path,
                    abc=args.abc,
                    notes=row["notes"],
                    timeout=args.timeout,
                )
                row["equivalent"] = "1" if evaluated.equivalent else "0"
                row["area"] = "" if evaluated.area is None else str(evaluated.area)
                row["delay"] = "" if evaluated.delay is None else str(evaluated.delay)
                row["adp"] = "" if evaluated.adp is None else str(evaluated.adp)
                row["notes"] = evaluated.notes
        except (SynthError, OSError, RuntimeError, subprocess.TimeoutExpired) as exc:
            row["notes"] = "{0}: {1}".format(type(exc).__name__, exc)[:1000]
        rows.append(row)
        print("{0}: eq={1} area={2} delay={3} adp={4}".format(
            variant,
            row["equivalent"],
            row["area"],
            row["delay"],
            row["adp"],
        ))

    valid = [row for row in rows if row["equivalent"] == "1" and row["adp"]]
    best = min(valid, key=lambda row: int(row["adp"])) if valid else None
    reference_adp = load_reference_adp(args.reference, CASE)
    summary_rows = []
    if best is not None:
        summary_rows.append(
            {
                "case": CASE,
                "best_candidate_id": best["candidate_id"],
                "best_variant": best["variant"],
                "best_area": best["area"],
                "best_delay": best["delay"],
                "best_adp": best["adp"],
                "reference_adp": "" if reference_adp is None else str(reference_adp),
                "ratio_to_reference": "" if reference_adp is None else "{0:.6f}".format(int(best["adp"]) / reference_adp),
                "previous_best_adp": str(args.previous_best_adp),
                "ratio_to_previous_best": "{0:.6f}".format(int(best["adp"]) / args.previous_best_adp),
                "notes": "focused semantic BF16 exp RTL; no backend portfolio",
            }
        )

    write_csv(result_dir / "candidates.csv", FIELDNAMES, rows)
    write_csv(result_dir / "best.csv", FIELDNAMES, [best] if best is not None else [])
    write_csv(result_dir / "summary.csv", SUMMARY_FIELDNAMES, summary_rows)
    write_text(
        case_work / "manifest.json",
        json.dumps({"case": CASE, "semantic_model": semantic_note, "variants": rows}, indent=2, sort_keys=True) + "\n",
    )
    print("Results: {0}".format(result_dir / "candidates.csv"))
    print("Best: {0}".format(result_dir / "best.csv"))
    return 0 if best is not None else 1


if __name__ == "__main__":
    raise SystemExit(main())
