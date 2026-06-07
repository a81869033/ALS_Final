#!/usr/bin/env python3
"""Per-output-bit run-cover hybrids for FP16 log/log2."""

import argparse
import csv
import json
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
from student.generators.fp16_semantic_search import (
    BEST_FIELDNAMES,
    CASE_LABELS,
    RESULT_FIELDNAMES,
    add_reference_columns,
    const_word,
    load_reference,
    metadata_row,
    rel_path,
    render_sign_exp_mant_case,
    verify_outputs,
    write_csv,
    write_text,
)


MANT_BITS = 10
MANT_SIZE = 1 << MANT_BITS
SIGN_EXP_BITS = 6


VARIANTS = [
    ("formula_sign", [], 0),
    ("formula_sign_bits", [], 0),
    ("casez_sign", [], 0),
    ("bitrun_sign_t8", [15], 8),
    ("bitrun_bit14_t8", [14], 8),
    ("bitrun_bit13_t8", [13], 8),
    ("bitrun_bit12_t8", [12], 8),
    ("bitrun_bit11_t8", [11], 8),
    ("bitrun_bit10_t16", [10], 16),
    ("bitrun_bit9_t32", [9], 32),
    ("bitrun_bit8_t64", [8], 64),
    ("bitrun_exp_t16", [14, 13, 12, 11, 10], 16),
    ("bitrun_high8_t64", list(range(15, 7, -1)), 64),
    ("bitrun_high9_t128", list(range(15, 6, -1)), 128),
    ("bitrun_high10_t128", list(range(15, 5, -1)), 128),
    ("bitrun_high11_t256", list(range(15, 4, -1)), 256),
    ("bitrun_high12_t512", list(range(15, 3, -1)), 512),
    ("bitrun_bits11_12_t8", [11, 12], 8),
    ("bitrun_bits11_9_t32", [11, 9], 32),
    ("bitrun_bits12_9_t32", [12, 9], 32),
    ("bitrun_bits11_12_9_t32", [11, 12, 9], 32),
    ("casez_sign_bit14_t8", [14], 8),
    ("casez_sign_bit11_t8", [11], 8),
    ("casez_sign_bit12_t8", [12], 8),
    ("casez_sign_bit9_t32", [9], 32),
    ("casez_sign_bits11_12_t8", [11, 12], 8),
    ("casez_sign_bits11_9_t32", [11, 9], 32),
    ("casez_sign_bits12_9_t32", [12, 9], 32),
    ("casez_sign_bits11_12_9_t32", [11, 12, 9], 32),
    ("bitrun_bit7_t64", [7], 64),
    ("bitrun_bits10_11_t16", [10, 11], 16),
    ("bitrun_bits10_12_t16", [10, 12], 16),
    ("bitrun_bits10_11_12_t16", [10, 11, 12], 16),
    ("bitrun_bits9_10_12_t32", [9, 10, 12], 32),
    ("bitrun_bits9_10_11_12_t32", [9, 10, 11, 12], 32),
    ("bitrun_bits11_12_7_t64", [11, 12, 7], 64),
    ("casez_sign_bits10_11_t16", [10, 11], 16),
    ("casez_sign_bits10_12_t16", [10, 12], 16),
    ("casez_sign_bits10_11_12_t16", [10, 11, 12], 16),
    ("casez_sign_bits9_10_11_12_t32", [9, 10, 11, 12], 32),
    ("casez_sign_bits11_12_7_t64", [11, 12, 7], 64),
    ("manual_log2_bits11_12", [], 0),
    ("manual_log2_sign_bits11_12", [], 0),
    ("casez_sign_bits14_11_12_t8", [14, 11, 12], 8),
    ("casez_sign_bits13_11_12_t8", [13, 11, 12], 8),
    ("casez_sign_bits11_12_8_t64", [11, 12, 8], 64),
    ("casez_sign_bits14_13_11_12_t8", [14, 13, 11, 12], 8),
    ("bitvec_sign_bit14_t16", [15, 14], 16),
    ("bitvec_sign_bits11_12_t32", [15, 12, 11], 32),
    ("bitvec_bits11_12_t32", [12, 11], 32),
    ("bitvec_bits12_9_t32", [12, 9], 32),
    ("bitvec_bits12_10_t16", [12, 10], 16),
    ("bitvec_bits12_9_10_t32", [12, 10, 9], 32),
    ("bitvec_sign_bits12_9_t32", [15, 12, 9], 32),
    ("bitvec_bits14_12_9_t32", [14, 12, 9], 32),
    ("bitvec_bits13_12_9_t32", [13, 12, 9], 32),
    ("bitvec_bits14_13_12_9_t32", [14, 13, 12, 9], 32),
    ("manual_ex225_bitvec12_9_bit14", [], 0),
    ("manual_ex225_bitvec12_9_bit14_logic", [], 0),
    ("manual_ex225_bitvec12_9_bit14_t16", [], 0),
    ("manual_ex225_bitvec14_12_9_bit13", [], 0),
    ("manual_ex225_bitvec14_9_bit12", [], 0),
    ("packed_manual_ex225_bitvec12_9_bit14", [], 0),
    ("sparse_manual_ex225_bitvec12_9_bit14", [], 0),
    ("manual_ex223_sign_bit14", [], 0),
    ("manual_ex224_sign_bits11_12_bit14", [], 0),
    ("attr_casez_sign", [], 0),
    ("attr_casez_sign_bits11_12", [], 0),
    ("special_casez_sign", [], 0),
    ("special_casez_sign_bits11_12", [], 0),
]


def bit_runs(values):
    runs = []
    start = 0
    current = values[0]
    for index, value in enumerate(values[1:], 1):
        if value != current:
            runs.append((start, index - 1, current))
            start = index
            current = value
    runs.append((start, len(values) - 1, current))
    return runs


def emit_tree(lines, runs, indent, target):
    if len(runs) == 1:
        lines.append("{0}{1} = 1'b{2};".format(indent, target, runs[0][2]))
        return
    mid = len(runs) // 2
    left = runs[:mid]
    right = runs[mid:]
    boundary = left[-1][1]
    lines.append("{0}if (mant <= {1}) begin".format(indent, const_word(MANT_BITS, boundary)))
    emit_tree(lines, left, indent + "  ", target)
    lines.append("{0}end else begin".format(indent))
    emit_tree(lines, right, indent + "  ", target)
    lines.append("{0}end".format(indent))


