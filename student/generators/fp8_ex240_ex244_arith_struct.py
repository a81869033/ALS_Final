#!/usr/bin/env python3
"""Arithmetic-structure FP8 frontend experiments for ex240-ex244.

This pass focuses on source structures that are meaningfully different from the
earlier field-table and shared-BDD candidates.  It keeps all artifacts in
student/work and student/runs/float_fp8; it does not curate seeds.
"""

import argparse
import csv
import sys
import time
from collections import Counter
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from student.backends.abc_flow import evaluate_aig
from student.generators.fp8_ex240_ex244_deep_struct import (
    SYNTH_VARIANTS,
    div_exact_mag_from_sig_delta,
    sig_eff,
    synthesize_with_script,
)
from student.generators.fp8_ex240_ex244_frontend import (
    BEST_FIELDNAMES,
    CASE_LABELS,
    FP8,
    RESULT_FIELDNAMES,
    add_reference_columns,
    load_reference,
    rel_path,
    write_csv,
    write_text,
)
from student.generators.unknown_bdd_search import build_bdd, edge_expr


def round_even(num, shift):
    if shift <= 0:
        return num << (-shift)
    base = num >> shift
    rem = num - (base << shift)
    half = 1 << (shift - 1)
    return base + (1 if rem > half or (rem == half and (base & 1)) else 0)


def mul_exact_mag_from_product(product, exp_sum):
    if product == 0:
        return 0
    if exp_sum >= 11:
        return FP8.quant_mag_rational(product << (exp_sum - 11))
    return FP8.quant_mag_rational(product, 1 << (11 - exp_sum))


def norm_from_rem(rem_sig, den_eff):
    if rem_sig == 0:
        return 0
    k = rem_sig << (den_eff - 1)
    return FP8.quant_mag_rational(k)


