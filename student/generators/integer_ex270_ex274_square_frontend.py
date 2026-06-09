#!/usr/bin/env python3
"""Frontend-only square structures for ex270-ex274.

These cases are exact unsigned integer square, not two-operand multiplication.
The source variants therefore build only triangular square partial products:
diagonal bits x_i and one shared cross term for each i<j, shifted by one more
column to account for the factor of two.
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
from student.generators.unknown_bdd_search import SharedBddBuilder, edge_expr, permute_plane


CASES = ("ex270", "ex271", "ex272", "ex273", "ex274")

RESULT_FIELDNAMES = base.RESULT_FIELDNAMES
BEST_FIELDNAMES = base.BEST_FIELDNAMES

SOURCE_VARIANTS = (
    "direct_square",
    "direct_square_wide",
    "triangular_balanced",
    "triangular_left_assoc",
    "triangular_rows_csa",
    "wallace_square",
    "wallace_square_rev",
    "wallace_square_outside",
    "wallace_square_hcla2",
    "wallace_square_hcla4",
    "wallace_square_hcla6",
    "wallace_square_hcla8",
    "wallace_square_hcla10",
    "wallace_square_rev_hcla4",
    "wallace_square_rev_hcla6",
    "wallace_square_outside_hcla4",
    "wallace_square_outside_hcla6",
    "wallace_square_outside_csel2",
    "wallace_square_outside_csel3",
    "wallace_square_outside_csel4",
    "wallace_square_outside_csel5",
    "wallace_square_outside_csel6",
    "wallace_square_outside_csel8",
    "wallace_square_outside_csel10",
    "wallace_square_outside_csel12",
    "wallace_square_outside_csel14",
    "wallace_square_outside_csel16",
    "wallace_square_csel6",
    "wallace_square_csel8",
    "wallace_square_rev_csel6",
    "wallace_square_rev_csel8",
    "wallace_square_center_csel6",
    "wallace_square_center_csel8",
    "wallace_square_evenodd_csel6",
    "wallace_square_evenodd_csel8",
    "wallace_square_counter4_csel4",
    "wallace_square_counter4_csel6",
    "wallace_square_counter4_csel8",
    "wallace_square_factored_csel6",
    "wallace_square_factored_csel8",
    "wallace_square_counter4x_csel4",
    "wallace_square_counter4x_csel6",
    "wallace_square_counter4x_csel8",
    "booth_radix4_balanced",
    "booth_radix4_csa_csel4",
    "booth_radix4_csa_csel6",
    "booth_radix4_csa_csel8",
    "booth_radix4_csa_hcla4",
    "msb_split_wallace_csel6",
    "msb_split_wallace_csel8",
    "msb_split_wallace_hcla4",
    "dadda_square",
    "dadda_square_hcla4",
    "dadda_square_hcla6",
    "dadda_square_hcla8",
    "dadda_square_csel4",
    "dadda_square_csel6",
    "low_high_split",
    "low_high_split_hcla",
    "karatsuba_square",
    "low4_case_high_direct",
    "low5_case_high_direct",
    "low4_case_constmul",
    "low5_case_constmul",
    "low6_case_constmul",
    "high3_case_lowsq",
    "high4_case_lowsq",
    "high5_case_lowsq",
    "high6_case_lowsq",
    "hybrid_bddtop1",
    "hybrid_bddtop2",
    "hybrid_bddtop3",
    "hybrid_bddtop4",
    "hybrid_bddtop5",
    "hybrid_bddtop6",
    "hybrid_bddtop8",
    "hybrid_bddtop10",
    "hybrid_bddtop2_hcla0",
    "hybrid_bddtop2_hcla4",
    "hybrid_bddtop2_hcla8",
    "hybrid_bddtop3_hcla4",
    "hybrid_bddtop4_hcla4",
    "hybrid_bddtop4_hcla8",
    "hybrid_bddtop4_order_nat",
    "hybrid_bddtop4_order_outside",
    "hybrid_bddtop4_order_center",
    "hybrid_bddtop5_order_nat",
    "hybrid_bddtop5_order_outside",
    "hybrid_bddtop5_order_center",
    "hybrid_bddtop2_perbit",
    "hybrid_bddtop3_perbit",
    "hybrid_bddtop4_perbit",
    "hybrid_bddtop2_trunc",
    "hybrid_bddtop3_trunc",
    "hybrid_bddtop4_trunc",
    "hybrid_bddtop2_trunc_factored",
    "hybrid_bddtop3_trunc_factored",
    "hybrid_bddtop4_trunc_factored",
    "hybrid_bddtop2_trunc_hcla0",
    "hybrid_bddtop2_trunc_hcla4",
    "hybrid_bddtop2_trunc_hcla8",
    "hybrid_bddtop2_trunc_order_nat",
    "hybrid_bddtop2_trunc_order_outside",
    "hybrid_bddtop2_trunc_order_center",
    "hybrid_bddtop3_trunc_hcla0",
    "hybrid_bddtop3_trunc_hcla4",
    "hybrid_bddtop3_trunc_hcla8",
    "hybrid_bddtop3_trunc_order_nat",
    "hybrid_bddtop3_trunc_order_outside",
    "hybrid_bddtop3_trunc_order_center",
    "hybrid_bddtop4_trunc_hcla0",
    "hybrid_bddtop4_trunc_hcla4",
    "hybrid_bddtop4_trunc_hcla8",
    "hybrid_bddtop4_trunc_order_nat",
    "hybrid_bddtop4_trunc_order_outside",
    "hybrid_bddtop4_trunc_order_center",
    "hybrid_bddtop2_cmp1_trunc",
    "hybrid_bddtop2_cmp2_trunc",
    "hybrid_bddtop3_cmp1_trunc",
    "hybrid_bddtop4_cmp1_trunc",
    "hybrid_bddtop4_cmp2_trunc",
    "hybrid_bddtop2_colcsel4",
    "hybrid_bddtop2_colcsel5",
    "hybrid_bddtop2_colcsel6",
    "hybrid_bddtop3_colcsel4",
    "hybrid_bddtop3_colcsel5",
    "hybrid_bddtop3_colcsel6",
    "hybrid_bddtop4_colcsel4",
    "hybrid_bddtop4_colcsel5",
    "hybrid_bddtop4_colcsel6",
    "hybrid_cmptop1_trunc",
    "hybrid_cmptop2_trunc",
    "hybrid_cmptop3_trunc",
    "hybrid_cmptop4_trunc",
    "hybrid_cmptop5_trunc",
    "hybrid_cmptop6_trunc",
    "hybrid_rangetop2_trunc",
    "hybrid_rangetop3_trunc",
    "hybrid_rangetop4_trunc",
    "hybrid_rangetop5_trunc",
    "hybrid_bddtop2_trunc_csel5",
    "hybrid_bddtop2_trunc_csel7",
    "hybrid_bddtop2_trunc_csel8",
    "hybrid_bddtop2_trunc_csel2",
    "hybrid_bddtop2_trunc_csel3",
    "hybrid_bddtop2_trunc_csel4",
    "hybrid_bddtop2_trunc_csel10",
    "hybrid_bddtop2_trunc_csel12",
    "hybrid_bddtop3_trunc_csel5",
    "hybrid_bddtop3_trunc_csel7",
    "hybrid_bddtop3_trunc_csel8",
    "hybrid_bddtop3_trunc_csel2",
    "hybrid_bddtop3_trunc_csel3",
    "hybrid_bddtop3_trunc_csel4",
    "hybrid_bddtop3_trunc_csel10",
    "hybrid_bddtop3_trunc_csel12",
    "hybrid_bddtop4_trunc_csel5",
    "hybrid_bddtop4_trunc_csel7",
    "hybrid_bddtop4_trunc_csel8",
    "hybrid_bddtop4_trunc_csel2",
    "hybrid_bddtop4_trunc_csel3",
    "hybrid_bddtop4_trunc_csel4",
    "hybrid_bddtop4_trunc_csel10",
    "hybrid_bddtop4_trunc_csel12",
    "hybrid_bddtop2_csel4",
    "hybrid_bddtop2_csel5",
    "hybrid_bddtop2_csel8",
    "hybrid_bddtop3_csel4",
    "hybrid_bddtop3_csel5",
    "hybrid_bddtop3_csel8",
    "hybrid_bddtop4_csel4",
    "hybrid_bddtop4_csel5",
    "hybrid_bddtop4_csel6",
    "hybrid_bddrel1",
    "hybrid_bddrel2",
    "hybrid_bddrel3",
    "hybrid_bddrel02",
    "hybrid_bddrel03",
    "hybrid_bddrel12",
    "hybrid_bddrel13",
    "hybrid_bddrel23",
    "hybrid_bddrel013",
    "hybrid_bddrel023",
    "hybrid_bddrel123",
    "block4_decomp_csel4",
    "block4_decomp_csel6",
    "block4_decomp_csel8",
    "column_count_case",
    "column_count_case_tight",
    "full_word_case_small",
)

FLOW_VARIANTS = (
    "default",
    "wreduce_default",
    "no_internal_abc",
    "wreduce_no_internal_abc",
    "abc_g_aig",
    "wreduce_abc_g_aig",
    "arith_wreduce_aig",
    "synth_preset",
    "synth_preset_and",
    "synth_preset_and_d12",
    "synth_preset_and_d16",
    "synth_preset_d12",
    "synth_preset_d14",
    "synth_preset_d16",
    "synth_preset_d20",
    "synth_preset_d24",
    "abc_g_aig_d12",
    "abc_g_aig_d14",
    "abc_g_aig_d16",
    "abc_g_aig_d20",
    "abc_g_aig_d24",
    "abc_lut3_to_aig",
    "abc_lut4_to_aig",
    "abc_lut5_to_aig",
    "booth_abc_g_aig",
    "booth_wreduce_abc_g_aig",
)


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


def case_width(case):
    return 2 * (int(case[2:]) - 266)


def header(module, n):
    width = 2 * n
    return [
        "module {0}(in, out);".format(module),
        "  input [{0}:0] in;".format(n - 1),
        "  output [{0}:0] out;".format(width - 1),
        "  wire [{0}:0] x = in;".format(n - 1),
    ]


def verify_semantics(case, table):
    n = case_width(case)
    width = 2 * n
    if table.input_width != n or table.output_width != width:
        return False, "unexpected widths input={0} output={1} expected={2}->{3}".format(
            table.input_width,
            table.output_width,
            n,
            width,
        )
    mask = (1 << width) - 1
    for index, expected in enumerate(table.iter_outputs()):
        actual = (index * index) & mask
        if actual != expected:
            return False, "mismatch index={0} expected=0x{1:x} actual=0x{2:x}".format(index, expected, actual)
    return True, "exact unsigned {0}-bit square x*x over {1} inputs".format(n, table.num_inputs)


def balanced_sum_expr(terms):
    current = list(terms)
    if not current:
        return ""
    while len(current) > 1:
        next_terms = []
        for index in range(0, len(current), 2):
            if index + 1 < len(current):
                next_terms.append("({0} + {1})".format(current[index], current[index + 1]))
            else:
                next_terms.append(current[index])
        current = next_terms
    return current[0]


def triangular_terms(n):
    width = 2 * n
    terms = []
    for i in range(n):
        terms.append("({{{0}'b0, x[{1}]}} << {2})".format(width - 1, i, 2 * i))
    for i in range(n):
        for j in range(i + 1, n):
            terms.append("({{{0}'b0, (x[{1}] & x[{2}])}} << {3})".format(width - 1, i, j, i + j + 1))
    return terms


def render_direct_square(module, n):
    lines = header(module, n)
    lines.extend(
        [
            "  assign out = x * x;",
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


def render_direct_square_wide(module, n):
    width = 2 * n
    lines = header(module, n)
    lines.extend(
        [
            "  wire [{0}:0] xw = {{{1}'b0, x}};".format(width - 1, width - n),
            "  assign out = xw * xw;",
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


def render_triangular_balanced(module, n):
    lines = header(module, n)
    lines.extend(
        [
            "  assign out = {0};".format(balanced_sum_expr(triangular_terms(n))),
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


def render_triangular_left_assoc(module, n):
    lines = header(module, n)
    lines.extend(
        [
            "  assign out = {0};".format(" + ".join(triangular_terms(n))),
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


def compressor_order(items, order):
    items = list(items)
    if order == "rev":
        return list(reversed(items))
    if order == "outside":
        out = []
        left = 0
        right = len(items) - 1
        take_left = True
        while left <= right:
            if take_left:
                out.append(items[left])
                left += 1
            else:
                out.append(items[right])
                right -= 1
            take_left = not take_left
        return out
    if order == "center":
        center = (len(items) - 1) / 2.0
        return sorted(items, key=lambda item: abs(items.index(item) - center))
    if order == "evenodd":
        return items[::2] + items[1::2]
    return items


def square_columns(lines, n):
    width = 2 * n
    columns = [[] for _ in range(width + 1)]
    for i in range(n):
        columns[2 * i].append("x[{0}]".format(i))
    for i in range(n):
        for j in range(i + 1, n):
            name = "pp_{0}_{1}".format(i, j)
            lines.append("  wire {0} = x[{1}] & x[{2}];".format(name, i, j))
            columns[i + j + 1].append(name)
    return columns


def carry_save_reduce(lines, columns, order="natural", dadda=False):
    width = len(columns)
    temp_id = 0
    if dadda:
        max_height = max(len(col) for col in columns)
        targets = [2]
        while targets[-1] < max_height:
            targets.append(int(targets[-1] * 3 // 2))
        targets = list(reversed(targets[:-1]))
    else:
        targets = None

    stage = 0
    while True:
        changed = False
        next_columns = [[] for _ in range(width + 1)]
        if dadda and targets:
            limit = targets.pop(0)
        else:
            limit = 2
        for col, items in enumerate(columns):
            work = compressor_order(items, order)
            while len(work) > limit:
                if len(work) >= 3:
                    a, b, c = work.pop(0), work.pop(0), work.pop(0)
                    s = "s_{0}_{1}".format(stage, temp_id)
                    cy = "c_{0}_{1}".format(stage, temp_id)
                    temp_id += 1
                    lines.append("  wire {0} = {1} ^ {2} ^ {3};".format(s, a, b, c))
                    lines.append("  wire {0} = ({1} & {2}) | ({1} & {3}) | ({2} & {3});".format(cy, a, b, c))
                    next_columns[col].append(s)
                    if col + 1 < len(next_columns):
                        next_columns[col + 1].append(cy)
                    changed = True
                else:
                    break
            next_columns[col].extend(work)
        if not changed:
            return columns
        columns = next_columns
        stage += 1
        if dadda and not targets:
            dadda = False


def vector_expr(name, columns, width, slot):
    bits = []
    for col in range(width):
        if col < len(columns) and len(columns[col]) > slot:
            bits.append(columns[col][slot])
        else:
            bits.append("1'b0")
    return "{{{0}}}".format(", ".join(reversed(bits)))


def append_prefix_adder(lines, out_name, a_name, b_name, width, start):
    lines.append("  wire [{0}:0] fa_a = {1};".format(width - 1, a_name))
    lines.append("  wire [{0}:0] fa_b = {1};".format(width - 1, b_name))
    lines.append("  wire [{0}:0] fa_p0 = fa_a ^ fa_b;".format(width - 1))
    lines.append("  wire [{0}:0] fa_g0 = fa_a & fa_b;".format(width - 1))
    lines.append("  wire [{0}:0] fa_sum;".format(width - 1))
    if start > 0:
        lines.append("  wire [{0}:0] fa_rc;".format(start))
        lines.append("  assign fa_rc[0] = 1'b0;")
        for bit in range(start):
            lines.append("  assign fa_sum[{0}] = fa_p0[{0}] ^ fa_rc[{0}];".format(bit))
            lines.append("  assign fa_rc[{0}] = fa_g0[{1}] | (fa_p0[{1}] & fa_rc[{1}]);".format(bit + 1, bit))
        cin = "fa_rc[{0}]".format(start)
    else:
        cin = "1'b0"
    if start >= width:
        lines.append("  assign {0} = fa_sum;".format(out_name))
        return
    seg = width - start
    lines.append("  wire [{0}:0] fa_p_s0 = fa_p0[{1}:{2}];".format(seg - 1, width - 1, start))
    lines.append("  wire [{0}:0] fa_g_s0 = fa_g0[{1}:{2}];".format(seg - 1, width - 1, start))
    prev_p = "fa_p_s0"
    prev_g = "fa_g_s0"
    dist = 1
    level = 1
    while dist < seg:
        p = "fa_p_s{0}".format(level)
        g = "fa_g_s{0}".format(level)
        lines.append("  wire [{0}:0] {1};".format(seg - 1, p))
        lines.append("  wire [{0}:0] {1};".format(seg - 1, g))
        for i in range(seg):
            if i < dist:
                lines.append("  assign {0}[{1}] = {2}[{1}];".format(p, i, prev_p))
                lines.append("  assign {0}[{1}] = {2}[{1}];".format(g, i, prev_g))
            else:
                lines.append(
                    "  assign {0}[{1}] = {2}[{1}] & {2}[{3}];".format(p, i, prev_p, i - dist)
                )
                lines.append(
                    "  assign {0}[{1}] = {2}[{1}] | ({2}[{3}] & {4}[{1}]);".format(
                        g,
                        i,
                        prev_g,
                        i - dist,
                        prev_p,
                    )
                )
        prev_p = p
        prev_g = g
        dist <<= 1
        level += 1
    for i in range(seg):
        bit = start + i
        if i == 0:
            carry = cin
        else:
            carry = "({0}[{1}] | ({2}[{1}] & {3}))".format(prev_g, i - 1, prev_p, cin)
        lines.append("  assign fa_sum[{0}] = fa_p0[{0}] ^ {1};".format(bit, carry))
    lines.append("  assign {0} = fa_sum;".format(out_name))


def append_carryselect_adder(lines, out_name, a_name, b_name, width, group_size):
    lines.append("  wire [{0}:0] cs_sum;".format(width - 1))
    carry_name = "1'b0"
    group = 0
    for start in range(0, width, group_size):
        end = min(width, start + group_size)
        size = end - start
        if start == 0:
            lines.append(
                "  wire [{0}:0] cs_g{1}_sum = {2}[{3}:{4}] + {5}[{3}:{4}];".format(
                    size,
                    group,
                    a_name,
                    end - 1,
                    start,
                    b_name,
                )
            )
            for bit in range(size):
                lines.append("  assign cs_sum[{0}] = cs_g{1}_sum[{2}];".format(start + bit, group, bit))
            carry_name = "cs_g{0}_sum[{1}]".format(group, size)
        else:
            lines.append(
                "  wire [{0}:0] cs_g{1}_sum0 = {2}[{3}:{4}] + {5}[{3}:{4}];".format(
                    size,
                    group,
                    a_name,
                    end - 1,
                    start,
                    b_name,
                )
            )
            lines.append(
                "  wire [{0}:0] cs_g{1}_sum1 = {2}[{3}:{4}] + {5}[{3}:{4}] + {6}'b1;".format(
                    size,
                    group,
                    a_name,
                    end - 1,
                    start,
                    b_name,
                    size + 1,
                )
            )
            lines.append("  wire [{0}:0] cs_g{1}_pick = {2} ? cs_g{1}_sum1 : cs_g{1}_sum0;".format(size, group, carry_name))
            for bit in range(size):
                lines.append("  assign cs_sum[{0}] = cs_g{1}_pick[{2}];".format(start + bit, group, bit))
            carry_name = "cs_g{0}_pick[{1}]".format(group, size)
        group += 1
    lines.append("  assign {0} = cs_sum;".format(out_name))


def render_wallace_square_generic(module, n, order="natural", final="sum", hcla_start=0, csel_group=0, dadda=False):
    width = 2 * n
    lines = header(module, n)
    columns = square_columns(lines, n)
    reduced = carry_save_reduce(lines, columns, order=order, dadda=dadda)
    lines.append("  wire [{0}:0] row0 = {1};".format(width - 1, vector_expr("row0", reduced, width, 0)))
    lines.append("  wire [{0}:0] row1 = {1};".format(width - 1, vector_expr("row1", reduced, width, 1)))
    if final == "hcla":
        append_prefix_adder(lines, "out", "row0", "row1", width, hcla_start)
    elif final == "csel":
        append_carryselect_adder(lines, "out", "row0", "row1", width, csel_group)
    else:
        lines.append("  assign out = row0 + row1;")
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def carry_save_reduce_counter4(lines, columns, order="outside"):
    width = len(columns)
    temp_id = 0
    stage = 0
    while True:
        changed = False
        next_columns = [[] for _ in range(width + 2)]
        for col, items in enumerate(columns):
            work = compressor_order(items, order)
            while len(work) >= 4:
                a, b, c, d = work.pop(0), work.pop(0), work.pop(0), work.pop(0)
                cnt = "qcnt_{0}_{1}".format(stage, temp_id)
                temp_id += 1
                lines.append("  wire [2:0] {0} = {{2'b0,{1}}} + {{2'b0,{2}}} + {{2'b0,{3}}} + {{2'b0,{4}}};".format(cnt, a, b, c, d))
                next_columns[col].append("{0}[0]".format(cnt))
                next_columns[col + 1].append("{0}[1]".format(cnt))
                next_columns[col + 2].append("{0}[2]".format(cnt))
                changed = True
            while len(work) > 2:
                a, b, c = work.pop(0), work.pop(0), work.pop(0)
                s = "qs_{0}_{1}".format(stage, temp_id)
                cy = "qc_{0}_{1}".format(stage, temp_id)
                temp_id += 1
                lines.append("  wire {0} = {1} ^ {2} ^ {3};".format(s, a, b, c))
                lines.append("  wire {0} = ({1} & {2}) | ({1} & {3}) | ({2} & {3});".format(cy, a, b, c))
                next_columns[col].append(s)
                next_columns[col + 1].append(cy)
                changed = True
            next_columns[col].extend(work)
        if not changed:
            return columns
        columns = next_columns
        stage += 1


def carry_save_reduce_factored(lines, columns, order="outside"):
    width = len(columns)
    temp_id = 0
    stage = 0
    while True:
        changed = False
        next_columns = [[] for _ in range(width + 1)]
        for col, items in enumerate(columns):
            work = compressor_order(items, order)
            while len(work) > 2:
                a, b, c = work.pop(0), work.pop(0), work.pop(0)
                p = "fp_{0}_{1}".format(stage, temp_id)
                g = "fg_{0}_{1}".format(stage, temp_id)
                s = "fs_{0}_{1}".format(stage, temp_id)
                cy = "fc_{0}_{1}".format(stage, temp_id)
                temp_id += 1
                lines.append("  wire {0} = {1} ^ {2};".format(p, a, b))
                lines.append("  wire {0} = {1} & {2};".format(g, a, b))
                lines.append("  wire {0} = {1} ^ {2};".format(s, p, c))
                lines.append("  wire {0} = {1} | ({2} & {3});".format(cy, g, p, c))
                next_columns[col].append(s)
                if col + 1 < len(next_columns):
                    next_columns[col + 1].append(cy)
                changed = True
            next_columns[col].extend(work)
        if not changed:
            return columns
        columns = next_columns
        stage += 1


def render_wallace_square_factored_generic(module, n, csel_group):
    width = 2 * n
    lines = header(module, n)
    columns = square_columns(lines, n)
    reduced = carry_save_reduce_factored(lines, columns, order="outside")
    lines.append("  wire [{0}:0] row0 = {1};".format(width - 1, vector_expr("row0", reduced, width, 0)))
    lines.append("  wire [{0}:0] row1 = {1};".format(width - 1, vector_expr("row1", reduced, width, 1)))
    append_carryselect_adder(lines, "out", "row0", "row1", width, csel_group)
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def render_wallace_square_factored_csel6(module, n):
    return render_wallace_square_factored_generic(module, n, 6)


def render_wallace_square_factored_csel8(module, n):
    return render_wallace_square_factored_generic(module, n, 8)


def render_wallace_square_counter4_generic(module, n, csel_group):
    width = 2 * n
    lines = header(module, n)
    columns = square_columns(lines, n)
    reduced = carry_save_reduce_counter4(lines, columns, order="outside")
    lines.append("  wire [{0}:0] row0 = {1};".format(width - 1, vector_expr("row0", reduced, width, 0)))
    lines.append("  wire [{0}:0] row1 = {1};".format(width - 1, vector_expr("row1", reduced, width, 1)))
    append_carryselect_adder(lines, "out", "row0", "row1", width, csel_group)
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def render_wallace_square(module, n):
    return render_wallace_square_generic(module, n)


def render_wallace_square_rev(module, n):
    return render_wallace_square_generic(module, n, order="rev")


def render_wallace_square_outside(module, n):
    return render_wallace_square_generic(module, n, order="outside")


def render_wallace_square_hcla2(module, n):
    return render_wallace_square_generic(module, n, final="hcla", hcla_start=2)


def render_wallace_square_hcla4(module, n):
    return render_wallace_square_generic(module, n, final="hcla", hcla_start=4)


def render_wallace_square_hcla6(module, n):
    return render_wallace_square_generic(module, n, final="hcla", hcla_start=6)


def render_wallace_square_hcla8(module, n):
    return render_wallace_square_generic(module, n, final="hcla", hcla_start=8)


def render_wallace_square_hcla10(module, n):
    return render_wallace_square_generic(module, n, final="hcla", hcla_start=10)


def render_wallace_square_rev_hcla4(module, n):
    return render_wallace_square_generic(module, n, order="rev", final="hcla", hcla_start=4)


def render_wallace_square_rev_hcla6(module, n):
    return render_wallace_square_generic(module, n, order="rev", final="hcla", hcla_start=6)


def render_wallace_square_outside_hcla4(module, n):
    return render_wallace_square_generic(module, n, order="outside", final="hcla", hcla_start=4)


def render_wallace_square_outside_hcla6(module, n):
    return render_wallace_square_generic(module, n, order="outside", final="hcla", hcla_start=6)


def render_wallace_square_outside_csel2(module, n):
    return render_wallace_square_generic(module, n, order="outside", final="csel", csel_group=2)


def render_wallace_square_outside_csel3(module, n):
    return render_wallace_square_generic(module, n, order="outside", final="csel", csel_group=3)


def render_wallace_square_outside_csel4(module, n):
    return render_wallace_square_generic(module, n, order="outside", final="csel", csel_group=4)


def render_wallace_square_outside_csel5(module, n):
    return render_wallace_square_generic(module, n, order="outside", final="csel", csel_group=5)


def render_wallace_square_outside_csel6(module, n):
    return render_wallace_square_generic(module, n, order="outside", final="csel", csel_group=6)


def render_wallace_square_outside_csel8(module, n):
    return render_wallace_square_generic(module, n, order="outside", final="csel", csel_group=8)


def render_wallace_square_outside_csel10(module, n):
    return render_wallace_square_generic(module, n, order="outside", final="csel", csel_group=10)


def render_wallace_square_outside_csel12(module, n):
    return render_wallace_square_generic(module, n, order="outside", final="csel", csel_group=12)


def render_wallace_square_outside_csel14(module, n):
    return render_wallace_square_generic(module, n, order="outside", final="csel", csel_group=14)


def render_wallace_square_outside_csel16(module, n):
    return render_wallace_square_generic(module, n, order="outside", final="csel", csel_group=16)


def render_wallace_square_csel6(module, n):
    return render_wallace_square_generic(module, n, final="csel", csel_group=6)


def render_wallace_square_csel8(module, n):
    return render_wallace_square_generic(module, n, final="csel", csel_group=8)


def render_wallace_square_rev_csel6(module, n):
    return render_wallace_square_generic(module, n, order="rev", final="csel", csel_group=6)


def render_wallace_square_rev_csel8(module, n):
    return render_wallace_square_generic(module, n, order="rev", final="csel", csel_group=8)


def render_wallace_square_center_csel6(module, n):
    return render_wallace_square_generic(module, n, order="center", final="csel", csel_group=6)


def render_wallace_square_center_csel8(module, n):
    return render_wallace_square_generic(module, n, order="center", final="csel", csel_group=8)


def render_wallace_square_evenodd_csel6(module, n):
    return render_wallace_square_generic(module, n, order="evenodd", final="csel", csel_group=6)


def render_wallace_square_evenodd_csel8(module, n):
    return render_wallace_square_generic(module, n, order="evenodd", final="csel", csel_group=8)


def render_wallace_square_counter4_csel4(module, n):
    return render_wallace_square_counter4_generic(module, n, 4)


def render_wallace_square_counter4_csel6(module, n):
    return render_wallace_square_counter4_generic(module, n, 6)


def render_wallace_square_counter4_csel8(module, n):
    return render_wallace_square_counter4_generic(module, n, 8)


def carry_save_reduce_counter4x(lines, columns, order="outside"):
    width = len(columns)
    temp_id = 0
    stage = 0
    while True:
        changed = False
        next_columns = [[] for _ in range(width + 2)]
        for col, items in enumerate(columns):
            work = compressor_order(items, order)
            while len(work) >= 4:
                a, b, c, d = work.pop(0), work.pop(0), work.pop(0), work.pop(0)
                sab = "x42_sab_{0}_{1}".format(stage, temp_id)
                scd = "x42_scd_{0}_{1}".format(stage, temp_id)
                cab = "x42_cab_{0}_{1}".format(stage, temp_id)
                ccd = "x42_ccd_{0}_{1}".format(stage, temp_id)
                s = "x42_s_{0}_{1}".format(stage, temp_id)
                cmid = "x42_cmid_{0}_{1}".format(stage, temp_id)
                cy1 = "x42_cy1_{0}_{1}".format(stage, temp_id)
                cy2 = "x42_cy2_{0}_{1}".format(stage, temp_id)
                temp_id += 1
                lines.append("  wire {0} = {1} ^ {2};".format(sab, a, b))
                lines.append("  wire {0} = {1} ^ {2};".format(scd, c, d))
                lines.append("  wire {0} = {1} & {2};".format(cab, a, b))
                lines.append("  wire {0} = {1} & {2};".format(ccd, c, d))
                lines.append("  wire {0} = {1} ^ {2};".format(s, sab, scd))
                lines.append("  wire {0} = {1} & {2};".format(cmid, sab, scd))
                lines.append("  wire {0} = {1} ^ {2} ^ {3};".format(cy1, cab, ccd, cmid))
                lines.append("  wire {0} = ({1} & {2}) | ({1} & {3}) | ({2} & {3});".format(cy2, cab, ccd, cmid))
                next_columns[col].append(s)
                next_columns[col + 1].append(cy1)
                next_columns[col + 2].append(cy2)
                changed = True
            while len(work) > 2:
                a, b, c = work.pop(0), work.pop(0), work.pop(0)
                s = "x42_fs_{0}_{1}".format(stage, temp_id)
                cy = "x42_fc_{0}_{1}".format(stage, temp_id)
                temp_id += 1
                lines.append("  wire {0} = {1} ^ {2} ^ {3};".format(s, a, b, c))
                lines.append("  wire {0} = ({1} & {2}) | ({1} & {3}) | ({2} & {3});".format(cy, a, b, c))
                next_columns[col].append(s)
                next_columns[col + 1].append(cy)
                changed = True
            next_columns[col].extend(work)
        if not changed:
            return columns
        columns = next_columns
        stage += 1


def render_wallace_square_counter4x_generic(module, n, csel_group):
    width = 2 * n
    lines = header(module, n)
    columns = square_columns(lines, n)
    reduced = carry_save_reduce_counter4x(lines, columns, order="outside")
    lines.append("  wire [{0}:0] row0 = {1};".format(width - 1, vector_expr("row0", reduced, width, 0)))
    lines.append("  wire [{0}:0] row1 = {1};".format(width - 1, vector_expr("row1", reduced, width, 1)))
    append_carryselect_adder(lines, "out", "row0", "row1", width, csel_group)
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def render_wallace_square_counter4x_csel4(module, n):
    return render_wallace_square_counter4x_generic(module, n, 4)


def render_wallace_square_counter4x_csel6(module, n):
    return render_wallace_square_counter4x_generic(module, n, 6)


def render_wallace_square_counter4x_csel8(module, n):
    return render_wallace_square_counter4x_generic(module, n, 8)


def booth_code_expr_square(n, group):
    prev = "1'b0" if group == 0 else "x[{0}]".format(2 * group - 1)
    mid_index = 2 * group
    high_index = 2 * group + 1
    mid = "1'b0" if mid_index >= n else "x[{0}]".format(mid_index)
    high = "1'b0" if high_index >= n else "x[{0}]".format(high_index)
    return "{{{0}, {1}, {2}}}".format(high, mid, prev)


def append_booth_radix4_rows(lines, n, prefix):
    width = 2 * n
    work_width = width + 3
    groups = (n + 2) // 2
    rows = []
    lines.append("  wire signed [{0}:0] {1}_x_s = {{{{{2}{{1'b0}}}}, x}};".format(work_width - 1, prefix, work_width - n))
    for group in range(groups):
        raw = "{0}_raw{1}".format(prefix, group)
        row = "{0}_row{1}".format(prefix, group)
        rec = "{0}_rec{1}".format(prefix, group)
        rows.append(rec)
        lines.append("  reg signed [{0}:0] {1};".format(work_width - 1, raw))
        lines.append("  always @* begin")
        lines.append("    case ({0})".format(booth_code_expr_square(n, group)))
        lines.append("      3'b000, 3'b111: {0} = {1}'sd0;".format(raw, work_width))
        lines.append("      3'b001, 3'b010: {0} = {1}_x_s;".format(raw, prefix))
        lines.append("      3'b011: {0} = {1}_x_s <<< 1;".format(raw, prefix))
        lines.append("      3'b100: {0} = -({1}_x_s <<< 1);".format(raw, prefix))
        lines.append("      3'b101, 3'b110: {0} = -{1}_x_s;".format(raw, prefix))
        lines.append("      default: {0} = {1}'sd0;".format(raw, work_width))
        lines.append("    endcase")
        lines.append("  end")
        lines.append("  wire signed [{0}:0] {1} = {2} <<< {3};".format(work_width - 1, row, raw, 2 * group))
        lines.append("  wire [{0}:0] {1} = {2};".format(work_width - 1, rec, row))
    return rows, work_width


def reduce_rows_csa(lines, rows, width, prefix):
    current = list(rows)
    stage = 0
    while len(current) > 2:
        nxt = []
        for index in range(0, len(current), 3):
            chunk = current[index : index + 3]
            if len(chunk) == 3:
                a, b, c = chunk
                s = "{0}_s{1}_{2}".format(prefix, stage, index // 3)
                cy = "{0}_c{1}_{2}".format(prefix, stage, index // 3)
                lines.append("  wire [{0}:0] {1} = {2} ^ {3} ^ {4};".format(width - 1, s, a, b, c))
                lines.append("  wire [{0}:0] {1} = (({2} & {3}) | ({2} & {4}) | ({3} & {4})) << 1;".format(width - 1, cy, a, b, c))
                nxt.extend([s, cy])
            else:
                nxt.extend(chunk)
        current = nxt
        stage += 1
    return current


def render_booth_radix4_balanced(module, n):
    width = 2 * n
    lines = header(module, n)
    rows, work_width = append_booth_radix4_rows(lines, n, "br")
    lines.append("  wire signed [{0}:0] booth_sum = {1};".format(work_width - 1, balanced_sum_expr(["$signed({0})".format(row) for row in rows])))
    lines.extend(
        [
            "  assign out = booth_sum[{0}:0];".format(width - 1),
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


def render_booth_radix4_csa_generic(module, n, final, group_size=0, hcla_start=0):
    width = 2 * n
    lines = header(module, n)
    rows, work_width = append_booth_radix4_rows(lines, n, "bc")
    reduced = reduce_rows_csa(lines, rows, work_width, "bc")
    if len(reduced) == 1:
        lines.append("  wire [{0}:0] booth_sum = {1};".format(work_width - 1, reduced[0]))
    elif final == "hcla":
        append_prefix_adder(lines, "booth_sum", reduced[0], reduced[1], work_width, hcla_start)
    else:
        append_carryselect_adder(lines, "booth_sum", reduced[0], reduced[1], work_width, group_size)
    lines.extend(
        [
            "  assign out = booth_sum[{0}:0];".format(width - 1),
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


def render_booth_radix4_csa_csel4(module, n):
    return render_booth_radix4_csa_generic(module, n, "csel", group_size=4)


def render_booth_radix4_csa_csel6(module, n):
    return render_booth_radix4_csa_generic(module, n, "csel", group_size=6)


def render_booth_radix4_csa_csel8(module, n):
    return render_booth_radix4_csa_generic(module, n, "csel", group_size=8)


def render_booth_radix4_csa_hcla4(module, n):
    return render_booth_radix4_csa_generic(module, n, "hcla", hcla_start=4)


def render_msb_split_wallace(module, n, final="csel", group=6, hcla_start=4):
    if n <= 4:
        return None
    width = 2 * n
    low_n = n - 1
    low_module = "{0}_low{1}".format(module, low_n)
    if final == "hcla":
        low_text = render_wallace_square_generic(low_module, low_n, order="outside", final="hcla", hcla_start=hcla_start)
    else:
        low_text = render_wallace_square_generic(low_module, low_n, order="outside", final="csel", csel_group=group)
    lines = header(module, n)
    lines.extend(
        [
            "  wire [{0}:0] r = x[{0}:0];".format(low_n - 1),
            "  wire [{0}:0] r_sq;".format(2 * low_n - 1),
            "  {0} low_sq(.in(r), .out(r_sq));".format(low_module),
            "  wire [{0}:0] base = {{{{{1}{{1'b0}}}}, r_sq}};".format(width - 1, width - 2 * low_n),
            "  wire [{0}:0] cross = {{{1}'b0, r}} << {2};".format(width - 1, width - low_n, n),
            "  wire [{0}:0] high_fix = {1};".format(width - 1, const(width, 1 << (2 * n - 2))),
            "  wire [{0}:0] hi_value = base + cross + high_fix;".format(width - 1),
            "  assign out = x[{0}] ? hi_value : base;".format(n - 1),
            "endmodule",
            "",
        ]
    )
    return low_text + "\n" + "\n".join(lines)


def render_msb_split_wallace_csel6(module, n):
    return render_msb_split_wallace(module, n, "csel", group=6)


def render_msb_split_wallace_csel8(module, n):
    return render_msb_split_wallace(module, n, "csel", group=8)


def render_msb_split_wallace_hcla4(module, n):
    return render_msb_split_wallace(module, n, "hcla", hcla_start=4)


def render_dadda_square(module, n):
    return render_wallace_square_generic(module, n, dadda=True)


def render_dadda_square_hcla4(module, n):
    return render_wallace_square_generic(module, n, dadda=True, final="hcla", hcla_start=4)


def render_dadda_square_hcla6(module, n):
    return render_wallace_square_generic(module, n, dadda=True, final="hcla", hcla_start=6)


def render_dadda_square_hcla8(module, n):
    return render_wallace_square_generic(module, n, dadda=True, final="hcla", hcla_start=8)


def render_dadda_square_csel4(module, n):
    return render_wallace_square_generic(module, n, dadda=True, final="csel", csel_group=4)


def render_dadda_square_csel6(module, n):
    return render_wallace_square_generic(module, n, dadda=True, final="csel", csel_group=6)


def render_triangular_rows_csa(module, n):
    width = 2 * n
    lines = header(module, n)
    rows = []
    for i in range(n):
        terms = ["({{{0}'b0, x[{1}]}} << {2})".format(width - 1, i, 2 * i)]
        for j in range(i + 1, n):
            terms.append("({{{0}'b0, (x[{1}] & x[{2}])}} << {3})".format(width - 1, i, j, i + j + 1))
        row = "row_{0}".format(i)
        lines.append("  wire [{0}:0] {1} = {2};".format(width - 1, row, " | ".join(terms)))
        rows.append(row)
    current = rows
    stage = 0
    while len(current) > 2:
        nxt = []
        for idx in range(0, len(current), 3):
            group = current[idx : idx + 3]
            if len(group) == 3:
                s = "rs_{0}_{1}".format(stage, idx)
                c = "rc_{0}_{1}".format(stage, idx)
                a, b, c_in = group
                lines.append("  wire [{0}:0] {1} = {2} ^ {3} ^ {4};".format(width - 1, s, a, b, c_in))
                lines.append("  wire [{0}:0] {1} = (({2} & {3}) | ({2} & {4}) | ({3} & {4})) << 1;".format(width - 1, c, a, b, c_in))
                nxt.extend([s, c])
            else:
                nxt.extend(group)
        current = nxt
        stage += 1
    if len(current) == 1:
        lines.append("  assign out = {0};".format(current[0]))
    else:
        lines.append("  assign out = {0} + {1};".format(current[0], current[1]))
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def render_low_high_split(module, n, hcla=False):
    if n < 8:
        return None
    lo = n // 2
    hi = n - lo
    width = 2 * n
    lines = header(module, n)
    lines.extend(
        [
            "  wire [{0}:0] xl = x[{0}:0];".format(lo - 1),
            "  wire [{0}:0] xh = x[{1}:{2}];".format(hi - 1, n - 1, lo),
            "  wire [{0}:0] p0 = xl * xl;".format(2 * lo - 1),
            "  wire [{0}:0] p2 = xh * xh;".format(2 * hi - 1),
            "  wire [{0}:0] pm = xl * xh;".format(lo + hi - 1),
            "  wire [{0}:0] t0 = {{{1}'b0, p0}};".format(width - 1, width - 2 * lo),
            "  wire [{0}:0] t2 = {{{1}'b0, p2}} << {2};".format(width - 1, width - 2 * hi, 2 * lo),
            "  wire [{0}:0] tm = {{{1}'b0, pm}} << {2};".format(width - 1, width - lo - hi, lo + 1),
        ]
    )
    if hcla:
        lines.append("  wire [{0}:0] pre = t0 + t2;".format(width - 1))
        append_prefix_adder(lines, "out", "pre", "tm", width, lo)
    else:
        lines.append("  assign out = (t0 + t2) + tm;")
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def render_low_high_split_hcla(module, n):
    return render_low_high_split(module, n, True)


def render_karatsuba_square(module, n):
    if n < 8:
        return None
    lo = n // 2
    hi = n - lo
    width = 2 * n
    sumw = hi + 1
    lines = header(module, n)
    lines.extend(
        [
            "  wire [{0}:0] xl = x[{0}:0];".format(lo - 1),
            "  wire [{0}:0] xh = x[{1}:{2}];".format(hi - 1, n - 1, lo),
            "  wire [{0}:0] p0 = xl * xl;".format(2 * lo - 1),
            "  wire [{0}:0] p2 = xh * xh;".format(2 * hi - 1),
            "  wire [{0}:0] xs = {{{1}'b0, xl}} + {{1'b0, xh}};".format(sumw - 1, sumw - lo),
            "  wire [{0}:0] ps = xs * xs;".format(2 * sumw - 1),
            "  wire [{0}:0] mid = ps - {{{1}'b0, p0}} - {{{2}'b0, p2}};".format(
                2 * sumw - 1,
                2 * sumw - 2 * lo,
                2 * sumw - 2 * hi,
            ),
            "  wire [{0}:0] t0 = {{{1}'b0, p0}};".format(width - 1, width - 2 * lo),
            "  wire [{0}:0] t2 = {{{1}'b0, p2}} << {2};".format(width - 1, width - 2 * hi, 2 * lo),
            "  wire [{0}:0] tm = {{{1}'b0, mid}} << {2};".format(width - 1, width - 2 * sumw, lo),
            "  assign out = (t0 + t2) + tm;",
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


def render_low_case_high_direct(module, n, lo):
    if n <= lo:
        return None
    hi = n - lo
    width = 2 * n
    lines = header(module, n)
    lines.extend(
        [
            "  wire [{0}:0] xl = x[{0}:0];".format(lo - 1),
            "  wire [{0}:0] xh = x[{1}:{2}];".format(hi - 1, n - 1, lo),
            "  reg [{0}:0] p0;".format(2 * lo - 1),
            "  always @* begin",
            "    case (xl)",
        ]
    )
    for value in range(1 << lo):
        lines.append("      {0}'d{1}: p0 = {2};".format(lo, value, const(2 * lo, value * value)))
    lines.extend(
        [
            "      default: p0 = {0};".format(zero_word(2 * lo)),
            "    endcase",
            "  end",
            "  wire [{0}:0] p2 = xh * xh;".format(2 * hi - 1),
            "  wire [{0}:0] pm = xl * xh;".format(lo + hi - 1),
            "  wire [{0}:0] t0 = {{{1}'b0, p0}};".format(width - 1, width - 2 * lo),
            "  wire [{0}:0] t2 = {{{1}'b0, p2}} << {2};".format(width - 1, width - 2 * hi, 2 * lo),
            "  wire [{0}:0] tm = {{{1}'b0, pm}} << {2};".format(width - 1, width - lo - hi, lo + 1),
            "  assign out = (t0 + t2) + tm;",
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


def render_low4_case_high_direct(module, n):
    return render_low_case_high_direct(module, n, 4)


def render_low5_case_high_direct(module, n):
    return render_low_case_high_direct(module, n, 5)


def shifted_xh_expr(width, hi, shift):
    base = "{{{0}'b0, xh}}".format(width - hi)
    if shift == 0:
        return base
    return "({0} << {1})".format(base, shift)


def const_xh_mul_terms(width, hi, value, base_shift):
    terms = []
    for bit in range(value.bit_length()):
        if value & (1 << bit):
            terms.append(shifted_xh_expr(width, hi, base_shift + bit))
    return terms


def const_var_mul_terms(var_name, width, var_width, value, base_shift):
    terms = []
    for bit in range(value.bit_length()):
        if value & (1 << bit):
            base = "{{{0}'b0, {1}}}".format(width - var_width, var_name)
            shift = base_shift + bit
            if shift:
                terms.append("({0} << {1})".format(base, shift))
            else:
                terms.append(base)
    return terms


def render_low_case_constmul(module, n, lo):
    if n <= lo:
        return None
    hi = n - lo
    width = 2 * n
    lines = header(module, n)
    lines.extend(
        [
            "  wire [{0}:0] xl = x[{0}:0];".format(lo - 1),
            "  wire [{0}:0] xh = x[{1}:{2}];".format(hi - 1, n - 1, lo),
            "  wire [{0}:0] p2 = xh * xh;".format(2 * hi - 1),
            "  wire [{0}:0] t2 = {{{1}'b0, p2}} << {2};".format(width - 1, width - 2 * hi, 2 * lo),
            "  reg [{0}:0] out_r;".format(width - 1),
            "  always @* begin",
            "    case (xl)",
        ]
    )
    for value in range(1 << lo):
        terms = ["t2"]
        terms.extend(const_xh_mul_terms(width, hi, value, lo + 1))
        if value:
            terms.append(const(width, value * value))
        expr = " + ".join(terms) if terms else zero_word(width)
        lines.append("      {0}'d{1}: out_r = {2};".format(lo, value, expr))
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


def render_low4_case_constmul(module, n):
    return render_low_case_constmul(module, n, 4)


def render_low5_case_constmul(module, n):
    return render_low_case_constmul(module, n, 5)


def render_low6_case_constmul(module, n):
    return render_low_case_constmul(module, n, 6)


def low_square_group(lo):
    if lo <= 8:
        return 5
    if lo == 10:
        return 4
    if lo == 12:
        return 5
    return max(4, min(8, lo // 2))


def render_high_case_lowsq(module, n, hi):
    if n <= hi or hi > 6:
        return None
    lo = n - hi
    width = 2 * n
    low_module = "{0}_low{1}".format(module, lo)
    low_text = render_wallace_square_generic(low_module, lo, order="outside", final="csel", csel_group=low_square_group(lo))
    lines = header(module, n)
    lines.extend(
        [
            "  wire [{0}:0] xl = x[{0}:0];".format(lo - 1),
            "  wire [{0}:0] xh = x[{1}:{2}];".format(hi - 1, n - 1, lo),
            "  wire [{0}:0] p0;".format(2 * lo - 1),
            "  {0} low_sq(.in(xl), .out(p0));".format(low_module),
            "  wire [{0}:0] p0w = {{{1}'b0, p0}};".format(width - 1, width - 2 * lo),
            "  reg [{0}:0] out_r;".format(width - 1),
            "  always @* begin",
            "    case (xh)",
        ]
    )
    for high in range(1 << hi):
        terms = ["p0w"]
        terms.extend(const_var_mul_terms("xl", width, lo, 2 * high, lo))
        high_const = (high * high) << (2 * lo)
        if high_const:
            terms.append(const(width, high_const))
        expr = balanced_sum_expr(terms)
        lines.append("      {0}'d{1}: out_r = {2};".format(hi, high, expr))
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
    return low_text + "\n" + "\n".join(lines)


def render_high3_case_lowsq(module, n):
    return render_high_case_lowsq(module, n, 3)


def render_high4_case_lowsq(module, n):
    return render_high_case_lowsq(module, n, 4)


def render_high5_case_lowsq(module, n):
    return render_high_case_lowsq(module, n, 5)


def render_high6_case_lowsq(module, n):
    return render_high_case_lowsq(module, n, 6)


def square_plane(n, bit, order):
    width = 2 * n
    mask = (1 << width) - 1
    plane = bytes((((index * index) & mask) >> bit) & 1 for index in range(1 << n))
    return permute_plane(plane, order)


def render_hybrid_bddtop(module, n, top_count, group_override=None):
    width = 2 * n
    return render_hybrid_bddbits(module, n, list(range(width - top_count, width)), group_override, shared=True)


def bdd_order(n, order_name):
    if order_name == "nat":
        return list(range(n))
    if order_name == "outside":
        out = []
        lo = 0
        hi = n - 1
        while lo <= hi:
            out.append(hi)
            if lo != hi:
                out.append(lo)
            hi -= 1
            lo += 1
        return out
    if order_name == "center":
        center = (n - 1) / 2.0
        return sorted(range(n), key=lambda bit: (abs(bit - center), -bit))
    return list(reversed(range(n)))


def render_hybrid_bddtop_order(module, n, top_count, order_name, trunc=False):
    width = 2 * n
    keep = width - top_count
    if keep <= 0:
        return None
    order = bdd_order(n, order_name)
    builder = SharedBddBuilder(order)
    roots = []
    for bit in range(keep, width):
        roots.append((bit, builder.build(square_plane(n, bit, order), 0)))
    lines = header(module, n)
    if trunc:
        group = 8 if n == 14 else 6 if n == 16 else low_square_group(n)
        lines.append("  wire [{0}:0] arith_out;".format(keep - 1))
        render_truncated_square_low(lines, n, keep, "arith_out", group)
    else:
        group = 8 if n == 14 else 6 if n == 16 else low_square_group(n)
        arith_module = "{0}_arith".format(module)
        arith_text = render_wallace_square_generic(arith_module, n, order="outside", final="csel", csel_group=group)
        lines.extend(
            [
                "  wire [{0}:0] arith_out;".format(width - 1),
                "  {0} arith_inst(.in(in), .out(arith_out));".format(arith_module),
            ]
        )
    for node in builder.nodes:
        lines.append(
            "  wire n_{0} = in[{1}] ? {2} : {3};".format(
                node["id"],
                node["var"],
                edge_expr(node["high"]),
                edge_expr(node["low"]),
            )
        )
    root_by_bit = dict(roots)
    for bit in range(width):
        if bit < keep:
            lines.append("  assign out[{0}] = arith_out[{0}];".format(bit))
        else:
            lines.append("  assign out[{0}] = {1};".format(bit, edge_expr(root_by_bit[bit])))
    lines.extend(["endmodule", ""])
    text = "\n".join(lines)
    return text if trunc else arith_text + "\n" + text


def render_hybrid_bddtop_hcla(module, n, top_count, start):
    width = 2 * n
    selected_bits = list(range(width - top_count, width))
    arith_module = "{0}_arith".format(module)
    arith_text = render_wallace_square_generic(arith_module, n, order="outside", final="hcla", hcla_start=start)
    order = list(reversed(range(n)))
    builder = SharedBddBuilder(order)
    roots = {}
    for bit in selected_bits:
        roots[bit] = builder.build(square_plane(n, bit, order), 0)
    lines = header(module, n)
    lines.extend(
        [
            "  wire [{0}:0] arith_out;".format(width - 1),
            "  {0} arith_inst(.in(in), .out(arith_out));".format(arith_module),
        ]
    )
    for node in builder.nodes:
        lines.append(
            "  wire n_{0} = in[{1}] ? {2} : {3};".format(
                node["id"],
                node["var"],
                edge_expr(node["high"]),
                edge_expr(node["low"]),
            )
        )
    for bit in range(width):
        if bit in roots:
            lines.append("  assign out[{0}] = {1};".format(bit, edge_expr(roots[bit])))
        else:
            lines.append("  assign out[{0}] = arith_out[{0}];".format(bit))
    lines.extend(["endmodule", ""])
    return arith_text + "\n" + "\n".join(lines)


def edge_expr_pref(edge, prefix):
    node_id, inv = edge
    if node_id == 0:
        return "1'b1" if inv else "1'b0"
    name = "{0}_n_{1}".format(prefix, node_id)
    return "~{0}".format(name) if inv else name


def render_hybrid_bddbits(module, n, selected_bits, group_override=None, shared=True):
    width = 2 * n
    selected_bits = sorted(set(selected_bits))
    if not selected_bits or selected_bits[0] < 0 or selected_bits[-1] >= width:
        return None
    group = group_override or (8 if n == 14 else 6 if n == 16 else low_square_group(n))
    arith_module = "{0}_arith".format(module)
    arith_text = render_wallace_square_generic(arith_module, n, order="outside", final="csel", csel_group=group)
    order = list(reversed(range(n)))
    lines = header(module, n)
    lines.extend(
        [
            "  wire [{0}:0] arith_out;".format(width - 1),
            "  {0} arith_inst(.in(in), .out(arith_out));".format(arith_module),
        ]
    )
    root_by_bit = {}
    if shared:
        builder = SharedBddBuilder(order)
        for bit in selected_bits:
            root_by_bit[bit] = ("", builder.build(square_plane(n, bit, order), 0))
        for node in builder.nodes:
            lines.append(
                "  wire n_{0} = in[{1}] ? {2} : {3};".format(
                    node["id"],
                    node["var"],
                    edge_expr(node["high"]),
                    edge_expr(node["low"]),
                )
            )
    else:
        for bit in selected_bits:
            prefix = "b{0}".format(bit)
            builder = SharedBddBuilder(order)
            root = builder.build(square_plane(n, bit, order), 0)
            root_by_bit[bit] = (prefix, root)
            for node in builder.nodes:
                lines.append(
                    "  wire {0}_n_{1} = in[{2}] ? {3} : {4};".format(
                        prefix,
                        node["id"],
                        node["var"],
                        edge_expr_pref(node["high"], prefix),
                        edge_expr_pref(node["low"], prefix),
                    )
                )
    for bit in range(width):
        if bit in root_by_bit:
            prefix, root = root_by_bit[bit]
            expr = edge_expr(root) if shared else edge_expr_pref(root, prefix)
            lines.append("  assign out[{0}] = {1};".format(bit, expr))
        else:
            lines.append("  assign out[{0}] = arith_out[{0}];".format(bit))
    lines.extend(["endmodule", ""])
    return arith_text + "\n" + "\n".join(lines)


def render_hybrid_bddtop4(module, n):
    return render_hybrid_bddtop(module, n, 4)


def render_hybrid_bddtop1(module, n):
    return render_hybrid_bddtop(module, n, 1)


def render_hybrid_bddtop2(module, n):
    return render_hybrid_bddtop(module, n, 2)


def render_hybrid_bddtop3(module, n):
    return render_hybrid_bddtop(module, n, 3)


def render_hybrid_bddtop5(module, n):
    return render_hybrid_bddtop(module, n, 5)


def render_hybrid_bddtop6(module, n):
    return render_hybrid_bddtop(module, n, 6)


def render_hybrid_bddtop8(module, n):
    return render_hybrid_bddtop(module, n, 8)


def render_hybrid_bddtop10(module, n):
    return render_hybrid_bddtop(module, n, 10)


def render_hybrid_bddtop2_hcla0(module, n):
    return render_hybrid_bddtop_hcla(module, n, 2, 0)


def render_hybrid_bddtop2_hcla4(module, n):
    return render_hybrid_bddtop_hcla(module, n, 2, 4)


def render_hybrid_bddtop2_hcla8(module, n):
    return render_hybrid_bddtop_hcla(module, n, 2, 8)


def render_hybrid_bddtop3_hcla4(module, n):
    return render_hybrid_bddtop_hcla(module, n, 3, 4)


def render_hybrid_bddtop4_hcla4(module, n):
    return render_hybrid_bddtop_hcla(module, n, 4, 4)


def render_hybrid_bddtop4_hcla8(module, n):
    return render_hybrid_bddtop_hcla(module, n, 4, 8)


def render_hybrid_bddtop4_order_nat(module, n):
    return render_hybrid_bddtop_order(module, n, 4, "nat", trunc=False)


def render_hybrid_bddtop4_order_outside(module, n):
    return render_hybrid_bddtop_order(module, n, 4, "outside", trunc=False)


def render_hybrid_bddtop4_order_center(module, n):
    return render_hybrid_bddtop_order(module, n, 4, "center", trunc=False)


def render_hybrid_bddtop5_order_nat(module, n):
    return render_hybrid_bddtop_order(module, n, 5, "nat", trunc=False)


def render_hybrid_bddtop5_order_outside(module, n):
    return render_hybrid_bddtop_order(module, n, 5, "outside", trunc=False)


def render_hybrid_bddtop5_order_center(module, n):
    return render_hybrid_bddtop_order(module, n, 5, "center", trunc=False)


def render_hybrid_bddtop2_perbit(module, n):
    width = 2 * n
    return render_hybrid_bddbits(module, n, list(range(width - 2, width)), shared=False)


def render_hybrid_bddtop3_perbit(module, n):
    width = 2 * n
    return render_hybrid_bddbits(module, n, list(range(width - 3, width)), shared=False)


def render_hybrid_bddtop4_perbit(module, n):
    width = 2 * n
    return render_hybrid_bddbits(module, n, list(range(width - 4, width)), shared=False)


def render_truncated_square_low(lines, n, keep, out_name, group):
    columns = [[] for _ in range(keep + 1)]
    for i in range(n):
        col = 2 * i
        if col < keep:
            columns[col].append("x[{0}]".format(i))
    for i in range(n):
        for j in range(i + 1, n):
            col = i + j + 1
            if col < keep:
                name = "tpp_{0}_{1}".format(i, j)
                lines.append("  wire {0} = x[{1}] & x[{2}];".format(name, i, j))
                columns[col].append(name)
    reduced = carry_save_reduce(lines, columns, order="outside", dadda=False)
    lines.append("  wire [{0}:0] trow0 = {1};".format(keep - 1, vector_expr("trow0", reduced, keep, 0)))
    lines.append("  wire [{0}:0] trow1 = {1};".format(keep - 1, vector_expr("trow1", reduced, keep, 1)))
    append_carryselect_adder(lines, out_name, "trow0", "trow1", keep, group)


def render_truncated_square_low_hcla(lines, n, keep, out_name, start):
    columns = [[] for _ in range(keep + 1)]
    for i in range(n):
        col = 2 * i
        if col < keep:
            columns[col].append("x[{0}]".format(i))
    for i in range(n):
        for j in range(i + 1, n):
            col = i + j + 1
            if col < keep:
                name = "hpp_{0}_{1}".format(i, j)
                lines.append("  wire {0} = x[{1}] & x[{2}];".format(name, i, j))
                columns[col].append(name)
    reduced = carry_save_reduce(lines, columns, order="outside", dadda=False)
    lines.append("  wire [{0}:0] hrow0 = {1};".format(keep - 1, vector_expr("hrow0", reduced, keep, 0)))
    lines.append("  wire [{0}:0] hrow1 = {1};".format(keep - 1, vector_expr("hrow1", reduced, keep, 1)))
    append_prefix_adder(lines, out_name, "hrow0", "hrow1", keep, start)


def render_truncated_square_low_factored(lines, n, keep, out_name, group):
    columns = [[] for _ in range(keep + 1)]
    for i in range(n):
        col = 2 * i
        if col < keep:
            columns[col].append("x[{0}]".format(i))
    for i in range(n):
        for j in range(i + 1, n):
            col = i + j + 1
            if col < keep:
                name = "fpp_{0}_{1}".format(i, j)
                lines.append("  wire {0} = x[{1}] & x[{2}];".format(name, i, j))
                columns[col].append(name)
    reduced = carry_save_reduce_factored(lines, columns, order="outside")
    lines.append("  wire [{0}:0] frow0 = {1};".format(keep - 1, vector_expr("frow0", reduced, keep, 0)))
    lines.append("  wire [{0}:0] frow1 = {1};".format(keep - 1, vector_expr("frow1", reduced, keep, 1)))
    append_carryselect_adder(lines, out_name, "frow0", "frow1", keep, group)


def render_hybrid_bddtop_trunc(module, n, top_count, group_override=None):
    width = 2 * n
    keep = width - top_count
    if keep <= 0:
        return None
    group = group_override or (8 if n == 14 else 6 if n == 16 else low_square_group(n))
    order = list(reversed(range(n)))
    builder = SharedBddBuilder(order)
    roots = []
    for bit in range(keep, width):
        roots.append((bit, builder.build(square_plane(n, bit, order), 0)))
    lines = header(module, n)
    lines.append("  wire [{0}:0] low_out;".format(keep - 1))
    render_truncated_square_low(lines, n, keep, "low_out", group)
    for node in builder.nodes:
        lines.append(
            "  wire n_{0} = in[{1}] ? {2} : {3};".format(
                node["id"],
                node["var"],
                edge_expr(node["high"]),
                edge_expr(node["low"]),
            )
        )
    root_by_bit = dict(roots)
    for bit in range(width):
        if bit < keep:
            lines.append("  assign out[{0}] = low_out[{0}];".format(bit))
        else:
            lines.append("  assign out[{0}] = {1};".format(bit, edge_expr(root_by_bit[bit])))
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def render_hybrid_bddtop_trunc_factored(module, n, top_count):
    width = 2 * n
    keep = width - top_count
    if keep <= 0:
        return None
    group = 8 if n == 14 else 6 if n == 16 else low_square_group(n)
    order = list(reversed(range(n)))
    builder = SharedBddBuilder(order)
    roots = []
    for bit in range(keep, width):
        roots.append((bit, builder.build(square_plane(n, bit, order), 0)))
    lines = header(module, n)
    lines.append("  wire [{0}:0] low_out;".format(keep - 1))
    render_truncated_square_low_factored(lines, n, keep, "low_out", group)
    for node in builder.nodes:
        lines.append(
            "  wire n_{0} = in[{1}] ? {2} : {3};".format(
                node["id"],
                node["var"],
                edge_expr(node["high"]),
                edge_expr(node["low"]),
            )
        )
    root_by_bit = dict(roots)
    for bit in range(width):
        if bit < keep:
            lines.append("  assign out[{0}] = low_out[{0}];".format(bit))
        else:
            lines.append("  assign out[{0}] = {1};".format(bit, edge_expr(root_by_bit[bit])))
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def render_hybrid_bddtop_trunc_hcla(module, n, top_count, start):
    width = 2 * n
    keep = width - top_count
    if keep <= 0:
        return None
    order = list(reversed(range(n)))
    builder = SharedBddBuilder(order)
    roots = []
    for bit in range(keep, width):
        roots.append((bit, builder.build(square_plane(n, bit, order), 0)))
    lines = header(module, n)
    lines.append("  wire [{0}:0] low_out;".format(keep - 1))
    render_truncated_square_low_hcla(lines, n, keep, "low_out", start)
    for node in builder.nodes:
        lines.append(
            "  wire n_{0} = in[{1}] ? {2} : {3};".format(
                node["id"],
                node["var"],
                edge_expr(node["high"]),
                edge_expr(node["low"]),
            )
        )
    root_by_bit = dict(roots)
    for bit in range(width):
        if bit < keep:
            lines.append("  assign out[{0}] = low_out[{0}];".format(bit))
        else:
            lines.append("  assign out[{0}] = {1};".format(bit, edge_expr(root_by_bit[bit])))
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def append_cmp_square_bit(lines, n, bit, prefix):
    width = 2 * n
    max_q = (1 << (width - bit)) - 1
    ge_names = []
    for q in range(1, max_q + 1):
        threshold = ceil_sqrt(q << bit)
        name = "{0}_ge_{1}".format(prefix, q)
        lines.append("  wire {0} = x >= {1}'d{2};".format(name, n, threshold))
        ge_names.append(name)
    return xor_chain_expr(ge_names)


def render_hybrid_bddtop_cmp_trunc(module, n, bdd_count, cmp_count):
    width = 2 * n
    selected_total = bdd_count + cmp_count
    keep = width - selected_total
    if keep <= 0:
        return None
    group = 8 if n == 14 else 6 if n == 16 else low_square_group(n)
    bdd_start = width - bdd_count
    order = list(reversed(range(n)))
    builder = SharedBddBuilder(order)
    roots = []
    for bit in range(bdd_start, width):
        roots.append((bit, builder.build(square_plane(n, bit, order), 0)))
    lines = header(module, n)
    lines.append("  wire [{0}:0] low_out;".format(keep - 1))
    render_truncated_square_low(lines, n, keep, "low_out", group)
    cmp_exprs = {}
    for bit in range(keep, bdd_start):
        cmp_exprs[bit] = append_cmp_square_bit(lines, n, bit, "cmpb{0}".format(bit))
    for node in builder.nodes:
        lines.append(
            "  wire n_{0} = in[{1}] ? {2} : {3};".format(
                node["id"],
                node["var"],
                edge_expr(node["high"]),
                edge_expr(node["low"]),
            )
        )
    root_by_bit = dict(roots)
    for bit in range(width):
        if bit < keep:
            lines.append("  assign out[{0}] = low_out[{0}];".format(bit))
        elif bit < bdd_start:
            lines.append("  assign out[{0}] = {1};".format(bit, cmp_exprs[bit]))
        else:
            lines.append("  assign out[{0}] = {1};".format(bit, edge_expr(root_by_bit[bit])))
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def render_hybrid_bddtop2_trunc(module, n):
    return render_hybrid_bddtop_trunc(module, n, 2)


def render_hybrid_bddtop3_trunc(module, n):
    return render_hybrid_bddtop_trunc(module, n, 3)


def render_hybrid_bddtop4_trunc(module, n):
    return render_hybrid_bddtop_trunc(module, n, 4)


def render_hybrid_bddtop2_trunc_factored(module, n):
    return render_hybrid_bddtop_trunc_factored(module, n, 2)


def render_hybrid_bddtop3_trunc_factored(module, n):
    return render_hybrid_bddtop_trunc_factored(module, n, 3)


def render_hybrid_bddtop4_trunc_factored(module, n):
    return render_hybrid_bddtop_trunc_factored(module, n, 4)


def render_hybrid_bddtop2_trunc_hcla0(module, n):
    return render_hybrid_bddtop_trunc_hcla(module, n, 2, 0)


def render_hybrid_bddtop2_trunc_hcla4(module, n):
    return render_hybrid_bddtop_trunc_hcla(module, n, 2, 4)


def render_hybrid_bddtop2_trunc_hcla8(module, n):
    return render_hybrid_bddtop_trunc_hcla(module, n, 2, 8)


def render_hybrid_bddtop2_trunc_order_nat(module, n):
    return render_hybrid_bddtop_order(module, n, 2, "nat", trunc=True)


def render_hybrid_bddtop2_trunc_order_outside(module, n):
    return render_hybrid_bddtop_order(module, n, 2, "outside", trunc=True)


def render_hybrid_bddtop2_trunc_order_center(module, n):
    return render_hybrid_bddtop_order(module, n, 2, "center", trunc=True)


def render_hybrid_bddtop3_trunc_hcla0(module, n):
    return render_hybrid_bddtop_trunc_hcla(module, n, 3, 0)


def render_hybrid_bddtop3_trunc_hcla4(module, n):
    return render_hybrid_bddtop_trunc_hcla(module, n, 3, 4)


def render_hybrid_bddtop3_trunc_hcla8(module, n):
    return render_hybrid_bddtop_trunc_hcla(module, n, 3, 8)


def render_hybrid_bddtop3_trunc_order_nat(module, n):
    return render_hybrid_bddtop_order(module, n, 3, "nat", trunc=True)


def render_hybrid_bddtop3_trunc_order_outside(module, n):
    return render_hybrid_bddtop_order(module, n, 3, "outside", trunc=True)


def render_hybrid_bddtop3_trunc_order_center(module, n):
    return render_hybrid_bddtop_order(module, n, 3, "center", trunc=True)


def render_hybrid_bddtop4_trunc_hcla0(module, n):
    return render_hybrid_bddtop_trunc_hcla(module, n, 4, 0)


def render_hybrid_bddtop4_trunc_hcla4(module, n):
    return render_hybrid_bddtop_trunc_hcla(module, n, 4, 4)


def render_hybrid_bddtop4_trunc_hcla8(module, n):
    return render_hybrid_bddtop_trunc_hcla(module, n, 4, 8)


def render_hybrid_bddtop4_trunc_order_nat(module, n):
    return render_hybrid_bddtop_order(module, n, 4, "nat", trunc=True)


def render_hybrid_bddtop4_trunc_order_outside(module, n):
    return render_hybrid_bddtop_order(module, n, 4, "outside", trunc=True)


def render_hybrid_bddtop4_trunc_order_center(module, n):
    return render_hybrid_bddtop_order(module, n, 4, "center", trunc=True)


def render_hybrid_bddtop2_cmp1_trunc(module, n):
    return render_hybrid_bddtop_cmp_trunc(module, n, 2, 1)


def render_hybrid_bddtop2_cmp2_trunc(module, n):
    return render_hybrid_bddtop_cmp_trunc(module, n, 2, 2)


def render_hybrid_bddtop3_cmp1_trunc(module, n):
    return render_hybrid_bddtop_cmp_trunc(module, n, 3, 1)


def render_hybrid_bddtop4_cmp1_trunc(module, n):
    return render_hybrid_bddtop_cmp_trunc(module, n, 4, 1)


def render_hybrid_bddtop4_cmp2_trunc(module, n):
    return render_hybrid_bddtop_cmp_trunc(module, n, 4, 2)


def append_truncated_square_colcsel(lines, n, keep, out_name, block_size, carry_bits=4):
    columns = [[] for _ in range(keep)]
    for i in range(n):
        col = 2 * i
        if col < keep:
            columns[col].append("x[{0}]".format(i))
    for i in range(n):
        for j in range(i + 1, n):
            col = i + j + 1
            if col < keep:
                name = "kpp_{0}_{1}".format(i, j)
                lines.append("  wire {0} = x[{1}] & x[{2}];".format(name, i, j))
                columns[col].append(name)

    lines.append("  wire [{0}:0] {1};".format(keep - 1, out_name))
    carry_states = 1 << carry_bits
    sum_bits = carry_bits + 2
    block_count = (keep + block_size - 1) // block_size
    lines.append("  wire [{0}:0] blk_carry_0 = {1}'b0;".format(carry_bits - 1, carry_bits))
    for block in range(block_count):
        start = block * block_size
        end = min(keep, start + block_size)
        size = end - start
        for state in range(carry_states):
            carry_name = "{0}_b{1}_s{2}_c0".format(out_name, block, state)
            lines.append("  wire [{0}:0] {1} = {2}'d{3};".format(carry_bits - 1, carry_name, carry_bits, state))
            bit_names = []
            current_carry = carry_name
            for col in range(start, end):
                terms = [current_carry]
                terms.extend(columns[col])
                sum_name = "{0}_b{1}_s{2}_sum{3}".format(out_name, block, state, col - start)
                next_carry = "{0}_b{1}_s{2}_c{3}".format(out_name, block, state, col - start + 1)
                lines.append("  wire [{0}:0] {1} = {2};".format(sum_bits - 1, sum_name, " + ".join(terms)))
                bit_names.append("{0}[0]".format(sum_name))
                lines.append("  wire [{0}:0] {1} = {2}[{3}:1];".format(carry_bits - 1, next_carry, sum_name, carry_bits))
                current_carry = next_carry
            pack = "{0}_b{1}_s{2}_pack".format(out_name, block, state)
            lines.append(
                "  wire [{0}:0] {1} = {{{2}, {3}}};".format(
                    carry_bits + size - 1,
                    pack,
                    current_carry,
                    ", ".join(reversed(bit_names)),
                )
            )
        pick = "{0}_b{1}_pick".format(out_name, block)
        lines.append("  reg [{0}:0] {1};".format(carry_bits + size - 1, pick))
        lines.append("  always @* begin")
        lines.append("    case (blk_carry_{0})".format(block))
        for state in range(carry_states):
            lines.append("      {0}'d{1}: {2} = {3}_b{4}_s{1}_pack;".format(carry_bits, state, pick, out_name, block))
        lines.append("      default: {0} = {1}'b0;".format(pick, carry_bits + size))
        lines.append("    endcase")
        lines.append("  end")
        lines.append("  wire [{0}:0] blk_carry_{1} = {2}[{3}:{4}];".format(carry_bits - 1, block + 1, pick, carry_bits + size - 1, size))
        for offset in range(size):
            lines.append("  assign {0}[{1}] = {2}[{3}];".format(out_name, start + offset, pick, offset))


def render_hybrid_bddtop_colcsel(module, n, top_count, block_size):
    width = 2 * n
    keep = width - top_count
    if keep <= 0:
        return None
    order = list(reversed(range(n)))
    builder = SharedBddBuilder(order)
    roots = []
    for bit in range(keep, width):
        roots.append((bit, builder.build(square_plane(n, bit, order), 0)))
    lines = header(module, n)
    append_truncated_square_colcsel(lines, n, keep, "low_out", block_size)
    for node in builder.nodes:
        lines.append(
            "  wire n_{0} = in[{1}] ? {2} : {3};".format(
                node["id"],
                node["var"],
                edge_expr(node["high"]),
                edge_expr(node["low"]),
            )
        )
    root_by_bit = dict(roots)
    for bit in range(width):
        if bit < keep:
            lines.append("  assign out[{0}] = low_out[{0}];".format(bit))
        else:
            lines.append("  assign out[{0}] = {1};".format(bit, edge_expr(root_by_bit[bit])))
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def render_hybrid_bddtop2_colcsel4(module, n):
    return render_hybrid_bddtop_colcsel(module, n, 2, 4)


def render_hybrid_bddtop2_colcsel5(module, n):
    return render_hybrid_bddtop_colcsel(module, n, 2, 5)


def render_hybrid_bddtop2_colcsel6(module, n):
    return render_hybrid_bddtop_colcsel(module, n, 2, 6)


def render_hybrid_bddtop3_colcsel4(module, n):
    return render_hybrid_bddtop_colcsel(module, n, 3, 4)


def render_hybrid_bddtop3_colcsel5(module, n):
    return render_hybrid_bddtop_colcsel(module, n, 3, 5)


def render_hybrid_bddtop3_colcsel6(module, n):
    return render_hybrid_bddtop_colcsel(module, n, 3, 6)


def render_hybrid_bddtop4_colcsel4(module, n):
    return render_hybrid_bddtop_colcsel(module, n, 4, 4)


def render_hybrid_bddtop4_colcsel5(module, n):
    return render_hybrid_bddtop_colcsel(module, n, 4, 5)


def render_hybrid_bddtop4_colcsel6(module, n):
    return render_hybrid_bddtop_colcsel(module, n, 4, 6)


def ceil_sqrt(value):
    if value <= 1:
        return value
    lo = 0
    hi = 1 << ((value.bit_length() + 1) // 2)
    while lo < hi:
        mid = (lo + hi) // 2
        if mid * mid >= value:
            hi = mid
        else:
            lo = mid + 1
    return lo


def xor_chain_expr(items):
    items = list(items)
    if not items:
        return "1'b0"
    current = items
    while len(current) > 1:
        nxt = []
        for index in range(0, len(current), 2):
            if index + 1 < len(current):
                nxt.append("({0} ^ {1})".format(current[index], current[index + 1]))
            else:
                nxt.append(current[index])
        current = nxt
    return current[0]


def render_hybrid_cmptop_trunc(module, n, top_count, group_override=None):
    width = 2 * n
    keep = width - top_count
    if keep <= 0:
        return None
    group = group_override or (8 if n == 14 else 6 if n == 16 else low_square_group(n))
    lines = header(module, n)
    lines.append("  wire [{0}:0] low_out;".format(keep - 1))
    render_truncated_square_low(lines, n, keep, "low_out", group)
    for q in range(1, 1 << top_count):
        threshold = ceil_sqrt(q << keep)
        lines.append("  wire ge_top_{0} = x >= {1}'d{2};".format(q, n, threshold))
    for bit in range(width):
        if bit < keep:
            lines.append("  assign out[{0}] = low_out[{0}];".format(bit))
        else:
            rel_bit = bit - keep
            step = 1 << rel_bit
            terms = ["ge_top_{0}".format(q) for q in range(step, 1 << top_count, step)]
            lines.append("  assign out[{0}] = {1};".format(bit, xor_chain_expr(terms)))
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def render_hybrid_cmptop1_trunc(module, n):
    return render_hybrid_cmptop_trunc(module, n, 1)


def render_hybrid_cmptop2_trunc(module, n):
    return render_hybrid_cmptop_trunc(module, n, 2)


def render_hybrid_cmptop3_trunc(module, n):
    return render_hybrid_cmptop_trunc(module, n, 3)


def render_hybrid_cmptop4_trunc(module, n):
    return render_hybrid_cmptop_trunc(module, n, 4)


def render_hybrid_cmptop5_trunc(module, n):
    return render_hybrid_cmptop_trunc(module, n, 5)


def render_hybrid_cmptop6_trunc(module, n):
    return render_hybrid_cmptop_trunc(module, n, 6)


def range_tree_expr(n, keep, width_bits, lo, hi):
    if lo == hi:
        return "{0}'d{1}".format(width_bits, lo)
    mid = (lo + hi + 1) // 2
    threshold = ceil_sqrt(mid << keep)
    high = range_tree_expr(n, keep, width_bits, mid, hi)
    low = range_tree_expr(n, keep, width_bits, lo, mid - 1)
    return "(x >= {0}'d{1} ? {2} : {3})".format(n, threshold, high, low)


def render_hybrid_rangetop_trunc(module, n, top_count):
    width = 2 * n
    keep = width - top_count
    if keep <= 0:
        return None
    group = 8 if n == 14 else 6 if n == 16 else low_square_group(n)
    lines = header(module, n)
    lines.append("  wire [{0}:0] low_out;".format(keep - 1))
    render_truncated_square_low(lines, n, keep, "low_out", group)
    lines.append("  wire [{0}:0] top_value = {1};".format(top_count - 1, range_tree_expr(n, keep, top_count, 0, (1 << top_count) - 1)))
    for bit in range(width):
        if bit < keep:
            lines.append("  assign out[{0}] = low_out[{0}];".format(bit))
        else:
            lines.append("  assign out[{0}] = top_value[{1}];".format(bit, bit - keep))
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def render_hybrid_rangetop2_trunc(module, n):
    return render_hybrid_rangetop_trunc(module, n, 2)


def render_hybrid_rangetop3_trunc(module, n):
    return render_hybrid_rangetop_trunc(module, n, 3)


def render_hybrid_rangetop4_trunc(module, n):
    return render_hybrid_rangetop_trunc(module, n, 4)


def render_hybrid_rangetop5_trunc(module, n):
    return render_hybrid_rangetop_trunc(module, n, 5)


def render_hybrid_bddtop2_trunc_csel5(module, n):
    return render_hybrid_bddtop_trunc(module, n, 2, 5)


def render_hybrid_bddtop2_trunc_csel7(module, n):
    return render_hybrid_bddtop_trunc(module, n, 2, 7)


def render_hybrid_bddtop2_trunc_csel8(module, n):
    return render_hybrid_bddtop_trunc(module, n, 2, 8)


def render_hybrid_bddtop2_trunc_csel2(module, n):
    return render_hybrid_bddtop_trunc(module, n, 2, 2)


def render_hybrid_bddtop2_trunc_csel3(module, n):
    return render_hybrid_bddtop_trunc(module, n, 2, 3)


def render_hybrid_bddtop2_trunc_csel4(module, n):
    return render_hybrid_bddtop_trunc(module, n, 2, 4)


def render_hybrid_bddtop2_trunc_csel10(module, n):
    return render_hybrid_bddtop_trunc(module, n, 2, 10)


def render_hybrid_bddtop2_trunc_csel12(module, n):
    return render_hybrid_bddtop_trunc(module, n, 2, 12)


def render_hybrid_bddtop3_trunc_csel5(module, n):
    return render_hybrid_bddtop_trunc(module, n, 3, 5)


def render_hybrid_bddtop3_trunc_csel7(module, n):
    return render_hybrid_bddtop_trunc(module, n, 3, 7)


def render_hybrid_bddtop3_trunc_csel8(module, n):
    return render_hybrid_bddtop_trunc(module, n, 3, 8)


def render_hybrid_bddtop3_trunc_csel2(module, n):
    return render_hybrid_bddtop_trunc(module, n, 3, 2)


def render_hybrid_bddtop3_trunc_csel3(module, n):
    return render_hybrid_bddtop_trunc(module, n, 3, 3)


def render_hybrid_bddtop3_trunc_csel4(module, n):
    return render_hybrid_bddtop_trunc(module, n, 3, 4)


def render_hybrid_bddtop3_trunc_csel10(module, n):
    return render_hybrid_bddtop_trunc(module, n, 3, 10)


def render_hybrid_bddtop3_trunc_csel12(module, n):
    return render_hybrid_bddtop_trunc(module, n, 3, 12)


def render_hybrid_bddtop4_trunc_csel5(module, n):
    return render_hybrid_bddtop_trunc(module, n, 4, 5)


def render_hybrid_bddtop4_trunc_csel7(module, n):
    return render_hybrid_bddtop_trunc(module, n, 4, 7)


def render_hybrid_bddtop4_trunc_csel8(module, n):
    return render_hybrid_bddtop_trunc(module, n, 4, 8)


def render_hybrid_bddtop4_trunc_csel2(module, n):
    return render_hybrid_bddtop_trunc(module, n, 4, 2)


def render_hybrid_bddtop4_trunc_csel3(module, n):
    return render_hybrid_bddtop_trunc(module, n, 4, 3)


def render_hybrid_bddtop4_trunc_csel4(module, n):
    return render_hybrid_bddtop_trunc(module, n, 4, 4)


def render_hybrid_bddtop4_trunc_csel10(module, n):
    return render_hybrid_bddtop_trunc(module, n, 4, 10)


def render_hybrid_bddtop4_trunc_csel12(module, n):
    return render_hybrid_bddtop_trunc(module, n, 4, 12)


def render_hybrid_bddtop2_csel4(module, n):
    return render_hybrid_bddtop(module, n, 2, 4)


def render_hybrid_bddtop2_csel5(module, n):
    return render_hybrid_bddtop(module, n, 2, 5)


def render_hybrid_bddtop2_csel8(module, n):
    return render_hybrid_bddtop(module, n, 2, 8)


def render_hybrid_bddtop3_csel4(module, n):
    return render_hybrid_bddtop(module, n, 3, 4)


def render_hybrid_bddtop3_csel5(module, n):
    return render_hybrid_bddtop(module, n, 3, 5)


def render_hybrid_bddtop3_csel8(module, n):
    return render_hybrid_bddtop(module, n, 3, 8)


def render_hybrid_bddtop4_csel4(module, n):
    return render_hybrid_bddtop(module, n, 4, 4)


def render_hybrid_bddtop4_csel5(module, n):
    return render_hybrid_bddtop(module, n, 4, 5)


def render_hybrid_bddtop4_csel6(module, n):
    return render_hybrid_bddtop(module, n, 4, 6)


def render_hybrid_bddrel(module, n, relbits):
    width = 2 * n
    return render_hybrid_bddbits(module, n, [width - 1 - rel for rel in relbits])


def render_hybrid_bddrel1(module, n):
    return render_hybrid_bddrel(module, n, [1])


def render_hybrid_bddrel2(module, n):
    return render_hybrid_bddrel(module, n, [2])


def render_hybrid_bddrel3(module, n):
    return render_hybrid_bddrel(module, n, [3])


def render_hybrid_bddrel02(module, n):
    return render_hybrid_bddrel(module, n, [0, 2])


def render_hybrid_bddrel03(module, n):
    return render_hybrid_bddrel(module, n, [0, 3])


def render_hybrid_bddrel12(module, n):
    return render_hybrid_bddrel(module, n, [1, 2])


def render_hybrid_bddrel13(module, n):
    return render_hybrid_bddrel(module, n, [1, 3])


def render_hybrid_bddrel23(module, n):
    return render_hybrid_bddrel(module, n, [2, 3])


def render_hybrid_bddrel013(module, n):
    return render_hybrid_bddrel(module, n, [0, 1, 3])


def render_hybrid_bddrel023(module, n):
    return render_hybrid_bddrel(module, n, [0, 2, 3])


def render_hybrid_bddrel123(module, n):
    return render_hybrid_bddrel(module, n, [1, 2, 3])


def render_block_decomp(module, n, block, csel_group):
    if n <= block:
        return None
    width = 2 * n
    blocks = []
    start = 0
    while start < n:
        size = min(block, n - start)
        blocks.append((start, size))
        start += size
    lines = header(module, n)
    term_names = []
    for idx, (offset, size) in enumerate(blocks):
        lines.append("  wire [{0}:0] xb{1} = x[{2}:{3}];".format(size - 1, idx, offset + size - 1, offset))
    for i, (oi, wi) in enumerate(blocks):
        pname = "bp_{0}_{0}".format(i)
        tname = "bt_{0}_{0}".format(i)
        lines.append("  wire [{0}:0] {1} = xb{2} * xb{2};".format(2 * wi - 1, pname, i))
        lines.append("  wire [{0}:0] {1} = {{{2}'b0, {3}}} << {4};".format(width - 1, tname, width - 2 * wi, pname, 2 * oi))
        term_names.append(tname)
    for i, (oi, wi) in enumerate(blocks):
        for j, (oj, wj) in enumerate(blocks):
            if i >= j:
                continue
            pname = "bp_{0}_{1}".format(i, j)
            tname = "bt_{0}_{1}".format(i, j)
            pwidth = wi + wj
            lines.append("  wire [{0}:0] {1} = xb{2} * xb{3};".format(pwidth - 1, pname, i, j))
            lines.append("  wire [{0}:0] {1} = {{{2}'b0, {3}}} << {4};".format(width - 1, tname, width - pwidth, pname, oi + oj + 1))
            term_names.append(tname)
    current = term_names
    stage = 0
    while len(current) > 2:
        nxt = []
        for idx in range(0, len(current), 3):
            group = current[idx : idx + 3]
            if len(group) == 3:
                a, b, c = group
                s = "bd_s_{0}_{1}".format(stage, idx)
                cy = "bd_c_{0}_{1}".format(stage, idx)
                lines.append("  wire [{0}:0] {1} = {2} ^ {3} ^ {4};".format(width - 1, s, a, b, c))
                lines.append("  wire [{0}:0] {1} = (({2} & {3}) | ({2} & {4}) | ({3} & {4})) << 1;".format(width - 1, cy, a, b, c))
                nxt.extend([s, cy])
            else:
                nxt.extend(group)
        current = nxt
        stage += 1
    if len(current) == 1:
        lines.append("  assign out = {0};".format(current[0]))
    else:
        append_carryselect_adder(lines, "out", current[0], current[1], width, csel_group)
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def render_block4_decomp_csel4(module, n):
    return render_block_decomp(module, n, 4, 4)


def render_block4_decomp_csel6(module, n):
    return render_block_decomp(module, n, 4, 6)


def render_block4_decomp_csel8(module, n):
    return render_block_decomp(module, n, 4, 8)


def render_column_count_case_generic(module, n, tight=False):
    width = 2 * n
    carry_width = max(2, (n + 2).bit_length())
    lines = header(module, n)
    columns = square_columns(lines, n)
    lines.append("  reg [{0}:0] out_r;".format(width - 1))
    for col in range(width + 1):
        cw = max(1, carry_width if not tight else min(carry_width, max(1, ((n + 1) >> 1).bit_length() + 1)))
        lines.append("  reg [{0}:0] carry{1};".format(cw - 1, col))
    lines.append("  always @* begin")
    lines.append("    out_r = {0};".format(zero_word(width)))
    lines.append("    carry0 = 1'b0;")
    for col in range(width):
        pp_names = columns[col]
        in_names = ["carry{0}".format(col)] + pp_names
        local_cw = carry_width if not tight else min(carry_width, max(1, (len(pp_names) + 2).bit_length() + 1))
        next_name = "carry{0}".format(col + 1)
        in_width = local_cw + len(pp_names)
        out_width = local_cw + 1
        lines.append("    case ({{{0}}})".format(", ".join(in_names)))
        for carry_value in range(1 << local_cw):
            for pp_value in range(1 << len(pp_names)):
                total = carry_value
                for bit in range(len(pp_names)):
                    if pp_value & (1 << bit):
                        total += 1
                out_bit = total & 1
                carry_out = total >> 1
                key = (carry_value << len(pp_names)) | pp_value
                lines.append(
                    "      {0}'d{1}: {{{2}, out_r[{3}]}} = {4}'d{5};".format(
                        in_width,
                        key,
                        next_name,
                        col,
                        out_width,
                        (carry_out << 1) | out_bit,
                    )
                )
        lines.append("      default: {{{0}, out_r[{1}]}} = {2}'b0;".format(next_name, col, out_width))
        lines.append("    endcase")
    lines.append("  end")
    lines.append("  assign out = out_r;")
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def render_column_count_case(module, n):
    return render_column_count_case_generic(module, n, False)


def render_column_count_case_tight(module, n):
    return render_column_count_case_generic(module, n, True)


def render_full_word_case_small(module, n):
    if n > 10:
        return None
    width = 2 * n
    lines = header(module, n)
    lines.extend(
        [
            "  reg [{0}:0] out_r;".format(width - 1),
            "  always @* begin",
            "    case (x)",
        ]
    )
    for value in range(1 << n):
        lines.append("      {0}'d{1}: out_r = {2};".format(n, value, const(width, value * value)))
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


RENDERERS = {name: globals()["render_" + name] for name in SOURCE_VARIANTS}


FLOW_SCRIPTS = dict(base.FLOW_SCRIPTS)
FLOW_SCRIPTS.update(
    {
        "abc_g_aig_d16": lambda v, m, o: base.script_default(v, m, o, "aig -D 16"),
        "abc_g_aig_d20": lambda v, m, o: base.script_default(v, m, o, "aig -D 20"),
        "abc_g_aig_d24": lambda v, m, o: base.script_default(v, m, o, "aig -D 24"),
        "abc_g_aig_d12": lambda v, m, o: base.script_default(v, m, o, "aig -D 12"),
        "abc_g_aig_d14": lambda v, m, o: base.script_default(v, m, o, "aig -D 14"),
        "synth_preset_d12": lambda v, m, o: base.script_synth_preset(v, m, o, 12),
        "synth_preset_d14": lambda v, m, o: base.script_synth_preset(v, m, o, 14),
        "synth_preset_d16": lambda v, m, o: base.script_synth_preset(v, m, o, 16),
        "synth_preset_d20": lambda v, m, o: base.script_synth_preset(v, m, o, 20),
        "synth_preset_d24": lambda v, m, o: base.script_synth_preset(v, m, o, 24),
        "synth_preset_and": lambda v, m, o: script_synth_preset_and(v, m, o, None),
        "synth_preset_and_d12": lambda v, m, o: script_synth_preset_and(v, m, o, 12),
        "synth_preset_and_d16": lambda v, m, o: script_synth_preset_and(v, m, o, 16),
        "abc_lut3_to_aig": lambda v, m, o: script_abc_lut_to_aig(v, m, o, 3),
        "abc_lut4_to_aig": lambda v, m, o: script_abc_lut_to_aig(v, m, o, 4),
        "abc_lut5_to_aig": lambda v, m, o: script_abc_lut_to_aig(v, m, o, 5),
        "booth_abc_g_aig": lambda v, m, o: script_booth(v, m, o, False),
        "booth_wreduce_abc_g_aig": lambda v, m, o: script_booth(v, m, o, True),
    }
)


def script_synth_preset_and(verilog, module, output, delay_target):
    abc_cmd = "abc -g AND"
    if delay_target is not None:
        abc_cmd += " -D {0}".format(delay_target)
    return "\n".join(
        [
            "read_verilog {0}".format(base.yosys_quote(verilog)),
            "synth -top {0} -flatten".format(module),
            abc_cmd,
            "aigmap",
            "opt",
            "clean",
            "write_aiger -symbols {0}".format(base.yosys_quote(output)),
        ]
    ) + "\n"


def script_booth(verilog, module, output, wreduce):
    lines = [
        "read_verilog {0}".format(base.yosys_quote(verilog)),
        "hierarchy -check -top {0}".format(module),
        "proc",
        "flatten",
        "tribuf -logic",
        "deminout",
        "opt",
    ]
    if wreduce:
        lines.extend(["wreduce", "opt_expr", "opt_reduce", "opt_muxtree", "opt"])
    lines.extend(
        [
            "booth",
            "opt",
            "memory",
            "opt",
            "techmap",
            "opt",
            "abc -g aig",
            "opt",
            "aigmap",
            "opt",
            "clean",
            "write_aiger -symbols {0}".format(base.yosys_quote(output)),
        ]
    )
    return "\n".join(lines) + "\n"


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


def empty_row(case, candidate_id, source_variant, flow, verilog_path, aig_path, semantic_ok, semantic_note, refs):
    row = {
        "case": case,
        "candidate_id": candidate_id,
        "hypothesis": "unsigned_square_x_times_x",
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
        "classification": "square_specific_structural_rtl" if source_variant != "direct_square" else "semantic_rtl",
        "notes": semantic_note,
    }
    return row


def run_case(args, case, source_variants, flow_variants, refs):
    table = TruthTable(args.benchmarks / "{0}.truth".format(case))
    semantic_ok, semantic_note = verify_semantics(case, table)
    n = case_width(case)
    rows = []
    manifest = {
        "case": case,
        "truth": rel(args.benchmarks / "{0}.truth".format(case)),
        "input_width": table.input_width,
        "output_width": table.output_width,
        "constant_bits": table.constant_bits(),
        "semantic": semantic_note,
        "sources": [],
        "candidates": [],
    }

    for source_variant in source_variants:
        renderer = RENDERERS[source_variant]
        module = "{0}_square_{1}".format(case, source_variant)
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
        "Purpose: frontend-only square-specific structures for `ex270-ex274`.",
        "",
        "Inputs:",
        "- Truth files: `benchmarks/ex270.truth` through `benchmarks/ex274.truth`",
        "- Previous notes: `student/cases/ex255_ex279_integer_arithmetic/README.md`",
        "- Generator/script: `student/generators/integer_ex270_ex274_square_frontend.py`",
        "",
        "Artifacts:",
        "- Work directory: `{0}`".format(rel(args.work_dir)),
        "- Candidates CSV: `{0}`".format(rel(args.results_dir / "candidates.csv")),
        "- Best CSV: `{0}`".format(rel(args.results_dir / "best.csv")),
        "- Summary CSV: `{0}`".format(rel(args.results_dir / "summary.csv")),
        "",
        "Methods tried:",
        "- Exact unsigned square semantics verified from truth tables.",
        "- Direct square, triangular partial-product sums, square-only Wallace/Dadda compression, hybrid prefix final adders, and low/high decompositions.",
        "- Limited Yosys frontend synthflow and `abc -g aig` delay settings only.",
        "",
        "Best result:",
        "- See `results/best.csv`.",
        "",
        "Notes:",
        "- Every retained AIG row is checked with ABC CEC against `read_truth -xf` through `evaluate_aig`.",
        "- No backend optimization portfolio was run.",
        "- No seed bundle was curated for this partial class batch.",
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
    parser.add_argument("--run-id", default="ex270_ex274_frontend_square_structures_20260609_1138")
    parser.add_argument("--cases", default="ex270,ex271,ex272,ex273,ex274")
    parser.add_argument("--sources", default="all")
    parser.add_argument("--flows", default="abc_g_aig,wreduce_abc_g_aig,arith_wreduce_aig,synth_preset,synth_preset_d20")
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
    args.work_dir = args.work_dir or (ROOT / "student" / "work" / args.run_id)
    args.runs_dir = args.runs_dir or (ROOT / "student" / "runs" / "integer" / args.run_id)
    args.results_dir = args.runs_dir / "results"
    refs = load_reference(ROOT / "reference_result.csv")

    all_rows = []
    for case in cases:
        all_rows.extend(run_case(args, case, sources, flows, refs))

    equivalent_rows = [row for row in all_rows if row.get("equivalent") == "1" and row.get("adp")]
    best = {}
    for row in equivalent_rows:
        case = row["case"]
        if case not in best or int(row["adp"]) < int(best[case]["adp"]):
            best[case] = row
    best_rows = [best[case] for case in sorted(best)]

    write_csv(args.results_dir / "candidates.csv", RESULT_FIELDNAMES, all_rows)
    write_csv(args.results_dir / "best.csv", BEST_FIELDNAMES, best_rows)
    write_csv(args.results_dir / "summary.csv", BEST_FIELDNAMES, best_rows)
    write_csv(args.results_dir / "evaluate_check.csv", RESULT_FIELDNAMES, equivalent_rows)
    write_manifest(args, all_rows, best_rows)
    print("wrote {0} candidates, {1} equivalent, {2} best rows".format(len(all_rows), len(equivalent_rows), len(best_rows)))
    for row in best_rows:
        print("{case} {candidate_id} area={area} delay={delay} adp={adp} ratio={adp_ratio_to_reference}".format(**row))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