def render_bit_cover(outputs, module, bit, threshold):
    lines = [
        "module {0}(in, out_bit);".format(module),
        "  input [15:0] in;",
        "  output out_bit;",
        "  wire [5:0] sign_exp = in[15:10];",
        "  wire [9:0] mant = in[9:0];",
        "  reg bit_r;",
        "  always @* begin",
        "    case (sign_exp)",
    ]
    range_groups = 0
    table_groups = 0
    range_items = 0
    table_items = 0
    const_groups = 0
    for sign_exp in range(64):
        values = [((outputs[(sign_exp << MANT_BITS) | mant] >> bit) & 1) for mant in range(MANT_SIZE)]
        runs = bit_runs(values)
        lines.append("      {0}: begin".format(const_word(SIGN_EXP_BITS, sign_exp)))
        if len(runs) == 1:
            const_groups += 1
            lines.append("        bit_r = 1'b{0};".format(runs[0][2]))
        elif len(runs) <= threshold:
            range_groups += 1
            range_items += len(runs)
            emit_tree(lines, runs, "        ", "bit_r")
        else:
            table_groups += 1
            lines.append("        case (mant)")
            for mant, value in enumerate(values):
                lines.append("          {0}: bit_r = 1'b{1};".format(const_word(MANT_BITS, mant), value))
                table_items += 1
            lines.extend(["          default: bit_r = 1'b0;", "        endcase"])
        lines.append("      end")
    lines.extend(["      default: bit_r = 1'b0;", "    endcase", "  end", "  assign out_bit = bit_r;", "endmodule", ""])
    meta = "bit={0}; threshold={1}; const_groups={2}; range_groups={3}; table_groups={4}; range_items={5}; table_items={6}".format(
        bit,
        threshold,
        const_groups,
        range_groups,
        table_groups,
        range_items,
        table_items,
    )
    return "\n".join(lines), meta


def render_bitvec_cover(outputs, module, bits, threshold):
    ordered_bits = sorted(bits, reverse=True)
    width = len(ordered_bits)
    lines = [
        "module {0}(in, out_bits);".format(module),
        "  input [15:0] in;",
        "  output [{0}:0] out_bits;".format(width - 1),
        "  wire [5:0] sign_exp = in[15:10];",
        "  wire [9:0] mant = in[9:0];",
        "  reg [{0}:0] bits_r;".format(width - 1),
        "  always @* begin",
        "    case (sign_exp)",
    ]
    range_groups = 0
    table_groups = 0
    range_items = 0
    table_items = 0
    const_groups = 0

    def pack(value):
        packed = 0
        for bit in ordered_bits:
            packed = (packed << 1) | ((value >> bit) & 1)
        return packed

    def emit_vec_tree(vec_lines, runs, indent):
        if len(runs) == 1:
            vec_lines.append("{0}bits_r = {1};".format(indent, const_word(width, runs[0][2])))
            return
        mid = len(runs) // 2
        left = runs[:mid]
        right = runs[mid:]
        boundary = left[-1][1]
        vec_lines.append("{0}if (mant <= {1}) begin".format(indent, const_word(MANT_BITS, boundary)))
        emit_vec_tree(vec_lines, left, indent + "  ")
        vec_lines.append("{0}end else begin".format(indent))
        emit_vec_tree(vec_lines, right, indent + "  ")
        vec_lines.append("{0}end".format(indent))

    for sign_exp in range(64):
        values = [pack(outputs[(sign_exp << MANT_BITS) | mant]) for mant in range(MANT_SIZE)]
        runs = bit_runs(values)
        lines.append("      {0}: begin".format(const_word(SIGN_EXP_BITS, sign_exp)))
        if len(runs) == 1:
            const_groups += 1
            lines.append("        bits_r = {0};".format(const_word(width, runs[0][2])))
        elif len(runs) <= threshold:
            range_groups += 1
            range_items += len(runs)
            emit_vec_tree(lines, runs, "        ")
        else:
            table_groups += 1
            lines.append("        case (mant)")
            for mant, value in enumerate(values):
                lines.append("          {0}: bits_r = {1};".format(const_word(MANT_BITS, mant), const_word(width, value)))
                table_items += 1
            lines.extend(["          default: bits_r = {0};".format(const_word(width, 0)), "        endcase"])
        lines.append("      end")
    lines.extend(["      default: bits_r = {0};".format(const_word(width, 0)), "    endcase", "  end", "  assign out_bits = bits_r;", "endmodule", ""])
    meta = "bits={0}; threshold={1}; const_groups={2}; range_groups={3}; table_groups={4}; range_items={5}; table_items={6}".format(
        ",".join(str(bit) for bit in ordered_bits),
        threshold,
        const_groups,
        range_groups,
        table_groups,
        range_items,
        table_items,
    )
    return "\n".join(lines), meta, ordered_bits


def render_hybrid(case, outputs, module, bits, threshold):
    table_module = module + "_table"
    table_v, table_items, _ = render_sign_exp_mant_case(outputs, table_module)
    lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [15:0] out;",
        "  wire [15:0] table_out;",
        "  {0} u_table(.in(in), .out(table_out));".format(table_module),
    ]
    metas = []
    bit_modules = []
    selected = set(bits)
    for bit in sorted(selected, reverse=True):
        bit_module = "{0}_bit{1}".format(module, bit)
        bit_wire = "bit{0}_out".format(bit)
        bit_v, meta = render_bit_cover(outputs, bit_module, bit, threshold)
        metas.append(meta)
        bit_modules.append(bit_v)
        lines.append("  wire {0};".format(bit_wire))
        lines.append("  {0} u_bit{1}(.in(in), .out_bit({2}));".format(bit_module, bit, bit_wire))
    for bit in range(16):
        if bit in selected:
            lines.append("  assign out[{0}] = bit{0}_out;".format(bit))
        else:
            lines.append("  assign out[{0}] = table_out[{0}];".format(bit))
    lines.extend(["endmodule", "", table_v])
    lines.extend(bit_modules)

    def model(index):
        return outputs[index]

    items = "bits={0}; threshold={1}; table_items={2}; {3}".format(
        ",".join(str(bit) for bit in sorted(selected, reverse=True)),
        threshold,
        table_items,
        " | ".join(metas),
    )
    return "\n".join(lines), items, model


def render_bitvec_hybrid(outputs, module, bits, threshold):
    table_module = module + "_table"
    table_v, table_items, _ = render_sign_exp_mant_case(outputs, table_module)
    vec_module = module + "_bitvec"
    vec_v, meta, ordered_bits = render_bitvec_cover(outputs, vec_module, bits, threshold)
    lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [15:0] out;",
        "  wire [15:0] table_out;",
        "  wire [{0}:0] vec_bits;".format(len(ordered_bits) - 1),
        "  {0} u_table(.in(in), .out(table_out));".format(table_module),
        "  {0} u_bitvec(.in(in), .out_bits(vec_bits));".format(vec_module),
    ]
    bit_to_index = {bit: index for index, bit in enumerate(reversed(ordered_bits))}
    selected = set(ordered_bits)
    for bit in range(16):
        if bit in selected:
            lines.append("  assign out[{0}] = vec_bits[{1}];".format(bit, bit_to_index[bit]))
        else:
            lines.append("  assign out[{0}] = table_out[{0}];".format(bit))
    lines.extend(["endmodule", "", table_v, vec_v])

    def model(index):
        return outputs[index]

    items = "bitvec selected bits; table_items={0}; {1}".format(table_items, meta)
    return "\n".join(lines), items, model


