#!/usr/bin/env python3
"""Focused unsigned-multiply frontend structures for ex255-ex259.

This intentionally avoids another broad multiplier sweep.  The renderers here
try a small set of hand-structured ideas aimed at the remaining ADP gap,
especially ex256's 5x5 delay.
"""

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
from student.frontends.yosys_synth import DEFAULT_YOSYS, SynthError
from student.generators import integer_ex255_ex259_mul_frontend as base


CASES = base.CASES
CASE_PART_WIDTH = base.CASE_PART_WIDTH

SOURCE_VARIANTS = (
    "csa_androws",
    "csa_androws_cla",
    "csa_androws_rev_cla",
    "csa_androws_evenodd_cla",
    "csa_androws_outside_cla",
    "csa_androws_center_cla",
    "csa_androws_cla_from2",
    "csa_androws_cla_from3",
    "csa_androws_cla_from4",
    "csa_concat_cla",
    "csa_concat_rev_cla",
    "csa_concat_outside_cla",
    "csa_concat_center_cla",
    "csa_androws_prefix_ks",
    "csa_androws_prefix_sklansky",
    "csa_androws_carryselect2",
    "csa_androws_carryselect3",
    "csa_androws_4to2_leave0_cla",
    "csa_androws_4to2_leave1_cla",
    "csa_androws_4to2_leave2_cla",
    "csa_androws_4to2_leave3_cla",
    "csa_androws_4to2_leave4_cla",
    "csa_cla_low7_top_lut",
    "csa_cla_low8_top_lut",
    "csa_cla_low9_top_lut",
    "highbit_decomp_upper_cla",
    "ex256_column_threshold_pred",
    "ex256_column_threshold_min_sop",
    "ex256_column_pairtree_pred",
    "ex256_column_threshold_fastcarry",
    "ex256_carry_state_prefix",
    "wallace_bits",
    "wallace_bits_cla",
    "wallace_bits_rev_cla",
    "wallace_bits_outside_cla",
    "wallace_bits_prefix",
    "column_case_carry",
    "block_split_lo2",
    "block_split_lo3",
    "block_split_case_lo2",
    "block_split_case_lo3",
    "karatsuba_odd",
    "sorted_case_const",
    "critical_low_direct",
    "full_product_case",
    "per_bit_lut",
    "per_bit_lut_low_formula",
)

FLOW_VARIANTS = (
    "default",
    "abc_g_aig",
    "abc_g_aig_d12",
    "abc_g_aig_d13",
    "abc_g_aig_d14",
    "abc_g_aig_d15",
    "synth_preset_d12",
    "synth_preset_d13",
    "synth_preset_d14",
    "synth_preset_d15",
    "synth_preset_d18",
    "wreduce_abc_g_aig",
    "abc_lut3_to_aig",
    "abc_lut4_to_aig",
    "abc_lut5_to_aig",
)

RESULT_FIELDNAMES = base.RESULT_FIELDNAMES
BEST_FIELDNAMES = base.BEST_FIELDNAMES


def rel(path):
    return base.rel(path)


def write_text(path, text):
    return base.write_text(path, text)


def write_csv(path, fieldnames, rows):
    return base.write_csv(path, fieldnames, rows)


def header(module, n):
    return base.header(module, n)


def zero_word(width):
    return base.zero_word(width)


def const(width, value):
    return base.const(width, value)


def render_column_case_carry(module, n):
    width = 2 * n
    carry_width = max(3, (n + 1).bit_length() + 1)
    lines = header(module, n)
    for i in range(n):
        for j in range(n):
            lines.append("  wire pp_{0}_{1} = a[{0}] & b[{1}];".format(i, j))
    lines.append("  reg [{0}:0] out_r;".format(width - 1))
    for col in range(width):
        lines.append("  reg [{0}:0] carry{1};".format(carry_width - 1, col))
    lines.append("  always @* begin")
    lines.append("    out_r = {0};".format(zero_word(width)))
    lines.append("    carry0 = {0}'b0;".format(carry_width))
    for col in range(width):
        pp_names = []
        for i in range(n):
            j = col - i
            if 0 <= j < n:
                pp_names.append("pp_{0}_{1}".format(i, j))
        inputs = ["carry{0}".format(col)] + pp_names
        in_width = carry_width + len(pp_names)
        next_carry = "carry{0}".format(col + 1) if col + 1 < width else None
        lines.append("    case ({{{0}}})".format(", ".join(inputs)))
        for carry_value in range(1 << carry_width):
            for pp_value in range(1 << len(pp_names)):
                total = carry_value
                for bit in range(len(pp_names)):
                    if pp_value & (1 << bit):
                        total += 1
                out_bit = total & 1
                carry_out = total >> 1
                in_value = (carry_value << len(pp_names)) | pp_value
                if next_carry:
                    out_value = (carry_out << 1) | out_bit
                    lines.append(
                        "      {0}'d{1}: {{{2}, out_r[{3}]}} = {4}'d{5};".format(
                            in_width,
                            in_value,
                            next_carry,
                            col,
                            carry_width + 1,
                            out_value,
                        )
                    )
                else:
                    lines.append("      {0}'d{1}: out_r[{2}] = 1'b{3};".format(in_width, in_value, col, out_bit))
        if next_carry:
            lines.append("      default: {{{0}, out_r[{1}]}} = {2}'b0;".format(next_carry, col, carry_width + 1))
        else:
            lines.append("      default: out_r[{0}] = 1'b0;".format(col))
        lines.append("    endcase")
    lines.append("  end")
    lines.append("  assign out = out_r;")
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def render_small_mul_case(lines, out_name, a_name, a_width, b_name, b_width):
    out_width = a_width + b_width
    lines.append("  reg [{0}:0] {1};".format(out_width - 1, out_name))
    lines.append("  always @* begin")
    lines.append("    case ({{{0}, {1}}})".format(b_name, a_name))
    for b in range(1 << b_width):
        for a in range(1 << a_width):
            key = (b << a_width) | a
            lines.append("      {0}'d{1}: {2} = {3};".format(a_width + b_width, key, out_name, const(out_width, a * b)))
    lines.append("      default: {0} = {1};".format(out_name, zero_word(out_width)))
    lines.append("    endcase")
    lines.append("  end")
    return out_width


