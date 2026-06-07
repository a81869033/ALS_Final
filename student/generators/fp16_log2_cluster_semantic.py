#!/usr/bin/env python3
"""Semantic clustered-correction candidate for ex224 FP16 log2."""

import argparse
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
    RESULT_FIELDNAMES,
    add_reference_columns,
    load_reference,
    rel_path,
    verify_outputs,
    write_csv,
    write_text,
)
from student.generators.fp16_semantic_search import render_sign_exp_mant_case
from student.generators.fp16_log_bitrun_hybrid import render_bit_cover


CASE = "ex224"
LABEL = "fp16_log2"
MANT_SIZE = 1024


def const_word(width, value):
    return "{0}'h{1:0{2}x}".format(width, value & ((1 << width) - 1), (width + 3) // 4)


def case_lut_module(module, width, values):
    lines = [
        "module {0}(mant, value);".format(module),
        "  input [9:0] mant;",
        "  output reg [{0}:0] value;".format(width - 1),
        "  always @* begin",
        "    case (mant)",
    ]
    for mant, value in enumerate(values):
        lines.append("      {0}: value = {1};".format(const_word(10, mant), const_word(width, value)))
    lines.extend(
        [
            "      default: value = {0};".format(const_word(width, 0)),
            "    endcase",
            "  end",
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


def low_lut_module(module, width, values):
    mask = (1 << width) - 1
    return case_lut_module(module, width, [value & mask for value in values])


def exp_range_module(module, values):
    ranges = []
    start = 0
    current = (values[0] >> 10) & 31
    for index, value in enumerate(values[1:], 1):
        out_exp = (value >> 10) & 31
        if out_exp != current:
            ranges.append((start, index - 1, current))
            start = index
            current = out_exp
    ranges.append((start, len(values) - 1, current))
    lines = [
        "module {0}(mant, out_exp);".format(module),
        "  input [9:0] mant;",
        "  output reg [4:0] out_exp;",
        "  always @* begin",
    ]
    for idx, (start, end, out_exp) in enumerate(ranges):
        prefix = "if" if idx == 0 else "else if"
        if start == end:
            condition = "mant == {0}".format(const_word(10, start))
        elif start == 0:
            condition = "mant <= {0}".format(const_word(10, end))
        else:
            condition = "mant <= {0}".format(const_word(10, end))
        lines.append("    {0} ({1}) out_exp = {2};".format(prefix, condition, const_word(5, out_exp)))
    lines.extend(["    else out_exp = {0};".format(const_word(5, ranges[-1][2])), "  end", "endmodule", ""])
    return "\n".join(lines), ranges


def bdd_flag_module(module, flags, order=None):
    if order is None:
        order = list(range(9, -1, -1))
    unique = {}
    cache = {}
    nodes = []

    def build(pos, indices):
        values = [flags[index] for index in indices]
        if all(value == values[0] for value in values):
            return values[0]
        if pos == len(order):
            return values[0]
        key = (pos, indices)
        if key in cache:
            return cache[key]
        var = order[pos]
        low_indices = tuple(index for index in indices if ((index >> var) & 1) == 0)
        high_indices = tuple(index for index in indices if ((index >> var) & 1) == 1)
        low = build(pos + 1, low_indices)
        high = build(pos + 1, high_indices)
        if low == high:
            result = low
        else:
            node_key = (var, low, high)
            if node_key not in unique:
                unique[node_key] = len(nodes) + 2
                nodes.append(node_key)
            result = unique[node_key]
        cache[key] = result
        return result

    root = build(0, tuple(range(MANT_SIZE)))

    def expr(node):
        if node == 0:
            return "1'b0"
        if node == 1:
            return "1'b1"
        return "n{0}".format(node)

    lines = [
        "module {0}(mant, flag);".format(module),
        "  input [9:0] mant;",
        "  output flag;",
    ]
    for node_id, (var, low, high) in enumerate(nodes, 2):
        lines.append("  wire n{0} = mant[{1}] ? {2} : {3};".format(node_id, var, expr(high), expr(low)))
    lines.extend(["  assign flag = {0};".format(expr(root)), "endmodule", ""])
    return "\n".join(lines), len(nodes)


def build_tables(outputs):
    def seq(exp):
        return [outputs[(exp << 10) | mant] for mant in range(MANT_SIZE)]

    def corr_plus(exp):
        values = seq(exp)
        base = values[0]
        return [value - base for value in values]

    def corr_minus(exp):
        values = seq(exp)
        base = values[0]
        return [base - value for value in values]

    corr128 = corr_plus(23)
    corr256 = corr_plus(19)
    corr512 = corr_plus(17)
    corr1024 = corr_plus(16)

    assert corr_minus(1) == corr128
    assert corr_minus(7) == corr256
    assert corr_minus(11) == corr512
    assert corr_minus(13) == corr1024

    return {
        "corr128": corr128,
        "corr256": corr256,
        "corr512": corr512,
        "corr1024": corr1024,
        "near_neg": seq(14),
        "near_pos": seq(15),
    }


def render_clustered(outputs, module):
    tables = build_tables(outputs)
    lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [15:0] out;",
        "  wire sign = in[15];",
        "  wire [4:0] exp = in[14:10];",
        "  wire [9:0] mant = in[9:0];",
        "  wire [7:0] corr128;",
        "  wire [8:0] corr256;",
        "  wire [9:0] corr512;",
        "  wire [9:0] corr1024;",
        "  wire [15:0] near_neg;",
        "  wire [15:0] near_pos;",
        "  {0}_corr128 u_corr128(.mant(mant), .value(corr128));".format(module),
        "  {0}_corr256 u_corr256(.mant(mant), .value(corr256));".format(module),
        "  {0}_corr512 u_corr512(.mant(mant), .value(corr512));".format(module),
        "  {0}_corr1024 u_corr1024(.mant(mant), .value(corr1024));".format(module),
        "  {0}_near_neg u_near_neg(.mant(mant), .value(near_neg));".format(module),
        "  {0}_near_pos u_near_pos(.mant(mant), .value(near_pos));".format(module),
        "  reg [15:0] out_r;",
        "  always @* begin",
        "    if (exp == 5'd0) begin",
        "      out_r = 16'hfc00;",
        "    end else if (sign) begin",
        "      out_r = 16'h7e00;",
        "    end else if (exp == 5'd31) begin",
        "      out_r = (mant == 10'd0) ? 16'h7c00 : 16'h7e00;",
        "    end else begin",
        "      case (exp)",
        "        5'd1: out_r = 16'hcb00 - {8'd0, corr128};",
        "        5'd2: out_r = 16'hca80 - {8'd0, corr128};",
        "        5'd3: out_r = 16'hca00 - {8'd0, corr128};",
        "        5'd4: out_r = 16'hc980 - {8'd0, corr128};",
        "        5'd5: out_r = 16'hc900 - {8'd0, corr128};",
        "        5'd6: out_r = 16'hc880 - {8'd0, corr128};",
        "        5'd7: out_r = 16'hc800 - {7'd0, corr256};",
        "        5'd8: out_r = 16'hc700 - {7'd0, corr256};",
        "        5'd9: out_r = 16'hc600 - {7'd0, corr256};",
        "        5'd10: out_r = 16'hc500 - {7'd0, corr256};",
        "        5'd11: out_r = 16'hc400 - {6'd0, corr512};",
        "        5'd12: out_r = 16'hc200 - {6'd0, corr512};",
        "        5'd13: out_r = 16'hc000 - {6'd0, corr1024};",
        "        5'd14: out_r = near_neg;",
        "        5'd15: out_r = near_pos;",
        "        5'd16: out_r = 16'h3c00 + {6'd0, corr1024};",
        "        5'd17: out_r = 16'h4000 + {6'd0, corr512};",
        "        5'd18: out_r = 16'h4200 + {6'd0, corr512};",
        "        5'd19: out_r = 16'h4400 + {7'd0, corr256};",
        "        5'd20: out_r = 16'h4500 + {7'd0, corr256};",
        "        5'd21: out_r = 16'h4600 + {7'd0, corr256};",
        "        5'd22: out_r = 16'h4700 + {7'd0, corr256};",
        "        5'd23: out_r = 16'h4800 + {8'd0, corr128};",
        "        5'd24: out_r = 16'h4880 + {8'd0, corr128};",
        "        5'd25: out_r = 16'h4900 + {8'd0, corr128};",
        "        5'd26: out_r = 16'h4980 + {8'd0, corr128};",
        "        5'd27: out_r = 16'h4a00 + {8'd0, corr128};",
        "        5'd28: out_r = 16'h4a80 + {8'd0, corr128};",
        "        5'd29: out_r = 16'h4b00 + {8'd0, corr128};",
        "        5'd30: out_r = 16'h4b80 + {8'd0, corr128};",
        "        default: out_r = 16'h7e00;",
        "      endcase",
        "    end",
        "  end",
        "  assign out = out_r;",
        "endmodule",
        "",
        case_lut_module(module + "_corr128", 8, tables["corr128"]),
        case_lut_module(module + "_corr256", 9, tables["corr256"]),
        case_lut_module(module + "_corr512", 10, tables["corr512"]),
        case_lut_module(module + "_corr1024", 10, tables["corr1024"]),
        case_lut_module(module + "_near_neg", 16, tables["near_neg"]),
        case_lut_module(module + "_near_pos", 16, tables["near_pos"]),
    ]

    def model(index):
        return outputs[index]

    items = "shared correction LUTs: corr128,corr256,corr512,corr1024 plus exp14/15 near-one LUTs"
    return "\n".join(lines), items, model


def render_clustered_fieldnear(outputs, module):
    tables = build_tables(outputs)
    near_neg_values = tables["near_neg"]
    near_pos_values = tables["near_pos"]
    near_neg_exp_v, near_neg_ranges = exp_range_module(module + "_near_neg_exp", near_neg_values)
    near_pos_exp_v, near_pos_ranges = exp_range_module(module + "_near_pos_exp", near_pos_values)
    lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [15:0] out;",
        "  wire sign = in[15];",
        "  wire [4:0] exp = in[14:10];",
        "  wire [9:0] mant = in[9:0];",
        "  wire [7:0] corr128;",
        "  wire [8:0] corr256;",
        "  wire [9:0] corr512;",
        "  wire [9:0] corr1024;",
        "  wire [4:0] near_neg_exp;",
        "  wire [4:0] near_pos_exp;",
        "  wire [9:0] near_neg_mant;",
        "  wire [9:0] near_pos_mant;",
        "  {0}_corr128 u_corr128(.mant(mant), .value(corr128));".format(module),
        "  {0}_corr256 u_corr256(.mant(mant), .value(corr256));".format(module),
        "  {0}_corr512 u_corr512(.mant(mant), .value(corr512));".format(module),
        "  {0}_corr1024 u_corr1024(.mant(mant), .value(corr1024));".format(module),
        "  {0}_near_neg_exp u_near_neg_exp(.mant(mant), .out_exp(near_neg_exp));".format(module),
        "  {0}_near_pos_exp u_near_pos_exp(.mant(mant), .out_exp(near_pos_exp));".format(module),
        "  {0}_near_neg_mant u_near_neg_mant(.mant(mant), .value(near_neg_mant));".format(module),
        "  {0}_near_pos_mant u_near_pos_mant(.mant(mant), .value(near_pos_mant));".format(module),
        "  reg [15:0] out_r;",
        "  always @* begin",
        "    if (exp == 5'd0) begin",
        "      out_r = 16'hfc00;",
        "    end else if (sign) begin",
        "      out_r = 16'h7e00;",
        "    end else if (exp == 5'd31) begin",
        "      out_r = (mant == 10'd0) ? 16'h7c00 : 16'h7e00;",
        "    end else begin",
        "      case (exp)",
        "        5'd1: out_r = 16'hcb00 - {8'd0, corr128};",
        "        5'd2: out_r = 16'hca80 - {8'd0, corr128};",
        "        5'd3: out_r = 16'hca00 - {8'd0, corr128};",
        "        5'd4: out_r = 16'hc980 - {8'd0, corr128};",
        "        5'd5: out_r = 16'hc900 - {8'd0, corr128};",
        "        5'd6: out_r = 16'hc880 - {8'd0, corr128};",
        "        5'd7: out_r = 16'hc800 - {7'd0, corr256};",
        "        5'd8: out_r = 16'hc700 - {7'd0, corr256};",
        "        5'd9: out_r = 16'hc600 - {7'd0, corr256};",
        "        5'd10: out_r = 16'hc500 - {7'd0, corr256};",
        "        5'd11: out_r = 16'hc400 - {6'd0, corr512};",
        "        5'd12: out_r = 16'hc200 - {6'd0, corr512};",
        "        5'd13: out_r = 16'hc000 - {6'd0, corr1024};",
        "        5'd14: out_r = {1'b1, near_neg_exp, near_neg_mant};",
        "        5'd15: out_r = {1'b0, near_pos_exp, near_pos_mant};",
        "        5'd16: out_r = 16'h3c00 + {6'd0, corr1024};",
        "        5'd17: out_r = 16'h4000 + {6'd0, corr512};",
        "        5'd18: out_r = 16'h4200 + {6'd0, corr512};",
        "        5'd19: out_r = 16'h4400 + {7'd0, corr256};",
        "        5'd20: out_r = 16'h4500 + {7'd0, corr256};",
        "        5'd21: out_r = 16'h4600 + {7'd0, corr256};",
        "        5'd22: out_r = 16'h4700 + {7'd0, corr256};",
        "        5'd23: out_r = 16'h4800 + {8'd0, corr128};",
        "        5'd24: out_r = 16'h4880 + {8'd0, corr128};",
        "        5'd25: out_r = 16'h4900 + {8'd0, corr128};",
        "        5'd26: out_r = 16'h4980 + {8'd0, corr128};",
        "        5'd27: out_r = 16'h4a00 + {8'd0, corr128};",
        "        5'd28: out_r = 16'h4a80 + {8'd0, corr128};",
        "        5'd29: out_r = 16'h4b00 + {8'd0, corr128};",
        "        5'd30: out_r = 16'h4b80 + {8'd0, corr128};",
        "        default: out_r = 16'h7e00;",
        "      endcase",
        "    end",
        "  end",
        "  assign out = out_r;",
        "endmodule",
        "",
        case_lut_module(module + "_corr128", 8, tables["corr128"]),
        case_lut_module(module + "_corr256", 9, tables["corr256"]),
        case_lut_module(module + "_corr512", 10, tables["corr512"]),
        case_lut_module(module + "_corr1024", 10, tables["corr1024"]),
        near_neg_exp_v,
        near_pos_exp_v,
        low_lut_module(module + "_near_neg_mant", 10, near_neg_values),
        low_lut_module(module + "_near_pos_mant", 10, near_pos_values),
    ]

    def model(index):
        return outputs[index]

    items = "clustered correction with field-split near-one LUTs; near_neg_ranges={0}; near_pos_ranges={1}".format(
        len(near_neg_ranges),
        len(near_pos_ranges),
    )
    return "\n".join(lines), items, model


def render_clustered_fieldarith(outputs, module):
    tables = build_tables(outputs)
    near_neg_values = tables["near_neg"]
    near_pos_values = tables["near_pos"]
    near_neg_exp_v, near_neg_ranges = exp_range_module(module + "_near_neg_exp", near_neg_values)
    near_pos_exp_v, near_pos_ranges = exp_range_module(module + "_near_pos_exp", near_pos_values)
    lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [15:0] out;",
        "  wire sign = in[15];",
        "  wire [4:0] exp = in[14:10];",
        "  wire [9:0] mant = in[9:0];",
        "  wire [7:0] corr128;",
        "  wire [8:0] corr256;",
        "  wire [9:0] corr512;",
        "  wire [9:0] corr1024;",
        "  wire [4:0] near_neg_exp;",
        "  wire [4:0] near_pos_exp;",
        "  wire [9:0] near_neg_mant;",
        "  wire [9:0] near_pos_mant;",
        "  {0}_corr128 u_corr128(.mant(mant), .value(corr128));".format(module),
        "  {0}_corr256 u_corr256(.mant(mant), .value(corr256));".format(module),
        "  {0}_corr512 u_corr512(.mant(mant), .value(corr512));".format(module),
        "  {0}_corr1024 u_corr1024(.mant(mant), .value(corr1024));".format(module),
        "  {0}_near_neg_exp u_near_neg_exp(.mant(mant), .out_exp(near_neg_exp));".format(module),
        "  {0}_near_pos_exp u_near_pos_exp(.mant(mant), .out_exp(near_pos_exp));".format(module),
        "  {0}_near_neg_mant u_near_neg_mant(.mant(mant), .value(near_neg_mant));".format(module),
        "  {0}_near_pos_mant u_near_pos_mant(.mant(mant), .value(near_pos_mant));".format(module),
        "  reg use_special;",
        "  reg use_near_neg;",
        "  reg use_near_pos;",
        "  reg [15:0] special_out;",
        "  reg normal_sign;",
        "  reg [4:0] base_exp;",
        "  reg [9:0] base_mant;",
        "  reg [9:0] corr;",
        "  reg subtract;",
        "  wire [10:0] add_sum = {1'b0, base_mant} + {1'b0, corr};",
        "  wire [10:0] sub_sum = {1'b0, base_mant} - {1'b0, corr};",
        "  wire add_carry = add_sum[10];",
        "  wire sub_borrow = ({1'b0, base_mant} < {1'b0, corr});",
        "  wire [4:0] normal_exp = subtract ? (base_exp - {4'd0, sub_borrow}) : (base_exp + {4'd0, add_carry});",
        "  wire [9:0] normal_mant = subtract ? sub_sum[9:0] : add_sum[9:0];",
        "  wire [15:0] normal_out = {normal_sign, normal_exp, normal_mant};",
        "  wire [15:0] near_neg_out = {1'b1, near_neg_exp, near_neg_mant};",
        "  wire [15:0] near_pos_out = {1'b0, near_pos_exp, near_pos_mant};",
        "  always @* begin",
        "    use_special = 1'b0;",
        "    use_near_neg = 1'b0;",
        "    use_near_pos = 1'b0;",
        "    special_out = 16'h0000;",
        "    normal_sign = 1'b0;",
        "    base_exp = 5'd0;",
        "    base_mant = 10'd0;",
        "    corr = 10'd0;",
        "    subtract = 1'b0;",
        "    if (exp == 5'd0) begin",
        "      use_special = 1'b1;",
        "      special_out = 16'hfc00;",
        "    end else if (sign) begin",
        "      use_special = 1'b1;",
        "      special_out = 16'h7e00;",
        "    end else if (exp == 5'd31) begin",
        "      use_special = 1'b1;",
        "      special_out = (mant == 10'd0) ? 16'h7c00 : 16'h7e00;",
        "    end else begin",
        "      case (exp)",
        "        5'd1: begin normal_sign = 1'b1; base_exp = 5'd18; base_mant = 10'd768; corr = {2'd0, corr128}; subtract = 1'b1; end",
        "        5'd2: begin normal_sign = 1'b1; base_exp = 5'd18; base_mant = 10'd640; corr = {2'd0, corr128}; subtract = 1'b1; end",
        "        5'd3: begin normal_sign = 1'b1; base_exp = 5'd18; base_mant = 10'd512; corr = {2'd0, corr128}; subtract = 1'b1; end",
        "        5'd4: begin normal_sign = 1'b1; base_exp = 5'd18; base_mant = 10'd384; corr = {2'd0, corr128}; subtract = 1'b1; end",
        "        5'd5: begin normal_sign = 1'b1; base_exp = 5'd18; base_mant = 10'd256; corr = {2'd0, corr128}; subtract = 1'b1; end",
        "        5'd6: begin normal_sign = 1'b1; base_exp = 5'd18; base_mant = 10'd128; corr = {2'd0, corr128}; subtract = 1'b1; end",
        "        5'd7: begin normal_sign = 1'b1; base_exp = 5'd18; base_mant = 10'd0; corr = {1'd0, corr256}; subtract = 1'b1; end",
        "        5'd8: begin normal_sign = 1'b1; base_exp = 5'd17; base_mant = 10'd768; corr = {1'd0, corr256}; subtract = 1'b1; end",
        "        5'd9: begin normal_sign = 1'b1; base_exp = 5'd17; base_mant = 10'd512; corr = {1'd0, corr256}; subtract = 1'b1; end",
        "        5'd10: begin normal_sign = 1'b1; base_exp = 5'd17; base_mant = 10'd256; corr = {1'd0, corr256}; subtract = 1'b1; end",
        "        5'd11: begin normal_sign = 1'b1; base_exp = 5'd17; base_mant = 10'd0; corr = corr512; subtract = 1'b1; end",
        "        5'd12: begin normal_sign = 1'b1; base_exp = 5'd16; base_mant = 10'd512; corr = corr512; subtract = 1'b1; end",
        "        5'd13: begin normal_sign = 1'b1; base_exp = 5'd16; base_mant = 10'd0; corr = corr1024; subtract = 1'b1; end",
        "        5'd14: use_near_neg = 1'b1;",
        "        5'd15: use_near_pos = 1'b1;",
        "        5'd16: begin normal_sign = 1'b0; base_exp = 5'd15; base_mant = 10'd0; corr = corr1024; subtract = 1'b0; end",
        "        5'd17: begin normal_sign = 1'b0; base_exp = 5'd16; base_mant = 10'd0; corr = corr512; subtract = 1'b0; end",
        "        5'd18: begin normal_sign = 1'b0; base_exp = 5'd16; base_mant = 10'd512; corr = corr512; subtract = 1'b0; end",
        "        5'd19: begin normal_sign = 1'b0; base_exp = 5'd17; base_mant = 10'd0; corr = {1'd0, corr256}; subtract = 1'b0; end",
        "        5'd20: begin normal_sign = 1'b0; base_exp = 5'd17; base_mant = 10'd256; corr = {1'd0, corr256}; subtract = 1'b0; end",
        "        5'd21: begin normal_sign = 1'b0; base_exp = 5'd17; base_mant = 10'd512; corr = {1'd0, corr256}; subtract = 1'b0; end",
        "        5'd22: begin normal_sign = 1'b0; base_exp = 5'd17; base_mant = 10'd768; corr = {1'd0, corr256}; subtract = 1'b0; end",
        "        5'd23: begin normal_sign = 1'b0; base_exp = 5'd18; base_mant = 10'd0; corr = {2'd0, corr128}; subtract = 1'b0; end",
        "        5'd24: begin normal_sign = 1'b0; base_exp = 5'd18; base_mant = 10'd128; corr = {2'd0, corr128}; subtract = 1'b0; end",
        "        5'd25: begin normal_sign = 1'b0; base_exp = 5'd18; base_mant = 10'd256; corr = {2'd0, corr128}; subtract = 1'b0; end",
        "        5'd26: begin normal_sign = 1'b0; base_exp = 5'd18; base_mant = 10'd384; corr = {2'd0, corr128}; subtract = 1'b0; end",
        "        5'd27: begin normal_sign = 1'b0; base_exp = 5'd18; base_mant = 10'd512; corr = {2'd0, corr128}; subtract = 1'b0; end",
        "        5'd28: begin normal_sign = 1'b0; base_exp = 5'd18; base_mant = 10'd640; corr = {2'd0, corr128}; subtract = 1'b0; end",
        "        5'd29: begin normal_sign = 1'b0; base_exp = 5'd18; base_mant = 10'd768; corr = {2'd0, corr128}; subtract = 1'b0; end",
        "        5'd30: begin normal_sign = 1'b0; base_exp = 5'd18; base_mant = 10'd896; corr = {2'd0, corr128}; subtract = 1'b0; end",
        "        default: begin use_special = 1'b1; special_out = 16'h7e00; end",
        "      endcase",
        "    end",
        "  end",
        "  assign out = use_special ? special_out : (use_near_neg ? near_neg_out : (use_near_pos ? near_pos_out : normal_out));",
        "endmodule",
        "",
        case_lut_module(module + "_corr128", 8, tables["corr128"]),
        case_lut_module(module + "_corr256", 9, tables["corr256"]),
        case_lut_module(module + "_corr512", 10, tables["corr512"]),
        case_lut_module(module + "_corr1024", 10, tables["corr1024"]),
        near_neg_exp_v,
        near_pos_exp_v,
        low_lut_module(module + "_near_neg_mant", 10, near_neg_values),
        low_lut_module(module + "_near_pos_mant", 10, near_pos_values),
    ]

    def model(index):
        return outputs[index]

    items = "clustered correction with 11-bit field arithmetic normalizer; near_ranges={0}/{1}".format(
        len(near_neg_ranges),
        len(near_pos_ranges),
    )
    return "\n".join(lines), items, model


