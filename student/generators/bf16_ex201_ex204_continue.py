#!/usr/bin/env python3
"""Continuation frontend-only semantic factoring for BF16 ex201-ex204.

This script keeps the search narrow: it emits truth-derived Verilog shapes that
factor already identified semantic cases by sign/exponent and mantissa hi/lo
pieces.  It does not run backend optimization portfolios.
"""

import argparse
import csv
import json
import re
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
from student.generators.bf16_ex201_ex204_semantic_run import (
    CASE_INFO,
    const_word,
    grouped_runs,
    mode_value,
    range_casez_patterns,
    rel_path,
    write_csv,
    write_text,
)


DEFAULT_RUN_ID = "ex201_ex204_frontend_semantic_continue_20260605_1732"
DEFAULT_ABC = ROOT / "student" / "tools" / "abc" / "src" / "abc"

RESULT_FIELDS = [
    "case",
    "candidate_id",
    "hypothesis",
    "function_guess",
    "variant",
    "verilog_path",
    "aig_path",
    "verified_truth",
    "equivalent",
    "area",
    "delay",
    "adp",
    "runtime_sec",
    "notes",
]

BEST_FIELDS = [
    "case",
    "candidate_id",
    "hypothesis",
    "function_guess",
    "variant",
    "verilog_path",
    "aig_path",
    "verified_truth",
    "equivalent",
    "area",
    "delay",
    "adp",
    "reference_adp",
    "ratio_to_reference",
    "within_1p5_reference",
    "beats_reference",
    "notes",
]

SUMMARY_FIELDS = [
    "case",
    "best_candidate_id",
    "best_area",
    "best_delay",
    "best_adp",
    "reference_adp",
    "ratio_to_reference",
    "within_1p5_reference",
    "beats_reference",
    "notes",
]


def read_reference_adp(path):
    refs = {}
    with Path(path).open() as handle:
        reader = csv.DictReader(handle)
        for row in reader:
            value = row.get("ADP", row.get("adp"))
            refs[row["case"]] = int(value)
    return refs


def module_header(module):
    return [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [15:0] out;",
        "  wire [8:0] sign_exp = in[15:7];",
        "  wire [6:0] mant = in[6:0];",
        "  wire mant_hi1 = mant[6];",
        "  wire [5:0] mant_lo6 = mant[5:0];",
        "  wire [1:0] mant_hi2 = mant[6:5];",
        "  wire [4:0] mant_lo5 = mant[4:0];",
        "  wire [2:0] mant_hi3 = mant[6:4];",
        "  wire [3:0] mant_lo4 = mant[3:0];",
        "  wire [3:0] mant_hi4 = mant[6:3];",
        "  wire [2:0] mant_lo3 = mant[2:0];",
        "  wire [4:0] mant_hi5 = mant[6:2];",
        "  wire [1:0] mant_lo2 = mant[1:0];",
        "  wire [5:0] mant_hi6 = mant[6:1];",
        "  wire mant_lo1 = mant[0];",
    ]


def active_sign_exps(outputs):
    active = []
    for sign_exp in range(512):
        values = [outputs[(sign_exp << 7) | mant] for mant in range(128)]
        if len(set(values)) > 1:
            active.append(sign_exp)
    return active


def emit_const_sign_exp_ranges(lines, outputs, target, value_width, default, indent):
    by_value = {}
    for sign_exp in range(512):
        values = [outputs[(sign_exp << 7) | mant] for mant in range(128)]
        if len(set(values)) == 1 and values[0] != default:
            by_value.setdefault(values[0], []).append(sign_exp)
    items = 0
    for value in sorted(by_value):
        for start, end in grouped_runs(by_value[value]):
            for pattern in range_casez_patterns(9, start, end):
                lines.append(
                    "{0}{1}: {2} = {3};".format(
                        indent,
                        pattern,
                        target,
                        const_word(value_width, value),
                    )
                )
                items += 1
    return items


def emit_word_hi_lo(lines, outputs, sign_exp, hi_bits, mode):
    hi_count = 1 << hi_bits
    lo_bits = 7 - hi_bits
    hi_name = "mant_hi{0}".format(hi_bits)
    lo_name = "mant_lo{0}".format(lo_bits)
    lines.append("        {0}: begin".format(const_word(9, sign_exp)))
    lines.append("          case ({0})".format(hi_name))
    items = 0
    for hi in range(hi_count):
        values = [
            outputs[(sign_exp << 7) | (hi << lo_bits) | lo]
            for lo in range(1 << lo_bits)
        ]
        if mode == "default_override":
            base = mode_value(values)
        else:
            base = values[0]
        differing = [(lo, value) for lo, value in enumerate(values) if value != base]
        lines.append("            {0}: begin".format(const_word(hi_bits, hi)))
        lines.append("              out_r = {0};".format(const_word(16, base)))
        if differing:
            lines.append("              case ({0})".format(lo_name))
            for lo, value in differing:
                lines.append(
                    "                {0}: out_r = {1};".format(
                        const_word(lo_bits, lo), const_word(16, value)
                    )
                )
                items += 1
            lines.append("                default: begin end")
            lines.append("              endcase")
        lines.append("            end")
        items += 1
    lines.append("            default: begin end")
    lines.append("          endcase")
    lines.append("        end")
    return items


def emit_field_hi_lo(lines, outputs, sign_exp, hi_bits, mode):
    hi_count = 1 << hi_bits
    lo_bits = 7 - hi_bits
    hi_name = "mant_hi{0}".format(hi_bits)
    lo_name = "mant_lo{0}".format(lo_bits)
    lines.append("        {0}: begin".format(const_word(9, sign_exp)))
    lines.append("          case ({0})".format(hi_name))
    items = 0
    for hi in range(hi_count):
        values = [
            outputs[(sign_exp << 7) | (hi << lo_bits) | lo]
            for lo in range(1 << lo_bits)
        ]
        if mode == "default_override":
            base = mode_value(values)
        else:
            base = values[0]
        sign_base = (base >> 15) & 1
        exp_base = (base >> 7) & 0xFF
        mant_base = base & 0x7F
        differing = [(lo, value) for lo, value in enumerate(values) if value != base]
        lines.append("            {0}: begin".format(const_word(hi_bits, hi)))
        lines.append(
            "              out_sign = 1'b{0}; out_exp = {1}; out_mant = {2};".format(
                sign_base,
                const_word(8, exp_base),
                const_word(7, mant_base),
            )
        )
        if differing:
            lines.append("              case ({0})".format(lo_name))
            for lo, value in differing:
                sign_bit = (value >> 15) & 1
                exp_bits = (value >> 7) & 0xFF
                mant_bits = value & 0x7F
                lines.append(
                    "                {0}: begin out_sign = 1'b{1}; out_exp = {2}; out_mant = {3}; end".format(
                        const_word(lo_bits, lo),
                        sign_bit,
                        const_word(8, exp_bits),
                        const_word(7, mant_bits),
                    )
                )
                items += 1
            lines.append("                default: begin end")
            lines.append("              endcase")
        lines.append("            end")
        items += 1
    lines.append("            default: begin end")
    lines.append("          endcase")
    lines.append("        end")
    return items


def render_hi_lo(outputs, module, field_mode, hi_bits, default_mode):
    default = mode_value(outputs)
    lines = module_header(module)
    if field_mode:
        lines.extend(
            [
                "  reg out_sign;",
                "  reg [7:0] out_exp;",
                "  reg [6:0] out_mant;",
                "  always @* begin",
                "    out_sign = 1'b{0};".format((default >> 15) & 1),
                "    out_exp = {0};".format(const_word(8, (default >> 7) & 0xFF)),
                "    out_mant = {0};".format(const_word(7, default & 0x7F)),
                "    casez (sign_exp)",
            ]
        )
        items = emit_const_sign_exp_ranges(lines, outputs, "{out_sign, out_exp, out_mant}", 16, default, "      ")
        for sign_exp in active_sign_exps(outputs):
            items += emit_field_hi_lo(lines, outputs, sign_exp, hi_bits, default_mode)
        lines.extend(
            [
                "      default: begin end",
                "    endcase",
                "  end",
                "  assign out = {out_sign, out_exp, out_mant};",
                "endmodule",
                "",
            ]
        )
    else:
        lines.extend(
            [
                "  reg [15:0] out_r;",
                "  always @* begin",
                "    out_r = {0};".format(const_word(16, default)),
                "    casez (sign_exp)",
            ]
        )
        items = emit_const_sign_exp_ranges(lines, outputs, "out_r", 16, default, "      ")
        for sign_exp in active_sign_exps(outputs):
            items += emit_word_hi_lo(lines, outputs, sign_exp, hi_bits, default_mode)
        lines.extend(
            [
                "      default: begin end",
                "    endcase",
                "  end",
                "  assign out = out_r;",
                "endmodule",
                "",
            ]
        )
    note = "hi_lo split field_mode={0} hi_bits={1} default_mode={2} items={3}".format(
        field_mode,
        hi_bits,
        default_mode,
        items,
    )
    return "\n".join(lines), note


def emit_base_delta_hi_lo(lines, outputs, sign_exp, hi_bits, op):
    hi_count = 1 << hi_bits
    lo_bits = 7 - hi_bits
    hi_name = "mant_hi{0}".format(hi_bits)
    lo_name = "mant_lo{0}".format(lo_bits)
    lines.append("        {0}: begin".format(const_word(9, sign_exp)))
    lines.append("          case ({0})".format(hi_name))
    bases = {}
    for hi in range(hi_count):
        base = outputs[(sign_exp << 7) | (hi << lo_bits)]
        bases[hi] = base
        lines.append("            {0}: base_word = {1};".format(const_word(hi_bits, hi), const_word(16, base)))
    lines.append("            default: begin end")
    lines.append("          endcase")
    lines.append("          case ({0})".format(hi_name))
    items = hi_count
    for hi in range(hi_count):
        base = bases[hi]
        values = []
        for lo in range(1 << lo_bits):
            value = outputs[(sign_exp << 7) | (hi << lo_bits) | lo]
            if op == "xor":
                values.append(value ^ base)
            else:
                values.append((value - base) & 0xFFFF)
        default = mode_value(values)
        differing = [(lo, value) for lo, value in enumerate(values) if value != default]
        if not differing and default == 0:
            continue
        lines.append("            {0}: begin".format(const_word(hi_bits, hi)))
        lines.append("              delta_word = {0};".format(const_word(16, default)))
        if differing:
            lines.append("              case ({0})".format(lo_name))
            for lo, value in differing:
                lines.append(
                    "                {0}: delta_word = {1};".format(
                        const_word(lo_bits, lo), const_word(16, value)
                    )
                )
                items += 1
            lines.append("                default: begin end")
            lines.append("              endcase")
        lines.append("            end")
        items += 1
    lines.append("            default: begin end")
    lines.append("          endcase")
    lines.append("        end")
    return items


def render_base_delta_hi_lo(outputs, module, hi_bits, op):
    default = mode_value(outputs)
    lines = module_header(module)
    lines.extend(
        [
            "  reg [15:0] base_word;",
            "  reg [15:0] delta_word;",
            "  always @* begin",
            "    base_word = {0};".format(const_word(16, default)),
            "    delta_word = 16'h0000;",
            "    casez (sign_exp)",
        ]
    )
    items = emit_const_sign_exp_ranges(lines, outputs, "base_word", 16, default, "      ")
    for sign_exp in active_sign_exps(outputs):
        items += emit_base_delta_hi_lo(lines, outputs, sign_exp, hi_bits, op)
    if op == "xor":
        expr = "base_word ^ delta_word"
    else:
        expr = "base_word + delta_word"
    lines.extend(
        [
            "      default: begin end",
            "    endcase",
            "  end",
            "  assign out = {0};".format(expr),
            "endmodule",
            "",
        ]
    )
    note = "base_delta hi_lo split hi_bits={0} op={1} items={2}".format(hi_bits, op, items)
    return "\n".join(lines), note