def render_formula_sign_hybrid(outputs, module):
    table_module = module + "_table"
    table_v, table_items, _ = render_sign_exp_mant_case(outputs, table_module)
    lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [15:0] out;",
        "  wire [15:0] table_out;",
        "  wire sign = in[15];",
        "  wire [4:0] exp = in[14:10];",
        "  {0} u_table(.in(in), .out(table_out));".format(table_module),
        "  assign out[15] = (exp == 5'h00) | ((~sign) & (exp < 5'h0f));",
    ]
    for bit in range(15):
        lines.append("  assign out[{0}] = table_out[{0}];".format(bit))
    lines.extend(["endmodule", "", table_v])

    def model(index):
        sign = (index >> 15) & 1
        exp = (index >> 10) & 31
        formula = 1 if (exp == 0 or ((not sign) and exp < 15)) else 0
        value = outputs[index] & 0x7fff
        return value | (formula << 15)

    items = "formula_sign=(exp==0)||(!sign&&exp<15); table_items={0}".format(table_items)
    return "\n".join(lines), items, model


def render_formula_sign_bits_hybrid(outputs, module):
    table_module = module + "_table"
    table_v, table_items, _ = render_sign_exp_mant_case(outputs, table_module)
    lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [15:0] out;",
        "  wire [15:0] table_out;",
        "  wire sign = in[15];",
        "  wire [4:0] exp = in[14:10];",
        "  wire exp_zero = ~|exp;",
        "  wire exp_lo = ~exp[4] & ~(&exp[3:0]);",
        "  {0} u_table(.in(in), .out(table_out));".format(table_module),
        "  assign out[15] = exp_zero | ((~sign) & exp_lo);",
    ]
    for bit in range(15):
        lines.append("  assign out[{0}] = table_out[{0}];".format(bit))
    lines.extend(["endmodule", "", table_v])

    def model(index):
        sign = (index >> 15) & 1
        exp = (index >> 10) & 31
        formula = 1 if (exp == 0 or ((not sign) and exp < 15)) else 0
        value = outputs[index] & 0x7fff
        return value | (formula << 15)

    items = "formula_sign_bits=(~|exp)||(!sign&&!exp4&&!and_exp_lo4); table_items={0}".format(table_items)
    return "\n".join(lines), items, model


def render_casez_sign_hybrid(outputs, module):
    table_module = module + "_table"
    table_v, table_items, _ = render_sign_exp_mant_case(outputs, table_module)
    lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [15:0] out;",
        "  wire [15:0] table_out;",
        "  wire [5:0] sign_exp = in[15:10];",
        "  reg sign_out;",
        "  {0} u_table(.in(in), .out(table_out));".format(table_module),
        "  always @* begin",
        "    casez (sign_exp)",
        "      6'b?00000: sign_out = 1'b1;",
        "      6'b000001: sign_out = 1'b1;",
        "      6'b00001?: sign_out = 1'b1;",
        "      6'b0001??: sign_out = 1'b1;",
        "      6'b0010??: sign_out = 1'b1;",
        "      6'b00110?: sign_out = 1'b1;",
        "      6'b001110: sign_out = 1'b1;",
        "      default: sign_out = 1'b0;",
        "    endcase",
        "  end",
        "  assign out[15] = sign_out;",
    ]
    for bit in range(15):
        lines.append("  assign out[{0}] = table_out[{0}];".format(bit))
    lines.extend(["endmodule", "", table_v])

    def model(index):
        sign = (index >> 15) & 1
        exp = (index >> 10) & 31
        formula = 1 if (exp == 0 or ((not sign) and exp < 15)) else 0
        value = outputs[index] & 0x7fff
        return value | (formula << 15)

    items = "casez_sign=exp0_or_positive_exp1_to14; table_items={0}".format(table_items)
    return "\n".join(lines), items, model


def render_casez_sign_plus_hybrid(outputs, module, bits, threshold):
    table_module = module + "_table"
    table_v, table_items, _ = render_sign_exp_mant_case(outputs, table_module)
    lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [15:0] out;",
        "  wire [15:0] table_out;",
        "  wire [5:0] sign_exp = in[15:10];",
        "  reg sign_out;",
        "  {0} u_table(.in(in), .out(table_out));".format(table_module),
        "  always @* begin",
        "    casez (sign_exp)",
        "      6'b?00000: sign_out = 1'b1;",
        "      6'b000001: sign_out = 1'b1;",
        "      6'b00001?: sign_out = 1'b1;",
        "      6'b0001??: sign_out = 1'b1;",
        "      6'b0010??: sign_out = 1'b1;",
        "      6'b00110?: sign_out = 1'b1;",
        "      6'b001110: sign_out = 1'b1;",
        "      default: sign_out = 1'b0;",
        "    endcase",
        "  end",
    ]
    metas = ["casez_sign=exp0_or_positive_exp1_to14"]
    bit_modules = []
    selected = set(bits)
    for bit in sorted(selected, reverse=True):
        bit_module = "{0}_bit{1}".format(module, bit)
        bit_wire = "bit{0}_out".format(bit)
        bit_v, meta = render_bit_cover(outputs, bit_module, bit, threshold)
        metas.append(meta)
        bit_modules.append(bit_v)
        lines.append("  wire {0};".format(bit_wire))
        lines.append("  {0} u_bit{1}(.in(in), .out_bit({2}));".format(bit_module, bit, bit_wire))
    lines.append("  assign out[15] = sign_out;")
    for bit in range(15):
        if bit in selected:
            lines.append("  assign out[{0}] = bit{0}_out;".format(bit))
        else:
            lines.append("  assign out[{0}] = table_out[{0}];".format(bit))
    lines.extend(["endmodule", "", table_v])
    lines.extend(bit_modules)

    def model(index):
        sign = (index >> 15) & 1
        exp = (index >> 10) & 31
        sign_formula = 1 if (exp == 0 or ((not sign) and exp < 15)) else 0
        value = outputs[index]
        value = (value & 0x7fff) | (sign_formula << 15)
        return value

    items = "bits={0}; threshold={1}; table_items={2}; {3}".format(
        ",".join(str(bit) for bit in sorted(selected, reverse=True)),
        threshold,
        table_items,
        " | ".join(metas),
    )
    return "\n".join(lines), items, model


def ex225_manual_bit(bit, sign_exp, mant):
    if bit == 14:
        return int(
            sign_exp <= 0x07
            or sign_exp >= 0x16
            or (sign_exp == 0x08 and mant <= 288)
            or (sign_exp == 0x15 and mant >= 575)
        )
    if bit == 13:
        return int(
            sign_exp >= 0x20
            or sign_exp in {0x00, 0x1F}
            or 0x09 <= sign_exp <= 0x0D
            or 0x10 <= sign_exp <= 0x14
            or (sign_exp == 0x08 and mant >= 289)
            or (sign_exp == 0x0E and mant <= 987)
            or (sign_exp == 0x0F and mant >= 19)
            or (sign_exp == 0x15 and mant <= 574)
        )
    if bit == 12:
        return int(
            sign_exp >= 0x20
            or sign_exp in {0x00, 0x1F}
            or 0x09 <= sign_exp <= 0x0D
            or 0x10 <= sign_exp <= 0x14
            or (sign_exp == 0x08 and mant >= 289)
            or (sign_exp == 0x0E and (mant <= 511 or 988 <= mant <= 1021))
            or (sign_exp == 0x0F and (2 <= mant <= 18 or mant >= 342))
            or (sign_exp == 0x15 and mant <= 574)
        )
    raise ValueError("unsupported manual bit")


