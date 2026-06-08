#!/usr/bin/env python3
"""Focused E5M2FN multiply/divide structures for ex246 and ex247.

The first ex245-ex249 pass identified exact E5M2FN semantics.  This focused
run tries a different source shape for ex246/ex247: small attribute tables plus
shared boundary/linear reassembly.  The goal is to avoid repeating one
if-chain per product or significand pair.
"""

import argparse
import time
import sys
import random
from collections import defaultdict
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from student.backends.abc_flow import evaluate_aig
from student.frontends.yosys_synth import SynthError, run_command
from student.generators.fp8_ex240_ex244_deep_struct import SYNTH_VARIANTS
from student.generators.fp8_ex245_ex249_frontend import (
    BEST_FIELDNAMES,
    RESULT_FIELDNAMES,
    CASE_LABELS,
    FP8,
    add_reference_columns,
    load_reference,
    rel_path,
    render_div_key_bdd,
    render_mul_key_bdd,
    render_div_sigpair_class,
    render_mul_product_class,
    write_csv,
    write_text,
)
from student.generators.unknown_bdd_search import build_bdd, edge_expr


CASES = ["ex246", "ex247"]


def sconst(value):
    return "7'sh{0:02x}".format(value & 0x7F) if value < 0 else "7'sd{0}".format(value)


def mul_class(product):
    vals = {exp_sum: FP8.mul_mag_from_product(product, exp_sum) for exp_sum in range(2, 63)}
    zero_hi = max([exp_sum for exp_sum, mag in vals.items() if mag == 0] or [1])
    sat_lo = min([exp_sum for exp_sum, mag in vals.items() if mag == 0x7E] or [63])
    normal = [(exp_sum, mag) for exp_sum, mag in vals.items() if zero_hi < exp_sum < sat_lo and mag >= 4]
    counts = defaultdict(int)
    for exp_sum, mag in normal:
        counts[((mag >> 2) - exp_sum, mag & 0x3)] += 1
    offset, mant = sorted(counts.items(), key=lambda item: (-item[1], item[0]))[0][0]
    return zero_hi, sat_lo, -offset, mant


def div_class(sig_n, sig_d):
    vals = {delta: FP8.div_mag_from_sig_delta(sig_n, sig_d, delta) for delta in range(-30, 31)}
    zero_hi = max([delta for delta, mag in vals.items() if mag == 0] or [-31])
    sat_lo = min([delta for delta, mag in vals.items() if mag == 0x7E] or [31])
    normal = [(delta, mag) for delta, mag in vals.items() if zero_hi < delta < sat_lo and mag >= 4]
    counts = defaultdict(int)
    for delta, mag in normal:
        counts[((mag >> 2) - delta, mag & 0x3)] += 1
    offset, mant = sorted(counts.items(), key=lambda item: (-item[1], item[0]))[0][0]
    return zero_hi, sat_lo, offset, mant


def common_sig_eff():
    return """  function [2:0] sig3;
    input [6:0] v;
    begin
      sig3 = (v[6:2] == 5'd0) ? {1'b0, v[1:0]} : {1'b1, v[1:0]};
    end
  endfunction

  function [5:0] eff_exp;
    input [6:0] v;
    begin
      eff_exp = (v[6:2] == 5'd0) ? 6'd1 : {1'b0, v[6:2]};
    end
  endfunction
"""


def sop_terms(nvars, ones, dcs):
    ones = set(ones)
    if not ones:
        return []
    terms = {(item, 0) for item in ones | set(dcs)}
    primes = set()
    while terms:
        used = set()
        next_terms = set()
        by_mask = defaultdict(list)
        for bits, mask in terms:
            by_mask[mask].append(bits)
        for mask, bit_items in by_mask.items():
            bit_items = sorted(set(bit_items))
            for i, a in enumerate(bit_items):
                for b in bit_items[i + 1:]:
                    diff = a ^ b
                    if diff and (diff & (diff - 1)) == 0 and not (diff & mask):
                        used.add((a, mask))
                        used.add((b, mask))
                        next_terms.add((a & ~diff, mask | diff))
        for term in terms:
            if term not in used:
                primes.add(term)
        if next_terms == terms:
            break
        terms = next_terms

    def covers(cube, item):
        bits, mask = cube
        return (item & ~mask) == bits

    useful = [cube for cube in primes if any(covers(cube, item) for item in ones)]
    uncovered = set(ones)
    selected = []
    while uncovered:
        essentials = []
        for item in list(uncovered):
            item_primes = [cube for cube in useful if covers(cube, item)]
            if len(item_primes) == 1:
                essentials.append(item_primes[0])
        if essentials:
            for cube in sorted(set(essentials)):
                if cube not in selected:
                    selected.append(cube)
                uncovered = {item for item in uncovered if not covers(cube, item)}
            continue
        best = max(
            useful,
            key=lambda cube: (
                sum(1 for item in uncovered if covers(cube, item)),
                bin(cube[1]).count("1"),
                -bin(~cube[1] & ((1 << nvars) - 1)).count("1"),
            ),
        )
        if best not in selected:
            selected.append(best)
        uncovered = {item for item in uncovered if not covers(best, item)}
    return selected


def cube_expr(cube, vars_):
    nvars = len(vars_)
    bits, mask = cube
    factors = []
    for idx, name in enumerate(vars_):
        bitpos = nvars - 1 - idx
        if (mask >> bitpos) & 1:
            continue
        if (bits >> bitpos) & 1:
            factors.append(name)
        else:
            factors.append("~" + name)
    if not factors:
        return "1'b1"
    return "(" + " & ".join(factors) + ")"


def sop_expr(nvars, vars_, ones, dcs):
    terms = sop_terms(nvars, ones, dcs)
    if not terms:
        return "1'b0"
    return " | ".join(cube_expr(cube, vars_) for cube in terms)


def vector_logic_lines(prefix, width, values, valid_keys, dc_keys, vars_):
    lines = []
    concat = []
    nvars = len(vars_)
    for bit in range(width):
        ones = [key for key in valid_keys if (values[key] >> bit) & 1]
        name = "{0}_{1}".format(prefix, bit)
        lines.append("  wire {0} = {1};".format(name, sop_expr(nvars, vars_, ones, dc_keys)))
        concat.append(name)
    return lines, "{" + ", ".join(reversed(concat)) + "}"


def render_mul_product_attr(module):
    attrs = []
    small = []
    for product in range(1, 50):
        if not any(sa * sb == product for sa in range(8) for sb in range(8)):
            continue
        zero_hi, sat_lo, bias, mant = mul_class(product)
        attrs.append(
            "        6'd{0}: attr = {{1'b1, 6'd{1}, 6'd{2}, 5'd{3}, 2'd{4}}};".format(
                product, zero_hi, sat_lo, bias, mant
            )
        )
        for step in range(1, 4):
            mag = FP8.mul_mag_from_product(product, zero_hi + step)
            if mag:
                small.append(
                    "        8'h{0:02x}: small_mag = 7'h{1:02x};".format((product << 2) | step, mag)
                )
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] a = in[15:8];
  wire [7:0] b = in[7:0];
  wire [6:0] am = a[6:0];
  wire [6:0] bm = b[6:0];
  wire nan = (am == 7'h7f) || (bm == 7'h7f);
  wire sign = a[7] ^ b[7];
@COMMON@
  function [19:0] class_attr;
    input [5:0] product;
    reg [19:0] attr;
    begin
      case (product)
@ATTRS@
        default: attr = 20'd0;
      endcase
      class_attr = attr;
    end
  endfunction

  function [6:0] small_mag;
    input [7:0] key;
    begin
      case (key)
@SMALL@
        default: small_mag = 7'h00;
      endcase
    end
  endfunction

  wire [2:0] sig_a = sig3(am);
  wire [2:0] sig_b = sig3(bm);
  wire [5:0] product = sig_a * sig_b;
  wire [5:0] exp_sum = eff_exp(am) + eff_exp(bm);
  wire [19:0] attr = class_attr(product);
  wire valid = attr[19];
  wire [5:0] zero_hi = attr[18:13];
  wire [5:0] sat_lo = attr[12:7];
  wire [4:0] bias = attr[6:2];
  wire [1:0] mant = attr[1:0];
  wire zero = !valid || (exp_sum <= zero_hi);
  wire sat = exp_sum >= sat_lo;
  wire [5:0] step = exp_sum - zero_hi;
  wire [5:0] out_exp6 = exp_sum - {1'b0, bias};
  wire [6:0] linear_mag = {out_exp6[4:0], mant};
  wire [6:0] low_mag = small_mag({product, step[1:0]});
  wire [6:0] mag = zero ? 7'h00 : ((step <= 6'd3) ? low_mag : (sat ? 7'h7e : linear_mag));
  assign out = nan ? 8'h7f : {sign, mag};
endmodule
""".replace("@MODULE@", module).replace("@COMMON@", common_sig_eff()).replace("@ATTRS@", "\n".join(attrs)).replace("@SMALL@", "\n".join(small))


def render_mul_sigpair_attr(module):
    attrs = []
    small = []
    for sig_a in range(8):
        for sig_b in range(8):
            key = (sig_a << 3) | sig_b
            product = sig_a * sig_b
            if product == 0:
                continue
            zero_hi, sat_lo, bias, mant = mul_class(product)
            attrs.append(
                "        6'h{0:02x}: attr = {{1'b1, 6'd{1}, 6'd{2}, 5'd{3}, 2'd{4}}};".format(
                    key, zero_hi, sat_lo, bias, mant
                )
            )
            for step in range(1, 4):
                mag = FP8.mul_mag_from_product(product, zero_hi + step)
                if mag:
                    small.append("        8'h{0:02x}: small_mag = 7'h{1:02x};".format((key << 2) | step, mag))
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] a = in[15:8];
  wire [7:0] b = in[7:0];
  wire [6:0] am = a[6:0];
  wire [6:0] bm = b[6:0];
  wire nan = (am == 7'h7f) || (bm == 7'h7f);
  wire sign = a[7] ^ b[7];
@COMMON@
  function [19:0] class_attr;
    input [5:0] sig_key;
    reg [19:0] attr;
    begin
      case (sig_key)
@ATTRS@
        default: attr = 20'd0;
      endcase
      class_attr = attr;
    end
  endfunction

  function [6:0] small_mag;
    input [7:0] key;
    begin
      case (key)
@SMALL@
        default: small_mag = 7'h00;
      endcase
    end
  endfunction

  wire [2:0] sig_a = sig3(am);
  wire [2:0] sig_b = sig3(bm);
  wire [5:0] sig_key = {sig_a, sig_b};
  wire [5:0] exp_sum = eff_exp(am) + eff_exp(bm);
  wire [19:0] attr = class_attr(sig_key);
  wire valid = attr[19];
  wire [5:0] zero_hi = attr[18:13];
  wire [5:0] sat_lo = attr[12:7];
  wire [4:0] bias = attr[6:2];
  wire [1:0] mant = attr[1:0];
  wire zero = !valid || (exp_sum <= zero_hi);
  wire sat = exp_sum >= sat_lo;
  wire [5:0] step = exp_sum - zero_hi;
  wire [5:0] out_exp6 = exp_sum - {1'b0, bias};
  wire [6:0] linear_mag = {out_exp6[4:0], mant};
  wire [6:0] low_mag = small_mag({sig_key, step[1:0]});
  wire [6:0] mag = zero ? 7'h00 : ((step <= 6'd3) ? low_mag : (sat ? 7'h7e : linear_mag));
  assign out = nan ? 8'h7f : {sign, mag};
endmodule
""".replace("@MODULE@", module).replace("@COMMON@", common_sig_eff()).replace("@ATTRS@", "\n".join(attrs)).replace("@SMALL@", "\n".join(small))


def render_div_sigpair_attr(module):
    attrs = []
    small = []
    for sig_n in range(8):
        for sig_d in range(8):
            key = (sig_n << 3) | sig_d
            if sig_n == 0 or sig_d == 0:
                continue
            zero_hi, sat_lo, offset, mant = div_class(sig_n, sig_d)
            attrs.append(
                "        6'h{0:02x}: attr = {{1'b1, {1}, {2}, 5'd{3}, 2'd{4}}};".format(
                    key, sconst(zero_hi), sconst(sat_lo), offset, mant
                )
            )
            for step in range(1, 4):
                mag = FP8.div_mag_from_sig_delta(sig_n, sig_d, zero_hi + step)
                if mag:
                    small.append("        8'h{0:02x}: small_mag = 7'h{1:02x};".format((key << 2) | step, mag))
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] den = in[15:8];
  wire [7:0] num = in[7:0];
  wire [6:0] dm = den[6:0];
  wire [6:0] nm = num[6:0];
  wire nan = (dm == 7'h7f) || (nm == 7'h7f);
  wire den_zero = (dm == 7'h00);
  wire num_zero = (nm == 7'h00);
  wire sign = den[7] ^ num[7];
@COMMON@
  function [21:0] class_attr;
    input [5:0] sig_key;
    reg [21:0] attr;
    begin
      case (sig_key)
@ATTRS@
        default: attr = 22'd0;
      endcase
      class_attr = attr;
    end
  endfunction

  function [6:0] small_mag;
    input [7:0] key;
    begin
      case (key)
@SMALL@
        default: small_mag = 7'h00;
      endcase
    end
  endfunction

  wire [2:0] sig_n = sig3(nm);
  wire [2:0] sig_d = sig3(dm);
  wire [5:0] sig_key = {sig_n, sig_d};
  wire signed [6:0] delta = $signed({1'b0, eff_exp(nm)}) - $signed({1'b0, eff_exp(dm)});
  wire [21:0] attr = class_attr(sig_key);
  wire valid = attr[21];
  wire signed [6:0] zero_hi = attr[20:14];
  wire signed [6:0] sat_lo = attr[13:7];
  wire [4:0] offset = attr[6:2];
  wire [1:0] mant = attr[1:0];
  wire zero = !valid || (delta <= zero_hi);
  wire sat = delta >= sat_lo;
  wire [6:0] step = delta - zero_hi;
  wire signed [6:0] out_exp_s = delta + $signed({2'b0, offset});
  wire [6:0] linear_mag = {out_exp_s[4:0], mant};
  wire [6:0] low_mag = small_mag({sig_key, step[1:0]});
  wire invalid = nan || (den_zero && num_zero);
  wire [6:0] mag = den_zero ? 7'h7e : (zero ? 7'h00 : (sat ? 7'h7e : ((step <= 7'sd3) ? low_mag : linear_mag)));
  assign out = invalid ? 8'h7f : {sign, mag};
endmodule
""".replace("@MODULE@", module).replace("@COMMON@", common_sig_eff()).replace("@ATTRS@", "\n".join(attrs)).replace("@SMALL@", "\n".join(small))


def render_div_sigpair_split_attr(module):
    zero_lines = []
    sat_lines = []
    offset_lines = []
    mant_lines = []
    small = []
    for sig_n in range(1, 8):
        for sig_d in range(1, 8):
            key = (sig_n << 3) | sig_d
            zero_hi, sat_lo, offset, mant = div_class(sig_n, sig_d)
            zero_lines.append("        6'h{0:02x}: zero_hi_table = {1};".format(key, sconst(zero_hi)))
            sat_lines.append("        6'h{0:02x}: sat_lo_table = {1};".format(key, sconst(sat_lo)))
            offset_lines.append("        6'h{0:02x}: offset_table = 5'd{1};".format(key, offset))
            mant_lines.append("        6'h{0:02x}: mant_table = 2'd{1};".format(key, mant))
            for step in range(1, 4):
                mag = FP8.div_mag_from_sig_delta(sig_n, sig_d, zero_hi + step)
                if mag:
                    small.append("        8'h{0:02x}: small_mag = 7'h{1:02x};".format((key << 2) | step, mag))
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] den = in[15:8];
  wire [7:0] num = in[7:0];
  wire [6:0] dm = den[6:0];
  wire [6:0] nm = num[6:0];
  wire nan = (dm == 7'h7f) || (nm == 7'h7f);
  wire den_zero = (dm == 7'h00);
  wire num_zero = (nm == 7'h00);
  wire sign = den[7] ^ num[7];
@COMMON@
  function signed [6:0] zero_hi_table;
    input [5:0] sig_key;
    begin
      case (sig_key)
@ZERO@
        default: zero_hi_table = 7'sd0;
      endcase
    end
  endfunction

  function signed [6:0] sat_lo_table;
    input [5:0] sig_key;
    begin
      case (sig_key)
@SAT@
        default: sat_lo_table = 7'sd0;
      endcase
    end
  endfunction

  function [4:0] offset_table;
    input [5:0] sig_key;
    begin
      case (sig_key)
@OFFSET@
        default: offset_table = 5'd0;
      endcase
    end
  endfunction

  function [1:0] mant_table;
    input [5:0] sig_key;
    begin
      case (sig_key)
@MANT@
        default: mant_table = 2'd0;
      endcase
    end
  endfunction

  function [6:0] small_mag;
    input [7:0] key;
    begin
      case (key)
@SMALL@
        default: small_mag = 7'h00;
      endcase
    end
  endfunction

  wire [2:0] sig_n = sig3(nm);
  wire [2:0] sig_d = sig3(dm);
  wire [5:0] sig_key = {sig_n, sig_d};
  wire valid = (sig_n != 3'd0) && (sig_d != 3'd0);
  wire signed [6:0] delta = $signed({1'b0, eff_exp(nm)}) - $signed({1'b0, eff_exp(dm)});
  wire signed [6:0] zero_hi = zero_hi_table(sig_key);
  wire signed [6:0] sat_lo = sat_lo_table(sig_key);
  wire [4:0] offset = offset_table(sig_key);
  wire [1:0] mant = mant_table(sig_key);
  wire zero = !valid || (delta <= zero_hi);
  wire sat = delta >= sat_lo;
  wire signed [6:0] step = delta - zero_hi;
  wire signed [6:0] out_exp_s = delta + $signed({2'b0, offset});
  wire [6:0] linear_mag = {out_exp_s[4:0], mant};
  wire [6:0] low_mag = small_mag({sig_key, step[1:0]});
  wire invalid = nan || (den_zero && num_zero);
  wire [6:0] mag = den_zero ? 7'h7e : (zero ? 7'h00 : (sat ? 7'h7e : ((step <= 7'sd3) ? low_mag : linear_mag)));
  assign out = invalid ? 8'h7f : {sign, mag};
endmodule
""".replace("@MODULE@", module).replace("@COMMON@", common_sig_eff()).replace("@ZERO@", "\n".join(zero_lines)).replace("@SAT@", "\n".join(sat_lines)).replace("@OFFSET@", "\n".join(offset_lines)).replace("@MANT@", "\n".join(mant_lines)).replace("@SMALL@", "\n".join(small))


def render_div_threshold_compare(module):
    """Division core from quotient threshold comparisons instead of attr table."""
    small = []
    for sig_n in range(1, 8):
        for sig_d in range(1, 8):
            key = (sig_n << 3) | sig_d
            zero_hi, _sat_lo, _offset, _mant = div_class(sig_n, sig_d)
            for step in range(1, 4):
                mag = FP8.div_mag_from_sig_delta(sig_n, sig_d, zero_hi + step)
                if mag:
                    small.append("        8'h{0:02x}: small_mag = 7'h{1:02x};".format((key << 2) | step, mag))
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] den = in[15:8];
  wire [7:0] num = in[7:0];
  wire [6:0] dm = den[6:0];
  wire [6:0] nm = num[6:0];
  wire nan = (dm == 7'h7f) || (nm == 7'h7f);
  wire den_zero = (dm == 7'h00);
  wire num_zero = (nm == 7'h00);
  wire sign = den[7] ^ num[7];
@COMMON@
  function signed [3:0] quotient_shift;
    input [2:0] sn;
    input [2:0] sd;
    reg [5:0] n6;
    reg [5:0] d6;
    begin
      n6 = {3'd0, sn};
      d6 = {3'd0, sd};
      if (n6 >= (d6 << 2)) quotient_shift = 4'sd2;
      else if (n6 >= (d6 << 1)) quotient_shift = 4'sd1;
      else if (n6 >= d6) quotient_shift = 4'sd0;
      else if ((n6 << 1) >= d6) quotient_shift = -4'sd1;
      else if ((n6 << 2) >= d6) quotient_shift = -4'sd2;
      else quotient_shift = -4'sd3;
    end
  endfunction

  function [2:0] rounded_sig;
    input [2:0] sn;
    input [2:0] sd;
    reg [5:0] n6;
    reg [5:0] d6;
    reg [9:0] lhs;
    reg [9:0] t45;
    reg [9:0] t55;
    reg [9:0] t65;
    begin
      n6 = {3'd0, sn};
      d6 = {3'd0, sd};
      if (n6 >= (d6 << 2)) begin
        n6 = n6;
        d6 = d6 << 2;
      end else if (n6 >= (d6 << 1)) begin
        n6 = n6;
        d6 = d6 << 1;
      end else if (n6 >= d6) begin
        n6 = n6;
        d6 = d6;
      end else if ((n6 << 1) >= d6) begin
        n6 = n6 << 1;
        d6 = d6;
      end else if ((n6 << 2) >= d6) begin
        n6 = n6 << 2;
        d6 = d6;
      end else begin
        n6 = n6 << 3;
        d6 = d6;
      end
      lhs = {1'b0, n6, 3'b000};
      t45 = (d6 << 3) + d6;
      t55 = (d6 << 3) + (d6 << 1) + d6;
      t65 = (d6 << 3) + (d6 << 2) + d6;
      if (lhs <= t45) rounded_sig = 3'd4;
      else if (lhs < t55) rounded_sig = 3'd5;
      else if (lhs <= t65) rounded_sig = 3'd6;
      else rounded_sig = 3'd7;
    end
  endfunction

  function [6:0] small_mag;
    input [7:0] key;
    begin
      case (key)
@SMALL@
        default: small_mag = 7'h00;
      endcase
    end
  endfunction

  wire [2:0] sig_n = sig3(nm);
  wire [2:0] sig_d = sig3(dm);
  wire signed [6:0] delta = $signed({1'b0, eff_exp(nm)}) - $signed({1'b0, eff_exp(dm)});
  wire signed [3:0] qsh4 = quotient_shift(sig_n, sig_d);
  wire signed [6:0] qsh = {{3{qsh4[3]}}, qsh4};
  wire [2:0] qsig = rounded_sig(sig_n, sig_d);
  wire qsig_ge5 = qsig >= 3'd5;
  wire qsig_ge6 = qsig >= 3'd6;
  wire signed [6:0] zero_hi = -7'sd17 - qsh - $signed({6'd0, qsig_ge5});
  wire signed [6:0] sat_lo = 7'sd17 - qsh - $signed({6'd0, qsig_ge6});
  wire signed [6:0] step = delta - zero_hi;
  wire signed [6:0] out_exp_s = delta + 7'sd15 + qsh;
  wire [6:0] linear_mag = {out_exp_s[4:0], qsig[1:0]};
  wire [5:0] sig_key = {sig_n, sig_d};
  wire [6:0] low_mag = small_mag({sig_key, step[1:0]});
  wire valid = (sig_n != 3'd0) && (sig_d != 3'd0);
  wire zero = !valid || (delta <= zero_hi);
  wire sat = delta >= sat_lo;
  wire invalid = nan || (den_zero && num_zero);
  wire [6:0] mag = den_zero ? 7'h7e : (zero ? 7'h00 : (sat ? 7'h7e : ((step <= 7'sd3) ? low_mag : linear_mag)));
  assign out = invalid ? 8'h7f : {sign, mag};