def field_score(outputs, sign_exp, hi_bits, default_mode):
    lo_bits = 7 - hi_bits
    score = 0
    for hi in range(1 << hi_bits):
        values = [
            outputs[(sign_exp << 7) | (hi << lo_bits) | lo]
            for lo in range(1 << lo_bits)
        ]
        base = mode_value(values) if default_mode == "default_override" else values[0]
        score += 1 + sum(1 for value in values if value != base)
    return score


def choose_mixed_field(outputs, sign_exp, policy):
    values = [outputs[(sign_exp << 7) | mant] for mant in range(128)]
    unique = len(set(values))
    if policy == "mixed_low_hi2_rest_hi3":
        if unique <= 4:
            return 2, "default_override"
        return 3, "default_override"
    if policy == "mixed_low_hi2_mid_hi4_rest_hi3":
        if unique <= 4:
            return 2, "default_override"
        if unique <= 32:
            return 4, "default_override"
        return 3, "default_override"
    if policy == "mixed_low_hi3_mid_hi4_rest_hi3":
        if unique <= 32:
            return 4 if unique >= 8 else 3, "default_override"
        return 3, "default_override"
    if policy == "mixed_min_items_keep_hi3_full":
        if unique >= 96:
            return 3, "default_override"
        choices = []
        for hi_bits in range(1, 7):
            for mode in ("first", "default_override"):
                choices.append((field_score(outputs, sign_exp, hi_bits, mode), hi_bits, mode))
        choices.sort()
        return choices[0][1], choices[0][2]
    if policy == "mixed_min_items_keep_hi4_sparse":
        if unique <= 32:
            return 4, "default_override"
        if unique >= 96:
            return 3, "default_override"
        choices = []
        for hi_bits in range(2, 6):
            choices.append((field_score(outputs, sign_exp, hi_bits, "default_override"), hi_bits))
        choices.sort()
        return choices[0][1], "default_override"
    raise RuntimeError("unknown mixed policy: {0}".format(policy))


def render_mixed_field(outputs, module, policy):
    default = mode_value(outputs)
    lines = module_header(module)
    lines.extend(
        [
            "  reg out_sign;",
            "  reg [7:0] out_exp;",
            "  reg [6:0] out_mant;",
            "  always @* begin",
            "    out_sign = 1'b{0};".format((default >> 15) & 1),
            "    out_exp = {0};".format(const_word(8, (default >> 7) & 0xFF)),
            "    out_mant = {0};".format(const_word(7, default & 0x7F)),
            "    casez (sign_exp)",
        ]
    )
    items = emit_const_sign_exp_ranges(lines, outputs, "{out_sign, out_exp, out_mant}", 16, default, "      ")
    choices = {}
    for sign_exp in active_sign_exps(outputs):
        hi_bits, default_mode = choose_mixed_field(outputs, sign_exp, policy)
        choices[sign_exp] = (hi_bits, default_mode)
        items += emit_field_hi_lo(lines, outputs, sign_exp, hi_bits, default_mode)
    lines.extend(
        [
            "      default: begin end",
            "    endcase",
            "  end",
            "  assign out = {out_sign, out_exp, out_mant};",
            "endmodule",
            "",
        ]
    )
    histogram = {}
    for choice in choices.values():
        histogram[choice] = histogram.get(choice, 0) + 1
    note = "mixed field hi_lo policy={0} choices={1} items={2}".format(policy, histogram, items)
    return "\n".join(lines), note


def render_mixed_word(outputs, module, policy):
    default = mode_value(outputs)
    lines = module_header(module)
    lines.extend(
        [
            "  reg [15:0] out_r;",
            "  always @* begin",
            "    out_r = {0};".format(const_word(16, default)),
            "    casez (sign_exp)",
        ]
    )
    items = emit_const_sign_exp_ranges(lines, outputs, "out_r", 16, default, "      ")
    choices = {}
    for sign_exp in active_sign_exps(outputs):
        hi_bits, default_mode = choose_mixed_field(outputs, sign_exp, policy)
        choices[sign_exp] = (hi_bits, default_mode)
        items += emit_word_hi_lo(lines, outputs, sign_exp, hi_bits, default_mode)
    lines.extend(
        [
            "      default: begin end",
            "    endcase",
            "  end",
            "  assign out = out_r;",
            "endmodule",
            "",
        ]
    )
    histogram = {}
    for choice in choices.values():
        histogram[choice] = histogram.get(choice, 0) + 1
    note = "mixed word hi_lo policy={0} choices={1} items={2}".format(policy, histogram, items)
    return "\n".join(lines), note


def emit_const_bit_ranges(lines, outputs, bit, target, default, indent):
    by_value = {}
    variable = []
    for sign_exp in range(512):
        values = [((outputs[(sign_exp << 7) | mant] >> bit) & 1) for mant in range(128)]
        unique = set(values)
        if len(unique) == 1:
            value = values[0]
            if value != default:
                by_value.setdefault(value, []).append(sign_exp)
        else:
            variable.append(sign_exp)
    items = 0
    for value in sorted(by_value):
        for start, end in grouped_runs(by_value[value]):
            for pattern in range_casez_patterns(9, start, end):
                lines.append("{0}{1}: {2} = 1'b{3};".format(indent, pattern, target, value))
                items += 1
    return items, variable


def emit_bit_hi_lo(lines, outputs, sign_exp, bit, target, hi_bits, default_mode):
    lo_bits = 7 - hi_bits
    hi_name = "mant_hi{0}".format(hi_bits)
    lo_name = "mant_lo{0}".format(lo_bits)
    lines.append("        {0}: begin".format(const_word(9, sign_exp)))
    lines.append("          case ({0})".format(hi_name))
    items = 0
    for hi in range(1 << hi_bits):
        values = [
            (outputs[(sign_exp << 7) | (hi << lo_bits) | lo] >> bit) & 1
            for lo in range(1 << lo_bits)
        ]
        base = mode_value(values) if default_mode == "default_override" else values[0]
        differing = [(lo, value) for lo, value in enumerate(values) if value != base]
        lines.append("            {0}: begin".format(const_word(hi_bits, hi)))
        lines.append("              {0} = 1'b{1};".format(target, base))
        if differing:
            lines.append("              case ({0})".format(lo_name))
            for lo, value in differing:
                lines.append(
                    "                {0}: {1} = 1'b{2};".format(
                        const_word(lo_bits, lo),
                        target,
                        value,
                    )
                )
                items += 1
            lines.append("                default: begin end")
            lines.append("              endcase")
        lines.append("            end")
        items += 1
    lines.append("            default: begin end")
    lines.append("          endcase")
    lines.append("        end")
    return items


def emit_bit_runs(lines, outputs, sign_exp, bit, target):
    values = [
        (outputs[(sign_exp << 7) | mant] >> bit) & 1
        for mant in range(128)
    ]
    default = mode_value(values)
    lines.append("        {0}: begin".format(const_word(9, sign_exp)))
    lines.append("          {0} = 1'b{1};".format(target, default))
    lines.append("          casez (mant)")
    items = 1
    start = 0
    prev = values[0]
    for index, value in enumerate(values[1:], 1):
        if value == prev:
            continue
        if prev != default:
            for pattern in range_casez_patterns(7, start, index - 1):
                lines.append("            {0}: {1} = 1'b{2};".format(pattern, target, prev))
                items += 1
        start = index
        prev = value
    if prev != default:
        for pattern in range_casez_patterns(7, start, len(values) - 1):
            lines.append("            {0}: {1} = 1'b{2};".format(pattern, target, prev))
            items += 1
    lines.append("            default: begin end")
    lines.append("          endcase")
    lines.append("        end")
    return items


def emit_bit_cmp_runs(lines, outputs, sign_exp, bit, target):
    values = [
        (outputs[(sign_exp << 7) | mant] >> bit) & 1
        for mant in range(128)
    ]
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
    lines.append("        {0}: begin".format(const_word(9, sign_exp)))
    items = 0
    for index, (start, end, value) in enumerate(runs):
        if index == 0:
            if end == 127:
                lines.append("          {0} = 1'b{1};".format(target, value))
            else:
                lines.append("          if (mant <= {0}) {1} = 1'b{2};".format(const_word(7, end), target, value))
            items += 1
            continue
        prefix = "else "
        if end == 127:
            lines.append("          {0}{1} = 1'b{2};".format(prefix, target, value))
        else:
            lines.append("          {0}if (mant <= {1}) {2} = 1'b{3};".format(prefix, const_word(7, end), target, value))
        items += 1
    lines.append("        end")
    return items


def cube_points(value, mask, width):
    points = [value & ~mask]
    for bit in range(width):
        if (mask >> bit) & 1:
            points += [point | (1 << bit) for point in points]
    return frozenset(points)


def casez_cube(width, value, mask):
    chars = []
    for bit in range(width - 1, -1, -1):
        if (mask >> bit) & 1:
            chars.append("?")
        else:
            chars.append("1" if ((value >> bit) & 1) else "0")
    return "{0}'b{1}".format(width, "".join(chars))


def mantissa_prime_cover(values, target):
    width = 7
    current = {
        (mant, 0): cube_points(mant, 0, width)
        for mant, value in enumerate(values)
        if value == target
    }
    primes = set()
    while current:
        used = set()
        next_level = {}
        items = list(current)
        for index, (left_value, left_mask) in enumerate(items):
            for right_value, right_mask in items[index + 1 :]:
                if left_mask != right_mask:
                    continue
                diff = (left_value ^ right_value) & ~left_mask
                if not diff or (diff & (diff - 1)) != 0:
                    continue
                new_value = left_value & ~diff
                new_mask = left_mask | diff
                covered = cube_points(new_value, new_mask, width)
                if all(values[point] == target for point in covered):
                    used.add((left_value, left_mask))
                    used.add((right_value, right_mask))
                    next_level[(new_value, new_mask)] = covered
        for implicant in current:
            if implicant not in used:
                primes.add(implicant)
        current = next_level
    on_set = {mant for mant, value in enumerate(values) if value == target}
    prime_cover = {prime: cube_points(prime[0], prime[1], width) & on_set for prime in primes}
    selected = []
    remaining = set(on_set)
    while remaining:
        prime = max(
            primes,
            key=lambda item: (
                len(prime_cover[item] & remaining),
                bin(item[1]).count("1"),
                -item[0],
            ),
        )
        gain = prime_cover[prime] & remaining
        if not gain:
            break
        selected.append(prime)
        remaining -= gain
    return selected


def emit_bit_pla(lines, outputs, sign_exp, bit, target):
    values = [
        (outputs[(sign_exp << 7) | mant] >> bit) & 1
        for mant in range(128)
    ]
    default = mode_value(values)
    flip = 1 - default
    cover = mantissa_prime_cover(values, flip)
    lines.append("        {0}: begin".format(const_word(9, sign_exp)))
    lines.append("          {0} = 1'b{1};".format(target, default))
    if cover:
        lines.append("          casez (mant)")
        for value, mask in cover:
            lines.append("            {0}: {1} = 1'b{2};".format(casez_cube(7, value, mask), target, flip))
        lines.append("            default: begin end")
        lines.append("          endcase")
    lines.append("        end")
    return max(1, len(cover))