def ex225_manual_bit_expr(bit):
    if bit == 14:
        return (
            "(sign_exp <= 6'h07) || (sign_exp >= 6'h16) || "
            "((sign_exp == 6'h08) && (mant <= 10'd288)) || "
            "((sign_exp == 6'h15) && (mant >= 10'd575))"
        )
    if bit == 13:
        return (
            "sign_exp[5] || (sign_exp == 6'h00) || (sign_exp == 6'h1f) || "
            "((sign_exp >= 6'h09) && (sign_exp <= 6'h0d)) || "
            "((sign_exp >= 6'h10) && (sign_exp <= 6'h14)) || "
            "((sign_exp == 6'h08) && (mant >= 10'd289)) || "
            "((sign_exp == 6'h0e) && (mant <= 10'd987)) || "
            "((sign_exp == 6'h0f) && (mant >= 10'd19)) || "
            "((sign_exp == 6'h15) && (mant <= 10'd574))"
        )
    if bit == 12:
        return (
            "sign_exp[5] || (sign_exp == 6'h00) || (sign_exp == 6'h1f) || "
            "((sign_exp >= 6'h09) && (sign_exp <= 6'h0d)) || "
            "((sign_exp >= 6'h10) && (sign_exp <= 6'h14)) || "
            "((sign_exp == 6'h08) && (mant >= 10'd289)) || "
            "((sign_exp == 6'h0e) && ((mant <= 10'd511) || ((mant >= 10'd988) && (mant <= 10'd1021)))) || "
            "((sign_exp == 6'h0f) && (((mant >= 10'd2) && (mant <= 10'd18)) || (mant >= 10'd342))) || "
            "((sign_exp == 6'h15) && (mant <= 10'd574))"
        )
    raise ValueError("unsupported manual bit")


def render_ex225_manual_bitvec_hybrid(outputs, module, vec_bits, manual_bits, threshold=32, manual_exprs=None):
    table_module = module + "_table"
    table_v, table_items, _ = render_sign_exp_mant_case(outputs, table_module)
    vec_module = module + "_bitvec"
    vec_v, meta, ordered_bits = render_bitvec_cover(outputs, vec_module, vec_bits, threshold)
    lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [15:0] out;",
        "  wire [15:0] table_out;",
        "  wire [5:0] sign_exp = in[15:10];",
        "  wire [9:0] mant = in[9:0];",
        "  wire [{0}:0] vec_bits;".format(len(ordered_bits) - 1),
        "  {0} u_table(.in(in), .out(table_out));".format(table_module),
        "  {0} u_bitvec(.in(in), .out_bits(vec_bits));".format(vec_module),
    ]
    for bit in manual_bits:
        expr = ex225_manual_bit_expr(bit)
        if manual_exprs and bit in manual_exprs:
            expr = manual_exprs[bit]
        lines.append("  wire bit{0}_manual = {1};".format(bit, expr))
    bit_to_index = {bit: index for index, bit in enumerate(reversed(ordered_bits))}
    selected = set(ordered_bits) | set(manual_bits)
    for bit in range(16):
        if bit in manual_bits:
            lines.append("  assign out[{0}] = bit{0}_manual;".format(bit))
        elif bit in selected:
            lines.append("  assign out[{0}] = vec_bits[{1}];".format(bit, bit_to_index[bit]))
        else:
            lines.append("  assign out[{0}] = table_out[{0}];".format(bit))
    lines.extend(["endmodule", "", table_v, vec_v])

    def model(index):
        sign_exp = index >> MANT_BITS
        mant = index & (MANT_SIZE - 1)
        value = outputs[index]
        for bit in manual_bits:
            mask = 1 << bit
            value = (value & ~mask) | (ex225_manual_bit(bit, sign_exp, mant) << bit)
        return value

    items = "manual_bits={0}; bitvec_bits={1}; table_items={2}; {3}".format(
        ",".join(str(bit) for bit in manual_bits),
        ",".join(str(bit) for bit in ordered_bits),
        table_items,
        meta,
    )
    return "\n".join(lines), items, model


def render_packed_sign_exp_mant_case(outputs, module, keep_bits):
    ordered = sorted(keep_bits, reverse=True)
    width = len(ordered)

    def pack(value):
        packed = 0
        for bit in ordered:
            packed = (packed << 1) | ((value >> bit) & 1)
        return packed

    lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [{0}:0] out;".format(width - 1),
        "  wire [5:0] sign_exp = in[15:10];",
        "  wire [9:0] mant = in[9:0];",
        "  reg [{0}:0] out_r;".format(width - 1),
        "  always @* begin",
        "    case (sign_exp)",
    ]
    items = 0
    for sign_exp in range(1 << SIGN_EXP_BITS):
        base = sign_exp << MANT_BITS
        values = [pack(outputs[base | mant]) for mant in range(MANT_SIZE)]
        if len(set(values)) == 1:
            lines.append("      {0}: out_r = {1};".format(const_word(SIGN_EXP_BITS, sign_exp), const_word(width, values[0])))
            items += 1
            continue
        lines.append("      {0}: begin".format(const_word(SIGN_EXP_BITS, sign_exp)))
        lines.append("        case (mant)")
        for mant, value in enumerate(values):
            lines.append("          {0}: out_r = {1};".format(const_word(MANT_BITS, mant), const_word(width, value)))
            items += 1
        lines.extend(["          default: out_r = {0};".format(const_word(width, 0)), "        endcase", "      end"])
    lines.extend(["      default: out_r = {0};".format(const_word(width, 0)), "    endcase", "  end", "  assign out = out_r;", "endmodule", ""])
    bit_to_index = {bit: width - 1 - index for index, bit in enumerate(ordered)}
    return "\n".join(lines), str(items), bit_to_index


