#!/usr/bin/env python3
"""Focused signed-multiply frontend structures for ex260-ex264.

The existing seed pool identifies these cases as signed lowN * signed highN.
This script keeps that semantic check explicit and tries a compact set of
signed-specific source structures before any backend portfolio work.
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
from student.generators import integer_ex255_ex259_mul_focused_structures as mulfocus


CASES = ("ex260", "ex261", "ex262", "ex263", "ex264")
CASE_PART_WIDTH = {
    "ex260": 4,
    "ex261": 5,
    "ex262": 6,
    "ex263": 7,
    "ex264": 8,
}

SOURCE_VARIANTS = (
    "direct_signed",
    "wide_signed",
    "abs_sign_direct",
    "abs_sign_wallace",
    "signcorr_core_mul",
    "signcorr_core_wallace",
    "signcase_core_mul",
    "signcase_core_wallace",
    "signed_correction_direct",
    "signed_correction_wallace",
    "signed_correction_csa_cla",
    "baugh_wooley_wallace",
    "baugh_wooley_wallace_rev",
    "baugh_wooley_wallace_outside",
    "baugh_wooley_wallace_plus",
    "baugh_wooley_wallace_rev_hcla4",
    "baugh_wooley_wallace_rev_hcla3",
    "baugh_wooley_wallace_rev_hcla5",
    "baugh_wooley_wallace_rev_hcla2",
    "baugh_wooley_wallace_rev_hcla6",
    "baugh_wooley_wallace_rev_hcla1",
    "baugh_wooley_wallace_rev_hcla7",
    "baugh_wooley_wallace_rev_hcla8",
    "baugh_wooley_wallace_outside_hcla4",
    "baugh_wooley_wallace_outside_hcla3",
    "baugh_wooley_wallace_outside_hcla5",
    "baugh_wooley_wallace_outside_hcla2",
    "baugh_wooley_wallace_outside_hcla6",
    "baugh_wooley_wallace_outside_hcla1",
    "baugh_wooley_wallace_outside_hcla7",
    "baugh_wooley_wallace_outside_hcla8",
    "baugh_wooley_wallace_rev_rhcla4",
    "baugh_wooley_wallace_rev_rhcla3",
    "baugh_wooley_wallace_rev_rhcla5",
    "baugh_wooley_wallace_rev_rhcla2",
    "baugh_wooley_wallace_rev_rhcla6",
    "baugh_wooley_wallace_rev_rhcla1",
    "baugh_wooley_wallace_rev_rhcla7",
    "baugh_wooley_wallace_rev_rhcla8",
    "baugh_wooley_wallace_outside_rhcla3",
    "baugh_wooley_wallace_outside_rhcla4",
    "baugh_wooley_wallace_outside_rhcla5",
    "baugh_wooley_wallace_outside_rhcla2",
    "baugh_wooley_wallace_outside_rhcla6",
    "baugh_wooley_wallace_outside_rhcla1",
    "baugh_wooley_wallace_outside_rhcla7",
    "baugh_wooley_wallace_outside_rhcla8",
    "baugh_wooley_wallace_rev_pfx6",
    "baugh_wooley_wallace_rev_pfx1",
    "baugh_wooley_wallace_rev_pfx2",
    "baugh_wooley_wallace_rev_pfx3",
    "baugh_wooley_wallace_rev_pfx4",
    "baugh_wooley_wallace_outside_pfx6",
    "baugh_wooley_wallace_outside_pfx1",
    "baugh_wooley_wallace_outside_pfx2",
    "baugh_wooley_wallace_outside_pfx3",
    "baugh_wooley_wallace_outside_pfx4",
    "baugh_wooley_wallace_corrfirst_hcla4",
    "baugh_wooley_wallace_corrlast_hcla4",
    "baugh_wooley_wallace_signfirst_hcla4",
    "baugh_wooley_wallace_signlast_hcla4",
    "baugh_wooley_wallace_corrzip_hcla4",
    "baugh_wooley_wallace_corrfirst_hcla1",
    "baugh_wooley_wallace_corrlast_hcla1",
    "baugh_wooley_wallace_signfirst_hcla1",
    "baugh_wooley_wallace_signlast_hcla1",
    "baugh_wooley_wallace_corrzip_hcla1",
    "baugh_wooley_wallace_corrfirst_rhcla2",
    "baugh_wooley_wallace_corrlast_rhcla2",
    "baugh_wooley_wallace_signfirst_rhcla2",
    "baugh_wooley_wallace_signlast_rhcla2",
    "baugh_wooley_wallace_corrzip_rhcla2",
    "baugh_wooley_wallace_rev_hcla3_mod",
    "baugh_wooley_wallace_rev_hcla4_mod",
    "baugh_wooley_wallace_rev_hcla5_mod",
    "baugh_wooley_wallace_outside_hcla1_mod",
    "baugh_wooley_wallace_outside_hcla2_mod",
    "baugh_wooley_wallace_corrfirst_hcla4_mod",
    "baugh_wooley_wallace_corrfirst_rhcla2_mod",
    "baugh_wooley_wallace_rev_hcla4_signbit",
    "baugh_wooley_wallace_outside_hcla1_signbit",
    "baugh_wooley_wallace_outside_hcla1_pfx_signbit",
    "baugh_wooley_wallace_rev_hcla6_signbit",
    "baugh_wooley_wallace4_rev_hcla4",
    "baugh_wooley_wallace4_outside_hcla1",
    "baugh_wooley_wallace4_outside_hcla2",
    "baugh_wooley_wallace4_outside_rhcla2",
    "baugh_wooley_wallace_center_hcla4",
    "baugh_wooley_wallace_center_rhcla3",
    "baugh_wooley_wallace_center_rhcla4",
    "baugh_wooley_wallace_evenodd_hcla4",
    "baugh_wooley_wallace_evenodd_rhcla4",
    "baugh_wooley_dadda",
    "baugh_wooley_dadda_plus",
    "baugh_wooley_dadda_hcla4",
    "baugh_wooley_dadda_pfx6",
    "baugh_wooley_wallace_signbit",
    "baugh_wooley_wallace_rev_signbit",
    "baugh_wooley_wallace_hcla2",
    "baugh_wooley_wallace_hcla3",
    "baugh_wooley_wallace_hcla4",
    "baugh_wooley_wallace_hcla5",
    "baugh_wooley_wallace_hcla6",
    "baugh_wooley_wallace_hcla8",
    "baugh_wooley_wallace_rhcla3",
    "baugh_wooley_wallace_rhcla4",
    "baugh_wooley_wallace_rhcla5",
    "baugh_wooley_wallace_rpfx6",
    "baugh_wooley_wallace_pfx3",
    "baugh_wooley_wallace_pfx4",
    "baugh_wooley_wallace_pfx5",
    "baugh_wooley_wallace_pfx6",
    "baugh_wooley_wallace_pfx8",
    "baugh_wooley_wallace_csel2",
    "baugh_wooley_wallace_csel3",
    "baugh_wooley_wallace_csel4",
    "baugh_wooley_column_arith",
    "baugh_wooley_column_min_sop",
    "baugh_wooley_rows_plus",
    "baugh_wooley_rows_cla",
    "baugh_wooley_rows_hcla4",
    "booth_radix4_signed",
    "booth_radix4_balanced",
    "booth_radix4_csa_cla",
    "split_half_signed",
    "karatsuba_split_signed",
    "split_half_abs",
    "case_small_signed",
    "case_b_signed_const",
    "ex260_shared_bdd_nat",
    "ex260_shared_bdd_interleave",
    "ex260_shared_bdd_signfirst",
    "ex260_shared_bdd_signlast",
    "ex260_shared_bdd_outside",
    "ex260_bw_rev_handmerge",
    "ex260_qmc_bits",
    "ex260_rev_hcla4_qmc_hi1",
    "ex260_rev_hcla4_qmc_hi2",
    "ex260_rev_hcla4_qmc_hi3",
    "ex260_rev_hcla4_qmc_hi4",
    "anf_product_bits",
)

FLOW_VARIANTS = (
    "abc_g_aig",
    "wreduce_abc_g_aig",
    "arith_wreduce_aig",
    "synth_preset_d9",
    "synth_preset_d13",
    "synth_preset_d18",
    "synth_preset_d24",
)

RESULT_FIELDNAMES = base.RESULT_FIELDNAMES
BEST_FIELDNAMES = base.BEST_FIELDNAMES


def rel(path):
    return base.rel(path)


def write_text(path, text):
    return base.write_text(path, text)


def write_csv(path, fieldnames, rows):
    return base.write_csv(path, fieldnames, rows)


def load_reference(path):
    return base.load_reference(path)


def parse_list(value, allowed):
    return base.parse_list(value, allowed)


def const(width, value):
    return "{0}'h{1:x}".format(width, value & ((1 << width) - 1))


def zero_word(width):
    return "{0}'b0".format(width)


def signed_value(value, width):
    sign = 1 << (width - 1)
    if value & sign:
        return value - (1 << width)
    return value


def verify_semantics(case, table):
    n = CASE_PART_WIDTH[case]
    width = 2 * n
    if table.input_width != width or table.output_width != width:
        return False, "unexpected widths input={0} output={1} n={2}".format(
            table.input_width,
            table.output_width,
            n,
        )
    mask = (1 << n) - 1
    out_mask = (1 << width) - 1
    for index, expected in enumerate(table.iter_outputs()):
        a = signed_value(index & mask, n)
        b = signed_value((index >> n) & mask, n)
        actual = (a * b) & out_mask
        if actual != expected:
            return False, "mismatch index={0} expected=0x{1:x} actual=0x{2:x}".format(index, expected, actual)
    return True, "exact signed low{0} * signed high{0} over {1} inputs".format(n, table.num_inputs)


def header(module, n):
    width = 2 * n
    return [
        "module {0}(in, out);".format(module),
        "  input [{0}:0] in;".format(width - 1),
        "  output [{0}:0] out;".format(width - 1),
        "  wire [{0}:0] a = in[{0}:0];".format(n - 1),
        "  wire [{0}:0] b = in[{1}:{2}];".format(n - 1, width - 1, n),
        "  wire sa = a[{0}];".format(n - 1),
        "  wire sb = b[{0}];".format(n - 1),
    ]


def shifted_expr(term, shift):
    if shift == 0:
        return term
    return "({0} << {1})".format(term, shift)


def append_prefix_adder(lines, width, x_name, y_name, out_name, prefix):
    base.append_prefix_adder(lines, width, x_name, y_name, out_name, prefix)


def unsigned_wallace_expr(lines, n, a_name, b_name, out_name, prefix):
    width = 2 * n
    columns = [[] for _ in range(width + 1)]
    for i in range(n):
        for j in range(n):
            name = "{0}_pp_{1}_{2}".format(prefix, i, j)
            lines.append("  wire {0} = {1}[{2}] & {3}[{4}];".format(name, a_name, i, b_name, j))
            columns[i + j].append(name)
    stage = 0
    while any(len(col) > 2 for col in columns):
        next_columns = [[] for _ in range(width + 1)]
        for col_index, items_in in enumerate(columns):
            items = list(items_in)
            comp = 0
            while len(items) >= 3:
                x = items.pop(0)
                y = items.pop(0)
                z = items.pop(0)
                s = "{0}_s{1}_{2}_{3}".format(prefix, stage, col_index, comp)
                c = "{0}_c{1}_{2}_{3}".format(prefix, stage, col_index, comp)
                lines.append("  wire {0} = {1} ^ {2} ^ {3};".format(s, x, y, z))
                lines.append("  wire {0} = ({1} & {2}) | ({1} & {3}) | ({2} & {3});".format(c, x, y, z))
                next_columns[col_index].append(s)
                if col_index + 1 <= width:
                    next_columns[col_index + 1].append(c)
                comp += 1
            next_columns[col_index].extend(items)
        columns = next_columns
        stage += 1
    row0_bits = []
    row1_bits = []
    for col_index in range(width + 1):
        items = columns[col_index]
        if not items:
            row0_bits.append("1'b0")
            row1_bits.append("1'b0")
        elif len(items) == 1:
            row0_bits.append(items[0])
            row1_bits.append("1'b0")
        elif len(items) == 2:
            row0_bits.append(items[0])
            row1_bits.append(items[1])
        else:
            raise RuntimeError("wallace left too many bits")
    lines.append("  wire [{0}:0] {1}_row0 = {{{2}}};".format(width, prefix, ", ".join(reversed(row0_bits))))
    lines.append("  wire [{0}:0] {1}_row1 = {{{2}}};".format(width, prefix, ", ".join(reversed(row1_bits))))
    append_prefix_adder(lines, width + 1, "{0}_row0".format(prefix), "{0}_row1".format(prefix), "{0}_sum".format(prefix), prefix + "_cla")
    lines.append("  wire [{0}:0] {1} = {2}_sum[{0}:0];".format(width - 1, out_name, prefix))


def unsigned_csa_cla_expr(lines, n, a_name, b_name, out_name, prefix):
    width = 2 * n
    rows = []
    for bit in range(n):
        name = "{0}_row{1}".format(prefix, bit)
        rows.append(name)
        high_zeros = width - n - bit
        parts = []
        if high_zeros > 0:
            parts.append("{%d{1'b0}}" % high_zeros)
        parts.append("({0} & {{{1}{{{2}[{3}]}}}})".format(a_name, n, b_name, bit))
        if bit > 0:
            parts.append("{%d{1'b0}}" % bit)
        lines.append("  wire [{0}:0] {1} = {{{2}}};".format(width - 1, name, ", ".join(parts)))
    stage = 0
    while len(rows) > 2:
        next_rows = []
        for index in range(0, len(rows), 3):
            chunk = rows[index : index + 3]
            if len(chunk) == 3:
                s = "{0}_s{1}_{2}".format(prefix, stage, index // 3)
                c = "{0}_c{1}_{2}".format(prefix, stage, index // 3)
                x, y, z = chunk
                lines.append("  wire [{0}:0] {1} = {2} ^ {3} ^ {4};".format(width - 1, s, x, y, z))
                lines.append("  wire [{0}:0] {1} = (({2} & {3}) | ({2} & {4}) | ({3} & {4})) << 1;".format(width - 1, c, x, y, z))
                next_rows.extend([s, c])
            else:
                next_rows.extend(chunk)
        rows = next_rows
        stage += 1
    append_prefix_adder(lines, width, rows[0], rows[1], out_name, prefix + "_cla")


def render_direct_signed(module, n):
    width = 2 * n
    lines = header(module, n)
    lines.extend(
        [
            "  wire signed [{0}:0] a_s = a;".format(n - 1),
            "  wire signed [{0}:0] b_s = b;".format(n - 1),
            "  wire signed [{0}:0] product = a_s * b_s;".format(width - 1),
            "  assign out = product;",
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


def render_wide_signed(module, n):
    width = 2 * n
    lines = header(module, n)
    lines.extend(
        [
            "  wire signed [{0}:0] a_s = {{{{{1}{{sa}}}}, a}};".format(width - 1, width - n),
            "  wire signed [{0}:0] b_s = {{{{{1}{{sb}}}}, b}};".format(width - 1, width - n),
            "  assign out = a_s * b_s;",
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


def append_abs_wires(lines, n):
    lines.extend(
        [
            "  wire [{0}:0] a_abs = sa ? ((~a) + {1}) : a;".format(n - 1, const(n, 1)),
            "  wire [{0}:0] b_abs = sb ? ((~b) + {1}) : b;".format(n - 1, const(n, 1)),
            "  wire out_neg = sa ^ sb;",
        ]
    )


def render_abs_sign_direct(module, n):
    width = 2 * n
    lines = header(module, n)
    append_abs_wires(lines, n)
    lines.extend(
        [
            "  wire [{0}:0] mag_product = a_abs * b_abs;".format(width - 1),
            "  assign out = out_neg ? ((~mag_product) + {0}) : mag_product;".format(const(width, 1)),
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


def render_abs_sign_wallace(module, n):
    width = 2 * n
    lines = header(module, n)
    append_abs_wires(lines, n)
    unsigned_wallace_expr(lines, n, "a_abs", "b_abs", "mag_product", "mag")
    lines.extend(
        [
            "  assign out = out_neg ? ((~mag_product) + {0}) : mag_product;".format(const(width, 1)),
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


def append_signcorr_core_high(lines, n, core_name):
    width = 2 * n
    low_width = n - 1
    high_width = n + 1
    core_width = 2 * low_width
    lines.append("  wire [{0}:0] sc_u_hi = {{{{2{{1'b0}}}}, {1}[{2}:{3}]}};".format(high_width - 1, core_name, core_width - 1, low_width))
    lines.append(
        "  wire [{0}:0] sc_neg_y = sa ? ({{{{2{{1'b1}}}}, ~y}} + {1}) : {2};".format(
            high_width - 1,
            const(high_width, 1),
            zero_word(high_width),
        )
    )
    lines.append(
        "  wire [{0}:0] sc_neg_x = sb ? ({{{{2{{1'b1}}}}, ~x}} + {1}) : {2};".format(
            high_width - 1,
            const(high_width, 1),
            zero_word(high_width),
        )
    )
    lines.append(
        "  wire [{0}:0] sc_corner = (sa & sb) ? {1} : {2};".format(
            high_width - 1,
            const(high_width, 1 << low_width),
            zero_word(high_width),
        )
    )
    lines.append("  wire [{0}:0] sc_hi = sc_u_hi + sc_neg_y + sc_neg_x + sc_corner;".format(high_width - 1))
    lines.append("  assign out = {{sc_hi, {0}[{1}:0]}};".format(core_name, low_width - 1))


def render_signcorr_core_mul(module, n):
    if n < 2:
        return None
    low_width = n - 1
    core_width = 2 * low_width
    lines = header(module, n)
    lines.append("  wire [{0}:0] x = a[{0}:0];".format(low_width - 1))
    lines.append("  wire [{0}:0] y = b[{0}:0];".format(low_width - 1))
    lines.append("  wire [{0}:0] sc_u = x * y;".format(core_width - 1))
    append_signcorr_core_high(lines, n, "sc_u")
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def render_signcorr_core_wallace(module, n):
    if n < 2:
        return None
    low_width = n - 1
    lines = header(module, n)
    lines.append("  wire [{0}:0] x = a[{0}:0];".format(low_width - 1))
    lines.append("  wire [{0}:0] y = b[{0}:0];".format(low_width - 1))
    unsigned_wallace_expr(lines, low_width, "x", "y", "sc_u", "sc")
    append_signcorr_core_high(lines, n, "sc_u")
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def append_signcase_core_output(lines, n, core_name):
    width = 2 * n
    low_width = n - 1
    core_width = 2 * low_width
    lines.append("  wire [{0}:0] sc_xy = {{{{2{{1'b0}}}}, {1}}};".format(width - 1, core_name))
    lines.append("  wire [{0}:0] sc_x_shift = {{{{2{{1'b0}}}}, x, {{{1}{{1'b0}}}}}};".format(width - 1, low_width))
    lines.append("  wire [{0}:0] sc_y_shift = {{{{2{{1'b0}}}}, y, {{{1}{{1'b0}}}}}};".format(width - 1, low_width))
    lines.append("  wire [{0}:0] sc_p00 = sc_xy;".format(width - 1))
    lines.append("  wire [{0}:0] sc_p10 = sc_xy - sc_y_shift;".format(width - 1))
    lines.append("  wire [{0}:0] sc_p01 = sc_xy - sc_x_shift;".format(width - 1))
    lines.append("  wire [{0}:0] sc_p11 = (sc_xy - sc_x_shift) - sc_y_shift + {1};".format(width - 1, const(width, 1 << core_width)))
    lines.append("  assign out = sa ? (sb ? sc_p11 : sc_p10) : (sb ? sc_p01 : sc_p00);")


def render_signcase_core_mul(module, n):
    if n < 2:
        return None
    low_width = n - 1
    core_width = 2 * low_width
    lines = header(module, n)
    lines.append("  wire [{0}:0] x = a[{0}:0];".format(low_width - 1))
    lines.append("  wire [{0}:0] y = b[{0}:0];".format(low_width - 1))
    lines.append("  wire [{0}:0] sc_u = x * y;".format(core_width - 1))
    append_signcase_core_output(lines, n, "sc_u")
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def render_signcase_core_wallace(module, n):
    if n < 2:
        return None
    low_width = n - 1
    lines = header(module, n)
    lines.append("  wire [{0}:0] x = a[{0}:0];".format(low_width - 1))
    lines.append("  wire [{0}:0] y = b[{0}:0];".format(low_width - 1))
    unsigned_wallace_expr(lines, low_width, "x", "y", "sc_u", "scs")
    append_signcase_core_output(lines, n, "sc_u")
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def append_signed_correction_terms(lines, n, product_name):
    width = 2 * n
    lines.extend(
        [
            "  wire [{0}:0] b_shift = {{{1}'b0, b}} << {2};".format(width - 1, width - n, n),
            "  wire [{0}:0] a_shift = {{{1}'b0, a}} << {2};".format(width - 1, width - n, n),
            "  wire [{0}:0] corr_b = sa ? b_shift : {1};".format(width - 1, zero_word(width)),
            "  wire [{0}:0] corr_a = sb ? a_shift : {1};".format(width - 1, zero_word(width)),
            "  assign out = ({0} - corr_b) - corr_a;".format(product_name),
        ]
    )


def render_signed_correction_direct(module, n):
    width = 2 * n
    lines = header(module, n)
    lines.append("  wire [{0}:0] unsigned_product = a * b;".format(width - 1))
    append_signed_correction_terms(lines, n, "unsigned_product")
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def render_signed_correction_wallace(module, n):
    lines = header(module, n)
    unsigned_wallace_expr(lines, n, "a", "b", "unsigned_product", "u")
    append_signed_correction_terms(lines, n, "unsigned_product")
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def render_signed_correction_csa_cla(module, n):
    lines = header(module, n)
    unsigned_csa_cla_expr(lines, n, "a", "b", "unsigned_product", "u")
    append_signed_correction_terms(lines, n, "unsigned_product")
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def ordered_items(items, order):
    items = list(items)
    if order == "natural":
        return items
    if order == "reverse":
        return list(reversed(items))
    if order == "outside":
        out = []
        lo = 0
        hi = len(items) - 1
        while lo <= hi:
            out.append(items[lo])
            if lo != hi:
                out.append(items[hi])
            lo += 1
            hi -= 1
        return out
    if order == "center":
        if not items:
            return items
        mid = (len(items) - 1) // 2
        out = [items[mid]]
        step = 1
        while len(out) < len(items):
            hi = mid + step
            lo = mid - step
            if hi < len(items):
                out.append(items[hi])
            if lo >= 0:
                out.append(items[lo])
            step += 1
        return out
    if order == "evenodd":
        return items[::2] + items[1::2]
    if order in ("corrfirst", "corrlast", "signfirst", "signlast"):
        priority = {
            "corrfirst": {
                "const": 0,
                "corner": 1,
                "negrow": 2,
                "negcol": 3,
                "pp": 4,
                "other": 5,
            },
            "corrlast": {
                "pp": 0,
                "other": 1,
                "negrow": 2,
                "negcol": 3,
                "corner": 4,
                "const": 5,
            },
            "signfirst": {
                "negrow": 0,
                "negcol": 1,
                "corner": 2,
                "const": 3,
                "pp": 4,
                "other": 5,
            },
            "signlast": {
                "pp": 0,
                "other": 1,
                "const": 2,
                "corner": 3,
                "negrow": 4,
                "negcol": 5,
            },
        }[order]
        return [
            item
            for index, item in sorted(
                enumerate(items),
                key=lambda pair: (priority[item_kind(pair[1])], pair[0]),
            )
        ]
    if order == "corrzip":
        pp = [item for item in items if item_kind(item) == "pp"]
        corr = [item for item in items if item_kind(item) in ("negrow", "negcol", "corner", "const")]
        other = [item for item in items if item_kind(item) == "other"]
        out = []
        while pp or corr:
            if pp:
                out.append(pp.pop(0))
            if pp:
                out.append(pp.pop(0))
            if corr:
                out.append(corr.pop(0))
        out.extend(other)
        return out
    raise RuntimeError("unknown item order {0}".format(order))


def item_kind(item):
    if item == "1'b1":
        return "const"
    if item == "sa & sb":
        return "corner"
    if item.startswith("bw_nr_"):
        return "negrow"
    if item.startswith("bw_nc_"):
        return "negcol"
    if item.startswith("bw_pp_"):
        return "pp"
    return "other"


def append_scalar_compressor(lines, x, y, z, s, c):
    items = [x, y, z]
    ones = sum(1 for item in items if item == "1'b1")
    signals = [item for item in items if item not in ("1'b0", "1'b1")]
    if ones == 0:
        if len(signals) == 3:
            a, b, d = signals
            lines.append("  wire {0} = {1} ^ {2} ^ {3};".format(s, a, b, d))
            lines.append("  wire {0} = ({1} & {2}) | ({1} & {3}) | ({2} & {3});".format(c, a, b, d))
        elif len(signals) == 2:
            a, b = signals
            lines.append("  wire {0} = {1} ^ {2};".format(s, a, b))
            lines.append("  wire {0} = {1} & {2};".format(c, a, b))
        elif len(signals) == 1:
            lines.append("  wire {0} = {1};".format(s, signals[0]))
            lines.append("  wire {0} = 1'b0;".format(c))
        else:
            lines.append("  wire {0} = 1'b0;".format(s))
            lines.append("  wire {0} = 1'b0;".format(c))
    elif ones == 1:
        if len(signals) == 2:
            a, b = signals
            lines.append("  wire {0} = ~({1} ^ {2});".format(s, a, b))
            lines.append("  wire {0} = {1} | {2};".format(c, a, b))
        elif len(signals) == 1:
            lines.append("  wire {0} = ~{1};".format(s, signals[0]))
            lines.append("  wire {0} = {1};".format(c, signals[0]))
        else:
            lines.append("  wire {0} = 1'b1;".format(s))
            lines.append("  wire {0} = 1'b0;".format(c))
    elif ones == 2:
        if len(signals) == 1:
            lines.append("  wire {0} = {1};".format(s, signals[0]))
        else:
            lines.append("  wire {0} = 1'b0;".format(s))
        lines.append("  wire {0} = 1'b1;".format(c))
    else:
        lines.append("  wire {0} = 1'b1;".format(s))
        lines.append("  wire {0} = 1'b1;".format(c))


def append_wallace_columns(lines, columns, width, prefix, out_name, item_order="natural", final_merge="cla"):
    columns = [ordered_items(col, item_order) for col in columns]
    stage = 0
    while any(len(col) > 2 for col in columns):
        next_columns = [[] for _ in range(width + 1)]
        for col_index, items_in in enumerate(columns):
            items = list(items_in)
            comp = 0
            while len(items) >= 3:
                x = items.pop(0)
                y = items.pop(0)
                z = items.pop(0)
                s = "{0}_s{1}_{2}_{3}".format(prefix, stage, col_index, comp)
                c = "{0}_c{1}_{2}_{3}".format(prefix, stage, col_index, comp)
                lines.append("  wire {0} = {1} ^ {2} ^ {3};".format(s, x, y, z))
                lines.append("  wire {0} = ({1} & {2}) | ({1} & {3}) | ({2} & {3});".format(c, x, y, z))
                next_columns[col_index].append(s)
                if col_index + 1 <= width:
                    next_columns[col_index + 1].append(c)
                comp += 1
            next_columns[col_index].extend(items)
        columns = next_columns
        stage += 1
    row0_bits = []
    row1_bits = []
    for col_index in range(width + 1):
        items = columns[col_index]
        if not items:
            row0_bits.append("1'b0")
            row1_bits.append("1'b0")
        elif len(items) == 1:
            row0_bits.append(items[0])
            row1_bits.append("1'b0")
        elif len(items) == 2:
            row0_bits.append(items[0])
            row1_bits.append(items[1])
        else:
            raise RuntimeError("wallace left too many bits")
    lines.append("  wire [{0}:0] {1}_row0 = {{{2}}};".format(width, prefix, ", ".join(reversed(row0_bits))))
    lines.append("  wire [{0}:0] {1}_row1 = {{{2}}};".format(width, prefix, ", ".join(reversed(row1_bits))))
    if final_merge == "cla":
        append_prefix_adder(lines, width + 1, "{0}_row0".format(prefix), "{0}_row1".format(prefix), "{0}_sum".format(prefix), prefix + "_cla")
    elif final_merge == "plus":
        lines.append("  wire [{0}:0] {1}_sum = {1}_row0 + {1}_row1;".format(width, prefix))
    elif final_merge.startswith("rhcla"):
        start = int(final_merge[5:])
        append_hybrid_ripple_cla_adder(lines, width + 1, "{0}_row0".format(prefix), "{0}_row1".format(prefix), "{0}_sum".format(prefix), prefix + "_rhcla", start)
    elif final_merge.startswith("rpfx"):
        start = int(final_merge[4:])
        append_hybrid_ripple_prefix_adder(lines, width + 1, "{0}_row0".format(prefix), "{0}_row1".format(prefix), "{0}_sum".format(prefix), prefix + "_rpfx", start)
    elif final_merge.startswith("hcla"):
        start = int(final_merge[4:])
        append_hybrid_cla_adder(lines, width + 1, "{0}_row0".format(prefix), "{0}_row1".format(prefix), "{0}_sum".format(prefix), prefix + "_hcla", start)
    elif final_merge.startswith("pfx"):
        start = int(final_merge[3:])
        append_hybrid_prefix_adder(lines, width + 1, "{0}_row0".format(prefix), "{0}_row1".format(prefix), "{0}_sum".format(prefix), prefix + "_pfx", start)
    elif final_merge.startswith("csel"):
        group_size = int(final_merge[4:])
        append_carryselect_adder(lines, width + 1, "{0}_row0".format(prefix), "{0}_row1".format(prefix), "{0}_sum".format(prefix), prefix + "_csel", group_size)
    else:
        raise RuntimeError("unknown final merge {0}".format(final_merge))
    lines.append("  wire [{0}:0] {1} = {2}_sum[{0}:0];".format(width - 1, out_name, prefix))


def append_wallace_columns_mod(lines, columns, width, prefix, out_name, item_order="natural", final_merge="cla"):
    columns = [ordered_items(col, item_order) for col in columns[:width]]
    stage = 0
    while any(len(col) > 2 for col in columns):
        next_columns = [[] for _ in range(width)]
        for col_index, items_in in enumerate(columns):
            items = list(items_in)
            comp = 0
            while len(items) >= 3:
                x = items.pop(0)
                y = items.pop(0)
                z = items.pop(0)
                s = "{0}_ms{1}_{2}_{3}".format(prefix, stage, col_index, comp)
                c = "{0}_mc{1}_{2}_{3}".format(prefix, stage, col_index, comp)
                lines.append("  wire {0} = {1} ^ {2} ^ {3};".format(s, x, y, z))
                lines.append("  wire {0} = ({1} & {2}) | ({1} & {3}) | ({2} & {3});".format(c, x, y, z))
                next_columns[col_index].append(s)
                if col_index + 1 < width:
                    next_columns[col_index + 1].append(c)
                comp += 1
            next_columns[col_index].extend(items)
        columns = next_columns
        stage += 1
    row0_bits = []
    row1_bits = []
    for col_index in range(width):
        items = columns[col_index]
        if not items:
            row0_bits.append("1'b0")
            row1_bits.append("1'b0")
        elif len(items) == 1:
            row0_bits.append(items[0])
            row1_bits.append("1'b0")
        elif len(items) == 2:
            row0_bits.append(items[0])
            row1_bits.append(items[1])
        else:
            raise RuntimeError("wallace mod left too many bits")
    lines.append("  wire [{0}:0] {1}_row0 = {{{2}}};".format(width - 1, prefix, ", ".join(reversed(row0_bits))))
    lines.append("  wire [{0}:0] {1}_row1 = {{{2}}};".format(width - 1, prefix, ", ".join(reversed(row1_bits))))
    if final_merge == "cla":
        append_prefix_adder(lines, width, "{0}_row0".format(prefix), "{0}_row1".format(prefix), "{0}_sum".format(prefix), prefix + "_cla")
    elif final_merge == "plus":
        lines.append("  wire [{0}:0] {1}_sum = {1}_row0 + {1}_row1;".format(width - 1, prefix))
    elif final_merge.startswith("rhcla"):
        start = int(final_merge[5:])
        append_hybrid_ripple_cla_adder(lines, width, "{0}_row0".format(prefix), "{0}_row1".format(prefix), "{0}_sum".format(prefix), prefix + "_rhcla", start)
    elif final_merge.startswith("rpfx"):
        start = int(final_merge[4:])
        append_hybrid_ripple_prefix_adder(lines, width, "{0}_row0".format(prefix), "{0}_row1".format(prefix), "{0}_sum".format(prefix), prefix + "_rpfx", start)
    elif final_merge.startswith("hcla"):
        start = int(final_merge[4:])
        append_hybrid_cla_adder(lines, width, "{0}_row0".format(prefix), "{0}_row1".format(prefix), "{0}_sum".format(prefix), prefix + "_hcla", start)
    elif final_merge.startswith("pfx"):
        start = int(final_merge[3:])
        append_hybrid_prefix_adder(lines, width, "{0}_row0".format(prefix), "{0}_row1".format(prefix), "{0}_sum".format(prefix), prefix + "_pfx", start)
    elif final_merge.startswith("csel"):
        group_size = int(final_merge[4:])
        append_carryselect_adder(lines, width, "{0}_row0".format(prefix), "{0}_row1".format(prefix), "{0}_sum".format(prefix), prefix + "_csel", group_size)
    else:
        raise RuntimeError("unknown final merge {0}".format(final_merge))
    lines.append("  wire [{0}:0] {1} = {2}_sum;".format(width - 1, out_name, prefix))


def append_exact_counter4(lines, x, y, z, w, s, c1, c2):
    weighted = [(x, 1), (y, 1), (z, 1), (w, 1)]
    lines.append("  wire {0} = {1} ^ {2} ^ {3} ^ {4};".format(s, x, y, z, w))
    lines.append("  wire {0} = {1};".format(c1, mulfocus.minimized_sop_expr(weighted, 1)))
    lines.append("  wire {0} = {1} & {2} & {3} & {4};".format(c2, x, y, z, w))


def append_wallace4_columns(lines, columns, width, prefix, out_name, item_order="natural", final_merge="cla"):
    col_count = width + 2
    columns = [ordered_items(col, item_order) for col in columns]
    columns.extend([[] for _ in range(col_count - len(columns))])
    stage = 0
    while any(len(col) > 2 for col in columns):
        next_columns = [[] for _ in range(col_count)]
        for col_index, items_in in enumerate(columns):
            items = list(items_in)
            comp = 0
            while len(items) >= 4 and col_index + 2 < col_count:
                x = items.pop(0)
                y = items.pop(0)
                z = items.pop(0)
                w = items.pop(0)
                s = "{0}_q{1}_{2}_{3}".format(prefix, stage, col_index, comp)
                c1 = "{0}_q1_{1}_{2}_{3}".format(prefix, stage, col_index, comp)
                c2 = "{0}_q2_{1}_{2}_{3}".format(prefix, stage, col_index, comp)
                append_exact_counter4(lines, x, y, z, w, s, c1, c2)
                next_columns[col_index].append(s)
                next_columns[col_index + 1].append(c1)
                next_columns[col_index + 2].append(c2)
                comp += 1
            while len(items) >= 3:
                x = items.pop(0)
                y = items.pop(0)
                z = items.pop(0)
                s = "{0}_s{1}_{2}_{3}".format(prefix, stage, col_index, comp)
                c = "{0}_c{1}_{2}_{3}".format(prefix, stage, col_index, comp)
                lines.append("  wire {0} = {1} ^ {2} ^ {3};".format(s, x, y, z))
                lines.append("  wire {0} = ({1} & {2}) | ({1} & {3}) | ({2} & {3});".format(c, x, y, z))
                next_columns[col_index].append(s)
                if col_index + 1 < col_count:
                    next_columns[col_index + 1].append(c)
                comp += 1
            next_columns[col_index].extend(items)
        columns = next_columns
        stage += 1
    row0_bits = []
    row1_bits = []
    for col_index in range(col_count):
        items = columns[col_index]
        if not items:
            row0_bits.append("1'b0")
            row1_bits.append("1'b0")
        elif len(items) == 1:
            row0_bits.append(items[0])
            row1_bits.append("1'b0")
        elif len(items) == 2:
            row0_bits.append(items[0])
            row1_bits.append(items[1])
        else:
            raise RuntimeError("wallace4 left too many bits")
    lines.append("  wire [{0}:0] {1}_row0 = {{{2}}};".format(col_count - 1, prefix, ", ".join(reversed(row0_bits))))
    lines.append("  wire [{0}:0] {1}_row1 = {{{2}}};".format(col_count - 1, prefix, ", ".join(reversed(row1_bits))))
    if final_merge == "cla":
        append_prefix_adder(lines, col_count, "{0}_row0".format(prefix), "{0}_row1".format(prefix), "{0}_sum".format(prefix), prefix + "_cla")
    elif final_merge == "plus":
        lines.append("  wire [{0}:0] {1}_sum = {1}_row0 + {1}_row1;".format(col_count - 1, prefix))
    elif final_merge.startswith("rhcla"):
        append_hybrid_ripple_cla_adder(lines, col_count, "{0}_row0".format(prefix), "{0}_row1".format(prefix), "{0}_sum".format(prefix), prefix + "_rhcla", int(final_merge[5:]))
    elif final_merge.startswith("hcla"):
        append_hybrid_cla_adder(lines, col_count, "{0}_row0".format(prefix), "{0}_row1".format(prefix), "{0}_sum".format(prefix), prefix + "_hcla", int(final_merge[4:]))
    elif final_merge.startswith("pfx"):
        append_hybrid_prefix_adder(lines, col_count, "{0}_row0".format(prefix), "{0}_row1".format(prefix), "{0}_sum".format(prefix), prefix + "_pfx", int(final_merge[3:]))
    else:
        raise RuntimeError("unknown final merge {0}".format(final_merge))
    lines.append("  wire [{0}:0] {1} = {2}_sum[{0}:0];".format(width - 1, out_name, prefix))


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
        append_prefix_adder(lines, width, x_name, y_name, out_name, prefix)
        return
    if start >= width:
        lines.append("  wire [{0}:0] {1} = {2} + {3};".format(width - 1, out_name, x_name, y_name))
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


def append_hybrid_prefix_adder(lines, width, x_name, y_name, out_name, prefix, start):
    if start <= 0:
        append_prefix_adder(lines, width, x_name, y_name, out_name, prefix)
        return
    if start >= width:
        lines.append("  wire [{0}:0] {1} = {2} + {3};".format(width - 1, out_name, x_name, y_name))
        return
    lines.append("  wire [{0}:0] {1}_lo = {2}[{3}:0] + {4}[{3}:0];".format(start, prefix, x_name, start - 1, y_name))
    lines.append("  wire [{0}:0] {1};".format(width - 1, out_name))
    for bit in range(start):
        lines.append("  assign {0}[{1}] = {2}_lo[{1}];".format(out_name, bit, prefix))
    lines.append("  wire {0}_cin = {0}_lo[{1}];".format(prefix, start))
    seg_width = width - start
    for idx in range(seg_width):
        bit = start + idx
        lines.append("  wire {0}_p0_{1} = {2}[{3}] ^ {4}[{3}];".format(prefix, idx, x_name, bit, y_name))
        lines.append("  wire {0}_g0_{1} = {2}[{3}] & {4}[{3}];".format(prefix, idx, x_name, bit, y_name))
    prev = 0
    step = 1
    stage = 1
    while step < seg_width:
        for idx in range(seg_width):
            if idx >= step:
                lines.append(
                    "  wire {0}_p{1}_{2} = {0}_p{3}_{2} & {0}_p{3}_{4};".format(
                        prefix,
                        stage,
                        idx,
                        prev,
                        idx - step,
                    )
                )
                lines.append(
                    "  wire {0}_g{1}_{2} = {0}_g{3}_{2} | ({0}_p{3}_{2} & {0}_g{3}_{4});".format(
                        prefix,
                        stage,
                        idx,
                        prev,
                        idx - step,
                    )
                )
            else:
                lines.append("  wire {0}_p{1}_{2} = {0}_p{3}_{2};".format(prefix, stage, idx, prev))
                lines.append("  wire {0}_g{1}_{2} = {0}_g{3}_{2};".format(prefix, stage, idx, prev))
        prev = stage
        stage += 1
        step <<= 1
    for idx in range(seg_width):
        if idx == 0:
            carry = "{0}_cin".format(prefix)
        else:
            carry = "({0}_g{1}_{2} | ({0}_p{1}_{2} & {0}_cin))".format(prefix, prev, idx - 1)
        lines.append("  assign {0}[{1}] = {2}_p0_{3} ^ {4};".format(out_name, start + idx, prefix, idx, carry))


def append_low_ripple(lines, width, x_name, y_name, out_name, prefix, start):
    lines.append("  wire [{0}:0] {1};".format(width - 1, out_name))
    carry = "1'b0"
    for bit in range(start):
        p = "{0}_lp_{1}".format(prefix, bit)
        g = "{0}_lg_{1}".format(prefix, bit)
        lines.append("  wire {0} = {1}[{2}] ^ {3}[{2}];".format(p, x_name, bit, y_name))
        lines.append("  wire {0} = {1}[{2}] & {3}[{2}];".format(g, x_name, bit, y_name))
        lines.append("  assign {0}[{1}] = {2} ^ {3};".format(out_name, bit, p, carry))
        carry = "({0} | ({1} & {2}))".format(g, p, carry)
    lines.append("  wire {0}_cin = {1};".format(prefix, carry))


def append_hybrid_ripple_cla_adder(lines, width, x_name, y_name, out_name, prefix, start):
    if start <= 0:
        append_prefix_adder(lines, width, x_name, y_name, out_name, prefix)
        return
    if start >= width:
        append_low_ripple(lines, width, x_name, y_name, out_name, prefix, width)
        return
    append_low_ripple(lines, width, x_name, y_name, out_name, prefix, start)
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


def append_hybrid_ripple_prefix_adder(lines, width, x_name, y_name, out_name, prefix, start):
    if start <= 0:
        append_prefix_adder(lines, width, x_name, y_name, out_name, prefix)
        return
    if start >= width:
        append_low_ripple(lines, width, x_name, y_name, out_name, prefix, width)
        return
    append_low_ripple(lines, width, x_name, y_name, out_name, prefix, start)
    seg_width = width - start
    for idx in range(seg_width):
        bit = start + idx
        lines.append("  wire {0}_p0_{1} = {2}[{3}] ^ {4}[{3}];".format(prefix, idx, x_name, bit, y_name))
        lines.append("  wire {0}_g0_{1} = {2}[{3}] & {4}[{3}];".format(prefix, idx, x_name, bit, y_name))
    prev = 0
    step = 1
    stage = 1
    while step < seg_width:
        for idx in range(seg_width):
            if idx >= step:
                lines.append("  wire {0}_p{1}_{2} = {0}_p{3}_{2} & {0}_p{3}_{4};".format(prefix, stage, idx, prev, idx - step))
                lines.append("  wire {0}_g{1}_{2} = {0}_g{3}_{2} | ({0}_p{3}_{2} & {0}_g{3}_{4});".format(prefix, stage, idx, prev, idx - step))
            else:
                lines.append("  wire {0}_p{1}_{2} = {0}_p{3}_{2};".format(prefix, stage, idx, prev))
                lines.append("  wire {0}_g{1}_{2} = {0}_g{3}_{2};".format(prefix, stage, idx, prev))
        prev = stage
        stage += 1
        step <<= 1
    for idx in range(seg_width):
        if idx == 0:
            carry = "{0}_cin".format(prefix)
        else:
            carry = "({0}_g{1}_{2} | ({0}_p{1}_{2} & {0}_cin))".format(prefix, prev, idx - 1)
        lines.append("  assign {0}[{1}] = {2}_p0_{3} ^ {4};".format(out_name, start + idx, prefix, idx, carry))


def render_baugh_wooley_wallace_generic(module, n, item_order="natural", final_merge="cla", sign_override=False):
    width = 2 * n
    lines = header(module, n)
    columns = [[] for _ in range(width + 1)]
    for i in range(n - 1):
        for j in range(n - 1):
            name = "bw_pp_{0}_{1}".format(i, j)
            lines.append("  wire {0} = a[{1}] & b[{2}];".format(name, i, j))
            columns[i + j].append(name)
    for j in range(n - 1):
        name = "bw_nr_{0}".format(j)
        lines.append("  wire {0} = ~(sa & b[{1}]);".format(name, j))
        columns[n - 1 + j].append(name)
    for i in range(n - 1):
        name = "bw_nc_{0}".format(i)
        lines.append("  wire {0} = ~(a[{1}] & sb);".format(name, i))
        columns[n - 1 + i].append(name)
    columns[2 * n - 2].append("sa & sb")
    columns[n].append("1'b1")
    columns[2 * n - 1].append("1'b1")
    append_wallace_columns(lines, columns, width, "bw", "product", item_order=item_order, final_merge=final_merge)
    lines.extend(
        [
            (
                "  assign out = {{((sa ^ sb) & (|a) & (|b)), product[{0}:0]}};".format(width - 2)
                if sign_override
                else "  assign out = product;"
            ),
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


def render_baugh_wooley_wallace_mod_generic(module, n, item_order="natural", final_merge="cla"):
    width = 2 * n
    lines = header(module, n)
    columns = [[] for _ in range(width + 1)]
    for i in range(n - 1):
        for j in range(n - 1):
            name = "bw_pp_{0}_{1}".format(i, j)
            lines.append("  wire {0} = a[{1}] & b[{2}];".format(name, i, j))
            columns[i + j].append(name)
    for j in range(n - 1):
        name = "bw_nr_{0}".format(j)
        lines.append("  wire {0} = ~(sa & b[{1}]);".format(name, j))
        columns[n - 1 + j].append(name)
    for i in range(n - 1):
        name = "bw_nc_{0}".format(i)
        lines.append("  wire {0} = ~(a[{1}] & sb);".format(name, i))
        columns[n - 1 + i].append(name)
    columns[2 * n - 2].append("sa & sb")
    columns[n].append("1'b1")
    columns[2 * n - 1].append("1'b1")
    append_wallace_columns_mod(lines, columns, width, "bwm", "product", item_order=item_order, final_merge=final_merge)
    lines.extend(["  assign out = product;", "endmodule", ""])
    return "\n".join(lines)


def baugh_columns(lines, n):
    width = 2 * n
    columns = [[] for _ in range(width + 1)]
    for i in range(n - 1):
        for j in range(n - 1):
            name = "bw_pp_{0}_{1}".format(i, j)
            lines.append("  wire {0} = a[{1}] & b[{2}];".format(name, i, j))
            columns[i + j].append(name)
    for j in range(n - 1):
        name = "bw_nr_{0}".format(j)
        lines.append("  wire {0} = ~(sa & b[{1}]);".format(name, j))
        columns[n - 1 + j].append(name)
    for i in range(n - 1):
        name = "bw_nc_{0}".format(i)
        lines.append("  wire {0} = ~(a[{1}] & sb);".format(name, i))
        columns[n - 1 + i].append(name)
    columns[2 * n - 2].append("sa & sb")
    columns[n].append("1'b1")
    columns[2 * n - 1].append("1'b1")
    return columns


def append_dadda_columns(lines, columns, width, prefix, out_name, final_merge="cla"):
    max_height = max(len(col) for col in columns)
    targets = [2]
    while targets[-1] < max_height:
        targets.append(int(targets[-1] * 3 // 2))
    for stage, target in enumerate(reversed(targets[:-1])):
        next_columns = [[] for _ in range(width + 1)]
        for col_index, items_in in enumerate(columns):
            items = list(items_in)
            comp = 0
            while len(items) > target:
                if len(items) - target >= 2 and len(items) >= 3:
                    x = items.pop(0)
                    y = items.pop(0)
                    z = items.pop(0)
                    s = "{0}_ds{1}_{2}_{3}".format(prefix, stage, col_index, comp)
                    c = "{0}_dc{1}_{2}_{3}".format(prefix, stage, col_index, comp)
                    lines.append("  wire {0} = {1} ^ {2} ^ {3};".format(s, x, y, z))
                    lines.append("  wire {0} = ({1} & {2}) | ({1} & {3}) | ({2} & {3});".format(c, x, y, z))
                else:
                    x = items.pop(0)
                    y = items.pop(0)
                    s = "{0}_hs{1}_{2}_{3}".format(prefix, stage, col_index, comp)
                    c = "{0}_hc{1}_{2}_{3}".format(prefix, stage, col_index, comp)
                    lines.append("  wire {0} = {1} ^ {2};".format(s, x, y))
                    lines.append("  wire {0} = {1} & {2};".format(c, x, y))
                next_columns[col_index].append(s)
                if col_index + 1 <= width:
                    next_columns[col_index + 1].append(c)
                comp += 1
            next_columns[col_index].extend(items)
        columns = next_columns
    cleanup = 0
    while any(len(col) > 2 for col in columns):
        next_columns = [[] for _ in range(width + 1)]
        for col_index, items_in in enumerate(columns):
            items = list(items_in)
            comp = 0
            while len(items) >= 3:
                x = items.pop(0)
                y = items.pop(0)
                z = items.pop(0)
                s = "{0}_cs{1}_{2}_{3}".format(prefix, cleanup, col_index, comp)
                c = "{0}_cc{1}_{2}_{3}".format(prefix, cleanup, col_index, comp)
                lines.append("  wire {0} = {1} ^ {2} ^ {3};".format(s, x, y, z))
                lines.append("  wire {0} = ({1} & {2}) | ({1} & {3}) | ({2} & {3});".format(c, x, y, z))
                next_columns[col_index].append(s)
                if col_index + 1 <= width:
                    next_columns[col_index + 1].append(c)
                comp += 1
            next_columns[col_index].extend(items)
        columns = next_columns
        cleanup += 1
    row0_bits = []
    row1_bits = []
    for col_index in range(width + 1):
        items = columns[col_index]
        if not items:
            row0_bits.append("1'b0")
            row1_bits.append("1'b0")
        elif len(items) == 1:
            row0_bits.append(items[0])
            row1_bits.append("1'b0")
        elif len(items) == 2:
            row0_bits.append(items[0])
            row1_bits.append(items[1])
        else:
            raise RuntimeError("dadda left too many bits")
    lines.append("  wire [{0}:0] {1}_row0 = {{{2}}};".format(width, prefix, ", ".join(reversed(row0_bits))))
    lines.append("  wire [{0}:0] {1}_row1 = {{{2}}};".format(width, prefix, ", ".join(reversed(row1_bits))))
    if final_merge == "cla":
        append_prefix_adder(lines, width + 1, "{0}_row0".format(prefix), "{0}_row1".format(prefix), "{0}_sum".format(prefix), prefix + "_cla")
    elif final_merge == "plus":
        lines.append("  wire [{0}:0] {1}_sum = {1}_row0 + {1}_row1;".format(width, prefix))
    elif final_merge.startswith("hcla"):
        append_hybrid_cla_adder(lines, width + 1, "{0}_row0".format(prefix), "{0}_row1".format(prefix), "{0}_sum".format(prefix), prefix + "_hcla", int(final_merge[4:]))
    elif final_merge.startswith("pfx"):
        append_hybrid_prefix_adder(lines, width + 1, "{0}_row0".format(prefix), "{0}_row1".format(prefix), "{0}_sum".format(prefix), prefix + "_pfx", int(final_merge[3:]))
    else:
        raise RuntimeError("unknown final merge {0}".format(final_merge))
    lines.append("  wire [{0}:0] {1} = {2}_sum[{0}:0];".format(width - 1, out_name, prefix))


def render_baugh_wooley_dadda_generic(module, n, final_merge="cla"):
    width = 2 * n
    lines = header(module, n)
    columns = baugh_columns(lines, n)
    append_dadda_columns(lines, columns, width, "bd", "product", final_merge=final_merge)
    lines.extend(
        [
            "  assign out = product;",
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


def render_baugh_wooley_wallace4_generic(module, n, item_order="natural", final_merge="cla"):
    width = 2 * n
    lines = header(module, n)
    columns = [[] for _ in range(width + 1)]
    for i in range(n - 1):
        for j in range(n - 1):
            name = "b4_pp_{0}_{1}".format(i, j)
            lines.append("  wire {0} = a[{1}] & b[{2}];".format(name, i, j))
            columns[i + j].append(name)
    for j in range(n - 1):
        name = "b4_nr_{0}".format(j)
        lines.append("  wire {0} = ~(sa & b[{1}]);".format(name, j))
        columns[n - 1 + j].append(name)
    for i in range(n - 1):
        name = "b4_nc_{0}".format(i)
        lines.append("  wire {0} = ~(a[{1}] & sb);".format(name, i))
        columns[n - 1 + i].append(name)
    columns[2 * n - 2].append("sa & sb")
    columns[n].append("1'b1")
    columns[2 * n - 1].append("1'b1")
    append_wallace4_columns(lines, columns, width, "b4", "product", item_order=item_order, final_merge=final_merge)
    lines.extend(["  assign out = product;", "endmodule", ""])
    return "\n".join(lines)


def emit_baugh_wooley_terms(lines, n, prefix):
    width = 2 * n
    columns = [[] for _ in range(width)]
    const_offsets = [0 for _ in range(width)]
    for i in range(n - 1):
        for j in range(n - 1):
            name = "{0}_pp_{1}_{2}".format(prefix, i, j)
            lines.append("  wire {0} = a[{1}] & b[{2}];".format(name, i, j))
            columns[i + j].append(name)
    for j in range(n - 1):
        name = "{0}_nr_{1}".format(prefix, j)
        lines.append("  wire {0} = ~(sa & b[{1}]);".format(name, j))
        columns[n - 1 + j].append(name)
    for i in range(n - 1):
        name = "{0}_nc_{1}".format(prefix, i)
        lines.append("  wire {0} = ~(a[{1}] & sb);".format(name, i))
        columns[n - 1 + i].append(name)
    name = "{0}_ss".format(prefix)
    lines.append("  wire {0} = sa & sb;".format(name))
    columns[2 * n - 2].append(name)
    const_offsets[n] += 1
    const_offsets[2 * n - 1] += 1
    return columns, const_offsets


def extend_to_width(expr, expr_width, out_width):
    if expr_width == out_width:
        return expr
    if expr_width == 0:
        return "{0}'b0".format(out_width)
    return "{{{{{0}{{1'b0}}}}, {1}}}".format(out_width - expr_width, expr)


def render_baugh_wooley_column_arith(module, n):
    width = 2 * n
    lines = header(module, n)
    columns, const_offsets = emit_baugh_wooley_terms(lines, n, "bc")
    lines.append("  wire [{0}:0] product;".format(width - 1))
    carry_name = None
    carry_width = 0
    carry_max = 0
    for col in range(width):
        bits = columns[col]
        max_total = carry_max + len(bits) + const_offsets[col]
        sum_width = max(1, max_total.bit_length())
        terms = []
        if carry_name is not None:
            terms.append(extend_to_width(carry_name, carry_width, sum_width))
        for bit in bits:
            terms.append(extend_to_width(bit, 1, sum_width))
        if const_offsets[col]:
            terms.append("{0}'d{1}".format(sum_width, const_offsets[col]))
        if not terms:
            terms.append("{0}'b0".format(sum_width))
        sum_name = "bc_sum{0}".format(col)
        lines.append("  wire [{0}:0] {1} = {2};".format(sum_width - 1, sum_name, " + ".join(terms)))
        lines.append("  assign product[{0}] = {1}[0];".format(col, sum_name))
        carry_max = max_total >> 1
        carry_width = max(0, carry_max.bit_length())
        if carry_width:
            carry_name = "bc_carry{0}".format(col + 1)
            lines.append("  wire [{0}:0] {1} = {2}[{3}:1];".format(carry_width - 1, carry_name, sum_name, sum_width - 1))
        else:
            carry_name = None
    lines.extend(["  assign out = product;", "endmodule", ""])
    return "\n".join(lines)


def weighted_parity_expr_const(weighted_bits, const_offset):
    expr = mulfocus.weighted_parity_expr(weighted_bits)
    if const_offset & 1:
        if expr == "1'b0":
            return "1'b1"
        return "~({0})".format(expr)
    return expr


def minimized_truth_sop_expr(var_names, minterms):
    nvars = len(var_names)
    minterms = sorted(set(minterms))
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
        for key in sorted(current):
            for item in current.get(key, set()):
                for other in current.get(key + 1, set()):
                    combined = mulfocus.combine_implicant(item, other)
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
    cover_map = {prime: {m for m in minterms if mulfocus.implicant_covers(prime, m)} for prime in primes}
    selected = []
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
            if char == "1":
                factors.append(var_names[index])
            elif char == "0":
                factors.append("~" + var_names[index])
        terms.append("1'b1" if not factors else "(" + " & ".join(factors) + ")")
    return " | ".join(terms)


def render_ex260_shared_bdd(module, n, order):
    if n != 4:
        return None
    width = 8
    cache = {}
    unique = {}
    nodes = []

    def product_for(assign):
        index = 0
        for bit, value in assign.items():
            if value:
                index |= 1 << bit
        a = signed_value(index & 15, 4)
        b = signed_value((index >> 4) & 15, 4)
        return (a * b) & 255

    def build(depth, assign):
        key = (depth, tuple(sorted(assign.items())))
        if key in cache:
            return cache[key]
        if depth == len(order):
            result = ("const", product_for(assign))
            cache[key] = result
            return result
        var = order[depth]
        assign[var] = 0
        lo = build(depth + 1, assign)
        assign[var] = 1
        hi = build(depth + 1, assign)
        del assign[var]
        if lo == hi:
            cache[key] = lo
            return lo
        node_key = (var, lo, hi)
        if node_key not in unique:
            unique[node_key] = len(nodes)
            nodes.append(node_key)
        result = ("node", unique[node_key])
        cache[key] = result
        return result

    def expr(ref):
        kind, value = ref
        if kind == "const":
            return const(width, value)
        return "bd_{0}".format(value)

    root = build(0, {})
    lines = header(module, n)
    for node_id, (var, lo, hi) in enumerate(nodes):
        lines.append(
            "  wire [{0}:0] bd_{1} = in[{2}] ? {3} : {4};".format(
                width - 1,
                node_id,
                var,
                expr(hi),
                expr(lo),
            )
        )
    lines.append("  assign out = {0};".format(expr(root)))
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def render_ex260_shared_bdd_nat(module, n):
    return render_ex260_shared_bdd(module, n, [0, 1, 2, 3, 4, 5, 6, 7])


def render_ex260_shared_bdd_interleave(module, n):
    return render_ex260_shared_bdd(module, n, [0, 4, 1, 5, 2, 6, 3, 7])


def render_ex260_shared_bdd_signfirst(module, n):
    return render_ex260_shared_bdd(module, n, [3, 7, 2, 6, 1, 5, 0, 4])


def render_ex260_shared_bdd_signlast(module, n):
    return render_ex260_shared_bdd(module, n, [0, 1, 2, 4, 5, 6, 3, 7])


def render_ex260_shared_bdd_outside(module, n):
    return render_ex260_shared_bdd(module, n, [0, 7, 1, 6, 2, 5, 3, 4])


def render_ex260_bw_rev_handmerge(module, n):
    if n != 4:
        return None
    lines = header(module, n)
    for i in range(3):
        for j in range(3):
            lines.append("  wire pp_{0}_{1} = a[{0}] & b[{1}];".format(i, j))
    for j in range(3):
        lines.append("  wire nr_{0} = ~(sa & b[{0}]);".format(j))
    for i in range(3):
        lines.append("  wire nc_{0} = ~(a[{0}] & sb);".format(i))
    lines.extend(
        [
            "  wire s0_2 = pp_2_0 ^ pp_1_1 ^ pp_0_2;",
            "  wire c0_2 = (pp_2_0 & pp_1_1) | (pp_2_0 & pp_0_2) | (pp_1_1 & pp_0_2);",
            "  wire s0_3 = nc_0 ^ nr_0 ^ pp_2_1;",
            "  wire c0_3 = (nc_0 & nr_0) | (nc_0 & pp_2_1) | (nr_0 & pp_2_1);",
            "  wire s0_4 = ~(nc_1 ^ nr_1);",
            "  wire c0_4 = nc_1 | nr_1;",
            "  wire s1_3 = c0_2 ^ s0_3 ^ pp_1_2;",
            "  wire c1_3 = (c0_2 & s0_3) | (c0_2 & pp_1_2) | (s0_3 & pp_1_2);",
            "  wire s1_4 = c0_3 ^ s0_4 ^ pp_2_2;",
            "  wire c1_4 = (c0_3 & s0_4) | (c0_3 & pp_2_2) | (s0_4 & pp_2_2);",
            "  wire s1_5 = c0_4 ^ nc_2 ^ nr_2;",
            "  wire c1_5 = (c0_4 & nc_2) | (c0_4 & nr_2) | (nc_2 & nr_2);",
            "  wire lo_c2 = pp_1_0 & pp_0_1;",
            "  wire lo_c3 = s0_2 & lo_c2;",
            "  wire lo_c4 = s1_3 & lo_c3;",
            "  wire p4 = c1_3 ^ s1_4;",
            "  wire g4 = c1_3 & s1_4;",
            "  wire p5 = c1_4 ^ s1_5;",
            "  wire g5 = c1_4 & s1_5;",
            "  wire p6 = c1_5 ^ (sa & sb);",
            "  wire g6 = c1_5 & (sa & sb);",
            "  wire c5 = g4 | (p4 & lo_c4);",
            "  wire c6 = g5 | (p5 & g4) | (p5 & p4 & lo_c4);",
            "  wire c7 = g6 | (p6 & g5) | (p6 & p5 & g4) | (p6 & p5 & p4 & lo_c4);",
            "  assign out[0] = pp_0_0;",
            "  assign out[1] = pp_1_0 ^ pp_0_1;",
            "  assign out[2] = s0_2 ^ lo_c2;",
            "  assign out[3] = s1_3 ^ lo_c3;",
            "  assign out[4] = p4 ^ lo_c4;",
            "  assign out[5] = p5 ^ c5;",
            "  assign out[6] = p6 ^ c6;",
            "  assign out[7] = ~c7;",
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


def render_ex260_qmc_bits(module, n):
    if n != 4:
        return None
    width = 8
    lines = header(module, n)
    var_names = ["a[{0}]".format(i) for i in range(4)] + ["b[{0}]".format(i) for i in range(4)]
    for bit in range(width):
        minterms = []
        for index in range(1 << width):
            a = signed_value(index & 15, 4)
            b = signed_value((index >> 4) & 15, 4)
            product = (a * b) & 255
            if product & (1 << bit):
                minterms.append(index)
        lines.append("  assign out[{0}] = {1};".format(bit, minimized_truth_sop_expr(var_names, minterms)))
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def ex260_qmc_expr_for_bit(bit):
    var_names = ["a[{0}]".format(i) for i in range(4)] + ["b[{0}]".format(i) for i in range(4)]
    minterms = []
    for index in range(256):
        a = signed_value(index & 15, 4)
        b = signed_value((index >> 4) & 15, 4)
        product = (a * b) & 255
        if product & (1 << bit):
            minterms.append(index)
    return minimized_truth_sop_expr(var_names, minterms)


def render_ex260_rev_hcla4_qmc_hi(module, n, high_count):
    if n != 4:
        return None
    text = render_baugh_wooley_wallace_generic(module, n, "reverse", "hcla4")
    trailer = "  assign out = product;\nendmodule\n"
    if not text.endswith(trailer):
        raise RuntimeError("unexpected Baugh-Wooley trailer")
    lines = text[: -len(trailer)].splitlines()
    first_high = 8 - high_count
    if first_high > 0:
        lines.append("  assign out[{0}:0] = product[{0}:0];".format(first_high - 1))
    for bit in range(first_high, 8):
        lines.append("  assign out[{0}] = {1};".format(bit, ex260_qmc_expr_for_bit(bit)))
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def render_ex260_rev_hcla4_qmc_hi1(module, n):
    return render_ex260_rev_hcla4_qmc_hi(module, n, 1)


def render_ex260_rev_hcla4_qmc_hi2(module, n):
    return render_ex260_rev_hcla4_qmc_hi(module, n, 2)


def render_ex260_rev_hcla4_qmc_hi3(module, n):
    return render_ex260_rev_hcla4_qmc_hi(module, n, 3)


def render_ex260_rev_hcla4_qmc_hi4(module, n):
    return render_ex260_rev_hcla4_qmc_hi(module, n, 4)


def render_baugh_wooley_column_min_sop(module, n):
    width = 2 * n
    lines = header(module, n)
    columns, const_offsets = emit_baugh_wooley_terms(lines, n, "bm")
    lines.append("  wire [{0}:0] product;".format(width - 1))
    carry_bits = []
    for col in range(width):
        weighted = [(name, 1) for name in columns[col]] + carry_bits
        const_offset = const_offsets[col]
        lines.append("  assign product[{0}] = {1};".format(col, weighted_parity_expr_const(weighted, const_offset)))
        max_total = const_offset + sum(weight for _, weight in weighted)
        next_width = max(0, (max_total >> 1).bit_length())
        next_carry = []
        for bit in range(next_width):
            name = "bm_c{0}_{1}".format(col + 1, bit)
            lines.append("  wire {0} = {1};".format(name, mulfocus.minimized_sop_expr_const(weighted, bit + 1, const_offset)))
            next_carry.append((name, 1 << bit))
        carry_bits = next_carry
    lines.extend(["  assign out = product;", "endmodule", ""])
    return "\n".join(lines)


def render_baugh_wooley_wallace(module, n):
    return render_baugh_wooley_wallace_generic(module, n, "natural", "cla")


def render_baugh_wooley_wallace_rev(module, n):
    return render_baugh_wooley_wallace_generic(module, n, "reverse", "cla")


def render_baugh_wooley_wallace_outside(module, n):
    return render_baugh_wooley_wallace_generic(module, n, "outside", "cla")


def render_baugh_wooley_wallace_plus(module, n):
    return render_baugh_wooley_wallace_generic(module, n, "natural", "plus")


def render_baugh_wooley_wallace_rev_hcla4(module, n):
    return render_baugh_wooley_wallace_generic(module, n, "reverse", "hcla4")


def render_baugh_wooley_wallace_rev_hcla3(module, n):
    return render_baugh_wooley_wallace_generic(module, n, "reverse", "hcla3")


def render_baugh_wooley_wallace_rev_hcla5(module, n):
    return render_baugh_wooley_wallace_generic(module, n, "reverse", "hcla5")


def render_baugh_wooley_wallace_rev_hcla2(module, n):
    return render_baugh_wooley_wallace_generic(module, n, "reverse", "hcla2")


def render_baugh_wooley_wallace_rev_hcla6(module, n):
    return render_baugh_wooley_wallace_generic(module, n, "reverse", "hcla6")


def render_baugh_wooley_wallace_outside_hcla4(module, n):
    return render_baugh_wooley_wallace_generic(module, n, "outside", "hcla4")


def render_baugh_wooley_wallace_outside_hcla3(module, n):
    return render_baugh_wooley_wallace_generic(module, n, "outside", "hcla3")


def render_baugh_wooley_wallace_outside_hcla5(module, n):
    return render_baugh_wooley_wallace_generic(module, n, "outside", "hcla5")


def render_baugh_wooley_wallace_outside_hcla2(module, n):
    return render_baugh_wooley_wallace_generic(module, n, "outside", "hcla2")


def render_baugh_wooley_wallace_outside_hcla6(module, n):
    return render_baugh_wooley_wallace_generic(module, n, "outside", "hcla6")


def render_baugh_wooley_wallace_rev_rhcla4(module, n):
    return render_baugh_wooley_wallace_generic(module, n, "reverse", "rhcla4")


def render_baugh_wooley_wallace_rev_rhcla3(module, n):
    return render_baugh_wooley_wallace_generic(module, n, "reverse", "rhcla3")


def render_baugh_wooley_wallace_rev_rhcla5(module, n):
    return render_baugh_wooley_wallace_generic(module, n, "reverse", "rhcla5")


def render_baugh_wooley_wallace_rev_rhcla2(module, n):
    return render_baugh_wooley_wallace_generic(module, n, "reverse", "rhcla2")


def render_baugh_wooley_wallace_rev_rhcla6(module, n):
    return render_baugh_wooley_wallace_generic(module, n, "reverse", "rhcla6")


def render_baugh_wooley_wallace_outside_rhcla3(module, n):
    return render_baugh_wooley_wallace_generic(module, n, "outside", "rhcla3")


def render_baugh_wooley_wallace_outside_rhcla4(module, n):
    return render_baugh_wooley_wallace_generic(module, n, "outside", "rhcla4")


def render_baugh_wooley_wallace_outside_rhcla5(module, n):
    return render_baugh_wooley_wallace_generic(module, n, "outside", "rhcla5")


def render_baugh_wooley_wallace_outside_rhcla2(module, n):
    return render_baugh_wooley_wallace_generic(module, n, "outside", "rhcla2")


def render_baugh_wooley_wallace_outside_rhcla6(module, n):
    return render_baugh_wooley_wallace_generic(module, n, "outside", "rhcla6")


def render_baugh_wooley_wallace_rev_pfx6(module, n):
    return render_baugh_wooley_wallace_generic(module, n, "reverse", "pfx6")


def render_baugh_wooley_wallace_outside_pfx6(module, n):
    return render_baugh_wooley_wallace_generic(module, n, "outside", "pfx6")


def render_baugh_wooley_wallace_rev_hcla4_signbit(module, n):
    return render_baugh_wooley_wallace_generic(module, n, "reverse", "hcla4", sign_override=True)


def render_baugh_wooley_wallace_outside_hcla1_signbit(module, n):
    return render_baugh_wooley_wallace_generic(module, n, "outside", "hcla1", sign_override=True)


def render_baugh_wooley_wallace_outside_hcla1_pfx_signbit(module, n):
    return render_baugh_wooley_wallace_generic(module, n, "outside", "pfx1", sign_override=True)


def render_baugh_wooley_wallace_rev_hcla6_signbit(module, n):
    return render_baugh_wooley_wallace_generic(module, n, "reverse", "hcla6", sign_override=True)


def render_baugh_wooley_wallace4_rev_hcla4(module, n):
    return render_baugh_wooley_wallace4_generic(module, n, "reverse", "hcla4")


def render_baugh_wooley_wallace4_outside_hcla1(module, n):
    return render_baugh_wooley_wallace4_generic(module, n, "outside", "hcla1")


def render_baugh_wooley_wallace4_outside_hcla2(module, n):
    return render_baugh_wooley_wallace4_generic(module, n, "outside", "hcla2")


def render_baugh_wooley_wallace4_outside_rhcla2(module, n):
    return render_baugh_wooley_wallace4_generic(module, n, "outside", "rhcla2")


def render_baugh_wooley_wallace_center_hcla4(module, n):
    return render_baugh_wooley_wallace_generic(module, n, "center", "hcla4")


def render_baugh_wooley_wallace_center_rhcla3(module, n):
    return render_baugh_wooley_wallace_generic(module, n, "center", "rhcla3")


def render_baugh_wooley_wallace_center_rhcla4(module, n):
    return render_baugh_wooley_wallace_generic(module, n, "center", "rhcla4")


def render_baugh_wooley_wallace_evenodd_hcla4(module, n):
    return render_baugh_wooley_wallace_generic(module, n, "evenodd", "hcla4")


def render_baugh_wooley_wallace_evenodd_rhcla4(module, n):
    return render_baugh_wooley_wallace_generic(module, n, "evenodd", "rhcla4")


def render_baugh_wooley_wallace_signbit(module, n):
    return render_baugh_wooley_wallace_generic(module, n, "natural", "cla", sign_override=True)


def render_baugh_wooley_wallace_rev_signbit(module, n):
    return render_baugh_wooley_wallace_generic(module, n, "reverse", "cla", sign_override=True)


def render_baugh_wooley_wallace_hcla4(module, n):
    return render_baugh_wooley_wallace_generic(module, n, "natural", "hcla4")


def render_baugh_wooley_wallace_hcla2(module, n):
    return render_baugh_wooley_wallace_generic(module, n, "natural", "hcla2")


def render_baugh_wooley_wallace_hcla3(module, n):
    return render_baugh_wooley_wallace_generic(module, n, "natural", "hcla3")


def render_baugh_wooley_wallace_hcla5(module, n):
    return render_baugh_wooley_wallace_generic(module, n, "natural", "hcla5")


def render_baugh_wooley_wallace_hcla6(module, n):
    return render_baugh_wooley_wallace_generic(module, n, "natural", "hcla6")


def render_baugh_wooley_wallace_hcla8(module, n):
    return render_baugh_wooley_wallace_generic(module, n, "natural", "hcla8")


def render_baugh_wooley_wallace_rhcla3(module, n):
    return render_baugh_wooley_wallace_generic(module, n, "natural", "rhcla3")


def render_baugh_wooley_wallace_rhcla4(module, n):
    return render_baugh_wooley_wallace_generic(module, n, "natural", "rhcla4")


def render_baugh_wooley_wallace_rhcla5(module, n):
    return render_baugh_wooley_wallace_generic(module, n, "natural", "rhcla5")


def render_baugh_wooley_wallace_rpfx6(module, n):
    return render_baugh_wooley_wallace_generic(module, n, "natural", "rpfx6")


def render_baugh_wooley_wallace_pfx3(module, n):
    return render_baugh_wooley_wallace_generic(module, n, "natural", "pfx3")


def render_baugh_wooley_wallace_pfx4(module, n):
    return render_baugh_wooley_wallace_generic(module, n, "natural", "pfx4")


def render_baugh_wooley_wallace_pfx5(module, n):
    return render_baugh_wooley_wallace_generic(module, n, "natural", "pfx5")


def render_baugh_wooley_wallace_pfx6(module, n):
    return render_baugh_wooley_wallace_generic(module, n, "natural", "pfx6")


def render_baugh_wooley_wallace_pfx8(module, n):
    return render_baugh_wooley_wallace_generic(module, n, "natural", "pfx8")


def render_baugh_wooley_wallace_csel2(module, n):
    return render_baugh_wooley_wallace_generic(module, n, "natural", "csel2")


def render_baugh_wooley_wallace_csel3(module, n):
    return render_baugh_wooley_wallace_generic(module, n, "natural", "csel3")


def render_baugh_wooley_wallace_csel4(module, n):
    return render_baugh_wooley_wallace_generic(module, n, "natural", "csel4")


def render_baugh_wooley_dadda(module, n):
    return render_baugh_wooley_dadda_generic(module, n, "cla")


def render_baugh_wooley_dadda_plus(module, n):
    return render_baugh_wooley_dadda_generic(module, n, "plus")


def render_baugh_wooley_dadda_hcla4(module, n):
    return render_baugh_wooley_dadda_generic(module, n, "hcla4")


def render_baugh_wooley_dadda_pfx6(module, n):
    return render_baugh_wooley_dadda_generic(module, n, "pfx6")


def baugh_row_expr(n, row_kind, index=None):
    width = 2 * n
    bits = ["1'b0"] * width
    if row_kind == "low":
        i = index
        for j in range(n - 1):
            bits[i + j] = "(a[{0}] & b[{1}])".format(i, j)
        bits[n - 1 + i] = "~(a[{0}] & sb)".format(i)
    elif row_kind == "sign":
        for j in range(n - 1):
            bits[n - 1 + j] = "~(sa & b[{0}])".format(j)
        bits[2 * n - 2] = "(sa & sb)"
    elif row_kind == "const":
        bits[n] = "1'b1"
        bits[2 * n - 1] = "1'b1"
    else:
        raise RuntimeError("unknown Baugh row kind {0}".format(row_kind))
    return "{" + ", ".join(reversed(bits)) + "}"


def append_vector_csa(lines, width, rows, out_name, prefix, final_merge):
    stage = 0
    while len(rows) > 2:
        next_rows = []
        for index in range(0, len(rows), 3):
            chunk = rows[index : index + 3]
            if len(chunk) == 3:
                s = "{0}_s{1}_{2}".format(prefix, stage, index // 3)
                c = "{0}_c{1}_{2}".format(prefix, stage, index // 3)
                x, y, z = chunk
                lines.append("  wire [{0}:0] {1} = {2} ^ {3} ^ {4};".format(width - 1, s, x, y, z))
                lines.append("  wire [{0}:0] {1} = (({2} & {3}) | ({2} & {4}) | ({3} & {4})) << 1;".format(width - 1, c, x, y, z))
                next_rows.extend([s, c])
            else:
                next_rows.extend(chunk)
        rows = next_rows
        stage += 1
    if final_merge == "plus":
        lines.append("  wire [{0}:0] {1} = {2} + {3};".format(width - 1, out_name, rows[0], rows[1]))
    elif final_merge == "cla":
        append_prefix_adder(lines, width, rows[0], rows[1], out_name, prefix + "_cla")
    elif final_merge.startswith("hcla"):
        append_hybrid_cla_adder(lines, width, rows[0], rows[1], out_name, prefix + "_hcla", int(final_merge[4:]))
    else:
        raise RuntimeError("unknown final merge {0}".format(final_merge))


def render_baugh_wooley_rows_generic(module, n, final_merge):
    width = 2 * n
    lines = header(module, n)
    rows = []
    for i in range(n - 1):
        name = "br_low{0}".format(i)
        rows.append(name)
        lines.append("  wire [{0}:0] {1} = {2};".format(width - 1, name, baugh_row_expr(n, "low", i)))
    rows.append("br_sign")
    lines.append("  wire [{0}:0] br_sign = {1};".format(width - 1, baugh_row_expr(n, "sign")))
    rows.append("br_const")
    lines.append("  wire [{0}:0] br_const = {1};".format(width - 1, baugh_row_expr(n, "const")))
    append_vector_csa(lines, width, rows, "product", "br", final_merge)
    lines.extend(
        [
            "  assign out = product;",
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


def render_baugh_wooley_rows_plus(module, n):
    return render_baugh_wooley_rows_generic(module, n, "plus")


def render_baugh_wooley_rows_cla(module, n):
    return render_baugh_wooley_rows_generic(module, n, "cla")


def render_baugh_wooley_rows_hcla4(module, n):
    return render_baugh_wooley_rows_generic(module, n, "hcla4")


def booth_code_expr(n, group):
    prev = "1'b0" if group == 0 else "b[{0}]".format(2 * group - 1)
    mid_index = 2 * group
    high_index = 2 * group + 1
    mid = "b[{0}]".format(mid_index) if mid_index < n else "b[{0}]".format(n - 1)
    high = "b[{0}]".format(high_index) if high_index < n else "b[{0}]".format(n - 1)
    return "{{{0}, {1}, {2}}}".format(high, mid, prev)


def render_booth_radix4_signed(module, n):
    width = 2 * n
    work_width = width + 3
    groups = (n + 1) // 2
    lines = header(module, n)
    lines.extend(
        [
            "  wire signed [{0}:0] a_s = {{{{{1}{{sa}}}}, a}};".format(work_width - 1, work_width - n),
            "  reg signed [{0}:0] acc;".format(work_width - 1),
            "  reg signed [{0}:0] pp;".format(work_width - 1),
            "  always @* begin",
            "    acc = {0}'sd0;".format(work_width),
        ]
    )
    for group in range(groups):
        shift = 2 * group
        lines.extend(
            [
                "    case ({0})".format(booth_code_expr(n, group)),
                "      3'b000, 3'b111: pp = {0}'sd0;".format(work_width),
                "      3'b001, 3'b010: pp = a_s;",
                "      3'b011: pp = a_s <<< 1;",
                "      3'b100: pp = -(a_s <<< 1);",
                "      3'b101, 3'b110: pp = -a_s;",
                "      default: pp = {0}'sd0;".format(work_width),
                "    endcase",
                "    acc = acc + (pp <<< {0});".format(shift),
            ]
        )
    lines.extend(
        [
            "  end",
            "  assign out = acc[{0}:0];".format(width - 1),
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


def append_booth_rows(lines, n, prefix):
    width = 2 * n
    work_width = width + 3
    groups = (n + 1) // 2
    row_names = []
    lines.append("  wire signed [{0}:0] {1}_a_s = {{{{{2}{{sa}}}}, a}};".format(work_width - 1, prefix, work_width - n))
    for group in range(groups):
        rec = "{0}_rec{1}".format(prefix, group)
        raw = "{0}_raw{1}".format(prefix, group)
        row = "{0}_row{1}".format(prefix, group)
        row_names.append(row)
        lines.append("  reg signed [{0}:0] {1};".format(work_width - 1, raw))
        lines.append("  always @* begin")
        lines.append("    case ({0})".format(booth_code_expr(n, group)))
        lines.append("      3'b000, 3'b111: {0} = {1}'sd0;".format(raw, work_width))
        lines.append("      3'b001, 3'b010: {0} = {1}_a_s;".format(raw, prefix))
        lines.append("      3'b011: {0} = {1}_a_s <<< 1;".format(raw, prefix))
        lines.append("      3'b100: {0} = -({1}_a_s <<< 1);".format(raw, prefix))
        lines.append("      3'b101, 3'b110: {0} = -{1}_a_s;".format(raw, prefix))
        lines.append("      default: {0} = {1}'sd0;".format(raw, work_width))
        lines.append("    endcase")
        lines.append("  end")
        lines.append("  wire signed [{0}:0] {1} = {2} <<< {3};".format(work_width - 1, row, raw, 2 * group))
        lines.append("  wire [{0}:0] {1} = {2};".format(work_width - 1, rec, row))
    return row_names, work_width


def balanced_sum_expr(terms):
    current = list(terms)
    if not current:
        return ""
    while len(current) > 1:
        nxt = []
        for index in range(0, len(current), 2):
            if index + 1 < len(current):
                nxt.append("({0} + {1})".format(current[index], current[index + 1]))
            else:
                nxt.append(current[index])
        current = nxt
    return current[0]


def render_booth_radix4_balanced(module, n):
    width = 2 * n
    lines = header(module, n)
    rows, work_width = append_booth_rows(lines, n, "br")
    signed_rows = ["$signed({0})".format(row) for row in rows]
    lines.append("  wire signed [{0}:0] sum = {1};".format(work_width - 1, balanced_sum_expr(signed_rows)))
    lines.extend(
        [
            "  assign out = sum[{0}:0];".format(width - 1),
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


def render_booth_radix4_csa_cla(module, n):
    width = 2 * n
    lines = header(module, n)
    rows, work_width = append_booth_rows(lines, n, "bc")
    stage = 0
    while len(rows) > 2:
        next_rows = []
        for index in range(0, len(rows), 3):
            chunk = rows[index : index + 3]
            if len(chunk) == 3:
                s = "bc_s{0}_{1}".format(stage, index // 3)
                c = "bc_c{0}_{1}".format(stage, index // 3)
                x, y, z = chunk
                lines.append("  wire [{0}:0] {1} = {2} ^ {3} ^ {4};".format(work_width - 1, s, x, y, z))
                lines.append("  wire [{0}:0] {1} = (({2} & {3}) | ({2} & {4}) | ({3} & {4})) << 1;".format(work_width - 1, c, x, y, z))
                next_rows.extend([s, c])
            else:
                next_rows.extend(chunk)
        rows = next_rows
        stage += 1
    append_prefix_adder(lines, work_width, rows[0], rows[1], "booth_sum", "bc_cla")
    lines.extend(
        [
            "  assign out = booth_sum[{0}:0];".format(width - 1),
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


def render_split_half_signed(module, n):
    if n < 4:
        return None
    width = 2 * n
    lo = n // 2
    hi = n - lo
    lines = header(module, n)
    lines.extend(
        [
            "  wire [{0}:0] a0 = a[{0}:0];".format(lo - 1),
            "  wire [{0}:0] b0 = b[{0}:0];".format(lo - 1),
            "  wire signed [{0}:0] a1 = a[{1}:{2}];".format(hi - 1, n - 1, lo),
            "  wire signed [{0}:0] b1 = b[{1}:{2}];".format(hi - 1, n - 1, lo),
            "  wire [{0}:0] p00 = a0 * b0;".format(2 * lo - 1),
            "  wire signed [{0}:0] p01 = $signed({{1'b0, a0}}) * b1;".format(lo + hi),
            "  wire signed [{0}:0] p10 = a1 * $signed({{1'b0, b0}});".format(lo + hi),
            "  wire signed [{0}:0] p11 = a1 * b1;".format(2 * hi - 1),
            "  wire signed [{0}:0] t00 = {{{1}'b0, p00}};".format(width - 1, width - 2 * lo),
            "  wire signed [{0}:0] t01 = $signed(p01) <<< {1};".format(width - 1, lo),
            "  wire signed [{0}:0] t10 = $signed(p10) <<< {1};".format(width - 1, lo),
            "  wire signed [{0}:0] t11 = $signed(p11) <<< {1};".format(width - 1, 2 * lo),
            "  assign out = t00 + t01 + t10 + t11;",
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


def render_karatsuba_split_signed(module, n):
    if n < 5:
        return None
    width = 2 * n
    lo = n // 2
    hi = n - lo
    sum_width = max(hi, lo) + 2
    lines = header(module, n)
    lines.extend(
        [
            "  wire [{0}:0] a0 = a[{0}:0];".format(lo - 1),
            "  wire [{0}:0] b0 = b[{0}:0];".format(lo - 1),
            "  wire signed [{0}:0] a1 = a[{1}:{2}];".format(hi - 1, n - 1, lo),
            "  wire signed [{0}:0] b1 = b[{1}:{2}];".format(hi - 1, n - 1, lo),
            "  wire signed [{0}:0] a0_s = {{1'b0, a0}};".format(lo),
            "  wire signed [{0}:0] b0_s = {{1'b0, b0}};".format(lo),
            "  wire signed [{0}:0] a_sum = $signed(a0_s) + $signed(a1);".format(sum_width - 1),
            "  wire signed [{0}:0] b_sum = $signed(b0_s) + $signed(b1);".format(sum_width - 1),
            "  wire signed [{0}:0] p00 = a0_s * b0_s;".format(2 * lo + 1),
            "  wire signed [{0}:0] p11 = a1 * b1;".format(2 * hi - 1),
            "  wire signed [{0}:0] psum = a_sum * b_sum;".format(2 * sum_width - 1),
            "  wire signed [{0}:0] cross = $signed(psum) - $signed(p00) - $signed(p11);".format(2 * sum_width),
            "  wire signed [{0}:0] t00 = $signed(p00);".format(width - 1),
            "  wire signed [{0}:0] tcross = $signed(cross) <<< {1};".format(width - 1, lo),
            "  wire signed [{0}:0] t11 = $signed(p11) <<< {1};".format(width - 1, 2 * lo),
            "  assign out = t00 + tcross + t11;",
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


def render_split_half_abs(module, n):
    if n < 4:
        return None
    width = 2 * n
    lo = n // 2
    hi = n - lo
    lines = header(module, n)
    append_abs_wires(lines, n)
    lines.extend(
        [
            "  wire [{0}:0] a0 = a_abs[{0}:0];".format(lo - 1),
            "  wire [{0}:0] b0 = b_abs[{0}:0];".format(lo - 1),
            "  wire [{0}:0] a1 = a_abs[{1}:{2}];".format(hi - 1, n - 1, lo),
            "  wire [{0}:0] b1 = b_abs[{1}:{2}];".format(hi - 1, n - 1, lo),
            "  wire [{0}:0] p00 = a0 * b0;".format(2 * lo - 1),
            "  wire [{0}:0] p01 = a0 * b1;".format(lo + hi - 1),
            "  wire [{0}:0] p10 = a1 * b0;".format(lo + hi - 1),
            "  wire [{0}:0] p11 = a1 * b1;".format(2 * hi - 1),
            "  wire [{0}:0] mag_product = {{{1}'b0, p00}} + ({{{2}'b0, p01}} << {3}) + ({{{2}'b0, p10}} << {3}) + ({{{4}'b0, p11}} << {5});".format(
                width - 1,
                width - 2 * lo,
                width - (lo + hi),
                lo,
                width - 2 * hi,
                2 * lo,
            ),
            "  assign out = out_neg ? ((~mag_product) + {0}) : mag_product;".format(const(width, 1)),
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


def render_case_small_signed(module, n):
    if n > 5:
        return None
    width = 2 * n
    mask = (1 << n) - 1
    out_mask = (1 << width) - 1
    lines = header(module, n)
    lines.extend(
        [
            "  reg [{0}:0] out_r;".format(width - 1),
            "  always @* begin",
            "    case (in)",
        ]
    )
    for index in range(1 << width):
        a = signed_value(index & mask, n)
        b = signed_value((index >> n) & mask, n)
        value = (a * b) & out_mask
        lines.append("      {0}'d{1}: out_r = {2};".format(width, index, const(width, value)))
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


def const_signed_mul_expr(width, value, a_name):
    if value == 0:
        return "{0}'sd0".format(width)
    neg = value < 0
    mag = -value if neg else value
    terms = []
    for bit in range(mag.bit_length()):
        if mag & (1 << bit):
            term = "$signed({0})".format(a_name)
            if bit:
                term = "({0} <<< {1})".format(term, bit)
            terms.append(term)
    if not terms:
        expr = "{0}'sd0".format(width)
    elif len(terms) == 1:
        expr = terms[0]
    else:
        expr = "(" + " + ".join(terms) + ")"
    if neg:
        expr = "-({0})".format(expr)
    return expr


def render_case_b_signed_const(module, n):
    if n > 6:
        return None
    width = 2 * n
    lines = header(module, n)
    lines.extend(
        [
            "  wire signed [{0}:0] a_s = {{{{{1}{{sa}}}}, a}};".format(width - 1, width - n),
            "  reg signed [{0}:0] out_r;".format(width - 1),
            "  always @* begin",
            "    case (b)",
        ]
    )
    for raw_b in range(1 << n):
        b_val = signed_value(raw_b, n)
        lines.append("      {0}'d{1}: out_r = {2};".format(n, raw_b, const_signed_mul_expr(width, b_val, "a_s")))
    lines.extend(
        [
            "      default: out_r = {0}'sd0;".format(width),
            "    endcase",
            "  end",
            "  assign out = out_r;",
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


def anf_coefficients(values):
    coeffs = list(values)
    size = len(coeffs)
    bit = 1
    while bit < size:
        for mask in range(size):
            if mask & bit:
                coeffs[mask] ^= coeffs[mask ^ bit]
        bit <<= 1
    return coeffs


def product_bit_values(n, out_bit):
    width = 2 * n
    mask = (1 << n) - 1
    out = []
    for index in range(1 << width):
        a = signed_value(index & mask, n)
        b = signed_value((index >> n) & mask, n)
        value = (a * b) & ((1 << width) - 1)
        out.append((value >> out_bit) & 1)
    return out


def anf_expr_from_coeffs(coeffs, width):
    terms = []
    for mask, coeff in enumerate(coeffs):
        if not coeff:
            continue
        if mask == 0:
            terms.append("1'b1")
            continue
        factors = ["in[{0}]".format(bit) for bit in range(width) if mask & (1 << bit)]
        if len(factors) == 1:
            terms.append(factors[0])
        else:
            terms.append("(" + " & ".join(factors) + ")")
    if not terms:
        return "1'b0"
    return " ^ ".join(terms)


def render_anf_product_bits(module, n):
    if n > 5:
        return None
    width = 2 * n
    lines = [
        "module {0}(in, out);".format(module),
        "  input [{0}:0] in;".format(width - 1),
        "  output [{0}:0] out;".format(width - 1),
    ]
    for bit in range(width):
        coeffs = anf_coefficients(product_bit_values(n, bit))
        lines.append("  assign out[{0}] = {1};".format(bit, anf_expr_from_coeffs(coeffs, width)))
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


RENDERERS = {
    "direct_signed": render_direct_signed,
    "wide_signed": render_wide_signed,
    "abs_sign_direct": render_abs_sign_direct,
    "abs_sign_wallace": render_abs_sign_wallace,
    "signcorr_core_mul": render_signcorr_core_mul,
    "signcorr_core_wallace": render_signcorr_core_wallace,
    "signcase_core_mul": render_signcase_core_mul,
    "signcase_core_wallace": render_signcase_core_wallace,
    "signed_correction_direct": render_signed_correction_direct,
    "signed_correction_wallace": render_signed_correction_wallace,
    "signed_correction_csa_cla": render_signed_correction_csa_cla,
    "baugh_wooley_wallace": render_baugh_wooley_wallace,
    "baugh_wooley_wallace_rev": render_baugh_wooley_wallace_rev,
    "baugh_wooley_wallace_outside": render_baugh_wooley_wallace_outside,
    "baugh_wooley_wallace_plus": render_baugh_wooley_wallace_plus,
    "baugh_wooley_wallace_rev_hcla4": render_baugh_wooley_wallace_rev_hcla4,
    "baugh_wooley_wallace_rev_hcla3": render_baugh_wooley_wallace_rev_hcla3,
    "baugh_wooley_wallace_rev_hcla5": render_baugh_wooley_wallace_rev_hcla5,
    "baugh_wooley_wallace_rev_hcla2": render_baugh_wooley_wallace_rev_hcla2,
    "baugh_wooley_wallace_rev_hcla6": render_baugh_wooley_wallace_rev_hcla6,
    "baugh_wooley_wallace_rev_hcla1": lambda module, n: render_baugh_wooley_wallace_generic(module, n, "reverse", "hcla1"),
    "baugh_wooley_wallace_rev_hcla7": lambda module, n: render_baugh_wooley_wallace_generic(module, n, "reverse", "hcla7"),
    "baugh_wooley_wallace_rev_hcla8": lambda module, n: render_baugh_wooley_wallace_generic(module, n, "reverse", "hcla8"),
    "baugh_wooley_wallace_outside_hcla4": render_baugh_wooley_wallace_outside_hcla4,
    "baugh_wooley_wallace_outside_hcla3": render_baugh_wooley_wallace_outside_hcla3,
    "baugh_wooley_wallace_outside_hcla5": render_baugh_wooley_wallace_outside_hcla5,
    "baugh_wooley_wallace_outside_hcla2": render_baugh_wooley_wallace_outside_hcla2,
    "baugh_wooley_wallace_outside_hcla6": render_baugh_wooley_wallace_outside_hcla6,
    "baugh_wooley_wallace_outside_hcla1": lambda module, n: render_baugh_wooley_wallace_generic(module, n, "outside", "hcla1"),
    "baugh_wooley_wallace_outside_hcla7": lambda module, n: render_baugh_wooley_wallace_generic(module, n, "outside", "hcla7"),
    "baugh_wooley_wallace_outside_hcla8": lambda module, n: render_baugh_wooley_wallace_generic(module, n, "outside", "hcla8"),
    "baugh_wooley_wallace_rev_rhcla4": render_baugh_wooley_wallace_rev_rhcla4,
    "baugh_wooley_wallace_rev_rhcla3": render_baugh_wooley_wallace_rev_rhcla3,
    "baugh_wooley_wallace_rev_rhcla5": render_baugh_wooley_wallace_rev_rhcla5,
    "baugh_wooley_wallace_rev_rhcla2": render_baugh_wooley_wallace_rev_rhcla2,
    "baugh_wooley_wallace_rev_rhcla6": render_baugh_wooley_wallace_rev_rhcla6,
    "baugh_wooley_wallace_rev_rhcla1": lambda module, n: render_baugh_wooley_wallace_generic(module, n, "reverse", "rhcla1"),
    "baugh_wooley_wallace_rev_rhcla7": lambda module, n: render_baugh_wooley_wallace_generic(module, n, "reverse", "rhcla7"),
    "baugh_wooley_wallace_rev_rhcla8": lambda module, n: render_baugh_wooley_wallace_generic(module, n, "reverse", "rhcla8"),
    "baugh_wooley_wallace_outside_rhcla3": render_baugh_wooley_wallace_outside_rhcla3,
    "baugh_wooley_wallace_outside_rhcla4": render_baugh_wooley_wallace_outside_rhcla4,
    "baugh_wooley_wallace_outside_rhcla5": render_baugh_wooley_wallace_outside_rhcla5,
    "baugh_wooley_wallace_outside_rhcla2": render_baugh_wooley_wallace_outside_rhcla2,
    "baugh_wooley_wallace_outside_rhcla6": render_baugh_wooley_wallace_outside_rhcla6,
    "baugh_wooley_wallace_outside_rhcla1": lambda module, n: render_baugh_wooley_wallace_generic(module, n, "outside", "rhcla1"),
    "baugh_wooley_wallace_outside_rhcla7": lambda module, n: render_baugh_wooley_wallace_generic(module, n, "outside", "rhcla7"),
    "baugh_wooley_wallace_outside_rhcla8": lambda module, n: render_baugh_wooley_wallace_generic(module, n, "outside", "rhcla8"),
    "baugh_wooley_wallace_rev_pfx6": render_baugh_wooley_wallace_rev_pfx6,
    "baugh_wooley_wallace_rev_pfx1": lambda module, n: render_baugh_wooley_wallace_generic(module, n, "reverse", "pfx1"),
    "baugh_wooley_wallace_rev_pfx2": lambda module, n: render_baugh_wooley_wallace_generic(module, n, "reverse", "pfx2"),
    "baugh_wooley_wallace_rev_pfx3": lambda module, n: render_baugh_wooley_wallace_generic(module, n, "reverse", "pfx3"),
    "baugh_wooley_wallace_rev_pfx4": lambda module, n: render_baugh_wooley_wallace_generic(module, n, "reverse", "pfx4"),
    "baugh_wooley_wallace_outside_pfx6": render_baugh_wooley_wallace_outside_pfx6,
    "baugh_wooley_wallace_outside_pfx1": lambda module, n: render_baugh_wooley_wallace_generic(module, n, "outside", "pfx1"),
    "baugh_wooley_wallace_outside_pfx2": lambda module, n: render_baugh_wooley_wallace_generic(module, n, "outside", "pfx2"),
    "baugh_wooley_wallace_outside_pfx3": lambda module, n: render_baugh_wooley_wallace_generic(module, n, "outside", "pfx3"),
    "baugh_wooley_wallace_outside_pfx4": lambda module, n: render_baugh_wooley_wallace_generic(module, n, "outside", "pfx4"),
    "baugh_wooley_wallace_corrfirst_hcla4": lambda module, n: render_baugh_wooley_wallace_generic(module, n, "corrfirst", "hcla4"),
    "baugh_wooley_wallace_corrlast_hcla4": lambda module, n: render_baugh_wooley_wallace_generic(module, n, "corrlast", "hcla4"),
    "baugh_wooley_wallace_signfirst_hcla4": lambda module, n: render_baugh_wooley_wallace_generic(module, n, "signfirst", "hcla4"),
    "baugh_wooley_wallace_signlast_hcla4": lambda module, n: render_baugh_wooley_wallace_generic(module, n, "signlast", "hcla4"),
    "baugh_wooley_wallace_corrzip_hcla4": lambda module, n: render_baugh_wooley_wallace_generic(module, n, "corrzip", "hcla4"),
    "baugh_wooley_wallace_corrfirst_hcla1": lambda module, n: render_baugh_wooley_wallace_generic(module, n, "corrfirst", "hcla1"),
    "baugh_wooley_wallace_corrlast_hcla1": lambda module, n: render_baugh_wooley_wallace_generic(module, n, "corrlast", "hcla1"),
    "baugh_wooley_wallace_signfirst_hcla1": lambda module, n: render_baugh_wooley_wallace_generic(module, n, "signfirst", "hcla1"),
    "baugh_wooley_wallace_signlast_hcla1": lambda module, n: render_baugh_wooley_wallace_generic(module, n, "signlast", "hcla1"),
    "baugh_wooley_wallace_corrzip_hcla1": lambda module, n: render_baugh_wooley_wallace_generic(module, n, "corrzip", "hcla1"),
    "baugh_wooley_wallace_corrfirst_rhcla2": lambda module, n: render_baugh_wooley_wallace_generic(module, n, "corrfirst", "rhcla2"),
    "baugh_wooley_wallace_corrlast_rhcla2": lambda module, n: render_baugh_wooley_wallace_generic(module, n, "corrlast", "rhcla2"),
    "baugh_wooley_wallace_signfirst_rhcla2": lambda module, n: render_baugh_wooley_wallace_generic(module, n, "signfirst", "rhcla2"),
    "baugh_wooley_wallace_signlast_rhcla2": lambda module, n: render_baugh_wooley_wallace_generic(module, n, "signlast", "rhcla2"),
    "baugh_wooley_wallace_corrzip_rhcla2": lambda module, n: render_baugh_wooley_wallace_generic(module, n, "corrzip", "rhcla2"),
    "baugh_wooley_wallace_rev_hcla3_mod": lambda module, n: render_baugh_wooley_wallace_mod_generic(module, n, "reverse", "hcla3"),
    "baugh_wooley_wallace_rev_hcla4_mod": lambda module, n: render_baugh_wooley_wallace_mod_generic(module, n, "reverse", "hcla4"),
    "baugh_wooley_wallace_rev_hcla5_mod": lambda module, n: render_baugh_wooley_wallace_mod_generic(module, n, "reverse", "hcla5"),
    "baugh_wooley_wallace_outside_hcla1_mod": lambda module, n: render_baugh_wooley_wallace_mod_generic(module, n, "outside", "hcla1"),
    "baugh_wooley_wallace_outside_hcla2_mod": lambda module, n: render_baugh_wooley_wallace_mod_generic(module, n, "outside", "hcla2"),
    "baugh_wooley_wallace_corrfirst_hcla4_mod": lambda module, n: render_baugh_wooley_wallace_mod_generic(module, n, "corrfirst", "hcla4"),
    "baugh_wooley_wallace_corrfirst_rhcla2_mod": lambda module, n: render_baugh_wooley_wallace_mod_generic(module, n, "corrfirst", "rhcla2"),
    "baugh_wooley_wallace_rev_hcla4_signbit": render_baugh_wooley_wallace_rev_hcla4_signbit,
    "baugh_wooley_wallace_outside_hcla1_signbit": render_baugh_wooley_wallace_outside_hcla1_signbit,
    "baugh_wooley_wallace_outside_hcla1_pfx_signbit": render_baugh_wooley_wallace_outside_hcla1_pfx_signbit,
    "baugh_wooley_wallace_rev_hcla6_signbit": render_baugh_wooley_wallace_rev_hcla6_signbit,
    "baugh_wooley_wallace4_rev_hcla4": render_baugh_wooley_wallace4_rev_hcla4,
    "baugh_wooley_wallace4_outside_hcla1": render_baugh_wooley_wallace4_outside_hcla1,
    "baugh_wooley_wallace4_outside_hcla2": render_baugh_wooley_wallace4_outside_hcla2,
    "baugh_wooley_wallace4_outside_rhcla2": render_baugh_wooley_wallace4_outside_rhcla2,
    "baugh_wooley_wallace_center_hcla4": render_baugh_wooley_wallace_center_hcla4,
    "baugh_wooley_wallace_center_rhcla3": render_baugh_wooley_wallace_center_rhcla3,
    "baugh_wooley_wallace_center_rhcla4": render_baugh_wooley_wallace_center_rhcla4,
    "baugh_wooley_wallace_evenodd_hcla4": render_baugh_wooley_wallace_evenodd_hcla4,
    "baugh_wooley_wallace_evenodd_rhcla4": render_baugh_wooley_wallace_evenodd_rhcla4,
    "baugh_wooley_dadda": render_baugh_wooley_dadda,
    "baugh_wooley_dadda_plus": render_baugh_wooley_dadda_plus,
    "baugh_wooley_dadda_hcla4": render_baugh_wooley_dadda_hcla4,
    "baugh_wooley_dadda_pfx6": render_baugh_wooley_dadda_pfx6,
    "baugh_wooley_wallace_signbit": render_baugh_wooley_wallace_signbit,
    "baugh_wooley_wallace_rev_signbit": render_baugh_wooley_wallace_rev_signbit,
    "baugh_wooley_wallace_hcla2": render_baugh_wooley_wallace_hcla2,
    "baugh_wooley_wallace_hcla3": render_baugh_wooley_wallace_hcla3,
    "baugh_wooley_wallace_hcla4": render_baugh_wooley_wallace_hcla4,
    "baugh_wooley_wallace_hcla5": render_baugh_wooley_wallace_hcla5,
    "baugh_wooley_wallace_hcla6": render_baugh_wooley_wallace_hcla6,
    "baugh_wooley_wallace_hcla8": render_baugh_wooley_wallace_hcla8,
    "baugh_wooley_wallace_rhcla3": render_baugh_wooley_wallace_rhcla3,
    "baugh_wooley_wallace_rhcla4": render_baugh_wooley_wallace_rhcla4,
    "baugh_wooley_wallace_rhcla5": render_baugh_wooley_wallace_rhcla5,
    "baugh_wooley_wallace_rpfx6": render_baugh_wooley_wallace_rpfx6,
    "baugh_wooley_wallace_pfx3": render_baugh_wooley_wallace_pfx3,
    "baugh_wooley_wallace_pfx4": render_baugh_wooley_wallace_pfx4,
    "baugh_wooley_wallace_pfx5": render_baugh_wooley_wallace_pfx5,
    "baugh_wooley_wallace_pfx6": render_baugh_wooley_wallace_pfx6,
    "baugh_wooley_wallace_pfx8": render_baugh_wooley_wallace_pfx8,
    "baugh_wooley_wallace_csel2": render_baugh_wooley_wallace_csel2,
    "baugh_wooley_wallace_csel3": render_baugh_wooley_wallace_csel3,
    "baugh_wooley_wallace_csel4": render_baugh_wooley_wallace_csel4,
    "baugh_wooley_column_arith": render_baugh_wooley_column_arith,
    "baugh_wooley_column_min_sop": render_baugh_wooley_column_min_sop,
    "baugh_wooley_rows_plus": render_baugh_wooley_rows_plus,
    "baugh_wooley_rows_cla": render_baugh_wooley_rows_cla,
    "baugh_wooley_rows_hcla4": render_baugh_wooley_rows_hcla4,
    "booth_radix4_signed": render_booth_radix4_signed,
    "booth_radix4_balanced": render_booth_radix4_balanced,
    "booth_radix4_csa_cla": render_booth_radix4_csa_cla,
    "split_half_signed": render_split_half_signed,
    "karatsuba_split_signed": render_karatsuba_split_signed,
    "split_half_abs": render_split_half_abs,
    "case_small_signed": render_case_small_signed,
    "case_b_signed_const": render_case_b_signed_const,
    "ex260_shared_bdd_nat": render_ex260_shared_bdd_nat,
    "ex260_shared_bdd_interleave": render_ex260_shared_bdd_interleave,
    "ex260_shared_bdd_signfirst": render_ex260_shared_bdd_signfirst,
    "ex260_shared_bdd_signlast": render_ex260_shared_bdd_signlast,
    "ex260_shared_bdd_outside": render_ex260_shared_bdd_outside,
    "ex260_bw_rev_handmerge": render_ex260_bw_rev_handmerge,
    "ex260_qmc_bits": render_ex260_qmc_bits,
    "ex260_rev_hcla4_qmc_hi1": render_ex260_rev_hcla4_qmc_hi1,
    "ex260_rev_hcla4_qmc_hi2": render_ex260_rev_hcla4_qmc_hi2,
    "ex260_rev_hcla4_qmc_hi3": render_ex260_rev_hcla4_qmc_hi3,
    "ex260_rev_hcla4_qmc_hi4": render_ex260_rev_hcla4_qmc_hi4,
    "anf_product_bits": render_anf_product_bits,
}


FLOW_SCRIPTS = dict(base.FLOW_SCRIPTS)
FLOW_SCRIPTS.update(
    {
        "synth_preset_d9": lambda v, m, o: base.script_synth_preset(v, m, o, 9),
        "synth_preset_d11": lambda v, m, o: base.script_synth_preset(v, m, o, 11),
        "synth_preset_d13": lambda v, m, o: base.script_synth_preset(v, m, o, 13),
        "synth_preset_d15": lambda v, m, o: base.script_synth_preset(v, m, o, 15),
        "abc_g_aig_d9": lambda v, m, o: base.script_default(v, m, o, "aig -D 9"),
        "abc_g_aig_d11": lambda v, m, o: base.script_default(v, m, o, "aig -D 11"),
        "abc_g_aig_d13": lambda v, m, o: base.script_default(v, m, o, "aig -D 13"),
        "abc_g_aig_d15": lambda v, m, o: base.script_default(v, m, o, "aig -D 15"),
    }
)


def empty_row(case, candidate_id, source_variant, flow, verilog_path, aig_path, semantic_ok, semantic_note, refs):
    n = CASE_PART_WIDTH[case]
    return {
        "case": case,
        "candidate_id": candidate_id,
        "hypothesis": "signed low{0}_high{0}:a*b".format(n),
        "variant": "{0}+{1}".format(source_variant, flow),
        "verilog_path": rel(verilog_path),
        "aig_path": rel(aig_path),
        "verified_truth": "1" if semantic_ok else "0",
        "synthesized": "0",
        "equivalent": "0",
        "area": "",
        "delay": "",
        "adp": "",
        "reference_adp": str(refs.get(case, "")),
        "adp_ratio_to_reference": "",
        "within_1p5_reference": "",
        "beats_reference": "",
        "runtime_sec": "0.000",
        "classification": "semantic_signed_mul_exact" if semantic_ok else "semantic_check_failed",
        "notes": semantic_note,
    }


def add_reference(row, refs):
    ref = refs.get(row["case"])
    if not ref or not row.get("adp"):
        return
    adp = int(row["adp"])
    ratio = adp / ref
    row["reference_adp"] = str(ref)
    row["adp_ratio_to_reference"] = "{0:.6f}".format(ratio)
    row["within_1p5_reference"] = "1" if ratio <= 1.5 else "0"
    row["beats_reference"] = "1" if adp < ref else "0"


def run_case(args, case, source_variants, flow_variants, refs):
    table = TruthTable(args.benchmarks / "{0}.truth".format(case))
    semantic_ok, semantic_note = verify_semantics(case, table)
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
        module = "{0}_smul_{1}".format(case, source_variant)
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
            row = empty_row(case, candidate_id, source_variant, flow, verilog_path, aig_path, semantic_ok, semantic_note, refs)
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
                        notes="{0}; source={1}; flow={2}".format(semantic_note, source_variant, flow),
                        timeout=args.timeout,
                    )
                    row["equivalent"] = "1" if evaluated.equivalent else "0"
                    if evaluated.area is not None:
                        row["area"] = str(evaluated.area)
                        row["delay"] = str(evaluated.delay)
                        row["adp"] = str(evaluated.adp)
                        add_reference(row, refs)
                    row["notes"] = evaluated.notes
                except (SynthError, RuntimeError, OSError, subprocess.TimeoutExpired) as exc:
                    row["notes"] = "{0}: {1}".format(type(exc).__name__, exc)[:1000]
            row["runtime_sec"] = "{0:.3f}".format(time.time() - start)
            rows.append(row)
            manifest["candidates"].append(row)
    write_text(args.work_dir / case / "manifest.json", json.dumps(manifest, indent=2, sort_keys=True) + "\n")
    return rows


def best_rows(rows):
    best = []
    grouped = {}
    for row in rows:
        grouped.setdefault(row["case"], []).append(row)
    for case in sorted(grouped):
        valid = [row for row in grouped[case] if row.get("equivalent") == "1" and row.get("adp")]
        if not valid:
            continue
        valid.sort(key=lambda item: (int(item["adp"]), int(item["delay"]), int(item["area"]), item["candidate_id"]))
        best.append({name: valid[0].get(name, "") for name in BEST_FIELDNAMES})
    return best


def summary_rows(best, refs):
    rows = []
    for row in best:
        ref = refs.get(row["case"])
        adp = int(row["adp"])
        rows.append(
            {
                "case": row["case"],
                "best_area": row["area"],
                "best_delay": row["delay"],
                "best_adp": row["adp"],
                "reference_adp": "" if ref is None else str(ref),
                "ratio_to_reference": "" if ref is None else "{0:.6f}".format(adp / ref),
                "within_1p5_reference": "" if ref is None else ("1" if adp / ref <= 1.5 else "0"),
                "beats_reference": "" if ref is None else ("1" if adp < ref else "0"),
                "candidate_id": row["candidate_id"],
                "notes": row["notes"],
            }
        )
    return rows


def write_manifest(args, rows, best):
    lines = [
        "# {0}".format(args.run_id),
        "",
        "Run ID: `{0}`".format(args.run_id),
        "",
        "Purpose: deep frontend-only signed multiplier seeds for `ex260-ex264`.",
        "",
        "Inputs:",
        "- Truth files: `benchmarks/ex260.truth` through `benchmarks/ex264.truth`",
        "- Existing baseline: `student/runs/integer/ex255_ex279_current/results/candidates.csv`",
        "- Generator/script: `student/generators/integer_ex260_ex264_signed_mul_frontend.py`",
        "",
        "Artifacts:",
        "- Work directory: `{0}`".format(rel(args.work_dir)),
        "- Candidates CSV: `{0}`".format(rel(args.results_dir / "candidates.csv")),
        "- Best CSV: `{0}`".format(rel(args.results_dir / "best.csv")),
        "- Summary CSV: `{0}`".format(rel(args.results_dir / "summary.csv")),
        "",
        "Methods tried:",
        "- Direct signed multiply, sign/magnitude multiply, signed unsigned-product correction, Wallace/CSA unsigned core plus sign correction, radix-4 Booth, and split-half signed decomposition where applicable.",
        "- Limited Yosys frontend synth scripts including `abc -g aig`, `wreduce`, arithmetic sharing, and target-delay synth presets.",
        "",
        "Best result:",
        "- See `results/best.csv` for one row per case.",
        "",
        "Notes:",
        "- Every retained AIG row is checked with ABC CEC against `read_truth -xf` through `evaluate_aig`.",
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
    parser.add_argument("--run-id", default="ex260_ex264_frontend_smul_struct_20260609_0218")
    parser.add_argument("--cases", default=",".join(CASES))
    parser.add_argument("--sources", default="all")
    parser.add_argument("--flows", default="abc_g_aig,wreduce_abc_g_aig,arith_wreduce_aig,synth_preset_d13,synth_preset_d18")
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
    flows = parse_list(args.flows, tuple(FLOW_SCRIPTS.keys()))
    if args.work_dir is None:
        args.work_dir = ROOT / "student" / "work" / args.run_id
    if args.runs_dir is None:
        args.runs_dir = ROOT / "student" / "runs" / "integer" / args.run_id
    args.results_dir = args.runs_dir / "results"
    refs = load_reference(ROOT / "reference_result.csv")

    all_rows = []
    for case in cases:
        rows = run_case(args, case, sources, flows, refs)
        all_rows.extend(rows)
        case_best = best_rows(rows)
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

    best = best_rows(all_rows)
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
        summary_rows(best, refs),
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