def emit_bit_full_runs(lines, outputs, bit, target):
    values = [(word >> bit) & 1 for word in outputs]
    default = mode_value(values)
    lines.extend(
        [
            "  reg {0};".format(target),
            "  always @* begin",
            "    {0} = 1'b{1};".format(target, default),
            "    casez (in)",
        ]
    )
    items = 0
    start = 0
    prev = values[0]
    for index, value in enumerate(values[1:], 1):
        if value == prev:
            continue
        if prev != default:
            for pattern in range_casez_patterns(16, start, index - 1):
                lines.append("      {0}: {1} = 1'b{2};".format(pattern, target, prev))
                items += 1
        start = index
        prev = value
    if prev != default:
        for pattern in range_casez_patterns(16, start, len(values) - 1):
            lines.append("      {0}: {1} = 1'b{2};".format(pattern, target, prev))
            items += 1
    lines.extend(["      default: begin end", "    endcase", "  end"])
    return items


def formula_bit_expr(case, bit):
    sign = "in[15]"
    exp = "in[14:7]"
    if case == "ex202":
        if bit == 14:
            return "((~{0}) & (({1} > 8'd125) | (({1} == 8'd125) & (mant >= 7'd26)))) | ({0} & ({1} == 8'hff) & (mant != 7'd0))".format(sign, exp)
        if bit == 15:
            return "1'b0"
    if case == "ex203" and bit == 14:
        return "{0} | ({1} <= 8'd123) | ({1} >= 8'd130) | (({1} == 8'd124) & (mant <= 7'd11)) | (({1} == 8'd129) & (mant >= 7'd108))".format(sign, exp)
    if case == "ex204":
        if bit == 14:
            return "{0} | ({1} <= 8'd124) | ({1} >= 8'd129) | (({1} == 8'd125) & (mant == 7'd0))".format(sign, exp)
        if bit == 11:
            return "{0} | ({1} == 8'd0) | ({1} == 8'd126) | ({1} == 8'd128) | ({1} == 8'hff) | ((({1} == 8'd125) | ({1} == 8'd127)) & (mant != 7'd0))".format(sign, exp)
        if bit == 9:
            return "{0} | ({1} <= 8'd94) | ({1} == 8'd128) | ({1} >= 8'd159) | (({1} == 8'd95) & (mant <= 7'd5)) | (({1} == 8'd125) & (mant != 7'd0)) | (({1} == 8'd126) & ((mant <= 7'd106) | (mant == 7'd127))) | (({1} == 8'd127) & (mant >= 7'd12)) | (({1} == 8'd158) & (mant >= 7'd118))".format(sign, exp)
    raise RuntimeError("no hand formula for {0} bit {1}".format(case, bit))


def formulaeq_bit_expr(case, bit):
    sign = "in[15]"
    exp = "in[14:7]"
    if case == "ex204":
        if bit == 14:
            return "~((~{0}) & ((({1} == 8'd126) | ({1} == 8'd127) | ({1} == 8'd128)) | (({1} == 8'd125) & (mant != 7'd0))))".format(sign, exp)
        if bit == 11:
            return "{0} | ({1} == 8'd0) | ({1} == 8'd126) | ({1} == 8'd128) | ({1} == 8'hff) | ((({1} == 8'd125) | ({1} == 8'd127)) & (mant != 7'd0))".format(sign, exp)
        if bit == 9:
            return "{0} | (({1} < 8'd95) | ({1} == 8'd128) | ({1} > 8'd158)) | (({1} == 8'd95) & (mant <= 7'd5)) | (({1} == 8'd125) & (mant != 7'd0)) | (({1} == 8'd126) & ((mant <= 7'd106) | (mant == 7'd127))) | (({1} == 8'd127) & (mant >= 7'd12)) | (({1} == 8'd158) & (mant >= 7'd118))".format(sign, exp)
    raise RuntimeError("no equality formula for {0} bit {1}".format(case, bit))


def append_formula_bits(lines, case, bits, equality=False):
    items = 0
    for bit in bits:
        expr = formulaeq_bit_expr(case, bit) if equality else formula_bit_expr(case, bit)
        lines.append("  wire bit_{0} = {1};".format(bit, expr))
        items += 1
    return items


def append_fullrun_bits(lines, outputs, bits):
    items = 0
    for bit in bits:
        items += emit_bit_full_runs(lines, outputs, bit, "bit_{0}".format(bit))
    return items


def out_pieces_from_fields(bits):
    bit_set = set(bits)
    pieces = []
    for bit in range(15, -1, -1):
        if bit in bit_set:
            pieces.append("bit_{0}".format(bit))
        elif bit == 15:
            pieces.append("out_sign")
        elif bit >= 7:
            pieces.append("out_exp[{0}]".format(bit - 7))
        else:
            pieces.append("out_mant[{0}]".format(bit))
    return pieces


def out_pieces_from_word(bits):
    bit_set = set(bits)
    return ["bit_{0}".format(bit) if bit in bit_set else "out_r[{0}]".format(bit) for bit in range(15, -1, -1)]


def out_pieces_from_pair(bits):
    bit_set = set(bits)
    pieces = []
    for bit in range(15, -1, -1):
        if bit in bit_set:
            pieces.append("bit_{0}".format(bit))
        else:
            pieces.append("(sign ? pair[{0}] : pair[{1}])".format(bit + 16, bit))
    return pieces


def field_value(word, field):
    if field == "sign":
        return (word >> 15) & 1
    if field == "exp":
        return (word >> 7) & 0xFF
    if field == "mant":
        return word & 0x7F
    raise RuntimeError("unknown field: {0}".format(field))


def field_width(field):
    if field == "sign":
        return 1
    if field == "exp":
        return 8
    if field == "mant":
        return 7
    raise RuntimeError("unknown field: {0}".format(field))


def emit_const_scalar_ranges(lines, outputs, field, target, default, indent):
    by_value = {}
    variable = []
    for sign_exp in range(512):
        values = [
            field_value(outputs[(sign_exp << 7) | mant], field)
            for mant in range(128)
        ]
        unique = set(values)
        if len(unique) == 1:
            value = values[0]
            if value != default:
                by_value.setdefault(value, []).append(sign_exp)
        else:
            variable.append(sign_exp)
    items = 0
    for value in sorted(by_value):
        for start, end in grouped_runs(by_value[value]):
            for pattern in range_casez_patterns(9, start, end):
                lines.append(
                    "{0}{1}: {2} = {3};".format(
                        indent,
                        pattern,
                        target,
                        const_word(field_width(field), value),
                    )
                )
                items += 1
    return items, variable


def emit_scalar_hi_lo(lines, outputs, sign_exp, field, target, hi_bits, default_mode):
    hi_count = 1 << hi_bits
    lo_bits = 7 - hi_bits
    hi_name = "mant_hi{0}".format(hi_bits)
    lo_name = "mant_lo{0}".format(lo_bits)
    width = field_width(field)
    lines.append("      {0}: begin".format(const_word(9, sign_exp)))
    lines.append("        case ({0})".format(hi_name))
    items = 0
    for hi in range(hi_count):
        values = [
            field_value(outputs[(sign_exp << 7) | (hi << lo_bits) | lo], field)
            for lo in range(1 << lo_bits)
        ]
        base = mode_value(values) if default_mode == "default_override" else values[0]
        differing = [(lo, value) for lo, value in enumerate(values) if value != base]
        lines.append("          {0}: begin".format(const_word(hi_bits, hi)))
        lines.append("            {0} = {1};".format(target, const_word(width, base)))
        if differing:
            lines.append("            case ({0})".format(lo_name))
            for lo, value in differing:
                lines.append(
                    "              {0}: {1} = {2};".format(
                        const_word(lo_bits, lo),
                        target,
                        const_word(width, value),
                    )
                )
                items += 1
            lines.append("              default: begin end")
            lines.append("            endcase")
        lines.append("          end")
        items += 1
    lines.append("          default: begin end")
    lines.append("        endcase")
    lines.append("      end")
    return items


def render_sep_fields(outputs, module, exp_hi_bits, mant_hi_bits, sign_hi_bits):
    defaults = {
        "sign": mode_value([field_value(value, "sign") for value in outputs]),
        "exp": mode_value([field_value(value, "exp") for value in outputs]),
        "mant": mode_value([field_value(value, "mant") for value in outputs]),
    }
    lines = module_header(module)
    lines.extend(
        [
            "  reg out_sign;",
            "  reg [7:0] out_exp;",
            "  reg [6:0] out_mant;",
        ]
    )
    items = 0
    settings = [
        ("sign", "out_sign", sign_hi_bits),
        ("exp", "out_exp", exp_hi_bits),
        ("mant", "out_mant", mant_hi_bits),
    ]
    for field, target, hi_bits in settings:
        lines.extend(
            [
                "  always @* begin",
                "    {0} = {1};".format(target, const_word(field_width(field), defaults[field])),
                "    casez (sign_exp)",
            ]
        )
        const_items, variable = emit_const_scalar_ranges(
            lines,
            outputs,
            field,
            target,
            defaults[field],
            "      ",
        )
        items += const_items
        if hi_bits == 0:
            if variable:
                raise RuntimeError("field {0} is not constant enough for hi_bits=0".format(field))
        else:
            for sign_exp in variable:
                items += emit_scalar_hi_lo(
                    lines,
                    outputs,
                    sign_exp,
                    field,
                    target,
                    hi_bits,
                    "default_override",
                )
        lines.extend(["      default: begin end", "    endcase", "  end"])
    lines.extend(
        [
            "  assign out = {out_sign, out_exp, out_mant};",
            "endmodule",
            "",
        ]
    )
    note = "separate fields exp_hi={0} mant_hi={1} sign_hi={2} items={3}".format(
        exp_hi_bits,
        mant_hi_bits,
        sign_hi_bits,
        items,
    )
    return "\n".join(lines), note


def render_bitplanes(outputs, module, hi_bits):
    lines = module_header(module)
    items = 0
    for bit in range(16):
        target = "bit_{0}".format(bit)
        bit_default = mode_value([(value >> bit) & 1 for value in outputs])
        lines.extend(
            [
                "  reg {0};".format(target),
                "  always @* begin",
                "    {0} = 1'b{1};".format(target, bit_default),
                "    casez (sign_exp)",
            ]
        )
        const_items, variable = emit_const_bit_ranges(lines, outputs, bit, target, bit_default, "      ")
        items += const_items
        for sign_exp in variable:
            items += emit_bit_hi_lo(lines, outputs, sign_exp, bit, target, hi_bits, "default_override")
        lines.extend(["      default: begin end", "    endcase", "  end"])
    lines.extend(
        [
            "  assign out = {bit_15, bit_14, bit_13, bit_12, bit_11, bit_10, bit_9, bit_8, bit_7, bit_6, bit_5, bit_4, bit_3, bit_2, bit_1, bit_0};",
            "endmodule",
            "",
        ]
    )
    note = "all output bitplanes hi_bits={0} items={1}".format(hi_bits, items)
    return "\n".join(lines), note


def render_sep_fields_bit_overrides(outputs, module, exp_hi_bits, mant_hi_bits, sign_hi_bits, bits, bit_hi_bits):
    text, note = render_sep_fields(outputs, module, exp_hi_bits, mant_hi_bits, sign_hi_bits)
    final = "  assign out = {out_sign, out_exp, out_mant};\nendmodule\n"
    if not text.endswith(final):
        raise RuntimeError("unexpected sep_fields text footer")
    lines = text[: -len(final)].rstrip().splitlines()
    bit_set = set(bits)
    items = 0
    for bit in bits:
        target = "bit_{0}".format(bit)
        bit_default = mode_value([(value >> bit) & 1 for value in outputs])
        lines.extend(
            [
                "  reg {0};".format(target),
                "  always @* begin",
                "    {0} = 1'b{1};".format(target, bit_default),
                "    casez (sign_exp)",
            ]
        )
        bit_items, variable = emit_const_bit_ranges(lines, outputs, bit, target, bit_default, "      ")
        items += bit_items
        for sign_exp in variable:
            if bit_hi_bits == "runs":
                items += emit_bit_runs(lines, outputs, sign_exp, bit, target)
            elif bit_hi_bits == "cmp":
                items += emit_bit_cmp_runs(lines, outputs, sign_exp, bit, target)
            elif bit_hi_bits == "pla":
                items += emit_bit_pla(lines, outputs, sign_exp, bit, target)
            else:
                items += emit_bit_hi_lo(lines, outputs, sign_exp, bit, target, bit_hi_bits, "default_override")
        lines.extend(["      default: begin end", "    endcase", "  end"])
    pieces = []
    for bit in range(15, -1, -1):
        if bit in bit_set:
            pieces.append("bit_{0}".format(bit))
        elif bit == 15:
            pieces.append("out_sign")
        elif bit >= 7:
            pieces.append("out_exp[{0}]".format(bit - 7))
        else:
            pieces.append("out_mant[{0}]".format(bit))
    lines.extend(
        [
            "  assign out = {{{0}}};".format(", ".join(pieces)),
            "endmodule",
            "",
        ]
    )
    note = "{0}; sep bit overrides bits={1} bit_hi_bits={2} bit_items={3}".format(
        note,
        "_".join(str(bit) for bit in bits),
        bit_hi_bits,
        items,
    )
    return "\n".join(lines), note