def render_ex225_packed_manual_bitvec_hybrid(outputs, module, vec_bits, manual_bits, threshold=32):
    selected = set(vec_bits) | set(manual_bits)
    keep_bits = [bit for bit in range(16) if bit not in selected]
    table_module = module + "_packed_table"
    table_v, table_items, table_index = render_packed_sign_exp_mant_case(outputs, table_module, keep_bits)
    vec_module = module + "_bitvec"
    vec_v, meta, ordered_bits = render_bitvec_cover(outputs, vec_module, vec_bits, threshold)
    lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [15:0] out;",
        "  wire [{0}:0] table_bits;".format(len(keep_bits) - 1),
        "  wire [5:0] sign_exp = in[15:10];",
        "  wire [9:0] mant = in[9:0];",
        "  wire [{0}:0] vec_bits;".format(len(ordered_bits) - 1),
        "  {0} u_table(.in(in), .out(table_bits));".format(table_module),
        "  {0} u_bitvec(.in(in), .out_bits(vec_bits));".format(vec_module),
    ]
    for bit in manual_bits:
        lines.append("  wire bit{0}_manual = {1};".format(bit, ex225_manual_bit_expr(bit)))
    vec_index = {bit: index for index, bit in enumerate(reversed(ordered_bits))}
    for bit in range(16):
        if bit in manual_bits:
            lines.append("  assign out[{0}] = bit{0}_manual;".format(bit))
        elif bit in vec_index:
            lines.append("  assign out[{0}] = vec_bits[{1}];".format(bit, vec_index[bit]))
        else:
            lines.append("  assign out[{0}] = table_bits[{1}];".format(bit, table_index[bit]))
    lines.extend(["endmodule", "", table_v, vec_v])

    def model(index):
        sign_exp = index >> MANT_BITS
        mant = index & (MANT_SIZE - 1)
        value = outputs[index]
        for bit in manual_bits:
            mask = 1 << bit
            value = (value & ~mask) | (ex225_manual_bit(bit, sign_exp, mant) << bit)
        return value

    items = "packed_table_bits={0}; manual_bits={1}; bitvec_bits={2}; table_items={3}; {4}".format(
        ",".join(str(bit) for bit in sorted(keep_bits, reverse=True)),
        ",".join(str(bit) for bit in manual_bits),
        ",".join(str(bit) for bit in ordered_bits),
        table_items,
        meta,
    )
    return "\n".join(lines), items, model


def render_ex225_sparse_bitvec12_9_cover(outputs, module):
    ordered_bits = [12, 9]

    def pack(value):
        packed = 0
        for bit in ordered_bits:
            packed = (packed << 1) | ((value >> bit) & 1)
        return packed

    lines = [
        "module {0}(in, out_bits);".format(module),
        "  input [15:0] in;",
        "  output [1:0] out_bits;",
        "  wire [5:0] sign_exp = in[15:10];",
        "  wire [9:0] mant = in[9:0];",
        "  reg [1:0] bits_r;",
        "  always @* begin",
        "    bits_r = 2'h3;",
        "    case (sign_exp)",
        "      6'h00, 6'h20: bits_r = 2'h2;",
        "      6'h02, 6'h03, 6'h04, 6'h19, 6'h1a, 6'h1b: bits_r = 2'h1;",
        "      6'h06, 6'h07, 6'h16, 6'h17, 6'h1d, 6'h1e: bits_r = 2'h0;",
    ]
    range_items = 0
    range_groups = 0
    for sign_exp in range(64):
        values = [pack(outputs[(sign_exp << MANT_BITS) | mant]) for mant in range(MANT_SIZE)]
        runs = bit_runs(values)
        if len(runs) == 1:
            continue
        range_groups += 1
        range_items += len(runs)
        lines.append("      {0}: begin".format(const_word(SIGN_EXP_BITS, sign_exp)))
        emit_vec_lines = []

        def emit_sparse_tree(runs_part, indent):
            if len(runs_part) == 1:
                emit_vec_lines.append("{0}bits_r = {1};".format(indent, const_word(2, runs_part[0][2])))
                return
            mid = len(runs_part) // 2
            left = runs_part[:mid]
            right = runs_part[mid:]
            boundary = left[-1][1]
            emit_vec_lines.append("{0}if (mant <= {1}) begin".format(indent, const_word(MANT_BITS, boundary)))
            emit_sparse_tree(left, indent + "  ")
            emit_vec_lines.append("{0}end else begin".format(indent))
            emit_sparse_tree(right, indent + "  ")
            emit_vec_lines.append("{0}end".format(indent))

        emit_sparse_tree(runs, "        ")
        lines.extend(emit_vec_lines)
        lines.append("      end")
    lines.extend(["      default: begin end", "    endcase", "  end", "  assign out_bits = bits_r;", "endmodule", ""])
    meta = "sparse bitvec12_9 default=3; range_groups={0}; range_items={1}".format(range_groups, range_items)
    return "\n".join(lines), meta


def render_ex225_sparse_manual_bitvec_hybrid(outputs, module):
    table_module = module + "_table"
    table_v, table_items, _ = render_sign_exp_mant_case(outputs, table_module)
    vec_module = module + "_sparse_bitvec"
    vec_v, meta = render_ex225_sparse_bitvec12_9_cover(outputs, vec_module)
    lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [15:0] out;",
        "  wire [15:0] table_out;",
        "  wire [5:0] sign_exp = in[15:10];",
        "  wire [9:0] mant = in[9:0];",
        "  wire [1:0] vec_bits;",
        "  {0} u_table(.in(in), .out(table_out));".format(table_module),
        "  {0} u_bitvec(.in(in), .out_bits(vec_bits));".format(vec_module),
        "  wire bit14_manual = {0};".format(ex225_manual_bit_expr(14)),
    ]
    for bit in range(16):
        if bit == 14:
            lines.append("  assign out[14] = bit14_manual;")
        elif bit == 12:
            lines.append("  assign out[12] = vec_bits[1];")
        elif bit == 9:
            lines.append("  assign out[9] = vec_bits[0];")
        else:
            lines.append("  assign out[{0}] = table_out[{0}];".format(bit))
    lines.extend(["endmodule", "", table_v, vec_v])

    def model(index):
        sign_exp = index >> MANT_BITS
        mant = index & (MANT_SIZE - 1)
        value = outputs[index]
        value = (value & ~(1 << 14)) | (ex225_manual_bit(14, sign_exp, mant) << 14)
        return value

    items = "sparse bitvec12_9 plus manual bit14; table_items={0}; {1}".format(table_items, meta)
    return "\n".join(lines), items, model


