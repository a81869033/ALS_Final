#!/usr/bin/env python3
"""Deeper frontend-only FP8 structures for ex240-ex244.

This script is intentionally narrow: it keeps candidates in work/runs, avoids
seed curation, and tries source-level structures that are more semantic than
the first ex240-ex244 pass.
"""

import argparse
import csv
import json
import math
import subprocess
import sys
import time
from collections import Counter
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from student.backends.abc_flow import evaluate_aig
from student.frontends.yosys_synth import SynthError, run_command, yosys_quote
from student.generators.fp8_ex240_ex244_frontend import (
    BEST_FIELDNAMES,
    RESULT_FIELDNAMES,
    CASE_LABELS,
    FP8,
    add_reference_columns,
    load_reference,
    rel_path,
    script_default,
    write_csv,
    write_text,
)


SYNTH_VARIANTS = [
    ("default", lambda v, m, o: script_default(v, m, o, "AND", False)),
    ("abc_g_aig", lambda v, m, o: script_default(v, m, o, "aig", False)),
    ("synth_preset", lambda v, m, o: script_default(v, m, o, "AND", True)),
    ("synth_preset_aig", lambda v, m, o: script_default(v, m, o, "aig", True)),
]


def sig_eff(code):
    exp = (code >> 3) & 0xF
    mant = code & 0x7
    if exp == 0:
        return mant, 1
    return 8 + mant, exp


def hypot_base_delta_entries():
    base = {}
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
            out = FP8.hypot_mag(maxc, minc)
            base.setdefault(key, max(0, out - maxc))
    rows = []
    for (gap, max_sig, min_sig), delta in sorted(base.items()):
        if delta:
            key = (gap << 8) | (max_sig << 4) | min_sig
            rows.append((key, delta))
    return rows