def render_sep_fields_formula_bit_overrides(case, outputs, module, exp_hi_bits, mant_hi_bits, sign_hi_bits, bits, equality=False):
    text, note = render_sep_fields(outputs, module, exp_hi_bits, mant_hi_bits, sign_hi_bits)
    final = "  assign out = {out_sign, out_exp, out_mant};\nendmodule\n"
    if not text.endswith(final):
        raise RuntimeError("unexpected sep_fields text footer")
    lines = text[: -len(final)].rstrip().splitlines()
    items = append_formula_bits(lines, case, bits, equality=equality)
    lines.extend(
        [
            "  assign out = {{{0}}};".format(", ".join(out_pieces_from_fields(bits))),
            "endmodule",
            "",
        ]
    )
    note = "{0}; formula bit overrides bits={1} bit_items={2}".format(
        note,
        "_".join(str(bit) for bit in bits),
        items,
    )
    return "\n".join(lines), note


def render_sep_fields_fullrun_bit_overrides(outputs, module, exp_hi_bits, mant_hi_bits, sign_hi_bits, bits):
    text, note = render_sep_fields(outputs, module, exp_hi_bits, mant_hi_bits, sign_hi_bits)
    final = "  assign out = {out_sign, out_exp, out_mant};\nendmodule\n"
    if not text.endswith(final):
        raise RuntimeError("unexpected sep_fields text footer")
    lines = text[: -len(final)].rstrip().splitlines()
    items = append_fullrun_bits(lines, outputs, bits)
    lines.extend(
        [
            "  assign out = {{{0}}};".format(", ".join(out_pieces_from_fields(bits))),
            "endmodule",
            "",
        ]
    )
    note = "{0}; full-run bit overrides bits={1} bit_items={2}".format(
        note,
        "_".join(str(bit) for bit in bits),
        items,
    )
    return "\n".join(lines), note


def emit_const_exp_scalar_ranges(lines, outputs, input_sign, field, target, default, indent):
    by_value = {}
    variable = []
    base_sign = input_sign << 15
    for exp in range(256):
        values = [
            field_value(outputs[base_sign | (exp << 7) | mant], field)
            for mant in range(128)
        ]
        unique = set(values)
        if len(unique) == 1:
            value = values[0]
            if value != default:
                by_value.setdefault(value, []).append(exp)
        else:
            variable.append(exp)
    items = 0
    for value in sorted(by_value):
        for start, end in grouped_runs(by_value[value]):
            for pattern in range_casez_patterns(8, start, end):
                lines.append(
                    "{0}{1}: {2} = {3};".format(
                        indent,
                        pattern,
                        target,
                        const_word(field_width(field), value),
                    )
                )
                items += 1
    return items, variable


def emit_scalar_hi_lo_exp(lines, outputs, input_sign, exp, field, target, hi_bits):
    hi_count = 1 << hi_bits
    lo_bits = 7 - hi_bits
    hi_name = "mant_hi{0}".format(hi_bits)
    lo_name = "mant_lo{0}".format(lo_bits)
    width = field_width(field)
    base_sign = input_sign << 15
    lines.append("        {0}: begin".format(const_word(8, exp)))
    lines.append("          case ({0})".format(hi_name))
    items = 0
    for hi in range(hi_count):
        values = [
            field_value(outputs[base_sign | (exp << 7) | (hi << lo_bits) | lo], field)
            for lo in range(1 << lo_bits)
        ]
        base = mode_value(values)
        differing = [(lo, value) for lo, value in enumerate(values) if value != base]
        lines.append("            {0}: begin".format(const_word(hi_bits, hi)))
        lines.append("              {0} = {1};".format(target, const_word(width, base)))
        if differing:
            lines.append("              case ({0})".format(lo_name))
            for lo, value in differing:
                lines.append(
                    "                {0}: {1} = {2};".format(
                        const_word(lo_bits, lo),
                        target,
                        const_word(width, value),
                    )
                )
                items += 1
            lines.append("                default: begin end")
            lines.append("              endcase")
        lines.append("            end")
        items += 1
    lines.append("            default: begin end")
    lines.append("          endcase")
    lines.append("        end")
    return items


def render_split_sign_sep_fields(outputs, module, exp_hi_bits, mant_hi_bits, sign_hi_bits):
    defaults = {
        "sign": mode_value([field_value(value, "sign") for value in outputs]),
        "exp": mode_value([field_value(value, "exp") for value in outputs]),
        "mant": mode_value([field_value(value, "mant") for value in outputs]),
    }
    lines = module_header(module)
    lines.extend(
        [
            "  wire sign = in[15];",
            "  wire [7:0] exp = in[14:7];",
            "  reg out_sign;",
            "  reg [7:0] out_exp;",
            "  reg [6:0] out_mant;",
        ]
    )
    items = 0
    settings = [
        ("sign", "out_sign", sign_hi_bits),
        ("exp", "out_exp", exp_hi_bits),
        ("mant", "out_mant", mant_hi_bits),
    ]
    for field, target, hi_bits in settings:
        lines.extend(
            [
                "  always @* begin",
                "    {0} = {1};".format(target, const_word(field_width(field), defaults[field])),
                "    if (sign) begin",
                "      casez (exp)",
            ]
        )
        const_items, variable = emit_const_exp_scalar_ranges(
            lines,
            outputs,
            1,
            field,
            target,
            defaults[field],
            "        ",
        )
        items += const_items
        if hi_bits == 0 and variable:
            raise RuntimeError("field {0} sign=1 is not constant enough for hi_bits=0".format(field))
        for exp in variable:
            items += emit_scalar_hi_lo_exp(lines, outputs, 1, exp, field, target, hi_bits)
        lines.extend(
            [
                "        default: begin end",
                "      endcase",
                "    end else begin",
                "      casez (exp)",
            ]
        )
        const_items, variable = emit_const_exp_scalar_ranges(
            lines,
            outputs,
            0,
            field,
            target,
            defaults[field],
            "        ",
        )
        items += const_items
        if hi_bits == 0 and variable:
            raise RuntimeError("field {0} sign=0 is not constant enough for hi_bits=0".format(field))
        for exp in variable:
            items += emit_scalar_hi_lo_exp(lines, outputs, 0, exp, field, target, hi_bits)
        lines.extend(
            [
                "        default: begin end",
                "      endcase",
                "    end",
                "  end",
            ]
        )
    lines.extend(
        [
            "  assign out = {out_sign, out_exp, out_mant};",
            "endmodule",
            "",
        ]
    )
    note = "split-sign separate fields exp_hi={0} mant_hi={1} sign_hi={2} items={3}".format(
        exp_hi_bits,
        mant_hi_bits,
        sign_hi_bits,
        items,
    )
    return "\n".join(lines), note


def render_hilo3_field_bit_overrides(outputs, module, bits, bit_hi_bits=3):
    default = mode_value(outputs)
    bit_set = set(bits)
    lines = module_header(module)
    lines.extend(
        [
            "  reg out_sign;",
            "  reg [7:0] out_exp;",
            "  reg [6:0] out_mant;",
            "  always @* begin",
            "    out_sign = 1'b{0};".format((default >> 15) & 1),
            "    out_exp = {0};".format(const_word(8, (default >> 7) & 0xFF)),
            "    out_mant = {0};".format(const_word(7, default & 0x7F)),
            "    casez (sign_exp)",
        ]
    )
    items = emit_const_sign_exp_ranges(lines, outputs, "{out_sign, out_exp, out_mant}", 16, default, "      ")
    for sign_exp in active_sign_exps(outputs):
        items += emit_field_hi_lo(lines, outputs, sign_exp, 3, "default_override")
    lines.extend(["      default: begin end", "    endcase", "  end"])
    for bit in bits:
        target = "bit_{0}".format(bit)
        bit_default = mode_value([(value >> bit) & 1 for value in outputs])
        lines.extend(
            [
                "  reg {0};".format(target),
                "  always @* begin",
                "    {0} = 1'b{1};".format(target, bit_default),
                "    casez (sign_exp)",
            ]
        )
        bit_items, variable = emit_const_bit_ranges(lines, outputs, bit, target, bit_default, "      ")
        items += bit_items
        for sign_exp in variable:
            if bit_hi_bits == "runs":
                items += emit_bit_runs(lines, outputs, sign_exp, bit, target)
            elif bit_hi_bits == "cmp":
                items += emit_bit_cmp_runs(lines, outputs, sign_exp, bit, target)
            elif bit_hi_bits == "pla":
                items += emit_bit_pla(lines, outputs, sign_exp, bit, target)
            else:
                items += emit_bit_hi_lo(lines, outputs, sign_exp, bit, target, bit_hi_bits, "default_override")
        lines.extend(["      default: begin end", "    endcase", "  end"])
    pieces = []
    for bit in range(15, -1, -1):
        if bit in bit_set:
            pieces.append("bit_{0}".format(bit))
        elif bit == 15:
            pieces.append("out_sign")
        elif bit >= 7:
            pieces.append("out_exp[{0}]".format(bit - 7))
        else:
            pieces.append("out_mant[{0}]".format(bit))
    lines.extend(
        [
            "  assign out = {{{0}}};".format(", ".join(pieces)),
            "endmodule",
            "",
        ]
    )
    note = "hilo3 field mode base with bit overrides bits={0} bit_hi_bits={1} items={2}".format(
        "_".join(str(bit) for bit in bits),
        bit_hi_bits,
        items,
    )
    return "\n".join(lines), note


def render_hilo3_word_bit_overrides(outputs, module, bits, bit_hi_bits=3):
    default = mode_value(outputs)
    bit_set = set(bits)
    lines = module_header(module)
    lines.extend(
        [
            "  reg [15:0] out_r;",
            "  always @* begin",
            "    out_r = {0};".format(const_word(16, default)),
            "    casez (sign_exp)",
        ]
    )
    items = emit_const_sign_exp_ranges(lines, outputs, "out_r", 16, default, "      ")
    for sign_exp in active_sign_exps(outputs):
        items += emit_word_hi_lo(lines, outputs, sign_exp, 3, "default_override")
    lines.extend(["      default: begin end", "    endcase", "  end"])
    for bit in bits:
        target = "bit_{0}".format(bit)
        bit_default = mode_value([(value >> bit) & 1 for value in outputs])
        lines.extend(
            [
                "  reg {0};".format(target),
                "  always @* begin",
                "    {0} = 1'b{1};".format(target, bit_default),
                "    casez (sign_exp)",
            ]
        )
        bit_items, variable = emit_const_bit_ranges(lines, outputs, bit, target, bit_default, "      ")
        items += bit_items
        for sign_exp in variable:
            if bit_hi_bits == "runs":
                items += emit_bit_runs(lines, outputs, sign_exp, bit, target)
            elif bit_hi_bits == "cmp":
                items += emit_bit_cmp_runs(lines, outputs, sign_exp, bit, target)
            elif bit_hi_bits == "pla":
                items += emit_bit_pla(lines, outputs, sign_exp, bit, target)
            else:
                items += emit_bit_hi_lo(lines, outputs, sign_exp, bit, target, bit_hi_bits, "default_override")
        lines.extend(["      default: begin end", "    endcase", "  end"])
    pieces = []
    for bit in range(15, -1, -1):
        if bit in bit_set:
            pieces.append("bit_{0}".format(bit))
        else:
            pieces.append("out_r[{0}]".format(bit))
    lines.extend(
        [
            "  assign out = {{{0}}};".format(", ".join(pieces)),
            "endmodule",
            "",
        ]
    )
    note = "hilo3 word mode base with bit overrides bits={0} bit_hi_bits={1} items={2}".format(
        "_".join(str(bit) for bit in bits),
        bit_hi_bits,
        items,
    )
    return "\n".join(lines), note