def render_ex224_manual_log2_bits_hybrid(outputs, module, override_sign):
    table_module = module + "_table"
    table_v, table_items, _ = render_sign_exp_mant_case(outputs, table_module)
    lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [15:0] out;",
        "  wire [15:0] table_out;",
        "  wire [5:0] se = in[15:10];",
        "  wire sign = in[15];",
        "  wire [9:0] mant = in[9:0];",
        "  wire se0 = (se == 6'd0);",
        "  wire se7 = (se == 6'd7);",
        "  wire se13 = (se == 6'd13);",
        "  wire se14 = (se == 6'd14);",
        "  wire se15 = (se == 6'd15);",
        "  wire se16 = (se == 6'd16);",
        "  wire se22 = (se == 6'd22);",
        "  wire se31 = (se == 6'd31);",
        "  wire se_le6 = (se <= 6'd6);",
        "  wire se_23_31 = (se >= 6'd23) & (se <= 6'd31);",
        "  wire bit12_manual = sign | se0 | se16 | se31 |",
        "      (se13 & (mant >= 10'd1)) |",
        "      (se14 & ((mant <= 10'd854) | (mant >= 10'd1013))) |",
        "      (se15 & (((mant >= 10'd1) & (mant <= 10'd5)) | (mant >= 10'd93)));",
        "  wire bit11_manual = sign | se_le6 | se16 | se_23_31 |",
        "      (se7 & (mant <= 10'd1)) |",
        "      (se13 & (mant >= 10'd1)) |",
        "      (se14 & ((mant <= 10'd424) | ((mant >= 10'd855) & (mant <= 10'd980)) | ((mant >= 10'd1013) & (mant <= 10'd1021)))) |",
        "      (se15 & (((mant >= 10'd2) & (mant <= 10'd5)) | ((mant >= 10'd23) & (mant <= 10'd92)) | (mant >= 10'd425))) |",
        "      (se22 & (mant >= 10'd1022));",
        "  {0} u_table(.in(in), .out(table_out));".format(table_module),
    ]
    if override_sign:
        lines.extend([
            "  reg sign_out;",
            "  always @* begin",
            "    casez (se)",
            "      6'b?00000: sign_out = 1'b1;",
            "      6'b000001: sign_out = 1'b1;",
            "      6'b00001?: sign_out = 1'b1;",
            "      6'b0001??: sign_out = 1'b1;",
            "      6'b0010??: sign_out = 1'b1;",
            "      6'b00110?: sign_out = 1'b1;",
            "      6'b001110: sign_out = 1'b1;",
            "      default: sign_out = 1'b0;",
            "    endcase",
            "  end",
            "  assign out[15] = sign_out;",
        ])
    else:
        lines.append("  assign out[15] = table_out[15];")
    for bit in range(15):
        if bit == 12:
            lines.append("  assign out[12] = bit12_manual;")
        elif bit == 11:
            lines.append("  assign out[11] = bit11_manual;")
        else:
            lines.append("  assign out[{0}] = table_out[{0}];".format(bit))
    lines.extend(["endmodule", "", table_v])

    def model(index):
        value = outputs[index]
        if override_sign:
            sign_bit = (index >> 15) & 1
            exp = (index >> 10) & 31
            sign_formula = 1 if (exp == 0 or ((not sign_bit) and exp < 15)) else 0
            value = (value & 0x7fff) | (sign_formula << 15)
        return value

    sign_note = "casez_sign;" if override_sign else "table_sign;"
    items = "{0} manual_log2_bits11_12_threshold_expr; table_items={1}".format(sign_note, table_items)
    return "\n".join(lines), items, model


def render_ex223_manual_sign_bit14_hybrid(outputs, module):
    table_module = module + "_table"
    table_v, table_items, _ = render_sign_exp_mant_case(outputs, table_module)
    lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [15:0] out;",
        "  wire [15:0] table_out;",
        "  wire sign = in[15];",
        "  wire [4:0] exp = in[14:10];",
        "  wire [9:0] mant = in[9:0];",
        "  wire [5:0] sign_exp = in[15:10];",
        "  reg sign_out;",
        "  wire bit14_manual = sign | (exp <= 5'd11) | (exp >= 5'd18) |",
        "      ((exp == 5'd12) & (mant <= 10'd85)) |",
        "      ((exp == 5'd17) & (mant >= 10'd867));",
        "  {0} u_table(.in(in), .out(table_out));".format(table_module),
        "  always @* begin",
        "    casez (sign_exp)",
        "      6'b?00000: sign_out = 1'b1;",
        "      6'b000001: sign_out = 1'b1;",
        "      6'b00001?: sign_out = 1'b1;",
        "      6'b0001??: sign_out = 1'b1;",
        "      6'b0010??: sign_out = 1'b1;",
        "      6'b00110?: sign_out = 1'b1;",
        "      6'b001110: sign_out = 1'b1;",
        "      default: sign_out = 1'b0;",
        "    endcase",
        "  end",
        "  assign out[15] = sign_out;",
        "  assign out[14] = bit14_manual;",
    ]
    for bit in range(14):
        lines.append("  assign out[{0}] = table_out[{0}];".format(bit))
    lines.extend(["endmodule", "", table_v])

    def model(index):
        sign = (index >> 15) & 1
        exp = (index >> 10) & 31
        mant = index & 1023
        sign_formula = 1 if (exp == 0 or ((not sign) and exp < 15)) else 0
        bit14 = 1 if (
            sign
            or exp <= 11
            or exp >= 18
            or (exp == 12 and mant <= 85)
            or (exp == 17 and mant >= 867)
        ) else 0
        value = outputs[index] & 0x3fff
        return value | (bit14 << 14) | (sign_formula << 15)

    items = "manual ex223 sign casez plus bit14 threshold formula; table_items={0}".format(table_items)
    return "\n".join(lines), items, model


def render_ex224_manual_sign_bits11_12_bit14_hybrid(outputs, module):
    table_module = module + "_table"
    table_v, table_items, _ = render_sign_exp_mant_case(outputs, table_module)
    bit12_v, bit12_meta = render_bit_cover(outputs, module + "_bit12", 12, 8)
    bit11_v, bit11_meta = render_bit_cover(outputs, module + "_bit11", 11, 8)
    lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [15:0] out;",
        "  wire [15:0] table_out;",
        "  wire sign = in[15];",
        "  wire [4:0] exp = in[14:10];",
        "  wire [9:0] mant = in[9:0];",
        "  wire [5:0] sign_exp = in[15:10];",
        "  reg sign_out;",
        "  wire bit12_out;",
        "  wire bit11_out;",
        "  wire bit14_manual = sign | (exp <= 5'd12) | (exp >= 5'd17) | ((exp == 5'd13) & (mant == 10'd0));",
        "  {0} u_table(.in(in), .out(table_out));".format(table_module),
        "  {0}_bit12 u_bit12(.in(in), .out_bit(bit12_out));".format(module),
        "  {0}_bit11 u_bit11(.in(in), .out_bit(bit11_out));".format(module),
        "  always @* begin",
        "    casez (sign_exp)",
        "      6'b?00000: sign_out = 1'b1;",
        "      6'b000001: sign_out = 1'b1;",
        "      6'b00001?: sign_out = 1'b1;",
        "      6'b0001??: sign_out = 1'b1;",
        "      6'b0010??: sign_out = 1'b1;",
        "      6'b00110?: sign_out = 1'b1;",
        "      6'b001110: sign_out = 1'b1;",
        "      default: sign_out = 1'b0;",
        "    endcase",
        "  end",
        "  assign out[15] = sign_out;",
        "  assign out[14] = bit14_manual;",
    ]
    for bit in range(14):
        if bit == 12:
            lines.append("  assign out[12] = bit12_out;")
        elif bit == 11:
            lines.append("  assign out[11] = bit11_out;")
        else:
            lines.append("  assign out[{0}] = table_out[{0}];".format(bit))
    lines.extend(["endmodule", "", table_v, bit12_v, bit11_v])

    def model(index):
        return outputs[index]

    items = "manual ex224 sign casez plus bit11/12 run-cover and bit14 formula; table_items={0}; {1}; {2}".format(
        table_items,
        bit12_meta,
        bit11_meta,
    )
    return "\n".join(lines), items, model


