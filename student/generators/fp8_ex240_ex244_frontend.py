#!/usr/bin/env python3
"""Generate frontend-only FP8 semantic seeds for ex240-ex244.

The cases are 16-bit packed inputs and 8-bit outputs.  The first diagnostic
pass identified E4M3FN-style FP8 operators:

- ex240: add, high byte + low byte
- ex241: multiply, high byte * low byte
- ex242: divide, low byte / high byte
- ex243: fmod/remainder, low byte % abs(high byte)
- ex244: hypot, sqrt(abs(high)^2 + abs(low)^2)

This driver emits a small curated first batch of semantic Verilog seeds,
synthesizes them to AIG with Yosys, and verifies/measures with ABC CEC through
the same conventions used by evaluate.py.  It does not run backend portfolios.
"""

import argparse
import csv
import json
import math
import re
import subprocess
import sys
import time
from bisect import bisect_left
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from student.backends.abc_flow import evaluate_aig
from student.frontends.truth import TruthTable
from student.frontends.yosys_synth import SynthError, run_command, yosys_quote


CASES = ["ex240", "ex241", "ex242", "ex243", "ex244"]
CASE_LABELS = {
    "ex240": "fp8_e4m3fn_add",
    "ex241": "fp8_e4m3fn_mul",
    "ex242": "fp8_e4m3fn_div_low_over_high",
    "ex243": "fp8_e4m3fn_fmod_low_by_high_abs",
    "ex244": "fp8_e4m3fn_hypot_abs",
}
CASE_VARIANTS = {
    "ex240": [
        ("semantic_add_scaled", "semantic RTL: decode scaled magnitude, add/sub, quantize"),
        ("semantic_add_norm", "semantic RTL: decode scaled magnitude, add/sub, leading-bit RNE normalizer"),
        ("semantic_add_pair_delta", "semantic sorted-magnitude add/sub with sparse correction tables"),
    ],
    "ex241": [
        ("semantic_mul_scaled", "semantic RTL: decode scaled magnitude, small multiply, quantize"),
        ("semantic_mul_field_table", "semantic table by effective exponent sum and 4-bit significands"),
        ("semantic_mul_product_table", "semantic table by effective exponent sum and 8-bit significand product"),
    ],
    "ex242": [
        ("semantic_div_mag_table", "semantic magnitude table for low/high division"),
        ("semantic_div_field_table", "semantic table by exponent delta and numerator/denominator significands"),
        ("semantic_div_formula_exception", "semantic exponent-delta formula plus boundary exception table"),
    ],
    "ex243": [
        ("semantic_fmod_mag_table", "semantic magnitude table for low % abs(high)"),
        ("semantic_fmod_default_exception", "semantic fmod passthrough/zero defaults plus exception table"),
    ],
    "ex244": [
        ("semantic_hypot_mag_table", "semantic magnitude table for hypot(abs(high), abs(low))"),
        ("semantic_hypot_max_delta", "semantic max(abs operands) plus sparse correction delta"),
        ("semantic_hypot_gap_delta", "semantic max plus correction only when exponent gap is below 3"),
        ("semantic_hypot_run_delta", "semantic max plus per-max min-threshold correction runs"),
    ],
}

RESULT_FIELDNAMES = [
    "case",
    "candidate_id",
    "hypothesis/function_guess",
    "variant",
    "verilog_path",
    "aig_path",
    "verified_truth",
    "synthesized",
    "equivalent",
    "area",
    "delay",
    "adp",
    "reference_adp",
    "adp_ratio_to_reference",
    "within_1p5_reference",
    "beats_reference",
    "runtime_sec",
    "items",
    "classification",
    "notes",
]

BEST_FIELDNAMES = [
    "case",
    "candidate_id",
    "hypothesis/function_guess",
    "variant",
    "verilog_path",
    "aig_path",
    "verified_truth",
    "equivalent",
    "area",
    "delay",
    "adp",
    "reference_adp",
    "adp_ratio_to_reference",
    "within_1p5_reference",
    "beats_reference",
    "classification",
    "notes",
]


def write_text(path, text):
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(text)


def rel_path(path):
    path = Path(path)
    try:
        return str(path.resolve().relative_to(ROOT))
    except ValueError:
        return str(path)


def load_reference(path):
    refs = {}
    with Path(path).open() as handle:
        for row in csv.reader(handle):
            if not row or row[0].startswith("#"):
                continue
            if row[0] == "case":
                continue
            refs[row[0]] = {
                "area": int(row[1]),
                "delay": int(row[2]),
                "adp": int(row[3]),
                "score": float(row[4]),
            }
    return refs


def write_csv(path, fieldnames, rows):
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fieldnames)
        writer.writeheader()
        for row in rows:
            writer.writerow({name: row.get(name, "") for name in fieldnames})