def render_clustered_derived_patch(outputs, module):
    tables = build_tables(outputs)
    c1024 = tables["corr1024"]
    c512 = tables["corr512"]
    c256 = tables["corr256"]
    c128 = tables["corr128"]

    patch512m = []
    patch256m = []
    patch256p = []
    patch128m = []
    for value1024, value512, value256, value128 in zip(c1024, c512, c256, c128):
        base512 = (value1024 + 1) >> 1
        q256 = value1024 >> 2
        rem256 = value1024 & 3
        base256 = q256 + (1 if (rem256 > 2 or (rem256 == 2 and (q256 & 1))) else 0)
        base128 = (value1024 + 4) >> 3
        patch512m.append(1 if value512 == base512 - 1 else 0)
        diff256 = value256 - base256
        patch256m.append(1 if diff256 == -1 else 0)
        patch256p.append(1 if diff256 == 1 else 0)
        patch128m.append(1 if value128 == base128 - 1 else 0)

    near_neg_values = tables["near_neg"]
    near_pos_values = tables["near_pos"]
    near_neg_exp_v, near_neg_ranges = exp_range_module(module + "_near_neg_exp", near_neg_values)
    near_pos_exp_v, near_pos_ranges = exp_range_module(module + "_near_pos_exp", near_pos_values)
    patch512_v, patch512_nodes = bdd_flag_module(module + "_patch512m", patch512m)
    patch256m_v, patch256m_nodes = bdd_flag_module(module + "_patch256m", patch256m)
    patch256p_v, patch256p_nodes = bdd_flag_module(module + "_patch256p", patch256p)
    patch128_v, patch128_nodes = bdd_flag_module(module + "_patch128m", patch128m)

    lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [15:0] out;",
        "  wire sign = in[15];",
        "  wire [4:0] exp = in[14:10];",
        "  wire [9:0] mant = in[9:0];",
        "  wire [9:0] corr1024;",
        "  wire patch512m;",
        "  wire patch256m;",
        "  wire patch256p;",
        "  wire patch128m;",
        "  wire [9:0] base512 = ({1'b0, corr1024} + 11'd1) >> 1;",
        "  wire round256 = corr1024[1] & (corr1024[0] | corr1024[2]);",
        "  wire [9:0] base256 = (corr1024 >> 2) + {9'd0, round256};",
        "  wire [9:0] base128 = ({1'b0, corr1024} + 11'd4) >> 3;",
        "  wire [9:0] corr512 = base512 - {9'd0, patch512m};",
        "  wire [9:0] corr256 = base256 + {9'd0, patch256p} - {9'd0, patch256m};",
        "  wire [9:0] corr128 = base128 - {9'd0, patch128m};",
        "  wire [4:0] near_neg_exp;",
        "  wire [4:0] near_pos_exp;",
        "  wire [9:0] near_neg_mant;",
        "  wire [9:0] near_pos_mant;",
        "  {0}_corr1024 u_corr1024(.mant(mant), .value(corr1024));".format(module),
        "  {0}_patch512m u_patch512m(.mant(mant), .flag(patch512m));".format(module),
        "  {0}_patch256m u_patch256m(.mant(mant), .flag(patch256m));".format(module),
        "  {0}_patch256p u_patch256p(.mant(mant), .flag(patch256p));".format(module),
        "  {0}_patch128m u_patch128m(.mant(mant), .flag(patch128m));".format(module),
        "  {0}_near_neg_exp u_near_neg_exp(.mant(mant), .out_exp(near_neg_exp));".format(module),
        "  {0}_near_pos_exp u_near_pos_exp(.mant(mant), .out_exp(near_pos_exp));".format(module),
        "  {0}_near_neg_mant u_near_neg_mant(.mant(mant), .value(near_neg_mant));".format(module),
        "  {0}_near_pos_mant u_near_pos_mant(.mant(mant), .value(near_pos_mant));".format(module),
        "  reg [15:0] out_r;",
        "  always @* begin",
        "    if (exp == 5'd0) begin",
        "      out_r = 16'hfc00;",
        "    end else if (sign) begin",
        "      out_r = 16'h7e00;",
        "    end else if (exp == 5'd31) begin",
        "      out_r = (mant == 10'd0) ? 16'h7c00 : 16'h7e00;",
        "    end else begin",
        "      case (exp)",
        "        5'd1: out_r = 16'hcb00 - {8'd0, corr128[7:0]};",
        "        5'd2: out_r = 16'hca80 - {8'd0, corr128[7:0]};",
        "        5'd3: out_r = 16'hca00 - {8'd0, corr128[7:0]};",
        "        5'd4: out_r = 16'hc980 - {8'd0, corr128[7:0]};",
        "        5'd5: out_r = 16'hc900 - {8'd0, corr128[7:0]};",
        "        5'd6: out_r = 16'hc880 - {8'd0, corr128[7:0]};",
        "        5'd7: out_r = 16'hc800 - {7'd0, corr256[8:0]};",
        "        5'd8: out_r = 16'hc700 - {7'd0, corr256[8:0]};",
        "        5'd9: out_r = 16'hc600 - {7'd0, corr256[8:0]};",
        "        5'd10: out_r = 16'hc500 - {7'd0, corr256[8:0]};",
        "        5'd11: out_r = 16'hc400 - {6'd0, corr512};",
        "        5'd12: out_r = 16'hc200 - {6'd0, corr512};",
        "        5'd13: out_r = 16'hc000 - {6'd0, corr1024};",
        "        5'd14: out_r = {1'b1, near_neg_exp, near_neg_mant};",
        "        5'd15: out_r = {1'b0, near_pos_exp, near_pos_mant};",
        "        5'd16: out_r = 16'h3c00 + {6'd0, corr1024};",
        "        5'd17: out_r = 16'h4000 + {6'd0, corr512};",
        "        5'd18: out_r = 16'h4200 + {6'd0, corr512};",
        "        5'd19: out_r = 16'h4400 + {7'd0, corr256[8:0]};",
        "        5'd20: out_r = 16'h4500 + {7'd0, corr256[8:0]};",
        "        5'd21: out_r = 16'h4600 + {7'd0, corr256[8:0]};",
        "        5'd22: out_r = 16'h4700 + {7'd0, corr256[8:0]};",
        "        5'd23: out_r = 16'h4800 + {8'd0, corr128[7:0]};",
        "        5'd24: out_r = 16'h4880 + {8'd0, corr128[7:0]};",
        "        5'd25: out_r = 16'h4900 + {8'd0, corr128[7:0]};",
        "        5'd26: out_r = 16'h4980 + {8'd0, corr128[7:0]};",
        "        5'd27: out_r = 16'h4a00 + {8'd0, corr128[7:0]};",
        "        5'd28: out_r = 16'h4a80 + {8'd0, corr128[7:0]};",
        "        5'd29: out_r = 16'h4b00 + {8'd0, corr128[7:0]};",
        "        5'd30: out_r = 16'h4b80 + {8'd0, corr128[7:0]};",
        "        default: out_r = 16'h7e00;",
        "      endcase",
        "    end",
        "  end",
        "  assign out = out_r;",
        "endmodule",
        "",
        case_lut_module(module + "_corr1024", 10, c1024),
        patch512_v,
        patch256m_v,
        patch256p_v,
        patch128_v,
        near_neg_exp_v,
        near_pos_exp_v,
        low_lut_module(module + "_near_neg_mant", 10, near_neg_values),
        low_lut_module(module + "_near_pos_mant", 10, near_pos_values),
    ]

    def model(index):
        return outputs[index]

    items = "derived corr128/256/512 from corr1024 plus exact BDD patches; patch_nodes=512m:{0},256m:{1},256p:{2},128m:{3}; near_ranges={4}/{5}".format(
        patch512_nodes,
        patch256m_nodes,
        patch256p_nodes,
        patch128_nodes,
        len(near_neg_ranges),
        len(near_pos_ranges),
    )
    return "\n".join(lines), items, model


