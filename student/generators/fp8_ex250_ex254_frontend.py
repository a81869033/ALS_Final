#!/usr/bin/env python3
"""Generate semantic frontend seeds for ex250-ex254.

This batch is not a plain FP8 add/conversion group.  Truth diagnostics show
packed low-precision dot/FMA operators feeding an E4M3FN-style FP8 result:

- ex250: two-lane FP4 E2M1 dot product, E4M3 output.
- ex251: two-lane signed 3-bit magnitude dot product, E4M3 output.
- ex252: four-lane unsigned 2-bit dot product, E4M3 output.
- ex253: unsigned 2-bit lane sum reduction times two, E4M3 output.
- ex254: E4M3 accumulator plus one FP4 E2M1 product.

Artifacts stay in student/work and student/runs/float_fp8.  This script does
not curate student/seeds.
"""

import argparse
import csv
import sys
import time
from bisect import bisect_left
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from student.backends.abc_flow import evaluate_aig
from student.frontends.yosys_synth import SynthError, run_command, yosys_quote
from student.frontends.truth import TruthTable
from student.generators.fp8_ex240_ex244_deep_struct import SYNTH_VARIANTS as BASE_SYNTH_VARIANTS
from student.generators.fp8_ex240_ex244_frontend import (
    BEST_FIELDNAMES,
    RESULT_FIELDNAMES,
    add_reference_columns,
    load_reference,
    rel_path,
    write_csv,
    write_text,
)
from student.generators.unknown_bdd_search import build_bdd, edge_expr
from student.generators.fp8_ex240_ex244_arith_struct import render_add_same_grs_diff_param8


CASES = ["ex250", "ex251", "ex252", "ex253", "ex254"]
CASE_LABELS = {
    "ex250": "packed_fp4_e2m1_dot2_to_e4m3",
    "ex251": "packed_int3_signmag_dot2_to_e4m3",
    "ex252": "packed_u2_dot4_to_e4m3",
    "ex253": "packed_u2_sum8_times2_to_e4m3",
    "ex254": "e4m3_accumulator_plus_fp4_e2m1_product",
}


def script_delay_target(verilog, module, output, delay, synth_preset=False):
    if synth_preset:
        return "\n".join(
            [
                "read_verilog {0}".format(yosys_quote(verilog)),
                "synth -top {0} -flatten".format(module),
                "abc -D {0} -g aig".format(delay),
                "aigmap",
                "opt",
                "clean",
                "write_aiger -symbols {0}".format(yosys_quote(output)),
            ]
        ) + "\n"
    return "\n".join(
        [
            "read_verilog {0}".format(yosys_quote(verilog)),
            "hierarchy -check -top {0}".format(module),
            "proc",
            "flatten",
            "tribuf -logic",
            "deminout",
            "opt",
            "memory",
            "opt",
            "techmap",
            "opt",
            "abc -D {0} -g aig".format(delay),
            "opt",
            "aigmap",
            "opt",
            "clean",
            "write_aiger -symbols {0}".format(yosys_quote(output)),
        ]
    ) + "\n"


SYNTH_VARIANTS = list(BASE_SYNTH_VARIANTS) + [
    ("abcD20_aig", lambda v, m, o: script_delay_target(v, m, o, 20, False)),
    ("abcD15_aig", lambda v, m, o: script_delay_target(v, m, o, 15, False)),
    ("synthD20_aig", lambda v, m, o: script_delay_target(v, m, o, 20, True)),
]


VARIANTS = [
    ("ex250", "semantic_fp4_dot2_prodtable_qcase", "FP4 E2M1 dot2, product LUT, exact q case"),
    ("ex250", "semantic_fp4_dot2_prodtable_qreachable_case", "FP4 E2M1 dot2, product LUT, reachable abs-sum q case"),
    ("ex250", "semantic_fp4_dot2_prodtable_qnorm", "FP4 E2M1 dot2, product LUT, semantic E4 normalizer"),
    ("ex250", "semantic_fp4_dot2_prodtable_qunrolled_norm", "FP4 E2M1 dot2, product LUT, unrolled fixed-bucket E4 normalizer"),
    ("ex250", "semantic_fp4_dot2_prodtable_qrange", "FP4 E2M1 dot2, product LUT, exact q range"),
    ("ex250", "semantic_fp4_dot2_magprod_qcase", "FP4 E2M1 dot2, 3-bit magnitude product table plus sign xor, exact q case"),
    ("ex250", "semantic_fp4_dot2_magprod_qrange", "FP4 E2M1 dot2, magnitude product table plus sign xor, exact q range"),
    ("ex250", "semantic_fp4_dot2_magprod_qunrolled_norm", "FP4 E2M1 dot2, magnitude product table plus sign xor, unrolled E4 normalizer"),
    ("ex250", "semantic_fp4_dot2_magarith_qcase", "FP4 E2M1 dot2, 3-bit magnitude decode plus unsigned multiply and sign xor, exact q case"),
    ("ex250", "semantic_fp4_dot2_arith_qcase", "FP4 E2M1 dot2, arithmetic products, exact q case"),
    ("ex251", "semantic_int3_dot2_prodtable_qcase", "signed 3-bit magnitude dot2, product LUT, exact q case"),
    ("ex251", "semantic_int3_dot2_prodtable_qnorm", "signed 3-bit magnitude dot2, product LUT, semantic E4 normalizer"),
    ("ex251", "semantic_int3_dot2_prodtable_qrange", "signed 3-bit magnitude dot2, product LUT, exact q range"),
    ("ex251", "semantic_int3_dot2_arith_qcase", "signed 3-bit magnitude dot2, arithmetic products, exact q case"),
    ("ex252", "semantic_u2_dot4_arith_qcase", "four unsigned 2-bit products, exact q case"),
    ("ex252", "semantic_u2_dot4_balanced_qcase", "balanced four-product unsigned 2-bit dot tree, exact q case"),
    ("ex252", "semantic_u2_dot4_balanced_qcase_parallel", "balanced u2 dot tree with parallel quant case hint"),
    ("ex252", "semantic_u2_dot4_balanced_threshold_fields", "balanced u2 dot tree with hand-derived threshold/field quantizer"),
    ("ex252", "semantic_u2_dot4_balanced_bitformula", "balanced u2 dot tree with minimized output-bit formulas"),
    ("ex252", "semantic_u2_dot4_partialpop_qcase", "u2 dot as weighted partial-product popcounts, exact q case"),
    ("ex252", "semantic_u2_dot4_handmul_balanced_qcase", "hand-written 2x2 product logic with balanced dot tree, exact q case"),
    ("ex252", "semantic_u2_dot4_arith_qnorm", "four unsigned 2-bit products, semantic E4 normalizer"),
    ("ex252", "semantic_u2_dot4_pairtable_qcase", "two 4-bit-pair dot tables, exact q case"),
    ("ex252", "semantic_u2_dot4_pairtable_qrange", "two 4-bit-pair dot tables, exact q range"),
    ("ex253", "semantic_u2_sum8_arith_qcase", "unsigned 2-bit lane sum times two, exact q case"),
    ("ex253", "semantic_u2_sum8_balanced_laneqcase", "balanced unsigned 2-bit lane sum tree, reachable lane-sum q case"),
    ("ex253", "semantic_u2_sum8_balanced_laneqcase_parallel", "balanced lane sum tree with parallel quant case hint"),
    ("ex253", "semantic_u2_sum8_balanced_threshold_fields", "balanced lane sum tree with hand-derived threshold/field quantizer"),
    ("ex253", "semantic_u2_sum8_popcount_laneqcase", "lane sum as low/high bit popcounts, reachable lane-sum q case"),
    ("ex253", "semantic_u2_sum8_popcount_threshold_fields", "lane sum as low/high bit popcounts with threshold/field quantizer"),
    ("ex253", "semantic_u2_sum8_popcount_2dcase", "low/high bit popcounts with direct 2D quant table, no final lane-sum adder"),
    ("ex253", "semantic_u2_sum8_popcount_bitformula", "low/high bit popcounts with minimized output-bit formulas"),
    ("ex253", "semantic_u2_sum8_arith_qnorm", "unsigned 2-bit lane sum times two, semantic E4 normalizer"),
    ("ex253", "semantic_u2_sum8_arith_laneqcase", "unsigned 2-bit lane sum times two, reachable lane-sum q case"),
    ("ex253", "semantic_u2_sum8_bytetable_qcase", "byte lane-sum tables, exact q case"),
    ("ex253", "semantic_u2_sum8_bytetable_qrange", "byte lane-sum tables, exact q range"),
    ("ex254", "semantic_e4acc_fp4prod_prodtable_qrange", "E4M3 accumulator plus FP4 product table, exact q range"),
    ("ex254", "semantic_e4acc_fp4prod_prodtable_qnorm", "E4M3 accumulator plus FP4 product table, semantic E4 normalizer"),
    ("ex254", "semantic_e4acc_fp4prod_prodtable_qcase", "E4M3 accumulator plus FP4 product table, reachable-value q case"),
    ("ex254", "semantic_e4acc_fp4prod_arith_qrange", "E4M3 accumulator plus arithmetic FP4 product, exact q range"),
    ("ex254", "semantic_e4acc_fp4prod_nested_acc_table", "FP4 product key with nested E4 accumulator remap table"),
    ("ex254", "semantic_e4add_fp4product_grs", "convert FP4 product to E4M3 then reuse compact E4 add GRS RTL"),
    ("ex254", "semantic_e4add_fp4product_grs_magfactored", "factor FP4 product-to-E4 as magnitude table plus sign before compact E4 add GRS RTL"),
    ("ex250", "struct_bdd_lane_pair_order", "shared BDD with paired FP4-lane variable order after semantic diagnosis"),
    ("ex253", "struct_bdd_u2_lane_order", "shared BDD with 2-bit lane variable order after semantic diagnosis"),
    ("ex254", "struct_bdd_acc_product_order", "shared BDD with product-byte then accumulator order after semantic diagnosis"),
]