def add_reference_columns(row, refs):
    ref = refs.get(row["case"])
    if not ref:
        return
    row["reference_adp"] = str(ref["adp"])
    if row.get("adp"):
        adp = int(row["adp"])
        ratio = adp / ref["adp"]
        row["adp_ratio_to_reference"] = "{0:.6f}".format(ratio)
        row["within_1p5_reference"] = "1" if ratio <= 1.5 else "0"
        row["beats_reference"] = "1" if adp < ref["adp"] else "0"


class E4M3FN:
    """Small exact helper for generating semantic tables."""

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

    def quant_mag_rational(self, numerator, denominator=1):
        if denominator < 0:
            numerator = -numerator
            denominator = -denominator
        if numerator <= 0:
            return 0
        best = (numerator * 2, 0, 0)
        best_code = 0
        idx = bisect_left(self.pos_k, numerator // denominator)
        for j in range(max(0, idx - 3), min(len(self.pos), idx + 5)):
            point, code = self.pos[j]
            diff = abs(numerator - point * denominator)
            key = (diff * 2, code & 1, code)
            if key < best:
                best = key
                best_code = code
        return best_code

    def div_mag(self, num_code, den_code):
        if self.nan[num_code] or self.nan[den_code]:
            return 0x7F
        num = self.k[num_code]
        den = self.k[den_code]
        if den == 0:
            return 0x7F if num == 0 else 0x7E
        return self.quant_mag_rational(num * 512, den)

    def fmod_mag(self, low_code, high_code):
        if self.nan[low_code] or self.nan[high_code]:
            return 0x7F
        den = self.k[high_code]
        if den == 0:
            return 0x7F
        return self.quant_mag_rational(self.k[low_code] % den)

    def hypot_mag(self, a_code, b_code):
        if self.nan[a_code] or self.nan[b_code]:
            return 0x7F
        val = math.sqrt(self.k[a_code] * self.k[a_code] + self.k[b_code] * self.k[b_code])
        return self.quant_mag_rational(int(round(val * 1048576)), 1048576)


FP8 = E4M3FN()


def quant_int_runs(max_mag):
    values = [FP8.quant_mag_rational(mag) for mag in range(max_mag + 1)]
    runs = []
    start = 0
    cur = values[0]
    for idx, value in enumerate(values[1:], 1):
        if value != cur:
            runs.append((start, idx - 1, cur))
            start = idx
            cur = value
    runs.append((start, max_mag, cur))
    return runs


def quant_div512_runs(max_num):
    # Build ranges by threshold, not by enumerating every large product.
    thresholds = []
    prev_code = 0
    for mag in range(1, 0x7F):
        if FP8.nan[mag]:
            continue
        pass
    # For source simplicity this emits compare ranges over quantized magnitude
    # after an integer divide by 512 with round-to-nearest-even compensation.
    return quant_int_runs((max_num + 511) // 512 + 2)


def quant_rational_intervals(denominator):
    candidates = [(0, 0)] + FP8.pos
    intervals = []
    lo = 0
    for idx, (point, code) in enumerate(candidates):
        if idx + 1 < len(candidates):
            next_point, next_code = candidates[idx + 1]
            midpoint_num = (point + next_point) * denominator
            # The midpoint over 2 is always integral for denominator 512 in
            # this file.  If the next code is even, it wins the exact tie.
            midpoint = midpoint_num // 2
            next_lo = midpoint if (next_code & 1) == 0 else midpoint + 1
            hi = next_lo - 1
        else:
            hi = None
        intervals.append((lo, hi, code))
        if hi is None:
            break
        lo = hi + 1
    return intervals


def render_quant_div512_function():
    lines = [
        "  function [7:0] quant_div512;",
        "    input [35:0] num;",
        "    input sign;",
        "    begin",
    ]
    intervals = quant_rational_intervals(512)
    first = True
    for lo, hi, code in intervals:
        if hi is None:
            continue
        if hi == 0:
            continue
        if first:
            cond = "num <= 36'd{0}".format(hi)
            prefix = "      if"
            first = False
        else:
            cond = "num >= 36'd{0} && num <= 36'd{1}".format(lo, hi)
            prefix = "      end else if"
        lines.extend(
            [
                "{0} ({1}) begin".format(prefix, cond),
                "        quant_div512 = {{sign, 7'h{0:02x}}};".format(code),
            ]
        )
    lines.extend(
        [
            "      end else begin",
            "        quant_div512 = {sign, 7'h7e};",
            "      end",
            "    end",
            "  endfunction",
        ]
    )
    return "\n".join(lines)


def render_common_functions():
    q_runs = quant_int_runs(458752)
    lines = [
        "  function [17:0] fp8_mag;",
        "    input [7:0] v;",
        "    reg [3:0] e;",
        "    reg [2:0] m;",
        "    begin",
        "      e = v[6:3];",
        "      m = v[2:0];",
        "      if (e == 4'd15 && m == 3'd7) begin",
        "        fp8_mag = 18'd0;",
        "      end else if (e == 4'd0) begin",
        "        fp8_mag = {15'd0, m};",
        "      end else begin",
        "        fp8_mag = ({11'd0, 1'b1, m}) << (e - 4'd1);",
        "      end",
        "    end",
        "  endfunction",
        "",
        "  function [7:0] quant_int;",
        "    input [18:0] mag;",
        "    input sign;",
        "    input neg_zero;",
        "    begin",
        "      if (mag == 19'd0) begin",
        "        quant_int = neg_zero ? 8'h80 : 8'h00;",
    ]
    for lo, hi, code in q_runs:
        if code == 0:
            continue
        if lo == hi:
            cond = "mag == 19'd{0}".format(lo)
        else:
            cond = "mag >= 19'd{0} && mag <= 19'd{1}".format(lo, hi)
        lines.extend(
            [
                "      end else if ({0}) begin".format(cond),
                "        quant_int = {{sign, 7'h{0:02x}}};".format(code),
            ]
        )
    lines.extend(
        [
            "      end else begin",
            "        quant_int = {sign, 7'h7e};",
            "      end",
            "    end",
            "  endfunction",
            "",
        ]
    )
    return "\n".join(lines)


def render_common_norm_functions():
    return """  function [17:0] fp8_mag;
    input [7:0] v;
    reg [3:0] e;
    reg [2:0] m;
    begin
      e = v[6:3];
      m = v[2:0];
      if (e == 4'd15 && m == 3'd7) begin
        fp8_mag = 18'd0;
      end else if (e == 4'd0) begin
        fp8_mag = {15'd0, m};
      end else begin
        fp8_mag = ({11'd0, 1'b1, m}) << (e - 4'd1);
      end
    end
  endfunction

  function [7:0] quant_int_norm;
    input [18:0] mag;
    input sign;
    input neg_zero;
    reg [4:0] exp;
    reg [4:0] shift;
    reg [4:0] base;
    reg [4:0] sig;
    reg [18:0] rem;
    reg [18:0] half;
    reg round_up;
    begin
      if (mag == 19'd0) begin
        quant_int_norm = neg_zero ? 8'h80 : 8'h00;
      end else if (mag <= 19'd7) begin
        quant_int_norm = {sign, 4'd0, mag[2:0]};
      end else begin
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
        if (shift == 5'd0) begin
          round_up = 1'b0;
        end else begin
          rem = mag - ({14'd0, base} << shift);
          half = 19'd1 << (shift - 5'd1);
          round_up = (rem > half) || ((rem == half) && base[0]);
        end
        sig = base + {4'd0, round_up};
        if (sig >= 5'd16) begin
          exp = exp + 5'd1;
          sig = 5'd8;
        end
        if ((exp > 5'd15) || ((exp == 5'd15) && (sig >= 5'd15))) begin
          quant_int_norm = {sign, 7'h7e};
        end else begin
          quant_int_norm = {sign, exp[3:0], sig[2:0]};
        end
      end
    end
  endfunction
"""


def render_add_scaled(module):
    text = """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] a = in[15:8];
  wire [7:0] b = in[7:0];
  wire nan_a = (a[6:3] == 4'd15) && (a[2:0] == 3'd7);
  wire nan_b = (b[6:3] == 4'd15) && (b[2:0] == 3'd7);
@COMMON@
  wire [17:0] mag_a = fp8_mag(a);
  wire [17:0] mag_b = fp8_mag(b);
  wire signed [19:0] sval_a = a[7] ? -$signed({2'b00, mag_a}) : $signed({2'b00, mag_a});
  wire signed [19:0] sval_b = b[7] ? -$signed({2'b00, mag_b}) : $signed({2'b00, mag_b});
  wire signed [19:0] sum = sval_a + sval_b;
  wire sign = sum[19];
  wire [18:0] abs_sum = sign ? -sum[18:0] : sum[18:0];
  wire neg_zero = (mag_a == 18'd0) && (mag_b == 18'd0) && a[7] && b[7];
  assign out = (nan_a || nan_b) ? 8'h7f : quant_int(abs_sum, sign, neg_zero);
endmodule
"""
    return text.replace("@MODULE@", module).replace("@COMMON@", render_common_functions())


def render_add_norm(module):
    text = """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] a = in[15:8];
  wire [7:0] b = in[7:0];
  wire nan_a = (a[6:3] == 4'd15) && (a[2:0] == 3'd7);
  wire nan_b = (b[6:3] == 4'd15) && (b[2:0] == 3'd7);
@COMMON@
  wire [17:0] mag_a = fp8_mag(a);
  wire [17:0] mag_b = fp8_mag(b);
  wire signed [19:0] sval_a = a[7] ? -$signed({2'b00, mag_a}) : $signed({2'b00, mag_a});
  wire signed [19:0] sval_b = b[7] ? -$signed({2'b00, mag_b}) : $signed({2'b00, mag_b});
  wire signed [19:0] sum = sval_a + sval_b;
  wire sign = sum[19];
  wire [18:0] abs_sum = sign ? -sum[18:0] : sum[18:0];
  wire neg_zero = (mag_a == 18'd0) && (mag_b == 18'd0) && a[7] && b[7];
  assign out = (nan_a || nan_b) ? 8'h7f : quant_int_norm(abs_sum, sign, neg_zero);
endmodule
"""
    return text.replace("@MODULE@", module).replace("@COMMON@", render_common_norm_functions())


def render_add_pair_delta(module):
    same_entries = []
    diff_entries = []
    for a in range(128):
        for b in range(128):
            if FP8.nan[a] or FP8.nan[b]:
                continue
            maxc = a if FP8.k[a] >= FP8.k[b] else b
            minc = b if maxc == a else a
            key = (maxc << 7) | minc
            same_mag = FP8.quant_mag_rational(FP8.k[maxc] + FP8.k[minc])
            same_default = maxc
            if same_mag != same_default:
                same_entries.append((key, same_mag))
            if FP8.k[maxc] == FP8.k[minc]:
                diff_default = 0
            else:
                diff_default = maxc
            diff_mag = FP8.quant_mag_rational(FP8.k[maxc] - FP8.k[minc])
            if diff_mag != diff_default:
                diff_entries.append((key, diff_mag))
    same_entries = sorted(set(same_entries))
    diff_entries = sorted(set(diff_entries))
    same_text = "\n".join(
        "        14'h{0:04x}: same_table = 7'h{1:02x};".format(key, mag)
        for key, mag in same_entries
    )
    diff_text = "\n".join(
        "        14'h{0:04x}: diff_table = 7'h{1:02x};".format(key, mag)
        for key, mag in diff_entries
    )
    text = """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] a = in[15:8];
  wire [7:0] b = in[7:0];
  wire nan = (a[6:0] == 7'h7f) || (b[6:0] == 7'h7f);
  wire same_sign = (a[7] == b[7]);
  wire a_ge_b = (a[6:0] >= b[6:0]);
  wire [6:0] maxc = a_ge_b ? a[6:0] : b[6:0];
  wire [6:0] minc = a_ge_b ? b[6:0] : a[6:0];
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


def render_mul_scaled(module):
    text = """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] a = in[15:8];
  wire [7:0] b = in[7:0];
  wire nan_a = (a[6:3] == 4'd15) && (a[2:0] == 3'd7);
  wire nan_b = (b[6:3] == 4'd15) && (b[2:0] == 3'd7);
@COMMON@
@QUANT_DIV512@

  wire [17:0] mag_a = fp8_mag(a);
  wire [17:0] mag_b = fp8_mag(b);
  wire sign = a[7] ^ b[7];
  wire [35:0] product = mag_a * mag_b;
  assign out = (nan_a || nan_b) ? 8'h7f : quant_div512(product, sign);
endmodule
"""
    return (
        text.replace("@MODULE@", module)
        .replace("@COMMON@", render_common_functions())
        .replace("@QUANT_DIV512@", render_quant_div512_function())
    )


def render_mag_table(module, case):
    table_lines = []
    if case == "ex242":
        comment = "low byte divided by high byte"
        for high in range(128):
            for low in range(128):
                table_lines.append("        14'h{0:04x}: mag_table = 7'h{1:02x};".format((high << 7) | low, FP8.div_mag(low, high)))
        body = "wire out_sign = a[7] ^ b[7];\n  wire [6:0] out_mag = mag_table({a[6:0], b[6:0]});\n  assign out = (out_mag == 7'h7f) ? 8'h7f : {out_sign, out_mag};"
    elif case == "ex243":
        comment = "low byte fmod abs(high byte)"
        for high in range(128):
            for low in range(128):
                table_lines.append("        14'h{0:04x}: mag_table = 7'h{1:02x};".format((high << 7) | low, FP8.fmod_mag(low, high)))
        body = "wire [6:0] out_mag = mag_table({a[6:0], b[6:0]});\n  assign out = (out_mag == 7'h7f) ? 8'h7f : {b[7], out_mag};"
    elif case == "ex244":
        comment = "hypot of absolute high and low bytes"
        for high in range(128):
            for low in range(128):
                table_lines.append("        14'h{0:04x}: mag_table = 7'h{1:02x};".format((high << 7) | low, FP8.hypot_mag(high, low)))
        body = "wire [6:0] out_mag = mag_table({a[6:0], b[6:0]});\n  assign out = (out_mag == 7'h7f) ? 8'h7f : {1'b0, out_mag};"
    else:
        raise ValueError(case)

    text = """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [7:0] a = in[15:8];
  wire [7:0] b = in[7:0];

  // E4M3FN semantic magnitude table: @COMMENT@.
  function [6:0] mag_table;
    input [13:0] key;
    begin
      case (key)
@TABLE@
        default: mag_table = 7'h7f;
      endcase
    end
  endfunction

  @BODY@
endmodule
"""
    return (
        text.replace("@MODULE@", module)
        .replace("@COMMENT@", comment)
        .replace("@TABLE@", "\n".join(table_lines))
        .replace("@BODY@", body)
    )


def render_fmod_default_exception(module):
    entries = []
    for den in range(128):
        for num in range(128):
            if FP8.nan[den] or FP8.nan[num] or FP8.k[den] == 0:
                continue
            exact = FP8.fmod_mag(num, den)
            default = num if FP8.k[num] < FP8.k[den] else 0
            if exact != default:
                entries.append("        14'h{0:04x}: exception_mag = 7'h{1:02x};".format((den << 7) | num, exact))
    text = """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [6:0] den = in[14:8];
  wire [6:0] num = in[6:0];
  wire num_sign = in[7];
  wire nan = (den == 7'h7f) || (num == 7'h7f);
  wire den_zero = (den == 7'h00);
  wire num_lt_den = (num < den);
  wire [6:0] default_mag = num_lt_den ? num : 7'h00;

  function [6:0] exception_mag;
    input [13:0] key;
    begin
      case (key)
@ENTRIES@
        default: exception_mag = 7'h7f;
      endcase
    end
  endfunction

  wire [6:0] exc = exception_mag({den, num});
  wire [6:0] mag = (exc == 7'h7f) ? default_mag : exc;
  assign out = (nan || den_zero) ? 8'h7f : {num_sign, mag};
endmodule
""".replace("@MODULE@", module).replace("@ENTRIES@", "\n".join(entries))


def render_hypot_max_delta(module, gap_guard=False):
    deltas = {}
    for high in range(128):
        for low in range(128):
            if FP8.nan[high] or FP8.nan[low]:
                continue
            max_code = high if FP8.k[high] >= FP8.k[low] else low
            min_code = low if max_code == high else high
            out = FP8.hypot_mag(high, low)
            if out == 0x7F:
                continue
            delta = out - max_code
            if delta != 0:
                key = (max_code << 7) | min_code
                deltas[key] = delta
    entries = [
        "        14'h{0:04x}: correction_delta = 3'd{1};".format(key, deltas[key])
        for key in sorted(deltas)
    ]
    text = """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [6:0] a = in[14:8];
  wire [6:0] b = in[6:0];
  wire nan = (a == 7'h7f) || (b == 7'h7f);
  wire [6:0] maxc = (a >= b) ? a : b;
  wire [6:0] minc = (a >= b) ? b : a;
  wire [3:0] max_exp = maxc[6:3];
  wire [3:0] min_exp = minc[6:3];
  wire gap_ge3 = ({1'b0, max_exp} >= ({1'b0, min_exp} + 5'd3));

  function [2:0] correction_delta;
    input [13:0] key;
    begin
      case (key)
@ENTRIES@
        default: correction_delta = 3'd0;
      endcase
    end
  endfunction

  wire [2:0] d = @D_EXPR@;
  wire [7:0] raw_mag = {1'b0, maxc} + {5'd0, d};
  wire [6:0] out_mag = (raw_mag >= 8'h7f) ? 7'h7e : raw_mag[6:0];
  assign out = nan ? 8'h7f : {1'b0, out_mag};
endmodule
"""
    d_expr = "(gap_ge3 ? 3'd0 : correction_delta({maxc, minc}))" if gap_guard else "correction_delta({maxc, minc})"
    return text.replace("@MODULE@", module).replace("@ENTRIES@", "\n".join(entries)).replace("@D_EXPR@", d_expr)


def render_hypot_run_delta(module):
    blocks = []
    for maxc in range(128):
        if FP8.nan[maxc]:
            continue
        vals = []
        for minc in range(maxc + 1):
            if FP8.nan[minc]:
                continue
            out = FP8.hypot_mag(maxc, minc)
            delta = 0 if out == 0x7F else out - maxc
            vals.append((minc, delta))
        if not vals:
            continue
        runs = []
        start = vals[0][0]
        cur = vals[0][1]
        prev = start
        for minc, delta in vals[1:]:
            if delta != cur or minc != prev + 1:
                if cur != 0:
                    runs.append((start, prev, cur))
                start = minc
                cur = delta
            prev = minc
        if cur != 0:
            runs.append((start, prev, cur))
        if not runs:
            continue
        lines = ["        7'h{0:02x}: begin".format(maxc)]
        for lo, hi, delta in runs:
            if lo == hi:
                cond = "minc == 7'h{0:02x}".format(lo)
            else:
                cond = "minc >= 7'h{0:02x} && minc <= 7'h{1:02x}".format(lo, hi)
            lines.append("          if ({0}) correction_delta = 3'd{1};".format(cond, delta))
        lines.append("        end")
        blocks.extend(lines)
    return """module @MODULE@(in, out);
  input [15:0] in;
  output [7:0] out;
  wire [6:0] a = in[14:8];
  wire [6:0] b = in[6:0];
  wire nan = (a == 7'h7f) || (b == 7'h7f);
  wire [6:0] maxc = (a >= b) ? a : b;
  wire [6:0] minc = (a >= b) ? b : a;

  reg [2:0] correction_delta;
  always @* begin
    correction_delta = 3'd0;
    case (maxc)
@BLOCKS@
      default: correction_delta = 3'd0;
    endcase
  end

  wire [7:0] raw_mag = {1'b0, maxc} + {5'd0, correction_delta};
  wire [6:0] out_mag = (raw_mag >= 8'h7f) ? 7'h7e : raw_mag[6:0];
  assign out = nan ? 8'h7f : {1'b0, out_mag};
endmodule
""".replace("@MODULE@", module).replace("@BLOCKS@", "\n".join(blocks))


def fp8_sig_eff(code):
    exp = (code >> 3) & 0xF
    mant = code & 0x7
    if exp == 0:
        return mant, 1
    return 8 + mant, exp


def render_mul_field_table(module):
    table = {}
    for a in range(128):
        for b in range(128):
            if FP8.nan[a] or FP8.nan[b]:
                continue
            sig_a, eff_a = fp8_sig_eff(a)
            sig_b, eff_b = fp8_sig_eff(b)
            sig_hi = max(sig_a, sig_b)
            sig_lo = min(sig_a, sig_b)
            key = ((eff_a + eff_b) << 8) | (sig_hi << 4) | sig_lo
            mag = FP8.quant_mag_rational(FP8.k[a] * FP8.k[b], 512)
            table[key] = mag
    entries = [
        "        13'h{0:04x}: mag_table = 7'h{1:02x};".format(key, table[key])
        for key in sorted(table)
    ]
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

  wire [3:0] sig_a = sig4(a[6:0]);
  wire [3:0] sig_b = sig4(b[6:0]);
  wire [3:0] sig_hi = (sig_a >= sig_b) ? sig_a : sig_b;
  wire [3:0] sig_lo = (sig_a >= sig_b) ? sig_b : sig_a;
  wire [4:0] exp_sum = eff_exp(a[6:0]) + eff_exp(b[6:0]);
  wire [6:0] out_mag = mag_table({exp_sum, sig_hi, sig_lo});
  assign out = nan ? 8'h7f : {sign, out_mag};
endmodule
""".replace("@MODULE@", module).replace("@ENTRIES@", "\n".join(entries))


def render_mul_product_table(module):
    table = {}
    for a in range(128):
        for b in range(128):
            if FP8.nan[a] or FP8.nan[b]:
                continue
            sig_a, eff_a = fp8_sig_eff(a)
            sig_b, eff_b = fp8_sig_eff(b)
            key = ((eff_a + eff_b) << 8) | (sig_a * sig_b)
            table[key] = FP8.quant_mag_rational(FP8.k[a] * FP8.k[b], 512)
    entries = [
        "        13'h{0:04x}: mag_table = 7'h{1:02x};".format(key, table[key])
        for key in sorted(table)
    ]
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

  wire [7:0] sig_product = sig4(a[6:0]) * sig4(b[6:0]);
  wire [4:0] exp_sum = eff_exp(a[6:0]) + eff_exp(b[6:0]);
  wire [6:0] out_mag = mag_table({exp_sum, sig_product});
  assign out = nan ? 8'h7f : {sign, out_mag};
endmodule
""".replace("@MODULE@", module).replace("@ENTRIES@", "\n".join(entries))


def render_div_field_table(module):
    table = {}
    for den in range(128):
        for num in range(128):
            if FP8.nan[num] or FP8.nan[den]:
                continue
            sig_n, eff_n = fp8_sig_eff(num)
            sig_d, eff_d = fp8_sig_eff(den)
            if sig_d == 0:
                continue
            delta = eff_n - eff_d
            key = ((delta + 15) << 8) | (sig_n << 4) | sig_d
            mag = FP8.div_mag(num, den)
            table[key] = mag
    entries = [
        "        13'h{0:04x}: mag_table = 7'h{1:02x};".format(key, table[key])
        for key in sorted(table)
    ]
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
""".replace("@MODULE@", module).replace("@ENTRIES@", "\n".join(entries))


def div_exact_mag_from_sig_delta(sig_n, sig_d, delta):
    if sig_n == 0:
        return 0
    if sig_d == 0:
        return 0x7F
    if delta >= 0:
        return FP8.quant_mag_rational(sig_n * 512 * (1 << delta), sig_d)
    return FP8.quant_mag_rational(sig_n * 512, sig_d * (1 << (-delta)))


def render_div_formula_exception(module):
    from collections import Counter

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
            # Store offset as signed 5-bit two's-complement plus 4-bit sig.
            off_bits = off & 0x1F
            param_entries.append(
                "        8'h{0:02x}: param_table = 9'h{1:03x};".format(
                    (sig_n << 4) | sig_d, (off_bits << 4) | (sig & 0xF)
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


def render_candidate(case, variant, module):
    if case == "ex240":
        if variant == "semantic_add_norm":
            return render_add_norm(module)
        if variant == "semantic_add_pair_delta":
            return render_add_pair_delta(module)
        return render_add_scaled(module)
    if case == "ex241":
        if variant == "semantic_mul_product_table":
            return render_mul_product_table(module)
        if variant == "semantic_mul_field_table":
            return render_mul_field_table(module)
        return render_mul_scaled(module)
    if case == "ex242" and variant == "semantic_div_field_table":
        return render_div_field_table(module)
    if case == "ex242" and variant == "semantic_div_formula_exception":
        return render_div_formula_exception(module)
    if case == "ex243" and variant == "semantic_fmod_default_exception":
        return render_fmod_default_exception(module)
    if case == "ex244" and variant == "semantic_hypot_max_delta":
        return render_hypot_max_delta(module, gap_guard=False)
    if case == "ex244" and variant == "semantic_hypot_gap_delta":
        return render_hypot_max_delta(module, gap_guard=True)
    if case == "ex244" and variant == "semantic_hypot_run_delta":
        return render_hypot_run_delta(module)
    if case in ("ex242", "ex243", "ex244"):
        return render_mag_table(module, case)
    raise ValueError(case)


def script_default(verilog, module, output, abc_gate="AND", synth_preset=False):
    if synth_preset:
        return "\n".join(
            [
                "read_verilog {0}".format(yosys_quote(verilog)),
                "synth -top {0} -flatten".format(module),
                "abc -g {0}".format(abc_gate),
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
            "abc -g {0}".format(abc_gate),
            "opt",
            "aigmap",
            "opt",
            "clean",
            "write_aiger -symbols {0}".format(yosys_quote(output)),
        ]
    ) + "\n"


SYNTH_VARIANTS = [
    ("default", lambda v, m, o: script_default(v, m, o, "AND", False)),
    ("abc_g_aig", lambda v, m, o: script_default(v, m, o, "aig", False)),
    ("synth_preset", lambda v, m, o: script_default(v, m, o, "AND", True)),
    ("synth_preset_aig", lambda v, m, o: script_default(v, m, o, "aig", True)),
]


def synthesize_with_script(script, yosys, timeout, log_path):
    log_path.parent.mkdir(parents=True, exist_ok=True)
    script_path = log_path.with_suffix(".ys")
    # The AIG output path is embedded in the script; create the sibling aigs
    # directory here because write_aiger will not create it.
    aig_dir = log_path.parent.parent / "aigs"
    aig_dir.mkdir(parents=True, exist_ok=True)
    write_text(script_path, script)
    code, log = run_command([str(yosys), "-s", str(script_path)], timeout=timeout)
    write_text(log_path, log)
    if code != 0:
        raise SynthError("Yosys failed with exit code {0}".format(code))


def model_matches_truth(case):
    table = TruthTable(ROOT / "benchmarks" / "{0}.truth".format(case))
    for idx in range(table.num_inputs):
        high = (idx >> 8) & 0xFF
        low = idx & 0xFF
        expected = table.get_output(idx)
        if case in ("ex242", "ex243", "ex244"):
            if case == "ex242":
                mag = FP8.div_mag(low & 0x7F, high & 0x7F)
                pred = 0x7F if mag == 0x7F else (((high ^ low) & 0x80) | mag)
            elif case == "ex243":
                mag = FP8.fmod_mag(low & 0x7F, high & 0x7F)
                pred = 0x7F if mag == 0x7F else ((low & 0x80) | mag)
            else:
                mag = FP8.hypot_mag(high & 0x7F, low & 0x7F)
                pred = 0x7F if mag == 0x7F else mag
            if pred != expected:
                return False, idx, expected, pred
    return True, None, None, None


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


def run_case(args, refs, case):
    rows = []
    truth = args.benchmarks / "{0}.truth".format(case)
    for variant, note in CASE_VARIANTS[case]:
        if args.variant_names and variant not in args.variant_names:
            continue
        module = "{0}_{1}".format(case, variant)
        verilog_path = args.work_dir / case / "verilog" / "{0}.v".format(module)
        write_text(verilog_path, render_candidate(case, variant, module))
        for synth_name, renderer in SYNTH_VARIANTS:
            candidate_id = "{0}_{1}".format(module, synth_name)
            aig_path = args.work_dir / case / "aigs" / "{0}.aig".format(candidate_id)
            log_path = args.work_dir / case / "logs" / "{0}.yosys.log".format(candidate_id)
            row = empty_row(case, candidate_id, variant + "_" + synth_name, note, verilog_path, aig_path)
            start = time.time()
            try:
                script = renderer(verilog_path, module, aig_path)
                synthesize_with_script(script, args.yosys, args.timeout, log_path)
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
    for case in CASES:
        valid = [row for row in rows if row["case"] == case and row["equivalent"] == "1" and row["adp"]]
        if valid:
            row = min(valid, key=lambda item: int(item["adp"]))
            best.append({name: row.get(name, "") for name in BEST_FIELDNAMES})
    return best


def write_manifest(args, rows):
    manifest = {
        "run_id": args.run_id,
        "purpose": "FP8 E4M3FN semantic frontend seeds for ex240-ex244",
        "cases": CASES,
        "work_dir": rel_path(args.work_dir),
        "results_dir": rel_path(args.results_dir),
        "rows": rows,
    }
    write_text(args.work_dir / "manifest.json", json.dumps(manifest, indent=2) + "\n")
    write_text(
        args.run_dir / "MANIFEST.md",
        "# {0}\n\nRun ID: `{0}`\n\nPurpose: FP8 E4M3FN semantic frontend seeds for ex240-ex244.\n\nArtifacts:\n- Work directory: `{1}`\n- Candidates CSV: `{2}`\n- Best CSV: `{3}`\n\nMethods tried:\n- ex240 semantic E4M3FN add\n- ex241 semantic E4M3FN multiply\n- ex242 semantic low-byte/high-byte division magnitude table\n- ex243 semantic fmod/remainder magnitude table\n- ex244 semantic hypot(abs operands) magnitude table\n\nBest result: see `results/best.csv`.\n".format(
            args.run_id,
            rel_path(args.work_dir),
            rel_path(args.results_dir / "candidates.csv"),
            rel_path(args.results_dir / "best.csv"),
        ),
    )


def parse_args(argv=None):
    parser = argparse.ArgumentParser(description="Generate FP8 semantic frontend candidates for ex240-ex244.")
    parser.add_argument("--run-id", required=True)
    parser.add_argument("--work-dir", type=Path)
    parser.add_argument("--run-dir", type=Path)
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--reference", type=Path, default=ROOT / "reference_result.csv")
    parser.add_argument("--yosys", type=Path, default=ROOT / "student/tools/conda-env/bin/yosys")
    parser.add_argument("--abc", type=Path, default=ROOT / "student/abc")
    parser.add_argument("--timeout", type=int, default=900)
    parser.add_argument("--cases", default=",".join(CASES))
    parser.add_argument("--variants", default="", help="Comma-separated source variant names to run.")
    return parser.parse_args(argv)


def main(argv=None):
    args = parse_args(argv)
    args.work_dir = args.work_dir or (ROOT / "student" / "work" / args.run_id)
    args.run_dir = args.run_dir or (ROOT / "student" / "runs" / "float_fp8" / args.run_id)
    args.results_dir = args.run_dir / "results"
    refs = load_reference(args.reference)
    selected_cases = [item.strip() for item in args.cases.split(",") if item.strip()]
    args.variant_names = {item.strip() for item in args.variants.split(",") if item.strip()}

    rows = []
    for case in selected_cases:
        if case not in CASES:
            raise RuntimeError("unsupported case: {0}".format(case))
        if case in ("ex242", "ex243", "ex244"):
            ok, idx, expected, pred = model_matches_truth(case)
            if not ok:
                raise RuntimeError("{0} model mismatch at {1:#x}: expected {2:#x}, pred {3:#x}".format(case, idx, expected, pred))
        rows.extend(run_case(args, refs, case))

    write_csv(args.results_dir / "candidates.csv", RESULT_FIELDNAMES, rows)
    write_csv(args.results_dir / "best.csv", BEST_FIELDNAMES, best_rows(rows))
    summary = []
    for row in best_rows(rows):
        summary.append(row)
    write_csv(args.results_dir / "summary.csv", BEST_FIELDNAMES, summary)
    write_csv(args.results_dir / "evaluate_check.csv", RESULT_FIELDNAMES, rows)
    write_manifest(args, rows)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