def render_block_split(module, n, lo, use_case=False):
    if lo <= 0 or lo >= n:
        return None
    hi = n - lo
    width = 2 * n
    lines = header(module, n)
    lines.extend(
        [
            "  wire [{0}:0] a0 = a[{0}:0];".format(lo - 1),
            "  wire [{0}:0] b0 = b[{0}:0];".format(lo - 1),
            "  wire [{0}:0] a1 = a[{1}:{2}];".format(hi - 1, n - 1, lo),
            "  wire [{0}:0] b1 = b[{1}:{2}];".format(hi - 1, n - 1, lo),
        ]
    )
    if use_case:
        p00w = render_small_mul_case(lines, "p00", "a0", lo, "b0", lo)
        p01w = render_small_mul_case(lines, "p01", "a0", lo, "b1", hi)
        p10w = render_small_mul_case(lines, "p10", "a1", hi, "b0", lo)
        p11w = render_small_mul_case(lines, "p11", "a1", hi, "b1", hi)
    else:
        p00w = 2 * lo
        p01w = lo + hi
        p10w = lo + hi
        p11w = 2 * hi
        lines.extend(
            [
                "  wire [{0}:0] p00 = a0 * b0;".format(p00w - 1),
                "  wire [{0}:0] p01 = a0 * b1;".format(p01w - 1),
                "  wire [{0}:0] p10 = a1 * b0;".format(p10w - 1),
                "  wire [{0}:0] p11 = a1 * b1;".format(p11w - 1),
            ]
        )
    lines.extend(
        [
            "  wire [{0}:0] t00 = {{{1}'b0, p00}};".format(width - 1, width - p00w),
            "  wire [{0}:0] t01 = {{{1}'b0, p01}} << {2};".format(width - 1, width - p01w, lo),
            "  wire [{0}:0] t10 = {{{1}'b0, p10}} << {2};".format(width - 1, width - p10w, lo),
            "  wire [{0}:0] t11 = {{{1}'b0, p11}} << {2};".format(width - 1, width - p11w, 2 * lo),
            "  wire [{0}:0] mid = t01 + t10;".format(width - 1),
            "  assign out = (t00 + t11) + mid;",
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


def render_block_split_lo2(module, n):
    if n < 4:
        return None
    return render_block_split(module, n, 2, False)


def render_block_split_lo3(module, n):
    if n < 5:
        return None
    return render_block_split(module, n, 3, False)


def render_block_split_case_lo2(module, n):
    if n < 4:
        return None
    return render_block_split(module, n, 2, True)


def render_block_split_case_lo3(module, n):
    if n < 5:
        return None
    return render_block_split(module, n, 3, True)


def render_karatsuba_odd(module, n):
    if n < 5:
        return None
    lo = n // 2
    hi = n - lo
    width = 2 * n
    sum_width = hi + 1
    lines = header(module, n)
    lines.extend(
        [
            "  wire [{0}:0] a0 = a[{0}:0];".format(lo - 1),
            "  wire [{0}:0] b0 = b[{0}:0];".format(lo - 1),
            "  wire [{0}:0] a1 = a[{1}:{2}];".format(hi - 1, n - 1, lo),
            "  wire [{0}:0] b1 = b[{1}:{2}];".format(hi - 1, n - 1, lo),
            "  wire [{0}:0] p0 = a0 * b0;".format(2 * lo - 1),
            "  wire [{0}:0] p2 = a1 * b1;".format(2 * hi - 1),
            "  wire [{0}:0] sa = {{{1}'b0, a0}} + {{1'b0, a1}};".format(sum_width - 1, sum_width - lo),
            "  wire [{0}:0] sb = {{{1}'b0, b0}} + {{1'b0, b1}};".format(sum_width - 1, sum_width - lo),
            "  wire [{0}:0] ps = sa * sb;".format(2 * sum_width - 1),
            "  wire [{0}:0] mid = ps - {{{1}'b0, p0}} - {{{2}'b0, p2}};".format(
                2 * sum_width - 1,
                2 * sum_width - 2 * lo,
                2 * sum_width - 2 * hi,
            ),
            "  wire [{0}:0] t0 = {{{1}'b0, p0}};".format(width - 1, width - 2 * lo),
            "  wire [{0}:0] tm = {{{1}'b0, mid}} << {2};".format(width - 1, width - 2 * sum_width, lo),
            "  wire [{0}:0] t2 = {{{1}'b0, p2}} << {2};".format(width - 1, width - 2 * hi, 2 * lo),
            "  assign out = (t0 + t2) + tm;",
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


def render_sorted_case_const(module, n):
    width = 2 * n
    lines = header(module, n)
    lines.extend(
        [
            "  wire swap = a > b;",
            "  wire [{0}:0] x = swap ? b : a;".format(n - 1),
            "  wire [{0}:0] y = swap ? a : b;".format(n - 1),
            "  reg [{0}:0] out_r;".format(width - 1),
            "  always @* begin",
            "    case (x)",
        ]
    )
    for value in range(1 << n):
        expr = base.const_mul_expr(n, width, value).replace("a", "y")
        lines.append("      {0}'d{1}: out_r = {2};".format(n, value, expr))
    lines.extend(
        [
            "      default: out_r = {0};".format(zero_word(width)),
            "    endcase",
            "  end",
            "  assign out = out_r;",
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


def render_critical_low_direct(module, n):
    """Direct low columns plus compact high correction around the old best gap."""
    if n < 5:
        return None
    width = 2 * n
    lines = header(module, n)
    cut = min(3, n - 2)
    lines.extend(
        [
            "  wire [{0}:0] alo = a[{0}:0];".format(cut - 1),
            "  wire [{0}:0] blo = b[{0}:0];".format(cut - 1),
            "  wire [{0}:0] ahi = a[{1}:{2}];".format(n - cut - 1, n - 1, cut),
            "  wire [{0}:0] bhi = b[{1}:{2}];".format(n - cut - 1, n - 1, cut),
            "  wire [{0}:0] p_lo = alo * blo;".format(2 * cut - 1),
            "  wire [{0}:0] cross = (alo * bhi) + (ahi * blo);".format(n),
            "  wire [{0}:0] p_hi = ahi * bhi;".format(2 * (n - cut) - 1),
            "  assign out = {{{0}'b0, p_lo}} + ({{{1}'b0, cross}} << {2}) + ({{{3}'b0, p_hi}} << {4});".format(
                width - 2 * cut,
                width - (n + 1),
                cut,
                width - 2 * (n - cut),
                2 * cut,
            ),
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


def render_full_product_case(module, n):
    if n > 6:
        return None
    width = 2 * n
    lines = header(module, n)
    lines.extend(
        [
            "  reg [{0}:0] out_r;".format(width - 1),
            "  always @* begin",
            "    case ({b, a})",
        ]
    )
    for b in range(1 << n):
        for a in range(1 << n):
            key = (b << n) | a
            lines.append("      {0}'d{1}: out_r = {2};".format(width, key, const(width, a * b)))
    lines.extend(
        [
            "      default: out_r = {0};".format(zero_word(width)),
            "    endcase",
            "  end",
            "  assign out = out_r;",
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


def render_per_bit_lut(module, n, low_formula=False):
    if n > 6:
        return None
    width = 2 * n
    lines = header(module, n)
    lines.append("  reg [{0}:0] out_r;".format(width - 1))
    if low_formula:
        low = min(3, n)
        lines.append("  wire [{0}:0] low_prod = a[{1}:0] * b[{1}:0];".format(2 * low - 1, low - 1))
    else:
        low = 0
    lines.append("  always @* begin")
    lines.append("    out_r = {0};".format(zero_word(width)))
    if low_formula:
        for bit in range(min(2 * low, width)):
            lines.append("    out_r[{0}] = low_prod[{0}];".format(bit))
    for bit in range(width):
        if low_formula and bit < 2 * low:
            continue
        if bit < n - 1:
            slice_width = bit + 1
        else:
            slice_width = n
        key_width = 2 * slice_width
        lines.append("    case ({{b[{0}:0], a[{0}:0]}})".format(slice_width - 1))
        for b in range(1 << slice_width):
            for a in range(1 << slice_width):
                value = ((a * b) >> bit) & 1
                key = (b << slice_width) | a
                lines.append("      {0}'d{1}: out_r[{2}] = 1'b{3};".format(key_width, key, bit, value))
        lines.append("      default: out_r[{0}] = 1'b0;".format(bit))
        lines.append("    endcase")
    lines.append("  end")
    lines.append("  assign out = out_r;")
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def render_per_bit_lut_plain(module, n):
    return render_per_bit_lut(module, n, False)


def render_per_bit_lut_low_formula(module, n):
    return render_per_bit_lut(module, n, True)


def append_cla_adder(lines, width, x_name, y_name, out_name, prefix):
    lines.append("  wire [{0}:0] {1}_p = {2} ^ {3};".format(width - 1, prefix, x_name, y_name))
    lines.append("  wire [{0}:0] {1}_g = {2} & {3};".format(width - 1, prefix, x_name, y_name))
    carry_exprs = ["1'b0"]
    for bit in range(width):
        terms = ["{0}_g[{1}]".format(prefix, bit)]
        for start in range(bit - 1, -1, -1):
            prop = " & ".join("{0}_p[{1}]".format(prefix, idx) for idx in range(start + 1, bit + 1))
            terms.append("({0} & {1}_g[{2}])".format(prop, prefix, start))
        carry_exprs.append("(" + " | ".join(terms) + ")")
    lines.append("  wire [{0}:0] {1};".format(width - 1, out_name))
    for bit in range(width):
        lines.append("  assign {0}[{1}] = {2}_p[{1}] ^ {3};".format(out_name, bit, prefix, carry_exprs[bit]))


def append_prefix_adder_topology(lines, width, x_name, y_name, out_name, prefix, topology):
    lines.append("  wire [{0}:0] {1};".format(width - 1, out_name))
    for bit in range(width):
        lines.append("  wire {0}_p0_{1} = {2}[{1}] ^ {3}[{1}];".format(prefix, bit, x_name, y_name))
        lines.append("  wire {0}_g0_{1} = {2}[{1}] & {3}[{1}];".format(prefix, bit, x_name, y_name))
    prev_stage = 0
    stage = 1
    span = 1
    while span < width:
        for bit in range(width):
            p_name = "{0}_p{1}_{2}".format(prefix, stage, bit)
            g_name = "{0}_g{1}_{2}".format(prefix, stage, bit)
            source = None
            if topology == "kogge":
                if bit >= span:
                    source = bit - span
            elif topology == "sklansky":
                block = span * 2
                base_index = (bit // block) * block
                if bit - base_index >= span:
                    source = base_index + span - 1
            else:
                raise RuntimeError("unknown prefix topology: {0}".format(topology))
            if source is None:
                lines.append("  wire {0} = {1}_p{2}_{3};".format(p_name, prefix, prev_stage, bit))
                lines.append("  wire {0} = {1}_g{2}_{3};".format(g_name, prefix, prev_stage, bit))
            else:
                lines.append(
                    "  wire {0} = {1}_p{2}_{3} & {1}_p{2}_{4};".format(
                        p_name,
                        prefix,
                        prev_stage,
                        bit,
                        source,
                    )
                )
                lines.append(
                    "  wire {0} = {1}_g{2}_{3} | ({1}_p{2}_{3} & {1}_g{2}_{4});".format(
                        g_name,
                        prefix,
                        prev_stage,
                        bit,
                        source,
                    )
                )
        prev_stage = stage
        stage += 1
        span <<= 1
    lines.append("  assign {0}[0] = {1}_p0_0;".format(out_name, prefix))
    for bit in range(1, width):
        lines.append("  assign {0}[{1}] = {2}_p0_{1} ^ {2}_g{3}_{4};".format(out_name, bit, prefix, prev_stage, bit - 1))


def append_carryselect_adder(lines, width, x_name, y_name, out_name, prefix, group_size):
    lines.append("  wire [{0}:0] {1};".format(width - 1, out_name))
    carry_name = "1'b0"
    group = 0
    for start in range(0, width, group_size):
        end = min(width, start + group_size)
        size = end - start
        if start == 0:
            lines.append(
                "  wire [{0}:0] {1}_g{2}_sum = {3}[{4}:{5}] + {6}[{4}:{5}];".format(
                    size,
                    prefix,
                    group,
                    x_name,
                    end - 1,
                    start,
                    y_name,
                )
            )
            for bit in range(size):
                lines.append("  assign {0}[{1}] = {2}_g{3}_sum[{4}];".format(out_name, start + bit, prefix, group, bit))
            carry_name = "{0}_g{1}_sum[{2}]".format(prefix, group, size)
        else:
            lines.append(
                "  wire [{0}:0] {1}_g{2}_sum0 = {3}[{4}:{5}] + {6}[{4}:{5}];".format(
                    size,
                    prefix,
                    group,
                    x_name,
                    end - 1,
                    start,
                    y_name,
                )
            )
            lines.append(
                "  wire [{0}:0] {1}_g{2}_sum1 = {3}[{4}:{5}] + {6}[{4}:{5}] + {7}'b1;".format(
                    size,
                    prefix,
                    group,
                    x_name,
                    end - 1,
                    start,
                    y_name,
                    size + 1,
                )
            )
            lines.append("  wire [{0}:0] {1}_g{2}_pick = {3} ? {1}_g{2}_sum1 : {1}_g{2}_sum0;".format(size, prefix, group, carry_name))
            for bit in range(size):
                lines.append("  assign {0}[{1}] = {2}_g{3}_pick[{4}];".format(out_name, start + bit, prefix, group, bit))
            carry_name = "{0}_g{1}_pick[{2}]".format(prefix, group, size)
        group += 1


def append_hybrid_cla_adder(lines, width, x_name, y_name, out_name, prefix, start):
    if start <= 0:
        append_cla_adder(lines, width, x_name, y_name, out_name, prefix)
        return
    lines.append("  wire [{0}:0] {1}_lo = {2}[{3}:0] + {4}[{3}:0];".format(start, prefix, x_name, start - 1, y_name))
    lines.append("  wire [{0}:0] {1};".format(width - 1, out_name))
    for bit in range(start):
        lines.append("  assign {0}[{1}] = {2}_lo[{1}];".format(out_name, bit, prefix))
    lines.append("  wire {0}_cin = {0}_lo[{1}];".format(prefix, start))
    lines.append("  wire [{0}:0] {1}_p = {2} ^ {3};".format(width - 1, prefix, x_name, y_name))
    lines.append("  wire [{0}:0] {1}_g = {2} & {3};".format(width - 1, prefix, x_name, y_name))
    carry_exprs = {start: "{0}_cin".format(prefix)}
    for bit in range(start, width):
        terms = ["{0}_g[{1}]".format(prefix, bit)]
        for source in range(bit - 1, start - 1, -1):
            prop = " & ".join("{0}_p[{1}]".format(prefix, idx) for idx in range(source + 1, bit + 1))
            terms.append("({0} & {1}_g[{2}])".format(prop, prefix, source))
        prop_to_start = " & ".join("{0}_p[{1}]".format(prefix, idx) for idx in range(start, bit + 1))
        terms.append("({0} & {1}_cin)".format(prop_to_start, prefix))
        carry_exprs[bit + 1] = "(" + " | ".join(terms) + ")"
    for bit in range(start, width):
        lines.append("  assign {0}[{1}] = {2}_p[{1}] ^ {3};".format(out_name, bit, prefix, carry_exprs[bit]))


def render_csa_androws_cla(module, n):
    return render_csa_with_final(module, n, "and_shift", "natural", "cla", 0)


def render_csa_androws_rev_cla(module, n):
    return render_csa_with_final(module, n, "and_shift", "reverse", "cla", 0)


def render_csa_androws_evenodd_cla(module, n):
    return render_csa_with_final(module, n, "and_shift", "evenodd", "cla", 0)


def render_csa_androws_outside_cla(module, n):
    return render_csa_with_final(module, n, "and_shift", "outside", "cla", 0)


def render_csa_androws_center_cla(module, n):
    return render_csa_with_final(module, n, "and_shift", "center", "cla", 0)


def render_csa_androws_cla_from2(module, n):
    return render_csa_with_final(module, n, "and_shift", "natural", "hybrid_cla", 2)


def render_csa_androws_cla_from3(module, n):
    return render_csa_with_final(module, n, "and_shift", "natural", "hybrid_cla", 3)


def render_csa_androws_cla_from4(module, n):
    return render_csa_with_final(module, n, "and_shift", "natural", "hybrid_cla", 4)


def render_csa_concat_cla(module, n):
    return render_csa_with_final(module, n, "concat_and", "natural", "cla", 0)


def render_csa_concat_rev_cla(module, n):
    return render_csa_with_final(module, n, "concat_and", "reverse", "cla", 0)


def render_csa_concat_outside_cla(module, n):
    return render_csa_with_final(module, n, "concat_and", "outside", "cla", 0)


def render_csa_concat_center_cla(module, n):
    return render_csa_with_final(module, n, "concat_and", "center", "cla", 0)


def render_csa_androws_prefix_ks(module, n):
    return render_csa_with_final(module, n, "and_shift", "natural", "prefix_kogge", 0)


def render_csa_androws_prefix_sklansky(module, n):
    return render_csa_with_final(module, n, "and_shift", "natural", "prefix_sklansky", 0)


def render_csa_androws_carryselect2(module, n):
    return render_csa_with_final(module, n, "and_shift", "natural", "carryselect2", 0)


def render_csa_androws_carryselect3(module, n):
    return render_csa_with_final(module, n, "and_shift", "natural", "carryselect3", 0)


def append_fa(lines, width, x, y, z, s, c):
    lines.append("  wire [{0}:0] {1} = {2} ^ {3} ^ {4};".format(width - 1, s, x, y, z))
    lines.append("  wire [{0}:0] {1} = (({2} & {3}) | ({2} & {4}) | ({3} & {4})) << 1;".format(width - 1, c, x, y, z))


def render_csa_androws_4to2_cla(module, n, leave):
    if n < 5:
        return None
    lines = header(module, n)
    width = 2 * n
    rows = []
    for row_index, bit in enumerate(range(n)):
        name = "row{0}".format(row_index)
        rows.append(name)
        lines.append("  wire [{0}:0] {1} = {2};".format(width - 1, name, base.row_expr(n, width, bit, "and_shift")))
    packed = [rows[index] for index in range(n) if index != leave]
    left = rows[leave]
    append_fa(lines, width, packed[0], packed[1], packed[2], "ft_temp_s", "ft_temp_c")
    append_fa(lines, width, "ft_temp_s", "ft_temp_c", packed[3], "ft_s", "ft_c")
    append_fa(lines, width, "ft_s", "ft_c", left, "ft2_s", "ft2_c")
    append_cla_adder(lines, width, "ft2_s", "ft2_c", "cla_sum", "ftcla")
    lines.append("  assign out = cla_sum;")
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def render_csa_androws_4to2_leave0_cla(module, n):
    return render_csa_androws_4to2_cla(module, n, 0)


def render_csa_androws_4to2_leave1_cla(module, n):
    return render_csa_androws_4to2_cla(module, n, 1)


def render_csa_androws_4to2_leave2_cla(module, n):
    return render_csa_androws_4to2_cla(module, n, 2)


def render_csa_androws_4to2_leave3_cla(module, n):
    return render_csa_androws_4to2_cla(module, n, 3)


def render_csa_androws_4to2_leave4_cla(module, n):
    return render_csa_androws_4to2_cla(module, n, 4)


def render_csa_cla_low_top_lut(module, n, low_width):
    width = 2 * n
    if low_width <= 0 or low_width >= width:
        return None
    lines = header(module, n)
    rows = []
    for row_index, bit in enumerate(range(n)):
        name = "row{0}".format(row_index)
        rows.append(name)
        lines.append("  wire [{0}:0] {1} = {2};".format(width - 1, name, base.row_expr(n, width, bit, "and_shift")))
    stage = 0
    while len(rows) > 2:
        next_rows = []
        for index in range(0, len(rows), 3):
            chunk = rows[index : index + 3]
            if len(chunk) == 3:
                s = "s{0}_{1}".format(stage, index // 3)
                c = "c{0}_{1}".format(stage, index // 3)
                append_fa(lines, width, chunk[0], chunk[1], chunk[2], s, c)
                next_rows.extend([s, c])
            else:
                next_rows.extend(chunk)
        rows = next_rows
        stage += 1
    lines.append("  wire [{0}:0] lo_x = {1}[{0}:0];".format(low_width - 1, rows[0]))
    lines.append("  wire [{0}:0] lo_y = {1}[{0}:0];".format(low_width - 1, rows[1]))
    append_cla_adder(lines, low_width, "lo_x", "lo_y", "lo_sum", "locla")
    lines.append("  reg [{0}:0] top_bits;".format(width - low_width - 1))
    lines.append("  always @* begin")
    lines.append("    case ({b, a})")
    for b in range(1 << n):
        for a in range(1 << n):
            key = (b << n) | a
            value = (a * b) >> low_width
            lines.append("      {0}'d{1}: top_bits = {2};".format(width, key, const(width - low_width, value)))
    lines.append("      default: top_bits = {0};".format(zero_word(width - low_width)))
    lines.append("    endcase")
    lines.append("  end")
    lines.append("  assign out = {top_bits, lo_sum};")
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def render_csa_cla_low7_top_lut(module, n):
    return render_csa_cla_low_top_lut(module, n, 7)


def render_csa_cla_low8_top_lut(module, n):
    return render_csa_cla_low_top_lut(module, n, 8)


def render_csa_cla_low9_top_lut(module, n):
    return render_csa_cla_low_top_lut(module, n, 9)


def render_highbit_decomp_upper_cla(module, n):
    if n != 5:
        return None
    width = 2 * n
    lines = header(module, n)
    lines.extend(
        [
            "  wire [3:0] a0 = a[3:0];",
            "  wire [3:0] b0 = b[3:0];",
            "  wire ah = a[4];",
            "  wire bh = b[4];",
            "  wire [7:0] p0 = a0 * b0;",
            "  wire [4:0] cross_a = ah ? {1'b0, b0} : 5'b0;",
            "  wire [4:0] cross_b = bh ? {1'b0, a0} : 5'b0;",
            "  wire [4:0] cross = cross_a + cross_b;",
            "  wire hh = ah & bh;",
            "  wire [5:0] upper0 = {2'b0, p0[7:4]};",
            "  wire [5:0] upper1 = {1'b0, cross};",
            "  wire [5:0] upper2 = {1'b0, hh, 4'b0};",
        ]
    )
    append_fa(lines, 6, "upper0", "upper1", "upper2", "upper_s", "upper_c")
    append_cla_adder(lines, 6, "upper_s", "upper_c", "upper_sum", "upcla")
    lines.extend(
        [
            "  assign out = {upper_sum, p0[3:0]};",
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


def threshold_expr(bits, threshold):
    bits = list(bits)
    if threshold <= 0:
        return "1'b1"
    if threshold > len(bits):
        return "1'b0"
    terms = []
    def rec(start, picked):
        if len(picked) == threshold:
            terms.append("(" + " & ".join(picked) + ")")
            return
        remaining = threshold - len(picked)
        for index in range(start, len(bits) - remaining + 1):
            rec(index + 1, picked + [bits[index]])
    rec(0, [])
    return " | ".join(terms) if terms else "1'b0"


def exact_weighted_bit_expr(weighted_bits, bit_index):
    weighted_bits = list(weighted_bits)
    terms = []
    for mask in range(1 << len(weighted_bits)):
        total = 0
        factors = []
        for index, (name, weight) in enumerate(weighted_bits):
            if mask & (1 << index):
                total += weight
                factors.append(name)
            else:
                factors.append("~" + name)
        if (total >> bit_index) & 1:
            terms.append("(" + " & ".join(factors) + ")")
    return " | ".join(terms) if terms else "1'b0"


def combine_implicant(a, b):
    diff = 0
    out = []
    for ca, cb in zip(a, b):
        if ca == cb:
            out.append(ca)
        elif ca != "-" and cb != "-":
            diff += 1
            out.append("-")
        else:
            return None
    return "".join(out) if diff == 1 else None


def implicant_covers(implicant, minterm):
    bits = "".join("1" if minterm & (1 << index) else "0" for index in range(len(implicant)))
    return all(char == "-" or char == bits[index] for index, char in enumerate(implicant))


def minimized_sop_expr(weighted_bits, bit_index):
    return minimized_sop_expr_const(weighted_bits, bit_index, 0)


def minimized_sop_expr_const(weighted_bits, bit_index, const_offset):
    weighted_bits = list(weighted_bits)
    nvars = len(weighted_bits)
    minterms = []
    for mask in range(1 << nvars):
        total = const_offset
        for index, (_, weight) in enumerate(weighted_bits):
            if mask & (1 << index):
                total += weight
        if (total >> bit_index) & 1:
            minterms.append(mask)
    if not minterms:
        return "1'b0"
    if len(minterms) == (1 << nvars):
        return "1'b1"

    groups = {}
    for minterm in minterms:
        bits = "".join("1" if minterm & (1 << index) else "0" for index in range(nvars))
        groups.setdefault(bits.count("1"), set()).add(bits)

    primes = set()
    current = groups
    while current:
        used = set()
        next_groups = {}
        keys = sorted(current)
        for key in keys:
            for item in current.get(key, set()):
                for other in current.get(key + 1, set()):
                    combined = combine_implicant(item, other)
                    if combined is not None:
                        used.add(item)
                        used.add(other)
                        next_groups.setdefault(combined.count("1"), set()).add(combined)
        for items in current.values():
            for item in items:
                if item not in used:
                    primes.add(item)
        current = next_groups

    uncovered = set(minterms)
    selected = []
    cover_map = {prime: {m for m in minterms if implicant_covers(prime, m)} for prime in primes}
    while uncovered:
        essential = None
        for minterm in list(uncovered):
            covering = [prime for prime, covered in cover_map.items() if minterm in covered]
            if len(covering) == 1:
                essential = covering[0]
                break
        if essential is None:
            essential = max(
                cover_map,
                key=lambda prime: (len(cover_map[prime] & uncovered), prime.count("-"), prime),
            )
        selected.append(essential)
        uncovered -= cover_map[essential]

    terms = []
    for implicant in selected:
        factors = []
        for index, char in enumerate(implicant):
            name = weighted_bits[index][0]
            if char == "1":
                factors.append(name)
            elif char == "0":
                factors.append("~" + name)
        terms.append("1'b1" if not factors else "(" + " & ".join(factors) + ")")
    return " | ".join(terms)


def weighted_parity_expr(weighted_bits):
    odd_weight_names = [name for name, weight in weighted_bits if weight & 1]
    return parity_expr(odd_weight_names)


def parity_expr(bits):
    bits = list(bits)
    if not bits:
        return "1'b0"
    return " ^ ".join(bits)


def column_pp_names(n, col):
    out = []
    for i in range(n):
        j = col - i
        if 0 <= j < n:
            out.append("pp_{0}_{1}".format(i, j))
    return out


def emit_pp(lines, n):
    for i in range(n):
        for j in range(n):
            lines.append("  wire pp_{0}_{1} = a[{0}] & b[{1}];".format(i, j))


def render_ex256_column_threshold_pred(module, n):
    if n != 5:
        return None
    width = 10
    lines = header(module, n)
    emit_pp(lines, n)
    lines.append("  assign out[0] = pp_0_0;")
    lines.append("  assign out[1] = pp_0_1 ^ pp_1_0;")
    lines.append("  wire c2_0 = pp_0_1 & pp_1_0;")
    carry_bits = [("c2_0", 1)]
    for col in range(2, 9):
        pp_bits = column_pp_names(n, col)
        weighted = [(name, 1) for name in pp_bits] + carry_bits
        lines.append("  assign out[{0}] = {1};".format(col, weighted_parity_expr(weighted)))
        max_total = sum(weight for _, weight in weighted)
        next_width = max(1, (max_total >> 1).bit_length())
        next_carry = []
        for bit in range(next_width):
            name = "c{0}_{1}".format(col + 1, bit)
            lines.append("  wire {0} = {1};".format(name, exact_weighted_bit_expr(weighted, bit + 1)))
            next_carry.append((name, 1 << bit))
        carry_bits = next_carry
    lines.append("  assign out[9] = {0};".format(weighted_parity_expr(carry_bits)))
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def render_ex256_column_threshold_min_sop(module, n):
    if n != 5:
        return None
    width = 10
    lines = header(module, n)
    emit_pp(lines, n)
    lines.append("  assign out[0] = pp_0_0;")
    lines.append("  assign out[1] = pp_0_1 ^ pp_1_0;")
    lines.append("  wire c2_0 = pp_0_1 & pp_1_0;")
    carry_bits = [("c2_0", 1)]
    for col in range(2, 9):
        pp_bits = column_pp_names(n, col)
        weighted = [(name, 1) for name in pp_bits] + carry_bits
        lines.append("  assign out[{0}] = {1};".format(col, weighted_parity_expr(weighted)))
        max_total = sum(weight for _, weight in weighted)
        next_width = max(1, (max_total >> 1).bit_length())
        next_carry = []
        for bit in range(next_width):
            name = "mc{0}_{1}".format(col + 1, bit)
            lines.append("  wire {0} = {1};".format(name, minimized_sop_expr(weighted, bit + 1)))
            next_carry.append((name, 1 << bit))
        carry_bits = next_carry
    lines.append("  assign out[9] = {0};".format(weighted_parity_expr(carry_bits)))
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def render_ex256_column_pairtree_pred(module, n):
    if n != 5:
        return None
    lines = header(module, n)
    emit_pp(lines, n)
    lines.append("  assign out[0] = pp_0_0;")
    lines.append("  assign out[1] = pp_0_1 ^ pp_1_0;")
    lines.append("  wire [1:0] carry2 = {1'b0, (pp_0_1 & pp_1_0)};")
    prev = "carry2"
    for col in range(2, 9):
        bits = column_pp_names(n, col)
        terms = ["{{2'b0, {0}}}".format(bit) for bit in bits]
        terms.append("{{2'b0, {0}}}".format(prev) if col < 4 else "{{1'b0, {0}}}".format(prev))
        sum_name = "sum_col{0}".format(col)
        carry_name = "carry{0}".format(col + 1)
        lines.append("  wire [3:0] {0} = {1};".format(sum_name, " + ".join(terms)))
        lines.append("  assign out[{0}] = {1}[0];".format(col, sum_name))
        lines.append("  wire [2:0] {0} = {1}[3:1];".format(carry_name, sum_name))
        prev = carry_name
    lines.append("  assign out[9] = {0}[0];".format(prev))
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def render_ex256_column_threshold_fastcarry(module, n):
    if n != 5:
        return None
    lines = header(module, n)
    emit_pp(lines, n)
    # Hand-written low columns with shared carry predicates, then let the
    # existing CLA-friendly source handle the upper residual by exact equations.
    lines.extend(
        [
            "  assign out[0] = pp_0_0;",
            "  assign out[1] = pp_0_1 ^ pp_1_0;",
            "  wire c2 = pp_0_1 & pp_1_0;",
            "  wire [2:0] s2 = {2'b0, pp_0_2} + {2'b0, pp_1_1} + {2'b0, pp_2_0} + {2'b0, c2};",
            "  assign out[2] = s2[0];",
            "  wire [1:0] c3 = s2[2:1];",
            "  wire [3:0] s3 = {3'b0, pp_0_3} + {3'b0, pp_1_2} + {3'b0, pp_2_1} + {3'b0, pp_3_0} + {2'b0, c3};",
            "  assign out[3] = s3[0];",
            "  wire [2:0] c4 = s3[3:1];",
            "  wire [3:0] s4 = {3'b0, pp_0_4} + {3'b0, pp_1_3} + {3'b0, pp_2_2} + {3'b0, pp_3_1} + {3'b0, pp_4_0} + {1'b0, c4};",
            "  assign out[4] = s4[0];",
            "  wire [2:0] c5 = s4[3:1];",
            "  wire [3:0] s5 = {3'b0, pp_1_4} + {3'b0, pp_2_3} + {3'b0, pp_3_2} + {3'b0, pp_4_1} + {1'b0, c5};",
            "  assign out[5] = s5[0];",
            "  wire [2:0] c6 = s5[3:1];",
            "  wire [3:0] s6 = {3'b0, pp_2_4} + {3'b0, pp_3_3} + {3'b0, pp_4_2} + {1'b0, c6};",
            "  assign out[6] = s6[0];",
            "  wire [2:0] c7 = s6[3:1];",
            "  wire [3:0] s7 = {3'b0, pp_3_4} + {3'b0, pp_4_3} + {1'b0, c7};",
            "  assign out[7] = s7[0];",
            "  wire [2:0] c8 = s7[3:1];",
            "  wire [3:0] s8 = {3'b0, pp_4_4} + {1'b0, c8};",
            "  assign out[8] = s8[0];",
            "  assign out[9] = s8[1];",
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


def mux_by_state_expr(state_expr, choices, width):
    terms = []
    for state, expr in enumerate(choices):
        terms.append("(({0} == 3'd{1}) ? {2} : {3})".format(state_expr, state, expr, zero_word(width)))
    return " | ".join(terms)


def render_ex256_carry_state_prefix(module, n):
    if n != 5:
        return None
    lines = header(module, n)
    emit_pp(lines, n)
    lines.extend(
        [
            "  assign out[0] = pp_0_0;",
            "  assign out[1] = pp_0_1 ^ pp_1_0;",
            "  wire [2:0] init_state = {2'b0, (pp_0_1 & pp_1_0)};",
        ]
    )

    segments = []
    for col in range(2, 9):
        pp_bits = column_pp_names(n, col)
        weighted = [(name, 1) for name in pp_bits]
        name = "seg{0}".format(col)
        width = 1
        out_names = []
        cout_names = []
        for state in range(5):
            out_name = "{0}_out_s{1}".format(name, state)
            cout_name = "{0}_cout_s{1}".format(name, state)
            lines.append("  wire {0} = {1};".format(out_name, minimized_sop_expr_const(weighted, 0, state)))
            carry_bits = []
            for bit in range(3):
                bit_name = "{0}_cout_s{1}_b{2}".format(name, state, bit)
                lines.append("  wire {0} = {1};".format(bit_name, minimized_sop_expr_const(weighted, bit + 1, state)))
                carry_bits.append(bit_name)
            lines.append("  wire [2:0] {0} = {{{1}}};".format(cout_name, ", ".join(reversed(carry_bits))))
            out_names.append(out_name)
            cout_names.append(cout_name)
        segments.append({"name": name, "width": width, "outs": out_names, "couts": cout_names})

    stage = 0
    while len(segments) > 1:
        next_segments = []
        for index in range(0, len(segments), 2):
            if index + 1 >= len(segments):
                next_segments.append(segments[index])
                continue
            left = segments[index]
            right = segments[index + 1]
            name = "pfx{0}_{1}".format(stage, index // 2)
            width = left["width"] + right["width"]
            outs = []
            couts = []
            for state in range(5):
                mid = left["couts"][state]
                right_out = mux_by_state_expr(mid, right["outs"], right["width"])
                right_cout = mux_by_state_expr(mid, right["couts"], 3)
                out_name = "{0}_out_s{1}".format(name, state)
                cout_name = "{0}_cout_s{1}".format(name, state)
                lines.append("  wire [{0}:0] {1} = {{{2}, {3}}};".format(width - 1, out_name, right_out, left["outs"][state]))
                lines.append("  wire [2:0] {0} = {1};".format(cout_name, right_cout))
                outs.append(out_name)
                couts.append(cout_name)
            next_segments.append({"name": name, "width": width, "outs": outs, "couts": couts})
        segments = next_segments
        stage += 1

    final = segments[0]
    final_out = mux_by_state_expr("init_state", final["outs"], final["width"])
    final_cout = mux_by_state_expr("init_state", final["couts"], 3)
    lines.append("  wire [{0}:0] final_mid = {1};".format(final["width"] - 1, final_out))
    lines.append("  wire [2:0] final_cout = {0};".format(final_cout))
    lines.append("  assign out[8:2] = final_mid;")
    lines.append("  assign out[9] = final_cout[0];")
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def render_csa_with_final(module, n, style, order, final_kind, start):
    lines = header(module, n)
    width = 2 * n
    rows = []
    for row_index, bit in enumerate(base.ordered_bits(n, order)):
        name = "row{0}".format(row_index)
        rows.append(name)
        lines.append("  wire [{0}:0] {1} = {2};".format(width - 1, name, base.row_expr(n, width, bit, style)))
    stage = 0
    while len(rows) > 2:
        next_rows = []
        for index in range(0, len(rows), 3):
            chunk = rows[index : index + 3]
            if len(chunk) == 3:
                s = "s{0}_{1}".format(stage, index // 3)
                c = "c{0}_{1}".format(stage, index // 3)
                x, y, z = chunk
                lines.append("  wire [{0}:0] {1} = {2} ^ {3} ^ {4};".format(width - 1, s, x, y, z))
                lines.append(
                    "  wire [{0}:0] {1} = (({2} & {3}) | ({2} & {4}) | ({3} & {4})) << 1;".format(
                        width - 1,
                        c,
                        x,
                        y,
                        z,
                    )
                )
                next_rows.extend([s, c])
            else:
                next_rows.extend(chunk)
        rows = next_rows
        stage += 1
    if final_kind == "hybrid_cla":
        append_hybrid_cla_adder(lines, width, rows[0], rows[1], "cla_sum", "hcla", start)
    elif final_kind == "prefix_kogge":
        append_prefix_adder_topology(lines, width, rows[0], rows[1], "cla_sum", "pks", "kogge")
    elif final_kind == "prefix_sklansky":
        append_prefix_adder_topology(lines, width, rows[0], rows[1], "cla_sum", "psk", "sklansky")
    elif final_kind == "carryselect2":
        append_carryselect_adder(lines, width, rows[0], rows[1], "cla_sum", "cs2", 2)
    elif final_kind == "carryselect3":
        append_carryselect_adder(lines, width, rows[0], rows[1], "cla_sum", "cs3", 3)
    else:
        append_cla_adder(lines, width, rows[0], rows[1], "cla_sum", "cla")
    lines.append("  assign out = cla_sum;")
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def render_wallace_bits_cla(module, n):
    return render_wallace_bits_cla_order(module, n, "natural")


def render_wallace_bits_rev_cla(module, n):
    return render_wallace_bits_cla_order(module, n, "reverse")


def render_wallace_bits_outside_cla(module, n):
    return render_wallace_bits_cla_order(module, n, "outside")


def render_wallace_bits_cla_order(module, n, item_order):
    width = 2 * n
    lines = header(module, n)
    columns = [[] for _ in range(width + 1)]
    column_entries = [[] for _ in range(width + 1)]
    for i in range(n):
        for j in range(n):
            name = "pp_{0}_{1}".format(i, j)
            lines.append("  wire {0} = a[{1}] & b[{2}];".format(name, i, j))
            column_entries[i + j].append(name)
    for index, entries in enumerate(column_entries):
        columns[index].extend(base.order_column_entries(entries, item_order))
    stage = 0
    while any(len(col) > 2 for col in columns):
        next_columns = [[] for _ in range(width + 1)]
        for col_index, col_items in enumerate(columns):
            items = list(col_items)
            comp = 0
            while len(items) >= 3:
                x = items.pop(0)
                y = items.pop(0)
                z = items.pop(0)
                s = "wc_s{0}_{1}_{2}".format(stage, col_index, comp)
                c = "wc_c{0}_{1}_{2}".format(stage, col_index, comp)
                lines.append("  wire {0} = {1} ^ {2} ^ {3};".format(s, x, y, z))
                lines.append("  wire {0} = ({1} & {2}) | ({1} & {3}) | ({2} & {3});".format(c, x, y, z))
                next_columns[col_index].append(s)
                next_columns[col_index + 1].append(c)
                comp += 1
            next_columns[col_index].extend(items)
        columns = next_columns
        stage += 1
    row0_bits = []
    row1_bits = []
    for col_index in range(width):
        items = columns[col_index]
        if len(items) == 0:
            row0_bits.append("1'b0")
            row1_bits.append("1'b0")
        elif len(items) == 1:
            row0_bits.append(items[0])
            row1_bits.append("1'b0")
        else:
            row0_bits.append(items[0])
            row1_bits.append(items[1])
    lines.append("  wire [{0}:0] row0 = {{{1}}};".format(width - 1, ", ".join(reversed(row0_bits))))
    lines.append("  wire [{0}:0] row1 = {{{1}}};".format(width - 1, ", ".join(reversed(row1_bits))))
    append_cla_adder(lines, width, "row0", "row1", "cla_sum", "wcla")
    lines.append("  assign out = cla_sum;")
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


RENDERERS = {
    "csa_androws": base.render_csa_androws,
    "csa_androws_cla": render_csa_androws_cla,
    "csa_androws_rev_cla": render_csa_androws_rev_cla,
    "csa_androws_evenodd_cla": render_csa_androws_evenodd_cla,
    "csa_androws_outside_cla": render_csa_androws_outside_cla,
    "csa_androws_center_cla": render_csa_androws_center_cla,
    "csa_androws_cla_from2": render_csa_androws_cla_from2,
    "csa_androws_cla_from3": render_csa_androws_cla_from3,
    "csa_androws_cla_from4": render_csa_androws_cla_from4,
    "csa_concat_cla": render_csa_concat_cla,
    "csa_concat_rev_cla": render_csa_concat_rev_cla,
    "csa_concat_outside_cla": render_csa_concat_outside_cla,
    "csa_concat_center_cla": render_csa_concat_center_cla,
    "csa_androws_prefix_ks": render_csa_androws_prefix_ks,
    "csa_androws_prefix_sklansky": render_csa_androws_prefix_sklansky,
    "csa_androws_carryselect2": render_csa_androws_carryselect2,
    "csa_androws_carryselect3": render_csa_androws_carryselect3,
    "csa_androws_4to2_leave0_cla": render_csa_androws_4to2_leave0_cla,
    "csa_androws_4to2_leave1_cla": render_csa_androws_4to2_leave1_cla,
    "csa_androws_4to2_leave2_cla": render_csa_androws_4to2_leave2_cla,
    "csa_androws_4to2_leave3_cla": render_csa_androws_4to2_leave3_cla,
    "csa_androws_4to2_leave4_cla": render_csa_androws_4to2_leave4_cla,
    "csa_cla_low7_top_lut": render_csa_cla_low7_top_lut,
    "csa_cla_low8_top_lut": render_csa_cla_low8_top_lut,
    "csa_cla_low9_top_lut": render_csa_cla_low9_top_lut,
    "highbit_decomp_upper_cla": render_highbit_decomp_upper_cla,
    "ex256_column_threshold_pred": render_ex256_column_threshold_pred,
    "ex256_column_threshold_min_sop": render_ex256_column_threshold_min_sop,
    "ex256_column_pairtree_pred": render_ex256_column_pairtree_pred,
    "ex256_column_threshold_fastcarry": render_ex256_column_threshold_fastcarry,
    "ex256_carry_state_prefix": render_ex256_carry_state_prefix,
    "wallace_bits": base.render_wallace_bits,
    "wallace_bits_cla": render_wallace_bits_cla,
    "wallace_bits_rev_cla": render_wallace_bits_rev_cla,
    "wallace_bits_outside_cla": render_wallace_bits_outside_cla,
    "wallace_bits_prefix": base.render_wallace_bits_prefix,
    "column_case_carry": render_column_case_carry,
    "block_split_lo2": render_block_split_lo2,
    "block_split_lo3": render_block_split_lo3,
    "block_split_case_lo2": render_block_split_case_lo2,
    "block_split_case_lo3": render_block_split_case_lo3,
    "karatsuba_odd": render_karatsuba_odd,
    "sorted_case_const": render_sorted_case_const,
    "critical_low_direct": render_critical_low_direct,
    "full_product_case": render_full_product_case,
    "per_bit_lut": render_per_bit_lut_plain,
    "per_bit_lut_low_formula": render_per_bit_lut_low_formula,
}


FLOW_SCRIPTS = dict(base.FLOW_SCRIPTS)


def script_abc_lut_to_aig(verilog, module, output, lut_size):
    return "\n".join(
        [
            "read_verilog {0}".format(base.yosys_quote(verilog)),
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
            "abc -lut {0}".format(lut_size),
            "opt",
            "techmap",
            "opt",
            "aigmap",
            "opt",
            "clean",
            "write_aiger -symbols {0}".format(base.yosys_quote(output)),
        ]
    ) + "\n"


FLOW_SCRIPTS.update(
    {
        "abc_g_aig_d12": lambda v, m, o: base.script_default(v, m, o, "aig -D 12"),
        "abc_g_aig_d13": lambda v, m, o: base.script_default(v, m, o, "aig -D 13"),
        "abc_g_aig_d14": lambda v, m, o: base.script_default(v, m, o, "aig -D 14"),
        "abc_g_aig_d15": lambda v, m, o: base.script_default(v, m, o, "aig -D 15"),
        "synth_preset_d12": lambda v, m, o: base.script_synth_preset(v, m, o, 12),
        "synth_preset_d13": lambda v, m, o: base.script_synth_preset(v, m, o, 13),
        "synth_preset_d14": lambda v, m, o: base.script_synth_preset(v, m, o, 14),
        "synth_preset_d15": lambda v, m, o: base.script_synth_preset(v, m, o, 15),
        "abc_lut3_to_aig": lambda v, m, o: script_abc_lut_to_aig(v, m, o, 3),
        "abc_lut4_to_aig": lambda v, m, o: script_abc_lut_to_aig(v, m, o, 4),
        "abc_lut5_to_aig": lambda v, m, o: script_abc_lut_to_aig(v, m, o, 5),
    }
)


def parse_list(value, allowed):
    return base.parse_list(value, allowed)


def run_case(args, case, source_variants, flow_variants, refs):
    table = TruthTable(args.benchmarks / "{0}.truth".format(case))
    semantic_ok, semantic_note = base.verify_semantics(case, table)
    n = CASE_PART_WIDTH[case]
    rows = []
    manifest = {
        "case": case,
        "truth": rel(args.benchmarks / "{0}.truth".format(case)),
        "input_width": table.input_width,
        "output_width": table.output_width,
        "semantic": semantic_note,
        "sources": [],
        "candidates": [],
    }

    for source_variant in source_variants:
        renderer = RENDERERS[source_variant]
        module = "{0}_umul_{1}".format(case, source_variant)
        verilog_text = renderer(module, n)
        if verilog_text is None:
            manifest["sources"].append({"source": source_variant, "skipped": "not applicable"})
            continue
        verilog_path = args.work_dir / case / "verilog" / "{0}.v".format(module)
        write_text(verilog_path, verilog_text)
        manifest["sources"].append({"source": source_variant, "verilog": rel(verilog_path)})

        for flow in flow_variants:
            candidate_id = "{0}_{1}".format(module, flow)
            aig_path = args.work_dir / case / "aigs" / "{0}.aig".format(candidate_id)
            script_path = args.work_dir / case / "logs" / "{0}.ys".format(candidate_id)
            log_path = args.work_dir / case / "logs" / "{0}.yosys.log".format(candidate_id)
            row = base.empty_row(case, candidate_id, source_variant, flow, verilog_path, aig_path, semantic_ok, semantic_note, refs)
            start = time.time()
            if semantic_ok:
                try:
                    script = FLOW_SCRIPTS[flow](verilog_path, module, aig_path)
                    base.run_yosys(args.yosys, script, script_path, log_path, args.timeout)
                    row["synthesized"] = "1"
                    evaluated = evaluate_aig(
                        case=case,
                        candidate_id=candidate_id,
                        parent_id=source_variant,
                        source="verilog_frontend",
                        tool_chain=flow,
                        aig_path=aig_path,
                        truth=args.benchmarks / "{0}.truth".format(case),
                        abc=args.abc,
                        notes="{0}; focused source={1}; flow={2}".format(semantic_note, source_variant, flow),
                        timeout=args.timeout,
                    )
                    row["equivalent"] = "1" if evaluated.equivalent else "0"
                    if evaluated.area is not None:
                        row["area"] = str(evaluated.area)
                        row["delay"] = str(evaluated.delay)
                        row["adp"] = str(evaluated.adp)
                        base.add_reference(row, refs)
                    row["notes"] = evaluated.notes
                except (SynthError, RuntimeError, OSError, subprocess.TimeoutExpired) as exc:
                    row["notes"] = "{0}: {1}".format(type(exc).__name__, exc)[:1000]
            row["runtime_sec"] = "{0:.3f}".format(time.time() - start)
            rows.append(row)
            manifest["candidates"].append(row)

    write_text(args.work_dir / case / "manifest.json", json.dumps(manifest, indent=2, sort_keys=True) + "\n")
    return rows


def write_manifest(args, rows, best):
    lines = [
        "# {0}".format(args.run_id),
        "",
        "Run ID: `{0}`".format(args.run_id),
        "",
        "Purpose: focused frontend-only unsigned multiplier structures for `ex255-ex259`, with priority on ex256 delay.",
        "",
        "Inputs:",
        "- Truth files: `benchmarks/ex255.truth` through `benchmarks/ex259.truth`",
        "- Previous notes: `student/cases/ex255_ex279_integer_arithmetic/ex255-259/frontend_attempts.md`",
        "- Generator/script: `student/generators/integer_ex255_ex259_mul_focused_structures.py`",
        "",
        "Artifacts:",
        "- Work directory: `{0}`".format(rel(args.work_dir)),
        "- Candidates CSV: `{0}`".format(rel(args.results_dir / "candidates.csv")),
        "- Best CSV: `{0}`".format(rel(args.results_dir / "best.csv")),
        "- Summary CSV: `{0}`".format(rel(args.results_dir / "summary.csv")),
        "",
        "Methods tried:",
        "- Column carry-state case logic, split block products, small block case multipliers, odd Karatsuba, sorted-operand constant multiply, and low/direct high correction.",
        "- Limited Yosys frontend synth scripts including strict delay targets around ex256 reference delay.",
        "",
        "Best result:",
        "- See `results/best.csv`.",
        "",
        "Notes:",
        "- Every AIG row is checked with ABC CEC against `read_truth -xf` through `evaluate_aig`.",
        "- No backend optimization portfolio was run.",
        "",
        "Run totals:",
        "- candidates: {0}".format(len(rows)),
        "- equivalent: {0}".format(len([row for row in rows if row.get("equivalent") == "1"])),
        "- best cases: {0}".format(len(best)),
        "",
    ]
    write_text(args.runs_dir / "MANIFEST.md", "\n".join(lines))


def parse_args(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--run-id", default="ex255_ex259_frontend_umul_focused_structures_20260609_0108")
    parser.add_argument("--cases", default="ex256")
    parser.add_argument("--sources", default="all")
    parser.add_argument("--flows", default="abc_g_aig,abc_g_aig_d13,abc_g_aig_d14,synth_preset_d13,synth_preset_d14,synth_preset_d18")
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--abc", type=Path, default=ROOT / "student" / "abc")
    parser.add_argument("--yosys", type=Path, default=DEFAULT_YOSYS)
    parser.add_argument("--timeout", type=int, default=300)
    parser.add_argument("--work-dir", type=Path)
    parser.add_argument("--runs-dir", type=Path)
    return parser.parse_args(argv)


def main(argv=None):
    args = parse_args(argv)
    cases = parse_list(args.cases, CASES)
    sources = parse_list(args.sources, SOURCE_VARIANTS)
    flows = parse_list(args.flows, FLOW_VARIANTS)
    if args.work_dir is None:
        args.work_dir = ROOT / "student" / "work" / args.run_id
    if args.runs_dir is None:
        args.runs_dir = ROOT / "student" / "runs" / "integer" / args.run_id
    args.results_dir = args.runs_dir / "results"
    refs = base.load_reference(ROOT / "reference_result.csv")

    all_rows = []
    for case in cases:
        rows = run_case(args, case, sources, flows, refs)
        all_rows.extend(rows)
        case_best = base.best_rows(rows)
        if case_best:
            item = case_best[0]
            print(
                "{0}: {1} area={2} delay={3} adp={4} ratio={5}".format(
                    case,
                    item["candidate_id"],
                    item["area"],
                    item["delay"],
                    item["adp"],
                    item["adp_ratio_to_reference"],
                )
            )
        else:
            print("{0}: no equivalent candidate".format(case), file=sys.stderr)

    best = base.best_rows(all_rows)
    write_csv(args.results_dir / "candidates.csv", RESULT_FIELDNAMES, all_rows)
    write_csv(args.results_dir / "best.csv", BEST_FIELDNAMES, best)
    write_csv(
        args.results_dir / "summary.csv",
        [
            "case",
            "best_area",
            "best_delay",
            "best_adp",
            "reference_adp",
            "ratio_to_reference",
            "within_1p5_reference",
            "beats_reference",
            "candidate_id",
            "notes",
        ],
        base.summary_rows(best, refs),
    )
    write_csv(
        args.results_dir / "evaluate_check.csv",
        ["case", "candidate_id", "equivalent", "area", "delay", "adp", "aig_path", "notes"],
        all_rows,
    )
    write_manifest(args, all_rows, best)
    print("Results: {0}".format(rel(args.results_dir / "candidates.csv")))
    print("Best: {0}".format(rel(args.results_dir / "best.csv")))
    return 0 if len(best) == len(cases) else 1


if __name__ == "__main__":
    raise SystemExit(main())