def render_hilo3_field_formula_bit_overrides(case, outputs, module, bits, equality=False):
    text, note = render_hi_lo(outputs, module, True, 3, "default_override")
    final = "  assign out = {out_sign, out_exp, out_mant};\nendmodule\n"
    if not text.endswith(final):
        raise RuntimeError("unexpected hilo field footer")
    lines = text[: -len(final)].rstrip().splitlines()
    items = append_formula_bits(lines, case, bits, equality=equality)
    lines.extend(["  assign out = {{{0}}};".format(", ".join(out_pieces_from_fields(bits))), "endmodule", ""])
    return "\n".join(lines), "{0}; formula bit overrides bits={1} bit_items={2}".format(
        note,
        "_".join(str(bit) for bit in bits),
        items,
    )


def render_hilo3_field_fullrun_bit_overrides(outputs, module, bits):
    text, note = render_hi_lo(outputs, module, True, 3, "default_override")
    final = "  assign out = {out_sign, out_exp, out_mant};\nendmodule\n"
    if not text.endswith(final):
        raise RuntimeError("unexpected hilo field footer")
    lines = text[: -len(final)].rstrip().splitlines()
    items = append_fullrun_bits(lines, outputs, bits)
    lines.extend(["  assign out = {{{0}}};".format(", ".join(out_pieces_from_fields(bits))), "endmodule", ""])
    return "\n".join(lines), "{0}; full-run bit overrides bits={1} bit_items={2}".format(
        note,
        "_".join(str(bit) for bit in bits),
        items,
    )


def render_hilo3_word_fullrun_bit_overrides(outputs, module, bits):
    text, note = render_hi_lo(outputs, module, False, 3, "default_override")
    final = "  assign out = out_r;\nendmodule\n"
    if not text.endswith(final):
        raise RuntimeError("unexpected hilo word footer")
    lines = text[: -len(final)].rstrip().splitlines()
    items = append_fullrun_bits(lines, outputs, bits)
    lines.extend(["  assign out = {{{0}}};".format(", ".join(out_pieces_from_word(bits))), "endmodule", ""])
    return "\n".join(lines), "{0}; full-run bit overrides bits={1} bit_items={2}".format(
        note,
        "_".join(str(bit) for bit in bits),
        items,
    )


def pair_word(outputs, exp, mant):
    positive = outputs[(exp << 7) | mant]
    negative = outputs[0x8000 | (exp << 7) | mant]
    return (negative << 16) | positive


def bf16_integer_word(value):
    if value == 0:
        return 0
    sign = 1 if value < 0 else 0
    mag = abs(value)
    shift = mag.bit_length() - 1
    exp = 127 + shift
    mant = (mag << (7 - shift)) - 128
    return (sign << 15) | (exp << 7) | mant


def log2_base_pair(exp):
    if exp == 0:
        return 0xFF80FF80
    if exp == 255:
        return 0x7FC07F80
    return (0x7FC0 << 16) | bf16_integer_word(exp - 127)


def emit_delta_hi_lo(lines, deltas, hi_bits):
    lo_bits = 7 - hi_bits
    hi_name = "mant_hi{0}".format(hi_bits)
    lo_name = "mant_lo{0}".format(lo_bits)
    lines.append("        case ({0})".format(hi_name))
    items = 0
    for hi in range(1 << hi_bits):
        values = [deltas[(hi << lo_bits) | lo] for lo in range(1 << lo_bits)]
        default = mode_value(values)
        differing = [(lo, value) for lo, value in enumerate(values) if value != default]
        lines.append("          {0}: begin".format(const_word(hi_bits, hi)))
        lines.append("            delta_pair = {0};".format(const_word(32, default)))
        if differing:
            lines.append("            case ({0})".format(lo_name))
            for lo, value in differing:
                lines.append(
                    "              {0}: delta_pair = {1};".format(
                        const_word(lo_bits, lo),
                        const_word(32, value),
                    )
                )
                items += 1
            lines.append("              default: begin end")
            lines.append("            endcase")
        lines.append("          end")
        items += 1
    lines.append("          default: begin end")
    lines.append("        endcase")
    return items


def render_delta_pair(outputs, module, base_policy, delta_mode):
    bases = []
    deltas_by_exp = []
    for exp in range(256):
        values = [pair_word(outputs, exp, mant) for mant in range(128)]
        if base_policy == "first":
            base = values[0]
        elif base_policy == "mode":
            base = mode_value(values)
        elif base_policy == "mant64":
            base = values[64]
        else:
            raise RuntimeError("unknown delta base policy: {0}".format(base_policy))
        bases.append(base)
        deltas_by_exp.append([value ^ base for value in values])
    lines = module_header(module)
    lines.extend(
        [
            "  wire sign = in[15];",
            "  wire [7:0] exp = in[14:7];",
            "  reg [31:0] base_pair;",
            "  reg [31:0] delta_pair;",
            "  always @* begin",
            "    case (exp)",
        ]
    )
    items = 0
    for exp, base in enumerate(bases):
        lines.append("      {0}: base_pair = {1};".format(const_word(8, exp), const_word(32, base)))
        items += 1
    lines.extend(
        [
            "      default: base_pair = 32'h00000000;",
            "    endcase",
            "  end",
            "  always @* begin",
            "    delta_pair = 32'h00000000;",
            "    case (exp)",
        ]
    )
    hi_bits = None
    match = re.match(r"hilo([1-6])$", delta_mode)
    if match:
        hi_bits = int(match.group(1))
    for exp, deltas in enumerate(deltas_by_exp):
        unique = set(deltas)
        if len(unique) == 1:
            if deltas[0] != 0:
                lines.append("      {0}: delta_pair = {1};".format(const_word(8, exp), const_word(32, deltas[0])))
                items += 1
            continue
        lines.append("      {0}: begin".format(const_word(8, exp)))
        if hi_bits is None:
            lines.append("        case (mant)")
            for mant, value in enumerate(deltas):
                lines.append("          {0}: delta_pair = {1};".format(const_word(7, mant), const_word(32, value)))
                items += 1
            lines.append("          default: begin end")
            lines.append("        endcase")
        else:
            items += emit_delta_hi_lo(lines, deltas, hi_bits)
        lines.append("      end")
    lines.extend(
        [
            "      default: begin end",
            "    endcase",
            "  end",
            "  wire [31:0] pair = base_pair ^ delta_pair;",
            "  assign out = sign ? pair[31:16] : pair[15:0];",
            "endmodule",
            "",
        ]
    )
    note = "delta pair base_policy={0} delta_mode={1} items={2}".format(base_policy, delta_mode, items)
    return "\n".join(lines), note


def render_delta_pair_bit_overrides(outputs, module, base_policy, delta_mode, bits, bit_hi_bits):
    text, note = render_delta_pair(outputs, module, base_policy, delta_mode)
    final = "  assign out = sign ? pair[31:16] : pair[15:0];\nendmodule\n"
    if not text.endswith(final):
        raise RuntimeError("unexpected delta pair text footer")
    lines = text[: -len(final)].rstrip().splitlines()
    items = 0
    bit_set = set(bits)
    for bit in bits:
        target = "bit_{0}".format(bit)
        bit_default = mode_value([(value >> bit) & 1 for value in outputs])
        lines.extend(
            [
                "  reg {0};".format(target),
                "  always @* begin",
                "    {0} = 1'b{1};".format(target, bit_default),
                "    casez (sign_exp)",
            ]
        )
        bit_items, variable = emit_const_bit_ranges(lines, outputs, bit, target, bit_default, "      ")
        items += bit_items
        for sign_exp in variable:
            if bit_hi_bits == "runs":
                items += emit_bit_runs(lines, outputs, sign_exp, bit, target)
            elif bit_hi_bits == "cmp":
                items += emit_bit_cmp_runs(lines, outputs, sign_exp, bit, target)
            elif bit_hi_bits == "pla":
                items += emit_bit_pla(lines, outputs, sign_exp, bit, target)
            else:
                items += emit_bit_hi_lo(lines, outputs, sign_exp, bit, target, bit_hi_bits, "default_override")
        lines.extend(["      default: begin end", "    endcase", "  end"])
    pieces = []
    for bit in range(15, -1, -1):
        if bit in bit_set:
            pieces.append("bit_{0}".format(bit))
        else:
            pieces.append("(sign ? pair[{0}] : pair[{1}])".format(bit + 16, bit))
    lines.extend(
        [
            "  assign out = {{{0}}};".format(", ".join(pieces)),
            "endmodule",
            "",
        ]
    )
    note = "{0}; output bit overrides bits={1} bit_hi_bits={2} bit_items={3}".format(
        note,
        "_".join(str(bit) for bit in bits),
        bit_hi_bits,
        items,
    )
    return "\n".join(lines), note


def render_delta_pair_formula_bit_overrides(case, outputs, module, base_policy, delta_mode, bits, equality=False):
    text, note = render_delta_pair(outputs, module, base_policy, delta_mode)
    final = "  assign out = sign ? pair[31:16] : pair[15:0];\nendmodule\n"
    if not text.endswith(final):
        raise RuntimeError("unexpected delta pair text footer")
    lines = text[: -len(final)].rstrip().splitlines()
    items = append_formula_bits(lines, case, bits, equality=equality)
    lines.extend(["  assign out = {{{0}}};".format(", ".join(out_pieces_from_pair(bits))), "endmodule", ""])
    note = "{0}; formula bit overrides bits={1} bit_items={2}".format(
        note,
        "_".join(str(bit) for bit in bits),
        items,
    )
    return "\n".join(lines), note


def render_delta_pair_fullrun_bit_overrides(outputs, module, base_policy, delta_mode, bits):
    text, note = render_delta_pair(outputs, module, base_policy, delta_mode)
    final = "  assign out = sign ? pair[31:16] : pair[15:0];\nendmodule\n"
    if not text.endswith(final):
        raise RuntimeError("unexpected delta pair text footer")
    lines = text[: -len(final)].rstrip().splitlines()
    items = append_fullrun_bits(lines, outputs, bits)
    lines.extend(["  assign out = {{{0}}};".format(", ".join(out_pieces_from_pair(bits))), "endmodule", ""])
    note = "{0}; full-run bit overrides bits={1} bit_items={2}".format(
        note,
        "_".join(str(bit) for bit in bits),
        items,
    )
    return "\n".join(lines), note