def render_clustered_partial_patch(outputs, module, derive128=False, derive256=False, derive512=False):
    tables = build_tables(outputs)
    c1024 = tables["corr1024"]
    c512 = tables["corr512"]
    c256 = tables["corr256"]
    c128 = tables["corr128"]

    patch512m = []
    patch256m = []
    patch256p = []
    patch128m = []
    for value1024, value512, value256, value128 in zip(c1024, c512, c256, c128):
        base512 = (value1024 + 1) >> 1
        q256 = value1024 >> 2
        rem256 = value1024 & 3
        base256 = q256 + (1 if (rem256 > 2 or (rem256 == 2 and (q256 & 1))) else 0)
        base128 = (value1024 + 4) >> 3
        patch512m.append(1 if value512 == base512 - 1 else 0)
        diff256 = value256 - base256
        patch256m.append(1 if diff256 == -1 else 0)
        patch256p.append(1 if diff256 == 1 else 0)
        patch128m.append(1 if value128 == base128 - 1 else 0)

    near_neg_values = tables["near_neg"]
    near_pos_values = tables["near_pos"]
    near_neg_exp_v, near_neg_ranges = exp_range_module(module + "_near_neg_exp", near_neg_values)
    near_pos_exp_v, near_pos_ranges = exp_range_module(module + "_near_pos_exp", near_pos_values)

    pre_lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [15:0] out;",
        "  wire sign = in[15];",
        "  wire [4:0] exp = in[14:10];",
        "  wire [9:0] mant = in[9:0];",
        "  wire [9:0] corr1024;",
    ]
    inst_lines = ["  {0}_corr1024 u_corr1024(.mant(mant), .value(corr1024));".format(module)]
    extra_modules = [case_lut_module(module + "_corr1024", 10, c1024)]
    notes = []

    if derive512:
        patch512_v, patch512_nodes = bdd_flag_module(module + "_patch512m", patch512m)
        pre_lines.extend(
            [
                "  wire patch512m;",
                "  wire [9:0] base512 = ({1'b0, corr1024} + 11'd1) >> 1;",
                "  wire [9:0] corr512 = base512 - {9'd0, patch512m};",
            ]
        )
        inst_lines.append("  {0}_patch512m u_patch512m(.mant(mant), .flag(patch512m));".format(module))
        extra_modules.append(patch512_v)
        notes.append("derive512 nodes={0}".format(patch512_nodes))
    else:
        pre_lines.extend(["  wire [9:0] corr512;"])
        inst_lines.append("  {0}_corr512 u_corr512(.mant(mant), .value(corr512));".format(module))
        extra_modules.append(case_lut_module(module + "_corr512", 10, c512))
        notes.append("direct512")

    if derive256:
        patch256m_v, patch256m_nodes = bdd_flag_module(module + "_patch256m", patch256m)
        patch256p_v, patch256p_nodes = bdd_flag_module(module + "_patch256p", patch256p)
        pre_lines.extend(
            [
                "  wire patch256m;",
                "  wire patch256p;",
                "  wire round256 = corr1024[1] & (corr1024[0] | corr1024[2]);",
                "  wire [9:0] base256 = (corr1024 >> 2) + {9'd0, round256};",
                "  wire [9:0] corr256 = base256 + {9'd0, patch256p} - {9'd0, patch256m};",
            ]
        )
        inst_lines.extend(
            [
                "  {0}_patch256m u_patch256m(.mant(mant), .flag(patch256m));".format(module),
                "  {0}_patch256p u_patch256p(.mant(mant), .flag(patch256p));".format(module),
            ]
        )
        extra_modules.extend([patch256m_v, patch256p_v])
        notes.append("derive256 nodes={0}/{1}".format(patch256m_nodes, patch256p_nodes))
    else:
        pre_lines.extend(["  wire [8:0] corr256_direct;", "  wire [9:0] corr256 = {1'b0, corr256_direct};"])
        inst_lines.append("  {0}_corr256 u_corr256(.mant(mant), .value(corr256_direct));".format(module))
        extra_modules.append(case_lut_module(module + "_corr256", 9, c256))
        notes.append("direct256")

    if derive128:
        patch128_v, patch128_nodes = bdd_flag_module(module + "_patch128m", patch128m)
        pre_lines.extend(
            [
                "  wire patch128m;",
                "  wire [9:0] base128 = ({1'b0, corr1024} + 11'd4) >> 3;",
                "  wire [9:0] corr128 = base128 - {9'd0, patch128m};",
            ]
        )
        inst_lines.append("  {0}_patch128m u_patch128m(.mant(mant), .flag(patch128m));".format(module))
        extra_modules.append(patch128_v)
        notes.append("derive128 nodes={0}".format(patch128_nodes))
    else:
        pre_lines.extend(["  wire [7:0] corr128_direct;", "  wire [9:0] corr128 = {2'b00, corr128_direct};"])
        inst_lines.append("  {0}_corr128 u_corr128(.mant(mant), .value(corr128_direct));".format(module))
        extra_modules.append(case_lut_module(module + "_corr128", 8, c128))
        notes.append("direct128")

    lines = pre_lines + [
        "  wire [4:0] near_neg_exp;",
        "  wire [4:0] near_pos_exp;",
        "  wire [9:0] near_neg_mant;",
        "  wire [9:0] near_pos_mant;",
    ]
    lines.extend(inst_lines)
    lines.extend(
        [
            "  {0}_near_neg_exp u_near_neg_exp(.mant(mant), .out_exp(near_neg_exp));".format(module),
            "  {0}_near_pos_exp u_near_pos_exp(.mant(mant), .out_exp(near_pos_exp));".format(module),
            "  {0}_near_neg_mant u_near_neg_mant(.mant(mant), .value(near_neg_mant));".format(module),
            "  {0}_near_pos_mant u_near_pos_mant(.mant(mant), .value(near_pos_mant));".format(module),
            "  reg [15:0] out_r;",
            "  always @* begin",
            "    if (exp == 5'd0) begin",
            "      out_r = 16'hfc00;",
            "    end else if (sign) begin",
            "      out_r = 16'h7e00;",
            "    end else if (exp == 5'd31) begin",
            "      out_r = (mant == 10'd0) ? 16'h7c00 : 16'h7e00;",
            "    end else begin",
            "      case (exp)",
            "        5'd1: out_r = 16'hcb00 - {8'd0, corr128[7:0]};",
            "        5'd2: out_r = 16'hca80 - {8'd0, corr128[7:0]};",
            "        5'd3: out_r = 16'hca00 - {8'd0, corr128[7:0]};",
            "        5'd4: out_r = 16'hc980 - {8'd0, corr128[7:0]};",
            "        5'd5: out_r = 16'hc900 - {8'd0, corr128[7:0]};",
            "        5'd6: out_r = 16'hc880 - {8'd0, corr128[7:0]};",
            "        5'd7: out_r = 16'hc800 - {7'd0, corr256[8:0]};",
            "        5'd8: out_r = 16'hc700 - {7'd0, corr256[8:0]};",
            "        5'd9: out_r = 16'hc600 - {7'd0, corr256[8:0]};",
            "        5'd10: out_r = 16'hc500 - {7'd0, corr256[8:0]};",
            "        5'd11: out_r = 16'hc400 - {6'd0, corr512};",
            "        5'd12: out_r = 16'hc200 - {6'd0, corr512};",
            "        5'd13: out_r = 16'hc000 - {6'd0, corr1024};",
            "        5'd14: out_r = {1'b1, near_neg_exp, near_neg_mant};",
            "        5'd15: out_r = {1'b0, near_pos_exp, near_pos_mant};",
            "        5'd16: out_r = 16'h3c00 + {6'd0, corr1024};",
            "        5'd17: out_r = 16'h4000 + {6'd0, corr512};",
            "        5'd18: out_r = 16'h4200 + {6'd0, corr512};",
            "        5'd19: out_r = 16'h4400 + {7'd0, corr256[8:0]};",
            "        5'd20: out_r = 16'h4500 + {7'd0, corr256[8:0]};",
            "        5'd21: out_r = 16'h4600 + {7'd0, corr256[8:0]};",
            "        5'd22: out_r = 16'h4700 + {7'd0, corr256[8:0]};",
            "        5'd23: out_r = 16'h4800 + {8'd0, corr128[7:0]};",
            "        5'd24: out_r = 16'h4880 + {8'd0, corr128[7:0]};",
            "        5'd25: out_r = 16'h4900 + {8'd0, corr128[7:0]};",
            "        5'd26: out_r = 16'h4980 + {8'd0, corr128[7:0]};",
            "        5'd27: out_r = 16'h4a00 + {8'd0, corr128[7:0]};",
            "        5'd28: out_r = 16'h4a80 + {8'd0, corr128[7:0]};",
            "        5'd29: out_r = 16'h4b00 + {8'd0, corr128[7:0]};",
            "        5'd30: out_r = 16'h4b80 + {8'd0, corr128[7:0]};",
            "        default: out_r = 16'h7e00;",
            "      endcase",
            "    end",
            "  end",
            "  assign out = out_r;",
            "endmodule",
            "",
        ]
    )
    lines.extend(extra_modules)
    lines.extend(
        [
            near_neg_exp_v,
            near_pos_exp_v,
            low_lut_module(module + "_near_neg_mant", 10, near_neg_values),
            low_lut_module(module + "_near_pos_mant", 10, near_pos_values),
        ]
    )

    def model(index):
        return outputs[index]

    items = "partial correction normalizer from corr1024; {0}; near_ranges={1}/{2}".format(
        ", ".join(notes),
        len(near_neg_ranges),
        len(near_pos_ranges),
    )
    return "\n".join(lines), items, model


