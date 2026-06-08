#!/usr/bin/env python3
"""Generate E5M2FN semantic frontend seeds for ex245-ex249.

The batch is the E5M2FN counterpart of the earlier E4M3FN packed FP8 cases:

- ex245: add high byte + low byte
- ex246: multiply high byte * low byte
- ex247: divide low byte / high byte
- ex248: fmod low byte % high byte
- ex249: hypot(abs(high), abs(low))

Artifacts stay in student/work and student/runs/float_fp8.  This script does
not curate student/seeds because the ex240-ex254 class is still incomplete.
"""

import argparse
import csv
import math
import sys
import time
from bisect import bisect_left
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from student.backends.abc_flow import evaluate_aig
from student.frontends.truth import TruthTable
from student.frontends.yosys_synth import SynthError, run_command
from student.generators.fp8_ex240_ex244_deep_struct import SYNTH_VARIANTS
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


CASES = ["ex245", "ex246", "ex247", "ex248", "ex249"]
CASE_LABELS = {
    "ex245": "fp8_e5m2fn_add",
    "ex246": "fp8_e5m2fn_mul",
    "ex247": "fp8_e5m2fn_div_low_over_high",
    "ex248": "fp8_e5m2fn_fmod_low_by_high",
    "ex249": "fp8_e5m2fn_hypot_abs",
}


class E5M2FN:
    def __init__(self):
        self.k = [0] * 128
        self.nan = [False] * 128
        for code in range(128):
            exp = (code >> 2) & 0x1F
            mant = code & 0x3
            if exp == 0x1F and mant == 0x3:
                self.nan[code] = True
            elif exp == 0:
                self.k[code] = mant
            else:
                self.k[code] = (4 + mant) << (exp - 1)
        self.scale = self.k[0x3C]
        self.pos = [(self.k[code], code) for code in range(1, 0x7F) if not self.nan[code]]
        self.pos_k = [item[0] for item in self.pos]

    def quant_mag_rational(self, numerator, denominator=1):
        if denominator < 0:
            numerator = -numerator
            denominator = -denominator
        if numerator <= 0:
            return 0
        best = (numerator * 2, 0, 0)
        best_code = 0
        idx = bisect_left(self.pos_k, numerator // denominator)
        for j in range(max(0, idx - 5), min(len(self.pos), idx + 8)):
            point, code = self.pos[j]
            diff = abs(numerator - point * denominator)
            key = (diff * 2, code & 1, code)
            if key < best:
                best = key
                best_code = code
        return best_code

    def add(self, a, b):
        am = a & 0x7F
        bm = b & 0x7F
        if self.nan[am] or self.nan[bm]:
            return 0x7F
        aval = -self.k[am] if (a & 0x80) else self.k[am]
        bval = -self.k[bm] if (b & 0x80) else self.k[bm]
        total = aval + bval
        sign = 1 if total < 0 else 0
        mag = self.quant_mag_rational(abs(total))
        if mag == 0 and self.k[am] == 0 and self.k[bm] == 0 and (a & 0x80) and (b & 0x80):
            sign = 1
        return (sign << 7) | mag

    def mul_mag_from_product(self, product, exp_sum):
        if product == 0:
            return 0
        shift = exp_sum - 18
        if shift >= 0:
            return self.quant_mag_rational(product << shift)
        return self.quant_mag_rational(product, 1 << (-shift))

    def mul(self, a, b):
        am = a & 0x7F
        bm = b & 0x7F
        if self.nan[am] or self.nan[bm]:
            return 0x7F
        return (((a >> 7) ^ (b >> 7)) << 7) | self.quant_mag_rational(self.k[am] * self.k[bm], self.scale)

    def div_mag_from_sig_delta(self, sig_n, sig_d, delta):
        if sig_d == 0:
            return 0x7E if sig_n else 0x7F
        if sig_n == 0:
            return 0
        if delta >= 0:
            return self.quant_mag_rational(sig_n << (delta + 16), sig_d)
        return self.quant_mag_rational(sig_n << 16, sig_d << (-delta))

    def div(self, num, den):
        mn = num & 0x7F
        md = den & 0x7F
        if self.nan[mn] or self.nan[md]:
            return 0x7F
        sign = (num >> 7) ^ (den >> 7)
        if self.k[md] == 0:
            return 0x7F if self.k[mn] == 0 else ((sign << 7) | 0x7E)
        return (sign << 7) | self.quant_mag_rational(self.k[mn] * self.scale, self.k[md])

    def fmod(self, num, den):
        mn = num & 0x7F
        md = den & 0x7F
        if self.nan[mn] or self.nan[md] or self.k[md] == 0:
            return 0x7F
        return (num & 0x80) | self.quant_mag_rational(self.k[mn] % self.k[md])

    def hypot_mag(self, a, b):
        am = a & 0x7F
        bm = b & 0x7F
        if self.nan[am] or self.nan[bm]:
            return 0x7F
        root = math.sqrt(self.k[am] * self.k[am] + self.k[bm] * self.k[bm])
        return self.quant_mag_rational(int(round(root * 1048576)), 1048576)


FP8 = E5M2FN()


def sig_eff(code):
    exp = (code >> 2) & 0x1F
    mant = code & 0x3
    if exp == 0:
        return mant, 1
    return 4 + mant, exp


def render_common_sig_eff():
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


def render_add_pair_delta(module):
    same_entries = []
    diff_entries = []
    for maxc in range(128):
        for minc in range(maxc + 1):
            if FP8.nan[maxc] or FP8.nan[minc]:
                continue
            same_mag = FP8.quant_mag_rational(FP8.k[maxc] + FP8.k[minc])
            if same_mag != maxc:
                same_entries.append((maxc << 7 | minc, same_mag))
            diff_mag = FP8.quant_mag_rational(FP8.k[maxc] - FP8.k[minc])
            diff_default = 0 if maxc == minc else maxc
            if diff_mag != diff_default:
                diff_entries.append((maxc << 7 | minc, diff_mag))
    same_text = "\n".join("        14'h{0:04x}: same_table = 7'h{1:02x};".format(k, v) for k, v in same_entries)
    diff_text = "\n".join("        14'h{0:04x}: diff_table = 7'h{1:02x};".format(k, v) for k, v in diff_entries)
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] a = in[15:8];
  wire [7:0] b = in[7:0];
  wire [6:0] am = a[6:0];
  wire [6:0] bm = b[6:0];
  wire nan = (am == 7'h7f) || (bm == 7'h7f);
  wire same_sign = (a[7] == b[7]);
  wire a_ge_b = (am >= bm);
  wire [6:0] maxc = a_ge_b ? am : bm;
  wire [6:0] minc = a_ge_b ? bm : am;
  wire [13:0] key = {maxc, minc};

  function [6:0] same_table;
    input [13:0] k;
    begin
      case (k)
@SAME@
        default: same_table = 7'h7f;
      endcase
    end
  endfunction

  function [6:0] diff_table;
    input [13:0] k;
    begin
      case (k)