def render_hypot_sig_gap_delta(module):
    entries = "\n".join(
        "        10'h{0:03x}: delta_table = 3'd{1};".format(key, delta)
        for key, delta in hypot_base_delta_entries()
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

  function [2:0] delta_table;
    input [9:0] key;
    begin
      case (key)
@ENTRIES@
        default: delta_table = 3'd0;
      endcase
    end
  endfunction

  wire [3:0] max_exp = eff_exp(maxc);
  wire [3:0] min_exp = eff_exp(minc);
  wire [3:0] gap_full = max_exp - min_exp;
  wire gap_lt3 = gap_full < 4'd3;
  wire [1:0] gap = gap_full[1:0];
  wire [2:0] delta = gap_lt3 ? delta_table({gap, sig4(maxc), sig4(minc)}) : 3'd0;
  wire [7:0] raw = {1'b0, maxc} + {5'd0, delta};
  wire [6:0] out_mag = (raw >= 8'h7e) ? 7'h7e : raw[6:0];
  assign out = nan ? 8'h7f : {1'b0, out_mag};
endmodule
""".replace("@MODULE@", module).replace("@ENTRIES@", entries)


def hypot_threshold_blocks():
    base = {}
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
            key = (gap, max_sig)
            out = FP8.hypot_mag(maxc, minc)
            base.setdefault(key, {}).setdefault(min_sig, max(0, out - maxc))
    blocks = []
    for key in sorted(base):
        items = sorted(base[key].items())
        if not any(delta for _, delta in items):
            continue
        runs = []
        start_sig, cur_delta = items[0]
        prev_sig = start_sig
        for min_sig, delta in items[1:]:
            if delta != cur_delta or min_sig != prev_sig + 1:
                if cur_delta:
                    runs.append((start_sig, prev_sig, cur_delta))
                start_sig = min_sig
                cur_delta = delta
            prev_sig = min_sig
        if cur_delta:
            runs.append((start_sig, prev_sig, cur_delta))
        if not runs:
            continue
        gap, max_sig = key
        lines = ["        6'h{0:02x}: begin".format((gap << 4) | max_sig)]
        for lo, hi, delta in runs:
            if lo == 0:
                cond = "min_sig <= 4'd{0}".format(hi)
            elif hi == 15:
                cond = "min_sig >= 4'd{0}".format(lo)
            elif lo == hi:
                cond = "min_sig == 4'd{0}".format(lo)
            else:
                cond = "min_sig >= 4'd{0} && min_sig <= 4'd{1}".format(lo, hi)
            lines.append("          if ({0}) delta_threshold = 3'd{1};".format(cond, delta))
        lines.append("        end")
        blocks.extend(lines)
    return "\n".join(blocks)


def render_hypot_sig_gap_threshold(module):
    blocks = hypot_threshold_blocks()
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

  wire [3:0] max_exp = eff_exp(maxc);
  wire [3:0] min_exp = eff_exp(minc);
  wire [3:0] gap_full = max_exp - min_exp;
  wire [1:0] gap = gap_full[1:0];
  wire [3:0] max_sig = sig4(maxc);
  wire [3:0] min_sig = sig4(minc);

  reg [2:0] delta_threshold;
  always @* begin
    delta_threshold = 3'd0;
    if (gap_full < 4'd3) begin
      case ({gap, max_sig})
@BLOCKS@
        default: delta_threshold = 3'd0;
      endcase
    end
  end

  wire [7:0] raw = {1'b0, maxc} + {5'd0, delta_threshold};
  wire [6:0] out_mag = (raw >= 8'h7e) ? 7'h7e : raw[6:0];
  assign out = nan ? 8'h7f : {1'b0, out_mag};
endmodule
""".replace("@MODULE@", module).replace("@BLOCKS@", blocks)


def hypot_orbit_conditions():
    base = {}
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
            base.setdefault((gap, max_sig, min_sig), max(0, out - maxc))
    terms = {0: [], 1: [], 2: []}
    for (gap, max_sig, min_sig), delta in sorted(base.items()):
        if not delta:
            continue
        cond = "(gap == 2'd{0} && max_sig == 4'd{1} && min_sig == 4'd{2})".format(gap, max_sig, min_sig)
        for bit in range(3):
            if (delta >> bit) & 1:
                terms[bit].append(cond)
    return terms


def render_hypot_sig_gap_orbits(module):
    terms = hypot_orbit_conditions()
    assigns = []
    for bit in range(3):
        if terms[bit]:
            assigns.append("  wire d{0} = ".format(bit) + "\n    ".join(("1'b0",) + tuple("| " + term for term in terms[bit])) + ";")
        else:
            assigns.append("  wire d{0} = 1'b0;".format(bit))
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
  wire [1:0] gap = gap_full[1:0];
  wire [3:0] max_sig = sig4(maxc);
  wire [3:0] min_sig = sig4(minc);

@ASSIGNS@

  wire [2:0] delta = gap_lt3 ? {d2, d1, d0} : 3'd0;
  wire [7:0] raw = {1'b0, maxc} + {5'd0, delta};
  wire [6:0] out_mag = (raw >= 8'h7e) ? 7'h7e : raw[6:0];
  assign out = nan ? 8'h7f : {1'b0, out_mag};
endmodule
""".replace("@MODULE@", module).replace("@ASSIGNS@", "\n".join(assigns))


def same_add_delta_entries():
    base = {}
    for maxc in range(127):
        if FP8.nan[maxc]:
            continue
        for minc in range(maxc + 1):
            if FP8.nan[minc]:
                continue
            max_sig, max_eff = sig_eff(maxc)
            min_sig, min_eff = sig_eff(minc)
            gap = max_eff - min_eff
            key = (gap, max_sig, min_sig)
            out = FP8.quant_mag_rational(FP8.k[maxc] + FP8.k[minc])
            base.setdefault(key, max(0, out - maxc))
    rows = []
    for (gap, max_sig, min_sig), delta in sorted(base.items()):
        if delta:
            key = (gap << 8) | (max_sig << 4) | min_sig
            rows.append((key, delta))
    return rows


def render_add_same_delta_diff_norm(module):
    same_entries = "\n".join(
        "        12'h{0:03x}: same_delta_table = 4'd{1};".format(key, delta)
        for key, delta in same_add_delta_entries()
    )
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] a = in[15:8];
  wire [7:0] b = in[7:0];
  wire [6:0] am = a[6:0];
  wire [6:0] bm = b[6:0];
  wire nan = (am == 7'h7f) || (bm == 7'h7f);
  wire same_sign = a[7] == b[7];
  wire a_ge_b = (am >= bm);
  wire [6:0] maxc = a_ge_b ? am : bm;
  wire [6:0] minc = a_ge_b ? bm : am;
  wire out_sign_diff = (maxc == minc) ? 1'b0 : (a_ge_b ? a[7] : b[7]);

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

  function [17:0] fp8_mag;
    input [6:0] v;
    begin
      if (v[6:3] == 4'd0) fp8_mag = {15'd0, v[2:0]};
      else fp8_mag = ({11'd0, 1'b1, v[2:0]}) << (v[6:3] - 4'd1);
    end
  endfunction

  function [3:0] same_delta_table;
    input [11:0] key;
    begin
      case (key)
@SAME_ENTRIES@
        default: same_delta_table = 4'd0;
      endcase
    end
  endfunction

  function [6:0] quant_norm;
    input [18:0] mag;
    reg [4:0] exp;
    reg [4:0] shift;
    reg [4:0] base;
    reg [18:0] rem;
    reg [18:0] half;
    reg round_up;
    reg [4:0] sig;
    begin
      if (mag == 19'd0) quant_norm = 7'h00;
      else if (mag <= 19'd7) quant_norm = mag[6:0];
      else begin
        if (mag[18]) begin exp = 5'd16; shift = 5'd15; end
        else if (mag[17]) begin exp = 5'd15; shift = 5'd14; end
        else if (mag[16]) begin exp = 5'd14; shift = 5'd13; end
        else if (mag[15]) begin exp = 5'd13; shift = 5'd12; end
        else if (mag[14]) begin exp = 5'd12; shift = 5'd11; end
        else if (mag[13]) begin exp = 5'd11; shift = 5'd10; end
        else if (mag[12]) begin exp = 5'd10; shift = 5'd9; end
        else if (mag[11]) begin exp = 5'd9; shift = 5'd8; end
        else if (mag[10]) begin exp = 5'd8; shift = 5'd7; end
        else if (mag[9]) begin exp = 5'd7; shift = 5'd6; end
        else if (mag[8]) begin exp = 5'd6; shift = 5'd5; end
        else if (mag[7]) begin exp = 5'd5; shift = 5'd4; end
        else if (mag[6]) begin exp = 5'd4; shift = 5'd3; end
        else if (mag[5]) begin exp = 5'd3; shift = 5'd2; end
        else if (mag[4]) begin exp = 5'd2; shift = 5'd1; end
        else begin exp = 5'd1; shift = 5'd0; end
        base = mag >> shift;
        if (shift == 5'd0) round_up = 1'b0;
        else begin
          rem = mag - ({14'd0, base} << shift);
          half = 19'd1 << (shift - 5'd1);
          round_up = (rem > half) || ((rem == half) && base[0]);
        end
        sig = base + {4'd0, round_up};
        if (sig >= 5'd16) begin exp = exp + 5'd1; sig = 5'd8; end
        if ((exp > 5'd15) || ((exp == 5'd15) && (sig >= 5'd15))) quant_norm = 7'h7e;
        else quant_norm = {exp[3:0], sig[2:0]};
      end
    end
  endfunction

  wire [3:0] gap = eff_exp(maxc) - eff_exp(minc);
  wire [3:0] sd = same_delta_table({gap, sig4(maxc), sig4(minc)});
  wire [7:0] same_raw = {1'b0, maxc} + {4'd0, sd};
  wire [6:0] same_mag = (same_raw >= 8'h7e) ? 7'h7e : same_raw[6:0];
  wire [18:0] diff_mag_int = {1'b0, fp8_mag(maxc)} - {1'b0, fp8_mag(minc)};
  wire [6:0] diff_mag = quant_norm(diff_mag_int);
  wire neg_zero = (am == 7'h00) && (bm == 7'h00) && a[7] && b[7];
  wire out_sign = same_sign ? (same_mag == 7'h00 ? neg_zero : a[7]) : out_sign_diff;
  wire [6:0] out_mag = same_sign ? same_mag : diff_mag;
  assign out = nan ? 8'h7f : {out_sign, out_mag};
endmodule
""".replace("@MODULE@", module).replace("@SAME_ENTRIES@", same_entries)


def add_diff_correction_entries():
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
            exact = FP8.quant_mag_rational(FP8.k[maxc] - FP8.k[minc])
            default = 0 if maxc == minc else maxc
            if exact != default:
                key = (gap << 12) | (max_eff << 8) | (max_sig << 4) | min_sig
                entries.append((key, exact))
    return entries


def render_add_field_delta(module):
    same_entries = "\n".join(
        "        12'h{0:03x}: same_delta_table = 4'd{1};".format(key, delta)
        for key, delta in same_add_delta_entries()
    )
    diff_entries = "\n".join(
        "        16'h{0:04x}: diff_table = 7'h{1:02x};".format(key, mag)
        for key, mag in add_diff_correction_entries()
    )
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] a = in[15:8];
  wire [7:0] b = in[7:0];
  wire [6:0] am = a[6:0];
  wire [6:0] bm = b[6:0];
  wire nan = (am == 7'h7f) || (bm == 7'h7f);
  wire same_sign = a[7] == b[7];
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

  function [3:0] same_delta_table;
    input [11:0] key;
    begin
      case (key)