def render_casez_sign_lines(lines):
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
        ]
    )


def value_runs(values):
    ranges = []
    start = 0
    current = values[0]
    for index, value in enumerate(values[1:], 1):
        if value != current:
            ranges.append((start, index - 1, current))
            start = index
            current = value
    ranges.append((start, len(values) - 1, current))
    return ranges


def emit_balanced_run_tree(lines, items, indent, target, width):
    if len(items) == 1:
        lines.append("{0}{1} = {2};".format(indent, target, const_word(width, items[0][2])))
        return
    mid = len(items) // 2
    left = items[:mid]
    right = items[mid:]
    boundary = left[-1][1]
    lines.append("{0}if (mant <= {1}) begin".format(indent, const_word(10, boundary)))
    emit_balanced_run_tree(lines, left, indent + "  ", target, width)
    lines.append("{0}end else begin".format(indent))
    emit_balanced_run_tree(lines, right, indent + "  ", target, width)
    lines.append("{0}end".format(indent))


def render_field_table_module(outputs, module, field, use_runs=False):
    width = 5 if field == "exp" else 10
    shift = 10 if field == "exp" else 0
    mask = (1 << width) - 1
    target = "out_{0}".format(field)
    lines = [
        "module {0}(in, {1});".format(module, target),
        "  input [15:0] in;",
        "  output reg [{0}:0] {1};".format(width - 1, target),
        "  wire [5:0] sign_exp = in[15:10];",
        "  wire [9:0] mant = in[9:0];",
        "  always @* begin",
        "    case (sign_exp)",
    ]
    items = 0
    run_total = 0
    for sign_exp in range(64):
        values = [((outputs[(sign_exp << 10) | mant] >> shift) & mask) for mant in range(MANT_SIZE)]
        if len(set(values)) == 1:
            lines.append("      {0}: {1} = {2};".format(const_word(6, sign_exp), target, const_word(width, values[0])))
            items += 1
        elif use_runs:
            group_runs = value_runs(values)
            run_total += len(group_runs)
            items += len(group_runs)
            lines.append("      {0}: begin".format(const_word(6, sign_exp)))
            emit_balanced_run_tree(lines, group_runs, "        ", target, width)
            lines.append("      end")
        else:
            lines.append("      {0}: begin".format(const_word(6, sign_exp)))
            lines.append("        case (mant)")
            for mant, value in enumerate(values):
                lines.append("          {0}: {1} = {2};".format(const_word(10, mant), target, const_word(width, value)))
                items += 1
            lines.extend(["          default: {0} = {1};".format(target, const_word(width, 0)), "        endcase", "      end"])
    lines.extend(["      default: {0} = {1};".format(target, const_word(width, 0)), "    endcase", "  end", "endmodule", ""])
    note = "{0}_items={1}".format(field, items)
    if use_runs:
        note += "; {0}_runs={1}".format(field, run_total)
    return "\n".join(lines), note