class E4M3FN:
    def __init__(self):
        self.k = [0] * 128
        self.nan = [False] * 128
        for code in range(128):
            exp = (code >> 3) & 0xF
            mant = code & 0x7
            if exp == 0xF and mant == 0x7:
                self.nan[code] = True
            elif exp == 0:
                self.k[code] = mant
            else:
                self.k[code] = (8 + mant) << (exp - 1)
        self.pos = [(self.k[code], code) for code in range(1, 0x7F) if not self.nan[code]]
        self.pos_k = [item[0] for item in self.pos]

    def quant_mag(self, value):
        if value <= 0:
            return 0
        best = (value * 4, 0, 0)
        best_code = 0
        idx = bisect_left(self.pos_k, value)
        for pos in range(max(0, idx - 12), min(len(self.pos), idx + 14)):
            point, code = self.pos[pos]
            diff = abs(value - point)
            key = (diff * 2, code & 1, code)
            if key < best:
                best = key
                best_code = code
        return best_code


E4 = E4M3FN()


def fp4_e2m1_value(nibble):
    mag = nibble & 0x7
    exp = (mag >> 1) & 0x3
    mant = mag & 0x1
    value = mant if exp == 0 else (2 + mant) << (exp - 1)
    return -value if nibble & 0x8 else value


def int3_value(nibble):
    value = nibble & 0x7
    return -value if nibble & 0x8 else value


def q_scaled(value):
    return E4.quant_mag(abs(value) * 128)


def q_k(value):
    return E4.quant_mag(abs(value))


def runs_for_values(values):
    runs = []
    start = 0
    current = values[0]
    for idx, value in enumerate(values[1:], 1):
        if value != current:
            runs.append((start, idx - 1, current))
            start = idx
            current = value
    runs.append((start, len(values) - 1, current))
    return runs


def render_q_scaled_case(name, max_value):
    lines = []
    for value in range(max_value + 1):
        lines.append("        10'd{0}: {1} = 7'h{2:02x};".format(value, name, q_scaled(value)))
    return """  function [6:0] @NAME@;
    input [9:0] value;
    begin
      case (value)
@LINES@
        default: @NAME@ = 7'h7e;
      endcase
    end
  endfunction
""".replace("@NAME@", name).replace("@LINES@", "\n".join(lines))


def possible_dot2_abs_sums(value_fn):
    products = [value_fn(left) * value_fn(right) for left in range(16) for right in range(16)]
    return sorted({abs(left + right) for left in products for right in products})


def render_q_scaled_values_case(name, possible_values):
    lines = []
    for value in possible_values:
        lines.append("        10'd{0}: {1} = 7'h{2:02x};".format(value, name, q_scaled(value)))
    return """  function [6:0] @NAME@;
    input [9:0] value;
    begin
      case (value)
@LINES@
        default: @NAME@ = 7'h00;
      endcase
    end
  endfunction
""".replace("@NAME@", name).replace("@LINES@", "\n".join(lines))


def render_q_scaled_range(name, max_value):
    values = [q_scaled(value) for value in range(max_value + 1)]
    lines = []
    for index, (_start, end, code) in enumerate(runs_for_values(values)):
        prefix = "if" if index == 0 else "else if"
        lines.append("      {0} (value <= 10'd{1}) {2} = 7'h{3:02x};".format(prefix, end, name, code))
    lines.append("      else {0} = 7'h7e;".format(name))
    return """  function [6:0] @NAME@;
    input [9:0] value;
    begin
@LINES@
    end
  endfunction
""".replace("@NAME@", name).replace("@LINES@", "\n".join(lines))


def render_q_scaled_norm(name):
    return """  function [6:0] @NAME@;
    input [9:0] value;
    reg [3:0] lead;
    reg [3:0] exp;
    reg [3:0] sig;
    reg [3:0] base;
    reg [9:0] rem;
    reg [9:0] half;
    reg round_up;
    reg [3:0] shift;
    begin
      if (value == 10'd0) begin
        @NAME@ = 7'h00;
      end else begin
        if (value[9]) lead = 4'd9;
        else if (value[8]) lead = 4'd8;
        else if (value[7]) lead = 4'd7;
        else if (value[6]) lead = 4'd6;
        else if (value[5]) lead = 4'd5;
        else if (value[4]) lead = 4'd4;
        else if (value[3]) lead = 4'd3;
        else if (value[2]) lead = 4'd2;
        else if (value[1]) lead = 4'd1;
        else lead = 4'd0;
        exp = lead + 4'd5;
        if (lead >= 4'd3) begin
          shift = lead - 4'd3;
          base = value >> shift;
          if (shift == 4'd0) begin
            round_up = 1'b0;
          end else begin
            rem = value - ({6'd0, base} << shift);
            half = 10'd1 << (shift - 4'd1);
            round_up = (rem > half) || ((rem == half) && base[0]);
          end
        end else begin
          shift = 4'd3 - lead;
          base = value << shift;
          round_up = 1'b0;
        end
        sig = base + {3'd0, round_up};
        if (sig == 4'd0) begin
          exp = exp + 4'd1;
          sig = 4'd8;
        end
        @NAME@ = {exp[3:0], sig[2:0]};
      end
    end
  endfunction
""".replace("@NAME@", name)


def render_q_scaled_unrolled_norm(name):
    return """  function [6:0] @NAME@;
    input [9:0] value;
    reg [3:0] exp;
    reg [4:0] sig;
    reg round_up;
    begin
      if (value == 10'd0) begin
        @NAME@ = 7'h00;
      end else if (value < 10'd2) begin
        @NAME@ = 7'h28;
      end else if (value < 10'd4) begin
        @NAME@ = value[0] ? 7'h34 : 7'h30;
      end else if (value < 10'd8) begin
        @NAME@ = 7'h38 | {4'd0, value[1:0], 1'b0};
      end else if (value < 10'd16) begin
        @NAME@ = 7'h40 | {4'd0, value[2:0]};
      end else begin
        if (value < 10'd32) begin
          exp = 4'd9;
          round_up = value[0] && value[1];
          sig = {1'b0, value[4:1]} + {4'd0, round_up};
        end else if (value < 10'd64) begin
          exp = 4'd10;
          round_up = (value[1:0] > 2'd2) || ((value[1:0] == 2'd2) && value[2]);
          sig = {1'b0, value[5:2]} + {4'd0, round_up};
        end else if (value < 10'd128) begin
          exp = 4'd11;
          round_up = (value[2:0] > 3'd4) || ((value[2:0] == 3'd4) && value[3]);
          sig = {1'b0, value[6:3]} + {4'd0, round_up};
        end else if (value < 10'd256) begin
          exp = 4'd12;
          round_up = (value[3:0] > 4'd8) || ((value[3:0] == 4'd8) && value[4]);
          sig = {1'b0, value[7:4]} + {4'd0, round_up};
        end else begin
          exp = 4'd13;
          round_up = (value[4:0] > 5'd16) || ((value[4:0] == 5'd16) && value[5]);
          sig = {1'b0, value[8:5]} + {4'd0, round_up};
        end
        if (sig[4]) begin
          @NAME@ = {exp + 4'd1, 3'd0};
        end else begin
          @NAME@ = {exp, sig[2:0]};
        end
      end
    end
  endfunction
""".replace("@NAME@", name)


def e4_k_range_lines(name, max_value):
    values = [q_k(value) for value in range(max_value + 1)]
    lines = []
    for index, (_start, end, code) in enumerate(runs_for_values(values)):
        prefix = "if" if index == 0 else "else if"
        lines.append("      {0} (value <= 19'd{1}) {2} = 7'h{3:02x};".format(prefix, end, name, code))
    lines.append("      else {0} = 7'h7e;".format(name))
    return lines


def render_q_k_range(name, max_value):
    return """  function [6:0] @NAME@;
    input [18:0] value;
    begin
@LINES@
    end
  endfunction
""".replace("@NAME@", name).replace("@LINES@", "\n".join(e4_k_range_lines(name, max_value)))


def render_q_k_case(name, possible_values):
    lines = []
    for value in sorted(possible_values):
        lines.append("        19'd{0}: {1} = 7'h{2:02x};".format(value, name, q_k(value)))
    return """  function [6:0] @NAME@;
    input [18:0] value;
    begin
      case (value)
@LINES@
        default: @NAME@ = 7'h00;
      endcase
    end
  endfunction
""".replace("@NAME@", name).replace("@LINES@", "\n".join(lines))


def render_q_k_norm(name):
    return """  function [6:0] @NAME@;
    input [18:0] value;
    reg [4:0] lead;
    reg [4:0] exp;
    reg [3:0] sig;
    reg [3:0] base;
    reg [18:0] rem;
    reg [18:0] half;
    reg round_up;
    reg [4:0] shift;
    begin
      if (value == 19'd0) begin
        @NAME@ = 7'h00;
      end else if (value <= 19'd7) begin
        @NAME@ = value[6:0];
      end else begin
        if (value[18]) lead = 5'd18;
        else if (value[17]) lead = 5'd17;
        else if (value[16]) lead = 5'd16;
        else if (value[15]) lead = 5'd15;
        else if (value[14]) lead = 5'd14;
        else if (value[13]) lead = 5'd13;
        else if (value[12]) lead = 5'd12;
        else if (value[11]) lead = 5'd11;
        else if (value[10]) lead = 5'd10;
        else if (value[9]) lead = 5'd9;
        else if (value[8]) lead = 5'd8;
        else if (value[7]) lead = 5'd7;
        else if (value[6]) lead = 5'd6;
        else if (value[5]) lead = 5'd5;
        else if (value[4]) lead = 5'd4;
        else if (value[3]) lead = 5'd3;
        else lead = 5'd2;
        exp = lead - 5'd2;
        shift = lead - 5'd3;
        base = value >> shift;
        if (shift == 5'd0) begin
          round_up = 1'b0;
        end else begin
          rem = value - ({15'd0, base} << shift);
          half = 19'd1 << (shift - 5'd1);
          round_up = (rem > half) || ((rem == half) && base[0]);
        end
        sig = base + {3'd0, round_up};
        if (sig == 4'd0) begin
          exp = exp + 5'd1;
          sig = 4'd8;
        end
        if ((exp > 5'd15) || ((exp == 5'd15) && (sig[2:0] >= 3'd7))) begin
          @NAME@ = 7'h7e;
        end else begin
          @NAME@ = {exp[3:0], sig[2:0]};
        end
      end
    end
  endfunction
""".replace("@NAME@", name)