@SAME_ENTRIES@
        default: same_delta_table = 4'd0;
      endcase
    end
  endfunction

  function [6:0] diff_table;
    input [15:0] key;
    begin
      case (key)
@DIFF_ENTRIES@
        default: diff_table = 7'h7f;
      endcase
    end
  endfunction

  wire [3:0] max_exp = eff_exp(maxc);
  wire [3:0] min_exp = eff_exp(minc);
  wire [3:0] gap = max_exp - min_exp;
  wire [3:0] max_sig = sig4(maxc);
  wire [3:0] min_sig = sig4(minc);
  wire [3:0] sd = same_delta_table({gap, max_sig, min_sig});
  wire [7:0] same_raw = {1'b0, maxc} + {4'd0, sd};
  wire [6:0] same_mag = (same_raw >= 8'h7e) ? 7'h7e : same_raw[6:0];
  wire [6:0] diff_default = (maxc == minc) ? 7'h00 : maxc;
  wire [6:0] diff_corr = diff_table({gap, max_exp, max_sig, min_sig});
  wire [6:0] diff_mag = (diff_corr == 7'h7f) ? diff_default : diff_corr;
  wire neg_zero = (am == 7'h00) && (bm == 7'h00) && a[7] && b[7];
  wire diff_sign = (diff_mag == 7'h00) ? 1'b0 : (a_ge_b ? a[7] : b[7]);
  wire out_sign = same_sign ? ((same_mag == 7'h00) ? neg_zero : a[7]) : diff_sign;
  wire [6:0] out_mag = same_sign ? same_mag : diff_mag;
  assign out = nan ? 8'h7f : {out_sign, out_mag};
endmodule
""".replace("@MODULE@", module).replace("@SAME_ENTRIES@", same_entries).replace("@DIFF_ENTRIES@", diff_entries)


def round_even_expr(num, shift):
    raise NotImplementedError


def mul_formula_exception_entries():
    def round_even(num, shift):
        if shift <= 0:
            return num << (-shift)
        base = num >> shift
        rem = num - (base << shift)
        half = 1 << (shift - 1)
        return base + (1 if rem > half or (rem == half and (base & 1)) else 0)

    def norm_from_k(k):
        if k <= 0:
            return 0
        if k <= 7:
            return k
        leading = k.bit_length() - 1
        exp = leading - 2
        shift = leading - 3
        base = round_even(k, shift)
        if base >= 16:
            base = 8
            exp += 1
        if exp > 15 or (exp == 15 and base >= 15):
            return 0x7E
        if exp <= 0:
            return min(k, 7)
        return (exp << 3) | (base - 8)

    def formula(exp_sum, prod):
        if prod == 0:
            return 0
        if exp_sum <= 11:
            return norm_from_k(round_even(prod, 11 - exp_sum))
        leading = prod.bit_length() - 1
        exp = exp_sum + leading - 13
        if exp <= 0:
            return norm_from_k(round_even(prod, 11 - exp_sum))
        shift = leading - 3
        base = round_even(prod, shift)
        if base >= 16:
            base = 8
            exp += 1
        if exp > 15 or (exp == 15 and base >= 15):
            return 0x7E
        return (exp << 3) | (base - 8)

    exceptions = {}
    for a in range(128):
        for b in range(128):
            if FP8.nan[a] or FP8.nan[b]:
                continue
            sig_a, eff_a = sig_eff(a)
            sig_b, eff_b = sig_eff(b)
            prod = sig_a * sig_b
            exp_sum = eff_a + eff_b
            exact = FP8.quant_mag_rational(FP8.k[a] * FP8.k[b], 512)
            pred = formula(exp_sum, prod)
            if pred != exact:
                exceptions[(exp_sum, prod)] = exact
    return sorted(exceptions.items())


def render_mul_product_formula_exception(module):
    entries = "\n".join(
        "        13'h{0:04x}: exception_mag = 7'h{1:02x};".format((exp_sum << 8) | prod, mag)
        for (exp_sum, prod), mag in mul_formula_exception_entries()
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

  function [6:0] norm_from_k;
    input [7:0] k;
    reg [3:0] exp;
    reg [2:0] shift;
    reg [4:0] base;
    reg [7:0] rem;
    reg [7:0] half;
    reg round_up;
    reg [4:0] sig;
    begin
      if (k == 8'd0) norm_from_k = 7'h00;
      else if (k <= 8'd7) norm_from_k = k[6:0];
      else begin
        if (k[7]) begin exp = 4'd5; shift = 3'd4; end
        else if (k[6]) begin exp = 4'd4; shift = 3'd3; end
        else if (k[5]) begin exp = 4'd3; shift = 3'd2; end
        else if (k[4]) begin exp = 4'd2; shift = 3'd1; end
        else begin exp = 4'd1; shift = 3'd0; end
        base = k >> shift;
        if (shift == 3'd0) round_up = 1'b0;
        else begin
          rem = k - ({3'd0, base} << shift);
          half = 8'd1 << (shift - 3'd1);
          round_up = (rem > half) || ((rem == half) && base[0]);
        end
        sig = base + {4'd0, round_up};
        if (sig >= 5'd16) begin sig = 5'd8; exp = exp + 4'd1; end
        norm_from_k = {exp, sig[2:0]};
      end
    end
  endfunction

  function [6:0] exception_mag;
    input [12:0] key;
    begin
      case (key)
@ENTRIES@
        default: exception_mag = 7'h7f;
      endcase
    end
  endfunction

  wire [7:0] prod = sig4(am) * sig4(bm);
  wire [4:0] exp_sum = eff_exp(am) + eff_exp(bm);
  reg [2:0] lead;
  always @* begin
    if (prod[7]) lead = 3'd7;
    else if (prod[6]) lead = 3'd6;
    else if (prod[5]) lead = 3'd5;
    else if (prod[4]) lead = 3'd4;
    else if (prod[3]) lead = 3'd3;
    else if (prod[2]) lead = 3'd2;
    else if (prod[1]) lead = 3'd1;
    else lead = 3'd0;
  end

  wire small = exp_sum <= 5'd11;
  wire [3:0] small_shift = 5'd11 - exp_sum;
  wire [7:0] small_base = (small_shift > 4'd8) ? 8'd0 : (prod >> small_shift);
  wire [7:0] small_rem = (small_shift == 4'd0 || small_shift > 4'd8) ? 8'd0 : (prod - (small_base << small_shift));
  wire [7:0] small_half = (small_shift == 4'd0 || small_shift > 4'd8) ? 8'd0 : (8'd1 << (small_shift - 4'd1));
  wire small_round = (small_shift != 4'd0) && (small_shift <= 4'd8) &&
                     ((small_rem > small_half) || ((small_rem == small_half) && small_base[0]));
  wire [7:0] small_k = small_base + {7'd0, small_round};

  wire signed [5:0] exp_calc = $signed({1'b0, exp_sum}) + $signed({3'd0, lead}) - 6'sd13;
  wire norm_right = lead >= 3'd3;
  wire [2:0] norm_shift = norm_right ? (lead - 3'd3) : (3'd3 - lead);
  wire [4:0] norm_base = norm_right ? (prod >> norm_shift) : (prod << norm_shift);
  wire [7:0] norm_rem = (!norm_right || norm_shift == 3'd0) ? 8'd0 : (prod - ({3'd0, norm_base} << norm_shift));
  wire [7:0] norm_half = (!norm_right || norm_shift == 3'd0) ? 8'd0 : (8'd1 << (norm_shift - 3'd1));
  wire norm_round = norm_right && (norm_shift != 3'd0) && ((norm_rem > norm_half) || ((norm_rem == norm_half) && norm_base[0]));
  wire [4:0] norm_sig_pre = norm_base + {4'd0, norm_round};
  wire carry = norm_sig_pre >= 5'd16;
  wire signed [5:0] norm_exp = exp_calc + {5'd0, carry};
  wire [4:0] norm_sig = carry ? 5'd8 : norm_sig_pre;
  wire [6:0] normal_mag = ((norm_exp > 6'sd15) || ((norm_exp == 6'sd15) && (norm_sig >= 5'd15))) ? 7'h7e :
                          ((norm_exp <= 6'sd0) ? norm_from_k(small_k) : {norm_exp[3:0], norm_sig[2:0]});
  wire [6:0] formula_mag = (prod == 8'd0) ? 7'h00 : (small ? norm_from_k(small_k) : normal_mag);
  wire [6:0] exc = exception_mag({exp_sum, prod});
  wire [6:0] out_mag = (exc == 7'h7f) ? formula_mag : exc;
  assign out = nan ? 8'h7f : {sign, out_mag};
endmodule
""".replace("@MODULE@", module).replace("@ENTRIES@", entries)


def render_mul_field_unsorted(module):
    table = {}
    for a in range(128):
        for b in range(128):
            if FP8.nan[a] or FP8.nan[b]:
                continue
            sig_a, eff_a = sig_eff(a)
            sig_b, eff_b = sig_eff(b)
            key = ((eff_a + eff_b) << 8) | (sig_a << 4) | sig_b
            table[key] = FP8.quant_mag_rational(FP8.k[a] * FP8.k[b], 512)
    entries = "\n".join(
        "        13'h{0:04x}: mag_table = 7'h{1:02x};".format(key, table[key])
        for key in sorted(table)
    )
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] a = in[15:8];
  wire [7:0] b = in[7:0];
  wire nan = (a[6:0] == 7'h7f) || (b[6:0] == 7'h7f);
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

  function [6:0] mag_table;
    input [12:0] key;
    begin
      case (key)
@ENTRIES@
        default: mag_table = 7'h00;
      endcase
    end
  endfunction

  wire [4:0] exp_sum = eff_exp(a[6:0]) + eff_exp(b[6:0]);
  wire [6:0] out_mag = mag_table({exp_sum, sig4(a[6:0]), sig4(b[6:0])});
  assign out = nan ? 8'h7f : {sign, out_mag};
endmodule
""".replace("@MODULE@", module).replace("@ENTRIES@", entries)


def render_mul_field_sparse(module, sorted_sig):
    table = {}
    for a in range(128):
        for b in range(128):
            if FP8.nan[a] or FP8.nan[b]:
                continue
            sig_a, eff_a = sig_eff(a)
            sig_b, eff_b = sig_eff(b)
            if sorted_sig:
                sig_a, sig_b = max(sig_a, sig_b), min(sig_a, sig_b)
            mag = FP8.quant_mag_rational(FP8.k[a] * FP8.k[b], 512)
            if mag:
                key = ((eff_a + eff_b) << 8) | (sig_a << 4) | sig_b
                table[key] = mag
    entries = "\n".join(
        "        13'h{0:04x}: mag_table = 7'h{1:02x};".format(key, table[key])
        for key in sorted(table)
    )
    sort_logic = """
  wire [3:0] sig_a_raw = sig4(a[6:0]);
  wire [3:0] sig_b_raw = sig4(b[6:0]);
  wire [3:0] sig_a = (sig_a_raw >= sig_b_raw) ? sig_a_raw : sig_b_raw;
  wire [3:0] sig_b = (sig_a_raw >= sig_b_raw) ? sig_b_raw : sig_a_raw;""" if sorted_sig else """
  wire [3:0] sig_a = sig4(a[6:0]);
  wire [3:0] sig_b = sig4(b[6:0]);"""
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] a = in[15:8];
  wire [7:0] b = in[7:0];
  wire nan = (a[6:0] == 7'h7f) || (b[6:0] == 7'h7f);
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

  function [6:0] mag_table;
    input [12:0] key;
    begin
      case (key)
@ENTRIES@
        default: mag_table = 7'h00;
      endcase
    end
  endfunction
@SORT_LOGIC@
  wire [4:0] exp_sum = eff_exp(a[6:0]) + eff_exp(b[6:0]);
  wire [6:0] out_mag = mag_table({exp_sum, sig_a, sig_b});
  assign out = nan ? 8'h7f : {sign, out_mag};
endmodule
""".replace("@MODULE@", module).replace("@ENTRIES@", entries).replace("@SORT_LOGIC@", sort_logic)


def render_div_field_sparse(module):
    table = {}
    for den in range(128):
        for num in range(128):
            if FP8.nan[num] or FP8.nan[den]:
                continue
            sig_n, eff_n = sig_eff(num)
            sig_d, eff_d = sig_eff(den)
            if sig_d == 0:
                continue
            mag = FP8.div_mag(num, den)
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
    input [12:0] key;
    begin
      case (key)
@ENTRIES@
        default: mag_table = 7'h00;
      endcase
    end
  endfunction

  wire signed [5:0] delta = $signed({1'b0, eff_exp(num[6:0])}) - $signed({1'b0, eff_exp(den[6:0])});
  wire [4:0] delta_key = delta + 6'sd15;
  wire [6:0] table_mag = mag_table({delta_key, sig4(num[6:0]), sig4(den[6:0])});
  wire [6:0] out_mag = den_zero ? (num_zero ? 7'h7f : 7'h7e) : table_mag;
  assign out = (nan || out_mag == 7'h7f) ? 8'h7f : {sign, out_mag};
endmodule
""".replace("@MODULE@", module).replace("@ENTRIES@", entries)


def bit_table_functions(table, key_width=13):
    funcs = []
    for bit in range(7):
        entries = "\n".join(
            "        {0}'h{1:04x}: bit{2}_table = 1'b1;".format(key_width, key, bit)
            for key, mag in sorted(table.items())
            if (mag >> bit) & 1
        )
        funcs.append(
            """  function bit{0}_table;
    input [{1}:0] key;
    begin
      case (key)
{2}
        default: bit{0}_table = 1'b0;
      endcase
    end
  endfunction""".format(bit, key_width - 1, entries)
        )
    return "\n\n".join(funcs)


def render_mul_field_bit_tables(module, sorted_sig):
    table = {}
    for a in range(128):
        for b in range(128):
            if FP8.nan[a] or FP8.nan[b]:
                continue
            sig_a, eff_a = sig_eff(a)
            sig_b, eff_b = sig_eff(b)
            if sorted_sig:
                sig_a, sig_b = max(sig_a, sig_b), min(sig_a, sig_b)
            key = ((eff_a + eff_b) << 8) | (sig_a << 4) | sig_b
            table[key] = FP8.quant_mag_rational(FP8.k[a] * FP8.k[b], 512)
    sort_logic = """
  wire [3:0] sig_a_raw = sig4(a[6:0]);
  wire [3:0] sig_b_raw = sig4(b[6:0]);
  wire [3:0] sig_a = (sig_a_raw >= sig_b_raw) ? sig_a_raw : sig_b_raw;
  wire [3:0] sig_b = (sig_a_raw >= sig_b_raw) ? sig_b_raw : sig_a_raw;""" if sorted_sig else """
  wire [3:0] sig_a = sig4(a[6:0]);
  wire [3:0] sig_b = sig4(b[6:0]);"""
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] a = in[15:8];
  wire [7:0] b = in[7:0];
  wire nan = (a[6:0] == 7'h7f) || (b[6:0] == 7'h7f);
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

@BIT_FUNCS@
@SORT_LOGIC@
  wire [4:0] exp_sum = eff_exp(a[6:0]) + eff_exp(b[6:0]);
  wire [12:0] key = {exp_sum, sig_a, sig_b};
  wire [6:0] out_mag = {
    bit6_table(key), bit5_table(key), bit4_table(key), bit3_table(key),
    bit2_table(key), bit1_table(key), bit0_table(key)
  };
  assign out = nan ? 8'h7f : {sign, out_mag};
endmodule
""".replace("@MODULE@", module).replace("@BIT_FUNCS@", bit_table_functions(table)).replace("@SORT_LOGIC@", sort_logic)


def render_div_field_bit_tables(module):
    table = {}
    for den in range(128):
        for num in range(128):
            if FP8.nan[num] or FP8.nan[den]:
                continue
            sig_n, eff_n = sig_eff(num)
            sig_d, eff_d = sig_eff(den)
            if sig_d == 0:
                continue
            key = ((eff_n - eff_d + 15) << 8) | (sig_n << 4) | sig_d
            table[key] = FP8.div_mag(num, den)
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

@BIT_FUNCS@
  wire signed [5:0] delta = $signed({1'b0, eff_exp(num[6:0])}) - $signed({1'b0, eff_exp(den[6:0])});
  wire [4:0] delta_key = delta + 6'sd15;
  wire [12:0] key = {delta_key, sig4(num[6:0]), sig4(den[6:0])};
  wire [6:0] table_mag = {
    bit6_table(key), bit5_table(key), bit4_table(key), bit3_table(key),
    bit2_table(key), bit1_table(key), bit0_table(key)
  };
  wire [6:0] out_mag = den_zero ? (num_zero ? 7'h7f : 7'h7e) : table_mag;
  assign out = (nan || out_mag == 7'h7f) ? 8'h7f : {sign, out_mag};
endmodule
""".replace("@MODULE@", module).replace("@BIT_FUNCS@", bit_table_functions(table))


def div_exact_mag_from_sig_delta(sig_n, sig_d, delta):
    if sig_n == 0:
        return 0
    if sig_d == 0:
        return 0x7F
    if delta >= 0:
        return FP8.quant_mag_rational(sig_n * 512 * (1 << delta), sig_d)
    return FP8.quant_mag_rational(sig_n * 512, sig_d * (1 << (-delta)))


def render_div_formula_exception_compact(module):
    params = {}
    for sig_n in range(1, 16):
        for sig_d in range(1, 16):
            counts = Counter()
            for delta in range(-14, 15):
                mag = div_exact_mag_from_sig_delta(sig_n, sig_d, delta)
                out_exp = (mag >> 3) & 0xF
                out_mant = mag & 0x7
                if out_exp not in (0, 15) and mag not in (0, 0x7E, 0x7F):
                    counts[(out_exp - delta, 8 + out_mant)] += 1
            params[(sig_n, sig_d)] = counts.most_common(1)[0][0] if counts else (0, 8)

    param_entries = []
    exception_entries = []
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
                    exception_entries.append(
                        "        13'h{0:04x}: exception_mag = 7'h{1:02x};".format(key, exact)
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

  function [8:0] param_table;
    input [7:0] key;
    begin
      case (key)
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

  wire [3:0] sig_n = sig4(num[6:0]);
  wire [3:0] sig_d = sig4(den[6:0]);
  wire signed [5:0] delta = $signed({1'b0, eff_exp(num[6:0])}) - $signed({1'b0, eff_exp(den[6:0])});
  wire [4:0] delta_key = delta + 6'sd15;
  wire [8:0] param = param_table({sig_n, sig_d});
  wire signed [5:0] off = $signed({param[8], param[8:4]});
  wire [3:0] norm_sig = param[3:0];
  wire signed [6:0] out_exp_calc = delta + off;
  wire [6:0] formula_mag = num_zero ? 7'h00 :
    ((out_exp_calc <= 0) ? 7'h00 :
     ((out_exp_calc >= 15) ? 7'h7e : {out_exp_calc[3:0], norm_sig[2:0]}));
  wire [6:0] exc = exception_mag({delta_key, sig_n, sig_d});
  wire [6:0] out_mag = den_zero ? (num_zero ? 7'h7f : 7'h7e) :
                         ((exc == 7'h7f) ? formula_mag : exc);
  assign out = (nan || out_mag == 7'h7f) ? 8'h7f : {sign, out_mag};
endmodule
""".replace("@MODULE@", module).replace("@PARAMS@", "\n".join(param_entries)).replace("@EXCEPTIONS@", "\n".join(exception_entries))


def render_fmod_arith_mod(module):
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [6:0] den = in[14:8];
  wire [6:0] num = in[6:0];
  wire num_sign = in[7];
  wire nan = (den == 7'h7f) || (num == 7'h7f);

  function [17:0] fp8_mag;
    input [6:0] v;
    begin
      if (v[6:3] == 4'd0) fp8_mag = {15'd0, v[2:0]};
      else fp8_mag = ({11'd0, 1'b1, v[2:0]}) << (v[6:3] - 4'd1);
    end
  endfunction

  function [6:0] quant_norm;
    input [18:0] mag;
    reg [4:0] exp;
    reg [4:0] shift;
    reg [4:0] base;
    reg [18:0] rem;
    reg [18:0] half;
    reg round_up;
    reg [4:0] sig;
    begin
      if (mag == 19'd0) quant_norm = 7'h00;
      else if (mag <= 19'd7) quant_norm = mag[6:0];
      else begin
        if (mag[18]) begin exp = 5'd16; shift = 5'd15; end
        else if (mag[17]) begin exp = 5'd15; shift = 5'd14; end
        else if (mag[16]) begin exp = 5'd14; shift = 5'd13; end
        else if (mag[15]) begin exp = 5'd13; shift = 5'd12; end
        else if (mag[14]) begin exp = 5'd12; shift = 5'd11; end
        else if (mag[13]) begin exp = 5'd11; shift = 5'd10; end
        else if (mag[12]) begin exp = 5'd10; shift = 5'd9; end
        else if (mag[11]) begin exp = 5'd9; shift = 5'd8; end
        else if (mag[10]) begin exp = 5'd8; shift = 5'd7; end
        else if (mag[9]) begin exp = 5'd7; shift = 5'd6; end
        else if (mag[8]) begin exp = 5'd6; shift = 5'd5; end
        else if (mag[7]) begin exp = 5'd5; shift = 5'd4; end
        else if (mag[6]) begin exp = 5'd4; shift = 5'd3; end
        else if (mag[5]) begin exp = 5'd3; shift = 5'd2; end
        else if (mag[4]) begin exp = 5'd2; shift = 5'd1; end
        else begin exp = 5'd1; shift = 5'd0; end
        base = mag >> shift;
        if (shift == 5'd0) round_up = 1'b0;
        else begin
          rem = mag - ({14'd0, base} << shift);
          half = 19'd1 << (shift - 5'd1);
          round_up = (rem > half) || ((rem == half) && base[0]);
        end
        sig = base + {4'd0, round_up};
        if (sig >= 5'd16) begin exp = exp + 5'd1; sig = 5'd8; end
        if ((exp > 5'd15) || ((exp == 5'd15) && (sig >= 5'd15))) quant_norm = 7'h7e;
        else quant_norm = {exp[3:0], sig[2:0]};
      end
    end
  endfunction

  wire [17:0] den_mag = fp8_mag(den);
  wire [17:0] num_mag = fp8_mag(num);
  wire den_zero = den_mag == 18'd0;
  wire [17:0] den_safe = den_zero ? 18'd1 : den_mag;
  wire [17:0] rem_mag = num_mag % den_safe;
  wire [6:0] out_mag = quant_norm({1'b0, rem_mag});
  assign out = (nan || den_zero) ? 8'h7f : {num_sign, out_mag};
endmodule
""".replace("@MODULE@", module)


def render(case, variant, module):
    if case == "ex244" and variant == "semantic_hypot_sig_gap_delta":
        return render_hypot_sig_gap_delta(module)
    if case == "ex244" and variant == "semantic_hypot_sig_gap_threshold":
        return render_hypot_sig_gap_threshold(module)
    if case == "ex244" and variant == "semantic_hypot_sig_gap_orbits":
        return render_hypot_sig_gap_orbits(module)
    if case == "ex240" and variant == "semantic_add_same_delta_diff_norm":
        return render_add_same_delta_diff_norm(module)
    if case == "ex240" and variant == "semantic_add_field_delta":
        return render_add_field_delta(module)
    if case == "ex241" and variant == "semantic_mul_product_formula_exception":
        return render_mul_product_formula_exception(module)
    if case == "ex241" and variant == "semantic_mul_field_unsorted":
        return render_mul_field_unsorted(module)
    if case == "ex241" and variant == "semantic_mul_field_sparse_sorted":
        return render_mul_field_sparse(module, sorted_sig=True)
    if case == "ex241" and variant == "semantic_mul_field_sparse_unsorted":
        return render_mul_field_sparse(module, sorted_sig=False)
    if case == "ex241" and variant == "semantic_mul_field_bit_sorted":
        return render_mul_field_bit_tables(module, sorted_sig=True)
    if case == "ex241" and variant == "semantic_mul_field_bit_unsorted":
        return render_mul_field_bit_tables(module, sorted_sig=False)
    if case == "ex242" and variant == "semantic_div_field_sparse":
        return render_div_field_sparse(module)
    if case == "ex242" and variant == "semantic_div_field_bit":
        return render_div_field_bit_tables(module)
    if case == "ex242" and variant == "semantic_div_formula_exception_compact":
        return render_div_formula_exception_compact(module)
    if case == "ex243" and variant == "semantic_fmod_arith_mod":
        return render_fmod_arith_mod(module)
    raise RuntimeError("unsupported variant {0} {1}".format(case, variant))


VARIANTS = [
    ("ex244", "semantic_hypot_sig_gap_delta", "hypot max + exact sig/gap delta table with saturation cap"),
    ("ex244", "semantic_hypot_sig_gap_threshold", "hypot exact sig/gap min-significand threshold runs with saturation cap"),
    ("ex244", "semantic_hypot_sig_gap_orbits", "hypot exact sig/gap delta bits as parallel OR-of-conditions"),
    ("ex240", "semantic_add_same_delta_diff_norm", "add same-sign exact sig/gap delta, diff-sign arithmetic normalizer"),
    ("ex240", "semantic_add_field_delta", "add same-sign sig/gap delta and diff-sign field correction table"),
    ("ex241", "semantic_mul_product_formula_exception", "multiply 4x4 product normalization plus 13 exact rounding exceptions"),
    ("ex241", "semantic_mul_field_unsorted", "multiply table by exponent sum and unsorted operand significands"),
    ("ex241", "semantic_mul_field_sparse_sorted", "multiply sparse nonzero table by exponent sum and sorted significands"),
    ("ex241", "semantic_mul_field_sparse_unsorted", "multiply sparse nonzero table by exponent sum and unsorted significands"),
    ("ex241", "semantic_mul_field_bit_sorted", "multiply per-output-bit tables by exponent sum and sorted significands"),
    ("ex241", "semantic_mul_field_bit_unsorted", "multiply per-output-bit tables by exponent sum and unsorted significands"),
    ("ex242", "semantic_div_field_sparse", "division sparse nonzero table by exponent delta and operand significands"),
    ("ex242", "semantic_div_field_bit", "division per-output-bit tables by exponent delta and operand significands"),
    ("ex242", "semantic_div_formula_exception_compact", "division formula/exception with compact default param table"),
    ("ex243", "semantic_fmod_arith_mod", "fmod via decoded integer magnitudes, Verilog modulus, and FP8 quantizer"),
]


def synthesize_with_script(script, yosys, timeout, log_path):
    log_path.parent.mkdir(parents=True, exist_ok=True)
    script_path = log_path.with_suffix(".ys")
    aig_dir = log_path.parent.parent / "aigs"
    aig_dir.mkdir(parents=True, exist_ok=True)
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
                notes=note,
                timeout=args.timeout,
            )
            row["equivalent"] = "1" if result.equivalent else "0"
            row["area"] = "" if result.area is None else str(result.area)
            row["delay"] = "" if result.delay is None else str(result.delay)
            row["adp"] = "" if result.adp is None else str(result.adp)
            row["notes"] = result.notes
        except (OSError, RuntimeError, SynthError, subprocess.TimeoutExpired) as exc:
            row["notes"] = "{0}: {1}".format(type(exc).__name__, exc)[:1000]
        row["runtime_sec"] = "{0:.3f}".format(time.time() - start)
        add_reference_columns(row, refs)
        rows.append(row)
        print("{0} {1} eq={2} area={3} delay={4} adp={5}".format(case, row["variant"], row["equivalent"], row["area"], row["delay"], row["adp"]))
        sys.stdout.flush()
    return rows


def best_rows(rows):
    best = []
    for case in sorted(set(row["case"] for row in rows)):
        valid = [row for row in rows if row["case"] == case and row["equivalent"] == "1" and row["adp"]]
        if valid:
            row = min(valid, key=lambda item: int(item["adp"]))
            best.append({name: row.get(name, "") for name in BEST_FIELDNAMES})
    return best


def write_manifest(args, rows):
    write_text(args.work_dir / "manifest.json", json.dumps({"run_id": args.run_id, "rows": rows}, indent=2) + "\n")
    write_text(
        args.run_dir / "MANIFEST.md",
        "# {0}\n\nRun ID: `{0}`\n\nPurpose: deeper FP8 source-structure experiments for ex240-ex244; no seed curation.\n\nArtifacts:\n- Work directory: `{1}`\n- Candidates CSV: `{2}`\n- Best CSV: `{3}`\n\nMethods tried:\n- ex244 exact hypot correction as `(gap,max_sig,min_sig)` delta plus saturation cap.\n- ex240 same-sign add as `(gap,max_sig,min_sig)` delta plus diff-sign normalizer.\n\nBest result: see `results/best.csv`.\n".format(
            args.run_id,
            rel_path(args.work_dir),
            rel_path(args.results_dir / "candidates.csv"),
            rel_path(args.results_dir / "best.csv"),
        ),
    )


def parse_args(argv=None):
    parser = argparse.ArgumentParser()
    parser.add_argument("--run-id", required=True)
    parser.add_argument("--work-dir", type=Path)
    parser.add_argument("--run-dir", type=Path)
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--reference", type=Path, default=ROOT / "reference_result.csv")
    parser.add_argument("--yosys", type=Path, default=ROOT / "student/tools/conda-env/bin/yosys")
    parser.add_argument("--abc", type=Path, default=ROOT / "student/abc")
    parser.add_argument("--timeout", type=int, default=900)
    parser.add_argument("--cases", default="ex244,ex240,ex241,ex243")
    return parser.parse_args(argv)


def main(argv=None):
    args = parse_args(argv)
    args.work_dir = args.work_dir or (ROOT / "student" / "work" / args.run_id)
    args.run_dir = args.run_dir or (ROOT / "student" / "runs" / "float_fp8" / args.run_id)
    args.results_dir = args.run_dir / "results"
    refs = load_reference(args.reference)
    selected = {case.strip() for case in args.cases.split(",") if case.strip()}
    rows = []
    for case, variant, note in VARIANTS:
        if case in selected:
            rows.extend(run_variant(args, refs, case, variant, note))
    write_csv(args.results_dir / "candidates.csv", RESULT_FIELDNAMES, rows)
    write_csv(args.results_dir / "best.csv", BEST_FIELDNAMES, best_rows(rows))
    write_csv(args.results_dir / "summary.csv", BEST_FIELDNAMES, best_rows(rows))
    write_csv(args.results_dir / "evaluate_check.csv", RESULT_FIELDNAMES, rows)
    write_manifest(args, rows)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