def render_field_exp_mant_split(outputs, module, exp_use_runs=False):
    exp_v, exp_note = render_field_table_module(outputs, module + "_exp", "exp", use_runs=exp_use_runs)
    mant_v, mant_note = render_field_table_module(outputs, module + "_mant", "mant", use_runs=False)
    lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [15:0] out;",
        "  wire [5:0] sign_exp = in[15:10];",
        "  reg sign_out;",
        "  wire [4:0] out_exp;",
        "  wire [9:0] out_mant;",
        "  {0}_exp u_exp(.in(in), .out_exp(out_exp));".format(module),
        "  {0}_mant u_mant(.in(in), .out_mant(out_mant));".format(module),
    ]
    render_casez_sign_lines(lines)
    lines.extend(["  assign out = {sign_out, out_exp, out_mant};", "endmodule", "", exp_v, mant_v])

    def model(index):
        return outputs[index]

    mode = "balanced run-tree" if exp_use_runs else "case LUT"
    items = "field split all groups: sign casez, out_exp {0}, out_mant 10-bit table; {1}; {2}".format(
        mode,
        exp_note,
        mant_note,
    )
    return "\n".join(lines), items, model


def render_cluster_hybrid(outputs, module, selected_bits):
    table_module = module + "_table"
    sem_module = module + "_sem"
    table_v, table_items, _ = render_sign_exp_mant_case(outputs, table_module)
    sem_v, _, _ = render_clustered(outputs, sem_module)
    bit12_v, bit12_meta = render_bit_cover(outputs, module + "_bit12", 12, 8)
    bit11_v, bit11_meta = render_bit_cover(outputs, module + "_bit11", 11, 8)
    selected = set(selected_bits)
    lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [15:0] out;",
        "  wire [15:0] table_out;",
        "  wire [15:0] sem_out;",
        "  wire [5:0] sign_exp = in[15:10];",
        "  reg sign_out;",
        "  wire bit12_out;",
        "  wire bit11_out;",
        "  {0} u_table(.in(in), .out(table_out));".format(table_module),
        "  {0} u_sem(.in(in), .out(sem_out));".format(sem_module),
        "  {0}_bit12 u_bit12(.in(in), .out_bit(bit12_out));".format(module),
        "  {0}_bit11 u_bit11(.in(in), .out_bit(bit11_out));".format(module),
    ]
    render_casez_sign_lines(lines)
    for bit in range(16):
        if bit == 15:
            lines.append("  assign out[15] = sign_out;")
        elif bit == 12:
            lines.append("  assign out[12] = bit12_out;")
        elif bit == 11:
            lines.append("  assign out[11] = bit11_out;")
        elif bit in selected:
            lines.append("  assign out[{0}] = sem_out[{0}];".format(bit))
        else:
            lines.append("  assign out[{0}] = table_out[{0}];".format(bit))
    lines.extend(["endmodule", "", table_v, sem_v, bit12_v, bit11_v])

    def model(index):
        return outputs[index]

    items = "casez_sign+bit11/12 run-cover plus semantic clustered low bits {0}; table_items={1}; {2}; {3}".format(
        ",".join(str(bit) for bit in sorted(selected)),
        table_items,
        bit12_meta,
        bit11_meta,
    )
    return "\n".join(lines), items, model