def apply_case_attrs(verilog):
    attr = "(* parallel_case, full_case *) "
    return verilog.replace("case (", attr + "case (").replace("casez (", attr + "casez (")


def render_attr_casez_hybrid(outputs, module, bits=None):
    if bits:
        verilog, items, model = render_casez_sign_plus_hybrid(outputs, module, bits, 8)
    else:
        verilog, items, model = render_casez_sign_hybrid(outputs, module)
    return apply_case_attrs(verilog), "{0}; source case attributes parallel_case full_case".format(items), model


def render_positive_normal_table(outputs, module):
    lines = [
        "module {0}(in, table_out);".format(module),
        "  input [15:0] in;",
        "  output reg [15:0] table_out;",
        "  wire sign = in[15];",
        "  wire [4:0] exp = in[14:10];",
        "  wire [9:0] mant = in[9:0];",
        "  always @* begin",
        "    if (exp == 5'd0) begin",
        "      table_out = 16'h{0:04x};".format(outputs[0]),
        "    end else if (sign) begin",
        "      table_out = 16'h{0:04x};".format(outputs[(1 << 15) | (1 << 10)]),
        "    end else if (exp == 5'd31) begin",
        "      table_out = (mant == 10'd0) ? 16'h{0:04x} : 16'h{1:04x};".format(
            outputs[31 << 10],
            outputs[(31 << 10) | 1],
        ),
        "    end else begin",
        "      case (exp)",
    ]
    items = 0
    for exp in range(1, 31):
        lines.append("        {0}: begin".format(const_word(5, exp)))
        lines.append("          case (mant)")
        for mant in range(MANT_SIZE):
            lines.append("            {0}: table_out = {1};".format(const_word(MANT_BITS, mant), const_word(16, outputs[(exp << MANT_BITS) | mant])))
            items += 1
        lines.extend(["            default: table_out = 16'h0000;", "          endcase", "        end"])
    lines.extend(
        [
            "        default: table_out = 16'h0000;",
            "      endcase",
            "    end",
            "  end",
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines), items


def render_special_casez_hybrid(outputs, module, bits=None):
    table_module = module + "_pos_table"
    table_v, table_items = render_positive_normal_table(outputs, table_module)
    lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [15:0] out;",
        "  wire [15:0] table_out;",
        "  wire [5:0] sign_exp = in[15:10];",
        "  reg sign_out;",
        "  {0} u_table(.in(in), .table_out(table_out));".format(table_module),
    ]
    metas = ["special shell positive-normal table_items={0}".format(table_items)]
    bit_modules = []
    selected = set(bits or [])
    for bit in sorted(selected, reverse=True):
        bit_module = "{0}_bit{1}".format(module, bit)
        bit_wire = "bit{0}_out".format(bit)
        bit_v, meta = render_bit_cover(outputs, bit_module, bit, 8)
        metas.append(meta)
        bit_modules.append(bit_v)
        lines.append("  wire {0};".format(bit_wire))
        lines.append("  {0} u_bit{1}(.in(in), .out_bit({2}));".format(bit_module, bit, bit_wire))
    lines.extend(
        [
            "  always @* begin",
            "    casez (sign_exp)",
            "      6'b?00000: sign_out = 1'b1;",
            "      6'b000001: sign_out = 1'b1;",
            "      6'b00001?: sign_out = 1'b1;",
            "      6'b0001??: sign_out = 1'b1;",
            "      6'b0010??: sign_out = 1'b1;",
            "      6'b00110?: sign_out = 1'b1;",
            "      6'b001110: sign_out = 1'b1;",
            "      default: sign_out = 1'b0;",
            "    endcase",
            "  end",
            "  assign out[15] = sign_out;",
        ]
    )
    for bit in range(15):
        if bit in selected:
            lines.append("  assign out[{0}] = bit{0}_out;".format(bit))
        else:
            lines.append("  assign out[{0}] = table_out[{0}];".format(bit))
    lines.extend(["endmodule", "", table_v])
    lines.extend(bit_modules)

    def model(index):
        sign = (index >> 15) & 1
        exp = (index >> 10) & 31
        sign_formula = 1 if (exp == 0 or ((not sign) and exp < 15)) else 0
        return (outputs[index] & 0x7fff) | (sign_formula << 15)

    return "\n".join(lines), "; ".join(metas), model


def empty_row(case, candidate_id, label, variant, verilog_path, aig_path):
    return {
        "case": case,
        "candidate_id": candidate_id,
        "hypothesis/function_guess": label,
        "variant": variant,
        "verilog_path": rel_path(verilog_path),
        "aig_path": rel_path(aig_path),
        "verified_truth": "0",
        "synthesized": "0",
        "equivalent": "0",
        "area": "",
        "delay": "",
        "adp": "",
        "reference_adp": "",
        "adp_ratio_to_reference": "",
        "within_1p5_reference": "",
        "beats_reference": "",
        "runtime_sec": "0.000",
        "items": "",
        "classification": "structural_exact",
        "notes": "",
    }