def render_add_sigalg_norm(module):
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

  function [3:0] sig4;
    input [6:0] v;
    begin
      sig4 = (v[6:3] == 4'd0) ? {1'b0, v[2:0]} : {1'b1, v[2:0]};
    end
  endfunction

  function [4:0] eff_exp;
    input [6:0] v;
    begin
      eff_exp = (v[6:3] == 4'd0) ? 5'd1 : {1'b0, v[6:3]};
    end
  endfunction

  function [6:0] norm_sig_exp;
    input [18:0] sigval;
    input [4:0] base_eff;
    reg [4:0] lead;
    reg signed [6:0] exp_calc;
    reg [4:0] shift;
    reg [4:0] sig_base;
    reg [18:0] rem;
    reg [18:0] half;
    reg round_up;
    reg [4:0] sig_round;
    reg [18:0] sub_k;
    begin
      if (sigval == 19'd0) norm_sig_exp = 7'h00;
      else begin
        if (sigval[18]) lead = 5'd18;
        else if (sigval[17]) lead = 5'd17;
        else if (sigval[16]) lead = 5'd16;
        else if (sigval[15]) lead = 5'd15;
        else if (sigval[14]) lead = 5'd14;
        else if (sigval[13]) lead = 5'd13;
        else if (sigval[12]) lead = 5'd12;
        else if (sigval[11]) lead = 5'd11;
        else if (sigval[10]) lead = 5'd10;
        else if (sigval[9]) lead = 5'd9;
        else if (sigval[8]) lead = 5'd8;
        else if (sigval[7]) lead = 5'd7;
        else if (sigval[6]) lead = 5'd6;
        else if (sigval[5]) lead = 5'd5;
        else if (sigval[4]) lead = 5'd4;
        else if (sigval[3]) lead = 5'd3;
        else if (sigval[2]) lead = 5'd2;
        else if (sigval[1]) lead = 5'd1;
        else lead = 5'd0;
        exp_calc = $signed({2'b00, base_eff}) + $signed({2'b00, lead}) - 7'sd3;
        if (exp_calc <= 0) begin
          sub_k = sigval << (base_eff - 5'd1);
          norm_sig_exp = (sub_k > 19'd7) ? 7'h07 : sub_k[6:0];
        end else begin
          if (lead >= 5'd3) begin
            shift = lead - 5'd3;
            sig_base = sigval >> shift;
            if (shift == 5'd0) round_up = 1'b0;
            else begin
              rem = sigval - ({14'd0, sig_base} << shift);
              half = 19'd1 << (shift - 5'd1);
              round_up = (rem > half) || ((rem == half) && sig_base[0]);
            end
          end else begin
            shift = 5'd3 - lead;
            sig_base = sigval << shift;
            round_up = 1'b0;
          end
          sig_round = sig_base + {4'd0, round_up};
          if (sig_round >= 5'd16) begin
            sig_round = 5'd8;
            exp_calc = exp_calc + 7'sd1;
          end
          if ((exp_calc > 7'sd15) || ((exp_calc == 7'sd15) && (sig_round >= 5'd15)))
            norm_sig_exp = 7'h7e;
          else
            norm_sig_exp = {exp_calc[3:0], sig_round[2:0]};
        end
      end
    end
  endfunction

  wire [4:0] max_eff = eff_exp(maxc);
  wire [4:0] min_eff = eff_exp(minc);
  wire [4:0] gap = max_eff - min_eff;
  wire [18:0] max_shifted = {15'd0, sig4(maxc)} << gap;
  wire [18:0] min_sig = {15'd0, sig4(minc)};
  wire [18:0] same_val = max_shifted + min_sig;
  wire [18:0] diff_val = max_shifted - min_sig;
  wire [6:0] same_mag = norm_sig_exp(same_val, min_eff);
  wire [6:0] diff_mag = norm_sig_exp(diff_val, min_eff);
  wire neg_zero = (am == 7'h00) && (bm == 7'h00) && a[7] && b[7];
  wire diff_sign = (diff_mag == 7'h00) ? 1'b0 : (a_ge_b ? a[7] : b[7]);
  wire out_sign = same_sign ? ((same_mag == 7'h00) ? neg_zero : a[7]) : diff_sign;
  wire [6:0] out_mag = same_sign ? same_mag : diff_mag;
  assign out = nan ? 8'h7f : {out_sign, out_mag};
endmodule
""".replace("@MODULE@", module)


def render_add_sigalg_norm9_clamped(module):
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

  function [3:0] sig4;
    input [6:0] v;
    begin
      sig4 = (v[6:3] == 4'd0) ? {1'b0, v[2:0]} : {1'b1, v[2:0]};
    end
  endfunction

  function [3:0] eff_exp;
    input [6:0] v;
    begin
      eff_exp = (v[6:3] == 4'd0) ? 4'd1 : v[6:3];
    end
  endfunction

  function [6:0] norm9;
    input [8:0] sigval;
    input [3:0] base_eff;
    reg [3:0] lead;
    reg signed [5:0] exp_calc;
    reg [3:0] shift;
    reg [4:0] sig_base;
    reg [8:0] rem;
    reg [8:0] half;
    reg round_up;
    reg [4:0] sig_round;
    reg [8:0] sub_k;
    begin
      if (sigval == 9'd0) norm9 = 7'h00;
      else begin
        if (sigval[8]) lead = 4'd8;
        else if (sigval[7]) lead = 4'd7;
        else if (sigval[6]) lead = 4'd6;
        else if (sigval[5]) lead = 4'd5;
        else if (sigval[4]) lead = 4'd4;
        else if (sigval[3]) lead = 4'd3;
        else if (sigval[2]) lead = 4'd2;
        else if (sigval[1]) lead = 4'd1;
        else lead = 4'd0;
        exp_calc = $signed({2'b00, base_eff}) + $signed({2'b00, lead}) - 6'sd3;
        if (exp_calc <= 0) begin
          sub_k = sigval << (base_eff - 4'd1);
          norm9 = (sub_k > 9'd7) ? 7'h07 : sub_k[6:0];
        end else begin
          if (lead >= 4'd3) begin
            shift = lead - 4'd3;
            sig_base = sigval >> shift;
            if (shift == 4'd0) round_up = 1'b0;
            else begin
              rem = sigval - ({4'd0, sig_base} << shift);
              half = 9'd1 << (shift - 4'd1);
              round_up = (rem > half) || ((rem == half) && sig_base[0]);
            end
          end else begin
            shift = 4'd3 - lead;
            sig_base = sigval << shift;
            round_up = 1'b0;
          end
          sig_round = sig_base + {4'd0, round_up};
          if (sig_round >= 5'd16) begin
            sig_round = 5'd8;
            exp_calc = exp_calc + 6'sd1;
          end
          if ((exp_calc > 6'sd15) || ((exp_calc == 6'sd15) && (sig_round >= 5'd15)))
            norm9 = 7'h7e;
          else
            norm9 = {exp_calc[3:0], sig_round[2:0]};
        end
      end
    end
  endfunction

  wire [3:0] max_eff = eff_exp(maxc);
  wire [3:0] min_eff = eff_exp(minc);
  wire [3:0] gap = max_eff - min_eff;
  wire [3:0] max_sig = sig4(maxc);
  wire [3:0] min_sig = sig4(minc);
  wire [8:0] max_shifted = {5'd0, max_sig} << gap[2:0];
  wire [8:0] same_sig = max_shifted + {5'd0, min_sig};
  wire [8:0] diff_sig = max_shifted - {5'd0, min_sig};
  wire [6:0] same_norm = norm9(same_sig, min_eff);
  wire [6:0] diff_norm = norm9(diff_sig, min_eff);
  wire [6:0] same_mag = (gap >= 4'd5) ? maxc : same_norm;
  wire [6:0] diff_mag = ((maxc == minc) ? 7'h00 : ((gap >= 4'd6) ? maxc : diff_norm));
  wire neg_zero = (am == 7'h00) && (bm == 7'h00) && a[7] && b[7];
  wire diff_sign = (diff_mag == 7'h00) ? 1'b0 : (a_ge_b ? a[7] : b[7]);
  wire out_sign = same_sign ? ((same_mag == 7'h00) ? neg_zero : a[7]) : diff_sign;
  wire [6:0] out_mag = same_sign ? same_mag : diff_mag;
  assign out = nan ? 8'h7f : {out_sign, out_mag};
endmodule
""".replace("@MODULE@", module)


def norm_param_entries(max_sigval=480, width=9):
    entries = []
    for sigval in range(1, max_sigval + 1):
        lead = sigval.bit_length() - 1
        exp_off = lead - 3
        if lead >= 3:
            shift = lead - 3
            sig_base = sigval >> shift
            if shift == 0:
                round_up = False
            else:
                rem = sigval - (sig_base << shift)
                half = 1 << (shift - 1)
                round_up = rem > half or (rem == half and (sig_base & 1))
        else:
            sig_base = sigval << (3 - lead)
            round_up = False
        sig_round = sig_base + (1 if round_up else 0)
        if sig_round >= 16:
            sig_round = 8
            exp_off += 1
        payload = ((exp_off & 0xF) << 4) | (sig_round & 0xF)
        if payload != 0:
            entries.append("        {0}'d{1}: norm_param = 8'h{2:02x};".format(width, sigval, payload))
    return "\n".join(entries)


def render_add_sigalg_norm9_param(module):
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

  function [3:0] sig4;
    input [6:0] v;
    begin
      sig4 = (v[6:3] == 4'd0) ? {1'b0, v[2:0]} : {1'b1, v[2:0]};
    end
  endfunction

  function [3:0] eff_exp;
    input [6:0] v;
    begin
      eff_exp = (v[6:3] == 4'd0) ? 4'd1 : v[6:3];
    end
  endfunction

  function [7:0] norm_param;
    input [8:0] sigval;
    begin
      case (sigval)
@PARAM_ENTRIES@
        default: norm_param = 8'h00;
      endcase
    end
  endfunction

  function [6:0] norm9;
    input [8:0] sigval;
    input [3:0] base_eff;
    reg [7:0] param;
    reg signed [5:0] exp_calc;
    reg [3:0] sig_round;
    reg [8:0] sub_k;
    begin
      if (sigval == 9'd0) norm9 = 7'h00;
      else begin
        param = norm_param(sigval);
        exp_calc = $signed({{2{param[7]}}, param[7:4]}) + $signed({2'b00, base_eff});
        sig_round = param[3:0];
        if (exp_calc <= 0) begin
          sub_k = sigval << (base_eff - 4'd1);
          norm9 = (sub_k > 9'd7) ? 7'h07 : sub_k[6:0];
        end else if ((exp_calc > 6'sd15) || ((exp_calc == 6'sd15) && (sig_round >= 4'd15))) begin
          norm9 = 7'h7e;
        end else begin
          norm9 = {exp_calc[3:0], sig_round[2:0]};
        end
      end
    end
  endfunction

  wire [3:0] max_eff = eff_exp(maxc);
  wire [3:0] min_eff = eff_exp(minc);
  wire [3:0] gap = max_eff - min_eff;
  wire [3:0] max_sig = sig4(maxc);
  wire [3:0] min_sig = sig4(minc);
  wire [8:0] max_shifted = {5'd0, max_sig} << gap[2:0];
  wire [8:0] same_sig = max_shifted + {5'd0, min_sig};
  wire [8:0] diff_sig = max_shifted - {5'd0, min_sig};
  wire [6:0] same_norm = norm9(same_sig, min_eff);
  wire [6:0] diff_norm = norm9(diff_sig, min_eff);
  wire [6:0] same_mag = (gap >= 4'd5) ? maxc : same_norm;
  wire [6:0] diff_mag = ((maxc == minc) ? 7'h00 : ((gap >= 4'd6) ? maxc : diff_norm));
  wire neg_zero = (am == 7'h00) && (bm == 7'h00) && a[7] && b[7];
  wire diff_sign = (diff_mag == 7'h00) ? 1'b0 : (a_ge_b ? a[7] : b[7]);
  wire out_sign = same_sign ? ((same_mag == 7'h00) ? neg_zero : a[7]) : diff_sign;
  wire [6:0] out_mag = same_sign ? same_mag : diff_mag;
  assign out = nan ? 8'h7f : {out_sign, out_mag};
endmodule
""".replace("@MODULE@", module).replace("@PARAM_ENTRIES@", norm_param_entries())


def render_add_same_delta_diff_param8(module):
    same_groups = {}
    for maxc in range(127):
        if FP8.nan[maxc]:
            continue
        for minc in range(maxc + 1):
            if FP8.nan[minc]:
                continue
            max_sig, max_eff = sig_eff(maxc)
            min_sig, min_eff = sig_eff(minc)
            gap = max_eff - min_eff
            sig_key = (max_sig << 4) | min_sig
            same_mag = FP8.quant_mag_rational(FP8.k[maxc] + FP8.k[minc])
            same_delta = max(0, same_mag - maxc)
            if same_delta:
                same_groups.setdefault(gap, {}).setdefault(sig_key, same_delta)

    same_outer = []
    for gap, table in sorted(same_groups.items()):
        entries = "\n".join(
            "          8'h{0:02x}: same_delta = 4'd{1};".format(key, val)
            for key, val in sorted(table.items())
        )
        same_outer.append(
            "        4'd{0}: begin\n"
            "          case (sig_key)\n{1}\n"
            "            default: same_delta = 4'd0;\n"
            "          endcase\n"
            "        end".format(gap, entries)
        )

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

  function [3:0] sig4;
    input [6:0] v;
    begin
      sig4 = (v[6:3] == 4'd0) ? {1'b0, v[2:0]} : {1'b1, v[2:0]};
    end
  endfunction

  function [3:0] eff_exp;
    input [6:0] v;
    begin
      eff_exp = (v[6:3] == 4'd0) ? 4'd1 : v[6:3];
    end
  endfunction

  function [3:0] same_delta;
    input [3:0] gap;
    input [7:0] sig_key;
    begin
      same_delta = 4'd0;
      case (gap)
@SAME_OUTER@
        default: same_delta = 4'd0;
      endcase
    end
  endfunction

  function [7:0] norm_param;
    input [7:0] sigval;
    begin
      case (sigval)
@PARAM_ENTRIES@
        default: norm_param = 8'h00;
      endcase
    end
  endfunction

  function [6:0] norm8;
    input [7:0] sigval;
    input [3:0] base_eff;
    reg [7:0] param;
    reg signed [5:0] exp_calc;
    reg [3:0] sig_round;
    reg [8:0] sub_k;
    begin
      if (sigval == 8'd0) norm8 = 7'h00;
      else begin
        param = norm_param(sigval);
        exp_calc = $signed({{2{param[7]}}, param[7:4]}) + $signed({2'b00, base_eff});
        sig_round = param[3:0];
        if (exp_calc <= 0) begin
          sub_k = {1'b0, sigval} << (base_eff - 4'd1);
          norm8 = (sub_k > 9'd7) ? 7'h07 : sub_k[6:0];
        end else if ((exp_calc > 6'sd15) || ((exp_calc == 6'sd15) && (sig_round >= 4'd15))) begin
          norm8 = 7'h7e;
        end else begin
          norm8 = {exp_calc[3:0], sig_round[2:0]};
        end
      end
    end
  endfunction

  wire [3:0] max_eff = eff_exp(maxc);
  wire [3:0] min_eff = eff_exp(minc);
  wire [3:0] gap = max_eff - min_eff;
  wire [3:0] max_sig = sig4(maxc);
  wire [3:0] min_sig = sig4(minc);
  wire [7:0] sig_key = {max_sig, min_sig};
  wire [3:0] sd = same_delta(gap, sig_key);
  wire [7:0] same_raw = {1'b0, maxc} + {4'd0, sd};
  wire [6:0] same_mag = (gap >= 4'd5) ? maxc : ((same_raw >= 8'h7e) ? 7'h7e : same_raw[6:0]);
  wire [7:0] diff_sig = ({4'd0, max_sig} << gap[2:0]) - {4'd0, min_sig};
  wire [6:0] diff_norm = norm8(diff_sig, min_eff);
  wire gap5_down = (gap == 4'd5) && (max_sig == 4'd8) && (min_sig >= 4'd9);
  wire [6:0] diff_gap5 = maxc - {6'd0, gap5_down};
  wire [6:0] diff_mag = (maxc == minc) ? 7'h00 : ((gap >= 4'd6) ? maxc : ((gap == 4'd5) ? diff_gap5 : diff_norm));
  wire neg_zero = (am == 7'h00) && (bm == 7'h00) && a[7] && b[7];
  wire diff_sign = (diff_mag == 7'h00) ? 1'b0 : (a_ge_b ? a[7] : b[7]);
  wire out_sign = same_sign ? ((same_mag == 7'h00) ? neg_zero : a[7]) : diff_sign;
  wire [6:0] out_mag = same_sign ? same_mag : diff_mag;
  assign out = nan ? 8'h7f : {out_sign, out_mag};
endmodule
""".replace("@MODULE@", module).replace("@SAME_OUTER@", "\n".join(same_outer)).replace("@PARAM_ENTRIES@", norm_param_entries(240, 8))


def render_add_same_delta_diff_direct8(module):
    same_groups = {}
    diff_entries = {}
    for maxc in range(127):
        if FP8.nan[maxc]:
            continue
        for minc in range(maxc + 1):
            if FP8.nan[minc]:
                continue
            max_sig, max_eff = sig_eff(maxc)
            min_sig, min_eff = sig_eff(minc)
            gap = max_eff - min_eff
            sig_key = (max_sig << 4) | min_sig
            same_mag = FP8.quant_mag_rational(FP8.k[maxc] + FP8.k[minc])
            same_delta = max(0, same_mag - maxc)
            if same_delta:
                same_groups.setdefault(gap, {}).setdefault(sig_key, same_delta)
            if maxc != minc and gap < 5:
                diff_sig = (max_sig << gap) - min_sig
                diff_mag = FP8.quant_mag_rational(FP8.k[maxc] - FP8.k[minc])
                diff_entries[(min_eff << 8) | diff_sig] = diff_mag

    same_outer = []
    for gap, table in sorted(same_groups.items()):
        entries = "\n".join(
            "          8'h{0:02x}: same_delta = 4'd{1};".format(key, val)
            for key, val in sorted(table.items())
        )
        same_outer.append(
            "        4'd{0}: begin\n"
            "          case (sig_key)\n{1}\n"
            "            default: same_delta = 4'd0;\n"
            "          endcase\n"
            "        end".format(gap, entries)
        )

    diff_text = "\n".join(
        "        12'h{0:03x}: diff_norm = 7'h{1:02x};".format(key, value)
        for key, value in sorted(diff_entries.items())
    )

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

  function [3:0] sig4;
    input [6:0] v;
    begin
      sig4 = (v[6:3] == 4'd0) ? {1'b0, v[2:0]} : {1'b1, v[2:0]};
    end
  endfunction

  function [3:0] eff_exp;
    input [6:0] v;
    begin
      eff_exp = (v[6:3] == 4'd0) ? 4'd1 : v[6:3];
    end
  endfunction

  function [3:0] same_delta;
    input [3:0] gap;
    input [7:0] sig_key;
    begin
      same_delta = 4'd0;
      case (gap)
@SAME_OUTER@
        default: same_delta = 4'd0;
      endcase
    end
  endfunction

  function [6:0] diff_norm;
    input [11:0] key;
    begin
      case (key)
@DIFF_ENTRIES@
        default: diff_norm = 7'h00;
      endcase
    end
  endfunction

  wire [3:0] max_eff = eff_exp(maxc);
  wire [3:0] min_eff = eff_exp(minc);
  wire [3:0] gap = max_eff - min_eff;
  wire [3:0] max_sig = sig4(maxc);
  wire [3:0] min_sig = sig4(minc);
  wire [7:0] sig_key = {max_sig, min_sig};
  wire [3:0] sd = same_delta(gap, sig_key);
  wire [7:0] same_raw = {1'b0, maxc} + {4'd0, sd};
  wire [6:0] same_mag = (gap >= 4'd5) ? maxc : ((same_raw >= 8'h7e) ? 7'h7e : same_raw[6:0]);
  wire [7:0] diff_sig = ({4'd0, max_sig} << gap[2:0]) - {4'd0, min_sig};
  wire [6:0] diff_direct = diff_norm({min_eff, diff_sig});
  wire gap5_down = (gap == 4'd5) && (max_sig == 4'd8) && (min_sig >= 4'd9);
  wire [6:0] diff_gap5 = maxc - {6'd0, gap5_down};
  wire [6:0] diff_mag = (maxc == minc) ? 7'h00 : ((gap >= 4'd6) ? maxc : ((gap == 4'd5) ? diff_gap5 : diff_direct));
  wire neg_zero = (am == 7'h00) && (bm == 7'h00) && a[7] && b[7];
  wire diff_sign = (diff_mag == 7'h00) ? 1'b0 : (a_ge_b ? a[7] : b[7]);
  wire out_sign = same_sign ? ((same_mag == 7'h00) ? neg_zero : a[7]) : diff_sign;
  wire [6:0] out_mag = same_sign ? same_mag : diff_mag;
  assign out = nan ? 8'h7f : {out_sign, out_mag};
endmodule
""".replace("@MODULE@", module).replace("@SAME_OUTER@", "\n".join(same_outer)).replace("@DIFF_ENTRIES@", diff_text)


def render_add_same_grs_diff_param8(module):
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

  function [3:0] sig4;
    input [6:0] v;
    begin
      sig4 = (v[6:3] == 4'd0) ? {1'b0, v[2:0]} : {1'b1, v[2:0]};
    end
  endfunction

  function [3:0] eff_exp;
    input [6:0] v;
    begin
      eff_exp = (v[6:3] == 4'd0) ? 4'd1 : v[6:3];
    end
  endfunction

  function [7:0] norm_param;
    input [7:0] sigval;
    begin
      case (sigval)
@PARAM_ENTRIES@
        default: norm_param = 8'h00;
      endcase
    end
  endfunction

  function [6:0] norm8;
    input [7:0] sigval;
    input [3:0] base_eff;
    reg [7:0] param;
    reg signed [5:0] exp_calc;
    reg [3:0] sig_round;
    reg [8:0] sub_k;
    begin
      if (sigval == 8'd0) norm8 = 7'h00;
      else begin
        param = norm_param(sigval);
        exp_calc = $signed({{2{param[7]}}, param[7:4]}) + $signed({2'b00, base_eff});
        sig_round = param[3:0];
        if (exp_calc <= 0) begin
          sub_k = {1'b0, sigval} << (base_eff - 4'd1);
          norm8 = (sub_k > 9'd7) ? 7'h07 : sub_k[6:0];
        end else if ((exp_calc > 6'sd15) || ((exp_calc == 6'sd15) && (sig_round >= 4'd15))) begin
          norm8 = 7'h7e;
        end else begin
          norm8 = {exp_calc[3:0], sig_round[2:0]};
        end
      end
    end
  endfunction

  function [6:0] same_grs;
    input [8:0] ext_sum;
    input [3:0] max_eff;
    reg [4:0] exp_out;
    reg [4:0] sig_round;
    reg round_up;
    begin
      if (ext_sum[8]) begin
        exp_out = {1'b0, max_eff} + 5'd1;
        round_up = (ext_sum[4:0] > 5'd16) || ((ext_sum[4:0] == 5'd16) && ext_sum[5]);
        sig_round = {1'b0, ext_sum[8:5]} + {4'd0, round_up};
      end else begin
        exp_out = {1'b0, max_eff};
        round_up = (ext_sum[3:0] > 4'd8) || ((ext_sum[3:0] == 4'd8) && ext_sum[4]);
        sig_round = {1'b0, ext_sum[7:4]} + {4'd0, round_up};
        if (sig_round >= 5'd16) begin
          exp_out = exp_out + 5'd1;
          sig_round = 5'd8;
        end
      end
      if ((exp_out > 5'd15) || ((exp_out == 5'd15) && (sig_round >= 5'd15)))
        same_grs = 7'h7e;
      else if ((exp_out == 5'd1) && (sig_round < 5'd8))
        same_grs = {2'b00, sig_round};
      else
        same_grs = {exp_out[3:0], sig_round[2:0]};
    end
  endfunction

  wire [3:0] max_eff = eff_exp(maxc);
  wire [3:0] min_eff = eff_exp(minc);
  wire [3:0] gap = max_eff - min_eff;
  wire [3:0] max_sig = sig4(maxc);
  wire [3:0] min_sig = sig4(minc);
  wire [8:0] ext_sum = {1'b0, max_sig, 4'b0000} + ({1'b0, min_sig, 4'b0000} >> gap[2:0]);
  wire [6:0] same_mag = (gap >= 4'd5) ? maxc : same_grs(ext_sum, max_eff);
  wire [7:0] diff_sig = ({4'd0, max_sig} << gap[2:0]) - {4'd0, min_sig};
  wire [6:0] diff_norm = norm8(diff_sig, min_eff);
  wire gap5_down = (gap == 4'd5) && (max_sig == 4'd8) && (min_sig >= 4'd9);
  wire [6:0] diff_gap5 = maxc - {6'd0, gap5_down};
  wire [6:0] diff_mag = (maxc == minc) ? 7'h00 : ((gap >= 4'd6) ? maxc : ((gap == 4'd5) ? diff_gap5 : diff_norm));
  wire neg_zero = (am == 7'h00) && (bm == 7'h00) && a[7] && b[7];
  wire diff_sign = (diff_mag == 7'h00) ? 1'b0 : (a_ge_b ? a[7] : b[7]);
  wire out_sign = same_sign ? ((same_mag == 7'h00) ? neg_zero : a[7]) : diff_sign;
  wire [6:0] out_mag = same_sign ? same_mag : diff_mag;
  assign out = nan ? 8'h7f : {out_sign, out_mag};
endmodule
""".replace("@MODULE@", module).replace("@PARAM_ENTRIES@", norm_param_entries(240, 8))


def render_add_same_grs_diff_grs(module):
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

  function [3:0] sig4;
    input [6:0] v;
    begin
      sig4 = (v[6:3] == 4'd0) ? {1'b0, v[2:0]} : {1'b1, v[2:0]};
    end
  endfunction

  function [3:0] eff_exp;
    input [6:0] v;
    begin
      eff_exp = (v[6:3] == 4'd0) ? 4'd1 : v[6:3];
    end
  endfunction

  function [6:0] same_grs;
    input [8:0] ext_sum;
    input [3:0] max_eff;
    reg [4:0] exp_out;
    reg [4:0] sig_round;
    reg round_up;
    begin
      if (ext_sum[8]) begin
        exp_out = {1'b0, max_eff} + 5'd1;
        round_up = (ext_sum[4:0] > 5'd16) || ((ext_sum[4:0] == 5'd16) && ext_sum[5]);
        sig_round = {1'b0, ext_sum[8:5]} + {4'd0, round_up};
      end else begin
        exp_out = {1'b0, max_eff};
        round_up = (ext_sum[3:0] > 4'd8) || ((ext_sum[3:0] == 4'd8) && ext_sum[4]);
        sig_round = {1'b0, ext_sum[7:4]} + {4'd0, round_up};
        if (sig_round >= 5'd16) begin
          exp_out = exp_out + 5'd1;
          sig_round = 5'd8;
        end
      end
      if ((exp_out > 5'd15) || ((exp_out == 5'd15) && (sig_round >= 5'd15)))
        same_grs = 7'h7e;
      else if ((exp_out == 5'd1) && (sig_round < 5'd8))
        same_grs = {2'b00, sig_round};
      else
        same_grs = {exp_out[3:0], sig_round[2:0]};
    end
  endfunction

  function [4:0] round_sub;
    input [7:0] val;
    input [2:0] shift;
    reg [7:0] base;
    reg [7:0] rem;
    reg [7:0] half;
    reg round_up;
    begin
      if (shift == 3'd0) round_sub = val[3:0];
      else begin
        base = val >> shift;
        rem = val - (base << shift);
        half = 8'd1 << (shift - 3'd1);
        round_up = (rem > half) || ((rem == half) && base[0]);
        round_sub = {1'b0, base[3:0]} + {4'd0, round_up};
      end
    end
  endfunction

  function [6:0] diff_grs;
    input [7:0] ext_diff;
    input [3:0] max_eff;
    reg [2:0] lead;
    reg [3:0] lshift;
    reg signed [5:0] exp_out;
    reg [14:0] norm_ext;
    reg [4:0] sig_round;
    reg round_up;
    reg [4:0] sub_round;
    reg [10:0] sub_wide;
    begin
      if (ext_diff == 8'd0) diff_grs = 7'h00;
      else begin
        if (ext_diff[7]) lead = 3'd7;
        else if (ext_diff[6]) lead = 3'd6;
        else if (ext_diff[5]) lead = 3'd5;
        else if (ext_diff[4]) lead = 3'd4;
        else if (ext_diff[3]) lead = 3'd3;
        else if (ext_diff[2]) lead = 3'd2;
        else if (ext_diff[1]) lead = 3'd1;
        else lead = 3'd0;
        lshift = 4'd7 - {1'b0, lead};
        exp_out = $signed({2'b00, max_eff}) - $signed({2'b00, lshift});
        if (exp_out <= 0) begin
          if (max_eff <= 4'd5) begin
            sub_round = round_sub(ext_diff, 3'd5 - max_eff[2:0]);
            diff_grs = (sub_round > 5'd7) ? 7'h07 : {2'd0, sub_round};
          end else begin
            sub_wide = {3'd0, ext_diff} << (max_eff - 4'd5);
            diff_grs = (sub_wide > 11'd7) ? 7'h07 : sub_wide[6:0];
          end
        end else begin
          norm_ext = {7'd0, ext_diff} << lshift;
          round_up = (norm_ext[3:0] > 4'd8) || ((norm_ext[3:0] == 4'd8) && norm_ext[4]);
          sig_round = {1'b0, norm_ext[7:4]} + {4'd0, round_up};
          if (sig_round >= 5'd16) begin
            exp_out = exp_out + 6'sd1;
            sig_round = 5'd8;
          end
          if ((exp_out == 6'sd15) && (sig_round >= 5'd15))
            diff_grs = 7'h7e;
          else if ((exp_out == 6'sd1) && (sig_round < 5'd8))
            diff_grs = {2'b00, sig_round};
          else
            diff_grs = {exp_out[3:0], sig_round[2:0]};
        end
      end
    end
  endfunction

  wire [3:0] max_eff = eff_exp(maxc);
  wire [3:0] min_eff = eff_exp(minc);
  wire [3:0] gap = max_eff - min_eff;
  wire [3:0] max_sig = sig4(maxc);
  wire [3:0] min_sig = sig4(minc);
  wire [8:0] ext_sum = {1'b0, max_sig, 4'b0000} + ({1'b0, min_sig, 4'b0000} >> gap[2:0]);
  wire [6:0] same_mag = (gap >= 4'd5) ? maxc : same_grs(ext_sum, max_eff);
  wire [7:0] ext_diff = ({4'd0, max_sig} << gap[2:0]) - {4'd0, min_sig};
  wire [6:0] diff_norm = diff_grs(ext_diff, max_eff);
  wire gap5_down = (gap == 4'd5) && (max_sig == 4'd8) && (min_sig >= 4'd9);
  wire [6:0] diff_gap5 = maxc - {6'd0, gap5_down};
  wire [6:0] diff_mag = (maxc == minc) ? 7'h00 : ((gap >= 4'd6) ? maxc : ((gap == 4'd5) ? diff_gap5 : diff_norm));
  wire neg_zero = (am == 7'h00) && (bm == 7'h00) && a[7] && b[7];
  wire diff_sign = (diff_mag == 7'h00) ? 1'b0 : (a_ge_b ? a[7] : b[7]);
  wire out_sign = same_sign ? ((same_mag == 7'h00) ? neg_zero : a[7]) : diff_sign;
  wire [6:0] out_mag = same_sign ? same_mag : diff_mag;
  assign out = nan ? 8'h7f : {out_sign, out_mag};
endmodule
""".replace("@MODULE@", module)


def with_parallel_case(text):
    return text.replace("case (", "(* parallel_case *) case (")


def render_add_sigalg_norm9_param_parallel(module):
    return with_parallel_case(render_add_sigalg_norm9_param(module))


def render_add_same_delta_diff_param8_parallel(module):
    return with_parallel_case(render_add_same_delta_diff_param8(module))


def render_add_same_grs_diff_param8_parallel(module):
    return with_parallel_case(render_add_same_grs_diff_param8(module))


def render_add_same_grs_diff_grs_parallel(module):
    return with_parallel_case(render_add_same_grs_diff_grs(module))


def render_add_nested_gap(module):
    same_groups = {}
    diff_groups = {}
    for maxc in range(127):
        if FP8.nan[maxc]:
            continue
        for minc in range(maxc + 1):
            if FP8.nan[minc]:
                continue
            max_sig, max_eff = sig_eff(maxc)
            min_sig, min_eff = sig_eff(minc)
            gap = max_eff - min_eff
            sig_key = (max_sig << 4) | min_sig
            same_mag = FP8.quant_mag_rational(FP8.k[maxc] + FP8.k[minc])
            same_delta = max(0, same_mag - maxc)
            if same_delta:
                same_groups.setdefault(gap, {}).setdefault(sig_key, same_delta)
            diff_mag = FP8.quant_mag_rational(FP8.k[maxc] - FP8.k[minc])
            diff_groups.setdefault((gap, max_eff), {})[sig_key] = diff_mag

    same_outer = []
    for gap, table in sorted(same_groups.items()):
        entries = "\n".join(
            "          8'h{0:02x}: same_delta = 4'd{1};".format(key, val)
            for key, val in sorted(table.items())
        )
        same_outer.append(
            "        4'd{0}: begin\n"
            "          case (sig_key)\n{1}\n"
            "            default: same_delta = 4'd0;\n"
            "          endcase\n"
            "        end".format(gap, entries)
        )

    diff_outer = []
    for (gap, max_eff), table in sorted(diff_groups.items()):
        entries = "\n".join(
            "          8'h{0:02x}: diff_table = 7'h{1:02x};".format(key, val)
            for key, val in sorted(table.items())
        )
        diff_outer.append(
            "        8'h{0:02x}: begin\n"
            "          case (sig_key)\n{1}\n"
            "            default: diff_table = 7'h00;\n"
            "          endcase\n"
            "        end".format((gap << 4) | max_eff, entries)
        )

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

  function [3:0] sig4;
    input [6:0] v;
    begin
      sig4 = (v[6:3] == 4'd0) ? {1'b0, v[2:0]} : {1'b1, v[2:0]};
    end
  endfunction

  function [3:0] eff_exp;
    input [6:0] v;
    begin
      eff_exp = (v[6:3] == 4'd0) ? 4'd1 : v[6:3];
    end
  endfunction

  function [3:0] same_delta;
    input [3:0] gap;
    input [7:0] sig_key;
    begin
      same_delta = 4'd0;
      case (gap)
@SAME_OUTER@
        default: same_delta = 4'd0;
      endcase
    end
  endfunction

  function [6:0] diff_table;
    input [7:0] exp_key;
    input [7:0] sig_key;
    begin
      diff_table = 7'h00;
      case (exp_key)
@DIFF_OUTER@
        default: diff_table = 7'h00;
      endcase
    end
  endfunction

  wire [3:0] max_eff = eff_exp(maxc);
  wire [3:0] min_eff = eff_exp(minc);
  wire [3:0] gap = max_eff - min_eff;
  wire [3:0] max_sig = sig4(maxc);
  wire [3:0] min_sig = sig4(minc);
  wire [7:0] sig_key = {max_sig, min_sig};
  wire [3:0] sd = same_delta(gap, sig_key);
  wire [7:0] same_raw = {1'b0, maxc} + {4'd0, sd};
  wire [6:0] same_mag = (same_raw >= 8'h7e) ? 7'h7e : same_raw[6:0];
  wire [6:0] diff_mag = diff_table({gap, max_eff}, sig_key);
  wire neg_zero = (am == 7'h00) && (bm == 7'h00) && a[7] && b[7];
  wire diff_sign = (diff_mag == 7'h00) ? 1'b0 : (a_ge_b ? a[7] : b[7]);
  wire out_sign = same_sign ? ((same_mag == 7'h00) ? neg_zero : a[7]) : diff_sign;
  wire [6:0] out_mag = same_sign ? same_mag : diff_mag;
  assign out = nan ? 8'h7f : {out_sign, out_mag};
endmodule
""".replace("@MODULE@", module).replace("@SAME_OUTER@", "\n".join(same_outer)).replace("@DIFF_OUTER@", "\n".join(diff_outer))


def add_magnitude_outputs():
    outputs = [0] * (1 << 15)
    for same_sign in range(2):
        for am in range(128):
            for bm in range(128):
                key = (same_sign << 14) | (am << 7) | bm
                if FP8.nan[am] or FP8.nan[bm]:
                    outputs[key] = 0x7F
                elif same_sign:
                    outputs[key] = FP8.quant_mag_rational(FP8.k[am] + FP8.k[bm])
                else:
                    diff = FP8.k[am] - FP8.k[bm]
                    outputs[key] = FP8.quant_mag_rational(abs(diff))
    return outputs


def render_add_magnitude_bdd(module, order):
    builder, roots = build_bdd(add_magnitude_outputs(), 15, 7, order)
    node_lines = []
    for node in builder.nodes:
        node_lines.append(
            "  wire n_{0} = key[{1}] ? {2} : {3};".format(
                node["id"], node["var"], edge_expr(node["high"]), edge_expr(node["low"])
            )
        )
    root_lines = ["  wire m{0} = {1};".format(bit, edge_expr(root)) for bit, root in enumerate(roots)]
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] a = in[15:8];
  wire [7:0] b = in[7:0];
  wire [6:0] am = a[6:0];
  wire [6:0] bm = b[6:0];
  wire same_sign = (a[7] == b[7]);
  wire [14:0] key = {same_sign, am, bm};
@NODES@
@ROOTS@
  wire [6:0] out_mag = {m6, m5, m4, m3, m2, m1, m0};
  wire nan = (out_mag == 7'h7f);
  wire a_ge_b = (am >= bm);
  wire neg_zero = (am == 7'h00) && (bm == 7'h00) && a[7] && b[7];
  wire diff_sign = (out_mag == 7'h00) ? 1'b0 : (a_ge_b ? a[7] : b[7]);
  wire out_sign = same_sign ? ((out_mag == 7'h00) ? neg_zero : a[7]) : diff_sign;
  assign out = nan ? 8'h7f : {out_sign, out_mag};
endmodule
""".replace("@MODULE@", module).replace("@NODES@", "\n".join(node_lines)).replace("@ROOTS@", "\n".join(root_lines))


def render_add_magnitude_bdd_exp_sign_mid(module):
    return render_add_magnitude_bdd(module, [6, 13, 5, 12, 4, 11, 3, 10, 14, 2, 9, 1, 8, 0, 7])


def render_add_magnitude_bdd_exp_sign_late(module):
    return render_add_magnitude_bdd(module, [6, 13, 5, 12, 4, 11, 3, 10, 2, 9, 1, 8, 0, 7, 14])


def render_add_magnitude_bdd_sign_first(module):
    return render_add_magnitude_bdd(module, [14, 6, 13, 5, 12, 4, 11, 3, 10, 2, 9, 1, 8, 0, 7])


def render_mul_product_param_exception(module):
    params = {}
    for product in range(1, 226):
        counts = Counter()
        for exp_sum in range(2, 31):
            mag = mul_exact_mag_from_product(product, exp_sum)
            exp = (mag >> 3) & 0xF
            sig = 8 + (mag & 0x7)
            if mag not in (0, 0x7E, 0x7F) and exp not in (0, 15):
                counts[(exp - exp_sum, sig)] += 1
        params[product] = counts.most_common(1)[0][0] if counts else (0, 8)

    param_entries = []
    exception_entries = []
    for product in range(0, 256):
        off, sig = params.get(product, (0, 8))
        if (off, sig) != (0, 8):
            param_entries.append(
                "        8'h{0:02x}: param_table = 9'h{1:03x};".format(
                    product, ((off & 0x1F) << 4) | (sig & 0xF)
                )
            )
        for exp_sum in range(2, 31):
            exact = mul_exact_mag_from_product(product, exp_sum)
            e = exp_sum + off
            if product == 0:
                pred = 0
            elif e <= 0:
                pred = 0
            elif e >= 15:
                pred = 0x7E
            else:
                pred = (e << 3) | ((sig - 8) & 0x7)
            if pred != exact:
                exception_entries.append(
                    "        13'h{0:04x}: exception_mag = 7'h{1:02x};".format(
                        (exp_sum << 8) | product, exact
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

  function [3:0] sig4;
    input [6:0] v;
    begin
      sig4 = (v[6:3] == 4'd0) ? {1'b0, v[2:0]} : {1'b1, v[2:0]};
    end
  endfunction

  function [4:0] eff_exp;
    input [6:0] v;
    begin
      eff_exp = (v[6:3] == 4'd0) ? 5'd1 : {1'b0, v[6:3]};
    end
  endfunction

  function [8:0] param_table;
    input [7:0] product;
    begin
      case (product)
@PARAMS@
        default: param_table = 9'h008;
      endcase
    end
  endfunction

  function [6:0] exception_mag;
    input [12:0] key;
    begin
      case (key)
@EXCEPTIONS@
        default: exception_mag = 7'h7f;
      endcase
    end
  endfunction

  wire [7:0] product = sig4(am) * sig4(bm);
  wire [4:0] exp_sum = eff_exp(am) + eff_exp(bm);
  wire [8:0] param = param_table(product);
  wire signed [5:0] off = $signed({param[8], param[8:4]});
  wire [3:0] norm_sig = param[3:0];
  wire signed [6:0] out_exp_calc = $signed({2'b00, exp_sum}) + $signed({off[5], off});
  wire [6:0] formula_mag = (product == 8'd0) ? 7'h00 :
    ((out_exp_calc <= 0) ? 7'h00 :
     ((out_exp_calc >= 15) ? 7'h7e : {out_exp_calc[3:0], norm_sig[2:0]}));
  wire [6:0] exc = exception_mag({exp_sum, product});
  wire [6:0] out_mag = (exc == 7'h7f) ? formula_mag : exc;
  assign out = nan ? 8'h7f : {sign, out_mag};
endmodule
""".replace("@MODULE@", module).replace("@PARAMS@", "\n".join(param_entries)).replace("@EXCEPTIONS@", "\n".join(exception_entries))


def mul_product_param_data():
    params = {}
    for product in range(1, 226):
        counts = Counter()
        for exp_sum in range(2, 31):
            mag = mul_exact_mag_from_product(product, exp_sum)
            exp = (mag >> 3) & 0xF
            sig = 8 + (mag & 0x7)
            if mag not in (0, 0x7E, 0x7F) and exp not in (0, 15):
                counts[(exp - exp_sum, sig)] += 1
        params[product] = counts.most_common(1)[0][0] if counts else (0, 8)
    exceptions = {}
    for product in range(0, 256):
        off, sig = params.get(product, (0, 8))
        for exp_sum in range(2, 31):
            exact = mul_exact_mag_from_product(product, exp_sum)
            e = exp_sum + off
            if product == 0:
                pred = 0
            elif e <= 0:
                pred = 0
            elif e >= 15:
                pred = 0x7E
            else:
                pred = (e << 3) | ((sig - 8) & 0x7)
            if pred != exact:
                exceptions[(exp_sum << 8) | product] = exact
    return params, exceptions


def render_mul_product_bit_exception(module):
    params, exceptions = mul_product_param_data()
    param_entries = []
    for product, (off, sig) in sorted(params.items()):
        if (off, sig) != (0, 8):
            param_entries.append(
                "        8'h{0:02x}: param_table = 9'h{1:03x};".format(
                    product, ((off & 0x1F) << 4) | (sig & 0xF)
                )
            )
    flag_entries = "\n".join("        13'h{0:04x}: exc_flag = 1'b1;".format(key) for key in sorted(exceptions))
    bit_funcs = []
    for bit in range(7):
        entries = "\n".join(
            "        13'h{0:04x}: exc_bit{1} = 1'b1;".format(key, bit)
            for key, mag in sorted(exceptions.items())
            if (mag >> bit) & 1
        )
        bit_funcs.append("""  function exc_bit@BIT@;
    input [12:0] key;
    begin
      case (key)
@ENTRIES@
        default: exc_bit@BIT@ = 1'b0;
      endcase
    end
  endfunction""".replace("@BIT@", str(bit)).replace("@ENTRIES@", entries))
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] a = in[15:8];
  wire [7:0] b = in[7:0];
  wire [6:0] am = a[6:0];
  wire [6:0] bm = b[6:0];
  wire nan = (am == 7'h7f) || (bm == 7'h7f);
  wire sign = a[7] ^ b[7];

  function [3:0] sig4;
    input [6:0] v;
    begin
      sig4 = (v[6:3] == 4'd0) ? {1'b0, v[2:0]} : {1'b1, v[2:0]};
    end
  endfunction

  function [4:0] eff_exp;
    input [6:0] v;
    begin
      eff_exp = (v[6:3] == 4'd0) ? 5'd1 : {1'b0, v[6:3]};
    end
  endfunction

  function [8:0] param_table;
    input [7:0] product;
    begin
      case (product)
@PARAMS@
        default: param_table = 9'h008;
      endcase
    end
  endfunction

  function exc_flag;
    input [12:0] key;
    begin
      case (key)
@FLAGS@
        default: exc_flag = 1'b0;
      endcase
    end
  endfunction

@BIT_FUNCS@

  wire [7:0] product = sig4(am) * sig4(bm);
  wire [4:0] exp_sum = eff_exp(am) + eff_exp(bm);
  wire [12:0] key = {exp_sum, product};
  wire [8:0] param = param_table(product);
  wire signed [5:0] off = $signed({param[8], param[8:4]});
  wire [3:0] norm_sig = param[3:0];
  wire signed [6:0] out_exp_calc = $signed({2'b00, exp_sum}) + $signed({off[5], off});
  wire [6:0] formula_mag = (product == 8'd0) ? 7'h00 :
    ((out_exp_calc <= 0) ? 7'h00 :
     ((out_exp_calc >= 15) ? 7'h7e : {out_exp_calc[3:0], norm_sig[2:0]}));
  wire [6:0] exc_mag = {exc_bit6(key), exc_bit5(key), exc_bit4(key), exc_bit3(key),
                        exc_bit2(key), exc_bit1(key), exc_bit0(key)};
  wire [6:0] out_mag = exc_flag(key) ? exc_mag : formula_mag;
  assign out = nan ? 8'h7f : {sign, out_mag};
endmodule
""".replace("@MODULE@", module).replace("@PARAMS@", "\n".join(param_entries)).replace("@FLAGS@", flag_entries).replace("@BIT_FUNCS@", "\n\n".join(bit_funcs))


def render_mul_product_nested_exp(module):
    outer = []
    for exp_sum in range(2, 31):
        entries = []
        for product in range(1, 226):
            mag = mul_exact_mag_from_product(product, exp_sum)
            if mag:
                entries.append("          8'h{0:02x}: product_mag = 7'h{1:02x};".format(product, mag))
        if entries:
            outer.append(
                "        5'd{0}: begin\n"
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

  function [3:0] sig4;
    input [6:0] v;
    begin
      sig4 = (v[6:3] == 4'd0) ? {1'b0, v[2:0]} : {1'b1, v[2:0]};
    end
  endfunction

  function [4:0] eff_exp;
    input [6:0] v;
    begin
      eff_exp = (v[6:3] == 4'd0) ? 5'd1 : {1'b0, v[6:3]};
    end
  endfunction

  function [6:0] product_mag;
    input [4:0] exp_sum;
    input [7:0] product;
    begin
      product_mag = 7'h00;
      case (exp_sum)
@OUTER@
        default: product_mag = 7'h00;
      endcase
    end
  endfunction

  wire [7:0] product = sig4(am) * sig4(bm);
  wire [4:0] exp_sum = eff_exp(am) + eff_exp(bm);
  assign out = nan ? 8'h7f : {sign, product_mag(exp_sum, product)};
endmodule
""".replace("@MODULE@", module).replace("@OUTER@", "\n".join(outer))


def div_compact_params():
    params = {}
    for sig_n in range(1, 16):
        for sig_d in range(1, 16):
            counts = Counter()
            for delta in range(-14, 15):
                mag = div_exact_mag_from_sig_delta(sig_n, sig_d, delta)
                exp = (mag >> 3) & 0xF
                sig = 8 + (mag & 0x7)
                if mag not in (0, 0x7E, 0x7F) and exp not in (0, 15):
                    counts[(exp - delta, sig)] += 1
            params[(sig_n, sig_d)] = counts.most_common(1)[0][0] if counts else (0, 8)
    return params


def render_div_formula_bit_exception(module):
    params = div_compact_params()
    param_entries = []
    exc_keys = {}
    for sig_n in range(0, 16):
        for sig_d in range(1, 16):
            off, sig = params.get((sig_n, sig_d), (0, 8))
            if (off, sig) != (0, 8):
                param_entries.append(
                    "        8'h{0:02x}: param_table = 9'h{1:03x};".format(
                        (sig_n << 4) | sig_d, ((off & 0x1F) << 4) | (sig & 0xF)
                    )
                )
            for delta in range(-14, 15):
                exact = div_exact_mag_from_sig_delta(sig_n, sig_d, delta)
                e = delta + off
                if sig_n == 0:
                    pred = 0
                elif e <= 0:
                    pred = 0
                elif e >= 15:
                    pred = 0x7E
                else:
                    pred = (e << 3) | ((sig - 8) & 0x7)
                if pred != exact:
                    key = ((delta + 15) << 8) | (sig_n << 4) | sig_d
                    exc_keys[key] = exact
    flag_entries = "\n".join("        13'h{0:04x}: exc_flag = 1'b1;".format(key) for key in sorted(exc_keys))
    bit_funcs = []
    for bit in range(7):
        entries = "\n".join(
            "        13'h{0:04x}: exc_bit{1} = 1'b1;".format(key, bit)
            for key, mag in sorted(exc_keys.items())
            if (mag >> bit) & 1
        )
        bit_funcs.append("""  function exc_bit@BIT@;
    input [12:0] key;
    begin
      case (key)
@ENTRIES@
        default: exc_bit@BIT@ = 1'b0;
      endcase
    end
  endfunction""".replace("@BIT@", str(bit)).replace("@ENTRIES@", entries))
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] den = in[15:8];
  wire [7:0] num = in[7:0];
  wire nan = (den[6:0] == 7'h7f) || (num[6:0] == 7'h7f);
  wire sign = den[7] ^ num[7];
  wire den_zero = (den[6:0] == 7'h00);
  wire num_zero = (num[6:0] == 7'h00);

  function [3:0] sig4;
    input [6:0] v;
    begin
      sig4 = (v[6:3] == 4'd0) ? {1'b0, v[2:0]} : {1'b1, v[2:0]};
    end
  endfunction

  function [4:0] eff_exp;
    input [6:0] v;
    begin
      eff_exp = (v[6:3] == 4'd0) ? 5'd1 : {1'b0, v[6:3]};
    end
  endfunction

  function [8:0] param_table;
    input [7:0] key;
    begin
      case (key)
@PARAMS@
        default: param_table = 9'h008;
      endcase
    end
  endfunction

  function exc_flag;
    input [12:0] key;
    begin
      case (key)
@FLAGS@
        default: exc_flag = 1'b0;
      endcase
    end
  endfunction

@BIT_FUNCS@

  wire [3:0] sig_n = sig4(num[6:0]);
  wire [3:0] sig_d = sig4(den[6:0]);
  wire signed [5:0] delta = $signed({1'b0, eff_exp(num[6:0])}) - $signed({1'b0, eff_exp(den[6:0])});
  wire [4:0] delta_key = delta + 6'sd15;
  wire [12:0] key = {delta_key, sig_n, sig_d};
  wire [8:0] param = param_table({sig_n, sig_d});
  wire signed [5:0] off = $signed({param[8], param[8:4]});
  wire [3:0] norm_sig = param[3:0];
  wire signed [6:0] out_exp_calc = delta + off;
  wire [6:0] formula_mag = num_zero ? 7'h00 :
    ((out_exp_calc <= 0) ? 7'h00 :
     ((out_exp_calc >= 15) ? 7'h7e : {out_exp_calc[3:0], norm_sig[2:0]}));
  wire [6:0] exc_mag = {exc_bit6(key), exc_bit5(key), exc_bit4(key), exc_bit3(key),
                        exc_bit2(key), exc_bit1(key), exc_bit0(key)};
  wire [6:0] out_mag = den_zero ? (num_zero ? 7'h7f : 7'h7e) :
                         (exc_flag(key) ? exc_mag : formula_mag);
  assign out = (nan || out_mag == 7'h7f) ? 8'h7f : {sign, out_mag};
endmodule
""".replace("@MODULE@", module).replace("@PARAMS@", "\n".join(param_entries)).replace("@FLAGS@", flag_entries).replace("@BIT_FUNCS@", "\n\n".join(bit_funcs))


def render_div_field_nested_delta(module):
    outer = []
    for delta in range(-14, 15):
        entries = []
        for sig_n in range(0, 16):
            for sig_d in range(1, 16):
                mag = div_exact_mag_from_sig_delta(sig_n, sig_d, delta)
                if mag:
                    entries.append("          8'h{0:02x}: mag_table = 7'h{1:02x};".format((sig_n << 4) | sig_d, mag))
        if entries:
            outer.append(
                "        5'd{0}: begin\n"
                "          case (sig_key)\n{1}\n"
                "            default: mag_table = 7'h00;\n"
                "          endcase\n"
                "        end".format(delta + 15, "\n".join(entries))
            )
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] den = in[15:8];
  wire [7:0] num = in[7:0];
  wire nan = (den[6:0] == 7'h7f) || (num[6:0] == 7'h7f);
  wire sign = den[7] ^ num[7];
  wire den_zero = (den[6:0] == 7'h00);
  wire num_zero = (num[6:0] == 7'h00);

  function [3:0] sig4;
    input [6:0] v;
    begin
      sig4 = (v[6:3] == 4'd0) ? {1'b0, v[2:0]} : {1'b1, v[2:0]};
    end
  endfunction

  function [4:0] eff_exp;
    input [6:0] v;
    begin
      eff_exp = (v[6:3] == 4'd0) ? 5'd1 : {1'b0, v[6:3]};
    end
  endfunction

  function [6:0] mag_table;
    input [4:0] delta_key;
    input [7:0] sig_key;
    begin
      mag_table = 7'h00;
      case (delta_key)
@OUTER@
        default: mag_table = 7'h00;
      endcase
    end
  endfunction

  wire [3:0] sig_n = sig4(num[6:0]);
  wire [3:0] sig_d = sig4(den[6:0]);
  wire signed [5:0] delta = $signed({1'b0, eff_exp(num[6:0])}) - $signed({1'b0, eff_exp(den[6:0])});
  wire [4:0] delta_key = delta + 6'sd15;
  wire [6:0] table_mag = mag_table(delta_key, {sig_n, sig_d});
  wire [6:0] out_mag = den_zero ? (num_zero ? 7'h7f : 7'h7e) : table_mag;
  assign out = (nan || out_mag == 7'h7f) ? 8'h7f : {sign, out_mag};
endmodule
""".replace("@MODULE@", module).replace("@OUTER@", "\n".join(outer))


def render_div_field_sparse_clean(module):
    table = {}
    for den in range(128):
        for num in range(128):
            if FP8.nan[num] or FP8.nan[den]:
                continue
            sig_n, eff_n = sig_eff(num)
            sig_d, eff_d = sig_eff(den)
            if sig_d == 0:
                continue
            mag = div_exact_mag_from_sig_delta(sig_n, sig_d, eff_n - eff_d)
            if mag:
                key = ((eff_n - eff_d + 15) << 8) | (sig_n << 4) | sig_d
                table[key] = mag
    entries = "\n".join(
        "        13'h{0:04x}: mag_table = 7'h{1:02x};".format(key, table[key])
        for key in sorted(table)
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

  function [3:0] sig4;
    input [6:0] v;
    begin
      sig4 = (v[6:3] == 4'd0) ? {1'b0, v[2:0]} : {1'b1, v[2:0]};
    end
  endfunction

  function [4:0] eff_exp;
    input [6:0] v;
    begin
      eff_exp = (v[6:3] == 4'd0) ? 5'd1 : {1'b0, v[6:3]};
    end
  endfunction

  function [6:0] mag_table;
    input [12:0] key;
    begin
      case (key)
@ENTRIES@
        default: mag_table = 7'h00;
      endcase
    end
  endfunction

  wire [3:0] sig_n = sig4(num[6:0]);
  wire [3:0] sig_d = sig4(den[6:0]);
  wire signed [5:0] delta = $signed({1'b0, eff_exp(num[6:0])}) - $signed({1'b0, eff_exp(den[6:0])});
  wire [4:0] delta_key = delta + 6'sd15;
  wire [6:0] table_mag = mag_table({delta_key, sig_n, sig_d});
  wire invalid = den_nan || num_nan || (den_zero && num_zero);
  wire [6:0] out_mag = den_zero ? 7'h7e : table_mag;
  assign out = invalid ? 8'h7f : {sign, out_mag};
endmodule
""".replace("@MODULE@", module).replace("@ENTRIES@", entries)


def render_fmod_modsig_table(module):
    rem_entries = []
    for delta in range(0, 15):
        for sig_n in range(0, 16):
            for sig_d in range(1, 16):
                rem = (sig_n << delta) % sig_d
                if rem:
                    key = ((delta + 15) << 8) | (sig_n << 4) | sig_d
                    rem_entries.append("        13'h{0:04x}: rem_table = 4'd{1};".format(key, rem))
    norm_entries = []
    for den_eff in range(1, 16):
        for rem_sig in range(1, 16):
            mag = norm_from_rem(rem_sig, den_eff)
            if mag:
                norm_entries.append("        8'h{0:02x}: norm_table = 7'h{1:02x};".format((den_eff << 4) | rem_sig, mag))
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [6:0] den = in[14:8];
  wire [6:0] num = in[6:0];
  wire num_sign = in[7];
  wire nan = (den == 7'h7f) || (num == 7'h7f);
  wire den_zero = (den == 7'h00);

  function [3:0] sig4;
    input [6:0] v;
    begin
      sig4 = (v[6:3] == 4'd0) ? {1'b0, v[2:0]} : {1'b1, v[2:0]};
    end
  endfunction

  function [4:0] eff_exp;
    input [6:0] v;
    begin
      eff_exp = (v[6:3] == 4'd0) ? 5'd1 : {1'b0, v[6:3]};
    end
  endfunction

  function [3:0] rem_table;
    input [12:0] key;
    begin
      case (key)
@REM_ENTRIES@
        default: rem_table = 4'd0;
      endcase
    end
  endfunction

  function [6:0] norm_table;
    input [7:0] key;
    begin
      case (key)
@NORM_ENTRIES@
        default: norm_table = 7'h00;
      endcase
    end
  endfunction

  wire [3:0] sig_n = sig4(num);
  wire [3:0] sig_d = sig4(den);
  wire [4:0] eff_n = eff_exp(num);
  wire [4:0] eff_d = eff_exp(den);
  wire signed [5:0] delta = $signed({1'b0, eff_n}) - $signed({1'b0, eff_d});
  wire [4:0] delta_key = delta + 6'sd15;
  wire [3:0] rem_sig = rem_table({delta_key, sig_n, sig_d});
  wire [6:0] table_mag = norm_table({eff_d[3:0], rem_sig});
  wire [6:0] out_mag = (delta < 0) ? num : table_mag;
  assign out = (nan || den_zero) ? 8'h7f : {num_sign, out_mag};
endmodule
""".replace("@MODULE@", module).replace("@REM_ENTRIES@", "\n".join(rem_entries)).replace("@NORM_ENTRIES@", "\n".join(norm_entries))


def render_fmod_modsig_formula_norm(module):
    rem_entries = []
    for delta in range(0, 15):
        for sig_n in range(0, 16):
            for sig_d in range(1, 16):
                rem = (sig_n << delta) % sig_d
                if rem:
                    key = ((delta + 15) << 8) | (sig_n << 4) | sig_d
                    rem_entries.append("        13'h{0:04x}: rem_table = 4'd{1};".format(key, rem))
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [6:0] den = in[14:8];
  wire [6:0] num = in[6:0];
  wire num_sign = in[7];
  wire nan = (den == 7'h7f) || (num == 7'h7f);
  wire den_zero = (den == 7'h00);

  function [3:0] sig4;
    input [6:0] v;
    begin
      sig4 = (v[6:3] == 4'd0) ? {1'b0, v[2:0]} : {1'b1, v[2:0]};
    end
  endfunction

  function [4:0] eff_exp;
    input [6:0] v;
    begin
      eff_exp = (v[6:3] == 4'd0) ? 5'd1 : {1'b0, v[6:3]};
    end
  endfunction

  function [3:0] rem_table;
    input [12:0] key;
    begin
      case (key)
@REM_ENTRIES@
        default: rem_table = 4'd0;
      endcase
    end
  endfunction

  function [6:0] norm_rem;
    input [3:0] rem_sig;
    input [4:0] den_eff;
    reg [2:0] shift;
    reg [3:0] norm_sig;
    reg signed [5:0] exp_calc;
    reg [7:0] sub_k;
    begin
      if (rem_sig == 4'd0) norm_rem = 7'h00;
      else begin
        if (rem_sig[3]) begin shift = 3'd0; norm_sig = rem_sig; end
        else if (rem_sig[2]) begin shift = 3'd1; norm_sig = rem_sig << 1; end
        else if (rem_sig[1]) begin shift = 3'd2; norm_sig = rem_sig << 2; end
        else begin shift = 3'd3; norm_sig = rem_sig << 3; end
        exp_calc = $signed({1'b0, den_eff}) - $signed({3'd0, shift});
        if (exp_calc <= 0) begin
          sub_k = rem_sig << (den_eff - 5'd1);
          norm_rem = sub_k[6:0];
        end else begin
          norm_rem = {exp_calc[3:0], norm_sig[2:0]};
        end
      end
    end
  endfunction

  wire [3:0] sig_n = sig4(num);
  wire [3:0] sig_d = sig4(den);
  wire [4:0] eff_n = eff_exp(num);
  wire [4:0] eff_d = eff_exp(den);
  wire signed [5:0] delta = $signed({1'b0, eff_n}) - $signed({1'b0, eff_d});
  wire [4:0] delta_key = delta + 6'sd15;
  wire [3:0] rem_sig = rem_table({delta_key, sig_n, sig_d});
  wire [6:0] table_mag = norm_rem(rem_sig, eff_d);
  wire [6:0] out_mag = (delta < 0) ? num : table_mag;
  assign out = (nan || den_zero) ? 8'h7f : {num_sign, out_mag};
endmodule
""".replace("@MODULE@", module).replace("@REM_ENTRIES@", "\n".join(rem_entries))


def render_fmod_modsig_nested_delta(module):
    outer = []
    for delta in range(0, 15):
        entries = []
        for sig_n in range(0, 16):
            for sig_d in range(1, 16):
                rem = (sig_n << delta) % sig_d
                if rem:
                    entries.append("          8'h{0:02x}: rem_table = 4'd{1};".format((sig_n << 4) | sig_d, rem))
        if entries:
            outer.append(
                "        5'd{0}: begin\n"
                "          case (sig_key)\n{1}\n"
                "            default: rem_table = 4'd0;\n"
                "          endcase\n"
                "        end".format(delta + 15, "\n".join(entries))
            )
    norm_entries = []
    for den_eff in range(1, 16):
        for rem_sig in range(1, 16):
            mag = norm_from_rem(rem_sig, den_eff)
            if mag:
                norm_entries.append("        8'h{0:02x}: norm_table = 7'h{1:02x};".format((den_eff << 4) | rem_sig, mag))
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [6:0] den = in[14:8];
  wire [6:0] num = in[6:0];
  wire num_sign = in[7];
  wire nan = (den == 7'h7f) || (num == 7'h7f);
  wire den_zero = (den == 7'h00);

  function [3:0] sig4;
    input [6:0] v;
    begin
      sig4 = (v[6:3] == 4'd0) ? {1'b0, v[2:0]} : {1'b1, v[2:0]};
    end
  endfunction

  function [4:0] eff_exp;
    input [6:0] v;
    begin
      eff_exp = (v[6:3] == 4'd0) ? 5'd1 : {1'b0, v[6:3]};
    end
  endfunction

  function [3:0] rem_table;
    input [4:0] delta_key;
    input [7:0] sig_key;
    begin
      rem_table = 4'd0;
      case (delta_key)
@OUTER@
        default: rem_table = 4'd0;
      endcase
    end
  endfunction

  function [6:0] norm_table;
    input [7:0] key;
    begin
      case (key)
@NORM_ENTRIES@
        default: norm_table = 7'h00;
      endcase
    end
  endfunction

  wire [3:0] sig_n = sig4(num);
  wire [3:0] sig_d = sig4(den);
  wire [4:0] eff_n = eff_exp(num);
  wire [4:0] eff_d = eff_exp(den);
  wire signed [5:0] delta = $signed({1'b0, eff_n}) - $signed({1'b0, eff_d});
  wire [4:0] delta_key = delta + 6'sd15;
  wire [3:0] rem_sig = rem_table(delta_key, {sig_n, sig_d});
  wire [6:0] table_mag = norm_table({eff_d[3:0], rem_sig});
  wire [6:0] out_mag = (delta < 0) ? num : table_mag;
  assign out = (nan || den_zero) ? 8'h7f : {num_sign, out_mag};
endmodule
""".replace("@MODULE@", module).replace("@OUTER@", "\n".join(outer)).replace("@NORM_ENTRIES@", "\n".join(norm_entries))


def render_hypot_direct_result_table(module):
    entries = []
    for maxc in range(127):
        if FP8.nan[maxc]:
            continue
        for minc in range(maxc + 1):
            if FP8.nan[minc]:
                continue
            max_sig, max_eff = sig_eff(maxc)
            min_sig, min_eff = sig_eff(minc)
            gap = max_eff - min_eff
            if gap >= 3:
                continue
            out = FP8.hypot_mag(maxc, minc)
            if out != maxc:
                key = (max_eff << 10) | (gap << 8) | (max_sig << 4) | min_sig
                entries.append("        14'h{0:04x}: result_table = 7'h{1:02x};".format(key, out))
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [6:0] ah = in[14:8];
  wire [6:0] bl = in[6:0];
  wire nan = (ah == 7'h7f) || (bl == 7'h7f);
  wire a_ge_b = (ah >= bl);
  wire [6:0] maxc = a_ge_b ? ah : bl;
  wire [6:0] minc = a_ge_b ? bl : ah;

  function [3:0] sig4;
    input [6:0] v;
    begin
      sig4 = (v[6:3] == 4'd0) ? {1'b0, v[2:0]} : {1'b1, v[2:0]};
    end
  endfunction

  function [3:0] eff_exp;
    input [6:0] v;
    begin
      eff_exp = (v[6:3] == 4'd0) ? 4'd1 : v[6:3];
    end
  endfunction

  function [6:0] result_table;
    input [13:0] key;
    begin
      case (key)
@ENTRIES@
        default: result_table = 7'h7f;
      endcase
    end
  endfunction

  wire [3:0] max_eff = eff_exp(maxc);
  wire [3:0] min_eff = eff_exp(minc);
  wire [3:0] gap_full = max_eff - min_eff;
  wire [6:0] tab = result_table({max_eff, gap_full[1:0], sig4(maxc), sig4(minc)});
  wire [6:0] out_mag = (gap_full < 4'd3 && tab != 7'h7f) ? tab : maxc;
  assign out = nan ? 8'h7f : {1'b0, out_mag};
endmodule
""".replace("@MODULE@", module).replace("@ENTRIES@", "\n".join(entries))


def hypot_delta_outputs():
    outputs = [0] * 1024
    table = {}
    for maxc in range(127):
        if FP8.nan[maxc]:
            continue
        for minc in range(maxc + 1):
            if FP8.nan[minc]:
                continue
            max_sig, max_eff = sig_eff(maxc)
            min_sig, min_eff = sig_eff(minc)
            gap = max_eff - min_eff
            if gap >= 3:
                continue
            delta = max(0, FP8.hypot_mag(maxc, minc) - maxc)
            key = (gap << 8) | (max_sig << 4) | min_sig
            table[key] = delta
    for key, delta in table.items():
        outputs[key] = delta
    return outputs


def render_hypot_delta_bdd(module, order):
    builder, roots = build_bdd(hypot_delta_outputs(), 10, 3, order)
    node_lines = []
    for node in builder.nodes:
        node_lines.append(
            "  wire n_{0} = key[{1}] ? {2} : {3};".format(
                node["id"], node["var"], edge_expr(node["high"]), edge_expr(node["low"])
            )
        )
    root_lines = ["  wire d{0} = {1};".format(bit, edge_expr(root)) for bit, root in enumerate(roots)]
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [6:0] ah = in[14:8];
  wire [6:0] bl = in[6:0];
  wire nan = (ah == 7'h7f) || (bl == 7'h7f);
  wire a_ge_b = (ah >= bl);
  wire [6:0] maxc = a_ge_b ? ah : bl;
  wire [6:0] minc = a_ge_b ? bl : ah;

  function [3:0] sig4;
    input [6:0] v;
    begin
      sig4 = (v[6:3] == 4'd0) ? {1'b0, v[2:0]} : {1'b1, v[2:0]};
    end
  endfunction

  function [3:0] eff_exp;
    input [6:0] v;
    begin
      eff_exp = (v[6:3] == 4'd0) ? 4'd1 : v[6:3];
    end
  endfunction

  wire [3:0] gap_full = eff_exp(maxc) - eff_exp(minc);
  wire gap_lt3 = gap_full < 4'd3;
  wire [9:0] key = {gap_full[1:0], sig4(maxc), sig4(minc)};
@NODES@
@ROOTS@
  wire [2:0] delta = gap_lt3 ? {d2, d1, d0} : 3'd0;
  wire [7:0] raw = {1'b0, maxc} + {5'd0, delta};
  wire [6:0] out_mag = (raw >= 8'h7e) ? 7'h7e : raw[6:0];
  assign out = nan ? 8'h7f : {1'b0, out_mag};
endmodule
""".replace("@MODULE@", module).replace("@NODES@", "\n".join(node_lines)).replace("@ROOTS@", "\n".join(root_lines))


def render_hypot_delta_bdd_keymajor(module):
    return render_hypot_delta_bdd(module, [9, 8, 7, 6, 5, 4, 3, 2, 1, 0])


def render_hypot_delta_bdd_interleave(module):
    return render_hypot_delta_bdd(module, [9, 8, 7, 3, 6, 2, 5, 1, 4, 0])


def render_hypot_delta_bdd_minfirst(module):
    return render_hypot_delta_bdd(module, [3, 2, 1, 0, 9, 8, 7, 6, 5, 4])


def hypot_delta_maxeff_outputs():
    outputs = [0] * (1 << 14)
    for maxc in range(127):
        if FP8.nan[maxc]:
            continue
        for minc in range(maxc + 1):
            if FP8.nan[minc]:
                continue
            max_sig, max_eff = sig_eff(maxc)
            min_sig, min_eff = sig_eff(minc)
            gap = max_eff - min_eff
            if gap >= 3:
                continue
            delta = max(0, FP8.hypot_mag(maxc, minc) - maxc)
            key = (max_eff << 10) | (gap << 8) | (max_sig << 4) | min_sig
            outputs[key] = delta
    return outputs


def render_hypot_delta_maxeff_bdd(module, order):
    builder, roots = build_bdd(hypot_delta_maxeff_outputs(), 14, 3, order)
    node_lines = []
    for node in builder.nodes:
        node_lines.append(
            "  wire n_{0} = key[{1}] ? {2} : {3};".format(
                node["id"], node["var"], edge_expr(node["high"]), edge_expr(node["low"])
            )
        )
    root_lines = ["  wire d{0} = {1};".format(bit, edge_expr(root)) for bit, root in enumerate(roots)]
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [6:0] ah = in[14:8];
  wire [6:0] bl = in[6:0];
  wire nan = (ah == 7'h7f) || (bl == 7'h7f);
  wire a_ge_b = (ah >= bl);
  wire [6:0] maxc = a_ge_b ? ah : bl;
  wire [6:0] minc = a_ge_b ? bl : ah;

  function [3:0] sig4;
    input [6:0] v;
    begin
      sig4 = (v[6:3] == 4'd0) ? {1'b0, v[2:0]} : {1'b1, v[2:0]};
    end
  endfunction

  function [3:0] eff_exp;
    input [6:0] v;
    begin
      eff_exp = (v[6:3] == 4'd0) ? 4'd1 : v[6:3];
    end
  endfunction

  wire [3:0] max_eff = eff_exp(maxc);
  wire [3:0] min_eff = eff_exp(minc);
  wire [3:0] gap_full = max_eff - min_eff;
  wire [13:0] key = {max_eff, gap_full[1:0], sig4(maxc), sig4(minc)};
@NODES@
@ROOTS@
  wire [2:0] delta = (gap_full < 4'd3) ? {d2, d1, d0} : 3'd0;
  wire [7:0] raw = {1'b0, maxc} + {5'd0, delta};
  wire [6:0] out_mag = (raw >= 8'h7e) ? 7'h7e : raw[6:0];
  assign out = nan ? 8'h7f : {1'b0, out_mag};
endmodule
""".replace("@MODULE@", module).replace("@NODES@", "\n".join(node_lines)).replace("@ROOTS@", "\n".join(root_lines))


def render_hypot_delta_maxeff_bdd_expfirst(module):
    return render_hypot_delta_maxeff_bdd(module, [13, 12, 11, 10, 9, 8, 7, 3, 6, 2, 5, 1, 4, 0])


def render_hypot_delta_maxeff_bdd_sigfirst(module):
    return render_hypot_delta_maxeff_bdd(module, [7, 3, 6, 2, 5, 1, 4, 0, 13, 12, 11, 10, 9, 8])


def render_hypot_threshold_packed(module):
    table = {}
    for maxc in range(127):
        if FP8.nan[maxc]:
            continue
        for minc in range(maxc + 1):
            if FP8.nan[minc]:
                continue
            max_sig, max_eff = sig_eff(maxc)
            min_sig, min_eff = sig_eff(minc)
            gap = max_eff - min_eff
            if gap >= 3:
                continue
            key = (gap, max_sig, min_sig)
            delta = max(0, FP8.hypot_mag(maxc, minc) - maxc)
            table.setdefault(key, delta)

    groups = {}
    for (gap, max_sig, min_sig), delta in table.items():
        groups.setdefault((gap, max_sig), {})[min_sig] = delta

    entries = []
    for key, vals in sorted(groups.items()):
        valid = 0
        thresholds = []
        for level in range(1, 6):
            candidates = [min_sig for min_sig, delta in vals.items() if delta >= level]
            if candidates:
                valid |= 1 << (level - 1)
                thresholds.append(min(candidates))
            else:
                thresholds.append(0)
        if valid:
            payload = valid
            shift = 5
            for threshold in thresholds:
                payload |= threshold << shift
                shift += 4
            entries.append(
                "        6'h{0:02x}: threshold_pack = 25'h{1:07x};".format(
                    (key[0] << 4) | key[1],
                    payload,
                )
            )

    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [6:0] ah = in[14:8];
  wire [6:0] bl = in[6:0];
  wire nan = (ah == 7'h7f) || (bl == 7'h7f);
  wire a_ge_b = (ah >= bl);
  wire [6:0] maxc = a_ge_b ? ah : bl;
  wire [6:0] minc = a_ge_b ? bl : ah;

  function [3:0] sig4;
    input [6:0] v;
    begin
      sig4 = (v[6:3] == 4'd0) ? {1'b0, v[2:0]} : {1'b1, v[2:0]};
    end
  endfunction

  function [3:0] eff_exp;
    input [6:0] v;
    begin
      eff_exp = (v[6:3] == 4'd0) ? 4'd1 : v[6:3];
    end
  endfunction

  function [24:0] threshold_pack;
    input [5:0] key;
    begin
      case (key)
@ENTRIES@
        default: threshold_pack = 25'h0;
      endcase
    end
  endfunction

  wire [3:0] max_eff = eff_exp(maxc);
  wire [3:0] min_eff = eff_exp(minc);
  wire [3:0] gap_full = max_eff - min_eff;
  wire [1:0] gap = gap_full[1:0];
  wire [3:0] max_sig = sig4(maxc);
  wire [3:0] min_sig = sig4(minc);
  wire [24:0] pack = threshold_pack({gap, max_sig});
  wire c1 = pack[0] && (min_sig >= pack[8:5]);
  wire c2 = pack[1] && (min_sig >= pack[12:9]);
  wire c3 = pack[2] && (min_sig >= pack[16:13]);
  wire c4 = pack[3] && (min_sig >= pack[20:17]);
  wire c5 = pack[4] && (min_sig >= pack[24:21]);
  wire [2:0] delta = (gap_full < 4'd3) ? ({2'd0,c1} + {2'd0,c2} + {2'd0,c3} + {2'd0,c4} + {2'd0,c5}) : 3'd0;
  wire [7:0] raw = {1'b0, maxc} + {5'd0, delta};
  wire [6:0] out_mag = (raw >= 8'h7e) ? 7'h7e : raw[6:0];
  assign out = nan ? 8'h7f : {1'b0, out_mag};
endmodule
""".replace("@MODULE@", module).replace("@ENTRIES@", "\n".join(entries))


def render_hypot_threshold_maxeff_packed(module):
    table = {}
    for maxc in range(127):
        if FP8.nan[maxc]:
            continue
        for minc in range(maxc + 1):
            if FP8.nan[minc]:
                continue
            max_sig, max_eff = sig_eff(maxc)
            min_sig, min_eff = sig_eff(minc)
            gap = max_eff - min_eff
            if gap >= 3:
                continue
            key = (max_eff, gap, max_sig)
            delta = max(0, FP8.hypot_mag(maxc, minc) - maxc)
            table.setdefault(key, {})[min_sig] = delta

    entries = []
    for (max_eff, gap, max_sig), vals in sorted(table.items()):
        valid = 0
        thresholds = []
        for level in range(1, 6):
            candidates = [min_sig for min_sig, delta in vals.items() if delta >= level]
            if candidates:
                valid |= 1 << (level - 1)
                thresholds.append(min(candidates))
            else:
                thresholds.append(0)
        if valid:
            payload = valid
            shift = 5
            for threshold in thresholds:
                payload |= threshold << shift
                shift += 4
            entries.append(
                "        10'h{0:03x}: threshold_pack = 25'h{1:07x};".format(
                    (max_eff << 6) | (gap << 4) | max_sig,
                    payload,
                )
            )

    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [6:0] ah = in[14:8];
  wire [6:0] bl = in[6:0];
  wire nan = (ah == 7'h7f) || (bl == 7'h7f);
  wire a_ge_b = (ah >= bl);
  wire [6:0] maxc = a_ge_b ? ah : bl;
  wire [6:0] minc = a_ge_b ? bl : ah;

  function [3:0] sig4;
    input [6:0] v;
    begin
      sig4 = (v[6:3] == 4'd0) ? {1'b0, v[2:0]} : {1'b1, v[2:0]};
    end
  endfunction

  function [3:0] eff_exp;
    input [6:0] v;
    begin
      eff_exp = (v[6:3] == 4'd0) ? 4'd1 : v[6:3];
    end
  endfunction

  function [24:0] threshold_pack;
    input [9:0] key;
    begin
      case (key)
@ENTRIES@
        default: threshold_pack = 25'h0;
      endcase
    end
  endfunction

  wire [3:0] max_eff = eff_exp(maxc);
  wire [3:0] min_eff = eff_exp(minc);
  wire [3:0] gap_full = max_eff - min_eff;
  wire [1:0] gap = gap_full[1:0];
  wire [3:0] max_sig = sig4(maxc);
  wire [3:0] min_sig = sig4(minc);
  wire [24:0] pack = threshold_pack({max_eff, gap, max_sig});
  wire c1 = pack[0] && (min_sig >= pack[8:5]);
  wire c2 = pack[1] && (min_sig >= pack[12:9]);
  wire c3 = pack[2] && (min_sig >= pack[16:13]);
  wire c4 = pack[3] && (min_sig >= pack[20:17]);
  wire c5 = pack[4] && (min_sig >= pack[24:21]);
  wire [2:0] delta = (gap_full < 4'd3) ? ({2'd0,c1} + {2'd0,c2} + {2'd0,c3} + {2'd0,c4} + {2'd0,c5}) : 3'd0;
  wire [7:0] raw = {1'b0, maxc} + {5'd0, delta};
  wire [6:0] out_mag = (raw >= 8'h7e) ? 7'h7e : raw[6:0];
  assign out = nan ? 8'h7f : {1'b0, out_mag};
endmodule
""".replace("@MODULE@", module).replace("@ENTRIES@", "\n".join(entries))


VARIANTS = [
    ("ex240", "semantic_add_sigalg_norm", render_add_sigalg_norm, "add via aligned 4-bit significands and local normalizer"),
    ("ex240", "semantic_add_sigalg_norm9_clamped", render_add_sigalg_norm9_clamped, "add via gap-clamped 9-bit significand normalizer"),
    ("ex240", "semantic_add_sigalg_norm9_param", render_add_sigalg_norm9_param, "add via gap-clamped 9-bit significand normalizer with local param table"),
    ("ex240", "semantic_add_sigalg_norm9_param_parallel", render_add_sigalg_norm9_param_parallel, "add norm9 param table with parallel_case source hints"),
    ("ex240", "semantic_add_same_delta_diff_param8", render_add_same_delta_diff_param8, "add same-sign delta table plus compact diff normalizer"),
    ("ex240", "semantic_add_same_delta_diff_param8_parallel", render_add_same_delta_diff_param8_parallel, "add hybrid diff param table with parallel_case source hints"),
    ("ex240", "semantic_add_same_delta_diff_direct8", render_add_same_delta_diff_direct8, "add same-sign delta table plus direct compact diff table"),
    ("ex240", "semantic_add_same_grs_diff_param8", render_add_same_grs_diff_param8, "add same-sign GRS formula plus compact diff normalizer"),
    ("ex240", "semantic_add_same_grs_diff_param8_parallel", render_add_same_grs_diff_param8_parallel, "add same-sign GRS formula plus compact diff normalizer with parallel_case source hints"),
    ("ex240", "semantic_add_same_grs_diff_grs", render_add_same_grs_diff_grs, "add same-sign GRS formula plus diff GRS normalizer"),
    ("ex240", "semantic_add_same_grs_diff_grs_parallel", render_add_same_grs_diff_grs_parallel, "add same-sign GRS formula plus diff GRS normalizer with parallel_case source hints"),
    ("ex240", "semantic_add_nested_gap", render_add_nested_gap, "add nested table by gap/max exponent and significand pair"),
    ("ex240", "semantic_add_magnitude_bdd_exp_sign_mid", render_add_magnitude_bdd_exp_sign_mid, "add semantic sign formula plus magnitude-only BDD with sign in middle"),
    ("ex240", "semantic_add_magnitude_bdd_exp_sign_late", render_add_magnitude_bdd_exp_sign_late, "add semantic sign formula plus magnitude-only BDD with sign late"),
    ("ex240", "semantic_add_magnitude_bdd_sign_first", render_add_magnitude_bdd_sign_first, "add semantic sign formula plus magnitude-only BDD with sign first"),
    ("ex241", "semantic_mul_product_param_exception", render_mul_product_param_exception, "multiply product-param default plus exact exceptions"),
    ("ex241", "semantic_mul_product_bit_exception", render_mul_product_bit_exception, "multiply product-param default plus per-bit exception overlay"),
    ("ex241", "semantic_mul_product_nested_exp", render_mul_product_nested_exp, "multiply nested table: exponent sum then 4x4 product"),
    ("ex242", "semantic_div_formula_bit_exception", render_div_formula_bit_exception, "division compact formula plus per-bit exception overlay"),
    ("ex242", "semantic_div_field_nested_delta", render_div_field_nested_delta, "division nested table: exponent delta then significand pair"),
    ("ex242", "semantic_div_field_sparse_clean", render_div_field_sparse_clean, "division sparse field table with simplified special path"),
    ("ex243", "semantic_fmod_modsig_table", render_fmod_modsig_table, "fmod via significand modular residue table and small rem normalizer"),
    ("ex243", "semantic_fmod_modsig_formula_norm", render_fmod_modsig_formula_norm, "fmod via significand modular residue table and formula normalizer"),
    ("ex243", "semantic_fmod_modsig_nested_delta", render_fmod_modsig_nested_delta, "fmod nested table: exponent delta then modular significand residue"),
    ("ex244", "semantic_hypot_direct_result_table", render_hypot_direct_result_table, "hypot direct result table for small exponent gaps"),
    ("ex244", "semantic_hypot_delta_bdd_keymajor", render_hypot_delta_bdd_keymajor, "hypot max plus delta-only BDD ordered by gap/max/min bits"),
    ("ex244", "semantic_hypot_delta_bdd_interleave", render_hypot_delta_bdd_interleave, "hypot max plus delta-only BDD with max/min bit interleave"),
    ("ex244", "semantic_hypot_delta_bdd_minfirst", render_hypot_delta_bdd_minfirst, "hypot max plus delta-only BDD with min threshold bits first"),
    ("ex244", "semantic_hypot_threshold_packed", render_hypot_threshold_packed, "hypot threshold pack with parallel threshold comparisons"),
    ("ex244", "semantic_hypot_threshold_maxeff_packed", render_hypot_threshold_maxeff_packed, "hypot exact max-eff threshold pack"),
    ("ex244", "semantic_hypot_delta_maxeff_bdd_expfirst", render_hypot_delta_maxeff_bdd_expfirst, "hypot max plus exact max-exp/gap/sig delta BDD"),
    ("ex244", "semantic_hypot_delta_maxeff_bdd_sigfirst", render_hypot_delta_maxeff_bdd_sigfirst, "hypot max plus exact max-exp/gap/sig delta BDD with sig-first order"),
]


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


def run_variant(args, refs, case, variant, renderer, note):
    rows = []
    module = "{0}_{1}".format(case, variant)
    verilog_path = args.work_dir / case / "verilog" / "{0}.v".format(module)
    write_text(verilog_path, renderer(module))
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

Purpose: arithmetic-structure FP8 frontend experiments for ex240-ex244; no seed curation.

Artifacts:
- Work directory: `{work_dir}`
- Candidates CSV: `{results_dir}/candidates.csv`
- Best CSV: `{results_dir}/best.csv`

Methods tried:
- ex240 aligned significand add/sub normalizer.
- ex241 product-param default plus exact exceptions.
- ex242 per-bit exception overlay around compact division formula.
- ex243 significand modular-residue fmod structure.

Best result: see `results/best.csv`.
""".format(run_id=args.run_id, work_dir=rel_path(args.work_dir), results_dir=rel_path(args.results_dir))
    write_text(args.results_dir.parent / "MANIFEST.md", text)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--run-id", required=True)
    parser.add_argument("--cases", default="ex240,ex241,ex242,ex243")
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
    selected = set(x.strip() for x in args.cases.split(",") if x.strip())
    rows = []
    for case, variant, renderer, note in VARIANTS:
        if case not in selected:
            continue
        rows.extend(run_variant(args, refs, case, variant, renderer, note))
    best = {}
    for row in rows:
        if row.get("equivalent") != "1" or not row.get("adp"):
            continue
        old = best.get(row["case"])
        if old is None or int(row["adp"]) < int(old["adp"]):
            best[row["case"]] = row
    write_csv(args.results_dir / "candidates.csv", RESULT_FIELDNAMES, rows)
    write_csv(args.results_dir / "evaluate_check.csv", RESULT_FIELDNAMES, rows)
    write_csv(args.results_dir / "best.csv", BEST_FIELDNAMES, list(best.values()))
    write_csv(args.results_dir / "summary.csv", BEST_FIELDNAMES, list(best.values()))
    write_manifest(args, rows)


if __name__ == "__main__":
    main()