def render_derived_cluster_hybrid(outputs, module, selected_bits):
    table_module = module + "_table"
    sem_module = module + "_sem"
    table_v, table_items, _ = render_sign_exp_mant_case(outputs, table_module)
    sem_v, sem_items, _ = render_clustered_derived_patch(outputs, sem_module)
    bit12_v, bit12_meta = render_bit_cover(outputs, module + "_bit12", 12, 8)
    bit11_v, bit11_meta = render_bit_cover(outputs, module + "_bit11", 11, 8)
    selected = set(selected_bits)
    lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [15:0] out;",
        "  wire [15:0] table_out;",
        "  wire [15:0] sem_out;",
        "  wire [5:0] sign_exp = in[15:10];",
        "  reg sign_out;",
        "  wire bit12_out;",
        "  wire bit11_out;",
        "  {0} u_table(.in(in), .out(table_out));".format(table_module),
        "  {0} u_sem(.in(in), .out(sem_out));".format(sem_module),
        "  {0}_bit12 u_bit12(.in(in), .out_bit(bit12_out));".format(module),
        "  {0}_bit11 u_bit11(.in(in), .out_bit(bit11_out));".format(module),
    ]
    render_casez_sign_lines(lines)
    for bit in range(16):
        if bit == 15:
            lines.append("  assign out[15] = sign_out;")
        elif bit == 12:
            lines.append("  assign out[12] = bit12_out;")
        elif bit == 11:
            lines.append("  assign out[11] = bit11_out;")
        elif bit in selected:
            lines.append("  assign out[{0}] = sem_out[{0}];".format(bit))
        else:
            lines.append("  assign out[{0}] = table_out[{0}];".format(bit))
    lines.extend(["endmodule", "", table_v, sem_v, bit12_v, bit11_v])

    def model(index):
        return outputs[index]

    items = "casez_sign+bit11/12 run-cover plus derived-patch semantic low bits {0}; table_items={1}; {2}; {3}; sem={4}".format(
        ",".join(str(bit) for bit in sorted(selected)),
        table_items,
        bit12_meta,
        bit11_meta,
        sem_items,
    )
    return "\n".join(lines), items, model