def render_log2_arithbase_delta(outputs, module, delta_mode, bits=None, bit_hi_bits=None):
    if bits is None:
        bits = []
    deltas_by_exp = []
    for exp in range(256):
        base = log2_base_pair(exp)
        deltas_by_exp.append([pair_word(outputs, exp, mant) ^ base for mant in range(128)])
    lines = module_header(module)
    lines.extend(
        [
            "  wire sign = in[15];",
            "  wire [7:0] exp = in[14:7];",
            "  wire neg_k = exp < 8'd127;",
            "  wire [7:0] abs_k = neg_k ? (8'd127 - exp) : (exp - 8'd127);",
            "  reg [15:0] pos_base;",
            "  always @* begin",
            "    pos_base = 16'h0000;",
            "    if (abs_k[6])",
            "      pos_base = {neg_k, 8'd133, abs_k[5:0], 1'b0};",
            "    else if (abs_k[5])",
            "      pos_base = {neg_k, 8'd132, abs_k[4:0], 2'b00};",
            "    else if (abs_k[4])",
            "      pos_base = {neg_k, 8'd131, abs_k[3:0], 3'b000};",
            "    else if (abs_k[3])",
            "      pos_base = {neg_k, 8'd130, abs_k[2:0], 4'b0000};",
            "    else if (abs_k[2])",
            "      pos_base = {neg_k, 8'd129, abs_k[1:0], 5'b00000};",
            "    else if (abs_k[1])",
            "      pos_base = {neg_k, 8'd128, abs_k[0], 6'b000000};",
            "    else if (abs_k[0])",
            "      pos_base = {neg_k, 8'd127, 7'b0000000};",
            "  end",
            "  wire [31:0] base_pair = (exp == 8'h00) ? 32'hff80ff80 : ((exp == 8'hff) ? 32'h7fc07f80 : {16'h7fc0, pos_base});",
            "  reg [31:0] delta_pair;",
            "  always @* begin",
            "    delta_pair = 32'h00000000;",
            "    case (exp)",
        ]
    )
    items = 0
    match = re.match(r"hilo([1-6])$", delta_mode)
    hi_bits = int(match.group(1)) if match else None
    for exp, deltas in enumerate(deltas_by_exp):
        unique = set(deltas)
        if len(unique) == 1:
            if deltas[0] != 0:
                lines.append("      {0}: delta_pair = {1};".format(const_word(8, exp), const_word(32, deltas[0])))
                items += 1
            continue
        lines.append("      {0}: begin".format(const_word(8, exp)))
        if hi_bits is None:
            lines.append("        case (mant)")
            for mant, value in enumerate(deltas):
                lines.append("          {0}: delta_pair = {1};".format(const_word(7, mant), const_word(32, value)))
                items += 1
            lines.append("          default: begin end")
            lines.append("        endcase")
        else:
            items += emit_delta_hi_lo(lines, deltas, hi_bits)
        lines.append("      end")
    lines.extend(
        [
            "      default: begin end",
            "    endcase",
            "  end",
            "  wire [31:0] pair = base_pair ^ delta_pair;",
        ]
    )
    bit_set = set(bits)
    bit_items = 0
    for bit in bits:
        target = "bit_{0}".format(bit)
        bit_default = mode_value([(value >> bit) & 1 for value in outputs])
        lines.extend(
            [
                "  reg {0};".format(target),
                "  always @* begin",
                "    {0} = 1'b{1};".format(target, bit_default),
                "    casez (sign_exp)",
            ]
        )
        const_items, variable = emit_const_bit_ranges(lines, outputs, bit, target, bit_default, "      ")
        bit_items += const_items
        for sign_exp in variable:
            if bit_hi_bits == "runs":
                bit_items += emit_bit_runs(lines, outputs, sign_exp, bit, target)
            elif bit_hi_bits == "cmp":
                bit_items += emit_bit_cmp_runs(lines, outputs, sign_exp, bit, target)
            elif bit_hi_bits == "pla":
                bit_items += emit_bit_pla(lines, outputs, sign_exp, bit, target)
            else:
                bit_items += emit_bit_hi_lo(lines, outputs, sign_exp, bit, target, bit_hi_bits, "default_override")
        lines.extend(["      default: begin end", "    endcase", "  end"])
    if bits:
        pieces = []
        for bit in range(15, -1, -1):
            if bit in bit_set:
                pieces.append("bit_{0}".format(bit))
            else:
                pieces.append("(sign ? pair[{0}] : pair[{1}])".format(bit + 16, bit))
        assign = "{{{0}}}".format(", ".join(pieces))
    else:
        assign = "sign ? pair[31:16] : pair[15:0]"
    lines.extend(
        [
            "  assign out = {0};".format(assign),
            "endmodule",
            "",
        ]
    )
    note = "log2 arithmetic base delta_mode={0} items={1} bit_overrides={2} bit_items={3}".format(
        delta_mode,
        items,
        "_".join(str(bit) for bit in bits),
        bit_items,
    )
    return "\n".join(lines), note


def render_log2_arithbase_delta_formula_bits(case, outputs, module, delta_mode, bits, equality=False):
    text, note = render_log2_arithbase_delta(outputs, module, delta_mode)
    final = "  assign out = sign ? pair[31:16] : pair[15:0];\nendmodule\n"
    if not text.endswith(final):
        raise RuntimeError("unexpected arithmetic delta text footer")
    lines = text[: -len(final)].rstrip().splitlines()
    items = append_formula_bits(lines, case, bits, equality=equality)
    lines.extend(["  assign out = {{{0}}};".format(", ".join(out_pieces_from_pair(bits))), "endmodule", ""])
    note = "{0}; formula bit overrides bits={1} bit_items={2}".format(
        note,
        "_".join(str(bit) for bit in bits),
        items,
    )
    return "\n".join(lines), note


def render_log2_arithbase_delta_fullrun_bits(outputs, module, delta_mode, bits):
    text, note = render_log2_arithbase_delta(outputs, module, delta_mode)
    final = "  assign out = sign ? pair[31:16] : pair[15:0];\nendmodule\n"
    if not text.endswith(final):
        raise RuntimeError("unexpected arithmetic delta text footer")
    lines = text[: -len(final)].rstrip().splitlines()
    items = append_fullrun_bits(lines, outputs, bits)
    lines.extend(["  assign out = {{{0}}};".format(", ".join(out_pieces_from_pair(bits))), "endmodule", ""])
    note = "{0}; full-run bit overrides bits={1} bit_items={2}".format(
        note,
        "_".join(str(bit) for bit in bits),
        items,
    )
    return "\n".join(lines), note


def bdd_order(name):
    if name == "sem":
        return list(range(15, -1, -1))
    if name == "mant":
        return list(range(6, -1, -1)) + list(range(15, 6, -1))
    if name == "exp":
        return list(range(14, 6, -1)) + [15] + list(range(6, -1, -1))
    raise RuntimeError("unknown BDD order: {0}".format(name))


def build_bdd_bit(outputs, bit, order, node_limit=8000):
    values = []
    for ordered_index in range(1 << 16):
        original = 0
        for pos, var in enumerate(order):
            if (ordered_index >> (15 - pos)) & 1:
                original |= 1 << var
        values.append((outputs[original] >> bit) & 1)
    nodes = []
    unique = {}
    memo = {}

    def build(level, start, size):
        segment = tuple(values[start : start + size])
        if all(value == segment[0] for value in segment):
            return "1" if segment[0] else "0"
        key = (level, segment)
        if key in memo:
            return memo[key]
        half = size // 2
        low = build(level + 1, start, half)
        high = build(level + 1, start + half, half)
        if low == high:
            memo[key] = low
            return low
        uniq = (order[level], low, high)
        if uniq in unique:
            result = unique[uniq]
        else:
            if len(nodes) >= node_limit:
                raise RuntimeError("BDD node limit exceeded for bit {0}".format(bit))
            result = "bdd_{0}".format(len(nodes))
            unique[uniq] = result
            nodes.append((result, order[level], low, high))
        memo[key] = result
        return result

    root = build(0, 0, len(values))
    return root, nodes


def bdd_ref(name):
    if name == "0":
        return "1'b0"
    if name == "1":
        return "1'b1"
    return name


def emit_bdd_bit(lines, outputs, bit, order_name):
    root, nodes = build_bdd_bit(outputs, bit, bdd_order(order_name))
    for name, var, low, high in nodes:
        lines.append("  wire {0} = in[{1}] ? {2} : {3};".format(name, var, bdd_ref(high), bdd_ref(low)))
    return bdd_ref(root), len(nodes)


def render_hilo3_field_bdd_bit(outputs, module, bit, order_name):
    text, note = render_hi_lo(outputs, module, True, 3, "default_override")
    final = "  assign out = {out_sign, out_exp, out_mant};\nendmodule\n"
    if not text.endswith(final):
        raise RuntimeError("unexpected hilo field footer")
    lines = text[: -len(final)].rstrip().splitlines()
    bit_expr, nodes = emit_bdd_bit(lines, outputs, bit, order_name)
    pieces = []
    for out_bit in range(15, -1, -1):
        if out_bit == bit:
            pieces.append(bit_expr)
        elif out_bit == 15:
            pieces.append("out_sign")
        elif out_bit >= 7:
            pieces.append("out_exp[{0}]".format(out_bit - 7))
        else:
            pieces.append("out_mant[{0}]".format(out_bit))
    lines.extend(["  assign out = {{{0}}};".format(", ".join(pieces)), "endmodule", ""])
    return "\n".join(lines), "{0}; BDD bit={1} order={2} nodes={3}".format(note, bit, order_name, nodes)


def render_sep_fields_bdd_bit(outputs, module, exp_hi_bits, mant_hi_bits, sign_hi_bits, bit, order_name):
    text, note = render_sep_fields(outputs, module, exp_hi_bits, mant_hi_bits, sign_hi_bits)
    final = "  assign out = {out_sign, out_exp, out_mant};\nendmodule\n"
    if not text.endswith(final):
        raise RuntimeError("unexpected sep fields footer")
    lines = text[: -len(final)].rstrip().splitlines()
    bit_expr, nodes = emit_bdd_bit(lines, outputs, bit, order_name)
    pieces = []
    for out_bit in range(15, -1, -1):
        if out_bit == bit:
            pieces.append(bit_expr)
        elif out_bit == 15:
            pieces.append("out_sign")
        elif out_bit >= 7:
            pieces.append("out_exp[{0}]".format(out_bit - 7))
        else:
            pieces.append("out_mant[{0}]".format(out_bit))
    lines.extend(["  assign out = {{{0}}};".format(", ".join(pieces)), "endmodule", ""])
    return "\n".join(lines), "{0}; BDD bit={1} order={2} nodes={3}".format(note, bit, order_name, nodes)


def render_delta_pair_bdd_bit(outputs, module, base_policy, delta_mode, bit, order_name):
    text, note = render_delta_pair(outputs, module, base_policy, delta_mode)
    final = "  assign out = sign ? pair[31:16] : pair[15:0];\nendmodule\n"
    if not text.endswith(final):
        raise RuntimeError("unexpected delta pair footer")
    lines = text[: -len(final)].rstrip().splitlines()
    bit_expr, nodes = emit_bdd_bit(lines, outputs, bit, order_name)
    pieces = []
    for out_bit in range(15, -1, -1):
        if out_bit == bit:
            pieces.append(bit_expr)
        else:
            pieces.append("(sign ? pair[{0}] : pair[{1}])".format(out_bit + 16, out_bit))
    lines.extend(["  assign out = {{{0}}};".format(", ".join(pieces)), "endmodule", ""])
    return "\n".join(lines), "{0}; BDD bit={1} order={2} nodes={3}".format(note, bit, order_name, nodes)


