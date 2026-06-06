#!/usr/bin/env python3
"""Frontend-only BF16 semantic/structural search for ex210-ex214.

The generated Verilog follows the project truth convention (`read_truth -xf`)
through student.frontends.truth.TruthTable.  This script only uses Yosys AIG
synthesis plus ABC CEC/ADP measurement; it does not run backend portfolios.
"""

import argparse
import csv
import json
import math
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
    const_word,
    grouped_runs,
    mode_value,
    range_casez_patterns,
    rel_path,
    write_csv,
    write_text,
)
from student.generators.bf16_ex201_ex204_continue import (
    emit_bit_cmp_runs,
    emit_bit_hi_lo,
    emit_bit_pla,
    emit_bit_runs,
    emit_const_bit_ranges,
    emit_scalar_hi_lo_exp,
    field_value,
    field_width,
    module_header,
)
from student.generators.bf16_ex205_ex209_frontend import render_candidate as render_generic_candidate
from student.generators.bf16_aggressive_semantic_search import render_variant as render_aggressive_variant
from student.generators.bf16_semantic_search import (
    CASE_OPS as ARITH_CASE_OPS,
    OP_LABELS,
    render_semantic_verilog,
    semantic_model,
    verify_outputs,
)


DEFAULT_RUN_ID = "ex210_ex214_frontend_bf16_semantic_20260606_1315"
DEFAULT_ABC = ROOT / "student" / "tools" / "abc" / "src" / "abc"

CASE_INFO = {
    "ex210": {"hypothesis": "bf16_sigmoid", "function_guess": "sigmoid"},
    "ex211": {"hypothesis": "bf16_reciprocal", "function_guess": "reciprocal"},
    "ex212": {"hypothesis": "bf16_square", "function_guess": "square"},
    "ex213": {"hypothesis": "bf16_sqrt", "function_guess": "sqrt"},
    "ex214": {"hypothesis": "bf16_reciprocal_square", "function_guess": "reciprocal_square"},
}

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
    "old_best_adp",
    "improvement_vs_old_best",
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
    "old_best_adp",
    "improvement_vs_old_best",
    "reference_adp",
    "ratio_to_reference",
    "within_1p5_reference",
    "beats_reference",
    "notes",
]


def read_reference_adp(path):
    refs = {}
    with Path(path).open() as handle:
        for row in csv.DictReader(handle):
            refs[row["case"]] = int(row.get("ADP", row.get("adp")))
    return refs


def read_old_best_adp(path):
    best = {}
    if path is None or not Path(path).is_file():
        return best
    with Path(path).open() as handle:
        for row in csv.DictReader(handle):
            if row.get("case") in CASE_INFO and row.get("adp"):
                best[row["case"]] = int(row["adp"])
    return best