def render_direct_lowbits_hybrid(outputs, module, width):
    table_module = module + "_table"
    table_v, table_items, _ = render_sign_exp_mant_case(outputs, table_module)
    tables = build_tables(outputs)
    bit12_v, bit12_meta = render_bit_cover(outputs, module + "_bit12", 12, 8)
    bit11_v, bit11_meta = render_bit_cover(outputs, module + "_bit11", 11, 8)
    low_mask = (1 << width) - 1
    lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [15:0] out;",
        "  wire [15:0] table_out;",
        "  wire [5:0] sign_exp = in[15:10];",
        "  wire sign = in[15];",
        "  wire [4:0] exp = in[14:10];",
        "  wire [9:0] mant = in[9:0];",
        "  reg sign_out;",
        "  wire bit12_out;",
        "  wire bit11_out;",
        "  wire [{0}:0] c128;".format(width - 1),
        "  wire [{0}:0] c256;".format(width - 1),
        "  wire [{0}:0] c512;".format(width - 1),
        "  wire [{0}:0] c1024;".format(width - 1),
        "  wire [{0}:0] near_neg_low;".format(width - 1),
        "  wire [{0}:0] near_pos_low;".format(width - 1),
        "  reg [{0}:0] low_bits;".format(width - 1),
        "  {0} u_table(.in(in), .out(table_out));".format(table_module),
        "  {0}_bit12 u_bit12(.in(in), .out_bit(bit12_out));".format(module),
        "  {0}_bit11 u_bit11(.in(in), .out_bit(bit11_out));".format(module),
        "  {0}_c128 u_c128(.mant(mant), .value(c128));".format(module),
        "  {0}_c256 u_c256(.mant(mant), .value(c256));".format(module),
        "  {0}_c512 u_c512(.mant(mant), .value(c512));".format(module),
        "  {0}_c1024 u_c1024(.mant(mant), .value(c1024));".format(module),
        "  {0}_near_neg_low u_near_neg_low(.mant(mant), .value(near_neg_low));".format(module),
        "  {0}_near_pos_low u_near_pos_low(.mant(mant), .value(near_pos_low));".format(module),
    ]
    render_casez_sign_lines(lines)
    lines.extend(
        [
            "  always @* begin",
            "    if (exp == 5'd0 || sign || exp == 5'd31) begin",
            "      low_bits = {0};".format(const_word(width, 0)),
            "    end else begin",
            "      case (exp)",
        ]
    )
    for exp in range(1, 7):
        base_low = outputs[exp << 10] & low_mask
        lines.append("        5'd{0}: low_bits = {1} - c128;".format(exp, const_word(width, base_low)))
    for exp in range(7, 11):
        base_low = outputs[exp << 10] & low_mask
        lines.append("        5'd{0}: low_bits = {1} - c256;".format(exp, const_word(width, base_low)))
    for exp in range(11, 13):
        base_low = outputs[exp << 10] & low_mask
        lines.append("        5'd{0}: low_bits = {1} - c512;".format(exp, const_word(width, base_low)))
    base_low = outputs[13 << 10] & low_mask
    lines.append("        5'd13: low_bits = {0} - c1024;".format(const_word(width, base_low)))
    lines.append("        5'd14: low_bits = near_neg_low;")
    lines.append("        5'd15: low_bits = near_pos_low;")
    base_low = outputs[16 << 10] & low_mask
    lines.append("        5'd16: low_bits = {0} + c1024;".format(const_word(width, base_low)))
    for exp in range(17, 19):
        base_low = outputs[exp << 10] & low_mask
        lines.append("        5'd{0}: low_bits = {1} + c512;".format(exp, const_word(width, base_low)))
    for exp in range(19, 23):
        base_low = outputs[exp << 10] & low_mask
        lines.append("        5'd{0}: low_bits = {1} + c256;".format(exp, const_word(width, base_low)))
    for exp in range(23, 31):
        base_low = outputs[exp << 10] & low_mask
        lines.append("        5'd{0}: low_bits = {1} + c128;".format(exp, const_word(width, base_low)))
    lines.extend(
        [
            "        default: low_bits = {0};".format(const_word(width, 0)),
            "      endcase",
            "    end",
            "  end",
        ]
    )
    for bit in range(16):
        if bit == 15:
            lines.append("  assign out[15] = sign_out;")
        elif bit == 12:
            lines.append("  assign out[12] = bit12_out;")
        elif bit == 11:
            lines.append("  assign out[11] = bit11_out;")
        elif bit < width:
            lines.append("  assign out[{0}] = low_bits[{0}];".format(bit))
        else:
            lines.append("  assign out[{0}] = table_out[{0}];".format(bit))
    lines.extend(
        [
            "endmodule",
            "",
            table_v,
            low_lut_module(module + "_c128", width, tables["corr128"]),
            low_lut_module(module + "_c256", width, tables["corr256"]),
            low_lut_module(module + "_c512", width, tables["corr512"]),
            low_lut_module(module + "_c1024", width, tables["corr1024"]),
            low_lut_module(module + "_near_neg_low", width, tables["near_neg"]),
            low_lut_module(module + "_near_pos_low", width, tables["near_pos"]),
            bit12_v,
            bit11_v,
        ]
    )

    def model(index):
        return outputs[index]

    items = "casez_sign+bit11/12 run-cover plus direct semantic low{0} correction bits; table_items={1}; {2}; {3}".format(
        width,
        table_items,
        bit12_meta,
        bit11_meta,
    )
    return "\n".join(lines), items, model