def render_candidate(case, outputs, module, variant):
    match = re.match(r"hilo3_field_bddbit_([0-9]+)_(sem|mant|exp)$", variant)
    if match:
        return render_hilo3_field_bdd_bit(outputs, module, int(match.group(1)), match.group(2))
    match = re.match(r"sep_fields_e([1-6])_m([1-6])_s([0-6])_bddbit_([0-9]+)_(sem|mant|exp)$", variant)
    if match:
        return render_sep_fields_bdd_bit(
            outputs,
            module,
            int(match.group(1)),
            int(match.group(2)),
            int(match.group(3)),
            int(match.group(4)),
            match.group(5),
        )
    match = re.match(r"delta_pair_(first|mode|mant64)_(full|hilo[1-6])_bddbit_([0-9]+)_(sem|mant|exp)$", variant)
    if match:
        return render_delta_pair_bdd_bit(outputs, module, match.group(1), match.group(2), int(match.group(3)), match.group(4))
    match = re.match(r"log2_arithbase_delta_(full|hilo[1-6])$", variant)
    if match:
        return render_log2_arithbase_delta(outputs, module, match.group(1))
    match = re.match(r"log2_arithbase_delta_(full|hilo[1-6])_bits_([0-9_]+)_bh([1-6])$", variant)
    if match:
        bits = [int(part) for part in match.group(2).split("_") if part != ""]
        return render_log2_arithbase_delta(outputs, module, match.group(1), bits, int(match.group(3)))
    match = re.match(r"log2_arithbase_delta_(full|hilo[1-6])_bits_([0-9_]+)_runs$", variant)
    if match:
        bits = [int(part) for part in match.group(2).split("_") if part != ""]
        return render_log2_arithbase_delta(outputs, module, match.group(1), bits, "runs")
    match = re.match(r"log2_arithbase_delta_(full|hilo[1-6])_bits_([0-9_]+)_pla$", variant)
    if match:
        bits = [int(part) for part in match.group(2).split("_") if part != ""]
        return render_log2_arithbase_delta(outputs, module, match.group(1), bits, "pla")
    match = re.match(r"log2_arithbase_delta_(full|hilo[1-6])_formula_bits_([0-9_]+)$", variant)
    if match:
        bits = [int(part) for part in match.group(2).split("_") if part != ""]
        return render_log2_arithbase_delta_formula_bits(case, outputs, module, match.group(1), bits)
    match = re.match(r"log2_arithbase_delta_(full|hilo[1-6])_formulaeq_bits_([0-9_]+)$", variant)
    if match:
        bits = [int(part) for part in match.group(2).split("_") if part != ""]
        return render_log2_arithbase_delta_formula_bits(case, outputs, module, match.group(1), bits, equality=True)
    match = re.match(r"log2_arithbase_delta_(full|hilo[1-6])_fullruns_bits_([0-9_]+)$", variant)
    if match:
        bits = [int(part) for part in match.group(2).split("_") if part != ""]
        return render_log2_arithbase_delta_fullrun_bits(outputs, module, match.group(1), bits)
    match = re.match(r"split_sign_sep_fields_e([1-6])_m([1-6])_s([0-6])$", variant)
    if match:
        return render_split_sign_sep_fields(
            outputs,
            module,
            int(match.group(1)),
            int(match.group(2)),
            int(match.group(3)),
        )
    match = re.match(r"sep_fields_e([1-6])_m([1-6])_s([0-6])$", variant)
    if match:
        return render_sep_fields(
            outputs,
            module,
            int(match.group(1)),
            int(match.group(2)),
            int(match.group(3)),
        )
    match = re.match(r"sep_fields_e([1-6])_m([1-6])_s([0-6])_bits_([0-9_]+)_bh([1-6])$", variant)
    if match:
        bits = [int(part) for part in match.group(4).split("_") if part != ""]
        return render_sep_fields_bit_overrides(
            outputs,
            module,
            int(match.group(1)),
            int(match.group(2)),
            int(match.group(3)),
            bits,
            int(match.group(5)),
        )
    match = re.match(r"sep_fields_e([1-6])_m([1-6])_s([0-6])_bits_([0-9_]+)_runs$", variant)
    if match:
        bits = [int(part) for part in match.group(4).split("_") if part != ""]
        return render_sep_fields_bit_overrides(
            outputs,
            module,
            int(match.group(1)),
            int(match.group(2)),
            int(match.group(3)),
            bits,
            "runs",
        )
    match = re.match(r"sep_fields_e([1-6])_m([1-6])_s([0-6])_bits_([0-9_]+)_cmp$", variant)
    if match:
        bits = [int(part) for part in match.group(4).split("_") if part != ""]
        return render_sep_fields_bit_overrides(
            outputs,
            module,
            int(match.group(1)),
            int(match.group(2)),
            int(match.group(3)),
            bits,
            "cmp",
        )
    match = re.match(r"sep_fields_e([1-6])_m([1-6])_s([0-6])_bits_([0-9_]+)_pla$", variant)
    if match:
        bits = [int(part) for part in match.group(4).split("_") if part != ""]
        return render_sep_fields_bit_overrides(
            outputs,
            module,
            int(match.group(1)),
            int(match.group(2)),
            int(match.group(3)),
            bits,
            "pla",
        )
    match = re.match(r"sep_fields_e([1-6])_m([1-6])_s([0-6])_formula_bits_([0-9_]+)$", variant)
    if match:
        bits = [int(part) for part in match.group(4).split("_") if part != ""]
        return render_sep_fields_formula_bit_overrides(
            case,
            outputs,
            module,
            int(match.group(1)),
            int(match.group(2)),
            int(match.group(3)),
            bits,
        )
    match = re.match(r"sep_fields_e([1-6])_m([1-6])_s([0-6])_formulaeq_bits_([0-9_]+)$", variant)
    if match:
        bits = [int(part) for part in match.group(4).split("_") if part != ""]
        return render_sep_fields_formula_bit_overrides(
            case,
            outputs,
            module,
            int(match.group(1)),
            int(match.group(2)),
            int(match.group(3)),
            bits,
            equality=True,
        )
    match = re.match(r"sep_fields_e([1-6])_m([1-6])_s([0-6])_fullruns_bits_([0-9_]+)$", variant)
    if match:
        bits = [int(part) for part in match.group(4).split("_") if part != ""]
        return render_sep_fields_fullrun_bit_overrides(
            outputs,
            module,
            int(match.group(1)),
            int(match.group(2)),
            int(match.group(3)),
            bits,
        )
    match = re.match(r"bitplanes_h([1-6])$", variant)
    if match:
        return render_bitplanes(outputs, module, int(match.group(1)))
    match = re.match(r"hilo([1-6])_(word|field)_(first|mode)$", variant)
    if match:
        hi_bits = int(match.group(1))
        field_mode = match.group(2) == "field"
        default_mode = "default_override" if match.group(3) == "mode" else "first"
        return render_hi_lo(outputs, module, field_mode, hi_bits, default_mode)
    match = re.match(r"hilo([1-6])_(xor|add)_delta$", variant)
    if match:
        return render_base_delta_hi_lo(outputs, module, int(match.group(1)), match.group(2))
    if variant == "hilo4_word_first":
        return render_hi_lo(outputs, module, False, 4, "first")
    if variant == "hilo4_word_mode":
        return render_hi_lo(outputs, module, False, 4, "default_override")
    if variant == "hilo4_field_first":
        return render_hi_lo(outputs, module, True, 4, "first")
    if variant == "hilo4_field_mode":
        return render_hi_lo(outputs, module, True, 4, "default_override")
    if variant == "hilo5_word_first":
        return render_hi_lo(outputs, module, False, 5, "first")
    if variant == "hilo5_field_first":
        return render_hi_lo(outputs, module, True, 5, "first")
    if variant == "hilo4_xor_delta":
        return render_base_delta_hi_lo(outputs, module, 4, "xor")
    if variant == "hilo5_xor_delta":
        return render_base_delta_hi_lo(outputs, module, 5, "xor")
    if variant == "hilo4_add_delta":
        return render_base_delta_hi_lo(outputs, module, 4, "add")
    if variant == "hilo5_add_delta":
        return render_base_delta_hi_lo(outputs, module, 5, "add")
    if variant.startswith("mixed_"):
        return render_mixed_field(outputs, module, variant)
    if variant.startswith("wmixed_"):
        return render_mixed_word(outputs, module, variant[len("w"):])
    match = re.match(r"hilo3_field_mode_bits_([0-9_]+)_bh([1-6])$", variant)
    if match:
        bits = [int(part) for part in match.group(1).split("_") if part != ""]
        return render_hilo3_field_bit_overrides(outputs, module, bits, int(match.group(2)))
    match = re.match(r"hilo3_field_mode_bits_([0-9_]+)_runs$", variant)
    if match:
        bits = [int(part) for part in match.group(1).split("_") if part != ""]
        return render_hilo3_field_bit_overrides(outputs, module, bits, "runs")
    match = re.match(r"hilo3_field_mode_bits_([0-9_]+)_cmp$", variant)
    if match:
        bits = [int(part) for part in match.group(1).split("_") if part != ""]
        return render_hilo3_field_bit_overrides(outputs, module, bits, "cmp")
    match = re.match(r"hilo3_field_mode_bits_([0-9_]+)_pla$", variant)
    if match:
        bits = [int(part) for part in match.group(1).split("_") if part != ""]
        return render_hilo3_field_bit_overrides(outputs, module, bits, "pla")
    match = re.match(r"hilo3_field_mode_formula_bits_([0-9_]+)$", variant)
    if match:
        bits = [int(part) for part in match.group(1).split("_") if part != ""]
        return render_hilo3_field_formula_bit_overrides(case, outputs, module, bits)
    match = re.match(r"hilo3_field_mode_formulaeq_bits_([0-9_]+)$", variant)
    if match:
        bits = [int(part) for part in match.group(1).split("_") if part != ""]
        return render_hilo3_field_formula_bit_overrides(case, outputs, module, bits, equality=True)
    match = re.match(r"hilo3_field_mode_fullruns_bits_([0-9_]+)$", variant)
    if match:
        bits = [int(part) for part in match.group(1).split("_") if part != ""]
        return render_hilo3_field_fullrun_bit_overrides(outputs, module, bits)
    match = re.match(r"hilo3_word_mode_bits_([0-9_]+)_bh([1-6])$", variant)
    if match:
        bits = [int(part) for part in match.group(1).split("_") if part != ""]
        return render_hilo3_word_bit_overrides(outputs, module, bits, int(match.group(2)))
    match = re.match(r"hilo3_word_mode_bits_([0-9_]+)_runs$", variant)
    if match:
        bits = [int(part) for part in match.group(1).split("_") if part != ""]
        return render_hilo3_word_bit_overrides(outputs, module, bits, "runs")
    match = re.match(r"hilo3_word_mode_bits_([0-9_]+)_cmp$", variant)
    if match:
        bits = [int(part) for part in match.group(1).split("_") if part != ""]
        return render_hilo3_word_bit_overrides(outputs, module, bits, "cmp")
    match = re.match(r"hilo3_word_mode_bits_([0-9_]+)_pla$", variant)
    if match:
        bits = [int(part) for part in match.group(1).split("_") if part != ""]
        return render_hilo3_word_bit_overrides(outputs, module, bits, "pla")
    match = re.match(r"hilo3_word_mode_fullruns_bits_([0-9_]+)$", variant)
    if match:
        bits = [int(part) for part in match.group(1).split("_") if part != ""]
        return render_hilo3_word_fullrun_bit_overrides(outputs, module, bits)
    match = re.match(r"delta_pair_(first|mode|mant64)_(full|hilo[1-6])$", variant)
    if match:
        return render_delta_pair(outputs, module, match.group(1), match.group(2))
    match = re.match(r"delta_pair_(first|mode|mant64)_(full|hilo[1-6])_bits_([0-9_]+)_bh([1-6])$", variant)
    if match:
        bits = [int(part) for part in match.group(3).split("_") if part != ""]
        return render_delta_pair_bit_overrides(
            outputs,
            module,
            match.group(1),
            match.group(2),
            bits,
            int(match.group(4)),
        )
    match = re.match(r"delta_pair_(first|mode|mant64)_(full|hilo[1-6])_bits_([0-9_]+)_runs$", variant)
    if match:
        bits = [int(part) for part in match.group(3).split("_") if part != ""]
        return render_delta_pair_bit_overrides(
            outputs,
            module,
            match.group(1),
            match.group(2),
            bits,
            "runs",
        )
    match = re.match(r"delta_pair_(first|mode|mant64)_(full|hilo[1-6])_bits_([0-9_]+)_cmp$", variant)
    if match:
        bits = [int(part) for part in match.group(3).split("_") if part != ""]
        return render_delta_pair_bit_overrides(
            outputs,
            module,
            match.group(1),
            match.group(2),
            bits,
            "cmp",
        )
    match = re.match(r"delta_pair_(first|mode|mant64)_(full|hilo[1-6])_bits_([0-9_]+)_pla$", variant)
    if match:
        bits = [int(part) for part in match.group(3).split("_") if part != ""]
        return render_delta_pair_bit_overrides(
            outputs,
            module,
            match.group(1),
            match.group(2),
            bits,
            "pla",
        )
    match = re.match(r"delta_pair_(first|mode|mant64)_(full|hilo[1-6])_formula_bits_([0-9_]+)$", variant)
    if match:
        bits = [int(part) for part in match.group(3).split("_") if part != ""]
        return render_delta_pair_formula_bit_overrides(case, outputs, module, match.group(1), match.group(2), bits)
    match = re.match(r"delta_pair_(first|mode|mant64)_(full|hilo[1-6])_formulaeq_bits_([0-9_]+)$", variant)
    if match:
        bits = [int(part) for part in match.group(3).split("_") if part != ""]
        return render_delta_pair_formula_bit_overrides(case, outputs, module, match.group(1), match.group(2), bits, equality=True)
    match = re.match(r"delta_pair_(first|mode|mant64)_(full|hilo[1-6])_fullruns_bits_([0-9_]+)$", variant)
    if match:
        bits = [int(part) for part in match.group(3).split("_") if part != ""]
        return render_delta_pair_fullrun_bit_overrides(outputs, module, match.group(1), match.group(2), bits)
    raise RuntimeError("unknown variant: {0}".format(variant))