@DIFF@
        default: diff_table = 7'h7f;
      endcase
    end
  endfunction

  wire [6:0] same_corr = same_table(key);
  wire [6:0] diff_corr = diff_table(key);
  wire [6:0] same_mag = (same_corr == 7'h7f) ? maxc : same_corr;
  wire [6:0] diff_default = (maxc == minc) ? 7'h00 : maxc;
  wire [6:0] diff_mag = (diff_corr == 7'h7f) ? diff_default : diff_corr;
  wire diff_sign = (maxc == minc) ? 1'b0 : (a_ge_b ? a[7] : b[7]);
  wire out_sign = same_sign ? a[7] : diff_sign;
  wire [6:0] out_mag = same_sign ? same_mag : diff_mag;
  assign out = nan ? 8'h7f : {out_sign, out_mag};
endmodule
""".replace("@MODULE@", module).replace("@SAME@", same_text).replace("@DIFF@", diff_text)


def render_add_norm(module):
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] a = in[15:8];
  wire [7:0] b = in[7:0];
  wire [6:0] am = a[6:0];
  wire [6:0] bm = b[6:0];
  wire nan = (am == 7'h7f) || (bm == 7'h7f);
@COMMON@
  function [34:0] fp8_mag;
    input [6:0] v;
    reg [2:0] s;
    reg [5:0] e;
    begin
      s = sig3(v);
      e = eff_exp(v);
      fp8_mag = {32'd0, s} << (e - 6'd1);
    end
  endfunction

  function [7:0] quant_norm;
    input [34:0] mag;
    input sign;
    input neg_zero;
    reg [5:0] lead;
    reg [5:0] exp;
    reg [5:0] shift;
    reg [3:0] base;
    reg [34:0] rem;
    reg [34:0] half;
    reg round_up;
    reg [3:0] sig;
    begin
      if (mag == 35'd0) begin
        quant_norm = neg_zero ? 8'h80 : 8'h00;
      end else if (mag <= 35'd3) begin
        quant_norm = {sign, 5'd0, mag[1:0]};
      end else begin
        if (mag[34]) lead = 6'd34;
        else if (mag[33]) lead = 6'd33;
        else if (mag[32]) lead = 6'd32;
        else if (mag[31]) lead = 6'd31;
        else if (mag[30]) lead = 6'd30;
        else if (mag[29]) lead = 6'd29;
        else if (mag[28]) lead = 6'd28;
        else if (mag[27]) lead = 6'd27;
        else if (mag[26]) lead = 6'd26;
        else if (mag[25]) lead = 6'd25;
        else if (mag[24]) lead = 6'd24;
        else if (mag[23]) lead = 6'd23;
        else if (mag[22]) lead = 6'd22;
        else if (mag[21]) lead = 6'd21;
        else if (mag[20]) lead = 6'd20;
        else if (mag[19]) lead = 6'd19;
        else if (mag[18]) lead = 6'd18;
        else if (mag[17]) lead = 6'd17;
        else if (mag[16]) lead = 6'd16;
        else if (mag[15]) lead = 6'd15;
        else if (mag[14]) lead = 6'd14;
        else if (mag[13]) lead = 6'd13;
        else if (mag[12]) lead = 6'd12;
        else if (mag[11]) lead = 6'd11;
        else if (mag[10]) lead = 6'd10;
        else if (mag[9]) lead = 6'd9;
        else if (mag[8]) lead = 6'd8;
        else if (mag[7]) lead = 6'd7;
        else if (mag[6]) lead = 6'd6;
        else if (mag[5]) lead = 6'd5;
        else if (mag[4]) lead = 6'd4;
        else if (mag[3]) lead = 6'd3;
        else begin lead = 6'd2; end
        exp = lead - 6'd1;
        shift = lead - 6'd2;
        base = mag >> shift;
        if (shift == 6'd0) begin
          round_up = 1'b0;
        end else begin
          rem = mag - ({31'd0, base} << shift);
          half = 35'd1 << (shift - 6'd1);
          round_up = (rem > half) || ((rem == half) && base[0]);
        end
        sig = base + {3'd0, round_up};
        if (sig >= 4'd8) begin
          exp = exp + 6'd1;
          sig = 4'd4;
        end
        if ((exp > 6'd31) || ((exp == 6'd31) && (sig >= 4'd7))) begin
          quant_norm = {sign, 7'h7e};
        end else begin
          quant_norm = {sign, exp[4:0], sig[1:0]};
        end
      end
    end
  endfunction

  wire [34:0] mag_a = fp8_mag(am);
  wire [34:0] mag_b = fp8_mag(bm);
  wire signed [35:0] sval_a = a[7] ? -$signed({1'b0, mag_a}) : $signed({1'b0, mag_a});
  wire signed [35:0] sval_b = b[7] ? -$signed({1'b0, mag_b}) : $signed({1'b0, mag_b});
  wire signed [35:0] sum = sval_a + sval_b;
  wire sign = sum[35];
  wire [34:0] abs_sum = sign ? -sum[34:0] : sum[34:0];
  wire neg_zero = (mag_a == 35'd0) && (mag_b == 35'd0) && a[7] && b[7];
  assign out = nan ? 8'h7f : quant_norm(abs_sum, sign, neg_zero);
endmodule
""".replace("@MODULE@", module).replace("@COMMON@", render_common_sig_eff())


def render_mul_nested_exp(module):
    outer = []
    for exp_sum in range(2, 63):
        entries = []
        for product in range(1, 50):
            mag = FP8.mul_mag_from_product(product, exp_sum)
            if mag:
                entries.append("          6'd{0}: product_mag = 7'h{1:02x};".format(product, mag))
        if entries:
            outer.append(
                "        6'd{0}: begin\n"
                "          case (product)\n{1}\n"
                "            default: product_mag = 7'h00;\n"
                "          endcase\n"
                "        end".format(exp_sum, "\n".join(entries))
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
    input [5:0] product;
    begin
      product_mag = 7'h00;
      case (exp_sum)
@OUTER@
        default: product_mag = 7'h00;
      endcase
    end
  endfunction

  wire [5:0] product = sig3(am) * sig3(bm);
  wire [5:0] exp_sum = eff_exp(am) + eff_exp(bm);
  assign out = nan ? 8'h7f : {sign, product_mag(exp_sum, product)};
endmodule
""".replace("@MODULE@", module).replace("@COMMON@", render_common_sig_eff()).replace("@OUTER@", "\n".join(outer))


def render_mul_formula_norm(module):
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
  function [3:0] round_to_int;
    input [5:0] value;
    input [5:0] rshift;
    reg [35:0] vext;
    reg [35:0] base;
    reg [35:0] rem;
    reg [35:0] half;
    reg round_up;
    begin
      vext = {30'd0, value};
      if (rshift == 6'd0) begin
        round_to_int = value[3:0];
      end else begin
        base = vext >> rshift;
        rem = vext - (base << rshift);
        half = 36'd1 << (rshift - 6'd1);
        round_up = (rem > half) || ((rem == half) && base[0]);
        round_to_int = base[3:0] + {3'd0, round_up};
      end
    end
  endfunction

  function [6:0] product_norm;
    input [5:0] product;
    input [5:0] exp_sum;
    reg [2:0] lead;
    reg signed [7:0] exp_calc;
    reg [5:0] sub_shift;
    reg [3:0] small_code;
    reg [2:0] shift;
    reg [3:0] base;
    reg [5:0] rem;
    reg [5:0] half;
    reg round_up;
    reg [3:0] sig;
    reg [5:0] exp;
    begin
      if (product == 6'd0) begin
        product_norm = 7'h00;
      end else begin
        if (product[5]) lead = 3'd5;
        else if (product[4]) lead = 3'd4;
        else if (product[3]) lead = 3'd3;
        else if (product[2]) lead = 3'd2;
        else if (product[1]) lead = 3'd1;
        else lead = 3'd0;
        exp_calc = $signed({2'd0, exp_sum}) + $signed({5'd0, lead}) - 8'sd19;
        if (exp_calc <= 0) begin
          sub_shift = 6'd18 - exp_sum;
          small_code = round_to_int(product, sub_shift);
          product_norm = (small_code >= 4'd8) ? 7'h08 : {3'd0, small_code};
        end else begin
          if (lead >= 3'd2) begin
            shift = lead - 3'd2;
            base = product >> shift;
            if (shift == 3'd0) begin
              round_up = 1'b0;
            end else begin
              rem = product - (base << shift);
              half = 6'd1 << (shift - 3'd1);
              round_up = (rem > half) || ((rem == half) && base[0]);
            end
          end else begin
            shift = 3'd2 - lead;
            base = product << shift;
            round_up = 1'b0;
          end
          sig = base + {3'd0, round_up};
          exp = exp_calc[5:0];
          if (sig >= 4'd8) begin
            exp = exp + 6'd1;
            sig = 4'd4;
          end
          if ((exp > 6'd31) || ((exp == 6'd31) && (sig >= 4'd7))) begin
            product_norm = 7'h7e;
          end else begin
            product_norm = {exp[4:0], sig[1:0]};
          end
        end
      end
    end
  endfunction

  wire [5:0] product = sig3(am) * sig3(bm);
  wire [5:0] exp_sum = eff_exp(am) + eff_exp(bm);
  assign out = nan ? 8'h7f : {sign, product_norm(product, exp_sum)};
endmodule
""".replace("@MODULE@", module).replace("@COMMON@", render_common_sig_eff())


def render_add_gap4_norm(module):
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] a = in[15:8];
  wire [7:0] b = in[7:0];
  wire [6:0] am = a[6:0];
  wire [6:0] bm = b[6:0];
  wire nan = (am == 7'h7f) || (bm == 7'h7f);
  wire same_sign = (a[7] == b[7]);
  wire a_ge_b = (am >= bm);
  wire [6:0] maxc = a_ge_b ? am : bm;
  wire [6:0] minc = a_ge_b ? bm : am;
  wire max_sign = a_ge_b ? a[7] : b[7];
@COMMON@
  function [6:0] norm_local;
    input [7:0] sigval;
    input [5:0] base_eff;
    reg [2:0] lead;
    reg signed [7:0] exp_calc;
    reg [2:0] shift;
    reg [3:0] base;
    reg [7:0] rem;
    reg [7:0] half;
    reg round_up;
    reg [3:0] sig;
    reg [5:0] exp;
    reg [8:0] sub_mag;
    begin
      if (sigval == 8'd0) begin
        norm_local = 7'h00;
      end else begin
        if (sigval[7]) lead = 3'd7;
        else if (sigval[6]) lead = 3'd6;
        else if (sigval[5]) lead = 3'd5;
        else if (sigval[4]) lead = 3'd4;
        else if (sigval[3]) lead = 3'd3;
        else if (sigval[2]) lead = 3'd2;
        else if (sigval[1]) lead = 3'd1;
        else lead = 3'd0;
        exp_calc = $signed({2'd0, base_eff}) + $signed({5'd0, lead}) - 8'sd2;
        if (exp_calc <= 0) begin
          sub_mag = {1'd0, sigval} << (base_eff - 6'd1);
          norm_local = sub_mag[6:0];
        end else begin
          if (lead >= 3'd2) begin
            shift = lead - 3'd2;
            base = sigval >> shift;
            if (shift == 3'd0) begin
              round_up = 1'b0;
            end else begin
              rem = sigval - (base << shift);
              half = 8'd1 << (shift - 3'd1);
              round_up = (rem > half) || ((rem == half) && base[0]);
            end
          end else begin
            shift = 3'd2 - lead;
            base = sigval << shift;
            round_up = 1'b0;
          end
          sig = base + {3'd0, round_up};
          exp = exp_calc[5:0];
          if (sig >= 4'd8) begin
            exp = exp + 6'd1;
            sig = 4'd4;
          end
          if ((exp > 6'd31) || ((exp == 6'd31) && (sig >= 4'd7))) begin
            norm_local = 7'h7e;
          end else begin
            norm_local = {exp[4:0], sig[1:0]};
          end
        end
      end
    end
  endfunction

  wire [2:0] max_sig = sig3(maxc);
  wire [2:0] min_sig = sig3(minc);
  wire [5:0] max_eff = eff_exp(maxc);
  wire [5:0] min_eff = eff_exp(minc);
  wire [5:0] gap = max_eff - min_eff;
  wire [7:0] shifted_max = {5'd0, max_sig} << gap[2:0];
  wire [7:0] same_sigval = shifted_max + {5'd0, min_sig};
  wire [7:0] diff_sigval = shifted_max - {5'd0, min_sig};
  wire [6:0] same_mag = (gap <= 6'd3) ? norm_local(same_sigval, min_eff) : maxc;
  wire [6:0] diff_mag = (gap <= 6'd4) ? norm_local(diff_sigval, min_eff) : maxc;
  wire [6:0] out_mag = same_sign ? same_mag : diff_mag;
  wire diff_sign = (maxc == minc) ? 1'b0 : max_sign;
  wire out_sign = same_sign ? a[7] : diff_sign;
  assign out = nan ? 8'h7f : {out_sign, out_mag};
endmodule
""".replace("@MODULE@", module).replace("@COMMON@", render_common_sig_eff())


def norm_sigval_mag(sigval, eff):
    if sigval <= 0:
        return 0
    return FP8.quant_mag_rational(sigval << (eff - 1))


def add_class_lines(sigval, indent):
    if sigval == 0:
        return [indent + "class_mag = 7'h00;"]
    vals = {eff: norm_sigval_mag(sigval, eff) for eff in range(1, 32)}
    sat_lo = min([eff for eff, mag in vals.items() if mag == 0x7E] or [32])
    normal = [(eff, mag) for eff, mag in vals.items() if eff < sat_lo and mag >= 4]
    counts = {}
    for eff, mag in normal:
        cls = ((mag >> 2) - eff, mag & 0x3)
        counts[cls] = counts.get(cls, 0) + 1
    offset, mant = sorted(counts.items(), key=lambda item: (-item[1], item[0]))[0][0]
    specials = []
    for eff, mag in vals.items():
        if eff >= sat_lo:
            continue
        if mag < 4 or ((mag >> 2) - eff, mag & 0x3) != (offset, mant):
            specials.append((eff, mag))
    lines = []
    for eff, mag in specials:
        prefix = "if" if not lines else "else if"
        lines.append(indent + "{0} (base_eff == 6'd{1}) class_mag = 7'h{2:02x};".format(prefix, eff, mag))
    prefix = "if" if not lines else "else if"
    lines.append(indent + "{0} (base_eff >= 6'd{1}) class_mag = 7'h7e;".format(prefix, sat_lo))
    if offset < 0:
        code_expr = "(((base_eff - 6'd{0}) << 2) | 7'd{1})".format(-offset, mant)
    else:
        code_expr = "(((base_eff + 6'd{0}) << 2) | 7'd{1})".format(offset, mant)
    lines.append(indent + "else class_mag = {0};".format(code_expr))
    return lines


def render_add_gap_class(module):
    same_blocks = []
    for gap in range(4):
        for smax in range(8):
            for smin in range(8):
                key = (gap << 6) | (smax << 3) | smin
                sigval = (smax << gap) + smin
                lines = ["        8'h{0:02x}: begin".format(key)]
                lines.extend(add_class_lines(sigval, "          "))
                lines.append("        end")
                same_blocks.append("\n".join(lines))
    diff_blocks = []
    for gap in range(5):
        for smax in range(8):
            for smin in range(8):
                key = (gap << 6) | (smax << 3) | smin
                sigval = (smax << gap) - smin
                if sigval < 0:
                    sigval = 0
                lines = ["        9'h{0:03x}: begin".format(key)]
                lines.extend(add_class_lines(sigval, "          "))
                lines.append("        end")
                diff_blocks.append("\n".join(lines))
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] a = in[15:8];
  wire [7:0] b = in[7:0];
  wire [6:0] am = a[6:0];
  wire [6:0] bm = b[6:0];
  wire nan = (am == 7'h7f) || (bm == 7'h7f);
  wire same_sign = (a[7] == b[7]);
  wire a_ge_b = (am >= bm);
  wire [6:0] maxc = a_ge_b ? am : bm;
  wire [6:0] minc = a_ge_b ? bm : am;
  wire max_sign = a_ge_b ? a[7] : b[7];
@COMMON@
  function [6:0] same_class_mag;
    input [7:0] key;
    input [5:0] base_eff;
    begin
      case (key)
@SAME@
        default: same_class_mag = 7'h00;
      endcase
    end
  endfunction

  function [6:0] diff_class_mag;
    input [8:0] key;
    input [5:0] base_eff;
    begin
      case (key)
@DIFF@
        default: diff_class_mag = 7'h00;
      endcase
    end
  endfunction

  wire [2:0] max_sig = sig3(maxc);
  wire [2:0] min_sig = sig3(minc);
  wire [5:0] max_eff = eff_exp(maxc);
  wire [5:0] min_eff = eff_exp(minc);
  wire [5:0] gap = max_eff - min_eff;
  wire [6:0] same_mag = (gap <= 6'd3) ? same_class_mag({gap[1:0], max_sig, min_sig}, min_eff) : maxc;
  wire [6:0] diff_mag = (gap <= 6'd4) ? diff_class_mag({gap[2:0], max_sig, min_sig}, min_eff) : maxc;
  wire [6:0] out_mag = same_sign ? same_mag : diff_mag;
  wire diff_sign = (maxc == minc) ? 1'b0 : max_sign;
  wire out_sign = same_sign ? a[7] : diff_sign;
  assign out = nan ? 8'h7f : {out_sign, out_mag};
endmodule
""".replace("@MODULE@", module).replace("@COMMON@", render_common_sig_eff()).replace("@SAME@", "\n".join(same_blocks).replace("class_mag", "same_class_mag")).replace("@DIFF@", "\n".join(diff_blocks).replace("class_mag", "diff_class_mag"))


def render_mul_product_class(module):
    blocks = []
    for product in range(1, 50):
        vals = {exp_sum: FP8.mul_mag_from_product(product, exp_sum) for exp_sum in range(2, 63)}
        zero_hi = max([exp_sum for exp_sum, mag in vals.items() if mag == 0] or [1])
        sat_lo = min([exp_sum for exp_sum, mag in vals.items() if mag == 0x7E] or [63])
        normal = [(exp_sum, mag) for exp_sum, mag in vals.items() if zero_hi < exp_sum < sat_lo and mag >= 4]
        counts = {}
        for exp_sum, mag in normal:
            key = ((mag >> 2) - exp_sum, mag & 0x3)
            counts[key] = counts.get(key, 0) + 1
        offset, mant = sorted(counts.items(), key=lambda item: (-item[1], item[0]))[0][0]
        specials = []
        for exp_sum, mag in vals.items():
            if not (zero_hi < exp_sum < sat_lo):
                continue
            if mag < 4 or ((mag >> 2) - exp_sum, mag & 0x3) != (offset, mant):
                specials.append((exp_sum, mag))
        lines = ["        6'd{0}: begin".format(product)]
        lines.append("          if (exp_sum <= 6'd{0}) product_mag = 7'h00;".format(zero_hi))
        for exp_sum, mag in specials:
            lines.append("          else if (exp_sum == 6'd{0}) product_mag = 7'h{1:02x};".format(exp_sum, mag))
        lines.append("          else if (exp_sum >= 6'd{0}) product_mag = 7'h7e;".format(sat_lo))
        if offset < 0:
            code_expr = "(((exp_sum - 6'd{0}) << 2) | 7'd{1})".format(-offset, mant)
        else:
            code_expr = "(((exp_sum + 6'd{0}) << 2) | 7'd{1})".format(offset, mant)
        lines.append("          else product_mag = {0};".format(code_expr))
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
""".replace("@MODULE@", module).replace("@COMMON@", render_common_sig_eff()).replace("@BLOCKS@", "\n".join(blocks))


def product_class_lines(product, indent):
    vals = {exp_sum: FP8.mul_mag_from_product(product, exp_sum) for exp_sum in range(2, 63)}
    zero_hi = max([exp_sum for exp_sum, mag in vals.items() if mag == 0] or [1])
    sat_lo = min([exp_sum for exp_sum, mag in vals.items() if mag == 0x7E] or [63])
    normal = [(exp_sum, mag) for exp_sum, mag in vals.items() if zero_hi < exp_sum < sat_lo and mag >= 4]
    counts = {}
    for exp_sum, mag in normal:
        key = ((mag >> 2) - exp_sum, mag & 0x3)
        counts[key] = counts.get(key, 0) + 1
    offset, mant = sorted(counts.items(), key=lambda item: (-item[1], item[0]))[0][0]
    specials = []
    for exp_sum, mag in vals.items():
        if not (zero_hi < exp_sum < sat_lo):
            continue
        if mag < 4 or ((mag >> 2) - exp_sum, mag & 0x3) != (offset, mant):
            specials.append((exp_sum, mag))
    lines = [indent + "if (exp_sum <= 6'd{0}) product_mag = 7'h00;".format(zero_hi)]
    for exp_sum, mag in specials:
        lines.append(indent + "else if (exp_sum == 6'd{0}) product_mag = 7'h{1:02x};".format(exp_sum, mag))
    lines.append(indent + "else if (exp_sum >= 6'd{0}) product_mag = 7'h7e;".format(sat_lo))
    if offset < 0:
        code_expr = "(((exp_sum - 6'd{0}) << 2) | 7'd{1})".format(-offset, mant)
    else:
        code_expr = "(((exp_sum + 6'd{0}) << 2) | 7'd{1})".format(offset, mant)
    lines.append(indent + "else product_mag = {0};".format(code_expr))
    return lines


def render_mul_sigpair_class(module):
    blocks = []
    for sig_a in range(8):
        for sig_b in range(8):
            product = sig_a * sig_b
            key = (sig_a << 3) | sig_b
            lines = ["        6'h{0:02x}: begin".format(key)]
            if product == 0:
                lines.append("          product_mag = 7'h00;")
            else:
                lines.extend(product_class_lines(product, "          "))
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
    input [5:0] sig_key;
    begin
      case (sig_key)
@BLOCKS@
        default: product_mag = 7'h00;
      endcase
    end
  endfunction

  wire [2:0] sig_a = sig3(am);
  wire [2:0] sig_b = sig3(bm);
  wire [5:0] exp_sum = eff_exp(am) + eff_exp(bm);
  assign out = nan ? 8'h7f : {sign, product_mag(exp_sum, {sig_a, sig_b})};
endmodule
""".replace("@MODULE@", module).replace("@COMMON@", render_common_sig_eff()).replace("@BLOCKS@", "\n".join(blocks))


def render_div_nested_delta(module):
    outer = []
    for delta in range(-30, 31):
        entries = []
        for sig_n in range(0, 8):
            for sig_d in range(1, 8):
                mag = FP8.div_mag_from_sig_delta(sig_n, sig_d, delta)
                if mag:
                    entries.append("          6'h{0:02x}: mag_table = 7'h{1:02x};".format((sig_n << 3) | sig_d, mag))
        if entries:
            outer.append(
                "        6'd{0}: begin\n"
                "          case (sig_key)\n{1}\n"
                "            default: mag_table = 7'h00;\n"
                "          endcase\n"
                "        end".format(delta + 31, "\n".join(entries))
            )
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
    input [5:0] delta_key;
    input [5:0] sig_key;
    begin
      mag_table = 7'h00;
      case (delta_key)
@OUTER@
        default: mag_table = 7'h00;
      endcase
    end
  endfunction

  wire [2:0] sig_n = sig3(num[6:0]);
  wire [2:0] sig_d = sig3(den[6:0]);
  wire signed [6:0] delta = $signed({1'b0, eff_exp(num[6:0])}) - $signed({1'b0, eff_exp(den[6:0])});
  wire [5:0] delta_key = delta + 7'sd31;
  wire [6:0] table_mag = mag_table(delta_key, {sig_n, sig_d});
  wire invalid = den_nan || num_nan || (den_zero && num_zero);
  wire [6:0] out_mag = den_zero ? 7'h7e : table_mag;
  assign out = invalid ? 8'h7f : {sign, out_mag};
endmodule
""".replace("@MODULE@", module).replace("@COMMON@", render_common_sig_eff()).replace("@OUTER@", "\n".join(outer))


def render_div_sigpair_class(module):
    def sconst(value):
        return "-7'sd{0}".format(-value) if value < 0 else "7'sd{0}".format(value)

    blocks = []
    for sig_n in range(8):
        for sig_d in range(8):
            key = (sig_n << 3) | sig_d
            lines = ["        6'h{0:02x}: begin".format(key)]
            if sig_d == 0:
                lines.append("          mag_table = 7'h00;")
            elif sig_n == 0:
                lines.append("          mag_table = 7'h00;")
            else:
                vals = {delta: FP8.div_mag_from_sig_delta(sig_n, sig_d, delta) for delta in range(-30, 31)}
                zero_hi = max([delta for delta, mag in vals.items() if mag == 0] or [-31])
                sat_lo = min([delta for delta, mag in vals.items() if mag == 0x7E] or [31])
                normal = [(delta, mag) for delta, mag in vals.items() if zero_hi < delta < sat_lo and mag >= 4]
                counts = {}
                for delta, mag in normal:
                    cls = ((mag >> 2) - delta, mag & 0x3)
                    counts[cls] = counts.get(cls, 0) + 1
                offset, mant = sorted(counts.items(), key=lambda item: (-item[1], item[0]))[0][0]
                specials = []
                for delta, mag in vals.items():
                    if not (zero_hi < delta < sat_lo):
                        continue
                    if mag < 4 or ((mag >> 2) - delta, mag & 0x3) != (offset, mant):
                        specials.append((delta, mag))
                lines.append("          if (delta <= {0}) mag_table = 7'h00;".format(sconst(zero_hi)))
                for delta, mag in specials:
                    lines.append("          else if (delta == {0}) mag_table = 7'h{1:02x};".format(sconst(delta), mag))
                lines.append("          else if (delta >= {0}) mag_table = 7'h7e;".format(sconst(sat_lo)))
                if offset < 0:
                    code_expr = "(((delta - 7'sd{0}) << 2) | 7'd{1})".format(-offset, mant)
                else:
                    code_expr = "(((delta + 7'sd{0}) << 2) | 7'd{1})".format(offset, mant)
                lines.append("          else mag_table = {0};".format(code_expr))
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
  wire invalid = den_nan || num_nan || (den_zero && num_zero);
  wire [6:0] out_mag = den_zero ? 7'h7e : mag_table(delta, {sig_n, sig_d});
  assign out = invalid ? 8'h7f : {sign, out_mag};
endmodule
""".replace("@MODULE@", module).replace("@COMMON@", render_common_sig_eff()).replace("@BLOCKS@", "\n".join(blocks))


def render_fmod_modsig_nested_delta(module):
    outer = []
    for delta in range(0, 31):
        entries = []
        for sig_n in range(0, 8):
            for sig_d in range(1, 8):
                rem = (sig_n << delta) % sig_d
                if rem:
                    entries.append("          6'h{0:02x}: rem_table = 3'd{1};".format((sig_n << 3) | sig_d, rem))
        if entries:
            outer.append(
                "        5'd{0}: begin\n"
                "          case (sig_key)\n{1}\n"
                "            default: rem_table = 3'd0;\n"
                "          endcase\n"
                "        end".format(delta, "\n".join(entries))
            )
    norm_entries = []
    for den_eff in range(1, 32):
        for rem_sig in range(1, 8):
            mag = FP8.quant_mag_rational(rem_sig << (den_eff - 1))
            if mag:
                norm_entries.append("        8'h{0:02x}: norm_table = 7'h{1:02x};".format((den_eff << 3) | rem_sig, mag))
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [6:0] den = in[14:8];
  wire [6:0] num = in[6:0];
  wire num_sign = in[7];
  wire nan = (den == 7'h7f) || (num == 7'h7f);
  wire den_zero = (den == 7'h00);
@COMMON@
  function [2:0] rem_table;
    input [4:0] delta_key;
    input [5:0] sig_key;
    begin
      rem_table = 3'd0;
      case (delta_key)
@OUTER@
        default: rem_table = 3'd0;
      endcase
    end
  endfunction

  function [6:0] norm_table;
    input [7:0] key;
    begin
      case (key)
@NORM@
        default: norm_table = 7'h00;
      endcase
    end
  endfunction

  wire [2:0] sig_n = sig3(num);
  wire [2:0] sig_d = sig3(den);
  wire [5:0] eff_n = eff_exp(num);
  wire [5:0] eff_d = eff_exp(den);
  wire signed [6:0] delta = $signed({1'b0, eff_n}) - $signed({1'b0, eff_d});
  wire [2:0] rem_sig = rem_table(delta[4:0], {sig_n, sig_d});
  wire [6:0] table_mag = norm_table({eff_d[4:0], rem_sig});
  wire [6:0] out_mag = (delta < 0) ? num : table_mag;
  assign out = (nan || den_zero) ? 8'h7f : {num_sign, out_mag};
endmodule
""".replace("@MODULE@", module).replace("@COMMON@", render_common_sig_eff()).replace("@OUTER@", "\n".join(outer)).replace("@NORM@", "\n".join(norm_entries))


def render_fmod_arith_mod(module):
    norm_entries = []
    for den_eff in range(1, 32):
        for rem_sig in range(1, 8):
            mag = FP8.quant_mag_rational(rem_sig << (den_eff - 1))
            if mag:
                norm_entries.append("        8'h{0:02x}: norm_table = 7'h{1:02x};".format((den_eff << 3) | rem_sig, mag))
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [6:0] den = in[14:8];
  wire [6:0] num = in[6:0];
  wire num_sign = in[7];
  wire nan = (den == 7'h7f) || (num == 7'h7f);
  wire den_zero = (den == 7'h00);
@COMMON@
  function [6:0] norm_table;
    input [7:0] key;
    begin
      case (key)
@NORM@
        default: norm_table = 7'h00;
      endcase
    end
  endfunction

  wire [2:0] sig_n = sig3(num);
  wire [2:0] sig_d = sig3(den);
  wire [5:0] eff_n = eff_exp(num);
  wire [5:0] eff_d = eff_exp(den);
  wire signed [6:0] delta = $signed({1'b0, eff_n}) - $signed({1'b0, eff_d});
  wire [36:0] shifted = {34'd0, sig_n} << delta[4:0];
  wire [2:0] rem_sig = (sig_d == 3'd0) ? 3'd0 : (shifted % sig_d);
  wire [6:0] table_mag = norm_table({eff_d[4:0], rem_sig});
  wire [6:0] out_mag = (delta < 0) ? num : table_mag;
  assign out = (nan || den_zero) ? 8'h7f : {num_sign, out_mag};
endmodule
""".replace("@MODULE@", module).replace("@COMMON@", render_common_sig_eff()).replace("@NORM@", "\n".join(norm_entries))


def render_fmod_periodic_rem(module):
    norm_entries = []
    for den_eff in range(1, 32):
        for rem_sig in range(1, 8):
            mag = FP8.quant_mag_rational(rem_sig << (den_eff - 1))
            if mag:
                norm_entries.append("        8'h{0:02x}: norm_table = 7'h{1:02x};".format((den_eff << 3) | rem_sig, mag))

    def rem_case(name, mod_count):
        entries = []
        for mod in range(mod_count):
            for sig in range(8):
                if mod_count == 1:
                    rem = sig % int(name[5:])
                    key = sig
                else:
                    den = int(name[5:])
                    # The caller maps mod to the correct 2^delta residue class.
                    if den == 3:
                        mult = 1 if mod == 0 else 2
                    elif den == 5:
                        mult = [1, 2, 4, 3][mod]
                    elif den == 6:
                        mult = 1 if mod == 0 else (2 if mod == 1 else 4)
                    elif den == 7:
                        mult = [1, 2, 4][mod]
                    else:
                        mult = 1
                    rem = (sig * mult) % den
                    key = (mod << 3) | sig
                if rem:
                    width = 3 if mod_count == 1 else (2 + 3 if mod_count <= 4 else 5)
                    entries.append("        {0}'h{1:02x}: {2} = 3'd{3};".format(width, key, name, rem))
        input_decl = "input [2:0] key;" if mod_count == 1 else "input [4:0] key;"
        return """  function [2:0] @NAME@;
    @INPUT@
    begin
      case (key)
@ENTRIES@
        default: @NAME@ = 3'd0;
      endcase
    end
  endfunction
""".replace("@NAME@", name).replace("@INPUT@", input_decl).replace("@ENTRIES@", "\n".join(entries))

    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [6:0] den = in[14:8];
  wire [6:0] num = in[6:0];
  wire num_sign = in[7];
  wire nan = (den == 7'h7f) || (num == 7'h7f);
  wire den_zero = (den == 7'h00);
@COMMON@
@REM3@
@REM5@
@REM6@
@REM7@
  function [1:0] delta_mod3;
    input [4:0] d;
    begin
      case (d)
        5'd0, 5'd3, 5'd6, 5'd9, 5'd12, 5'd15, 5'd18, 5'd21, 5'd24, 5'd27, 5'd30: delta_mod3 = 2'd0;
        5'd1, 5'd4, 5'd7, 5'd10, 5'd13, 5'd16, 5'd19, 5'd22, 5'd25, 5'd28: delta_mod3 = 2'd1;
        default: delta_mod3 = 2'd2;
      endcase
    end
  endfunction

  function [6:0] norm_table;
    input [7:0] key;
    begin
      case (key)
@NORM@
        default: norm_table = 7'h00;
      endcase
    end
  endfunction

  wire [2:0] sig_n = sig3(num);
  wire [2:0] sig_d = sig3(den);
  wire [5:0] eff_n = eff_exp(num);
  wire [5:0] eff_d = eff_exp(den);
  wire signed [6:0] delta = $signed({1'b0, eff_n}) - $signed({1'b0, eff_d});
  wire [4:0] d = delta[4:0];
  wire [2:0] rem_d2 = (d == 5'd0) ? {2'd0, sig_n[0]} : 3'd0;
  wire [2:0] rem_d4 = (d == 5'd0) ? {1'd0, sig_n[1:0]} : ((d == 5'd1) ? {1'd0, sig_n[0], 1'b0} : 3'd0);
  wire [2:0] rem3 = rem_d3({d[0], sig_n});
  wire [2:0] rem5 = rem_d5({d[1:0], sig_n});
  wire [1:0] d6_mod = (d == 5'd0) ? 2'd0 : (d[0] ? 2'd1 : 2'd2);
  wire [2:0] rem6 = rem_d6({d6_mod, sig_n});
  wire [2:0] rem7 = rem_d7({delta_mod3(d), sig_n});
  reg [2:0] rem_sig;
  always @* begin
    case (sig_d)
      3'd0: rem_sig = 3'd0;
      3'd1: rem_sig = 3'd0;
      3'd2: rem_sig = rem_d2;
      3'd3: rem_sig = rem3;
      3'd4: rem_sig = rem_d4;
      3'd5: rem_sig = rem5;
      3'd6: rem_sig = rem6;
      default: rem_sig = rem7;
    endcase
  end
  wire [6:0] table_mag = norm_table({eff_d[4:0], rem_sig});
  wire [6:0] out_mag = (delta < 0) ? num : table_mag;
  assign out = (nan || den_zero) ? 8'h7f : {num_sign, out_mag};
endmodule
""".replace("@MODULE@", module).replace("@COMMON@", render_common_sig_eff()).replace("@REM3@", rem_case("rem_d3", 2)).replace("@REM5@", rem_case("rem_d5", 4)).replace("@REM6@", rem_case("rem_d6", 3)).replace("@REM7@", rem_case("rem_d7", 3)).replace("@NORM@", "\n".join(norm_entries))


def render_fmod_periodic_formula_norm(module):
    base = render_fmod_periodic_rem(module)
    start = base.index("  function [6:0] norm_table;")
    end = base.index("\n\n  wire [2:0] sig_n", start)
    formula = """  function [6:0] norm_table;
    input [7:0] key;
    reg [4:0] eff;
    reg [2:0] rem;
    reg [1:0] lead;
    reg signed [6:0] exp_calc;
    reg [2:0] sig;
    reg [5:0] sub_mag;
    begin
      eff = key[7:3];
      rem = key[2:0];
      if (rem == 3'd0) begin
        norm_table = 7'h00;
      end else begin
        if (rem[2]) lead = 2'd2;
        else if (rem[1]) lead = 2'd1;
        else lead = 2'd0;
        exp_calc = $signed({2'd0, eff}) + $signed({5'd0, lead}) - 7'sd2;
        if (exp_calc <= 0) begin
          sub_mag = {3'd0, rem} << (eff - 5'd1);
          norm_table = sub_mag[6:0];
        end else begin
          sig = rem << (2'd2 - lead);
          norm_table = {exp_calc[4:0], sig[1:0]};
        end
      end
    end
  endfunction"""
    return base[:start] + formula + base[end:]


def render_hypot_delta_table(module):
    entries = []
    for maxc in range(128):
        for minc in range(maxc + 1):
            if FP8.nan[maxc] or FP8.nan[minc]:
                continue
            out = FP8.hypot_mag(maxc, minc)
            if out == 0x7F:
                continue
            delta = out - maxc
            if delta:
                entries.append((maxc << 7 | minc, delta))
    entry_text = "\n".join("        14'h{0:04x}: correction_delta = 4'd{1};".format(k, d) for k, d in entries)
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [6:0] a = in[14:8];
  wire [6:0] b = in[6:0];
  wire nan = (a == 7'h7f) || (b == 7'h7f);
  wire a_ge_b = (a >= b);
  wire [6:0] maxc = a_ge_b ? a : b;
  wire [6:0] minc = a_ge_b ? b : a;

  function [3:0] correction_delta;
    input [13:0] key;
    begin
      case (key)
@ENTRIES@
        default: correction_delta = 4'd0;
      endcase
    end
  endfunction

  wire [7:0] raw = {1'b0, maxc} + {4'd0, correction_delta({maxc, minc})};
  wire [6:0] mag = (raw >= 8'h7f) ? 7'h7e : raw[6:0];
  assign out = nan ? 8'h7f : {1'b0, mag};
endmodule
""".replace("@MODULE@", module).replace("@ENTRIES@", entry_text)


def render_hypot_delta_bdd(module, order):
    outputs = []
    for key in range(1 << 14):
        maxc = (key >> 7) & 0x7F
        minc = key & 0x7F
        if minc > maxc or FP8.nan[maxc] or FP8.nan[minc]:
            delta = 0
        else:
            out = FP8.hypot_mag(maxc, minc)
            delta = 0 if out == 0x7F else max(0, min(15, out - maxc))
        outputs.append(delta)
    builder, roots = build_bdd(outputs, 14, 4, order)
    lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [7:0] out;",
        "  wire [6:0] a = in[14:8];",
        "  wire [6:0] b = in[6:0];",
        "  wire nan = (a == 7'h7f) || (b == 7'h7f);",
        "  wire a_ge_b = (a >= b);",
        "  wire [6:0] maxc = a_ge_b ? a : b;",
        "  wire [6:0] minc = a_ge_b ? b : a;",
        "  wire [13:0] key = {maxc, minc};",
    ]
    for node in builder.nodes:
        lines.append("  wire n_{0} = key[{1}] ? {2} : {3};".format(node["id"], node["var"], edge_expr(node["high"]), edge_expr(node["low"])))
    for bit, root in enumerate(roots):
        lines.append("  wire d_{0} = {1};".format(bit, edge_expr(root)))
    lines.extend(
        [
            "  wire [3:0] d = {d_3, d_2, d_1, d_0};",
            "  wire [7:0] raw = {1'b0, maxc} + {4'd0, d};",
            "  wire [6:0] mag = (raw >= 8'h7f) ? 7'h7e : raw[6:0];",
            "  assign out = nan ? 8'h7f : {1'b0, mag};",
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


def render_add_mag_bdd(module, order):
    outputs = []
    for key in range(1 << 15):
        same_sign = (key >> 14) & 1
        maxc = (key >> 7) & 0x7F
        minc = key & 0x7F
        if minc > maxc or FP8.nan[maxc] or FP8.nan[minc]:
            mag = 0
        elif same_sign:
            mag = FP8.quant_mag_rational(FP8.k[maxc] + FP8.k[minc])
        else:
            mag = FP8.quant_mag_rational(FP8.k[maxc] - FP8.k[minc])
        outputs.append(mag)
    builder, roots = build_bdd(outputs, 15, 7, order)
    lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [7:0] out;",
        "  wire [7:0] a = in[15:8];",
        "  wire [7:0] b = in[7:0];",
        "  wire [6:0] am = a[6:0];",
        "  wire [6:0] bm = b[6:0];",
        "  wire nan = (am == 7'h7f) || (bm == 7'h7f);",
        "  wire same_sign = (a[7] == b[7]);",
        "  wire a_ge_b = (am >= bm);",
        "  wire [6:0] maxc = a_ge_b ? am : bm;",
        "  wire [6:0] minc = a_ge_b ? bm : am;",
        "  wire [14:0] key = {same_sign, maxc, minc};",
    ]
    for node in builder.nodes:
        lines.append("  wire n_{0} = key[{1}] ? {2} : {3};".format(node["id"], node["var"], edge_expr(node["high"]), edge_expr(node["low"])))
    for bit, root in enumerate(roots):
        lines.append("  wire mag_{0} = {1};".format(bit, edge_expr(root)))
    lines.extend(
        [
            "  wire [6:0] out_mag = {mag_6, mag_5, mag_4, mag_3, mag_2, mag_1, mag_0};",
            "  wire diff_sign = (maxc == minc) ? 1'b0 : (a_ge_b ? a[7] : b[7]);",
            "  wire out_sign = same_sign ? a[7] : diff_sign;",
            "  assign out = nan ? 8'h7f : {out_sign, out_mag};",
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


def render_add_split_bdd(module, order):
    rendered = []
    for mode in ["same", "diff"]:
        outputs = []
        for key in range(1 << 14):
            maxc = (key >> 7) & 0x7F
            minc = key & 0x7F
            if minc > maxc or FP8.nan[maxc] or FP8.nan[minc]:
                mag = 0
            elif mode == "same":
                mag = FP8.quant_mag_rational(FP8.k[maxc] + FP8.k[minc])
            else:
                mag = FP8.quant_mag_rational(FP8.k[maxc] - FP8.k[minc])
            outputs.append(mag)
        builder, roots = build_bdd(outputs, 14, 7, order)
        rendered.append((mode, builder, roots))
    lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [7:0] out;",
        "  wire [7:0] a = in[15:8];",
        "  wire [7:0] b = in[7:0];",
        "  wire [6:0] am = a[6:0];",
        "  wire [6:0] bm = b[6:0];",
        "  wire nan = (am == 7'h7f) || (bm == 7'h7f);",
        "  wire same_sign = (a[7] == b[7]);",
        "  wire a_ge_b = (am >= bm);",
        "  wire [6:0] maxc = a_ge_b ? am : bm;",
        "  wire [6:0] minc = a_ge_b ? bm : am;",
        "  wire [13:0] key = {maxc, minc};",
    ]
    for mode, builder, roots in rendered:
        for node in builder.nodes:
            lines.append("  wire {0}_n_{1} = key[{2}] ? {3} : {4};".format(mode, node["id"], node["var"], edge_expr(node["high"]).replace("n_", mode + "_n_"), edge_expr(node["low"]).replace("n_", mode + "_n_")))
        for bit, root in enumerate(roots):
            lines.append("  wire {0}_mag_{1} = {2};".format(mode, bit, edge_expr(root).replace("n_", mode + "_n_")))
        lines.append("  wire [6:0] {0}_mag = {{{0}_mag_6, {0}_mag_5, {0}_mag_4, {0}_mag_3, {0}_mag_2, {0}_mag_1, {0}_mag_0}};".format(mode))
    lines.extend(
        [
            "  wire [6:0] out_mag = same_sign ? same_mag : diff_mag;",
            "  wire diff_sign = (maxc == minc) ? 1'b0 : (a_ge_b ? a[7] : b[7]);",
            "  wire out_sign = same_sign ? a[7] : diff_sign;",
            "  assign out = nan ? 8'h7f : {out_sign, out_mag};",
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


def render_mul_key_bdd(module, order):
    outputs = []
    for key in range(1 << 12):
        exp_sum = (key >> 6) & 0x3F
        product = key & 0x3F
        outputs.append(FP8.mul_mag_from_product(product, exp_sum) if product < 50 else 0)
    builder, roots = build_bdd(outputs, 12, 7, order)
    lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [7:0] out;",
        "  wire [7:0] a = in[15:8];",
        "  wire [7:0] b = in[7:0];",
        "  wire [6:0] am = a[6:0];",
        "  wire [6:0] bm = b[6:0];",
        "  wire nan = (am == 7'h7f) || (bm == 7'h7f);",
        "  wire sign = a[7] ^ b[7];",
        render_common_sig_eff(),
        "  wire [5:0] product = sig3(am) * sig3(bm);",
        "  wire [5:0] exp_sum = eff_exp(am) + eff_exp(bm);",
        "  wire [11:0] key = {exp_sum, product};",
    ]
    for node in builder.nodes:
        lines.append("  wire n_{0} = key[{1}] ? {2} : {3};".format(node["id"], node["var"], edge_expr(node["high"]), edge_expr(node["low"])))
    for bit, root in enumerate(roots):
        lines.append("  wire mag_{0} = {1};".format(bit, edge_expr(root)))
    lines.extend(
        [
            "  wire [6:0] mag = {mag_6, mag_5, mag_4, mag_3, mag_2, mag_1, mag_0};",
            "  assign out = nan ? 8'h7f : {sign, mag};",
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


def render_div_key_bdd(module, order):
    outputs = []
    for key in range(1 << 12):
        delta_key = (key >> 6) & 0x3F
        sig_n = (key >> 3) & 0x7
        sig_d = key & 0x7
        delta = delta_key - 31
        outputs.append(FP8.div_mag_from_sig_delta(sig_n, sig_d, delta) if sig_d else 0)
    builder, roots = build_bdd(outputs, 12, 7, order)
    lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [7:0] out;",
        "  wire [7:0] den = in[15:8];",
        "  wire [7:0] num = in[7:0];",
        "  wire den_nan = (den[6:0] == 7'h7f);",
        "  wire num_nan = (num[6:0] == 7'h7f);",
        "  wire sign = den[7] ^ num[7];",
        "  wire den_zero = (den[6:0] == 7'h00);",
        "  wire num_zero = (num[6:0] == 7'h00);",
        render_common_sig_eff(),
        "  wire [2:0] sig_n = sig3(num[6:0]);",
        "  wire [2:0] sig_d = sig3(den[6:0]);",
        "  wire signed [6:0] delta = $signed({1'b0, eff_exp(num[6:0])}) - $signed({1'b0, eff_exp(den[6:0])});",
        "  wire [5:0] delta_key = delta + 7'sd31;",
        "  wire [11:0] key = {delta_key, sig_n, sig_d};",
    ]
    for node in builder.nodes:
        lines.append("  wire n_{0} = key[{1}] ? {2} : {3};".format(node["id"], node["var"], edge_expr(node["high"]), edge_expr(node["low"])))
    for bit, root in enumerate(roots):
        lines.append("  wire mag_{0} = {1};".format(bit, edge_expr(root)))
    lines.extend(
        [
            "  wire [6:0] table_mag = {mag_6, mag_5, mag_4, mag_3, mag_2, mag_1, mag_0};",
            "  wire invalid = den_nan || num_nan || (den_zero && num_zero);",
            "  wire [6:0] out_mag = den_zero ? 7'h7e : table_mag;",
            "  assign out = invalid ? 8'h7f : {sign, out_mag};",
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


def render_hypot_threshold_formula(module):
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [6:0] a = in[14:8];
  wire [6:0] b = in[6:0];
  wire nan = (a == 7'h7f) || (b == 7'h7f);
  wire a_ge_b = (a >= b);
  wire [6:0] maxc = a_ge_b ? a : b;
  wire [6:0] minc = a_ge_b ? b : a;
@COMMON@
  wire [2:0] smax = sig3(maxc);
  wire [2:0] smin = sig3(minc);
  wire [5:0] emax = eff_exp(maxc);
  wire [5:0] emin = eff_exp(minc);
  wire [5:0] gap = emax - emin;
  wire gap0 = (gap == 6'd0);
  wire gap1 = (gap == 6'd1);
  wire d2_g0 =
    ((smax == 3'd4) && (smin >= 3'd4)) ||
    ((smax == 3'd5) && (smin >= 3'd5)) ||
    ((smax == 3'd6) && (smin >= 3'd5)) ||
    ((smax == 3'd7) && (smin >= 3'd6));
  wire d1_g0 =
    ((smax == 3'd2) && (smin >= 3'd2)) ||
    ((smax == 3'd3) && (smin >= 3'd2)) ||
    ((smax == 3'd4) && (smin >= 3'd3)) ||
    ((smax == 3'd5) && (smin >= 3'd3)) ||
    ((smax == 3'd6) && (smin >= 3'd3)) ||
    ((smax == 3'd7) && (smin >= 3'd3));
  wire d1_g1 =
    (((smax == 3'd4) || (smax == 3'd5)) && (smin >= 3'd5)) ||
    (((smax == 3'd6) || (smax == 3'd7)) && (smin >= 3'd6));
  wire [1:0] delta = gap0 ? (d2_g0 ? 2'd2 : (d1_g0 ? 2'd1 : 2'd0)) : (gap1 && d1_g1 ? 2'd1 : 2'd0);
  wire [7:0] raw = {1'b0, maxc} + {6'd0, delta};
  wire [6:0] mag = (raw >= 8'h7f) ? 7'h7e : raw[6:0];
  assign out = nan ? 8'h7f : {1'b0, mag};
endmodule
""".replace("@MODULE@", module).replace("@COMMON@", render_common_sig_eff())


def render_hypot_threshold_case(module):
    entries = []
    for gap_tag in range(2):
        gap = gap_tag
        for smax in range(8):
            for smin in range(8):
                if gap == 0:
                    d2 = (
                        (smax == 4 and smin >= 4)
                        or (smax == 5 and smin >= 5)
                        or (smax == 6 and smin >= 5)
                        or (smax == 7 and smin >= 6)
                    )
                    d1 = (
                        (smax == 2 and smin >= 2)
                        or (smax == 3 and smin >= 2)
                        or (smax == 4 and smin >= 3)
                        or (smax == 5 and smin >= 3)
                        or (smax == 6 and smin >= 3)
                        or (smax == 7 and smin >= 3)
                    )
                    delta = 2 if d2 else (1 if d1 else 0)
                else:
                    delta = 1 if (((smax in (4, 5)) and smin >= 5) or ((smax in (6, 7)) and smin >= 6)) else 0
                if delta:
                    key = (gap_tag << 6) | (smax << 3) | smin
                    entries.append("        7'h{0:02x}: delta_table = 2'd{1};".format(key, delta))
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [6:0] a = in[14:8];
  wire [6:0] b = in[6:0];
  wire nan = (a == 7'h7f) || (b == 7'h7f);
  wire a_ge_b = (a >= b);
  wire [6:0] maxc = a_ge_b ? a : b;
  wire [6:0] minc = a_ge_b ? b : a;
@COMMON@
  function [1:0] delta_table;
    input [6:0] key;
    begin
      case (key)
@ENTRIES@
        default: delta_table = 2'd0;
      endcase
    end
  endfunction

  wire [2:0] smax = sig3(maxc);
  wire [2:0] smin = sig3(minc);
  wire [5:0] emax = eff_exp(maxc);
  wire [5:0] emin = eff_exp(minc);
  wire gap0 = (emax == emin);
  wire gap1 = (emax == (emin + 6'd1));
  wire [1:0] delta_raw = delta_table({gap1, smax, smin});
  wire [1:0] delta = (gap0 || gap1) ? delta_raw : 2'd0;
  wire sat = (maxc == 7'h7e) || ((maxc == 7'h7d) && delta[1]);
  wire [6:0] mag = sat ? 7'h7e : (maxc + {5'd0, delta});
  assign out = nan ? 8'h7f : {1'b0, mag};
endmodule
""".replace("@MODULE@", module).replace("@COMMON@", render_common_sig_eff()).replace("@ENTRIES@", "\n".join(entries))


def render_hypot_threshold_rawexp(module):
    entries = []
    for gap_tag in range(2):
        for smax in range(8):
            for smin in range(8):
                if gap_tag == 0:
                    d2 = (
                        (smax == 4 and smin >= 4)
                        or (smax == 5 and smin >= 5)
                        or (smax == 6 and smin >= 5)
                        or (smax == 7 and smin >= 6)
                    )
                    d1 = (
                        (smax == 2 and smin >= 2)
                        or (smax == 3 and smin >= 2)
                        or (smax == 4 and smin >= 3)
                        or (smax == 5 and smin >= 3)
                        or (smax == 6 and smin >= 3)
                        or (smax == 7 and smin >= 3)
                    )
                    delta = 2 if d2 else (1 if d1 else 0)
                else:
                    delta = 1 if (((smax in (4, 5)) and smin >= 5) or ((smax in (6, 7)) and smin >= 6)) else 0
                if delta:
                    entries.append("        7'h{0:02x}: delta_table = 2'd{1};".format((gap_tag << 6) | (smax << 3) | smin, delta))
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [6:0] a = in[14:8];
  wire [6:0] b = in[6:0];
  wire nan = (a == 7'h7f) || (b == 7'h7f);
  wire a_ge_b = (a >= b);
  wire [6:0] maxc = a_ge_b ? a : b;
  wire [6:0] minc = a_ge_b ? b : a;
  wire [4:0] max_exp = maxc[6:2];
  wire [4:0] min_exp = minc[6:2];
  wire [2:0] smax = (max_exp == 5'd0) ? {1'b0, maxc[1:0]} : {1'b1, maxc[1:0]};
  wire [2:0] smin = (min_exp == 5'd0) ? {1'b0, minc[1:0]} : {1'b1, minc[1:0]};
  wire low_pair = (max_exp <= 5'd1) && (min_exp <= 5'd1);
  wire gap0 = (max_exp == min_exp) || low_pair;
  wire gap1 = ((min_exp <= 5'd1) && (max_exp == 5'd2)) || ((min_exp >= 5'd2) && (max_exp == (min_exp + 5'd1)));
  function [1:0] delta_table;
    input [6:0] key;
    begin
      case (key)
@ENTRIES@
        default: delta_table = 2'd0;
      endcase
    end
  endfunction
  wire [1:0] delta_raw = delta_table({gap1, smax, smin});
  wire [1:0] delta = (gap0 || gap1) ? delta_raw : 2'd0;
  wire sat = (maxc == 7'h7e) || ((maxc == 7'h7d) && delta[1]);
  wire [6:0] mag = sat ? 7'h7e : (maxc + {5'd0, delta});
  assign out = nan ? 8'h7f : {1'b0, mag};
endmodule
""".replace("@MODULE@", module).replace("@ENTRIES@", "\n".join(entries))


def render_truth_bdd(case, module, order):
    table = TruthTable(ROOT / "benchmarks" / "{0}.truth".format(case))
    outputs = [table.get_output(i) for i in range(1 << 16)]
    builder, roots = build_bdd(outputs, 16, 8, order)
    lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [7:0] out;",
    ]
    for node in builder.nodes:
        lines.append("  wire n_{0} = in[{1}] ? {2} : {3};".format(node["id"], node["var"], edge_expr(node["high"]), edge_expr(node["low"])))
    for bit, root in enumerate(roots):
        lines.append("  assign out[{0}] = {1};".format(bit, edge_expr(root)))
    lines.append("endmodule")
    lines.append("")
    return "\n".join(lines)


def render(case, variant, module):
    if case == "ex245" and variant == "semantic_add_pair_delta":
        return render_add_pair_delta(module)
    if case == "ex245" and variant == "semantic_add_norm":
        return render_add_norm(module)
    if case == "ex245" and variant == "semantic_add_gap4_norm":
        return render_add_gap4_norm(module)
    if case == "ex245" and variant == "semantic_add_gap_class":
        return render_add_gap_class(module)
    if case == "ex246" and variant == "semantic_mul_nested_exp":
        return render_mul_nested_exp(module)
    if case == "ex246" and variant == "semantic_mul_formula_norm":
        return render_mul_formula_norm(module)
    if case == "ex246" and variant == "semantic_mul_product_class":
        return render_mul_product_class(module)
    if case == "ex246" and variant == "semantic_mul_sigpair_class":
        return render_mul_sigpair_class(module)
    if case == "ex247" and variant == "semantic_div_nested_delta":
        return render_div_nested_delta(module)
    if case == "ex247" and variant == "semantic_div_sigpair_class":
        return render_div_sigpair_class(module)
    if case == "ex248" and variant == "semantic_fmod_modsig_nested_delta":
        return render_fmod_modsig_nested_delta(module)
    if case == "ex248" and variant == "semantic_fmod_arith_mod":
        return render_fmod_arith_mod(module)
    if case == "ex248" and variant == "semantic_fmod_periodic_rem":
        return render_fmod_periodic_rem(module)
    if case == "ex248" and variant == "semantic_fmod_periodic_formula_norm":
        return render_fmod_periodic_formula_norm(module)
    if case == "ex249" and variant == "semantic_hypot_delta_table":
        return render_hypot_delta_table(module)
    if case == "ex249" and variant == "semantic_hypot_delta_bdd_keymajor":
        return render_hypot_delta_bdd(module, list(range(13, -1, -1)))
    if case == "ex249" and variant == "semantic_hypot_delta_bdd_interleave":
        return render_hypot_delta_bdd(module, [13, 6, 12, 5, 11, 4, 10, 3, 9, 2, 8, 1, 7, 0])
    if case == "ex245" and variant == "semantic_add_mag_bdd_interleave":
        return render_add_mag_bdd(module, [14, 13, 6, 12, 5, 11, 4, 10, 3, 9, 2, 8, 1, 7, 0])
    if case == "ex245" and variant == "semantic_add_split_bdd_interleave":
        return render_add_split_bdd(module, [13, 6, 12, 5, 11, 4, 10, 3, 9, 2, 8, 1, 7, 0])
    if case == "ex246" and variant == "semantic_mul_key_bdd_interleave":
        return render_mul_key_bdd(module, [11, 5, 10, 4, 9, 3, 8, 2, 7, 1, 6, 0])
    if case == "ex247" and variant == "semantic_div_key_bdd_interleave":
        return render_div_key_bdd(module, [11, 5, 10, 4, 9, 3, 8, 2, 7, 1, 6, 0])
    if case == "ex249" and variant == "semantic_hypot_threshold_formula":
        return render_hypot_threshold_formula(module)
    if case == "ex249" and variant == "semantic_hypot_threshold_case":
        return render_hypot_threshold_case(module)
    if case == "ex249" and variant == "semantic_hypot_threshold_rawexp":
        return render_hypot_threshold_rawexp(module)
    if variant == "truth_bdd_field":
        return render_truth_bdd(case, module, [15, 7, 14, 13, 12, 11, 10, 6, 5, 4, 3, 2, 9, 8, 1, 0])
    if variant == "truth_bdd_interleave":
        return render_truth_bdd(case, module, [15, 7, 14, 6, 13, 5, 12, 4, 11, 3, 10, 2, 9, 1, 8, 0])
    raise RuntimeError("unsupported variant {0} {1}".format(case, variant))


VARIANTS = [
    ("ex245", "semantic_add_pair_delta", "E5M2FN add: sorted magnitude same/diff correction tables"),
    ("ex245", "semantic_add_norm", "E5M2FN add: decoded integer magnitudes plus exact RNE normalizer"),
    ("ex245", "semantic_add_gap4_norm", "E5M2FN add: small-gap local normalizer with passthrough guards"),
    ("ex245", "semantic_add_gap_class", "E5M2FN add: small-gap class formula without local priority encoder"),
    ("ex246", "semantic_mul_nested_exp", "E5M2FN multiply: exponent sum and 3-bit significand product"),
    ("ex246", "semantic_mul_formula_norm", "E5M2FN multiply: hand-written product lead/RNE normalizer"),
    ("ex246", "semantic_mul_product_class", "E5M2FN multiply: product class exponent-offset formula"),
    ("ex246", "semantic_mul_sigpair_class", "E5M2FN multiply: sig-pair class formula without multiplier"),
    ("ex247", "semantic_div_nested_delta", "E5M2FN low/high division: exponent delta and significand pair"),
    ("ex247", "semantic_div_sigpair_class", "E5M2FN division: sig-pair ratio exponent-offset formula"),
    ("ex248", "semantic_fmod_modsig_nested_delta", "E5M2FN low%high fmod: modular significand remainder"),
    ("ex248", "semantic_fmod_arith_mod", "E5M2FN fmod: small shifted significand modulo plus norm table"),
    ("ex248", "semantic_fmod_periodic_rem", "E5M2FN fmod: hand-derived periodic 2^delta remainder"),
    ("ex248", "semantic_fmod_periodic_formula_norm", "E5M2FN fmod: periodic remainder plus formula normalizer"),
    ("ex249", "semantic_hypot_delta_table", "E5M2FN hypot: max magnitude plus sparse delta table"),
    ("ex249", "semantic_hypot_delta_bdd_keymajor", "E5M2FN hypot: max magnitude plus delta BDD, key-major order"),
    ("ex249", "semantic_hypot_delta_bdd_interleave", "E5M2FN hypot: max magnitude plus delta BDD, interleaved order"),
    ("ex245", "semantic_add_mag_bdd_interleave", "E5M2FN add: semantic sign plus sorted-magnitude BDD"),
    ("ex245", "semantic_add_split_bdd_interleave", "E5M2FN add: separate same/diff sorted-magnitude BDDs"),
    ("ex246", "semantic_mul_key_bdd_interleave", "E5M2FN multiply: BDD only for exp-sum/product semantic key"),
    ("ex247", "semantic_div_key_bdd_interleave", "E5M2FN division: BDD only for exp-delta/significand semantic key"),
    ("ex249", "semantic_hypot_threshold_formula", "E5M2FN hypot: gap-0/1 significand threshold formula"),
    ("ex249", "semantic_hypot_threshold_case", "E5M2FN hypot: shallow gap/sig delta case with explicit saturation guard"),
    ("ex249", "semantic_hypot_threshold_rawexp", "E5M2FN hypot: raw-exponent gap0/gap1 threshold case"),
]

for _case in CASES:
    VARIANTS.append((_case, "truth_bdd_field", "exact full-output BDD after E5M2 semantic diagnosis, field-major order"))
    VARIANTS.append((_case, "truth_bdd_interleave", "exact full-output BDD after E5M2 semantic diagnosis, byte-interleaved order"))


def synthesize_with_script(script, yosys, timeout, log_path):
    log_path.parent.mkdir(parents=True, exist_ok=True)
    script_path = log_path.with_suffix(".ys")
    (log_path.parent.parent / "aigs").mkdir(parents=True, exist_ok=True)
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
        print(case, candidate_id, "eq={0}".format(row["equivalent"]), "area={0}".format(row["area"]), "delay={0}".format(row["delay"]), "adp={0}".format(row["adp"]))
    return rows


def write_manifest(args, rows):
    text = """# {run_id}

Run ID: `{run_id}`

Purpose: E5M2FN semantic frontend experiments for ex245-ex249; no seed curation.

Artifacts:
- Work directory: `{work_dir}`
- Candidates CSV: `{results_dir}/candidates.csv`
- Best CSV: `{results_dir}/best.csv`

Semantic identification:
- ex245: E5M2FN add, high byte plus low byte, RNE, canonical 0x7f NaN.
- ex246: E5M2FN multiply, RNE, sign xor, canonical 0x7f NaN.
- ex247: E5M2FN divide low byte by high byte, RNE, divide-by-zero saturation/NaN behavior.
- ex248: E5M2FN fmod low byte by high byte, output sign from low byte.
- ex249: E5M2FN hypot of operand magnitudes, positive sign.

Best result: see `results/best.csv`.
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
    args = parser.parse_args()
    args.work_dir = args.work_dir or (ROOT / "student" / "work" / args.run_id)
    args.results_dir = args.results_dir or (ROOT / "student" / "runs" / "float_fp8" / args.run_id / "results")
    refs = load_reference(args.reference)
    selected = set(item.strip() for item in args.cases.split(",") if item.strip())
    rows = []
    for case, variant, note in VARIANTS:
        if case in selected:
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
    write_manifest(args, rows)


if __name__ == "__main__":
    main()