def render_lowseq_hybrid(outputs, module, width):
    table_module = module + "_table"
    table_v, table_items, _ = render_sign_exp_mant_case(outputs, table_module)
    bit12_v, bit12_meta = render_bit_cover(outputs, module + "_bit12", 12, 8)
    bit11_v, bit11_meta = render_bit_cover(outputs, module + "_bit11", 11, 8)
    mask = (1 << width) - 1
    exp_sequences = {}
    for exp in range(1, 31):
        exp_sequences[exp] = tuple(outputs[(exp << 10) | mant] & mask for mant in range(MANT_SIZE))
    clusters = []
    exp_to_cluster = {}
    for exp in range(1, 31):
        seq = exp_sequences[exp]
        found = None
        for idx, item in enumerate(clusters):
            if item["seq"] == seq:
                found = idx
                break
        if found is None:
            found = len(clusters)
            clusters.append({"seq": seq, "exps": []})
        clusters[found]["exps"].append(exp)
        exp_to_cluster[exp] = found

    lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [15:0] out;",
        "  wire [15:0] table_out;",
        "  wire [5:0] sign_exp = in[15:10];",
        "  wire sign = in[15];",
        "  wire [4:0] exp = in[14:10];",
        "  wire [9:0] mant = in[9:0];",
        "  reg sign_out;",
        "  wire bit12_out;",
        "  wire bit11_out;",
        "  reg [{0}:0] low_bits;".format(width - 1),
        "  {0} u_table(.in(in), .out(table_out));".format(table_module),
        "  {0}_bit12 u_bit12(.in(in), .out_bit(bit12_out));".format(module),
        "  {0}_bit11 u_bit11(.in(in), .out_bit(bit11_out));".format(module),
    ]
    for idx in range(len(clusters)):
        lines.append("  wire [{0}:0] low_cluster_{1};".format(width - 1, idx))
        lines.append("  {0}_low_cluster_{1} u_low_cluster_{1}(.mant(mant), .value(low_cluster_{1}));".format(module, idx))
    render_casez_sign_lines(lines)
    lines.extend(
        [
            "  always @* begin",
            "    if (sign || exp == 5'd0 || exp == 5'd31) begin",
            "      low_bits = {0};".format(const_word(width, 0)),
            "    end else begin",
            "      case (exp)",
        ]
    )
    for exp in range(1, 31):
        lines.append("        5'd{0}: low_bits = low_cluster_{1};".format(exp, exp_to_cluster[exp]))
    lines.extend(
        [
            "        default: low_bits = {0};".format(const_word(width, 0)),
            "      endcase",
            "    end",
            "  end",
        ]
    )
    for bit in range(16):
        if bit == 15:
            lines.append("  assign out[15] = sign_out;")
        elif bit == 12:
            lines.append("  assign out[12] = bit12_out;")
        elif bit == 11:
            lines.append("  assign out[11] = bit11_out;")
        elif bit < width:
            lines.append("  assign out[{0}] = low_bits[{0}];".format(bit))
        else:
            lines.append("  assign out[{0}] = table_out[{0}];".format(bit))
    lines.extend(["endmodule", "", table_v, bit12_v, bit11_v])
    for idx, item in enumerate(clusters):
        lines.append(case_lut_module(module + "_low_cluster_" + str(idx), width, item["seq"]))
    cluster_note = "; ".join("c{0}=exp{1}".format(idx, ",".join(str(exp) for exp in item["exps"])) for idx, item in enumerate(clusters))

    def model(index):
        return outputs[index]

    items = "casez_sign+bit11/12 plus clustered low{0} exact sequences; clusters={1}; table_items={2}; {3}; {4}".format(
        width,
        cluster_note,
        table_items,
        bit12_meta,
        bit11_meta,
    )
    return "\n".join(lines), items, model


def run_variant(args, outputs, refs, variant, renderer):
    truth_path = args.benchmarks / "ex224.truth"
    case_dir = args.work_dir / CASE
    candidate_id = "{0}_{1}_{2}".format(CASE, LABEL, variant)
    module = candidate_id
    verilog_path = case_dir / "verilog" / (candidate_id + ".v")
    aig_path = case_dir / "aigs" / (candidate_id + ".aig")
    script_path = case_dir / "logs" / (candidate_id + ".ys")
    log_path = case_dir / "logs" / (candidate_id + ".yosys.log")
    row = {
        "case": CASE,
        "candidate_id": candidate_id,
        "hypothesis/function_guess": LABEL,
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
        "classification": "semantic_hybrid",
        "notes": "",
    }
    start = time.time()
    try:
        verilog, items, model = renderer(outputs, module)
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
                case=CASE,
                candidate_id=candidate_id,
                parent_id=LABEL,
                source="ai_verilog",
                tool_chain="yosys_fp16_log2_semantic_clustered",
                aig_path=aig_path,
                truth=truth_path,
                abc=args.abc,
                notes=items,
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
    print("{0} {1} eq={2} area={3} delay={4} adp={5}".format(CASE, variant, row["equivalent"], row["area"], row["delay"], row["adp"]))
    return row


def run(args):
    refs = load_reference(args.reference)
    truth_path = args.benchmarks / "ex224.truth"
    outputs = list(TruthTable(truth_path).iter_outputs())
    variants = [
        ("semantic_clustered_corr", lambda out, mod: render_clustered(out, mod)),
        ("semantic_clustered_fieldnear", lambda out, mod: render_clustered_fieldnear(out, mod)),
        ("semantic_clustered_fieldarith", lambda out, mod: render_clustered_fieldarith(out, mod)),
        ("semantic_clustered_derived_patch", lambda out, mod: render_clustered_derived_patch(out, mod)),
        ("semantic_partial_derive128", lambda out, mod: render_clustered_partial_patch(out, mod, derive128=True)),
        ("semantic_partial_derive256", lambda out, mod: render_clustered_partial_patch(out, mod, derive256=True)),
        ("semantic_partial_derive512", lambda out, mod: render_clustered_partial_patch(out, mod, derive512=True)),
        ("semantic_partial_derive128_256", lambda out, mod: render_clustered_partial_patch(out, mod, derive128=True, derive256=True)),
        ("semantic_partial_derive128_512", lambda out, mod: render_clustered_partial_patch(out, mod, derive128=True, derive512=True)),
        ("semantic_partial_derive256_512", lambda out, mod: render_clustered_partial_patch(out, mod, derive256=True, derive512=True)),
        ("field_exp_lut_mant_table", lambda out, mod: render_field_exp_mant_split(out, mod, exp_use_runs=False)),
        ("field_exp_run_mant_table", lambda out, mod: render_field_exp_mant_split(out, mod, exp_use_runs=True)),
        ("cluster_hybrid_low4", lambda out, mod: render_cluster_hybrid(out, mod, range(0, 4))),
        ("cluster_hybrid_low6", lambda out, mod: render_cluster_hybrid(out, mod, range(0, 6))),
        ("cluster_hybrid_low8", lambda out, mod: render_cluster_hybrid(out, mod, range(0, 8))),
        ("cluster_hybrid_low10", lambda out, mod: render_cluster_hybrid(out, mod, range(0, 10))),
        ("derived_cluster_hybrid_low2", lambda out, mod: render_derived_cluster_hybrid(out, mod, range(0, 2))),
        ("derived_cluster_hybrid_low4", lambda out, mod: render_derived_cluster_hybrid(out, mod, range(0, 4))),
        ("derived_cluster_hybrid_low6", lambda out, mod: render_derived_cluster_hybrid(out, mod, range(0, 6))),
        ("direct_low4", lambda out, mod: render_direct_lowbits_hybrid(out, mod, 4)),
        ("direct_low6", lambda out, mod: render_direct_lowbits_hybrid(out, mod, 6)),
        ("direct_low8", lambda out, mod: render_direct_lowbits_hybrid(out, mod, 8)),
        ("lowseq4", lambda out, mod: render_lowseq_hybrid(out, mod, 4)),
        ("lowseq5", lambda out, mod: render_lowseq_hybrid(out, mod, 5)),
        ("lowseq6", lambda out, mod: render_lowseq_hybrid(out, mod, 6)),
        ("lowseq7", lambda out, mod: render_lowseq_hybrid(out, mod, 7)),
        ("lowseq8", lambda out, mod: render_lowseq_hybrid(out, mod, 8)),
    ]
    if args.variants:
        wanted = {item.strip() for item in args.variants.split(",") if item.strip()}
        variants = [item for item in variants if item[0] in wanted]
    rows = [run_variant(args, outputs, refs, variant, renderer) for variant, renderer in variants]
    write_csv(args.results, RESULT_FIELDNAMES, rows)
    valid = [row for row in rows if row["equivalent"] == "1" and row["adp"]]
    best = []
    if valid:
        row = min(valid, key=lambda item: int(item["adp"]))
        best = [{name: row.get(name, "") for name in BEST_FIELDNAMES}]
    write_csv(args.best_results, BEST_FIELDNAMES, best)
    write_text(args.work_dir / CASE / "manifest.json", json.dumps({"case": CASE, "variants": rows}, indent=2) + "\n")
    return 0


def parse_args(argv=None):
    parser = argparse.ArgumentParser(description="Generate ex224 semantic clustered-correction log2 candidate.")
    parser.add_argument("--work-dir", type=Path, required=True)
    parser.add_argument("--results", type=Path, required=True)
    parser.add_argument("--best-results", type=Path, required=True)
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--reference", type=Path, default=ROOT / "reference_result.csv")
    parser.add_argument("--yosys", type=Path, default=ROOT / "student" / "tools" / "conda-env" / "bin" / "yosys")
    parser.add_argument("--abc", type=Path, default=ROOT / "student" / "abc")
    parser.add_argument("--timeout", type=int, default=900)
    parser.add_argument("--variants", default="")
    return parser.parse_args(argv)


def main(argv=None):
    return run(parse_args(argv))


if __name__ == "__main__":
    raise SystemExit(main())