def run_case(args, case, refs):
    truth_path = args.benchmarks / "{0}.truth".format(case)
    table = TruthTable(truth_path)
    outputs = list(table.iter_outputs())
    label = CASE_LABELS[case]
    case_dir = args.work_dir / case
    rows = []
    manifest = {
        "case": case,
        "truth": rel_path(truth_path),
        "hypothesis/function_guess": label,
        "metadata": metadata_row(case, table, outputs),
        "variants": [],
    }
    variants = VARIANTS
    if args.variant_names:
        variants = [variant for variant in VARIANTS if variant[0] in args.variant_names]
    for variant, bits, threshold in variants:
        if case != "ex223" and variant.startswith("manual_ex223"):
            continue
        if case != "ex224" and variant.startswith("manual_ex224"):
            continue
        if case != "ex225" and variant.startswith("manual_ex225"):
            continue
        candidate_id = "{0}_{1}_{2}".format(case, label, variant)
        module = candidate_id
        verilog_path = case_dir / "verilog" / "{0}.v".format(candidate_id)
        aig_path = case_dir / "aigs" / "{0}.aig".format(candidate_id)
        script_path = case_dir / "logs" / "{0}.ys".format(candidate_id)
        log_path = case_dir / "logs" / "{0}.yosys.log".format(candidate_id)
        row = empty_row(case, candidate_id, label, variant, verilog_path, aig_path)
        start = time.time()
        try:
            if variant == "formula_sign":
                verilog, items, model = render_formula_sign_hybrid(outputs, module)
            elif variant == "formula_sign_bits":
                verilog, items, model = render_formula_sign_bits_hybrid(outputs, module)
            elif variant == "casez_sign":
                verilog, items, model = render_casez_sign_hybrid(outputs, module)
            elif variant.startswith("casez_sign_"):
                verilog, items, model = render_casez_sign_plus_hybrid(outputs, module, bits, threshold)
            elif variant == "manual_log2_bits11_12":
                verilog, items, model = render_ex224_manual_log2_bits_hybrid(outputs, module, False)
            elif variant == "manual_log2_sign_bits11_12":
                verilog, items, model = render_ex224_manual_log2_bits_hybrid(outputs, module, True)
            elif variant == "manual_ex225_bitvec12_9_bit14":
                verilog, items, model = render_ex225_manual_bitvec_hybrid(outputs, module, [12, 9], [14])
            elif variant == "manual_ex225_bitvec12_9_bit14_logic":
                bit14_logic = (
                    "sign_exp[5] || (!sign_exp[4] && !sign_exp[3]) || "
                    "(sign_exp[4] && (sign_exp[3] || (sign_exp[2] && sign_exp[1]))) || "
                    "((sign_exp[4:0] == 5'd8) && (mant <= 10'd288)) || "
                    "((sign_exp[4:0] == 5'd21) && (mant >= 10'd575))"
                )
                verilog, items, model = render_ex225_manual_bitvec_hybrid(
                    outputs, module, [12, 9], [14], manual_exprs={14: bit14_logic}
                )
            elif variant == "manual_ex225_bitvec12_9_bit14_t16":
                verilog, items, model = render_ex225_manual_bitvec_hybrid(outputs, module, [12, 9], [14], threshold=16)
            elif variant == "manual_ex225_bitvec14_12_9_bit13":
                verilog, items, model = render_ex225_manual_bitvec_hybrid(outputs, module, [14, 12, 9], [13])
            elif variant == "manual_ex225_bitvec14_9_bit12":
                verilog, items, model = render_ex225_manual_bitvec_hybrid(outputs, module, [14, 9], [12])
            elif variant == "packed_manual_ex225_bitvec12_9_bit14":
                verilog, items, model = render_ex225_packed_manual_bitvec_hybrid(outputs, module, [12, 9], [14])
            elif variant == "sparse_manual_ex225_bitvec12_9_bit14":
                verilog, items, model = render_ex225_sparse_manual_bitvec_hybrid(outputs, module)
            elif variant == "manual_ex223_sign_bit14":
                verilog, items, model = render_ex223_manual_sign_bit14_hybrid(outputs, module)
            elif variant == "manual_ex224_sign_bits11_12_bit14":
                verilog, items, model = render_ex224_manual_sign_bits11_12_bit14_hybrid(outputs, module)
            elif variant == "attr_casez_sign":
                verilog, items, model = render_attr_casez_hybrid(outputs, module)
            elif variant == "attr_casez_sign_bits11_12":
                verilog, items, model = render_attr_casez_hybrid(outputs, module, [11, 12])
            elif variant == "special_casez_sign":
                verilog, items, model = render_special_casez_hybrid(outputs, module)
            elif variant == "special_casez_sign_bits11_12":
                verilog, items, model = render_special_casez_hybrid(outputs, module, [11, 12])
            elif variant.startswith("bitvec_"):
                verilog, items, model = render_bitvec_hybrid(outputs, module, bits, threshold)
            else:
                verilog, items, model = render_hybrid(case, outputs, module, bits, threshold)
            row["items"] = items
            verified, note = verify_outputs(outputs, model)
            row["verified_truth"] = "1" if verified else "0"
            row["notes"] = note
            write_text(verilog_path, verilog)
            if verified:
                yosys_log = synthesize_verilog(
                    verilog=verilog_path,
                    module=module,
                    output=aig_path,
                    yosys=args.yosys,
                    timeout=args.timeout,
                    script_out=script_path,
                )
                write_text(log_path, yosys_log)
                row["synthesized"] = "1"
                evaluated = evaluate_aig(
                    case=case,
                    candidate_id=candidate_id,
                    parent_id=label,
                    source="ai_verilog",
                    tool_chain="yosys_fp16_log_bitrun_hybrid_{0}".format(variant),
                    aig_path=aig_path,
                    truth=truth_path,
                    abc=args.abc,
                    notes="per-output-bit run-cover hybrid; {0}".format(row["items"]),
                    timeout=args.timeout,
                )
                row["equivalent"] = "1" if evaluated.equivalent else "0"
                row["area"] = "" if evaluated.area is None else str(evaluated.area)
                row["delay"] = "" if evaluated.delay is None else str(evaluated.delay)
                row["adp"] = "" if evaluated.adp is None else str(evaluated.adp)
                row["notes"] = evaluated.notes
        except (RuntimeError, SynthError, OSError, subprocess.TimeoutExpired) as exc:
            row["notes"] = "{0}: {1}".format(type(exc).__name__, exc)[:1000]
        row["runtime_sec"] = "{0:.3f}".format(time.time() - start)
        add_reference_columns(row, refs)
        rows.append(row)
        manifest["variants"].append(row)
        print("{0} {1} eq={2} adp={3} notes={4}".format(case, variant, row["equivalent"], row["adp"], row["notes"][:120]))
        sys.stdout.flush()
    write_text(case_dir / "manifest.json", json.dumps(manifest, indent=2, sort_keys=True) + "\n")
    return rows, manifest["metadata"]


def best_rows(rows):
    out = []
    for case in sorted({row["case"] for row in rows}):
        valid = [row for row in rows if row["case"] == case and row["equivalent"] == "1" and row["adp"]]
        if valid:
            best = min(valid, key=lambda row: int(row["adp"]))
            out.append({name: best.get(name, "") for name in BEST_FIELDNAMES})
    return out


def parse_args(argv=None):
    parser = argparse.ArgumentParser(description="Per-bit run-cover hybrids for FP16 log/log2.")
    parser.add_argument("--work-dir", type=Path, required=True)
    parser.add_argument("--results", type=Path, required=True)
    parser.add_argument("--best-results", type=Path, required=True)
    parser.add_argument("--metadata", type=Path, required=True)
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--reference", type=Path, default=ROOT / "reference_result.csv")
    parser.add_argument("--yosys", type=Path, default=ROOT / "student" / "tools" / "conda-env" / "bin" / "yosys")
    parser.add_argument("--abc", type=Path, default=ROOT / "student" / "abc")
    parser.add_argument("--timeout", type=int, default=900)
    parser.add_argument("--variants", default="", help="Comma-separated variant names to run.")
    parser.add_argument("--cases", default="ex223,ex224", help="Comma-separated case names to run.")
    args = parser.parse_args(argv)
    args.variant_names = {name.strip() for name in args.variants.split(",") if name.strip()}
    args.case_names = [name.strip() for name in args.cases.split(",") if name.strip()]
    return args


def main(argv=None):
    args = parse_args(argv)
    refs = load_reference(args.reference)
    rows = []
    metadata = []
    for case in args.case_names:
        case_rows, case_meta = run_case(args, case, refs)
        rows.extend(case_rows)
        metadata.append(case_meta)
    write_csv(args.results, RESULT_FIELDNAMES, rows)
    write_csv(args.best_results, BEST_FIELDNAMES, best_rows(rows))
    write_csv(args.metadata, list(metadata[0].keys()), metadata)
    print("wrote {0}".format(args.results))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