def render_const_default_exceptions(outputs, module, default_value, hi_bits, default_mode="mode"):
    lines = module_header(module)
    lines.extend(
        [
            "  reg [15:0] out_r;",
            "  always @* begin",
            "    out_r = {0};".format(const_word(16, default_value)),
            "    casez (sign_exp)",
        ]
    )
    items = 0
    const_groups = {}
    variable = []
    for sign_exp in range(512):
        values = [outputs[(sign_exp << 7) | mant] for mant in range(128)]
        unique = set(values)
        if len(unique) == 1:
            value = values[0]
            if value != default_value:
                const_groups.setdefault(value, []).append(sign_exp)
        else:
            variable.append(sign_exp)
    for value in sorted(const_groups):
        for start, end in grouped_runs(const_groups[value]):
            for pattern in range_casez_patterns(9, start, end):
                lines.append("      {0}: out_r = {1};".format(pattern, const_word(16, value)))
                items += 1
    hi_count = 1 << hi_bits
    lo_bits = 7 - hi_bits
    hi_name = "mant_hi{0}".format(hi_bits)
    lo_name = "mant_lo{0}".format(lo_bits)
    for sign_exp in variable:
        expected = [outputs[(sign_exp << 7) | mant] for mant in range(128)]
        lines.append("      {0}: begin".format(const_word(9, sign_exp)))
        lines.append("        case ({0})".format(hi_name))
        for hi in range(hi_count):
            local = [expected[(hi << lo_bits) | lo] for lo in range(1 << lo_bits)]
            if all(value == default_value for value in local):
                continue
            base = local[0] if default_mode == "first" else mode_value(local)
            differing = [(lo, value) for lo, value in enumerate(local) if value != base]
            lines.append("          {0}: begin".format(const_word(hi_bits, hi)))
            lines.append("            out_r = {0};".format(const_word(16, base)))
            if differing:
                lines.append("            case ({0})".format(lo_name))
                for lo, value in differing:
                    lines.append(
                        "              {0}: out_r = {1};".format(
                            const_word(lo_bits, lo),
                            const_word(16, value),
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
    note = "constant default {0} exceptions hi_bits={1} default_mode={2} items={3}".format(
        const_word(16, default_value),
        hi_bits,
        default_mode,
        items,
    )
    return "\n".join(lines), note


def render_positive_fullword_same(outputs, module, hi_bits, default_mode="mode"):
    lines = module_header(module)
    lines.extend(
        [
            "  wire [7:0] exp = in[14:7];",
            "  reg [15:0] pos_word;",
            "  always @* begin",
            "    pos_word = {0};".format(
                const_word(
                    16,
                    mode_value([outputs[(exp << 7) | mant] for exp in range(256) for mant in range(128)]),
                )
            ),
            "    casez (exp)",
        ]
    )
    items = 0
    positives = [outputs[(exp << 7) | mant] for exp in range(256) for mant in range(128)]
    default = mode_value(positives)
    by_value = {}
    variable = []
    for exp in range(256):
        values = [outputs[(exp << 7) | mant] for mant in range(128)]
        unique = set(values)
        if len(unique) == 1:
            value = values[0]
            if value != default:
                by_value.setdefault(value, []).append(exp)
        else:
            variable.append(exp)
    for value in sorted(by_value):
        for start, end in grouped_runs(by_value[value]):
            for pattern in range_casez_patterns(8, start, end):
                lines.append("      {0}: pos_word = {1};".format(pattern, const_word(16, value)))
                items += 1
    hi_count = 1 << hi_bits
    lo_bits = 7 - hi_bits
    hi_name = "mant_hi{0}".format(hi_bits)
    lo_name = "mant_lo{0}".format(lo_bits)
    for exp in variable:
        values = [outputs[(exp << 7) | mant] for mant in range(128)]
        lines.append("      {0}: begin".format(const_word(8, exp)))
        lines.append("        case ({0})".format(hi_name))
        for hi in range(hi_count):
            local = [values[(hi << lo_bits) | lo] for lo in range(1 << lo_bits)]
            base = local[0] if default_mode == "first" else mode_value(local)
            differing = [(lo, value) for lo, value in enumerate(local) if value != base]
            lines.append("          {0}: begin".format(const_word(hi_bits, hi)))
            lines.append("            pos_word = {0};".format(const_word(16, base)))
            if differing:
                lines.append("            case ({0})".format(lo_name))
                for lo, value in differing:
                    lines.append(
                        "              {0}: pos_word = {1};".format(
                            const_word(lo_bits, lo),
                            const_word(16, value),
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
    lines.extend(
        [
            "      default: begin end",
            "    endcase",
            "  end",
            "  assign out = pos_word;",
            "endmodule",
            "",
        ]
    )
    note = "positive-domain sign-insensitive full word hi_bits={0} default_mode={1} items={2}".format(
        hi_bits,
        default_mode,
        items,
    )
    return "\n".join(lines), note


def render_positive_same_fields(outputs, module, exp_hi_bits, mant_hi_bits):
    lines = module_header(module)
    lines.extend(
        [
            "  wire [7:0] exp = in[14:7];",
            "  reg [7:0] out_exp;",
            "  reg [6:0] out_mant;",
        ]
    )
    items = 0
    settings = [("exp", "out_exp", exp_hi_bits), ("mant", "out_mant", mant_hi_bits)]
    for field, target, hi_bits in settings:
        positives = [field_value(outputs[(exp << 7) | mant], field) for exp in range(256) for mant in range(128)]
        default = mode_value(positives)
        lines.extend(
            [
                "  always @* begin",
                "    {0} = {1};".format(target, const_word(field_width(field), default)),
                "    casez (exp)",
            ]
        )
        by_value = {}
        variable = []
        for exp in range(256):
            values = [field_value(outputs[(exp << 7) | mant], field) for mant in range(128)]
            unique = set(values)
            if len(unique) == 1:
                value = values[0]
                if value != default:
                    by_value.setdefault(value, []).append(exp)
            else:
                variable.append(exp)
        for value in sorted(by_value):
            for start, end in grouped_runs(by_value[value]):
                for pattern in range_casez_patterns(8, start, end):
                    lines.append(
                        "      {0}: {1} = {2};".format(
                            pattern,
                            target,
                            const_word(field_width(field), value),
                        )
                    )
                    items += 1
        for exp in variable:
            items += emit_scalar_hi_lo_exp(lines, outputs, 0, exp, field, target, hi_bits)
        lines.extend(["      default: begin end", "    endcase", "  end"])
    lines.extend(
        [
            "  assign out = {1'b0, out_exp, out_mant};",
            "endmodule",
            "",
        ]
    )
    note = "positive-domain sign-insensitive separate fields exp_hi={0} mant_hi={1} items={2}".format(
        exp_hi_bits,
        mant_hi_bits,
        items,
    )
    return "\n".join(lines), note


def render_sqrt_positive_nan_fullword(outputs, module, hi_bits, default_mode="mode"):
    text, note = render_positive_fullword_same(outputs, module, hi_bits, default_mode)
    footer = "  assign out = pos_word;\nendmodule\n"
    if not text.endswith(footer):
        raise RuntimeError("unexpected positive fullword footer")
    lines = text[: -len(footer)].rstrip().splitlines()
    lines.extend(
        [
            "  wire sign = in[15];",
            "  wire [15:0] neg_word = (in[14:7] == 8'h00) ? 16'h8000 : 16'h7fc0;",
            "  assign out = sign ? neg_word : pos_word;",
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines), "{0}; sqrt negative-domain NaN/negative-zero semantic footer".format(note)


def render_sqrt_positive_nan_fields(outputs, module, exp_hi_bits, mant_hi_bits):
    text, note = render_positive_same_fields(outputs, module, exp_hi_bits, mant_hi_bits)
    footer = "  assign out = {1'b0, out_exp, out_mant};\nendmodule\n"
    if not text.endswith(footer):
        raise RuntimeError("unexpected positive fields footer")
    lines = text[: -len(footer)].rstrip().splitlines()
    lines.extend(
        [
            "  wire sign = in[15];",
            "  wire [15:0] pos_word = {1'b0, out_exp, out_mant};",
            "  wire [15:0] neg_word = (in[14:7] == 8'h00) ? 16'h8000 : 16'h7fc0;",
            "  assign out = sign ? neg_word : pos_word;",
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines), "{0}; sqrt negative-domain NaN/negative-zero semantic footer".format(note)


def render_recip_formula_mant_lut(outputs, module):
    lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [15:0] out;",
        "  wire sign = in[15];",
        "  wire [7:0] exp = in[14:7];",
        "  wire [6:0] mant = in[6:0];",
        "  reg [6:0] rec_mant;",
        "  always @* begin",
        "    case (mant)",
    ]
    items = 0
    for mant in range(128):
        value = outputs[(1 << 7) | mant] & 0x7F
        lines.append("      {0}: rec_mant = {1};".format(const_word(7, mant), const_word(7, value)))
        items += 1
    lines.extend(
        [
            "      default: rec_mant = 7'h00;",
            "    endcase",
            "  end",
            "  wire [7:0] normal_exp = (mant == 7'h00) ? (8'hfe - exp) : (8'hfd - exp);",
            "  wire underflow = (exp == 8'hfe) | ((exp == 8'hfd) & (mant != 7'h00));",
            "  wire [15:0] normal_pos = underflow ? 16'h0000 : {1'b0, normal_exp, rec_mant};",
            "  wire [15:0] normal_signed = normal_pos ^ {sign, 15'h0000};",
            "  wire is_nan = (exp == 8'hff) & (mant != 7'h00);",
            "  wire is_inf = (exp == 8'hff) & (mant == 7'h00);",
            "  assign out = (exp == 8'h00) ? {sign, 8'hff, 7'h00} :",
            "               is_nan ? 16'h7fc0 :",
            "               is_inf ? {sign, 15'h0000} : normal_signed;",
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines), "hand semantic reciprocal: special cases + 128-entry mantissa LUT items={0}".format(items)


def render_recip_formula_signmag_lut(outputs, module):
    text, note = render_recip_formula_mant_lut(outputs, module)
    old = [
        "  wire [15:0] normal_pos = underflow ? 16'h0000 : {1'b0, normal_exp, rec_mant};",
        "  wire [15:0] normal_signed = normal_pos ^ {sign, 15'h0000};",
        "  wire is_nan = (exp == 8'hff) & (mant != 7'h00);",
        "  wire is_inf = (exp == 8'hff) & (mant == 7'h00);",
        "  assign out = (exp == 8'h00) ? {sign, 8'hff, 7'h00} :",
        "               is_nan ? 16'h7fc0 :",
        "               is_inf ? {sign, 15'h0000} : normal_signed;",
    ]
    new = [
        "  wire [14:0] normal_mag = underflow ? 15'h0000 : {normal_exp, rec_mant};",
        "  wire is_nan = (exp == 8'hff) & (mant != 7'h00);",
        "  wire is_inf = (exp == 8'hff) & (mant == 7'h00);",
        "  wire [14:0] out_mag = (exp == 8'h00) ? 15'h7f80 :",
        "                         is_inf ? 15'h0000 : normal_mag;",
        "  assign out = is_nan ? 16'h7fc0 : {sign, out_mag};",
    ]
    old_text = "\n".join(old)
    if old_text not in text:
        raise RuntimeError("unexpected reciprocal formula text")
    text = text.replace(old_text, "\n".join(new))
    return text, "{0}; sign/magnitude output mux rewrite".format(note)


def render_recip_formula_signmag_add_lut(outputs, module):
    text, note = render_recip_formula_signmag_lut(outputs, module)
    old = "  wire [7:0] normal_exp = (mant == 7'h00) ? (8'hfe - exp) : (8'hfd - exp);"
    new = "  wire [7:0] normal_exp = (8'hfd - exp) + {7'h00, (mant == 7'h00)};"
    if old not in text:
        raise RuntimeError("unexpected reciprocal signmag text")
    text = text.replace(old, new)
    return text, "{0}; single subtract plus mant-zero increment".format(note)


def render_square_formula_mant_lut(outputs, module):
    lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [15:0] out;",
        "  wire [7:0] exp = in[14:7];",
        "  wire [6:0] mant = in[6:0];",
        "  reg delta;",
        "  reg [6:0] sq_mant;",
        "  always @* begin",
        "    case (mant)",
    ]
    items = 0
    for mant in range(128):
        value = outputs[(127 << 7) | mant]
        delta = ((value >> 7) & 0xFF) - 127
        lines.append(
            "      {0}: begin delta = 1'b{1}; sq_mant = {2}; end".format(
                const_word(7, mant),
                delta & 1,
                const_word(7, value & 0x7F),
            )
        )
        items += 1
    lines.extend(
        [
            "      default: begin delta = 1'b0; sq_mant = 7'h00; end",
            "    endcase",
            "  end",
            "  wire [8:0] normal_exp9 = {exp, 1'b0} - 9'd127 + {8'h00, delta};",
            "  wire [15:0] normal_pos = {1'b0, normal_exp9[7:0], sq_mant};",
            "  wire is_nan = (exp == 8'hff) & (mant != 7'h00);",
            "  wire is_inf = (exp == 8'hff) & (mant == 7'h00);",
            "  wire underflow = (exp < 8'd64);",
            "  wire overflow = (exp > 8'd190);",
            "  assign out = (exp == 8'h00) ? 16'h0000 :",
            "               is_nan ? 16'h7fc0 :",
            "               is_inf ? 16'h7f80 :",
            "               underflow ? 16'h0000 :",
            "               overflow ? 16'h7f80 : normal_pos;",
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines), "hand semantic square: threshold guards + 128-entry mantissa LUT items={0}".format(items)


def render_recip_square_formula_mant_lut(outputs, module):
    lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [15:0] out;",
        "  wire [7:0] exp = in[14:7];",
        "  wire [6:0] mant = in[6:0];",
        "  reg signed [2:0] delta;",
        "  reg [6:0] rsq_mant;",
        "  always @* begin",
        "    case (mant)",
    ]
    items = 0
    for mant in range(128):
        value = outputs[(127 << 7) | mant]
        delta = ((value >> 7) & 0xFF) - 127
        lines.append(
            "      {0}: begin delta = {1}; rsq_mant = {2}; end".format(
                const_word(7, mant),
                "{0}'sd{1}".format(3, delta) if delta >= 0 else "-3'sd{0}".format(-delta),
                const_word(7, value & 0x7F),
            )
        )
        items += 1
    lines.extend(
        [
            "      default: begin delta = 3'sd0; rsq_mant = 7'h00; end",
            "    endcase",
            "  end",
            "  wire signed [9:0] normal_exp_s = 10'sd381 - $signed({1'b0, exp, 1'b0}) + delta;",
            "  wire [15:0] normal_pos = {1'b0, normal_exp_s[7:0], rsq_mant};",
            "  wire is_nan = (exp == 8'hff) & (mant != 7'h00);",
            "  wire is_inf = (exp == 8'hff) & (mant == 7'h00);",
            "  wire overflow = (exp < 8'd63) | ((exp == 8'd63) & (mant == 7'h00));",
            "  wire underflow = (exp > 8'd190) | ((exp == 8'd190) & (mant != 7'h00));",
            "  assign out = (exp == 8'h00) ? 16'h7f80 :",
            "               is_nan ? 16'h7fc0 :",
            "               is_inf ? 16'h0000 :",
            "               overflow ? 16'h7f80 :",
            "               underflow ? 16'h0000 : normal_pos;",
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines), "hand semantic reciprocal-square: threshold guards + 128-entry mantissa LUT items={0}".format(items)


def render_word_text_bit_overrides(outputs, text, note, bits, bit_hi_bits):
    final = "  assign out = out_r;\nendmodule\n"
    if not text.endswith(final):
        raise RuntimeError("unexpected word text footer")
    lines = text[: -len(final)].rstrip().splitlines()
    if not any("wire [8:0] sign_exp" in line for line in lines):
        for index, line in enumerate(lines):
            if line.strip() == "output [15:0] out;":
                lines[index + 1 : index + 1] = [
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
                break
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
        const_items, variable = emit_const_bit_ranges(lines, outputs, bit, target, bit_default, "      ")
        items += const_items
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
    pieces = ["bit_{0}".format(bit) if bit in bit_set else "out_r[{0}]".format(bit) for bit in range(15, -1, -1)]
    lines.extend(["  assign out = {{{0}}};".format(", ".join(pieces)), "endmodule", ""])
    return "\n".join(lines), "{0}; selected bit overrides bits={1} bit_hi_bits={2} bit_items={3}".format(
        note,
        "_".join(str(bit) for bit in bits),
        bit_hi_bits,
        items,
    )


def bf16_to_float(bits):
    exp = (bits >> 7) & 0xFF
    mant = bits & 0x7F
    sign = -1.0 if bits & 0x8000 else 1.0
    if exp == 0:
        return -0.0 if sign < 0 else 0.0
    if exp == 0xFF:
        if mant:
            return math.nan
        return math.copysign(math.inf, sign)
    return sign * (1.0 + mant / 128.0) * (2.0 ** (exp - 127))


def float_to_bf16_rne(value):
    import struct

    if math.isnan(value):
        return 0x7FC0
    if math.isinf(value):
        return 0xFF80 if value < 0 else 0x7F80
    packed = struct.pack(">f", float(value))
    word = int.from_bytes(packed, "big")
    lsb = (word >> 16) & 1
    rounded = word + 0x7FFF + lsb
    out = (rounded >> 16) & 0xFFFF
    if (out & 0x7F80) == 0:
        return out & 0x8000
    return out


def verify_sigmoid_semantics(outputs):
    for bits, expected in enumerate(outputs):
        exp = (bits >> 7) & 0xFF
        mant = bits & 0x7F
        if exp == 0xFF and mant:
            actual = 0x7FC0
        else:
            value = bf16_to_float(bits)
            if math.isinf(value):
                actual = 0x3F80 if value > 0 else 0x0000
            else:
                if value >= 0.0:
                    sigmoid = 1.0 / (1.0 + math.exp(-value))
                else:
                    exp_value = math.exp(value)
                    sigmoid = exp_value / (1.0 + exp_value)
                actual = float_to_bf16_rne(sigmoid)
        if actual != expected:
            return False, "sigmoid mismatch index={0} expected=0x{1:04x} actual=0x{2:04x}".format(
                bits,
                expected,
                actual,
            )
    return True, "DAZ sigmoid BF16 RNE/canonical-NaN model exact over {0} inputs".format(len(outputs))


def semantic_note(case, outputs):
    if case == "ex210":
        ok, note = verify_sigmoid_semantics(outputs)
        if not ok:
            raise RuntimeError(note)
        return note
    op = ARITH_CASE_OPS[case]
    ok, note = verify_outputs(outputs, semantic_model(op, outputs))
    if not ok:
        raise RuntimeError(note)
    return note


def render_candidate(case, outputs, module, variant):
    if variant == "hand_recip_formula_mant_lut":
        return render_recip_formula_mant_lut(outputs, module)
    if variant == "hand_recip_formula_signmag_lut":
        return render_recip_formula_signmag_lut(outputs, module)
    if variant == "hand_recip_formula_signmag_add_lut":
        return render_recip_formula_signmag_add_lut(outputs, module)
    if variant == "hand_square_formula_mant_lut":
        return render_square_formula_mant_lut(outputs, module)
    if variant == "hand_recip_square_formula_mant_lut":
        return render_recip_square_formula_mant_lut(outputs, module)
    match = re.match(r"legacy_default_expr_exception_case_bits_([0-9_]+)_bh([1-6])(?:_fix)?$", variant)
    if match:
        bits = [int(part) for part in match.group(1).split("_") if part != ""]
        text, note = render_generic_candidate(case, outputs, module, "legacy_default_expr_exception_case")
        return render_word_text_bit_overrides(outputs, text, note, bits, int(match.group(2)))
    match = re.match(r"legacy_default_expr_exception_case_bits_([0-9_]+)_(runs|cmp|pla)(?:_fix)?$", variant)
    if match:
        bits = [int(part) for part in match.group(1).split("_") if part != ""]
        text, note = render_generic_candidate(case, outputs, module, "legacy_default_expr_exception_case")
        return render_word_text_bit_overrides(outputs, text, note, bits, match.group(2))
    if variant == "arith_semantic_fields":
        op = ARITH_CASE_OPS[case]
        text, items = render_semantic_verilog(case, op, outputs, module)
        return text, "semantic BF16 exponent/mantissa RTL; {0}".format(items)
    match = re.match(r"aggr_(.+)$", variant)
    if match:
        text, items, model = render_aggressive_variant(case, outputs, module, match.group(1))
        ok, note = verify_outputs(outputs, model)
        if not ok:
            raise RuntimeError(note)
        return text, "aggressive semantic BF16 RTL; items={0}; {1}".format(items, note)
    match = re.match(r"const_default_([0-9a-fA-F]{4})_h([1-6])(_first)?$", variant)
    if match:
        mode = "first" if match.group(3) else "mode"
        return render_const_default_exceptions(outputs, module, int(match.group(1), 16), int(match.group(2)), mode)
    match = re.match(r"pos_same_fullword_h([1-6])(_first)?$", variant)
    if match:
        mode = "first" if match.group(2) else "mode"
        return render_positive_fullword_same(outputs, module, int(match.group(1)), mode)
    match = re.match(r"pos_same_fields_e([1-6])_m([1-6])$", variant)
    if match:
        return render_positive_same_fields(outputs, module, int(match.group(1)), int(match.group(2)))
    match = re.match(r"sqrt_pos_nan_fullword_h([1-6])(_first)?$", variant)
    if match:
        mode = "first" if match.group(2) else "mode"
        return render_sqrt_positive_nan_fullword(outputs, module, int(match.group(1)), mode)
    match = re.match(r"sqrt_pos_nan_fields_e([1-6])_m([1-6])$", variant)
    if match:
        return render_sqrt_positive_nan_fields(outputs, module, int(match.group(1)), int(match.group(2)))
    return render_generic_candidate(case, outputs, module, variant)


def run_candidate(case, outputs, variant, args, semantic_notes):
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
            notes="{0}; {1}".format(semantic_notes[case], note),
            timeout=args.abc_timeout,
        )
        row["equivalent"] = "1" if cand.equivalent else "0"
        if cand.equivalent:
            row["area"] = str(cand.area)
            row["delay"] = str(cand.delay)
            row["adp"] = str(cand.adp)
        row["notes"] = cand.notes
    except (SynthError, RuntimeError, OSError, subprocess.TimeoutExpired) as error:
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


def write_manifests(args, cases, rows, semantic_notes):
    rows_by_case = {}
    for row in rows:
        rows_by_case.setdefault(row["case"], []).append(row)
    for case in cases:
        manifest = {
            "run_id": args.run_id,
            "case": case,
            "domain": "bf16",
            "stage": "frontend semantic/structural search",
            "truth_convention": "ABC read_truth -xf via student.frontends.truth.TruthTable",
            "backend_optimization": "not run",
            "semantic_note": semantic_notes.get(case, ""),
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
        "Purpose: frontend-only BF16 semantic/structural reverse engineering for ex210-ex214.",
        "",
        "Scope:",
        "- Cases: `{0}`.".format("`, `".join(cases)),
        "- Backend portfolios were not run.",
        "- Yosys AIG synthesis and ABC CEC/ADP measurement were used for frontend seed verification.",
        "",
        "Artifacts:",
        "- Work directory: `student/work/{0}/`".format(args.run_id),
        "- Results directory: `student/runs/bf16/{0}/results/`".format(args.run_id),
        "",
        "Semantic checks:",
    ]
    for case in cases:
        lines.append("- `{0}`: {1}".format(case, semantic_notes.get(case, "")))
    lines.extend(
        [
            "",
            "Methods:",
            "- Semantic arithmetic RTL for reciprocal, square, sqrt, and reciprocal-square.",
            "- Sigmoid saturation/default constants with local exception LUTs.",
            "- Positive-domain sign-flip tables for reciprocal.",
            "- Positive-domain sign-insensitive tables for square and reciprocal-square.",
            "- Sqrt positive-domain table plus explicit negative zero/NaN handling.",
            "- Mantissa hi/lo LUTs, separated fields, and selected structural baselines.",
            "",
            "Best result:",
            "- See `results/best.csv` and `results/summary.csv`.",
            "",
        ]
    )
    write_text(ROOT / "student" / "runs" / "bf16" / args.run_id / "MANIFEST.md", "\n".join(lines))


def write_outputs(args, cases, rows, semantic_notes):
    refs = read_reference_adp(args.reference)
    old_best = read_old_best_adp(args.old_best)
    best = []
    for row in best_rows(rows):
        ref = refs.get(row["case"])
        old = old_best.get(row["case"])
        adp = int(row["adp"])
        out = {field: row.get(field, "") for field in BEST_FIELDS}
        out["old_best_adp"] = str(old) if old else ""
        out["improvement_vs_old_best"] = "{0:.6f}".format((old - adp) / old) if old else ""
        out["reference_adp"] = str(ref) if ref else ""
        out["ratio_to_reference"] = "{0:.6f}".format(adp / ref) if ref else ""
        out["within_1p5_reference"] = "1" if ref and adp <= int(ref * 1.5) else "0"
        out["beats_reference"] = "1" if ref and adp < ref else "0"
        best.append(out)
    best.sort(key=lambda row: row["case"])
    best_by_case = {row["case"]: row for row in best}
    summaries = []
    for case in cases:
        row = best_by_case.get(case, {})
        ref = refs.get(case)
        old = old_best.get(case)
        adp = int(row["adp"]) if row.get("adp") else None
        summaries.append(
            {
                "case": case,
                "best_candidate_id": row.get("candidate_id", ""),
                "best_area": row.get("area", ""),
                "best_delay": row.get("delay", ""),
                "best_adp": row.get("adp", ""),
                "old_best_adp": str(old) if old else "",
                "improvement_vs_old_best": "{0:.6f}".format((old - adp) / old) if old and adp else "",
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
    write_csv(result_dir / "evaluate_check.csv", RESULT_FIELDS, [row for row in rows if row["equivalent"] == "1"])
    write_manifests(args, cases, rows, semantic_notes)


def merge_existing_rows(args, rows):
    if not args.append:
        return rows
    path = ROOT / "student" / "runs" / "bf16" / args.run_id / "results" / "candidates.csv"
    if not path.is_file():
        return rows
    merged = []
    seen = set()
    with path.open() as handle:
        for row in csv.DictReader(handle):
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


DEFAULT_VARIANTS = {
    "ex210": [
        "aggr_semantic_field_reassembly",
        "aggr_semantic_sign_exp_field_defaults",
        "aggr_semantic_positive_field_defaults",
        "aggr_semantic_positive_symmetry_fields",
        "aggr_semantic_exp_delta_fields",
        "legacy_exp_mant_pair_case",
        "legacy_sign_exp_mant_case",
        "legacy_positive_default_exp_mant_case",
        "legacy_default_expr_exception_case",
        "sign_exp_default_expr_casez",
        "const_default_3f00_h3",
        "const_default_3f00_h4",
        "const_default_3f00_h5",
        "const_default_3f80_h3",
        "const_default_0000_h3",
        "hilo3_word_mode",
        "hilo4_word_mode",
        "sep_fields_e3_m3_s0",
        "sep_fields_e3_m4_s0",
    ],
    "ex211": [
        "arith_semantic_fields",
        "aggr_semantic_field_reassembly",
        "aggr_semantic_positive_symmetry_fields",
        "aggr_semantic_positive_field_defaults",
        "legacy_exp_mant_delta_pair",
        "legacy_positive_default_exp_mant_case",
        "legacy_positive_default_exp_mant_delta",
        "legacy_default_expr_exception_case",
        "odd_pos_fullword_h3",
        "odd_pos_fullword_h4",
        "odd_pos_fullword_h5",
        "odd_pos_word_h3",
        "odd_pos_fields_e3_m3",
        "split_sign_word_h3",
        "split_sign_word_h4",
        "hilo3_word_mode",
        "sep_fields_e3_m3_s3",
    ],
    "ex212": [
        "arith_semantic_fields",
        "aggr_semantic_field_reassembly",
        "aggr_semantic_exp_delta_fields",
        "legacy_exp_mant_delta_pair",
        "legacy_positive_default_exp_mant_case",
        "legacy_positive_default_exp_mant_delta",
        "legacy_default_expr_exception_case",
        "pos_same_fullword_h2",
        "pos_same_fullword_h3",
        "pos_same_fullword_h4",
        "pos_same_fullword_h5",
        "pos_same_fields_e2_m3",
        "pos_same_fields_e3_m3",
        "pos_same_fields_e4_m3",
        "delta_pair_first_hilo3",
        "delta_pair_mode_hilo3",
        "hilo3_word_mode",
        "sep_fields_e3_m3_s0",
        "const_default_0000_h3",
        "const_default_7f80_h3",
    ],
    "ex213": [
        "arith_semantic_fields",
        "aggr_semantic_field_reassembly",
        "aggr_semantic_exp_delta_fields",
        "aggr_semantic_positive_field_defaults",
        "legacy_exp_mant_delta_pair",
        "legacy_positive_default_exp_mant_case",
        "legacy_default_expr_exception_case",
        "sqrt_pos_nan_fullword_h2",
        "sqrt_pos_nan_fullword_h3",
        "sqrt_pos_nan_fullword_h4",
        "sqrt_pos_nan_fields_e2_m3",
        "sqrt_pos_nan_fields_e3_m3",
        "sqrt_pos_nan_fields_e4_m3",
        "hilo3_word_mode",
        "sep_fields_e3_m3_s3",
        "const_default_7fc0_h3",
    ],
    "ex214": [
        "arith_semantic_fields",
        "aggr_semantic_field_reassembly",
        "aggr_semantic_exp_delta_fields",
        "legacy_exp_mant_delta_pair",
        "legacy_positive_default_exp_mant_case",
        "legacy_positive_default_exp_mant_delta",
        "legacy_default_expr_exception_case",
        "pos_same_fullword_h2",
        "pos_same_fullword_h3",
        "pos_same_fullword_h4",
        "pos_same_fullword_h5",
        "pos_same_fields_e2_m3",
        "pos_same_fields_e3_m3",
        "pos_same_fields_e4_m3",
        "delta_pair_first_hilo3",
        "delta_pair_mode_hilo3",
        "hilo3_word_mode",
        "sep_fields_e3_m3_s0",
        "const_default_0000_h3",
        "const_default_7f80_h3",
    ],
}


def parse_args(argv=None):
    parser = argparse.ArgumentParser(description="BF16 ex210-ex214 frontend-only semantic search.")
    parser.add_argument("--run-id", default=DEFAULT_RUN_ID)
    parser.add_argument("--cases", nargs="+", default=["ex210", "ex211", "ex212", "ex213", "ex214"])
    parser.add_argument("--variants", nargs="+", default=None)
    parser.add_argument("--reference", type=Path, default=ROOT / "reference_result.csv")
    parser.add_argument(
        "--old-best",
        type=Path,
        default=ROOT / "student" / "runs" / "bf16" / "ex200_ex219_current" / "results" / "best.csv",
    )
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
        semantic_notes = {}
        for case in args.cases:
            outputs = list(TruthTable(ROOT / "benchmarks" / "{0}.truth".format(case)).iter_outputs())
            semantic_notes[case] = semantic_note(case, outputs)
        write_outputs(args, args.cases, rows, semantic_notes)
        print("Rewrote summaries from {0}".format(path))
        return 0

    rows = []
    semantic_notes = {}
    for case in args.cases:
        if case not in CASE_INFO:
            raise RuntimeError("unsupported case: {0}".format(case))
        outputs = list(TruthTable(ROOT / "benchmarks" / "{0}.truth".format(case)).iter_outputs())
        semantic_notes[case] = semantic_note(case, outputs)
        variants = args.variants if args.variants is not None else DEFAULT_VARIANTS[case]
        for variant in variants:
            row = run_candidate(case, outputs, variant, args, semantic_notes)
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
    write_outputs(args, args.cases, rows, semantic_notes)
    print("Results: student/runs/bf16/{0}/results/candidates.csv".format(args.run_id))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