endmodule
""".replace("@MODULE@", module).replace("@COMMON@", common_sig_eff()).replace("@SMALL@", "\n".join(small))


def render_mul_sigpair_minlogic_full(module):
    vars6 = ["sig_a[2]", "sig_a[1]", "sig_a[0]", "sig_b[2]", "sig_b[1]", "sig_b[0]"]
    valid = [(sa << 3) | sb for sa in range(1, 8) for sb in range(1, 8)]
    dcs = [key for key in range(64) if key not in valid]
    zero_vals = {}
    sat_vals = {}
    bias_vals = {}
    mant_vals = {}
    for sa in range(1, 8):
        for sb in range(1, 8):
            key = (sa << 3) | sb
            zero_hi, sat_lo, bias, mant = mul_class(sa * sb)
            zero_vals[key] = zero_hi
            sat_vals[key] = sat_lo
            bias_vals[key] = bias
            mant_vals[key] = mant
    lines = []
    z_lines, z_vec = vector_logic_lines("zero_hi_b", 6, zero_vals, valid, dcs, vars6)
    s_lines, s_vec = vector_logic_lines("sat_lo_b", 6, sat_vals, valid, dcs, vars6)
    b_lines, b_vec = vector_logic_lines("bias_b", 5, bias_vals, valid, dcs, vars6)
    m_lines, m_vec = vector_logic_lines("mant_b", 2, mant_vals, valid, dcs, vars6)
    lines.extend(z_lines + s_lines + b_lines + m_lines)

    vars8 = vars6 + ["step[1]", "step[0]"]
    valid_small = []
    dc_small = []
    small_vals = {}
    for key in range(256):
        sa = (key >> 5) & 0x7
        sb = (key >> 2) & 0x7
        st = key & 0x3
        if 1 <= sa <= 7 and 1 <= sb <= 7 and st in (1, 2, 3):
            valid_small.append(key)
            zero_hi, _sat_lo, _bias, _mant = mul_class(sa * sb)
            small_vals[key] = FP8.mul_mag_from_product(sa * sb, zero_hi + st)
        else:
            dc_small.append(key)
    low_lines, low_vec = vector_logic_lines("low_b", 7, small_vals, valid_small, dc_small, vars8)
    lines.extend(low_lines)
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] a = in[15:8];
  wire [7:0] b = in[7:0];
  wire [6:0] am = a[6:0];
  wire [6:0] bm = b[6:0];
  wire nan = (am == 7'h7f) || (bm == 7'h7f);
  wire sign = a[7] ^ b[7];
@COMMON@
  wire [2:0] sig_a = sig3(am);
  wire [2:0] sig_b = sig3(bm);
@LOGIC@
  wire valid = (sig_a != 3'd0) && (sig_b != 3'd0);
  wire [5:0] zero_hi = @ZERO@;
  wire [5:0] sat_lo = @SAT@;
  wire [4:0] bias = @BIAS@;
  wire [1:0] mant = @MANT@;
  wire [5:0] exp_sum = eff_exp(am) + eff_exp(bm);
  wire zero = !valid || (exp_sum <= zero_hi);
  wire sat = exp_sum >= sat_lo;
  wire [5:0] step = exp_sum - zero_hi;
  wire [5:0] out_exp6 = exp_sum - {1'b0, bias};
  wire [6:0] linear_mag = {out_exp6[4:0], mant};
  wire [6:0] low_mag = @LOW@;
  wire [6:0] mag = zero ? 7'h00 : ((step <= 6'd3) ? low_mag : (sat ? 7'h7e : linear_mag));
  assign out = nan ? 8'h7f : {sign, mag};
endmodule
""".replace("@MODULE@", module).replace("@COMMON@", common_sig_eff()).replace("@LOGIC@", "\n".join(lines)).replace("@ZERO@", z_vec).replace("@SAT@", s_vec).replace("@BIAS@", b_vec).replace("@MANT@", m_vec).replace("@LOW@", low_vec)