def run_candidate(case, outputs, variant, args):
    info = CASE_INFO[case]
    module = "{0}_{1}_{2}".format(case, info["hypothesis"], variant)
    case_work = ROOT / "student" / "work" / args.run_id / case
    verilog_path = case_work / "verilog" / "{0}.v".format(module)
    aig_path = case_work / "aigs" / "{0}.aig".format(module)
    log_path = case_work / "logs" / "{0}.yosys.log".format(module)
    script_path = case_work / "logs" / "{0}.ys".format(module)
    row = {
        "case": case,
        "candidate_id": module,
        "hypothesis": info["hypothesis"],
        "function_guess": info["function_guess"],
        "variant": variant,
        "verilog_path": rel_path(verilog_path),
        "aig_path": rel_path(aig_path),
        "verified_truth": "0",
        "equivalent": "0",
        "area": "",
        "delay": "",
        "adp": "",
        "runtime_sec": "",
        "notes": "",
    }
    start = time.time()
    try:
        text, note = render_candidate(case, outputs, module, variant)
        write_text(verilog_path, text)
        row["verified_truth"] = "1"
        yosys_log = synthesize_verilog(
            verilog=verilog_path,
            module=module,
            output=aig_path,
            timeout=args.yosys_timeout,
            script_out=script_path,
        )
        write_text(log_path, yosys_log)
        truth_path = ROOT / "benchmarks" / "{0}.truth".format(case)
        cand = evaluate_aig(
            case=case,
            candidate_id=module,
            parent_id="",
            source="verilog",
            tool_chain="yosys_aigmap",
            aig_path=aig_path,
            truth=truth_path,
            abc=args.abc,
            notes=note,
            timeout=args.abc_timeout,
        )
        row["equivalent"] = "1" if cand.equivalent else "0"
        if cand.equivalent:
            row["area"] = str(cand.area)
            row["delay"] = str(cand.delay)
            row["adp"] = str(cand.adp)
        row["notes"] = cand.notes
    except (SynthError, RuntimeError, subprocess.TimeoutExpired) as error:
        row["notes"] = "failed: {0}".format(error)
    row["runtime_sec"] = "{0:.3f}".format(time.time() - start)
    return row


def best_rows(rows):
    valid = [row for row in rows if row["equivalent"] == "1" and row["adp"]]
    valid.sort(key=lambda row: (int(row["adp"]), int(row["delay"]), int(row["area"]), row["candidate_id"]))
    seen = set()
    best = []
    for row in valid:
        if row["case"] in seen:
            continue
        best.append(row)
        seen.add(row["case"])
    return best


def write_manifests(args, cases, rows, best):
    rows_by_case = {}
    for row in rows:
        rows_by_case.setdefault(row["case"], []).append(row)
    for case in cases:
        manifest = {
            "run_id": args.run_id,
            "case": case,
            "domain": "bf16",
            "stage": "frontend semantic continuation",
            "truth_convention": "ABC read_truth -xf via student.frontends.truth.TruthTable",
            "backend_optimization": "not run",
            "candidates": rows_by_case.get(case, []),
        }
        write_text(
            ROOT / "student" / "work" / args.run_id / case / "manifest.json",
            json.dumps(manifest, indent=2, sort_keys=True) + "\n",
        )
    lines = [
        "# {0}".format(args.run_id),
        "",
        "Run ID: `{0}`".format(args.run_id),
        "",
        "Purpose: continue frontend-only BF16 semantic factoring for ex201-ex204.",
        "",
        "Inputs:",
        "- Truth files: `benchmarks/ex201.truth` through `benchmarks/ex204.truth` as selected by `--cases`.",
        "- Generator/script: `student/generators/bf16_ex201_ex204_continue.py`.",
        "",
        "Artifacts:",
        "- Work directory: `student/work/{0}/`".format(args.run_id),
        "- Results directory: `student/runs/bf16/{0}/results/`".format(args.run_id),
        "",
        "Methods tried:",
        "- Mantissa hi/lo split field and word tables.",
        "- Mantissa hi/lo base plus XOR/add delta tables.",
        "- Hand-derived selected-bit formula overrides for boundary exponent/mantissa cases.",
        "- Full-input casez run overrides for selected output bits.",
        "- Per-sign-exp mantissa PLA/cube covers for selected output bits.",
        "- Yosys synthesis to AIG plus ABC CEC/ADP measurement only.",
        "",
        "Best result:",
        "- See `results/best.csv`.",
        "",
        "Notes:",
        "- Backend portfolios were not run.",
        "- Current consolidated candidate count: {0}.".format(len(rows)),
        "- Official `evaluate.py --case` recheck is recorded in `results/evaluate_check.csv`.",
        "- Latest improvement: ex204 `log2_arithbase_delta_hilo3_formula_bits_11_14` reached `1545/17/26265`.",
        "",
    ]
    write_text(ROOT / "student" / "runs" / "bf16" / args.run_id / "MANIFEST.md", "\n".join(lines))


def write_outputs(args, cases, rows):
    refs = read_reference_adp(args.reference)
    best = []
    for row in best_rows(rows):
        ref = refs.get(row["case"])
        adp = int(row["adp"])
        out = {field: row.get(field, "") for field in BEST_FIELDS}
        out["reference_adp"] = str(ref) if ref else ""
        out["ratio_to_reference"] = "{0:.6f}".format(adp / ref) if ref else ""
        out["within_1p5_reference"] = "1" if ref and adp <= int(ref * 1.5) else "0"
        out["beats_reference"] = "1" if ref and adp < ref else "0"
        best.append(out)
    best.sort(key=lambda row: row["case"])
    summaries = []
    best_by_case = {row["case"]: row for row in best}
    summary_cases = sorted(set(cases) | {row["case"] for row in rows if row.get("case")})
    for case in summary_cases:
        row = best_by_case.get(case, {})
        ref = refs.get(case)
        adp = int(row["adp"]) if row.get("adp") else None
        summaries.append(
            {
                "case": case,
                "best_candidate_id": row.get("candidate_id", ""),
                "best_area": row.get("area", ""),
                "best_delay": row.get("delay", ""),
                "best_adp": row.get("adp", ""),
                "reference_adp": str(ref) if ref else "",
                "ratio_to_reference": "{0:.6f}".format(adp / ref) if ref and adp else "",
                "within_1p5_reference": "1" if ref and adp and adp <= int(ref * 1.5) else "0",
                "beats_reference": "1" if ref and adp and adp < ref else "0",
                "notes": row.get("notes", ""),
            }
        )
    result_dir = ROOT / "student" / "runs" / "bf16" / args.run_id / "results"
    write_csv(result_dir / "candidates.csv", RESULT_FIELDS, rows)
    write_csv(result_dir / "best.csv", BEST_FIELDS, best)
    write_csv(result_dir / "summary.csv", SUMMARY_FIELDS, summaries)
    write_manifests(args, cases, rows, best)


def merge_existing_rows(args, rows):
    if not args.append:
        return rows
    path = ROOT / "student" / "runs" / "bf16" / args.run_id / "results" / "candidates.csv"
    if not path.is_file():
        return rows
    merged = []
    seen = set()
    with path.open() as handle:
        reader = csv.DictReader(handle)
        for row in reader:
            key = row.get("candidate_id", "")
            if key:
                seen.add(key)
            merged.append(row)
    for row in rows:
        key = row.get("candidate_id", "")
        if key and key in seen:
            continue
        merged.append(row)
        if key:
            seen.add(key)
    return merged


def parse_args(argv=None):
    parser = argparse.ArgumentParser(description="Continue BF16 frontend semantic factoring.")
    parser.add_argument("--run-id", default=DEFAULT_RUN_ID)
    parser.add_argument("--cases", nargs="+", default=["ex202"])
    parser.add_argument(
        "--variants",
        nargs="+",
        default=[
            "hilo4_word_first",
            "hilo4_word_mode",
            "hilo4_field_first",
            "hilo4_field_mode",
            "hilo5_word_first",
            "hilo5_field_first",
            "hilo4_xor_delta",
            "hilo5_xor_delta",
            "hilo4_add_delta",
            "hilo5_add_delta",
        ],
    )
    parser.add_argument("--reference", type=Path, default=ROOT / "reference_result.csv")
    parser.add_argument("--abc", type=Path, default=DEFAULT_ABC)
    parser.add_argument("--yosys-timeout", type=int, default=180)
    parser.add_argument("--abc-timeout", type=int, default=180)
    parser.add_argument("--append", action="store_true")
    parser.add_argument("--rewrite-only", action="store_true")
    return parser.parse_args(argv)


def main(argv=None):
    args = parse_args(argv)
    if args.rewrite_only:
        path = ROOT / "student" / "runs" / "bf16" / args.run_id / "results" / "candidates.csv"
        with path.open() as handle:
            rows = list(csv.DictReader(handle))
        write_outputs(args, args.cases, rows)
        print("Rewrote summaries from {0}".format(path))
        return 0
    rows = []
    for case in args.cases:
        outputs = list(TruthTable(ROOT / "benchmarks" / "{0}.truth".format(case)).iter_outputs())
        for variant in args.variants:
            row = run_candidate(case, outputs, variant, args)
            rows.append(row)
            print(
                "{0} {1}: equiv={2} area={3} delay={4} adp={5}".format(
                    case,
                    variant,
                    row["equivalent"],
                    row["area"],
                    row["delay"],
                    row["adp"],
                )
            )
    rows = merge_existing_rows(args, rows)
    write_outputs(args, args.cases, rows)
    print("Results: student/runs/bf16/{0}/results/candidates.csv".format(args.run_id))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