def common_fp4_value():
    return """  function signed [4:0] fp4_value;
    input [3:0] x;
    reg [3:0] mag;
    reg signed [4:0] value;
    begin
      mag = x[2:0];
      case (mag)
        3'd0: value = 5'sd0;
        3'd1: value = 5'sd1;
        3'd2: value = 5'sd2;
        3'd3: value = 5'sd3;
        3'd4: value = 5'sd4;
        3'd5: value = 5'sd6;
        3'd6: value = 5'sd8;
        default: value = 5'sd12;
      endcase
      fp4_value = x[3] ? -value : value;
    end
  endfunction

  function fp4_neg_zero_product;
    input [3:0] a;
    input [3:0] b;
    begin
      fp4_neg_zero_product = ((a[2:0] == 3'd0) || (b[2:0] == 3'd0)) && (a[3] ^ b[3]);
    end
  endfunction
"""


def common_int3_value():
    return """  function signed [3:0] int3_value;
    input [3:0] x;
    reg signed [3:0] value;
    begin
      value = {1'b0, x[2:0]};
      int3_value = x[3] ? -value : value;
    end
  endfunction

  function int3_neg_zero_product;
    input [3:0] a;
    input [3:0] b;
    begin
      int3_neg_zero_product = ((a[2:0] == 3'd0) || (b[2:0] == 3'd0)) && (a[3] ^ b[3]);
    end
  endfunction
"""