def render_div_sigpair_minlogic_full(module):
    vars6 = ["sig_n[2]", "sig_n[1]", "sig_n[0]", "sig_d[2]", "sig_d[1]", "sig_d[0]"]
    valid = [(sn << 3) | sd for sn in range(1, 8) for sd in range(1, 8)]
    dcs = [key for key in range(64) if key not in valid]
    zero_vals = {}
    sat_vals = {}
    offset_vals = {}
    mant_vals = {}
    for sn in range(1, 8):
        for sd in range(1, 8):
            key = (sn << 3) | sd
            zero_hi, sat_lo, offset, mant = div_class(sn, sd)
            zero_vals[key] = zero_hi & 0x7F
            sat_vals[key] = sat_lo & 0x7F
            offset_vals[key] = offset
            mant_vals[key] = mant
    lines = []
    z_lines, z_vec = vector_logic_lines("zero_hi_b", 7, zero_vals, valid, dcs, vars6)
    s_lines, s_vec = vector_logic_lines("sat_lo_b", 7, sat_vals, valid, dcs, vars6)
    o_lines, o_vec = vector_logic_lines("offset_b", 5, offset_vals, valid, dcs, vars6)
    m_lines, m_vec = vector_logic_lines("mant_b", 2, mant_vals, valid, dcs, vars6)
    lines.extend(z_lines + s_lines + o_lines + m_lines)

    vars8 = vars6 + ["step[1]", "step[0]"]
    valid_small = []
    dc_small = []
    small_vals = {}
    for key in range(256):
        sn = (key >> 5) & 0x7
        sd = (key >> 2) & 0x7
        st = key & 0x3
        if 1 <= sn <= 7 and 1 <= sd <= 7 and st in (1, 2, 3):
            valid_small.append(key)
            zero_hi, _sat_lo, _offset, _mant = div_class(sn, sd)
            small_vals[key] = FP8.div_mag_from_sig_delta(sn, sd, zero_hi + st)
        else:
            dc_small.append(key)
    low_lines, low_vec = vector_logic_lines("low_b", 7, small_vals, valid_small, dc_small, vars8)
    lines.extend(low_lines)
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] den = in[15:8];
  wire [7:0] num = in[7:0];
  wire [6:0] dm = den[6:0];
  wire [6:0] nm = num[6:0];
  wire nan = (dm == 7'h7f) || (nm == 7'h7f);
  wire den_zero = (dm == 7'h00);
  wire num_zero = (nm == 7'h00);
  wire sign = den[7] ^ num[7];
@COMMON@
  wire [2:0] sig_n = sig3(nm);
  wire [2:0] sig_d = sig3(dm);
@LOGIC@
  wire valid = (sig_n != 3'd0) && (sig_d != 3'd0);
  wire signed [6:0] delta = $signed({1'b0, eff_exp(nm)}) - $signed({1'b0, eff_exp(dm)});
  wire signed [6:0] zero_hi = @ZERO@;
  wire signed [6:0] sat_lo = @SAT@;
  wire [4:0] offset = @OFFSET@;
  wire [1:0] mant = @MANT@;
  wire zero = !valid || (delta <= zero_hi);
  wire sat = delta >= sat_lo;
  wire signed [6:0] step = delta - zero_hi;
  wire signed [6:0] out_exp_s = delta + $signed({2'b0, offset});
  wire [6:0] linear_mag = {out_exp_s[4:0], mant};
  wire [6:0] low_mag = @LOW@;
  wire invalid = nan || (den_zero && num_zero);
  wire [6:0] mag = den_zero ? 7'h7e : (zero ? 7'h00 : (sat ? 7'h7e : ((step <= 7'sd3) ? low_mag : linear_mag)));
  assign out = invalid ? 8'h7f : {sign, mag};
endmodule
""".replace("@MODULE@", module).replace("@COMMON@", common_sig_eff()).replace("@LOGIC@", "\n".join(lines)).replace("@ZERO@", z_vec).replace("@SAT@", s_vec).replace("@OFFSET@", o_vec).replace("@MANT@", m_vec).replace("@LOW@", low_vec)


def render_mul_nested_sig(module, outer="a"):
    outer_is_a = outer == "a"
    outer_name = "sig_a" if outer_is_a else "sig_b"
    inner_name = "sig_b" if outer_is_a else "sig_a"
    outer_blocks = []
    for outer_sig in range(1, 8):
        inner_blocks = []
        for inner_sig in range(1, 8):
            sig_a = outer_sig if outer_is_a else inner_sig
            sig_b = inner_sig if outer_is_a else outer_sig
            lines = ["          3'd{0}: begin".format(inner_sig)]
            lines.extend(product_class_lines_for_mul(sig_a * sig_b, "            "))
            lines.append("          end")
            inner_blocks.append("\n".join(lines))
        outer_blocks.append(
            """        3'd@OUTER@: begin
          case (@INNER@)
@INNER_BLOCKS@
            default: product_mag = 7'h00;
          endcase
        end""".replace("@OUTER@", str(outer_sig)).replace("@INNER@", inner_name).replace("@INNER_BLOCKS@", "\n".join(inner_blocks))
        )
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] a = in[15:8];
  wire [7:0] b = in[7:0];
  wire [6:0] am = a[6:0];
  wire [6:0] bm = b[6:0];
  wire nan = (am == 7'h7f) || (bm == 7'h7f);
  wire sign = a[7] ^ b[7];
@COMMON@
  function [6:0] product_mag;
    input [5:0] exp_sum;
    input [2:0] sig_a;
    input [2:0] sig_b;
    begin
      case (@OUTER_NAME@)
@OUTER_BLOCKS@
        default: product_mag = 7'h00;
      endcase
    end
  endfunction

  wire [2:0] sig_a = sig3(am);
  wire [2:0] sig_b = sig3(bm);
  wire [5:0] exp_sum = eff_exp(am) + eff_exp(bm);
  assign out = nan ? 8'h7f : {sign, product_mag(exp_sum, sig_a, sig_b)};
endmodule
""".replace("@MODULE@", module).replace("@COMMON@", common_sig_eff()).replace("@OUTER_NAME@", outer_name).replace("@OUTER_BLOCKS@", "\n".join(outer_blocks))


def render_div_nested_sig(module, outer="den"):
    outer_is_den = outer == "den"
    outer_name = "sig_d" if outer_is_den else "sig_n"
    inner_name = "sig_n" if outer_is_den else "sig_d"
    outer_blocks = []
    for outer_sig in range(1, 8):
        inner_blocks = []
        for inner_sig in range(1, 8):
            sig_d = outer_sig if outer_is_den else inner_sig
            sig_n = inner_sig if outer_is_den else outer_sig
            lines = ["          3'd{0}: begin".format(inner_sig)]
            lines.extend(div_class_lines_for_key(sig_n, sig_d, "            "))
            lines.append("          end")
            inner_blocks.append("\n".join(lines))
        outer_blocks.append(
            """        3'd@OUTER@: begin
          case (@INNER@)
@INNER_BLOCKS@
            default: mag_table = 7'h00;
          endcase
        end""".replace("@OUTER@", str(outer_sig)).replace("@INNER@", inner_name).replace("@INNER_BLOCKS@", "\n".join(inner_blocks))
        )
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] den = in[15:8];
  wire [7:0] num = in[7:0];
  wire [6:0] dm = den[6:0];
  wire [6:0] nm = num[6:0];
  wire den_nan = (dm == 7'h7f);
  wire num_nan = (nm == 7'h7f);
  wire sign = den[7] ^ num[7];
  wire den_zero = (dm == 7'h00);
  wire num_zero = (nm == 7'h00);
@COMMON@
  function [6:0] mag_table;
    input signed [6:0] delta;
    input [2:0] sig_n;
    input [2:0] sig_d;
    begin
      case (@OUTER_NAME@)
@OUTER_BLOCKS@
        default: mag_table = 7'h00;
      endcase
    end
  endfunction

  wire [2:0] sig_n = sig3(nm);
  wire [2:0] sig_d = sig3(dm);
  wire signed [6:0] delta = $signed({1'b0, eff_exp(nm)}) - $signed({1'b0, eff_exp(dm)});
  wire invalid = den_nan || num_nan || (den_zero && num_zero);
  wire [6:0] core_mag = mag_table(delta, sig_n, sig_d);
  wire [6:0] out_mag = den_zero ? 7'h7e : (num_zero ? 7'h00 : core_mag);
  assign out = invalid ? 8'h7f : {sign, out_mag};
endmodule
""".replace("@MODULE@", module).replace("@COMMON@", common_sig_eff()).replace("@OUTER_NAME@", outer_name).replace("@OUTER_BLOCKS@", "\n".join(outer_blocks))


def grouped_case_blocks(width, grouped_lines):
    blocks = []
    for line_tuple, keys in grouped_lines:
        labels = ", ".join("{0}'d{1}".format(width, key) for key in keys)
        block = ["        {0}: begin".format(labels)]
        block.extend(line_tuple)
        block.append("        end")
        blocks.append("\n".join(block))
    return "\n".join(blocks)


def render_mul_product_dc_seed12_grouped(module):
    mapping = product_dc_seed_map(12)
    mapping[11] = 10
    groups = defaultdict(list)
    for product in range(1, 50):
        if product in REACHABLE_PRODUCTS:
            effective = product
        else:
            effective = mapping.get(product)
        if effective is None:
            lines = ("          product_mag = 7'h00;",)
        else:
            lines = tuple(product_class_lines_for_mul(effective, "          "))
        groups[lines].append(product)
    grouped = sorted(groups.items(), key=lambda item: item[1][0])
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] a = in[15:8];
  wire [7:0] b = in[7:0];
  wire [6:0] am = a[6:0];
  wire [6:0] bm = b[6:0];
  wire nan = (am == 7'h7f) || (bm == 7'h7f);
  wire sign = a[7] ^ b[7];
@COMMON@
  function [6:0] product_mag;
    input [5:0] exp_sum;
    input [5:0] product;
    begin
      case (product)
@BLOCKS@
        default: product_mag = 7'h00;
      endcase
    end
  endfunction

  wire [5:0] product = sig3(am) * sig3(bm);
  wire [5:0] exp_sum = eff_exp(am) + eff_exp(bm);
  assign out = nan ? 8'h7f : {sign, product_mag(exp_sum, product)};
endmodule
""".replace("@MODULE@", module).replace("@COMMON@", common_sig_eff()).replace("@BLOCKS@", grouped_case_blocks(6, grouped))


def render_div_sigpair_grouped_class(module):
    groups = defaultdict(list)
    for sig_key in range(64):
        sig_n = (sig_key >> 3) & 0x7
        sig_d = sig_key & 0x7
        if sig_n == 0 or sig_d == 0:
            lines = ("          mag_table = 7'h00;",)
        else:
            lines = tuple(div_class_lines_for_key(sig_n, sig_d, "          "))
        groups[lines].append(sig_key)
    grouped = sorted(groups.items(), key=lambda item: item[1][0])
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] den = in[15:8];
  wire [7:0] num = in[7:0];
  wire [6:0] dm = den[6:0];
  wire [6:0] nm = num[6:0];
  wire den_nan = (dm == 7'h7f);
  wire num_nan = (nm == 7'h7f);
  wire sign = den[7] ^ num[7];
  wire den_zero = (dm == 7'h00);
  wire num_zero = (nm == 7'h00);
@COMMON@
  function [6:0] mag_table;
    input signed [6:0] delta;
    input [5:0] sig_key;
    begin
      case (sig_key)
@BLOCKS@
        default: mag_table = 7'h00;
      endcase
    end
  endfunction

  wire [2:0] sig_n = sig3(nm);
  wire [2:0] sig_d = sig3(dm);
  wire signed [6:0] delta = $signed({1'b0, eff_exp(nm)}) - $signed({1'b0, eff_exp(dm)});
  wire invalid = den_nan || num_nan || (den_zero && num_zero);
  wire [6:0] core_mag = mag_table(delta, {sig_n, sig_d});
  wire [6:0] out_mag = den_zero ? 7'h7e : (num_zero ? 7'h00 : core_mag);
  assign out = invalid ? 8'h7f : {sign, out_mag};
endmodule
""".replace("@MODULE@", module).replace("@COMMON@", common_sig_eff()).replace("@BLOCKS@", grouped_case_blocks(6, grouped))


VALID_DIV_SIGKEYS = [(sn << 3) | sd for sn in range(1, 8) for sd in range(1, 8)]
INVALID_DIV_SIGKEYS = [key for key in range(64) if key not in VALID_DIV_SIGKEYS]


def div_invalid_dc_seed_map(seed):
    rng = random.Random(seed)
    choices = [None] + VALID_DIV_SIGKEYS
    return {key: choices[rng.randrange(len(choices))] for key in INVALID_DIV_SIGKEYS}


def render_div_sigpair_invalid_dc_map(module, mapping):
    blocks = []
    for sig_key in range(64):
        sig_n = (sig_key >> 3) & 0x7
        sig_d = sig_key & 0x7
        if sig_key in VALID_DIV_SIGKEYS:
            effective = sig_key
        else:
            effective = mapping.get(sig_key)
        lines = ["        6'h{0:02x}: begin".format(sig_key)]
        if effective is None:
            lines.append("          mag_table = 7'h00;")
        else:
            eff_n = (effective >> 3) & 0x7
            eff_d = effective & 0x7
            lines.extend(div_class_lines_for_key(eff_n, eff_d, "          "))
        lines.append("        end")
        blocks.append("\n".join(lines))
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] den = in[15:8];
  wire [7:0] num = in[7:0];
  wire [6:0] dm = den[6:0];
  wire [6:0] nm = num[6:0];
  wire den_nan = (dm == 7'h7f);
  wire num_nan = (nm == 7'h7f);
  wire sign = den[7] ^ num[7];
  wire den_zero = (dm == 7'h00);
  wire num_zero = (nm == 7'h00);
@COMMON@
  function [6:0] mag_table;
    input signed [6:0] delta;
    input [5:0] sig_key;
    begin
      case (sig_key)
@BLOCKS@
        default: mag_table = 7'h00;
      endcase
    end
  endfunction

  wire [2:0] sig_n = sig3(nm);
  wire [2:0] sig_d = sig3(dm);
  wire signed [6:0] delta = $signed({1'b0, eff_exp(nm)}) - $signed({1'b0, eff_exp(dm)});
  wire invalid = den_nan || num_nan || (den_zero && num_zero);
  wire [6:0] core_mag = mag_table(delta, {sig_n, sig_d});
  wire [6:0] out_mag = den_zero ? 7'h7e : (num_zero ? 7'h00 : core_mag);
  assign out = invalid ? 8'h7f : {sign, out_mag};
endmodule
""".replace("@MODULE@", module).replace("@COMMON@", common_sig_eff()).replace("@BLOCKS@", "\n".join(blocks))


def render_div_sigpair_invalid_dc_seed(module, seed):
    return render_div_sigpair_invalid_dc_map(module, div_invalid_dc_seed_map(seed))


def render_mul_threshold(module):
    small = []
    for product in range(1, 50):
        if not any(sa * sb == product for sa in range(8) for sb in range(8)):
            continue
        zero_hi, _sat_lo, _bias, _mant = mul_class(product)
        for step in range(1, 4):
            mag = FP8.mul_mag_from_product(product, zero_hi + step)
            if mag:
                small.append("        8'h{0:02x}: small_mag = 7'h{1:02x};".format((product << 2) | step, mag))
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] a = in[15:8];
  wire [7:0] b = in[7:0];
  wire [6:0] am = a[6:0];
  wire [6:0] bm = b[6:0];
  wire nan = (am == 7'h7f) || (bm == 7'h7f);
  wire sign = a[7] ^ b[7];
@COMMON@
  function [6:0] small_mag;
    input [7:0] key;
    begin
      case (key)
@SMALL@
        default: small_mag = 7'h00;
      endcase
    end
  endfunction

  function [12:0] product_attr;
    input [5:0] product;
    reg [5:0] zero_hi;
    reg [4:0] bias;
    reg [1:0] mant;
    begin
      if (product <= 6'd1) zero_hi = 6'd17;
      else if (product <= 6'd2) zero_hi = 6'd16;
      else if (product <= 6'd4) zero_hi = 6'd15;
      else if (product <= 6'd8) zero_hi = 6'd14;
      else if (product <= 6'd16) zero_hi = 6'd13;
      else if (product <= 6'd30) zero_hi = 6'd12;
      else zero_hi = 6'd11;

      if (product <= 6'd1) begin
        bias = 5'd19; mant = 2'd0;
      end else if (product <= 6'd3) begin
        bias = 5'd18; mant = (product == 6'd3) ? 2'd2 : 2'd0;
      end else if (product <= 6'd7) begin
        bias = 5'd17; mant = product[1:0];
      end else if (product <= 6'd14) begin
        bias = 5'd16;
        if (product >= 6'd13) mant = 2'd3;
        else if (product >= 6'd11) mant = 2'd2;
        else if (product >= 6'd10) mant = 2'd1;
        else mant = 2'd0;
      end else if (product <= 6'd28) begin
        bias = 5'd15;
        if (product >= 6'd27) mant = 2'd3;
        else if (product >= 6'd23) mant = 2'd2;
        else if (product >= 6'd19) mant = 2'd1;
        else mant = 2'd0;
      end else begin
        bias = 5'd14;
        if (product >= 6'd46) mant = 2'd2;
        else if (product >= 6'd39) mant = 2'd1;
        else mant = 2'd0;
      end
      product_attr = {zero_hi, bias, mant};
    end
  endfunction

  wire [2:0] sig_a = sig3(am);
  wire [2:0] sig_b = sig3(bm);
  wire [5:0] product = sig_a * sig_b;
  wire [5:0] exp_sum = eff_exp(am) + eff_exp(bm);
  wire [12:0] attr = product_attr(product);
  wire [5:0] zero_hi = attr[12:7];
  wire [4:0] bias = attr[6:2];
  wire [1:0] mant = attr[1:0];
  wire [5:0] step = exp_sum - zero_hi;
  wire [5:0] out_exp6 = exp_sum - {1'b0, bias};
  wire zero = (product == 6'd0) || (exp_sum <= zero_hi);
  wire sat = (out_exp6 > 6'd31) || ((out_exp6 == 6'd31) && (mant >= 2'd2));
  wire [6:0] low_mag = small_mag({product, step[1:0]});
  wire [6:0] linear_mag = {out_exp6[4:0], mant};
  wire [6:0] mag = zero ? 7'h00 : ((step <= 6'd3) ? low_mag : (sat ? 7'h7e : linear_mag));
  assign out = nan ? 8'h7f : {sign, mag};
endmodule
""".replace("@MODULE@", module).replace("@COMMON@", common_sig_eff()).replace("@SMALL@", "\n".join(small))


def render_mul_logcode(module):
    nn_low = []
    for ma in range(4):
        for mb in range(4):
            mant_key = (ma << 2) | mb
            for base in range(-8, 6):
                found = None
                for ea in range(1, 31):
                    for eb in range(1, 31):
                        am = (ea << 2) | ma
                        bm = (eb << 2) | mb
                        if am + bm - 0x3C == base:
                            found = FP8.mul(am, bm) & 0x7F
                            break
                    if found is not None:
                        break
                if found:
                    key = (mant_key << 4) | (base + 8)
                    nn_low.append("        8'h{0:02x}: nn_low_mag = 7'h{1:02x};".format(key, found))
    sub_low = []
    for sub_m in range(1, 4):
        for norm_mag in range(4, 68):
            if norm_mag == 0x7F:
                continue
            out = FP8.mul(sub_m, norm_mag) & 0x7F
            if out:
                key = (sub_m << 7) | norm_mag
                sub_low.append("        9'h{0:03x}: sub_low_mag = 7'h{1:02x};".format(key, out))
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] a = in[15:8];
  wire [7:0] b = in[7:0];
  wire [6:0] am = a[6:0];
  wire [6:0] bm = b[6:0];
  wire [4:0] ae = am[6:2];
  wire [4:0] be = bm[6:2];
  wire nan = (am == 7'h7f) || (bm == 7'h7f);
  wire sign = a[7] ^ b[7];
  wire a_norm = (ae != 5'd0);
  wire b_norm = (be != 5'd0);

  function [6:0] nn_low_mag;
    input [7:0] key;
    begin
      case (key)
@NN_LOW@
        default: nn_low_mag = 7'h00;
      endcase
    end
  endfunction

  function [6:0] sub_low_mag;
    input [8:0] key;
    begin
      case (key)
@SUB_LOW@
        default: sub_low_mag = 7'h00;
      endcase
    end
  endfunction

  function [6:0] one_sub_mag;
    input [1:0] sub_m;
    input [6:0] norm_m;
    reg signed [8:0] lin;
    reg signed [8:0] corr;
    begin
      case ({sub_m, norm_m[1:0]})
        4'h4, 4'h5, 4'h6, 4'h7: corr = -9'sd64;
        4'h8, 4'h9, 4'ha, 4'hb: corr = -9'sd60;
        4'hc: corr = -9'sd58;
        4'hd: corr = -9'sd57;
        4'he: corr = -9'sd58;
        4'hf: corr = -9'sd58;
        default: corr = -9'sd80;
      endcase
      lin = $signed({2'b0, norm_m}) + corr;
      if (sub_m == 2'd0) one_sub_mag = 7'h00;
      else if (norm_m <= 7'd67) one_sub_mag = sub_low_mag({sub_m, norm_m});
      else one_sub_mag = lin[6:0];
    end
  endfunction

  wire [3:0] mant_key = {am[1:0], bm[1:0]};
  wire signed [8:0] base = $signed({2'b0, am}) + $signed({2'b0, bm}) - 9'sd60;
  wire corr1 = ((am[1:0] == 2'd1) && (bm[1:0] == 2'd2)) ||
               ((am[1:0] == 2'd2) && (bm[1:0] == 2'd1));
  wire signed [8:0] lin_nn = base + $signed({8'd0, corr1});
  wire [3:0] base_low_key = base[3:0] + 4'd8;
  wire [6:0] nn_linear = (lin_nn >= 9'sd126) ? 7'h7e : lin_nn[6:0];
  wire [6:0] nn_mag = (base < -9'sd8) ? 7'h00 :
                      ((base <= 9'sd5) ? nn_low_mag({mant_key, base_low_key}) : nn_linear);
  wire [6:0] a_sub_b_norm = one_sub_mag(am[1:0], bm);
  wire [6:0] b_sub_a_norm = one_sub_mag(bm[1:0], am);
  wire [6:0] mag = (a_norm && b_norm) ? nn_mag :
                   (a_norm ? b_sub_a_norm : (b_norm ? a_sub_b_norm : 7'h00));
  assign out = nan ? 8'h7f : {sign, mag};
endmodule
""".replace("@MODULE@", module).replace("@NN_LOW@", "\n".join(nn_low)).replace("@SUB_LOW@", "\n".join(sub_low))


def product_class_lines_for_mul(product, indent):
    zero_hi, sat_lo, bias, mant = mul_class(product)
    vals = {exp_sum: FP8.mul_mag_from_product(product, exp_sum) for exp_sum in range(2, 63)}
    specials = []
    for exp_sum, mag in vals.items():
        if not (zero_hi < exp_sum < sat_lo):
            continue
        linear = (((exp_sum - bias) << 2) | mant) if exp_sum >= bias else None
        if mag < 4 or linear is None or mag != linear:
            specials.append((exp_sum, mag))
    lines = [indent + "if (exp_sum <= 6'd{0}) product_mag = 7'h00;".format(zero_hi)]
    for exp_sum, mag in specials:
        lines.append(indent + "else if (exp_sum == 6'd{0}) product_mag = 7'h{1:02x};".format(exp_sum, mag))
    lines.append(indent + "else if (exp_sum >= 6'd{0}) product_mag = 7'h7e;".format(sat_lo))
    lines.append(indent + "else product_mag = (((exp_sum - 6'd{0}) << 2) | 7'd{1});".format(bias, mant))
    return lines


REACHABLE_PRODUCTS = sorted({sa * sb for sa in range(8) for sb in range(8)} - {0})
SMALL_PATTERNS = {
    (1, 2, 4): 0,
    (1, 1, 2): 1,
    (1, 1, 3): 2,
    (1, 2, 3): 3,
}


def small_pattern(vals):
    try:
        return SMALL_PATTERNS[tuple(vals)]
    except KeyError as exc:
        raise RuntimeError("unexpected small pattern {0}".format(vals)) from exc


def low_from_smallpat_function(name="low_from_pat"):
    return """  function [6:0] @NAME@;
    input [1:0] pat;
    input [1:0] step;
    begin
      case ({pat, step})
        4'h1, 4'h5, 4'h9, 4'hd: @NAME@ = 7'h01;
        4'h2, 4'h7, 4'he: @NAME@ = 7'h02;
        4'h6, 4'ha: @NAME@ = 7'h01;
        4'h3: @NAME@ = 7'h04;
        default: @NAME@ = 7'h03;
      endcase
    end
  endfunction
""".replace("@NAME@", name)


def nearest_reachable_product(product, mode):
    lows = [item for item in REACHABLE_PRODUCTS if item <= product]
    highs = [item for item in REACHABLE_PRODUCTS if item >= product]
    if mode == "low":
        return lows[-1] if lows else highs[0]
    if mode == "high":
        return highs[0] if highs else lows[-1]
    if mode == "nearest":
        options = []
        if lows:
            options.append(lows[-1])
        if highs:
            options.append(highs[0])
        return min(options, key=lambda item: (abs(item - product), item))
    raise RuntimeError("unknown nearest mode {0}".format(mode))


def render_mul_product_dc_completion(module, mode, attrs=False):
    """Render reachable product rows with several unreachable-code completions.

    The multiplier output can only be one of REACHABLE_PRODUCTS.  Rows for the
    other 6-bit product codes are exact don't-care completions after source
    elaboration, and Yosys/ABC is sensitive to that completion.
    """
    blocks = []
    for product in range(1, 50):
        if product in REACHABLE_PRODUCTS:
            effective = product
        elif mode == "semantic":
            effective = product
        elif mode == "zero":
            effective = None
        else:
            effective = nearest_reachable_product(product, mode)
        if effective is None:
            lines = ["        6'd{0}: begin".format(product), "          product_mag = 7'h00;", "        end"]
        else:
            lines = ["        6'd{0}: begin".format(product)]
            lines.extend(product_class_lines_for_mul(effective, "          "))
            lines.append("        end")
        blocks.append("\n".join(lines))
    case_kw = "(* parallel_case, full_case *) case" if attrs else "case"
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] a = in[15:8];
  wire [7:0] b = in[7:0];
  wire [6:0] am = a[6:0];
  wire [6:0] bm = b[6:0];
  wire nan = (am == 7'h7f) || (bm == 7'h7f);
  wire sign = a[7] ^ b[7];
@COMMON@
  function [6:0] product_mag;
    input [5:0] exp_sum;
    input [5:0] product;
    begin
      @CASE@ (product)
@BLOCKS@
        default: product_mag = 7'h00;
      endcase
    end
  endfunction

  wire [5:0] product = sig3(am) * sig3(bm);
  wire [5:0] exp_sum = eff_exp(am) + eff_exp(bm);
  assign out = nan ? 8'h7f : {sign, product_mag(exp_sum, product)};
endmodule
""".replace("@MODULE@", module).replace("@COMMON@", common_sig_eff()).replace("@CASE@", case_kw).replace("@BLOCKS@", "\n".join(blocks))


def product_dc_seed_map(seed):
    rng = random.Random(seed)
    mapping = {}
    for product in range(1, 50):
        if product not in REACHABLE_PRODUCTS:
            low = nearest_reachable_product(product, "low")
            high = nearest_reachable_product(product, "high")
            choices = [None, product, low, high]
            mapping[product] = choices[rng.randrange(len(choices))]
    return mapping


def render_mul_product_dc_map(module, mapping):
    blocks = []
    for product in range(1, 50):
        if product in REACHABLE_PRODUCTS:
            effective = product
        else:
            effective = mapping.get(product)
        if effective is None:
            lines = ["        6'd{0}: begin".format(product), "          product_mag = 7'h00;", "        end"]
        else:
            lines = ["        6'd{0}: begin".format(product)]
            lines.extend(product_class_lines_for_mul(effective, "          "))
            lines.append("        end")
        blocks.append("\n".join(lines))
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] a = in[15:8];
  wire [7:0] b = in[7:0];
  wire [6:0] am = a[6:0];
  wire [6:0] bm = b[6:0];
  wire nan = (am == 7'h7f) || (bm == 7'h7f);
  wire sign = a[7] ^ b[7];
@COMMON@
  function [6:0] product_mag;
    input [5:0] exp_sum;
    input [5:0] product;
    begin
      case (product)
@BLOCKS@
        default: product_mag = 7'h00;
      endcase
    end
  endfunction

  wire [5:0] product = sig3(am) * sig3(bm);
  wire [5:0] exp_sum = eff_exp(am) + eff_exp(bm);
  assign out = nan ? 8'h7f : {sign, product_mag(exp_sum, product)};
endmodule
""".replace("@MODULE@", module).replace("@COMMON@", common_sig_eff()).replace("@BLOCKS@", "\n".join(blocks))


def render_sig_product_code_function():
    lines = []
    for sig_a in range(8):
        for sig_b in range(8):
            lines.append(
                "        6'h{0:02x}: sig_product_code = 6'd{1};".format(
                    (sig_a << 3) | sig_b, sig_a * sig_b
                )
            )
    return """  function [5:0] sig_product_code;
    input [2:0] sig_a;
    input [2:0] sig_b;
    begin
      case ({sig_a, sig_b})
@LINES@
        default: sig_product_code = 6'd0;
      endcase
    end
  endfunction

""".replace("@LINES@", "\n".join(lines))


def render_mul_sigprodcode_dc_map(module, mapping):
    blocks = []
    for product in range(1, 50):
        if product in REACHABLE_PRODUCTS:
            effective = product
        else:
            effective = mapping.get(product)
        if effective is None:
            lines = ["        6'd{0}: begin".format(product), "          product_mag = 7'h00;", "        end"]
        else:
            lines = ["        6'd{0}: begin".format(product)]
            lines.extend(product_class_lines_for_mul(effective, "          "))
            lines.append("        end")
        blocks.append("\n".join(lines))
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] a = in[15:8];
  wire [7:0] b = in[7:0];
  wire [6:0] am = a[6:0];
  wire [6:0] bm = b[6:0];
  wire nan = (am == 7'h7f) || (bm == 7'h7f);
  wire sign = a[7] ^ b[7];
@COMMON@
@PRODUCT_CODE@
  function [6:0] product_mag;
    input [5:0] exp_sum;
    input [5:0] product;
    begin
      case (product)
@BLOCKS@
        default: product_mag = 7'h00;
      endcase
    end
  endfunction

  wire [2:0] sig_a = sig3(am);
  wire [2:0] sig_b = sig3(bm);
  wire [5:0] product = sig_product_code(sig_a, sig_b);
  wire [5:0] exp_sum = eff_exp(am) + eff_exp(bm);
  assign out = nan ? 8'h7f : {sign, product_mag(exp_sum, product)};
endmodule
""".replace("@MODULE@", module).replace("@COMMON@", common_sig_eff()).replace("@PRODUCT_CODE@", render_sig_product_code_function()).replace("@BLOCKS@", "\n".join(blocks))


def render_mul_sigprodcode_dc_seed12_set11to10(module):
    mapping = product_dc_seed_map(12)
    mapping[11] = 10
    return render_mul_sigprodcode_dc_map(module, mapping)


def render_mul_product_dc_seed(module, seed):
    return render_mul_product_dc_map(module, product_dc_seed_map(seed))


def render_mul_product_qclass_smallpat(module, mapping=None):
    entries = []
    for product in range(1, 50):
        if mapping is None:
            effective = product
        elif product in REACHABLE_PRODUCTS:
            effective = product
        else:
            effective = mapping.get(product)
        if effective is None:
            continue
        zero_hi, _sat_lo, bias, mant = mul_class(effective)
        vals = [FP8.mul_mag_from_product(effective, zero_hi + step) for step in range(1, 4)]
        pat = small_pattern(vals)
        entries.append(
            "        6'd{0}: product_qattr = {{1'b1, 6'd{1}, 5'd{2}, 2'd{3}, 2'd{4}}};".format(
                product, zero_hi, bias, mant, pat
            )
        )
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] a = in[15:8];
  wire [7:0] b = in[7:0];
  wire [6:0] am = a[6:0];
  wire [6:0] bm = b[6:0];
  wire nan = (am == 7'h7f) || (bm == 7'h7f);
  wire sign = a[7] ^ b[7];
@COMMON@
@LOW_PAT@
  function [15:0] product_qattr;
    input [5:0] product;
    begin
      case (product)
@ENTRIES@
        default: product_qattr = 16'd0;
      endcase
    end
  endfunction

  wire [5:0] product = sig3(am) * sig3(bm);
  wire [5:0] exp_sum = eff_exp(am) + eff_exp(bm);
  wire [15:0] attr = product_qattr(product);
  wire valid = attr[15];
  wire [5:0] zero_hi = attr[14:9];
  wire [4:0] bias = attr[8:4];
  wire [1:0] mant = attr[3:2];
  wire [1:0] pat = attr[1:0];
  wire [5:0] step = exp_sum - zero_hi;
  wire [5:0] out_exp6 = exp_sum - {1'b0, bias};
  wire zero = !valid || (exp_sum <= zero_hi);
  wire sat = (out_exp6 > 6'd31) || ((out_exp6 == 6'd31) && (mant >= 2'd2));
  wire [6:0] low_mag = low_from_pat(pat, step[1:0]);
  wire [6:0] linear_mag = {out_exp6[4:0], mant};
  wire [6:0] mag = zero ? 7'h00 : ((step <= 6'd3) ? low_mag : (sat ? 7'h7e : linear_mag));
  assign out = nan ? 8'h7f : {sign, mag};
endmodule
""".replace("@MODULE@", module).replace("@COMMON@", common_sig_eff()).replace("@LOW_PAT@", low_from_smallpat_function()).replace("@ENTRIES@", "\n".join(entries))


def product_class_lines_smallpat(product, indent):
    zero_hi, sat_lo, bias, mant = mul_class(product)
    vals = [FP8.mul_mag_from_product(product, zero_hi + step) for step in range(1, 4)]
    pat = small_pattern(vals)
    lines = [indent + "step = exp_sum - 6'd{0};".format(zero_hi)]
    lines.append(indent + "if (exp_sum <= 6'd{0}) product_mag = 7'h00;".format(zero_hi))
    lines.append(indent + "else if (step <= 6'd3) product_mag = low_from_pat(2'd{0}, step[1:0]);".format(pat))
    lines.append(indent + "else if (exp_sum >= 6'd{0}) product_mag = 7'h7e;".format(sat_lo))
    lines.append(indent + "else product_mag = (((exp_sum - 6'd{0}) << 2) | 7'd{1});".format(bias, mant))
    return lines


def render_mul_product_class_smallpat(module, mapping=None):
    blocks = []
    for product in range(1, 50):
        if mapping is None:
            effective = product
        elif product in REACHABLE_PRODUCTS:
            effective = product
        else:
            effective = mapping.get(product)
        lines = ["        6'd{0}: begin".format(product)]
        if effective is None:
            lines.append("          product_mag = 7'h00;")
        else:
            lines.extend(product_class_lines_smallpat(effective, "          "))
        lines.append("        end")
        blocks.append("\n".join(lines))
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] a = in[15:8];
  wire [7:0] b = in[7:0];
  wire [6:0] am = a[6:0];
  wire [6:0] bm = b[6:0];
  wire nan = (am == 7'h7f) || (bm == 7'h7f);
  wire sign = a[7] ^ b[7];
@COMMON@
@LOW_PAT@
  function [6:0] product_mag;
    input [5:0] exp_sum;
    input [5:0] product;
    reg [5:0] step;
    begin
      case (product)
@BLOCKS@
        default: product_mag = 7'h00;
      endcase
    end
  endfunction

  wire [5:0] product = sig3(am) * sig3(bm);
  wire [5:0] exp_sum = eff_exp(am) + eff_exp(bm);
  assign out = nan ? 8'h7f : {sign, product_mag(exp_sum, product)};
endmodule
""".replace("@MODULE@", module).replace("@COMMON@", common_sig_eff()).replace("@LOW_PAT@", low_from_smallpat_function()).replace("@BLOCKS@", "\n".join(blocks))


def render_mul_product_bound_smallpat(module, mapping=None):
    entries = []
    for product in range(1, 50):
        if mapping is None:
            effective = product
        elif product in REACHABLE_PRODUCTS:
            effective = product
        else:
            effective = mapping.get(product)
        if effective is None:
            continue
        zero_hi, sat_lo, bias, mant = mul_class(effective)
        vals = [FP8.mul_mag_from_product(effective, zero_hi + step) for step in range(1, 4)]
        pat = small_pattern(vals)
        entries.append(
            "        6'd{0}: product_attr = {{1'b1, 6'd{1}, 6'd{2}, 5'd{3}, 2'd{4}, 2'd{5}}};".format(
                product, zero_hi, sat_lo, bias, mant, pat
            )
        )
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] a = in[15:8];
  wire [7:0] b = in[7:0];
  wire [6:0] am = a[6:0];
  wire [6:0] bm = b[6:0];
  wire nan = (am == 7'h7f) || (bm == 7'h7f);
  wire sign = a[7] ^ b[7];
@COMMON@
@LOW_PAT@
  function [21:0] product_attr;
    input [5:0] product;
    begin
      case (product)
@ENTRIES@
        default: product_attr = 22'd0;
      endcase
    end
  endfunction

  wire [5:0] product = sig3(am) * sig3(bm);
  wire [5:0] exp_sum = eff_exp(am) + eff_exp(bm);
  wire [21:0] attr = product_attr(product);
  wire valid = attr[21];
  wire [5:0] zero_hi = attr[20:15];
  wire [5:0] sat_lo = attr[14:9];
  wire [4:0] bias = attr[8:4];
  wire [1:0] mant = attr[3:2];
  wire [1:0] pat = attr[1:0];
  wire [5:0] step = exp_sum - zero_hi;
  wire [5:0] out_exp6 = exp_sum - {1'b0, bias};
  wire zero = !valid || (exp_sum <= zero_hi);
  wire sat = exp_sum >= sat_lo;
  wire [6:0] low_mag = low_from_pat(pat, step[1:0]);
  wire [6:0] linear_mag = {out_exp6[4:0], mant};
  wire [6:0] mag = zero ? 7'h00 : ((step <= 6'd3) ? low_mag : (sat ? 7'h7e : linear_mag));
  assign out = nan ? 8'h7f : {sign, mag};
endmodule
""".replace("@MODULE@", module).replace("@COMMON@", common_sig_eff()).replace("@LOW_PAT@", low_from_smallpat_function()).replace("@ENTRIES@", "\n".join(entries))


def render_mul_product_possible_class(module):
    blocks = []
    for product in REACHABLE_PRODUCTS:
        lines = ["        6'd{0}: begin".format(product)]
        lines.extend(product_class_lines_for_mul(product, "          "))
        lines.append("        end")
        blocks.append("\n".join(lines))
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] a = in[15:8];
  wire [7:0] b = in[7:0];
  wire [6:0] am = a[6:0];
  wire [6:0] bm = b[6:0];
  wire nan = (am == 7'h7f) || (bm == 7'h7f);
  wire sign = a[7] ^ b[7];
@COMMON@
  function [6:0] product_mag;
    input [5:0] exp_sum;
    input [5:0] product;
    begin
      case (product)
@BLOCKS@
        default: product_mag = 7'h00;
      endcase
    end
  endfunction

  wire [5:0] product = sig3(am) * sig3(bm);
  wire [5:0] exp_sum = eff_exp(am) + eff_exp(bm);
  assign out = nan ? 8'h7f : {sign, product_mag(exp_sum, product)};
endmodule
""".replace("@MODULE@", module).replace("@COMMON@", common_sig_eff()).replace("@BLOCKS@", "\n".join(blocks))


def render_div_logcode(module):
    nn_low = []
    for mn in range(4):
        for md in range(4):
            mant_key = (mn << 2) | md
            for base in range(-8, 6):
                found = None
                for en in range(1, 31):
                    for ed in range(1, 31):
                        num = (en << 2) | mn
                        den = (ed << 2) | md
                        if num - den + 0x3C == base:
                            found = FP8.div(num, den) & 0x7F
                            break
                    if found is not None:
                        break
                if found:
                    key = (mant_key << 4) | (base + 8)
                    nn_low.append("        8'h{0:02x}: nn_low_mag = 7'h{1:02x};".format(key, found))
    subn_low = []
    for sub_n in range(1, 4):
        for den_mag in range(50, 72):
            if den_mag == 0x7F:
                continue
            out = FP8.div(sub_n, den_mag) & 0x7F
            if out:
                key = (sub_n << 7) | den_mag
                subn_low.append("        9'h{0:03x}: subn_low_mag = 7'h{1:02x};".format(key, out))
    both_sub = []
    for n in range(1, 4):
        for d in range(1, 4):
            out = FP8.div(n, d) & 0x7F
            both_sub.append("        4'h{0:x}: both_sub_mag = 7'h{1:02x};".format((n << 2) | d, out))
    text = """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] den = in[15:8];
  wire [7:0] num = in[7:0];
  wire [6:0] dm = den[6:0];
  wire [6:0] nm = num[6:0];
  wire [4:0] de = dm[6:2];
  wire [4:0] ne = nm[6:2];
  wire nan = (dm == 7'h7f) || (nm == 7'h7f);
  wire den_zero = (dm == 7'h00);
  wire num_zero = (nm == 7'h00);
  wire sign = den[7] ^ num[7];
  wire d_norm = (de != 5'd0);
  wire n_norm = (ne != 5'd0);

  function [6:0] nn_low_mag;
    input [7:0] key;
    begin
      case (key)
@NN_LOW@
        default: nn_low_mag = 7'h00;
      endcase
    end
  endfunction

  function [6:0] subn_low_mag;
    input [8:0] key;
    begin
      case (key)
@SUBN_LOW@
        default: subn_low_mag = 7'h00;
      endcase
    end
  endfunction

  function [6:0] both_sub_mag;
    input [3:0] key;
    begin
      case (key)
@BOTH_SUB@
        default: both_sub_mag = 7'h7f;
      endcase
    end
  endfunction

  function [6:0] norm_over_sub_mag;
    input [6:0] nmag;
    input [1:0] nman;
    input [1:0] dsub;
    reg [8:0] lin;
    reg [8:0] corr;
    begin
      if (dsub == 2'd1) corr = 9'd64;
      else if (dsub == 2'd2) corr = 9'd60;
      else corr = (nman == 2'd0) ? 9'd57 : 9'd58;
      lin = {2'b0, nmag} + corr;
      norm_over_sub_mag = (lin >= 9'd126) ? 7'h7e : lin[6:0];
    end
  endfunction

  function [6:0] sub_over_norm_mag;
    input [1:0] nsub;
    input [6:0] dmag;
    reg signed [8:0] lin;
    reg signed [8:0] base_const;
    begin
      if (nsub == 2'd1)
        base_const = (dmag[1] ^ dmag[0]) ? 9'sd55 : 9'sd56;
      else if (nsub == 2'd2)
        base_const = (dmag[1] ^ dmag[0]) ? 9'sd59 : 9'sd60;
      else
        base_const = 9'sd62;
      lin = base_const - $signed({2'b0, dmag});
      if (dmag >= 7'd50) sub_over_norm_mag = subn_low_mag({nsub, dmag});
      else sub_over_norm_mag = lin[6:0];
    end
  endfunction

  wire [3:0] mant_key = {nm[1:0], dm[1:0]};
  wire signed [8:0] base = $signed({2'b0, nm}) - $signed({2'b0, dm}) + 9'sd60;
  wire corr_m1 = (nm[1:0] == 2'd0) && ((dm[1:0] == 2'd1) || (dm[1:0] == 2'd2));
  wire signed [8:0] lin_nn = base - $signed({8'd0, corr_m1});
  wire [3:0] base_low_key = base[3:0] + 4'd8;
  wire [6:0] nn_linear = (lin_nn >= 9'sd126) ? 7'h7e : lin_nn[6:0];
  wire [6:0] nn_mag = (base < -9'sd8) ? 7'h00 :
                      ((base <= 9'sd5) ? nn_low_mag({mant_key, base_low_key}) : nn_linear);
  wire [6:0] ns_mag = norm_over_sub_mag(nm, nm[1:0], dm[1:0]);
  wire [6:0] sn_mag = sub_over_norm_mag(nm[1:0], dm);
  wire [6:0] ss_mag = both_sub_mag({nm[1:0], dm[1:0]});
  wire [6:0] core_mag = (n_norm && d_norm) ? nn_mag :
                        (n_norm ? ns_mag : (d_norm ? sn_mag : ss_mag));
  wire invalid = nan || (den_zero && num_zero);
  wire [6:0] mag = den_zero ? 7'h7e : (num_zero ? 7'h00 : core_mag);
  assign out = invalid ? 8'h7f : {sign, mag};
endmodule
"""
    return text.replace("@MODULE@", module).replace("@NN_LOW@", "\n".join(nn_low)).replace("@SUBN_LOW@", "\n".join(subn_low)).replace("@BOTH_SUB@", "\n".join(both_sub))


def div_class_lines_for_key(sig_n, sig_d, indent):
    zero_hi, sat_lo, offset, mant = div_class(sig_n, sig_d)
    vals = {delta: FP8.div_mag_from_sig_delta(sig_n, sig_d, delta) for delta in range(-30, 31)}
    specials = []
    for delta, mag in vals.items():
        if not (zero_hi < delta < sat_lo):
            continue
        linear = (((delta + offset) << 2) | mant) if (delta + offset) >= 0 else None
        if mag < 4 or linear is None or mag != linear:
            specials.append((delta, mag))
    lines = [indent + "if (delta <= {0}) mag_table = 7'h00;".format(sconst(zero_hi))]
    for delta, mag in specials:
        lines.append(indent + "else if (delta == {0}) mag_table = 7'h{1:02x};".format(sconst(delta), mag))
    lines.append(indent + "else if (delta >= {0}) mag_table = 7'h7e;".format(sconst(sat_lo)))
    lines.append(indent + "else mag_table = (((delta + 7'sd{0}) << 2) | 7'd{1});".format(offset, mant))
    return lines


def div_class_lines_smallpat(sig_n, sig_d, indent):
    zero_hi, sat_lo, offset, mant = div_class(sig_n, sig_d)
    vals = [FP8.div_mag_from_sig_delta(sig_n, sig_d, zero_hi + step) for step in range(1, 4)]
    pat = small_pattern(vals)
    lines = [indent + "step = delta - {0};".format(sconst(zero_hi))]
    lines.append(indent + "if (delta <= {0}) mag_table = 7'h00;".format(sconst(zero_hi)))
    lines.append(indent + "else if (step <= 7'sd3) mag_table = low_from_pat(2'd{0}, step[1:0]);".format(pat))
    lines.append(indent + "else if (delta >= {0}) mag_table = 7'h7e;".format(sconst(sat_lo)))
    lines.append(indent + "else mag_table = (((delta + 7'sd{0}) << 2) | 7'd{1});".format(offset, mant))
    return lines


def render_div_sigpair_class_smallpat(module):
    blocks = []
    for sig_n in range(8):
        for sig_d in range(8):
            key = (sig_n << 3) | sig_d
            lines = ["        6'h{0:02x}: begin".format(key)]
            if sig_n == 0 or sig_d == 0:
                lines.append("          mag_table = 7'h00;")
            else:
                lines.extend(div_class_lines_smallpat(sig_n, sig_d, "          "))
            lines.append("        end")
            blocks.append("\n".join(lines))
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] den = in[15:8];
  wire [7:0] num = in[7:0];
  wire den_nan = (den[6:0] == 7'h7f);
  wire num_nan = (num[6:0] == 7'h7f);
  wire sign = den[7] ^ num[7];
  wire den_zero = (den[6:0] == 7'h00);
  wire num_zero = (num[6:0] == 7'h00);
@COMMON@
@LOW_PAT@
  function [6:0] mag_table;
    input signed [6:0] delta;
    input [5:0] sig_key;
    reg signed [6:0] step;
    begin
      case (sig_key)
@BLOCKS@
        default: mag_table = 7'h00;
      endcase
    end
  endfunction

  wire [2:0] sig_n = sig3(num[6:0]);
  wire [2:0] sig_d = sig3(den[6:0]);
  wire signed [6:0] delta = $signed({1'b0, eff_exp(num[6:0])}) - $signed({1'b0, eff_exp(den[6:0])});
  wire invalid = den_nan || num_nan || (den_zero && num_zero);
  wire [6:0] out_mag = den_zero ? 7'h7e : mag_table(delta, {sig_n, sig_d});
  assign out = invalid ? 8'h7f : {sign, out_mag};
endmodule
""".replace("@MODULE@", module).replace("@COMMON@", common_sig_eff()).replace("@LOW_PAT@", low_from_smallpat_function()).replace("@BLOCKS@", "\n".join(blocks))


def div_qattr_value(sig_n, sig_d):
    zero_hi, _sat_lo, offset, mant = div_class(sig_n, sig_d)
    vals = [FP8.div_mag_from_sig_delta(sig_n, sig_d, zero_hi + step) for step in range(1, 4)]
    qsh = offset - 15
    return qsh, mant, small_pattern(vals)


def render_div_qclass_body(attr_call):
    return """  wire signed [6:0] delta = $signed({1'b0, eff_exp(nm)}) - $signed({1'b0, eff_exp(dm)});
  wire [8:0] attr = @ATTR_CALL@;
  wire valid = attr[8];
  wire signed [3:0] qsh4 = attr[7:4];
  wire signed [6:0] qsh = {{3{qsh4[3]}}, qsh4};
  wire [1:0] mant = attr[3:2];
  wire [1:0] pat = attr[1:0];
  wire mant_ge1 = |mant;
  wire mant_ge2 = mant[1];
  wire signed [6:0] zero_hi = -7'sd17 - qsh - $signed({6'd0, mant_ge1});
  wire signed [6:0] sat_lo = 7'sd17 - qsh - $signed({6'd0, mant_ge2});
  wire signed [6:0] step = delta - zero_hi;
  wire signed [6:0] out_exp_s = delta + 7'sd15 + qsh;
  wire [6:0] low_mag = low_from_pat(pat, step[1:0]);
  wire [6:0] linear_mag = {out_exp_s[4:0], mant};
  wire zero = !valid || num_zero || (delta <= zero_hi);
  wire sat = den_zero || (delta >= sat_lo);
  wire invalid = nan || (den_zero && num_zero);
  wire [6:0] mag = den_zero ? 7'h7e : (zero ? 7'h00 : (sat ? 7'h7e : ((step <= 7'sd3) ? low_mag : linear_mag)));
  assign out = invalid ? 8'h7f : {sign, mag};
""".replace("@ATTR_CALL@", attr_call)


def render_div_qclass_smallpat(module, nested=False):
    if nested:
        den_blocks = []
        for sig_d in range(1, 8):
            num_lines = []
            for sig_n in range(1, 8):
                qsh, mant, pat = div_qattr_value(sig_n, sig_d)
                num_lines.append(
                    "          3'd{0}: q_attr = {{1'b1, 4'h{1:x}, 2'd{2}, 2'd{3}}};".format(
                        sig_n, qsh & 0xF, mant, pat
                    )
                )
            den_blocks.append(
                """        3'd@DEN@: begin
          case (sig_n)
@NUMS@
            default: q_attr = 9'd0;
          endcase
        end""".replace("@DEN@", str(sig_d)).replace("@NUMS@", "\n".join(num_lines))
            )
        function_text = """  function [8:0] q_attr;
    input [2:0] sig_n;
    input [2:0] sig_d;
    begin
      case (sig_d)
@DENS@
        default: q_attr = 9'd0;
      endcase
    end
  endfunction
""".replace("@DENS@", "\n".join(den_blocks))
    else:
        entries = []
        for sig_n in range(1, 8):
            for sig_d in range(1, 8):
                qsh, mant, pat = div_qattr_value(sig_n, sig_d)
                entries.append(
                    "        6'h{0:02x}: q_attr = {{1'b1, 4'h{1:x}, 2'd{2}, 2'd{3}}};".format(
                        (sig_n << 3) | sig_d, qsh & 0xF, mant, pat
                    )
                )
        function_text = """  function [8:0] q_attr;
    input [5:0] sig_key;
    begin
      case (sig_key)
@ENTRIES@
        default: q_attr = 9'd0;
      endcase
    end
  endfunction
""".replace("@ENTRIES@", "\n".join(entries))
    attr_call = "q_attr(sig_n, sig_d)" if nested else "q_attr({sig_n, sig_d})"
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] den = in[15:8];
  wire [7:0] num = in[7:0];
  wire [6:0] dm = den[6:0];
  wire [6:0] nm = num[6:0];
  wire nan = (dm == 7'h7f) || (nm == 7'h7f);
  wire den_zero = (dm == 7'h00);
  wire num_zero = (nm == 7'h00);
  wire sign = den[7] ^ num[7];
@COMMON@
@LOW_PAT@
@QATTR@
  wire [2:0] sig_n = sig3(nm);
  wire [2:0] sig_d = sig3(dm);
@BODY@
endmodule
""".replace("@MODULE@", module).replace("@COMMON@", common_sig_eff()).replace("@LOW_PAT@", low_from_smallpat_function()).replace("@QATTR@", function_text).replace("@BODY@", render_div_qclass_body(attr_call))


def render_div_bound_smallpat(module, nested=False):
    if nested:
        den_blocks = []
        for sig_d in range(1, 8):
            num_lines = []
            for sig_n in range(1, 8):
                zero_hi, sat_lo, offset, mant = div_class(sig_n, sig_d)
                vals = [FP8.div_mag_from_sig_delta(sig_n, sig_d, zero_hi + step) for step in range(1, 4)]
                pat = small_pattern(vals)
                num_lines.append(
                    "          3'd{0}: bound_attr = {{1'b1, 7'h{1:02x}, 7'h{2:02x}, 5'd{3}, 2'd{4}, 2'd{5}}};".format(
                        sig_n, zero_hi & 0x7F, sat_lo & 0x7F, offset, mant, pat
                    )
                )
            den_blocks.append(
                """        3'd@DEN@: begin
          case (sig_n)
@NUMS@
            default: bound_attr = 24'd0;
          endcase
        end""".replace("@DEN@", str(sig_d)).replace("@NUMS@", "\n".join(num_lines))
            )
        function_text = """  function [23:0] bound_attr;
    input [2:0] sig_n;
    input [2:0] sig_d;
    begin
      case (sig_d)
@DENS@
        default: bound_attr = 24'd0;
      endcase
    end
  endfunction
""".replace("@DENS@", "\n".join(den_blocks))
        attr_call = "bound_attr(sig_n, sig_d)"
    else:
        entries = []
        for sig_n in range(1, 8):
            for sig_d in range(1, 8):
                zero_hi, sat_lo, offset, mant = div_class(sig_n, sig_d)
                vals = [FP8.div_mag_from_sig_delta(sig_n, sig_d, zero_hi + step) for step in range(1, 4)]
                pat = small_pattern(vals)
                entries.append(
                    "        6'h{0:02x}: bound_attr = {{1'b1, 7'h{1:02x}, 7'h{2:02x}, 5'd{3}, 2'd{4}, 2'd{5}}};".format(
                        (sig_n << 3) | sig_d, zero_hi & 0x7F, sat_lo & 0x7F, offset, mant, pat
                    )
                )
        function_text = """  function [23:0] bound_attr;
    input [5:0] sig_key;
    begin
      case (sig_key)
@ENTRIES@
        default: bound_attr = 24'd0;
      endcase
    end
  endfunction
""".replace("@ENTRIES@", "\n".join(entries))
        attr_call = "bound_attr({sig_n, sig_d})"
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] den = in[15:8];
  wire [7:0] num = in[7:0];
  wire [6:0] dm = den[6:0];
  wire [6:0] nm = num[6:0];
  wire nan = (dm == 7'h7f) || (nm == 7'h7f);
  wire den_zero = (dm == 7'h00);
  wire num_zero = (nm == 7'h00);
  wire sign = den[7] ^ num[7];
@COMMON@
@LOW_PAT@
@ATTR_FUNC@
  wire [2:0] sig_n = sig3(nm);
  wire [2:0] sig_d = sig3(dm);
  wire signed [6:0] delta = $signed({1'b0, eff_exp(nm)}) - $signed({1'b0, eff_exp(dm)});
  wire [23:0] attr = @ATTR_CALL@;
  wire valid = attr[23];
  wire signed [6:0] zero_hi = attr[22:16];
  wire signed [6:0] sat_lo = attr[15:9];
  wire [4:0] offset = attr[8:4];
  wire [1:0] mant = attr[3:2];
  wire [1:0] pat = attr[1:0];
  wire signed [6:0] step = delta - zero_hi;
  wire signed [6:0] out_exp_s = delta + $signed({2'b0, offset});
  wire zero = !valid || num_zero || (delta <= zero_hi);
  wire sat = den_zero || (delta >= sat_lo);
  wire [6:0] low_mag = low_from_pat(pat, step[1:0]);
  wire [6:0] linear_mag = {out_exp_s[4:0], mant};
  wire invalid = nan || (den_zero && num_zero);
  wire [6:0] mag = den_zero ? 7'h7e : (zero ? 7'h00 : (sat ? 7'h7e : ((step <= 7'sd3) ? low_mag : linear_mag)));
  assign out = invalid ? 8'h7f : {sign, mag};
endmodule
""".replace("@MODULE@", module).replace("@COMMON@", common_sig_eff()).replace("@LOW_PAT@", low_from_smallpat_function()).replace("@ATTR_FUNC@", function_text).replace("@ATTR_CALL@", attr_call)


def div_bound_attr_tuple(sig_n, sig_d):
    zero_hi, sat_lo, offset, mant = div_class(sig_n, sig_d)
    vals = [FP8.div_mag_from_sig_delta(sig_n, sig_d, zero_hi + step) for step in range(1, 4)]
    return zero_hi, sat_lo, offset, mant, small_pattern(vals)


def render_div_bound_smallpat_classid(module, nested=True):
    attr_to_id = {}
    pair_to_id = {}
    attrs = []
    for sig_d in range(1, 8):
        for sig_n in range(1, 8):
            attr = div_bound_attr_tuple(sig_n, sig_d)
            if attr not in attr_to_id:
                attr_to_id[attr] = len(attrs) + 1
                attrs.append(attr)
            pair_to_id[(sig_n, sig_d)] = attr_to_id[attr]
    attr_lines = []
    for class_id, (zero_hi, sat_lo, offset, mant, pat) in enumerate(attrs, 1):
        attr_lines.append(
            "        5'd{0}: bound_attr = {{1'b1, 7'h{1:02x}, 7'h{2:02x}, 5'd{3}, 2'd{4}, 2'd{5}}};".format(
                class_id, zero_hi & 0x7F, sat_lo & 0x7F, offset, mant, pat
            )
        )
    attr_func = """  function [23:0] bound_attr;
    input [4:0] class_id;
    begin
      case (class_id)
@ATTRS@
        default: bound_attr = 24'd0;
      endcase
    end
  endfunction
""".replace("@ATTRS@", "\n".join(attr_lines))
    if nested:
        den_blocks = []
        for sig_d in range(1, 8):
            num_lines = []
            for sig_n in range(1, 8):
                num_lines.append(
                    "          3'd{0}: bound_class = 5'd{1};".format(
                        sig_n, pair_to_id[(sig_n, sig_d)]
                    )
                )
            den_blocks.append(
                """        3'd@DEN@: begin
          case (sig_n)
@NUMS@
            default: bound_class = 5'd0;
          endcase
        end""".replace("@DEN@", str(sig_d)).replace("@NUMS@", "\n".join(num_lines))
            )
        class_func = """  function [4:0] bound_class;
    input [2:0] sig_n;
    input [2:0] sig_d;
    begin
      case (sig_d)
@DENS@
        default: bound_class = 5'd0;
      endcase
    end
  endfunction
""".replace("@DENS@", "\n".join(den_blocks))
        class_call = "bound_class(sig_n, sig_d)"
    else:
        pair_lines = []
        for sig_d in range(1, 8):
            for sig_n in range(1, 8):
                pair_lines.append(
                    "        6'h{0:02x}: bound_class = 5'd{1};".format(
                        (sig_n << 3) | sig_d, pair_to_id[(sig_n, sig_d)]
                    )
                )
        class_func = """  function [4:0] bound_class;
    input [5:0] sig_key;
    begin
      case (sig_key)
@PAIRS@
        default: bound_class = 5'd0;
      endcase
    end
  endfunction
""".replace("@PAIRS@", "\n".join(pair_lines))
        class_call = "bound_class({sig_n, sig_d})"
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] den = in[15:8];
  wire [7:0] num = in[7:0];
  wire [6:0] dm = den[6:0];
  wire [6:0] nm = num[6:0];
  wire nan = (dm == 7'h7f) || (nm == 7'h7f);
  wire den_zero = (dm == 7'h00);
  wire num_zero = (nm == 7'h00);
  wire sign = den[7] ^ num[7];
@COMMON@
@LOW_PAT@
@CLASS_FUNC@
@ATTR_FUNC@
  wire [2:0] sig_n = sig3(nm);
  wire [2:0] sig_d = sig3(dm);
  wire signed [6:0] delta = $signed({1'b0, eff_exp(nm)}) - $signed({1'b0, eff_exp(dm)});
  wire [23:0] attr = bound_attr(@CLASS_CALL@);
  wire valid = attr[23];
  wire signed [6:0] zero_hi = attr[22:16];
  wire signed [6:0] sat_lo = attr[15:9];
  wire [4:0] offset = attr[8:4];
  wire [1:0] mant = attr[3:2];
  wire [1:0] pat = attr[1:0];
  wire signed [6:0] step = delta - zero_hi;
  wire signed [6:0] out_exp_s = delta + $signed({2'b0, offset});
  wire zero = !valid || num_zero || (delta <= zero_hi);
  wire sat = den_zero || (delta >= sat_lo);
  wire [6:0] low_mag = low_from_pat(pat, step[1:0]);
  wire [6:0] linear_mag = {out_exp_s[4:0], mant};
  wire invalid = nan || (den_zero && num_zero);
  wire [6:0] mag = den_zero ? 7'h7e : (zero ? 7'h00 : (sat ? 7'h7e : ((step <= 7'sd3) ? low_mag : linear_mag)));
  assign out = invalid ? 8'h7f : {sign, mag};
endmodule
""".replace("@MODULE@", module).replace("@COMMON@", common_sig_eff()).replace("@LOW_PAT@", low_from_smallpat_function()).replace("@CLASS_FUNC@", class_func).replace("@ATTR_FUNC@", attr_func).replace("@CLASS_CALL@", class_call)


def render_div_bound_smallpat_nested_num(module):
    num_blocks = []
    for sig_n in range(1, 8):
        den_lines = []
        for sig_d in range(1, 8):
            zero_hi, sat_lo, offset, mant = div_class(sig_n, sig_d)
            vals = [FP8.div_mag_from_sig_delta(sig_n, sig_d, zero_hi + step) for step in range(1, 4)]
            pat = small_pattern(vals)
            den_lines.append(
                "          3'd{0}: bound_attr = {{1'b1, 7'h{1:02x}, 7'h{2:02x}, 5'd{3}, 2'd{4}, 2'd{5}}};".format(
                    sig_d, zero_hi & 0x7F, sat_lo & 0x7F, offset, mant, pat
                )
            )
        num_blocks.append(
            """        3'd@NUM@: begin
          case (sig_d)
@DENS@
            default: bound_attr = 24'd0;
          endcase
        end""".replace("@NUM@", str(sig_n)).replace("@DENS@", "\n".join(den_lines))
        )
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] den = in[15:8];
  wire [7:0] num = in[7:0];
  wire [6:0] dm = den[6:0];
  wire [6:0] nm = num[6:0];
  wire nan = (dm == 7'h7f) || (nm == 7'h7f);
  wire den_zero = (dm == 7'h00);
  wire num_zero = (nm == 7'h00);
  wire sign = den[7] ^ num[7];
@COMMON@
@LOW_PAT@
  function [23:0] bound_attr;
    input [2:0] sig_n;
    input [2:0] sig_d;
    begin
      case (sig_n)
@NUMS@
        default: bound_attr = 24'd0;
      endcase
    end
  endfunction

  wire [2:0] sig_n = sig3(nm);
  wire [2:0] sig_d = sig3(dm);
  wire signed [6:0] delta = $signed({1'b0, eff_exp(nm)}) - $signed({1'b0, eff_exp(dm)});
  wire [23:0] attr = bound_attr(sig_n, sig_d);
  wire valid = attr[23];
  wire signed [6:0] zero_hi = attr[22:16];
  wire signed [6:0] sat_lo = attr[15:9];
  wire [4:0] offset = attr[8:4];
  wire [1:0] mant = attr[3:2];
  wire [1:0] pat = attr[1:0];
  wire signed [6:0] step = delta - zero_hi;
  wire signed [6:0] out_exp_s = delta + $signed({2'b0, offset});
  wire zero = !valid || (delta <= zero_hi);
  wire sat = delta >= sat_lo;
  wire [6:0] low_mag = low_from_pat(pat, step[1:0]);
  wire [6:0] linear_mag = {out_exp_s[4:0], mant};
  wire invalid = nan || (den_zero && num_zero);
  wire [6:0] mag = den_zero ? 7'h7e : (zero ? 7'h00 : (sat ? 7'h7e : ((step <= 7'sd3) ? low_mag : linear_mag)));
  assign out = invalid ? 8'h7f : {sign, mag};
endmodule
""".replace("@MODULE@", module).replace("@COMMON@", common_sig_eff()).replace("@LOW_PAT@", low_from_smallpat_function()).replace("@NUMS@", "\n".join(num_blocks))


def render_div_recip_product_qclass(module):
    recip = {1: 128, 2: 64, 3: 42, 4: 32, 5: 25, 6: 21, 7: 18}
    by_qprod = {}
    for sig_n in range(1, 8):
        for sig_d in range(1, 8):
            qprod = sig_n * recip[sig_d]
            attr = div_qattr_value(sig_n, sig_d)
            old = by_qprod.get(qprod)
            if old is not None and old != attr:
                raise RuntimeError("reciprocal product collision at {0}".format(qprod))
            by_qprod[qprod] = attr
    recip_entries = "\n".join(
        "        3'd{0}: recip = 8'd{1};".format(sig_d, value)
        for sig_d, value in sorted(recip.items())
    )
    qprod_entries = "\n".join(
        "        11'd{0}: qprod_attr = {{1'b1, 4'h{1:x}, 2'd{2}, 2'd{3}}};".format(
            qprod, qsh & 0xF, mant, pat
        )
        for qprod, (qsh, mant, pat) in sorted(by_qprod.items())
    )
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] den = in[15:8];
  wire [7:0] num = in[7:0];
  wire [6:0] dm = den[6:0];
  wire [6:0] nm = num[6:0];
  wire nan = (dm == 7'h7f) || (nm == 7'h7f);
  wire den_zero = (dm == 7'h00);
  wire num_zero = (nm == 7'h00);
  wire sign = den[7] ^ num[7];
@COMMON@
@LOW_PAT@
  function [7:0] recip;
    input [2:0] sig_d;
    begin
      case (sig_d)
@RECIP@
        default: recip = 8'd0;
      endcase
    end
  endfunction

  function [8:0] qprod_attr;
    input [10:0] qprod;
    begin
      case (qprod)
@QPROD@
        default: qprod_attr = 9'd0;
      endcase
    end
  endfunction

  wire [2:0] sig_n = sig3(nm);
  wire [2:0] sig_d = sig3(dm);
  wire [10:0] qprod = {8'd0, sig_n} * {3'd0, recip(sig_d)};
@BODY@
endmodule
""".replace("@MODULE@", module).replace("@COMMON@", common_sig_eff()).replace("@LOW_PAT@", low_from_smallpat_function()).replace("@RECIP@", recip_entries).replace("@QPROD@", qprod_entries).replace("@BODY@", render_div_qclass_body("qprod_attr(qprod)"))


def render_div_sigpair_possible_class(module, include_numzero=False, include_denzero=False, denzero_sat=False, denzero_copy=None, out_mux="outer"):
    blocks = []
    if include_numzero:
        for sig_d in range(8):
            blocks.append("        6'h{0:02x}: begin\n          mag_table = 7'h00;\n        end".format(sig_d))
    if include_denzero:
        for sig_n in range(1, 8):
            if denzero_copy is None:
                mag = "7'h7e" if denzero_sat else "7'h00"
                blocks.append("        6'h{0:02x}: begin\n          mag_table = {1};\n        end".format(sig_n << 3, mag))
            else:
                lines = ["        6'h{0:02x}: begin".format(sig_n << 3)]
                lines.extend(div_class_lines_for_key(sig_n, denzero_copy, "          "))
                lines.append("        end")
                blocks.append("\n".join(lines))
    for sig_n in range(1, 8):
        for sig_d in range(1, 8):
            key = (sig_n << 3) | sig_d
            lines = ["        6'h{0:02x}: begin".format(key)]
            lines.extend(div_class_lines_for_key(sig_n, sig_d, "          "))
            lines.append("        end")
            blocks.append("\n".join(lines))
    text = """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] den = in[15:8];
  wire [7:0] num = in[7:0];
  wire [6:0] dm = den[6:0];
  wire [6:0] nm = num[6:0];
  wire den_nan = (dm == 7'h7f);
  wire num_nan = (nm == 7'h7f);
  wire sign = den[7] ^ num[7];
  wire den_zero = (dm == 7'h00);
  wire num_zero = (nm == 7'h00);
@COMMON@
  function [6:0] mag_table;
    input signed [6:0] delta;
    input [5:0] sig_key;
    begin
      case (sig_key)
@BLOCKS@
        default: mag_table = 7'h00;
      endcase
    end
  endfunction

  wire [2:0] sig_n = sig3(nm);
  wire [2:0] sig_d = sig3(dm);
  wire signed [6:0] delta = $signed({1'b0, eff_exp(nm)}) - $signed({1'b0, eff_exp(dm)});
  wire invalid = den_nan || num_nan || (den_zero && num_zero);
  wire [6:0] core_mag = mag_table(delta, {sig_n, sig_d});
@OUT_MAG@
  assign out = invalid ? 8'h7f : {sign, out_mag};
endmodule
"""
    if out_mux == "core":
        out_mag = "  wire [6:0] out_mag = core_mag;"
    elif out_mux == "den_only":
        out_mag = "  wire [6:0] out_mag = den_zero ? 7'h7e : core_mag;"
    else:
        out_mag = "  wire [6:0] out_mag = den_zero ? 7'h7e : (num_zero ? 7'h00 : core_mag);"
    return text.replace("@MODULE@", module).replace("@COMMON@", common_sig_eff()).replace("@BLOCKS@", "\n".join(blocks)).replace("@OUT_MAG@", out_mag)


def render_div_sigpair_ordered_denzero_dc(module, denzero_mode="zero", attrs=False, reverse=False):
    blocks = []
    sig_ns = list(range(8))
    sig_ds = list(range(8))
    if reverse:
        sig_ns = list(reversed(sig_ns))
        sig_ds = list(reversed(sig_ds))
    for sig_n in sig_ns:
        for sig_d in sig_ds:
            key = (sig_n << 3) | sig_d
            lines = ["        6'h{0:02x}: begin".format(key)]
            if sig_n == 0:
                lines.append("          mag_table = 7'h00;")
            elif sig_d == 0:
                if denzero_mode == "zero":
                    lines.append("          mag_table = 7'h00;")
                elif denzero_mode == "sat":
                    lines.append("          mag_table = 7'h7e;")
                elif denzero_mode == "copy1":
                    lines.extend(div_class_lines_for_key(sig_n, 1, "          "))
                elif denzero_mode == "copy7":
                    lines.extend(div_class_lines_for_key(sig_n, 7, "          "))
                else:
                    raise RuntimeError("unknown denzero mode {0}".format(denzero_mode))
            else:
                lines.extend(div_class_lines_for_key(sig_n, sig_d, "          "))
            lines.append("        end")
            blocks.append("\n".join(lines))
    case_kw = "(* parallel_case, full_case *) case" if attrs else "case"
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] den = in[15:8];
  wire [7:0] num = in[7:0];
  wire den_nan = (den[6:0] == 7'h7f);
  wire num_nan = (num[6:0] == 7'h7f);
  wire sign = den[7] ^ num[7];
  wire den_zero = (den[6:0] == 7'h00);
  wire num_zero = (num[6:0] == 7'h00);
@COMMON@
  function [6:0] mag_table;
    input signed [6:0] delta;
    input [5:0] sig_key;
    begin
      @CASE@ (sig_key)
@BLOCKS@
        default: mag_table = 7'h00;
      endcase
    end
  endfunction

  wire [2:0] sig_n = sig3(num[6:0]);
  wire [2:0] sig_d = sig3(den[6:0]);
  wire signed [6:0] delta = $signed({1'b0, eff_exp(num[6:0])}) - $signed({1'b0, eff_exp(den[6:0])});
  wire invalid = den_nan || num_nan || (den_zero && num_zero);
  wire [6:0] out_mag = den_zero ? 7'h7e : mag_table(delta, {sig_n, sig_d});
  assign out = invalid ? 8'h7f : {sign, out_mag};
endmodule
""".replace("@MODULE@", module).replace("@COMMON@", common_sig_eff()).replace("@CASE@", case_kw).replace("@BLOCKS@", "\n".join(blocks))


def render_div_sigpair_bit_bdd(module, bit, order=None):
    order = order or list(range(11, -1, -1))
    blocks = []
    for sig_n in range(8):
        for sig_d in range(8):
            key = (sig_n << 3) | sig_d
            lines = ["        6'h{0:02x}: begin".format(key)]
            if sig_n == 0 or sig_d == 0:
                lines.append("          mag_table = 7'h00;")
            else:
                lines.extend(div_class_lines_for_key(sig_n, sig_d, "          "))
            lines.append("        end")
            blocks.append("\n".join(lines))
    outputs = []
    for key in range(1 << 12):
        delta_key = (key >> 6) & 0x3F
        sig_n = (key >> 3) & 0x7
        sig_d = key & 0x7
        delta = delta_key - 31
        mag = FP8.div_mag_from_sig_delta(sig_n, sig_d, delta) if sig_d else 0
        outputs.append((mag >> bit) & 1)
    builder, roots = build_bdd(outputs, 12, 1, order)
    bdd_lines = []
    for node in builder.nodes:
        bdd_lines.append("  wire b_{0} = key[{1}] ? {2} : {3};".format(
            node["id"],
            node["var"],
            edge_expr(node["high"]).replace("n_", "b_"),
            edge_expr(node["low"]).replace("n_", "b_"),
        ))
    bdd_lines.append("  wire bdd_bit = {0};".format(edge_expr(roots[0]).replace("n_", "b_")))
    if bit == 0:
        table_expr = "{class_mag[6:1], bdd_bit}"
    elif bit == 6:
        table_expr = "{bdd_bit, class_mag[5:0]}"
    else:
        table_expr = "{{class_mag[6:{0}], bdd_bit, class_mag[{1}:0]}}".format(bit + 1, bit - 1)
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] den = in[15:8];
  wire [7:0] num = in[7:0];
  wire den_nan = (den[6:0] == 7'h7f);
  wire num_nan = (num[6:0] == 7'h7f);
  wire sign = den[7] ^ num[7];
  wire den_zero = (den[6:0] == 7'h00);
@COMMON@
  function [6:0] mag_table;
    input signed [6:0] delta;
    input [5:0] sig_key;
    begin
      case (sig_key)
@BLOCKS@
        default: mag_table = 7'h00;
      endcase
    end
  endfunction

  wire [2:0] sig_n = sig3(num[6:0]);
  wire [2:0] sig_d = sig3(den[6:0]);
  wire signed [6:0] delta = $signed({1'b0, eff_exp(num[6:0])}) - $signed({1'b0, eff_exp(den[6:0])});
  wire [5:0] delta_key = delta + 7'sd31;
  wire [11:0] key = {delta_key, sig_n, sig_d};
@BDD@
  wire [6:0] class_mag = mag_table(delta, {sig_n, sig_d});
  wire [6:0] table_mag = @TABLE@;
  wire invalid = den_nan || num_nan || (den_zero && (num[6:0] == 7'h00));
  wire [6:0] out_mag = den_zero ? 7'h7e : table_mag;
  assign out = invalid ? 8'h7f : {sign, out_mag};
endmodule
""".replace("@MODULE@", module).replace("@COMMON@", common_sig_eff()).replace("@BLOCKS@", "\n".join(blocks)).replace("@BDD@", "\n".join(bdd_lines)).replace("@TABLE@", table_expr)


def with_case_attrs(text):
    return text.replace("case (", "(* parallel_case, full_case *) case (")


def render_mul_normsplit(module):
    norm_attrs = []
    norm_small = []
    sub_attrs = []
    sub_small = []
    for ma in range(4):
        for mb in range(4):
            key = (ma << 2) | mb
            product = (4 + ma) * (4 + mb)
            zero_hi, sat_lo, bias, mant = mul_class(product)
            norm_attrs.append(
                "        4'h{0:x}: attr = {{1'b1, 6'd{1}, 6'd{2}, 5'd{3}, 2'd{4}}};".format(
                    key, zero_hi, sat_lo, bias, mant
                )
            )
            for step in range(1, 4):
                mag = FP8.mul_mag_from_product(product, zero_hi + step)
                if mag:
                    norm_small.append("        6'h{0:02x}: norm_small_mag = 7'h{1:02x};".format((key << 2) | step, mag))
    for sig_a in range(8):
        for sig_b in range(8):
            key = (sig_a << 3) | sig_b
            product = sig_a * sig_b
            if product == 0 or (sig_a >= 4 and sig_b >= 4):
                continue
            zero_hi, sat_lo, bias, mant = mul_class(product)
            sub_attrs.append(
                "        6'h{0:02x}: attr = {{1'b1, 6'd{1}, 6'd{2}, 5'd{3}, 2'd{4}}};".format(
                    key, zero_hi, sat_lo, bias, mant
                )
            )
            for step in range(1, 4):
                mag = FP8.mul_mag_from_product(product, zero_hi + step)
                if mag:
                    sub_small.append("        8'h{0:02x}: sub_small_mag = 7'h{1:02x};".format((key << 2) | step, mag))
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] a = in[15:8];
  wire [7:0] b = in[7:0];
  wire [6:0] am = a[6:0];
  wire [6:0] bm = b[6:0];
  wire [4:0] ae = am[6:2];
  wire [4:0] be = bm[6:2];
  wire nan = (am == 7'h7f) || (bm == 7'h7f);
  wire sign = a[7] ^ b[7];
@COMMON@
  function [19:0] norm_attr;
    input [3:0] mant_key;
    reg [19:0] attr;
    begin
      case (mant_key)
@NORM_ATTRS@
        default: attr = 20'd0;
      endcase
      norm_attr = attr;
    end
  endfunction

  function [6:0] norm_small_mag;
    input [5:0] key;
    begin
      case (key)
@NORM_SMALL@
        default: norm_small_mag = 7'h00;
      endcase
    end
  endfunction

  function [19:0] sub_attr;
    input [5:0] sig_key;
    reg [19:0] attr;
    begin
      case (sig_key)
@SUB_ATTRS@
        default: attr = 20'd0;
      endcase
      sub_attr = attr;
    end
  endfunction

  function [6:0] sub_small_mag;
    input [7:0] key;
    begin
      case (key)
@SUB_SMALL@
        default: sub_small_mag = 7'h00;
      endcase
    end
  endfunction

  function [6:0] apply_attr;
    input [19:0] attr;
    input [5:0] exp_sum;
    input [6:0] low_value;
    reg valid;
    reg [5:0] zero_hi;
    reg [5:0] sat_lo;
    reg [4:0] bias;
    reg [1:0] mant;
    reg [5:0] step;
    reg [5:0] out_exp6;
    begin
      valid = attr[19];
      zero_hi = attr[18:13];
      sat_lo = attr[12:7];
      bias = attr[6:2];
      mant = attr[1:0];
      step = exp_sum - zero_hi;
      out_exp6 = exp_sum - {1'b0, bias};
      if (!valid || (exp_sum <= zero_hi)) apply_attr = 7'h00;
      else if (step <= 6'd3) apply_attr = low_value;
      else if (exp_sum >= sat_lo) apply_attr = 7'h7e;
      else apply_attr = {out_exp6[4:0], mant};
    end
  endfunction

  wire both_norm = (ae != 5'd0) && (be != 5'd0);
  wire [2:0] sig_a = sig3(am);
  wire [2:0] sig_b = sig3(bm);
  wire [5:0] exp_sum = eff_exp(am) + eff_exp(bm);
  wire [3:0] norm_key = {am[1:0], bm[1:0]};
  wire [5:0] sig_key = {sig_a, sig_b};
  wire [19:0] nattr = norm_attr(norm_key);
  wire [19:0] sattr = sub_attr(sig_key);
  wire [5:0] nstep = exp_sum - nattr[18:13];
  wire [5:0] sstep = exp_sum - sattr[18:13];
  wire [6:0] norm_low = norm_small_mag({norm_key, nstep[1:0]});
  wire [6:0] sub_low = sub_small_mag({sig_key, sstep[1:0]});
  wire [6:0] norm_mag = apply_attr(nattr, exp_sum, norm_low);
  wire [6:0] sub_mag = apply_attr(sattr, exp_sum, sub_low);
  wire [6:0] mag = both_norm ? norm_mag : sub_mag;
  assign out = nan ? 8'h7f : {sign, mag};
endmodule
""".replace("@MODULE@", module).replace("@COMMON@", common_sig_eff()).replace("@NORM_ATTRS@", "\n".join(norm_attrs)).replace("@NORM_SMALL@", "\n".join(norm_small)).replace("@SUB_ATTRS@", "\n".join(sub_attrs)).replace("@SUB_SMALL@", "\n".join(sub_small))


def render_div_normsplit(module):
    norm_attrs = []
    norm_small = []
    sub_attrs = []
    sub_small = []
    for mn in range(4):
        for md in range(4):
            key = (mn << 2) | md
            sig_n = 4 + mn
            sig_d = 4 + md
            zero_hi, sat_lo, offset, mant = div_class(sig_n, sig_d)
            norm_attrs.append(
                "        4'h{0:x}: attr = {{1'b1, {1}, {2}, 5'd{3}, 2'd{4}}};".format(
                    key, sconst(zero_hi), sconst(sat_lo), offset, mant
                )
            )
            for step in range(1, 4):
                mag = FP8.div_mag_from_sig_delta(sig_n, sig_d, zero_hi + step)
                if mag:
                    norm_small.append("        6'h{0:02x}: norm_small_mag = 7'h{1:02x};".format((key << 2) | step, mag))
    for sig_n in range(8):
        for sig_d in range(8):
            key = (sig_n << 3) | sig_d
            if sig_n == 0 or sig_d == 0 or (sig_n >= 4 and sig_d >= 4):
                continue
            zero_hi, sat_lo, offset, mant = div_class(sig_n, sig_d)
            sub_attrs.append(
                "        6'h{0:02x}: attr = {{1'b1, {1}, {2}, 5'd{3}, 2'd{4}}};".format(
                    key, sconst(zero_hi), sconst(sat_lo), offset, mant
                )
            )
            for step in range(1, 4):
                mag = FP8.div_mag_from_sig_delta(sig_n, sig_d, zero_hi + step)
                if mag:
                    sub_small.append("        8'h{0:02x}: sub_small_mag = 7'h{1:02x};".format((key << 2) | step, mag))
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] den = in[15:8];
  wire [7:0] num = in[7:0];
  wire [6:0] dm = den[6:0];
  wire [6:0] nm = num[6:0];
  wire [4:0] de = dm[6:2];
  wire [4:0] ne = nm[6:2];
  wire nan = (dm == 7'h7f) || (nm == 7'h7f);
  wire den_zero = (dm == 7'h00);
  wire num_zero = (nm == 7'h00);
  wire sign = den[7] ^ num[7];
@COMMON@
  function [21:0] norm_attr;
    input [3:0] mant_key;
    reg [21:0] attr;
    begin
      case (mant_key)
@NORM_ATTRS@
        default: attr = 22'd0;
      endcase
      norm_attr = attr;
    end
  endfunction

  function [6:0] norm_small_mag;
    input [5:0] key;
    begin
      case (key)
@NORM_SMALL@
        default: norm_small_mag = 7'h00;
      endcase
    end
  endfunction

  function [21:0] sub_attr;
    input [5:0] sig_key;
    reg [21:0] attr;
    begin
      case (sig_key)
@SUB_ATTRS@
        default: attr = 22'd0;
      endcase
      sub_attr = attr;
    end
  endfunction

  function [6:0] sub_small_mag;
    input [7:0] key;
    begin
      case (key)
@SUB_SMALL@
        default: sub_small_mag = 7'h00;
      endcase
    end
  endfunction

  function [6:0] apply_attr;
    input [21:0] attr;
    input signed [6:0] delta;
    input [6:0] low_value;
    reg valid;
    reg signed [6:0] zero_hi;
    reg signed [6:0] sat_lo;
    reg [4:0] offset;
    reg [1:0] mant;
    reg signed [6:0] step;
    reg signed [6:0] out_exp_s;
    begin
      valid = attr[21];
      zero_hi = attr[20:14];
      sat_lo = attr[13:7];
      offset = attr[6:2];
      mant = attr[1:0];
      step = delta - zero_hi;
      out_exp_s = delta + $signed({2'b0, offset});
      if (!valid || (delta <= zero_hi)) apply_attr = 7'h00;
      else if (step <= 7'sd3) apply_attr = low_value;
      else if (delta >= sat_lo) apply_attr = 7'h7e;
      else apply_attr = {out_exp_s[4:0], mant};
    end
  endfunction

  wire both_norm = (ne != 5'd0) && (de != 5'd0);
  wire [2:0] sig_n = sig3(nm);
  wire [2:0] sig_d = sig3(dm);
  wire signed [6:0] delta = $signed({1'b0, eff_exp(nm)}) - $signed({1'b0, eff_exp(dm)});
  wire [3:0] norm_key = {nm[1:0], dm[1:0]};
  wire [5:0] sig_key = {sig_n, sig_d};
  wire [21:0] nattr = norm_attr(norm_key);
  wire [21:0] sattr = sub_attr(sig_key);
  wire signed [6:0] nstep = delta - $signed(nattr[20:14]);
  wire signed [6:0] sstep = delta - $signed(sattr[20:14]);
  wire [6:0] norm_low = norm_small_mag({norm_key, nstep[1:0]});
  wire [6:0] sub_low = sub_small_mag({sig_key, sstep[1:0]});
  wire [6:0] norm_mag = apply_attr(nattr, delta, norm_low);
  wire [6:0] sub_mag = apply_attr(sattr, delta, sub_low);
  wire [6:0] core_mag = both_norm ? norm_mag : sub_mag;
  wire invalid = nan || (den_zero && num_zero);
  wire [6:0] mag = den_zero ? 7'h7e : (num_zero ? 7'h00 : core_mag);
  assign out = invalid ? 8'h7f : {sign, mag};
endmodule
""".replace("@MODULE@", module).replace("@COMMON@", common_sig_eff()).replace("@NORM_ATTRS@", "\n".join(norm_attrs)).replace("@NORM_SMALL@", "\n".join(norm_small)).replace("@SUB_ATTRS@", "\n".join(sub_attrs)).replace("@SUB_SMALL@", "\n".join(sub_small))


def render(case, variant, module):
    if case == "ex246" and variant.startswith("semantic_mul_sigprodcode_dc_seed"):
        attr = variant.endswith("_attr")
        body = variant[:-5] if attr else variant
        suffix = body.rsplit("seed", 1)[1]
        if "_set" in suffix:
            seed_text, set_text = suffix.split("_set", 1)
            product_text, value_text = set_text.split("to", 1)
            mapping = product_dc_seed_map(int(seed_text))
            mapping[int(product_text)] = None if value_text == "z" else int(value_text)
        else:
            mapping = product_dc_seed_map(int(suffix))
        text = render_mul_sigprodcode_dc_map(module, mapping)
        return with_case_attrs(text) if attr else text
    if case == "ex246" and variant == "semantic_mul_product_dc_seed12_grouped":
        return render_mul_product_dc_seed12_grouped(module)
    if case == "ex246" and variant == "semantic_mul_product_qclass_smallpat_seed12_set11to10":
        mapping = product_dc_seed_map(12)
        mapping[11] = 10
        return render_mul_product_qclass_smallpat(module, mapping)
    if case == "ex246" and variant == "semantic_mul_product_qclass_smallpat_semantic":
        return render_mul_product_qclass_smallpat(module, None)
    if case == "ex246" and variant == "semantic_mul_product_class_smallpat_seed12_set11to10":
        mapping = product_dc_seed_map(12)
        mapping[11] = 10
        return render_mul_product_class_smallpat(module, mapping)
    if case == "ex246" and variant == "semantic_mul_product_class_smallpat_semantic":
        return render_mul_product_class_smallpat(module, None)
    if case == "ex246" and variant == "semantic_mul_product_bound_smallpat_seed12_set11to10":
        mapping = product_dc_seed_map(12)
        mapping[11] = 10
        return render_mul_product_bound_smallpat(module, mapping)
    if case == "ex246" and variant == "semantic_mul_product_bound_smallpat_semantic":
        return render_mul_product_bound_smallpat(module, None)
    if case == "ex246" and variant.startswith("semantic_mul_product_dc_seed"):
        suffix = variant.rsplit("seed", 1)[1]
        if "_set" in suffix:
            seed_text, set_text = suffix.split("_set", 1)
            product_text, value_text = set_text.split("to", 1)
            mapping = product_dc_seed_map(int(seed_text))
            mapping[int(product_text)] = None if value_text == "z" else int(value_text)
            return render_mul_product_dc_map(module, mapping)
        if "_swap" in suffix:
            seed_text, swap_text = suffix.split("_swap", 1)
            product_text, other_text = swap_text.split("_to_seed", 1)
            mapping = product_dc_seed_map(int(seed_text))
            other = product_dc_seed_map(int(other_text))
            mapping[int(product_text)] = other[int(product_text)]
            return render_mul_product_dc_map(module, mapping)
        return render_mul_product_dc_seed(module, int(suffix))
    if case == "ex246" and variant == "semantic_mul_product_class_parallel":
        return with_case_attrs(render_mul_product_class(module))
    if case == "ex246" and variant == "semantic_mul_product_possible_parallel":
        return with_case_attrs(render_mul_product_possible_class(module))
    if case == "ex246" and variant == "semantic_mul_product_dc_semantic_attr":
        return render_mul_product_dc_completion(module, "semantic", attrs=True)
    if case == "ex246" and variant == "semantic_mul_product_dc_low":
        return render_mul_product_dc_completion(module, "low", attrs=False)
    if case == "ex246" and variant == "semantic_mul_product_dc_high":
        return render_mul_product_dc_completion(module, "high", attrs=False)
    if case == "ex246" and variant == "semantic_mul_product_dc_nearest":
        return render_mul_product_dc_completion(module, "nearest", attrs=False)
    if case == "ex246" and variant == "semantic_mul_product_dc_low_attr":
        return render_mul_product_dc_completion(module, "low", attrs=True)
    if case == "ex246" and variant == "semantic_mul_product_dc_high_attr":
        return render_mul_product_dc_completion(module, "high", attrs=True)
    if case == "ex246" and variant == "semantic_mul_product_dc_nearest_attr":
        return render_mul_product_dc_completion(module, "nearest", attrs=True)
    if case == "ex247" and variant == "semantic_div_sigpair_class_parallel":
        return with_case_attrs(render_div_sigpair_class(module))
    if case == "ex247" and variant == "semantic_div_sigpair_possible_parallel":
        return with_case_attrs(render_div_sigpair_possible_class(module))
    if case == "ex247" and variant == "semantic_div_sigpair_core_special_rows":
        return render_div_sigpair_possible_class(module, include_numzero=True, include_denzero=True, denzero_sat=True, out_mux="core")
    if case == "ex247" and variant == "semantic_div_sigpair_core_special_rows_parallel":
        return with_case_attrs(render_div_sigpair_possible_class(module, include_numzero=True, include_denzero=True, denzero_sat=True, out_mux="core"))
    if case == "ex247" and variant == "semantic_div_sigpair_numzero_inside":
        return render_div_sigpair_possible_class(module, include_numzero=True, include_denzero=False, denzero_sat=False, out_mux="den_only")
    if case == "ex247" and variant == "semantic_div_sigpair_denzero_inside":
        return render_div_sigpair_possible_class(module, include_numzero=False, include_denzero=True, denzero_sat=True, out_mux="core")
    if case == "ex247" and variant == "semantic_div_sigpair_zero_rows_denmux":
        return render_div_sigpair_possible_class(module, include_numzero=True, include_denzero=True, denzero_sat=False, out_mux="den_only")
    if case == "ex247" and variant == "semantic_div_sigpair_denzero_sat_denmux":
        return render_div_sigpair_possible_class(module, include_numzero=True, include_denzero=True, denzero_sat=True, out_mux="den_only")
    if case == "ex247" and variant == "semantic_div_sigpair_denzero_copy1_denmux":
        return render_div_sigpair_possible_class(module, include_numzero=True, include_denzero=True, denzero_copy=1, out_mux="den_only")
    if case == "ex247" and variant == "semantic_div_sigpair_denzero_copy7_denmux":
        return render_div_sigpair_possible_class(module, include_numzero=True, include_denzero=True, denzero_copy=7, out_mux="den_only")
    if case == "ex247" and variant == "semantic_div_sigpair_ordered_zero_denmux":
        return render_div_sigpair_ordered_denzero_dc(module, "zero")
    if case == "ex247" and variant == "semantic_div_sigpair_ordered_sat_denmux":
        return render_div_sigpair_ordered_denzero_dc(module, "sat")
    if case == "ex247" and variant == "semantic_div_sigpair_ordered_copy1_denmux":
        return render_div_sigpair_ordered_denzero_dc(module, "copy1")
    if case == "ex247" and variant == "semantic_div_sigpair_ordered_copy7_denmux":
        return render_div_sigpair_ordered_denzero_dc(module, "copy7")
    if case == "ex247" and variant == "semantic_div_sigpair_ordered_sat_attr_denmux":
        return render_div_sigpair_ordered_denzero_dc(module, "sat", attrs=True)
    if case == "ex247" and variant == "semantic_div_sigpair_ordered_zero_reverse_denmux":
        return render_div_sigpair_ordered_denzero_dc(module, "zero", reverse=True)
    if case == "ex247" and variant.startswith("semantic_div_sigpair_bitbdd"):
        return render_div_sigpair_bit_bdd(module, int(variant.rsplit("bitbdd", 1)[1]))
    if case == "ex246" and variant == "semantic_mul_product_attr_shared":
        return render_mul_product_attr(module)
    if case == "ex246" and variant == "semantic_mul_sigpair_attr_shared":
        return render_mul_sigpair_attr(module)
    if case == "ex247" and variant == "semantic_div_sigpair_attr_shared":
        return render_div_sigpair_attr(module)
    if case == "ex247" and variant == "semantic_div_sigpair_split_attr":
        return render_div_sigpair_split_attr(module)
    if case == "ex247" and variant == "semantic_div_threshold_compare":
        return render_div_threshold_compare(module)
    if case == "ex246" and variant == "semantic_mul_sigpair_minlogic_full":
        return render_mul_sigpair_minlogic_full(module)
    if case == "ex247" and variant == "semantic_div_sigpair_minlogic_full":
        return render_div_sigpair_minlogic_full(module)
    if case == "ex246" and variant == "semantic_mul_nested_a":
        return render_mul_nested_sig(module, "a")
    if case == "ex246" and variant == "semantic_mul_nested_b":
        return render_mul_nested_sig(module, "b")
    if case == "ex247" and variant == "semantic_div_nested_den":
        return render_div_nested_sig(module, "den")
    if case == "ex247" and variant == "semantic_div_nested_num":
        return render_div_nested_sig(module, "num")
    if case == "ex247" and variant == "semantic_div_sigpair_grouped_class":
        return render_div_sigpair_grouped_class(module)
    if case == "ex247" and variant.startswith("semantic_div_sigpair_invalid_dc_seed"):
        return render_div_sigpair_invalid_dc_seed(module, int(variant.rsplit("seed", 1)[1]))
    if case == "ex247" and variant == "semantic_div_qclass_smallpat":
        return render_div_qclass_smallpat(module, nested=False)
    if case == "ex247" and variant == "semantic_div_qclass_smallpat_nested_den":
        return render_div_qclass_smallpat(module, nested=True)
    if case == "ex247" and variant == "semantic_div_qclass_smallpat_parallel":
        return with_case_attrs(render_div_qclass_smallpat(module, nested=False))
    if case == "ex247" and variant == "semantic_div_qclass_smallpat_nested_den_parallel":
        return with_case_attrs(render_div_qclass_smallpat(module, nested=True))
    if case == "ex247" and variant == "semantic_div_bound_smallpat":
        return render_div_bound_smallpat(module, nested=False)
    if case == "ex247" and variant == "semantic_div_bound_smallpat_nested_den":
        return render_div_bound_smallpat(module, nested=True)
    if case == "ex247" and variant == "semantic_div_bound_smallpat_classid_nested_den":
        return render_div_bound_smallpat_classid(module, nested=True)
    if case == "ex247" and variant == "semantic_div_bound_smallpat_classid_nested_den_parallel":
        return with_case_attrs(render_div_bound_smallpat_classid(module, nested=True))
    if case == "ex247" and variant == "semantic_div_bound_smallpat_classid_flat":
        return render_div_bound_smallpat_classid(module, nested=False)
    if case == "ex247" and variant == "semantic_div_bound_smallpat_nested_num":
        return render_div_bound_smallpat_nested_num(module)
    if case == "ex247" and variant == "semantic_div_bound_smallpat_nested_den_parallel":
        return with_case_attrs(render_div_bound_smallpat(module, nested=True))
    if case == "ex247" and variant == "semantic_div_bound_smallpat_nested_num_parallel":
        return with_case_attrs(render_div_bound_smallpat_nested_num(module))
    if case == "ex247" and variant == "semantic_div_recip_product_qclass":
        return render_div_recip_product_qclass(module)
    if case == "ex247" and variant == "semantic_div_sigpair_class_smallpat":
        return render_div_sigpair_class_smallpat(module)
    if case == "ex246" and variant == "semantic_mul_threshold_norm":
        return render_mul_threshold(module)
    if case == "ex246" and variant == "semantic_mul_logcode":
        return render_mul_logcode(module)
    if case == "ex246" and variant == "semantic_mul_product_possible_class":
        return render_mul_product_possible_class(module)
    if case == "ex247" and variant == "semantic_div_logcode":
        return render_div_logcode(module)
    if case == "ex247" and variant == "semantic_div_sigpair_possible_class":
        return render_div_sigpair_possible_class(module)
    if case == "ex247" and variant == "semantic_div_sigpair_possible_numzero_class":
        return render_div_sigpair_possible_class(module, include_numzero=True, include_denzero=False)
    if case == "ex247" and variant == "semantic_div_sigpair_possible_denzero_class":
        return render_div_sigpair_possible_class(module, include_numzero=False, include_denzero=True)
    if case == "ex246" and variant == "semantic_mul_key_bdd_exp_then_product":
        return render_mul_key_bdd(module, list(range(11, -1, -1)))
    if case == "ex246" and variant == "semantic_mul_key_bdd_product_low_then_exp":
        return render_mul_key_bdd(module, [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11])
    if case == "ex247" and variant == "semantic_div_key_bdd_delta_then_sig":
        return render_div_key_bdd(module, list(range(11, -1, -1)))
    if case == "ex247" and variant == "semantic_div_key_bdd_sig_low_then_delta":
        return render_div_key_bdd(module, [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11])
    if case == "ex246" and variant == "semantic_mul_normsplit_attr":
        return render_mul_normsplit(module)
    if case == "ex247" and variant == "semantic_div_normsplit_attr":
        return render_div_normsplit(module)
    raise RuntimeError("unsupported {0} {1}".format(case, variant))


VARIANTS = [
    ("ex246", "semantic_mul_sigprodcode_dc_seed12_set11to10", "E5M2FN mul: sig-pair product-code table plus seed12 product-class don't-care completion"),
    ("ex246", "semantic_mul_sigprodcode_dc_seed12_set11to10_attr", "E5M2FN mul: sig-pair product-code table plus seed12 completion with case attributes"),
    ("ex246", "semantic_mul_sigprodcode_dc_seed228", "E5M2FN mul: sig-pair product-code table plus low-area seed228 product-class completion"),
    ("ex246", "semantic_mul_sigprodcode_dc_seed228_attr", "E5M2FN mul: sig-pair product-code table plus low-area seed228 completion with case attributes"),
    ("ex246", "semantic_mul_product_class_parallel", "E5M2FN mul: current full product-class completion with parallel/full case hints"),
    ("ex246", "semantic_mul_product_possible_parallel", "E5M2FN mul: reachable-only product class with parallel/full case hints"),
    ("ex246", "semantic_mul_product_dc_semantic_attr", "E5M2FN mul: semantic unreachable product completion with case attributes"),
    ("ex246", "semantic_mul_product_dc_low", "E5M2FN mul: unreachable product codes copy nearest lower reachable class"),
    ("ex246", "semantic_mul_product_dc_high", "E5M2FN mul: unreachable product codes copy nearest higher reachable class"),
    ("ex246", "semantic_mul_product_dc_nearest", "E5M2FN mul: unreachable product codes copy nearest reachable class"),
    ("ex246", "semantic_mul_product_dc_low_attr", "E5M2FN mul: lower-neighbor don't-care completion plus case attributes"),
    ("ex246", "semantic_mul_product_dc_high_attr", "E5M2FN mul: higher-neighbor don't-care completion plus case attributes"),
    ("ex246", "semantic_mul_product_dc_nearest_attr", "E5M2FN mul: nearest-neighbor don't-care completion plus case attributes"),
    ("ex247", "semantic_div_sigpair_class_parallel", "E5M2FN div: current full sigpair class with parallel/full case hints"),
    ("ex247", "semantic_div_sigpair_possible_parallel", "E5M2FN div: nonzero sigpair class with parallel/full case hints"),
    ("ex247", "semantic_div_sigpair_core_special_rows", "E5M2FN div: move zero/div-by-zero behavior into sigpair table and remove output mux"),
    ("ex247", "semantic_div_sigpair_core_special_rows_parallel", "E5M2FN div: special rows inside sigpair table plus case attributes"),
    ("ex247", "semantic_div_sigpair_numzero_inside", "E5M2FN div: numerator-zero handled by table default, only denominator outer mux remains"),
    ("ex247", "semantic_div_sigpair_denzero_inside", "E5M2FN div: denominator-zero rows produce saturation, core drives output magnitude"),
    ("ex247", "semantic_div_sigpair_zero_rows_denmux", "E5M2FN div: explicit numerator-zero rows plus denominator-zero don't-care rows, outer denominator mux only"),
    ("ex247", "semantic_div_sigpair_denzero_sat_denmux", "E5M2FN div: denominator-zero ignored rows completed as saturation while outer denominator mux remains"),
    ("ex247", "semantic_div_sigpair_denzero_copy1_denmux", "E5M2FN div: denominator-zero ignored rows copy sig_d=1 class while outer denominator mux remains"),
    ("ex247", "semantic_div_sigpair_denzero_copy7_denmux", "E5M2FN div: denominator-zero ignored rows copy sig_d=7 class while outer denominator mux remains"),
    ("ex247", "semantic_div_sigpair_ordered_zero_denmux", "E5M2FN div: row-major sigpair table with zero denominator-zero don't-care completion"),
    ("ex247", "semantic_div_sigpair_ordered_sat_denmux", "E5M2FN div: row-major sigpair table with saturated denominator-zero don't-care completion"),
    ("ex247", "semantic_div_sigpair_ordered_copy1_denmux", "E5M2FN div: row-major sigpair table with denominator-zero rows copied from sig_d=1"),
    ("ex247", "semantic_div_sigpair_ordered_copy7_denmux", "E5M2FN div: row-major sigpair table with denominator-zero rows copied from sig_d=7"),
    ("ex247", "semantic_div_sigpair_ordered_sat_attr_denmux", "E5M2FN div: row-major saturated denominator-zero completion plus case attributes"),
    ("ex247", "semantic_div_sigpair_ordered_zero_reverse_denmux", "E5M2FN div: reverse row-major sigpair table with zero denominator-zero completion"),
    ("ex247", "semantic_div_sigpair_bitbdd0", "E5M2FN div: row-major class table with magnitude bit 0 overridden by semantic-key BDD"),
    ("ex247", "semantic_div_sigpair_bitbdd1", "E5M2FN div: row-major class table with magnitude bit 1 overridden by semantic-key BDD"),
    ("ex247", "semantic_div_sigpair_bitbdd2", "E5M2FN div: row-major class table with magnitude bit 2 overridden by semantic-key BDD"),
    ("ex247", "semantic_div_sigpair_bitbdd3", "E5M2FN div: row-major class table with magnitude bit 3 overridden by semantic-key BDD"),
    ("ex247", "semantic_div_sigpair_bitbdd4", "E5M2FN div: row-major class table with magnitude bit 4 overridden by semantic-key BDD"),
    ("ex247", "semantic_div_sigpair_bitbdd5", "E5M2FN div: row-major class table with magnitude bit 5 overridden by semantic-key BDD"),
    ("ex247", "semantic_div_sigpair_bitbdd6", "E5M2FN div: row-major class table with magnitude bit 6 overridden by semantic-key BDD"),
    ("ex246", "semantic_mul_product_attr_shared", "E5M2FN mul: product attribute table plus shared boundary/linear reassembly"),
    ("ex246", "semantic_mul_sigpair_attr_shared", "E5M2FN mul: significand-pair attribute table plus shared boundary/linear reassembly"),
    ("ex247", "semantic_div_sigpair_attr_shared", "E5M2FN div: significand-pair attribute table plus shared boundary/linear reassembly"),
    ("ex247", "semantic_div_sigpair_split_attr", "E5M2FN div: split zero/sat/offset/mant attribute tables plus shared low-boundary table"),
    ("ex247", "semantic_div_threshold_compare", "E5M2FN div: quotient shift/mantissa from threshold comparisons plus small underflow table"),
    ("ex246", "semantic_mul_sigpair_minlogic_full", "E5M2FN mul: direct sigpair classifier SOP logic plus small-mag SOP with exact don't-cares"),
    ("ex247", "semantic_div_sigpair_minlogic_full", "E5M2FN div: direct sigpair classifier SOP logic plus small-mag SOP with exact don't-cares"),
    ("ex246", "semantic_mul_nested_a", "E5M2FN mul: two-level sig_a then sig_b product-class mux"),
    ("ex246", "semantic_mul_nested_b", "E5M2FN mul: two-level sig_b then sig_a product-class mux"),
    ("ex247", "semantic_div_nested_den", "E5M2FN div: two-level denominator-significand then numerator mux"),
    ("ex247", "semantic_div_nested_num", "E5M2FN div: two-level numerator-significand then denominator mux"),
    ("ex246", "semantic_mul_product_dc_seed12_grouped", "E5M2FN mul: seed12 product don't-care completion with grouped identical case blocks"),
    ("ex247", "semantic_div_sigpair_grouped_class", "E5M2FN div: sigpair class with grouped identical case blocks"),
    ("ex246", "semantic_mul_product_qclass_smallpat_seed12_set11to10", "E5M2FN mul: seed12 product don't-care completion with quotient-style small underflow pattern formula"),
    ("ex246", "semantic_mul_product_qclass_smallpat_semantic", "E5M2FN mul: semantic product class with quotient-style small underflow pattern formula"),
    ("ex246", "semantic_mul_product_class_smallpat_seed12_set11to10", "E5M2FN mul: seed12 product-class case with formulaic 2-bit underflow pattern"),
    ("ex246", "semantic_mul_product_class_smallpat_semantic", "E5M2FN mul: semantic product-class case with formulaic 2-bit underflow pattern"),
    ("ex246", "semantic_mul_product_bound_smallpat_seed12_set11to10", "E5M2FN mul: product classifier emits zero/sat/bias/mant plus formulaic 2-bit underflow pattern with seed12 completion"),
    ("ex246", "semantic_mul_product_bound_smallpat_semantic", "E5M2FN mul: product classifier emits zero/sat/bias/mant plus formulaic 2-bit underflow pattern"),
    ("ex247", "semantic_div_qclass_smallpat", "E5M2FN div: sigpair quotient classifier plus formulaic 2-bit underflow pattern"),
    ("ex247", "semantic_div_qclass_smallpat_nested_den", "E5M2FN div: denominator-first quotient classifier plus formulaic 2-bit underflow pattern"),
    ("ex247", "semantic_div_qclass_smallpat_parallel", "E5M2FN div: sigpair quotient classifier plus formulaic underflow pattern with full/parallel case hints"),
    ("ex247", "semantic_div_qclass_smallpat_nested_den_parallel", "E5M2FN div: denominator-first quotient classifier plus formulaic underflow pattern with full/parallel case hints"),
    ("ex247", "semantic_div_bound_smallpat", "E5M2FN div: sigpair classifier emits zero/sat/offset/mant plus formulaic 2-bit underflow pattern"),
    ("ex247", "semantic_div_bound_smallpat_nested_den", "E5M2FN div: denominator-first classifier emits zero/sat/offset/mant plus formulaic 2-bit underflow pattern"),
    ("ex247", "semantic_div_bound_smallpat_classid_nested_den", "E5M2FN div: denominator-first sigpair-to-class-id factoring with shared bound-smallpat attributes"),
    ("ex247", "semantic_div_bound_smallpat_classid_nested_den_parallel", "E5M2FN div: denominator-first class-id factoring with case attributes"),
    ("ex247", "semantic_div_bound_smallpat_classid_flat", "E5M2FN div: flat sigpair-to-class-id factoring with shared bound-smallpat attributes"),
    ("ex247", "semantic_div_bound_smallpat_nested_num", "E5M2FN div: numerator-first classifier emits zero/sat/offset/mant plus formulaic 2-bit underflow pattern"),
    ("ex247", "semantic_div_bound_smallpat_nested_den_parallel", "E5M2FN div: denominator-first bound/smallpat classifier with full/parallel case hints"),
    ("ex247", "semantic_div_bound_smallpat_nested_num_parallel", "E5M2FN div: numerator-first bound/smallpat classifier with full/parallel case hints"),
    ("ex247", "semantic_div_recip_product_qclass", "E5M2FN div: denominator reciprocal multiply into compact quotient classifier plus formulaic underflow pattern"),
    ("ex247", "semantic_div_sigpair_class_smallpat", "E5M2FN div: sigpair case with formulaic 2-bit underflow pattern instead of explicit low-delta rows"),
    ("ex246", "semantic_mul_threshold_norm", "E5M2FN mul: product threshold class plus shared low-end rounding table"),
    ("ex246", "semantic_mul_logcode", "E5M2FN mul: log-code add plus small normal/subnormal boundary tables"),
    ("ex246", "semantic_mul_product_possible_class", "E5M2FN mul: product class restricted to actually reachable 3-bit products"),
    ("ex247", "semantic_div_logcode", "E5M2FN div: log-code subtract plus small subnormal/boundary tables"),
    ("ex247", "semantic_div_sigpair_possible_class", "E5M2FN div: sigpair class restricted to nonzero numerator/denominator pairs"),
    ("ex247", "semantic_div_sigpair_possible_numzero_class", "E5M2FN div: nonzero sigpair class plus explicit numerator-zero rows"),
    ("ex247", "semantic_div_sigpair_possible_denzero_class", "E5M2FN div: nonzero sigpair class plus explicit denominator-zero rows"),
    ("ex246", "semantic_mul_key_bdd_exp_then_product", "E5M2FN mul: reduced semantic-key BDD with exp-sum bits before product bits"),
    ("ex246", "semantic_mul_key_bdd_product_low_then_exp", "E5M2FN mul: reduced semantic-key BDD with product low-to-high bits before exp-sum"),
    ("ex246", "semantic_mul_normsplit_attr", "E5M2FN mul: normal-normal mantissa-pair core plus subnormal attribute correction"),
    ("ex247", "semantic_div_normsplit_attr", "E5M2FN div: normal-normal mantissa-pair core plus subnormal attribute correction"),
    ("ex247", "semantic_div_key_bdd_delta_then_sig", "E5M2FN div: reduced semantic-key BDD with delta bits before significand pair"),
    ("ex247", "semantic_div_key_bdd_sig_low_then_delta", "E5M2FN div: reduced semantic-key BDD with significand low-to-high bits before delta"),
]


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
    for synth_name, synth_renderer in SYNTH_VARIANTS:
        if args.selected_synths and synth_name not in args.selected_synths:
            continue
        candidate_id = "{0}_{1}".format(module, synth_name)
        aig_path = args.work_dir / case / "aigs" / "{0}.aig".format(candidate_id)
        log_path = args.work_dir / case / "logs" / "{0}.yosys.log".format(candidate_id)
        row = empty_row(case, candidate_id, variant + "_" + synth_name, note, verilog_path, aig_path)
        start = time.time()
        try:
            synthesize_with_script(synth_renderer(verilog_path, module, aig_path), args.yosys, args.timeout, log_path)
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
        print(case, candidate_id, "eq={0}".format(row["equivalent"]), "area={0}".format(row["area"]), "delay={0}".format(row["delay"]), "adp={0}".format(row["adp"]), row["notes"])
        sys.stdout.flush()
    return rows


def write_manifest(args):
    text = """# {run_id}

Run ID: `{run_id}`

Purpose: focused E5M2FN frontend structure experiments for ex246/ex247.

Artifacts:
- Work directory: `{work_dir}`
- Candidates CSV: `{results_dir}/candidates.csv`
- Best CSV: `{results_dir}/best.csv`

Methods:
- ex246 product/significand-pair attribute tables with shared zero/sat/linear reassembly.
- ex247 significand-pair attribute table with shared signed-delta boundary handling.

No `student/seeds` curation is performed for this partial class.
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
    parser.add_argument("--synths", default="")
    parser.add_argument("--skip-static", action="store_true")
    parser.add_argument("--dc-random-count", type=int, default=0)
    parser.add_argument("--dc-random-start", type=int, default=0)
    parser.add_argument("--dc-swap-base", type=int)
    parser.add_argument("--dc-swap-other", type=int)
    parser.add_argument("--dc-neighbor-seed", type=int)
    parser.add_argument("--div-invalid-random-count", type=int, default=0)
    parser.add_argument("--div-invalid-random-start", type=int, default=0)
    args = parser.parse_args()
    args.work_dir = args.work_dir or (ROOT / "student" / "work" / args.run_id)
    args.results_dir = args.results_dir or (ROOT / "student" / "runs" / "float_fp8" / args.run_id / "results")
    refs = load_reference(args.reference)
    selected = set(item.strip() for item in args.cases.split(",") if item.strip())
    selected_variants = set(item.strip() for item in args.variants.split(",") if item.strip())
    args.selected_synths = set(item.strip() for item in args.synths.split(",") if item.strip())
    rows = []
    if not args.skip_static:
        for case, variant, note in VARIANTS:
            if case in selected and (not selected_variants or variant in selected_variants):
                rows.extend(run_variant(args, refs, case, variant, note))
    if "ex246" in selected and args.dc_random_count:
        for seed in range(args.dc_random_start, args.dc_random_start + args.dc_random_count):
            variant = "semantic_mul_product_dc_seed{0}".format(seed)
            if not selected_variants or variant in selected_variants:
                rows.extend(run_variant(args, refs, "ex246", variant, "E5M2FN mul: random unreachable product don't-care completion seed {0}".format(seed)))
    if "ex246" in selected and args.dc_swap_base is not None and args.dc_swap_other is not None:
        base_map = product_dc_seed_map(args.dc_swap_base)
        other_map = product_dc_seed_map(args.dc_swap_other)
        for product in sorted(base_map):
            if base_map[product] == other_map[product]:
                continue
            variant = "semantic_mul_product_dc_seed{0}_swap{1}_to_seed{2}".format(args.dc_swap_base, product, args.dc_swap_other)
            if not selected_variants or variant in selected_variants:
                rows.extend(run_variant(args, refs, "ex246", variant, "E5M2FN mul: seed {0} with product {1} completion swapped to seed {2}".format(args.dc_swap_base, product, args.dc_swap_other)))
    if "ex246" in selected and args.dc_neighbor_seed is not None:
        base_map = product_dc_seed_map(args.dc_neighbor_seed)
        for product in sorted(base_map):
            low = nearest_reachable_product(product, "low")
            high = nearest_reachable_product(product, "high")
            for value in [None, product, low, high]:
                if base_map[product] == value:
                    continue
                value_text = "z" if value is None else str(value)
                variant = "semantic_mul_product_dc_seed{0}_set{1}to{2}".format(args.dc_neighbor_seed, product, value_text)
                if not selected_variants or variant in selected_variants:
                    rows.extend(run_variant(args, refs, "ex246", variant, "E5M2FN mul: seed {0} single-neighbor product {1} -> {2}".format(args.dc_neighbor_seed, product, value_text)))
    if "ex247" in selected and args.div_invalid_random_count:
        for seed in range(args.div_invalid_random_start, args.div_invalid_random_start + args.div_invalid_random_count):
            variant = "semantic_div_sigpair_invalid_dc_seed{0}".format(seed)
            if not selected_variants or variant in selected_variants:
                rows.extend(run_variant(args, refs, "ex247", variant, "E5M2FN div: random invalid sigpair don't-care completion seed {0}".format(seed)))
    best = {}
    for row in rows:
        if row.get("equivalent") != "1" or not row.get("adp"):
            continue
        old = best.get(row["case"])
        if old is None or int(row["adp"]) < int(old["adp"]):
            best[row["case"]] = row
    args.results_dir.mkdir(parents=True, exist_ok=True)
    write_csv(args.results_dir / "candidates.csv", RESULT_FIELDNAMES, rows)
    write_csv(args.results_dir / "evaluate_check.csv", RESULT_FIELDNAMES, rows)
    write_csv(args.results_dir / "best.csv", BEST_FIELDNAMES, [best[case] for case in CASES if case in best])
    write_csv(args.results_dir / "summary.csv", BEST_FIELDNAMES, [best[case] for case in CASES if case in best])
    write_manifest(args)


if __name__ == "__main__":
    main()