def product_table(value_fn, func_name, width):
    lines = []
    for left in range(16):
        for right in range(16):
            product = value_fn(left) * value_fn(right)
            bits = (product + (1 << width)) & ((1 << width) - 1) if product < 0 else product
            lines.append("        8'h{0:02x}: {1} = {2}'sh{3:0{4}x};".format((left << 4) | right, func_name, width, bits, (width + 3) // 4))
    return """  function signed [@HI@:0] @NAME@;
    input [3:0] a;
    input [3:0] b;
    begin
      case ({a, b})
@LINES@
        default: @NAME@ = {WIDTH}'sd0;
      endcase
    end
  endfunction
""".replace("@NAME@", func_name).replace("@HI@", str(width - 1)).replace("@LINES@", "\n".join(lines)).replace("{WIDTH}", str(width))


def render_dot2(case, module, kind, q_style, product_style):
    if kind == "fp4":
        common = common_fp4_value()
        value_fn = "fp4_value"
        neg_fn = "fp4_neg_zero_product"
        value_py = fp4_e2m1_value
        width = 10
        max_sum = 288
        table = product_table(value_py, "lane_product", width) if product_style == "prodtable" else ""
    else:
        common = common_int3_value()
        value_fn = "int3_value"
        neg_fn = "int3_neg_zero_product"
        value_py = int3_value
        width = 9
        max_sum = 98
        table = product_table(value_py, "lane_product", width) if product_style == "prodtable" else ""
    if q_style == "qnorm":
        quant = render_q_scaled_norm("quant_scaled")
    elif q_style == "qunrolled_norm":
        quant = render_q_scaled_unrolled_norm("quant_scaled")
    elif q_style == "qreachable_case":
        quant = render_q_scaled_values_case("quant_scaled", possible_dot2_abs_sums(value_py))
    elif q_style == "qcase":
        quant = render_q_scaled_case("quant_scaled", max_sum)
    else:
        quant = render_q_scaled_range("quant_scaled", max_sum)
    if product_style == "prodtable":
        prod_hi = "lane_product(ah, bh)"
        prod_lo = "lane_product(al, bl)"
    else:
        prod_hi = "$signed({0}(ah)) * $signed({0}(bh))".format(value_fn)
        prod_lo = "$signed({0}(al)) * $signed({0}(bl))".format(value_fn)
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [3:0] ah = in[15:12];
  wire [3:0] al = in[11:8];
  wire [3:0] bh = in[7:4];
  wire [3:0] bl = in[3:0];
@COMMON@
@TABLE@
@QUANT@
  wire signed [10:0] prod_hi = @PROD_HI@;
  wire signed [10:0] prod_lo = @PROD_LO@;
  wire signed [10:0] sum = prod_hi + prod_lo;
  wire negative = sum < 0;
  wire signed [10:0] neg_sum = -sum;
  wire [9:0] abs_sum = negative ? neg_sum[9:0] : sum[9:0];
  wire neg_zero = (sum == 11'sd0) && @NEG_FN@(ah, bh) && @NEG_FN@(al, bl);
  assign out = {negative || neg_zero, quant_scaled(abs_sum)};
endmodule
""".replace("@MODULE@", module).replace("@COMMON@", common).replace("@TABLE@", table).replace("@QUANT@", quant).replace("@PROD_HI@", prod_hi).replace("@PROD_LO@", prod_lo).replace("@NEG_FN@", neg_fn)


def render_fp4_dot2_magprod(module, q_style):
    mag_lines = []
    for left in range(8):
        for right in range(8):
            product = abs(fp4_e2m1_value(left)) * abs(fp4_e2m1_value(right))
            mag_lines.append("        6'h{0:02x}: fp4_mag_product = 8'd{1};".format((left << 3) | right, product))
    if q_style == "qrange":
        quant = render_q_scaled_range("quant_scaled", 288)
    elif q_style == "qunrolled_norm":
        quant = render_q_scaled_unrolled_norm("quant_scaled")
    else:
        quant = render_q_scaled_case("quant_scaled", 288)
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [3:0] ah = in[15:12];
  wire [3:0] al = in[11:8];
  wire [3:0] bh = in[7:4];
  wire [3:0] bl = in[3:0];

  function [7:0] fp4_mag_product;
    input [2:0] a;
    input [2:0] b;
    begin
      case ({a, b})
@MAG_LINES@
        default: fp4_mag_product = 8'd0;
      endcase
    end
  endfunction

  function signed [10:0] signed_product;
    input [3:0] a;
    input [3:0] b;
    reg [7:0] mag_product;
    begin
      mag_product = fp4_mag_product(a[2:0], b[2:0]);
      signed_product = (a[3] ^ b[3]) ? -$signed({3'd0, mag_product}) : $signed({3'd0, mag_product});
    end
  endfunction

  function fp4_neg_zero_product;
    input [3:0] a;
    input [3:0] b;
    begin
      fp4_neg_zero_product = ((a[2:0] == 3'd0) || (b[2:0] == 3'd0)) && (a[3] ^ b[3]);
    end
  endfunction

@QUANT@
  wire signed [10:0] prod_hi = signed_product(ah, bh);
  wire signed [10:0] prod_lo = signed_product(al, bl);
  wire signed [10:0] sum = prod_hi + prod_lo;
  wire negative = sum < 0;
  wire signed [10:0] neg_sum = -sum;
  wire [9:0] abs_sum = negative ? neg_sum[9:0] : sum[9:0];
  wire neg_zero = (sum == 11'sd0) && fp4_neg_zero_product(ah, bh) && fp4_neg_zero_product(al, bl);
  assign out = {negative || neg_zero, quant_scaled(abs_sum)};
endmodule
""".replace("@MODULE@", module).replace("@MAG_LINES@", "\n".join(mag_lines)).replace("@QUANT@", quant)


def render_fp4_dot2_magarith_qcase(module):
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [3:0] ah = in[15:12];
  wire [3:0] al = in[11:8];
  wire [3:0] bh = in[7:4];
  wire [3:0] bl = in[3:0];

  function [3:0] fp4_mag_value;
    input [2:0] x;
    begin
      case (x)
        3'd0: fp4_mag_value = 4'd0;
        3'd1: fp4_mag_value = 4'd1;
        3'd2: fp4_mag_value = 4'd2;
        3'd3: fp4_mag_value = 4'd3;
        3'd4: fp4_mag_value = 4'd4;
        3'd5: fp4_mag_value = 4'd6;
        3'd6: fp4_mag_value = 4'd8;
        default: fp4_mag_value = 4'd12;
      endcase
    end
  endfunction

  function signed [10:0] signed_product;
    input [3:0] a;
    input [3:0] b;
    reg [7:0] mag_product;
    begin
      mag_product = fp4_mag_value(a[2:0]) * fp4_mag_value(b[2:0]);
      signed_product = (a[3] ^ b[3]) ? -$signed({3'd0, mag_product}) : $signed({3'd0, mag_product});
    end
  endfunction

  function fp4_neg_zero_product;
    input [3:0] a;
    input [3:0] b;
    begin
      fp4_neg_zero_product = ((a[2:0] == 3'd0) || (b[2:0] == 3'd0)) && (a[3] ^ b[3]);
    end
  endfunction

@QUANT@
  wire signed [10:0] prod_hi = signed_product(ah, bh);
  wire signed [10:0] prod_lo = signed_product(al, bl);
  wire signed [10:0] sum = prod_hi + prod_lo;
  wire negative = sum < 0;
  wire signed [10:0] neg_sum = -sum;
  wire [9:0] abs_sum = negative ? neg_sum[9:0] : sum[9:0];
  wire neg_zero = (sum == 11'sd0) && fp4_neg_zero_product(ah, bh) && fp4_neg_zero_product(al, bl);
  assign out = {negative || neg_zero, quant_scaled(abs_sum)};
endmodule
""".replace("@MODULE@", module).replace("@QUANT@", render_q_scaled_case("quant_scaled", 288))


def render_u2_dot4(module, q_style, pairtable):
    if q_style == "qnorm":
        quant = render_q_scaled_norm("quant_scaled")
    elif q_style == "qcase":
        quant = render_q_scaled_case("quant_scaled", 36)
    else:
        quant = render_q_scaled_range("quant_scaled", 36)
    if pairtable:
        lines = []
        for left in range(16):
            for right in range(16):
                value = (left & 0x3) * (right & 0x3) + ((left >> 2) & 0x3) * ((right >> 2) & 0x3)
                lines.append("        8'h{0:02x}: pair_dot = 6'd{1};".format((left << 4) | right, value))
        body = """  function [5:0] pair_dot;
    input [3:0] a;
    input [3:0] b;
    begin
      case ({a, b})
@LINES@
        default: pair_dot = 6'd0;
      endcase
    end
  endfunction

  wire [5:0] low_sum = pair_dot(in[11:8], in[3:0]);
  wire [5:0] high_sum = pair_dot(in[15:12], in[7:4]);
  wire [5:0] dot_sum = low_sum + high_sum;
""".replace("@LINES@", "\n".join(lines))
    else:
        terms = []
        for shift in (0, 2, 4, 6):
            terms.append("({4'd0, in[%d:%d]} * {4'd0, in[%d:%d]})" % (8 + shift + 1, 8 + shift, shift + 1, shift))
        body = "  wire [5:0] dot_sum = " + " + ".join(terms) + ";\n"
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
@BODY@
@QUANT@
  assign out = {1'b0, quant_scaled({4'd0, dot_sum})};
endmodule
""".replace("@MODULE@", module).replace("@BODY@", body).replace("@QUANT@", quant)


def render_u2_dot4_balanced(module, parallel=False):
    quant = render_q_scaled_case("quant_scaled", 36)
    if parallel:
        quant = quant.replace("      case (value)", "      (* parallel_case, full_case *) case (value)")
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [1:0] a0 = in[9:8];
  wire [1:0] a1 = in[11:10];
  wire [1:0] a2 = in[13:12];
  wire [1:0] a3 = in[15:14];
  wire [1:0] b0 = in[1:0];
  wire [1:0] b1 = in[3:2];
  wire [1:0] b2 = in[5:4];
  wire [1:0] b3 = in[7:6];
  wire [3:0] p0 = a0 * b0;
  wire [3:0] p1 = a1 * b1;
  wire [3:0] p2 = a2 * b2;
  wire [3:0] p3 = a3 * b3;
  wire [4:0] s01 = {1'b0, p0} + {1'b0, p1};
  wire [4:0] s23 = {1'b0, p2} + {1'b0, p3};
  wire [5:0] dot_sum = {1'b0, s01} + {1'b0, s23};
@QUANT@
  assign out = {1'b0, quant_scaled({4'd0, dot_sum})};
endmodule
""".replace("@MODULE@", module).replace("@QUANT@", quant)


def render_u2_dot4_balanced_threshold_fields(module):
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [1:0] a0 = in[9:8];
  wire [1:0] a1 = in[11:10];
  wire [1:0] a2 = in[13:12];
  wire [1:0] a3 = in[15:14];
  wire [1:0] b0 = in[1:0];
  wire [1:0] b1 = in[3:2];
  wire [1:0] b2 = in[5:4];
  wire [1:0] b3 = in[7:6];
  wire [3:0] p0 = a0 * b0;
  wire [3:0] p1 = a1 * b1;
  wire [3:0] p2 = a2 * b2;
  wire [3:0] p3 = a3 * b3;
  wire [4:0] s01 = {1'b0, p0} + {1'b0, p1};
  wire [4:0] s23 = {1'b0, p2} + {1'b0, p3};
  wire [5:0] dot_sum = {1'b0, s01} + {1'b0, s23};

  function [6:0] quant_dot_sum;
    input [5:0] value;
    begin
      if (value == 6'd0) begin
        quant_dot_sum = 7'h00;
      end else if (value == 6'd1) begin
        quant_dot_sum = 7'h28;
      end else if (value < 6'd4) begin
        quant_dot_sum = value[0] ? 7'h34 : 7'h30;
      end else if (value < 6'd8) begin
        quant_dot_sum = 7'h38 | {4'd0, value[1:0], 1'b0};
      end else if (value < 6'd16) begin
        quant_dot_sum = 7'h40 | {4'd0, value[2:0]};
      end else begin
        case (value)
          6'd16: quant_dot_sum = 7'h48;
          6'd17: quant_dot_sum = 7'h48;
          6'd18: quant_dot_sum = 7'h49;
          6'd19: quant_dot_sum = 7'h4a;
          6'd20: quant_dot_sum = 7'h4a;
          6'd21: quant_dot_sum = 7'h4a;
          6'd22: quant_dot_sum = 7'h4b;
          6'd23: quant_dot_sum = 7'h4c;
          6'd24: quant_dot_sum = 7'h4c;
          6'd25: quant_dot_sum = 7'h4c;
          6'd26: quant_dot_sum = 7'h4d;
          6'd27: quant_dot_sum = 7'h4e;
          6'd28: quant_dot_sum = 7'h4e;
          6'd29: quant_dot_sum = 7'h4e;
          6'd30: quant_dot_sum = 7'h4f;
          6'd31: quant_dot_sum = 7'h50;
          6'd32: quant_dot_sum = 7'h50;
          6'd33: quant_dot_sum = 7'h50;
          6'd34: quant_dot_sum = 7'h50;
          6'd35: quant_dot_sum = 7'h51;
          default: quant_dot_sum = 7'h51;
        endcase
      end
    end
  endfunction

  assign out = {1'b0, quant_dot_sum(dot_sum)};
endmodule
""".replace("@MODULE@", module)


def render_u2_dot4_balanced_bitformula(module):
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [1:0] a0 = in[9:8];
  wire [1:0] a1 = in[11:10];
  wire [1:0] a2 = in[13:12];
  wire [1:0] a3 = in[15:14];
  wire [1:0] b0 = in[1:0];
  wire [1:0] b1 = in[3:2];
  wire [1:0] b2 = in[5:4];
  wire [1:0] b3 = in[7:6];
  wire [3:0] p0 = a0 * b0;
  wire [3:0] p1 = a1 * b1;
  wire [3:0] p2 = a2 * b2;
  wire [3:0] p3 = a3 * b3;
  wire [4:0] s01 = {1'b0, p0} + {1'b0, p1};
  wire [4:0] s23 = {1'b0, p2} + {1'b0, p3};
  wire [5:0] dot_sum = {1'b0, s01} + {1'b0, s23};
  wire d0 = dot_sum[0];
  wire d1 = dot_sum[1];
  wire d2 = dot_sum[2];
  wire d3 = dot_sum[3];
  wire d4 = dot_sum[4];
  wire d5 = dot_sum[5];
  wire [6:0] mag;
  assign mag[0] = (d5 & d1 & d0) | (d5 & d2) | (~d4 & d3 & d0) | (d4 & d1 & ~d0);
  assign mag[1] = (~d4 & d3 & d1) | (d4 & ~d2 & d1 & d0) | (d4 & d2 & ~d0) | (d4 & d2 & ~d1) | (~d4 & ~d3 & d2 & d0);
  assign mag[2] = (~d5 & ~d4 & ~d3 & d1 & d0) | (~d4 & d2 & d1) | (~d3 & d2 & d1 & d0) | (d4 & d3 & ~d2) | (d3 & d2 & ~d1) | (d3 & d2 & ~d0);
  assign mag[3] = (~d5 & ~d3 & ~d1 & d0) | (~d5 & ~d3 & d2) | (d4 & ~d2) | (d4 & ~d1) | (d4 & ~d0);
  assign mag[4] = d5 | (~d4 & ~d3 & d1) | (~d4 & ~d3 & d2) | (d4 & d3 & d2 & d1 & d0);
  assign mag[5] = (~d5 & ~d4 & ~d3 & d0) | (~d5 & ~d4 & ~d3 & d1) | (~d5 & ~d4 & ~d3 & d2);
  assign mag[6] = d3 | d4 | d5;
  assign out = {1'b0, mag};
endmodule
""".replace("@MODULE@", module)


def render_u2_dot4_partialpop_qcase(module):
    quant = render_q_scaled_case("quant_scaled", 36)
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [1:0] a0 = in[9:8];
  wire [1:0] a1 = in[11:10];
  wire [1:0] a2 = in[13:12];
  wire [1:0] a3 = in[15:14];
  wire [1:0] b0 = in[1:0];
  wire [1:0] b1 = in[3:2];
  wire [1:0] b2 = in[5:4];
  wire [1:0] b3 = in[7:6];

  wire [3:0] pp0 = {a3[0] & b3[0], a2[0] & b2[0], a1[0] & b1[0], a0[0] & b0[0]};
  wire [7:0] pp1 = {
    a3[1] & b3[0], a3[0] & b3[1],
    a2[1] & b2[0], a2[0] & b2[1],
    a1[1] & b1[0], a1[0] & b1[1],
    a0[1] & b0[0], a0[0] & b0[1]
  };
  wire [3:0] pp2 = {a3[1] & b3[1], a2[1] & b2[1], a1[1] & b1[1], a0[1] & b0[1]};

  wire [1:0] pp0_01 = {1'b0, pp0[0]} + {1'b0, pp0[1]};
  wire [1:0] pp0_23 = {1'b0, pp0[2]} + {1'b0, pp0[3]};
  wire [2:0] c0 = {1'b0, pp0_01} + {1'b0, pp0_23};

  wire [1:0] pp2_01 = {1'b0, pp2[0]} + {1'b0, pp2[1]};
  wire [1:0] pp2_23 = {1'b0, pp2[2]} + {1'b0, pp2[3]};
  wire [2:0] c2 = {1'b0, pp2_01} + {1'b0, pp2_23};

  wire [1:0] pp1_01 = {1'b0, pp1[0]} + {1'b0, pp1[1]};
  wire [1:0] pp1_23 = {1'b0, pp1[2]} + {1'b0, pp1[3]};
  wire [1:0] pp1_45 = {1'b0, pp1[4]} + {1'b0, pp1[5]};
  wire [1:0] pp1_67 = {1'b0, pp1[6]} + {1'b0, pp1[7]};
  wire [2:0] pp1_0123 = {1'b0, pp1_01} + {1'b0, pp1_23};
  wire [2:0] pp1_4567 = {1'b0, pp1_45} + {1'b0, pp1_67};
  wire [3:0] c1 = {1'b0, pp1_0123} + {1'b0, pp1_4567};

  wire [5:0] dot_sum = {3'd0, c0} + {1'd0, c1, 1'b0} + {c2, 2'b00};
@QUANT@
  assign out = {1'b0, quant_scaled({4'd0, dot_sum})};
endmodule
""".replace("@MODULE@", module).replace("@QUANT@", quant)


def render_u2_dot4_handmul_balanced_qcase(module):
    quant = render_q_scaled_case("quant_scaled", 36)
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [1:0] a0 = in[9:8];
  wire [1:0] a1 = in[11:10];
  wire [1:0] a2 = in[13:12];
  wire [1:0] a3 = in[15:14];
  wire [1:0] b0 = in[1:0];
  wire [1:0] b1 = in[3:2];
  wire [1:0] b2 = in[5:4];
  wire [1:0] b3 = in[7:6];

  function [3:0] u2_product;
    input [1:0] a;
    input [1:0] b;
    reg pp0;
    reg pp1a;
    reg pp1b;
    reg pp2;
    reg [1:0] mid;
    reg [1:0] high;
    begin
      pp0 = a[0] & b[0];
      pp1a = a[1] & b[0];
      pp1b = a[0] & b[1];
      pp2 = a[1] & b[1];
      mid = {1'b0, pp1a} + {1'b0, pp1b};
      high = {1'b0, pp2} + {1'b0, mid[1]};
      u2_product = {high[1], high[0], mid[0], pp0};
    end
  endfunction

  wire [3:0] p0 = u2_product(a0, b0);
  wire [3:0] p1 = u2_product(a1, b1);
  wire [3:0] p2 = u2_product(a2, b2);
  wire [3:0] p3 = u2_product(a3, b3);
  wire [4:0] s01 = {1'b0, p0} + {1'b0, p1};
  wire [4:0] s23 = {1'b0, p2} + {1'b0, p3};
  wire [5:0] dot_sum = {1'b0, s01} + {1'b0, s23};
@QUANT@
  assign out = {1'b0, quant_scaled({4'd0, dot_sum})};
endmodule
""".replace("@MODULE@", module).replace("@QUANT@", quant)


def render_u2_sum8(module, q_style, bytetable):
    if q_style == "qnorm":
        quant = render_q_scaled_norm("quant_scaled")
    elif q_style == "qcase":
        quant = render_q_scaled_case("quant_scaled", 48)
    else:
        quant = render_q_scaled_range("quant_scaled", 48)
    if bytetable:
        lines = []
        for value in range(256):
            lane_sum = sum((value >> shift) & 0x3 for shift in (0, 2, 4, 6))
            lines.append("        8'h{0:02x}: byte_sum = 5'd{1};".format(value, lane_sum))
        body = """  function [4:0] byte_sum;
    input [7:0] value;
    begin
      case (value)
@LINES@
        default: byte_sum = 5'd0;
      endcase
    end
  endfunction

  wire [5:0] lane_sum = {1'b0, byte_sum(in[15:8])} + {1'b0, byte_sum(in[7:0])};
""".replace("@LINES@", "\n".join(lines))
    else:
        terms = ["{4'd0, in[%d:%d]}" % (shift + 1, shift) for shift in (0, 2, 4, 6, 8, 10, 12, 14)]
        body = "  wire [5:0] lane_sum = " + " + ".join(terms) + ";\n"
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
@BODY@
@QUANT@
  wire [9:0] scaled_sum = {3'd0, lane_sum, 1'b0};
  assign out = {1'b0, quant_scaled(scaled_sum)};
endmodule
""".replace("@MODULE@", module).replace("@BODY@", body).replace("@QUANT@", quant)


def render_u2_sum8_laneqcase(module):
    lines = []
    for lane_sum in range(25):
        lines.append("        5'd{0}: quant_lane_sum = 7'h{1:02x};".format(lane_sum, q_scaled(2 * lane_sum)))
    terms = ["{3'd0, in[%d:%d]}" % (shift + 1, shift) for shift in (0, 2, 4, 6, 8, 10, 12, 14)]
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [4:0] lane_sum = @TERMS@;
  function [6:0] quant_lane_sum;
    input [4:0] value;
    begin
      case (value)
@LINES@
        default: quant_lane_sum = 7'h54;
      endcase
    end
  endfunction
  assign out = {1'b0, quant_lane_sum(lane_sum)};
endmodule
""".replace("@MODULE@", module).replace("@TERMS@", " + ".join(terms)).replace("@LINES@", "\n".join(lines))


def render_u2_sum8_balanced_laneqcase(module, parallel=False):
    lines = []
    for lane_sum in range(25):
        lines.append("        5'd{0}: quant_lane_sum = 7'h{1:02x};".format(lane_sum, q_scaled(2 * lane_sum)))
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [2:0] s0 = {1'b0, in[1:0]} + {1'b0, in[3:2]};
  wire [2:0] s1 = {1'b0, in[5:4]} + {1'b0, in[7:6]};
  wire [2:0] s2 = {1'b0, in[9:8]} + {1'b0, in[11:10]};
  wire [2:0] s3 = {1'b0, in[13:12]} + {1'b0, in[15:14]};
  wire [3:0] s01 = {1'b0, s0} + {1'b0, s1};
  wire [3:0] s23 = {1'b0, s2} + {1'b0, s3};
  wire [4:0] lane_sum = {1'b0, s01} + {1'b0, s23};
  function [6:0] quant_lane_sum;
    input [4:0] value;
    begin
      @CASE@ (value)
@LINES@
        default: quant_lane_sum = 7'h54;
      endcase
    end
  endfunction
  assign out = {1'b0, quant_lane_sum(lane_sum)};
endmodule
""".replace("@MODULE@", module).replace("@LINES@", "\n".join(lines)).replace("@CASE@", "(* parallel_case, full_case *) case" if parallel else "case")


def render_u2_sum8_balanced_threshold_fields(module):
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [2:0] s0 = {1'b0, in[1:0]} + {1'b0, in[3:2]};
  wire [2:0] s1 = {1'b0, in[5:4]} + {1'b0, in[7:6]};
  wire [2:0] s2 = {1'b0, in[9:8]} + {1'b0, in[11:10]};
  wire [2:0] s3 = {1'b0, in[13:12]} + {1'b0, in[15:14]};
  wire [3:0] s01 = {1'b0, s0} + {1'b0, s1};
  wire [3:0] s23 = {1'b0, s2} + {1'b0, s3};
  wire [4:0] lane_sum = {1'b0, s01} + {1'b0, s23};

  function [6:0] quant_lane_sum;
    input [4:0] value;
    begin
      if (value == 5'd0) begin
        quant_lane_sum = 7'h00;
      end else if (value == 5'd1) begin
        quant_lane_sum = 7'h30;
      end else if (value == 5'd2) begin
        quant_lane_sum = 7'h38;
      end else if (value == 5'd3) begin
        quant_lane_sum = 7'h3c;
      end else if (value < 5'd8) begin
        quant_lane_sum = 7'h40 | {4'd0, value[1:0], 1'b0};
      end else if (value < 5'd16) begin
        quant_lane_sum = 7'h48 | {4'd0, value[2:0]};
      end else begin
        case (value)
          5'd16: quant_lane_sum = 7'h50;
          5'd17: quant_lane_sum = 7'h50;
          5'd18: quant_lane_sum = 7'h51;
          5'd19: quant_lane_sum = 7'h52;
          5'd20: quant_lane_sum = 7'h52;
          5'd21: quant_lane_sum = 7'h52;
          5'd22: quant_lane_sum = 7'h53;
          5'd23: quant_lane_sum = 7'h54;
          default: quant_lane_sum = 7'h54;
        endcase
      end
    end
  endfunction

  assign out = {1'b0, quant_lane_sum(lane_sum)};
endmodule
""".replace("@MODULE@", module)


def render_u2_sum8_popcount_laneqcase(module):
    lines = []
    for lane_sum in range(25):
        lines.append("        5'd{0}: quant_lane_sum = 7'h{1:02x};".format(lane_sum, q_scaled(2 * lane_sum)))
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] lo_bits = {in[14], in[12], in[10], in[8], in[6], in[4], in[2], in[0]};
  wire [7:0] hi_bits = {in[15], in[13], in[11], in[9], in[7], in[5], in[3], in[1]};

  wire [1:0] lo01 = {1'b0, lo_bits[0]} + {1'b0, lo_bits[1]};
  wire [1:0] lo23 = {1'b0, lo_bits[2]} + {1'b0, lo_bits[3]};
  wire [1:0] lo45 = {1'b0, lo_bits[4]} + {1'b0, lo_bits[5]};
  wire [1:0] lo67 = {1'b0, lo_bits[6]} + {1'b0, lo_bits[7]};
  wire [2:0] lo0123 = {1'b0, lo01} + {1'b0, lo23};
  wire [2:0] lo4567 = {1'b0, lo45} + {1'b0, lo67};
  wire [3:0] lo_count = {1'b0, lo0123} + {1'b0, lo4567};

  wire [1:0] hi01 = {1'b0, hi_bits[0]} + {1'b0, hi_bits[1]};
  wire [1:0] hi23 = {1'b0, hi_bits[2]} + {1'b0, hi_bits[3]};
  wire [1:0] hi45 = {1'b0, hi_bits[4]} + {1'b0, hi_bits[5]};
  wire [1:0] hi67 = {1'b0, hi_bits[6]} + {1'b0, hi_bits[7]};
  wire [2:0] hi0123 = {1'b0, hi01} + {1'b0, hi23};
  wire [2:0] hi4567 = {1'b0, hi45} + {1'b0, hi67};
  wire [3:0] hi_count = {1'b0, hi0123} + {1'b0, hi4567};

  wire [4:0] lane_sum = {1'b0, lo_count} + {hi_count, 1'b0};
  function [6:0] quant_lane_sum;
    input [4:0] value;
    begin
      case (value)
@LINES@
        default: quant_lane_sum = 7'h54;
      endcase
    end
  endfunction
  assign out = {1'b0, quant_lane_sum(lane_sum)};
endmodule
""".replace("@MODULE@", module).replace("@LINES@", "\n".join(lines))


def render_u2_sum8_popcount_threshold_fields(module):
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] lo_bits = {in[14], in[12], in[10], in[8], in[6], in[4], in[2], in[0]};
  wire [7:0] hi_bits = {in[15], in[13], in[11], in[9], in[7], in[5], in[3], in[1]};

  wire [1:0] lo01 = {1'b0, lo_bits[0]} + {1'b0, lo_bits[1]};
  wire [1:0] lo23 = {1'b0, lo_bits[2]} + {1'b0, lo_bits[3]};
  wire [1:0] lo45 = {1'b0, lo_bits[4]} + {1'b0, lo_bits[5]};
  wire [1:0] lo67 = {1'b0, lo_bits[6]} + {1'b0, lo_bits[7]};
  wire [2:0] lo0123 = {1'b0, lo01} + {1'b0, lo23};
  wire [2:0] lo4567 = {1'b0, lo45} + {1'b0, lo67};
  wire [3:0] lo_count = {1'b0, lo0123} + {1'b0, lo4567};

  wire [1:0] hi01 = {1'b0, hi_bits[0]} + {1'b0, hi_bits[1]};
  wire [1:0] hi23 = {1'b0, hi_bits[2]} + {1'b0, hi_bits[3]};
  wire [1:0] hi45 = {1'b0, hi_bits[4]} + {1'b0, hi_bits[5]};
  wire [1:0] hi67 = {1'b0, hi_bits[6]} + {1'b0, hi_bits[7]};
  wire [2:0] hi0123 = {1'b0, hi01} + {1'b0, hi23};
  wire [2:0] hi4567 = {1'b0, hi45} + {1'b0, hi67};
  wire [3:0] hi_count = {1'b0, hi0123} + {1'b0, hi4567};

  wire [4:0] lane_sum = {1'b0, lo_count} + {hi_count, 1'b0};
  function [6:0] quant_lane_sum;
    input [4:0] value;
    begin
      if (value == 5'd0) begin
        quant_lane_sum = 7'h00;
      end else if (value == 5'd1) begin
        quant_lane_sum = 7'h30;
      end else if (value == 5'd2) begin
        quant_lane_sum = 7'h38;
      end else if (value == 5'd3) begin
        quant_lane_sum = 7'h3c;
      end else if (value < 5'd8) begin
        quant_lane_sum = 7'h40 | {4'd0, value[1:0], 1'b0};
      end else if (value < 5'd16) begin
        quant_lane_sum = 7'h48 | {4'd0, value[2:0]};
      end else begin
        case (value)
          5'd16: quant_lane_sum = 7'h50;
          5'd17: quant_lane_sum = 7'h50;
          5'd18: quant_lane_sum = 7'h51;
          5'd19: quant_lane_sum = 7'h52;
          5'd20: quant_lane_sum = 7'h52;
          5'd21: quant_lane_sum = 7'h52;
          5'd22: quant_lane_sum = 7'h53;
          5'd23: quant_lane_sum = 7'h54;
          default: quant_lane_sum = 7'h54;
        endcase
      end
    end
  endfunction
  assign out = {1'b0, quant_lane_sum(lane_sum)};
endmodule
""".replace("@MODULE@", module)


def render_u2_sum8_popcount_2dcase(module):
    lines = []
    for hi_count in range(9):
        for lo_count in range(9):
            lane_sum = lo_count + 2 * hi_count
            if lane_sum <= 24:
                key = (hi_count << 4) | lo_count
                lines.append("        8'h{0:02x}: quant_counts = 7'h{1:02x};".format(key, q_scaled(2 * lane_sum)))
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] lo_bits = {in[14], in[12], in[10], in[8], in[6], in[4], in[2], in[0]};
  wire [7:0] hi_bits = {in[15], in[13], in[11], in[9], in[7], in[5], in[3], in[1]};

  wire [1:0] lo01 = {1'b0, lo_bits[0]} + {1'b0, lo_bits[1]};
  wire [1:0] lo23 = {1'b0, lo_bits[2]} + {1'b0, lo_bits[3]};
  wire [1:0] lo45 = {1'b0, lo_bits[4]} + {1'b0, lo_bits[5]};
  wire [1:0] lo67 = {1'b0, lo_bits[6]} + {1'b0, lo_bits[7]};
  wire [2:0] lo0123 = {1'b0, lo01} + {1'b0, lo23};
  wire [2:0] lo4567 = {1'b0, lo45} + {1'b0, lo67};
  wire [3:0] lo_count = {1'b0, lo0123} + {1'b0, lo4567};

  wire [1:0] hi01 = {1'b0, hi_bits[0]} + {1'b0, hi_bits[1]};
  wire [1:0] hi23 = {1'b0, hi_bits[2]} + {1'b0, hi_bits[3]};
  wire [1:0] hi45 = {1'b0, hi_bits[4]} + {1'b0, hi_bits[5]};
  wire [1:0] hi67 = {1'b0, hi_bits[6]} + {1'b0, hi_bits[7]};
  wire [2:0] hi0123 = {1'b0, hi01} + {1'b0, hi23};
  wire [2:0] hi4567 = {1'b0, hi45} + {1'b0, hi67};
  wire [3:0] hi_count = {1'b0, hi0123} + {1'b0, hi4567};

  function [6:0] quant_counts;
    input [3:0] hi_value;
    input [3:0] lo_value;
    begin
      case ({hi_value, lo_value})
@LINES@
        default: quant_counts = 7'h54;
      endcase
    end
  endfunction
  assign out = {1'b0, quant_counts(hi_count, lo_count)};
endmodule
""".replace("@MODULE@", module).replace("@LINES@", "\n".join(lines))


def render_u2_sum8_popcount_bitformula(module):
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] lo_bits = {in[14], in[12], in[10], in[8], in[6], in[4], in[2], in[0]};
  wire [7:0] hi_bits = {in[15], in[13], in[11], in[9], in[7], in[5], in[3], in[1]};

  wire [1:0] lo01 = {1'b0, lo_bits[0]} + {1'b0, lo_bits[1]};
  wire [1:0] lo23 = {1'b0, lo_bits[2]} + {1'b0, lo_bits[3]};
  wire [1:0] lo45 = {1'b0, lo_bits[4]} + {1'b0, lo_bits[5]};
  wire [1:0] lo67 = {1'b0, lo_bits[6]} + {1'b0, lo_bits[7]};
  wire [2:0] lo0123 = {1'b0, lo01} + {1'b0, lo23};
  wire [2:0] lo4567 = {1'b0, lo45} + {1'b0, lo67};
  wire [3:0] lo_count = {1'b0, lo0123} + {1'b0, lo4567};

  wire [1:0] hi01 = {1'b0, hi_bits[0]} + {1'b0, hi_bits[1]};
  wire [1:0] hi23 = {1'b0, hi_bits[2]} + {1'b0, hi_bits[3]};
  wire [1:0] hi45 = {1'b0, hi_bits[4]} + {1'b0, hi_bits[5]};
  wire [1:0] hi67 = {1'b0, hi_bits[6]} + {1'b0, hi_bits[7]};
  wire [2:0] hi0123 = {1'b0, hi01} + {1'b0, hi23};
  wire [2:0] hi4567 = {1'b0, hi45} + {1'b0, hi67};
  wire [3:0] hi_count = {1'b0, hi0123} + {1'b0, hi4567};

  wire [4:0] lane_sum = {1'b0, lo_count} + {hi_count, 1'b0};
  wire s0 = lane_sum[0];
  wire s1 = lane_sum[1];
  wire s2 = lane_sum[2];
  wire s3 = lane_sum[3];
  wire s4 = lane_sum[4];
  wire [6:0] mag;
  assign mag[0] = (s4 & s1 & ~s0) | (s3 & s0);
  assign mag[1] = (~s4 & ~s3 & s2 & s0) | (s4 & ~s2 & s1 & s0) | (s4 & s2 & ~s1) | (s4 & s2 & ~s0) | (s3 & s1);
  assign mag[2] = (~s4 & ~s3 & s1 & s0) | (~s4 & s2 & s1) | (s2 & s1 & s0) | (s3 & s2) | (s4 & s3);
  assign mag[3] = (~s4 & ~s2 & s1) | (~s4 & s3);
  assign mag[4] = (~s3 & ~s2 & s0) | (~s3 & ~s2 & s1) | s4;
  assign mag[5] = (~s4 & ~s3 & ~s2 & s0) | (~s4 & ~s3 & ~s2 & s1);
  assign mag[6] = s2 | s3 | s4;
  assign out = {1'b0, mag};
endmodule
""".replace("@MODULE@", module)


def render_bdd(module, case, order):
    table = TruthTable(ROOT / "benchmarks" / (case + ".truth"))
    outputs = [table.get_output(index) for index in range(table.num_inputs)]
    builder, roots = build_bdd(outputs, 16, 8, order)
    lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [7:0] out;",
    ]
    for node in builder.nodes:
        lines.append(
            "  wire n_{0} = in[{1}] ? {2} : {3};".format(
                node["id"], node["var"], edge_expr(node["high"]), edge_expr(node["low"])
            )
        )
    for bit, root in enumerate(roots):
        lines.append("  assign out[{0}] = {1};".format(bit, edge_expr(root)))
    lines.append("endmodule")
    lines.append("")
    return "\n".join(lines)


def e4_k_entries():
    lines = []
    for code in range(128):
        value = E4.k[code]
        bits = value & ((1 << 19) - 1)
        lines.append("        7'h{0:02x}: e4_mag_k = 19'd{1};".format(code, bits))
    return "\n".join(lines)


def possible_fma_abs_values():
    products = {fp4_e2m1_value(left) * fp4_e2m1_value(right) for left in range(16) for right in range(16)}
    values = set()
    for left in range(256):
        if (left & 0x7F) == 0x7F:
            continue
        mag_k = E4.k[left & 0x7F]
        signed_k = -mag_k if left & 0x80 else mag_k
        for product in products:
            values.add(abs(signed_k + 128 * product))
    return values


def fma_output_for_product(acc, product, neg_zero_product=False):
    if (acc & 0x7F) == 0x7F:
        return 0x7F
    acc_k = E4.k[acc & 0x7F]
    if acc & 0x80:
        acc_k = -acc_k
    total = acc_k + 128 * product
    if total == 0 and acc == 0x80 and neg_zero_product:
        return 0x80
    return (0x80 if total < 0 else 0) | q_k(total)


def product_key_value(product, neg_zero=False):
    if product == 0 and neg_zero:
        return 289
    return product + 144


def render_fma_nested_acc_table(module):
    products = sorted({fp4_e2m1_value(left) * fp4_e2m1_value(right) for left in range(16) for right in range(16)})
    product_cases = []
    for left in range(16):
        for right in range(16):
            product = fp4_e2m1_value(left) * fp4_e2m1_value(right)
            neg_zero = product == 0 and ((left & 0x7) == 0 or (right & 0x7) == 0) and ((left ^ right) & 0x8)
            product_cases.append(
                "        8'h{0:02x}: product_key = 9'd{1};".format((left << 4) | right, product_key_value(product, neg_zero))
            )
    table_blocks = []
    for product in products:
        keys = [(product_key_value(product, False), product, False)]
        if product == 0:
            keys.append((product_key_value(0, True), 0, True))
        for key, prod, neg_zero in keys:
            lines = ["        9'd{0}: begin".format(key), "          case (acc)"]
            for acc in range(256):
                lines.append(
                    "            8'h{0:02x}: fma_acc_table = 8'h{1:02x};".format(
                        acc, fma_output_for_product(acc, prod, neg_zero)
                    )
                )
            lines.append("            default: fma_acc_table = 8'h00;")
            lines.append("          endcase")
            lines.append("        end")
            table_blocks.append("\n".join(lines))
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] acc = in[15:8];

  function [8:0] product_key;
    input [7:0] packed;
    begin
      case (packed)
@PRODUCT_CASES@
        default: product_key = 9'd144;
      endcase
    end
  endfunction

  function [7:0] fma_acc_table;
    input [8:0] key;
    input [7:0] acc;
    begin
      case (key)
@TABLE_BLOCKS@
        default: fma_acc_table = acc;
      endcase
    end
  endfunction

  assign out = fma_acc_table(product_key(in[7:0]), acc);
endmodule
""".replace("@MODULE@", module).replace("@PRODUCT_CASES@", "\n".join(product_cases)).replace("@TABLE_BLOCKS@", "\n".join(table_blocks))


def render_fp4_product_to_e4_function():
    lines = []
    for packed in range(256):
        left = (packed >> 4) & 0xF
        right = packed & 0xF
        product = fp4_e2m1_value(left) * fp4_e2m1_value(right)
        neg_zero = product == 0 and ((left & 0x7) == 0 or (right & 0x7) == 0) and ((left ^ right) & 0x8)
        if product == 0:
            code = 0x80 if neg_zero else 0x00
        else:
            code = (0x80 if product < 0 else 0x00) | q_scaled(product)
        lines.append("        8'h{0:02x}: fp4_product_e4 = 8'h{1:02x};".format(packed, code))
    return """  function [7:0] fp4_product_e4;
    input [7:0] packed;
    begin
      case (packed)
@LINES@
        default: fp4_product_e4 = 8'h00;
      endcase
    end
  endfunction

""".replace("@LINES@", "\n".join(lines))


def render_fp4_product_to_e4_magfactored_function():
    lines = []
    for left in range(8):
        for right in range(8):
            product = abs(fp4_e2m1_value(left)) * abs(fp4_e2m1_value(right))
            code = 0 if product == 0 else q_scaled(product)
            lines.append("        6'h{0:02x}: fp4_product_mag_e4 = 7'h{1:02x};".format((left << 3) | right, code))
    return """  function [6:0] fp4_product_mag_e4;
    input [2:0] left_mag;
    input [2:0] right_mag;
    begin
      case ({left_mag, right_mag})
@LINES@
        default: fp4_product_mag_e4 = 7'h00;
      endcase
    end
  endfunction

  function [7:0] fp4_product_e4;
    input [7:0] packed;
    reg neg;
    reg is_zero;
    reg [6:0] mag_code;
    begin
      neg = packed[7] ^ packed[3];
      is_zero = (packed[6:4] == 3'd0) || (packed[2:0] == 3'd0);
      mag_code = fp4_product_mag_e4(packed[6:4], packed[2:0]);
      fp4_product_e4 = is_zero ? {neg, 7'h00} : {neg, mag_code};
    end
  endfunction

""".replace("@LINES@", "\n".join(lines))


def render_fma_as_e4_add(module, magfactored=False):
    text = render_add_same_grs_diff_param8(module)
    needle = "  wire [7:0] b = in[7:0];\n"
    product_function = render_fp4_product_to_e4_magfactored_function() if magfactored else render_fp4_product_to_e4_function()
    replacement = product_function + "  wire [7:0] b = fp4_product_e4(in[7:0]);\n"
    if needle not in text:
        raise RuntimeError("unexpected ex240 add renderer shape")
    return text.replace(needle, replacement)


def render_fma(module, q_style, product_style):
    max_abs = max(possible_fma_abs_values())
    if q_style == "qnorm":
        quant = render_q_k_norm("quant_k")
    elif q_style == "qcase":
        quant = render_q_k_case("quant_k", possible_fma_abs_values())
    else:
        quant = render_q_k_range("quant_k", max_abs)
    if product_style == "prodtable":
        table = product_table(fp4_e2m1_value, "fp4_product", 10)
        product = "fp4_product(in[7:4], in[3:0])"
    else:
        table = ""
        product = "$signed(fp4_value(in[7:4])) * $signed(fp4_value(in[3:0]))"
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] acc = in[15:8];
  wire [6:0] acc_mag = acc[6:0];
@COMMON@
@TABLE@
@QUANT@
  function [18:0] e4_mag_k;
    input [6:0] code;
    begin
      case (code)
@E4K@
        default: e4_mag_k = 19'd0;
      endcase
    end
  endfunction

  wire signed [19:0] acc_k = acc[7] ? -$signed({1'b0, e4_mag_k(acc_mag)}) : $signed({1'b0, e4_mag_k(acc_mag)});
  wire signed [10:0] product = @PRODUCT@;
  wire signed [19:0] product_k = product * 20'sd128;
  wire signed [19:0] total = acc_k + product_k;
  wire negative = total < 0;
  wire signed [19:0] neg_total = -total;
  wire [18:0] abs_total = negative ? neg_total[18:0] : total[18:0];
  wire product_neg_zero = fp4_neg_zero_product(in[7:4], in[3:0]);
  wire neg_zero = (total == 20'sd0) && (acc == 8'h80) && product_neg_zero;
  assign out = (acc_mag == 7'h7f) ? 8'h7f : {negative || neg_zero, quant_k(abs_total)};
endmodule
""".replace("@MODULE@", module).replace("@COMMON@", common_fp4_value()).replace("@TABLE@", table).replace("@QUANT@", quant).replace("@E4K@", e4_k_entries()).replace("@PRODUCT@", product)


def render(case, variant, module):
    if variant == "struct_bdd_lane_pair_order":
        return render_bdd(module, case, [8, 0, 9, 1, 10, 2, 11, 3, 12, 4, 13, 5, 14, 6, 15, 7])
    if variant == "struct_bdd_u2_lane_order":
        return render_bdd(module, case, [0, 1, 8, 9, 2, 3, 10, 11, 4, 5, 12, 13, 6, 7, 14, 15])
    if variant == "struct_bdd_acc_product_order":
        return render_bdd(module, case, [0, 4, 1, 5, 2, 6, 3, 7, 8, 9, 10, 11, 12, 13, 14, 15])
    if case == "ex250":
        if variant.startswith("semantic_fp4_dot2_magprod_"):
            if variant.endswith("qrange"):
                return render_fp4_dot2_magprod(module, "qrange")
            if variant.endswith("qunrolled_norm"):
                return render_fp4_dot2_magprod(module, "qunrolled_norm")
            return render_fp4_dot2_magprod(module, "qcase")
        if variant == "semantic_fp4_dot2_magarith_qcase":
            return render_fp4_dot2_magarith_qcase(module)
        if variant.endswith("qunrolled_norm"):
            q_style = "qunrolled_norm"
        elif variant.endswith("qreachable_case"):
            q_style = "qreachable_case"
        else:
            q_style = "qnorm" if variant.endswith("qnorm") else ("qrange" if variant.endswith("qrange") else "qcase")
        return render_dot2(case, module, "fp4", q_style, "prodtable" if "prodtable" in variant else "arith")
    if case == "ex251":
        q_style = "qnorm" if variant.endswith("qnorm") else ("qrange" if variant.endswith("qrange") else "qcase")
        return render_dot2(case, module, "int3", q_style, "prodtable" if "prodtable" in variant else "arith")
    if case == "ex252":
        if variant == "semantic_u2_dot4_balanced_qcase":
            return render_u2_dot4_balanced(module)
        if variant == "semantic_u2_dot4_balanced_qcase_parallel":
            return render_u2_dot4_balanced(module, True)
        if variant == "semantic_u2_dot4_balanced_threshold_fields":
            return render_u2_dot4_balanced_threshold_fields(module)
        if variant == "semantic_u2_dot4_balanced_bitformula":
            return render_u2_dot4_balanced_bitformula(module)
        if variant == "semantic_u2_dot4_partialpop_qcase":
            return render_u2_dot4_partialpop_qcase(module)
        if variant == "semantic_u2_dot4_handmul_balanced_qcase":
            return render_u2_dot4_handmul_balanced_qcase(module)
        q_style = "qnorm" if variant.endswith("qnorm") else ("qrange" if variant.endswith("qrange") else "qcase")
        return render_u2_dot4(module, q_style, "pairtable" in variant)
    if case == "ex253":
        if variant == "semantic_u2_sum8_balanced_laneqcase":
            return render_u2_sum8_balanced_laneqcase(module)
        if variant == "semantic_u2_sum8_balanced_laneqcase_parallel":
            return render_u2_sum8_balanced_laneqcase(module, True)
        if variant == "semantic_u2_sum8_balanced_threshold_fields":
            return render_u2_sum8_balanced_threshold_fields(module)
        if variant == "semantic_u2_sum8_popcount_laneqcase":
            return render_u2_sum8_popcount_laneqcase(module)
        if variant == "semantic_u2_sum8_popcount_threshold_fields":
            return render_u2_sum8_popcount_threshold_fields(module)
        if variant == "semantic_u2_sum8_popcount_2dcase":
            return render_u2_sum8_popcount_2dcase(module)
        if variant == "semantic_u2_sum8_popcount_bitformula":
            return render_u2_sum8_popcount_bitformula(module)
        if variant == "semantic_u2_sum8_arith_laneqcase":
            return render_u2_sum8_laneqcase(module)
        q_style = "qnorm" if variant.endswith("qnorm") else ("qrange" if variant.endswith("qrange") else "qcase")
        return render_u2_sum8(module, q_style, "bytetable" in variant)
    if case == "ex254":
        if variant == "semantic_e4add_fp4product_grs":
            return render_fma_as_e4_add(module)
        if variant == "semantic_e4add_fp4product_grs_magfactored":
            return render_fma_as_e4_add(module, True)
        if variant == "semantic_e4acc_fp4prod_nested_acc_table":
            return render_fma_nested_acc_table(module)
        q_style = "qnorm" if variant.endswith("qnorm") else ("qcase" if variant.endswith("qcase") else "qrange")
        return render_fma(module, q_style, "prodtable" if "prodtable" in variant else "arith")
    raise ValueError("unknown case {0}".format(case))


def synthesize_with_script(script, yosys, timeout, log_path):
    log_path.parent.mkdir(parents=True, exist_ok=True)
    (log_path.parent.parent / "aigs").mkdir(parents=True, exist_ok=True)
    script_path = log_path.with_suffix(".ys")
    write_text(script_path, script)
    code, log = run_command([str(yosys), "-s", str(script_path)], timeout=timeout)
    write_text(log_path, log)
    if code != 0:
        raise SynthError("Yosys failed with exit code {0}".format(code))


def empty_row(case, candidate_id, variant, note, verilog_path, aig_path):
    return {
        "case": case,
        "candidate_id": candidate_id,
        "hypothesis/function_guess": CASE_LABELS[case],
        "variant": variant,
        "verilog_path": rel_path(verilog_path),
        "aig_path": rel_path(aig_path),
        "verified_truth": "1",
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
        "items": note,
        "classification": "semantic_exact",
        "notes": "",
    }


def run_variant(args, refs, case, variant, note):
    rows = []
    module = "{0}_{1}".format(case, variant)
    verilog_path = args.work_dir / case / "verilog" / "{0}.v".format(module)
    write_text(verilog_path, render(case, variant, module))
    truth = args.benchmarks / "{0}.truth".format(case)
    for synth_name, renderer in SYNTH_VARIANTS:
        candidate_id = "{0}_{1}".format(module, synth_name)
        aig_path = args.work_dir / case / "aigs" / "{0}.aig".format(candidate_id)
        log_path = args.work_dir / case / "logs" / "{0}.yosys.log".format(candidate_id)
        row = empty_row(case, candidate_id, variant + "_" + synth_name, note, verilog_path, aig_path)
        start = time.time()
        try:
            synthesize_with_script(renderer(verilog_path, module, aig_path), args.yosys, args.timeout, log_path)
            row["synthesized"] = "1"
            result = evaluate_aig(
                case=case,
                candidate_id=candidate_id,
                parent_id=variant,
                source="yosys_frontend",
                tool_chain="yosys_{0}".format(synth_name),
                aig_path=aig_path,
                truth=truth,
                abc=args.abc,
                timeout=args.timeout,
            )
            row["equivalent"] = "1" if result.equivalent else "0"
            if result.equivalent:
                row["area"] = str(result.area)
                row["delay"] = str(result.delay)
                row["adp"] = str(result.adp)
            else:
                row["notes"] = result.status
        except Exception as exc:
            row["notes"] = str(exc).splitlines()[0][:240]
        row["runtime_sec"] = "{0:.3f}".format(time.time() - start)
        add_reference_columns(row, refs)
        rows.append(row)
        print(case, candidate_id, "eq={0}".format(row["equivalent"]), "area={0}".format(row["area"]), "delay={0}".format(row["delay"]), "adp={0}".format(row["adp"]))
    return rows


def write_manifest(args):
    text = """# {run_id}

Run ID: `{run_id}`

Purpose: semantic frontend seeds for ex250-ex254 packed FP4/INT2 dot and FMA cases.

Artifacts:
- Work directory: `{work_dir}`
- Candidates CSV: `{results_dir}/candidates.csv`
- Best CSV: `{results_dir}/best.csv`

Semantic identification:
- ex250: packed two-lane FP4 E2M1 dot product, E4M3FN result.
- ex251: packed two-lane signed 3-bit magnitude dot product, E4M3FN result.
- ex252: packed four-lane unsigned 2-bit dot product, E4M3FN result.
- ex253: unsigned 2-bit lane reduction, `2 * sum(lanes)`, E4M3FN result.
- ex254: E4M3FN accumulator plus product of two FP4 E2M1 values from the low byte.

No `student/seeds` curation was performed.
""".format(run_id=args.run_id, work_dir=rel_path(args.work_dir), results_dir=rel_path(args.results_dir))
    write_text(args.results_dir.parent / "MANIFEST.md", text)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--run-id", required=True)
    parser.add_argument("--cases", default=",".join(CASES))
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--reference", type=Path, default=ROOT / "reference_result.csv")
    parser.add_argument("--work-dir", type=Path)
    parser.add_argument("--results-dir", type=Path)
    parser.add_argument("--abc", type=Path, default=ROOT / "student" / "abc")
    parser.add_argument("--yosys", type=Path, default=ROOT / "student" / "tools" / "conda-env" / "bin" / "yosys")
    parser.add_argument("--timeout", type=int, default=900)
    parser.add_argument("--variants", default="")
    args = parser.parse_args()
    args.work_dir = args.work_dir or (ROOT / "student" / "work" / args.run_id)
    args.results_dir = args.results_dir or (ROOT / "student" / "runs" / "float_fp8" / args.run_id / "results")
    refs = load_reference(args.reference)
    selected = set(item.strip() for item in args.cases.split(",") if item.strip())
    selected_variants = set(item.strip() for item in args.variants.split(",") if item.strip())
    rows = []
    for case, variant, note in VARIANTS:
        if case in selected and (not selected_variants or variant in selected_variants):
            rows.extend(run_variant(args, refs, case, variant, note))
    best = {}
    for row in rows:
        if row.get("equivalent") != "1" or not row.get("adp"):
            continue
        old = best.get(row["case"])
        if old is None or int(row["adp"]) < int(old["adp"]):
            best[row["case"]] = row
    write_csv(args.results_dir / "candidates.csv", RESULT_FIELDNAMES, rows)
    write_csv(args.results_dir / "evaluate_check.csv", RESULT_FIELDNAMES, rows)
    write_csv(args.results_dir / "best.csv", BEST_FIELDNAMES, [best[case] for case in CASES if case in best])
    write_csv(args.results_dir / "summary.csv", BEST_FIELDNAMES, [best[case] for case in CASES if case in best])
    write_manifest(args)


if __name__ == "__main__":
    main()
