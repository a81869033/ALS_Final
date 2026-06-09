#!/usr/bin/env python3
"""Frontend-only integer square-root structures for ex275-ex279."""

import argparse
import csv
import functools
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


CASES = ("ex275", "ex276", "ex277", "ex278", "ex279")

SOURCE_VARIANTS = (
    "direct_loop",
    "threshold_chain",
    "threshold_xor",
    "threshold_popcount",
    "bit_interval_or",
    "range_tree",
    "restoring_proc",
    "restoring_wires",
    "prefix2_range",
    "prefix3_range",
    "prefix4_range",
    "prefix5_range",
    "prefix6_range",
    "prefix7_range",
    "prefix8_range",
    "prefix3_delta",
    "prefix4_delta",
    "prefix5_delta",
    "prefix6_delta",
    "prefix3_bitwise",
    "prefix4_bitwise",
    "prefix5_bitwise",
    "prefix6_bitwise",
    "prefix3_ge_bitwise",
    "prefix4_ge_bitwise",
    "prefix5_ge_bitwise",
    "prefix6_ge_bitwise",
    "prefix3_ge_tree_msb",
    "prefix4_ge_tree_msb",
    "prefix5_ge_tree_msb",
    "prefix6_ge_tree_msb",
    "prefix3_ge_tree_lsb",
    "prefix4_ge_tree_lsb",
    "prefix5_ge_tree_lsb",
    "prefix6_ge_tree_lsb",
    "mix_p4_p5_p5b0",
    "mix_p4_p5_p5b1",
    "mix_p4_p5_p5b2",
    "mix_p4_p5_p5b3",
    "mix_p4_p5_p5b4",
    "mix_p4_p5_p5low2",
    "mix_p4_p5_p5high2",
    "mix_p4_p5_p5even",
    "mix_p4_p5_p5odd",
    "supporthi1_p4ge",
    "supporthi2_p4ge",
    "supporthi3_p4ge",
    "anfhi1_p4ge",
    "anfhi2_p4ge",
    "anfhi3_p4ge",
    "prefix4_refine0_ge",
    "prefix4_refine01_ge",
    "prefix4_refine03_ge",
    "prefix3_bitwise_oh",
    "prefix4_bitwise_oh",
    "prefix5_bitwise_oh",
    "support_interval_or",
    "support_threshold_xor",
    "qm_sop",
    "high1_bdd_outside",
    "high2_bdd_outside",
    "high3_bdd_outside",
    "high1_bdd_reverse",
    "high2_bdd_reverse",
    "high3_bdd_reverse",
    "cofbdd2_reverse",
    "cofbdd3_reverse",
    "cofbdd4_reverse",
    "cofbdd5_reverse",
    "cofbdd6_reverse",
    "low2_cofbdd5_anfhi",
    "low2_cofbdd6_anfhi",
    "low3_cofbdd5_anfhi",
    "low3_cofbdd6_anfhi",
    "radix4_wires",
    "radix8_wires",
    "radix4_prio",
    "radix8_prio",
    "radix16_prio",
    "full_case_small",
    "bdd_natural",
    "bdd_reverse",
    "bdd_outside",
    "bdd_center",
    "bdd_swapmsb",
    "bdd_lowmix",
    "bdd_lowmix2",
    "bdd_lowmix_revtail",
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
    "synth_preset_d6",
    "synth_preset_d8",
    "synth_preset_d10",
    "synth_preset_d12",
    "synth_preset_d16",
    "abc_g_aig_d6",
    "abc_g_aig_d8",
    "abc_g_aig_d10",
    "abc_g_AND",
    "abc_g_NAND",
    "abc_g_NOR",
    "abc_g_OR",
    "abc_g_XOR",
    "abc_g_MUX",
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
    return "{0}'d{1}".format(width, value)


def zero_word(width):
    return "{0}'b0".format(width)


def range_decl(width):
    if width <= 1:
        return ""
    return "[{0}:0] ".format(width - 1)


def isqrt(value):
    if value <= 0:
        return 0
    lo = 0
    hi = 1 << ((value.bit_length() + 1) // 2)
    while lo < hi:
        mid = (lo + hi + 1) // 2
        if mid * mid <= value:
            lo = mid
        else:
            hi = mid - 1
    return lo


def case_output_width(case):
    return int(case[2:]) - 271


def case_input_width(case):
    return 2 * case_output_width(case)


def isqrt_model(index, output_width):
    return isqrt(index) & ((1 << output_width) - 1)


def verify_semantics(case, table):
    input_width = case_input_width(case)
    output_width = case_output_width(case)
    if table.input_width != input_width or table.output_width != output_width:
        return False, "unexpected widths input={0} output={1} expected={2}->{3}".format(
            table.input_width,
            table.output_width,
            input_width,
            output_width,
        )
    for index, expected in enumerate(table.iter_outputs()):
        actual = isqrt_model(index, output_width)
        if actual != expected:
            return False, "mismatch index={0} expected=0x{1:x} actual=0x{2:x}".format(index, expected, actual)
    return True, "exact unsigned floor isqrt over {0} inputs".format(table.num_inputs)


def header(module, input_width, output_width):
    return [
        "module {0}(in, out);".format(module),
        "  input {0}in;".format(range_decl(input_width)),
        "  output {0}out;".format(range_decl(output_width)),
    ]


def xor_chain(items):
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


def or_chain(items):
    items = list(items)
    if not items:
        return "1'b0"
    current = items
    while len(current) > 1:
        nxt = []
        for index in range(0, len(current), 2):
            if index + 1 < len(current):
                nxt.append("({0} | {1})".format(current[index], current[index + 1]))
            else:
                nxt.append(current[index])
        current = nxt
    return current[0]


def range_tree_expr(var_expr, var_width, output_width, qlo, qhi, base):
    if qlo >= qhi:
        return const(output_width, qlo)
    mid = (qlo + qhi + 1) // 2
    threshold = mid * mid - base
    high = range_tree_expr(var_expr, var_width, output_width, mid, qhi, base)
    low = range_tree_expr(var_expr, var_width, output_width, qlo, mid - 1, base)
    if threshold <= 0:
        return high
    if threshold >= (1 << var_width):
        return low
    return "({0} >= {1} ? {2} : {3})".format(var_expr, const(var_width, threshold), high, low)


def render_direct_loop(module, input_width, output_width):
    lines = header(module, input_width, output_width)
    lines.extend(
        [
            "  reg [{0}:0] out_r;".format(output_width - 1),
            "  reg [{0}:0] cand;".format(output_width - 1),
            "  reg [{0}:0] cand_ext;".format(input_width - 1),
            "  reg [{0}:0] square;".format(input_width - 1),
            "  integer i;",
            "  always @* begin",
            "    out_r = {0};".format(zero_word(output_width)),
            "    cand = {0};".format(zero_word(output_width)),
            "    cand_ext = {0};".format(zero_word(input_width)),
            "    square = {0};".format(zero_word(input_width)),
            "    for (i = {0}; i >= 0; i = i - 1) begin".format(output_width - 1),
            "      cand = out_r | ({0}'b1 << i);".format(output_width),
            "      cand_ext = {{ {0}'b0, cand }};".format(input_width - output_width),
            "      square = cand_ext * cand_ext;",
            "      if (square <= in)",
            "        out_r = cand;",
            "    end",
            "  end",
            "  assign out = out_r;",
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


def render_threshold_chain(module, input_width, output_width):
    lines = header(module, input_width, output_width)
    lines.extend(
        [
            "  reg [{0}:0] out_r;".format(output_width - 1),
            "  always @* begin",
            "    out_r = {0};".format(zero_word(output_width)),
        ]
    )
    for value in range(1, 1 << output_width):
        lines.append("    if (in >= {0}) out_r = {1};".format(const(input_width, value * value), const(output_width, value)))
    lines.extend(["  end", "  assign out = out_r;", "endmodule", ""])
    return "\n".join(lines)


def render_threshold_xor(module, input_width, output_width):
    lines = header(module, input_width, output_width)
    max_value = (1 << output_width) - 1
    for value in range(1, max_value + 1):
        lines.append("  wire ge_{0} = in >= {1};".format(value, const(input_width, value * value)))
    for bit in range(output_width):
        step = 1 << bit
        terms = ["ge_{0}".format(value) for value in range(step, max_value + 1, step)]
        lines.append("  assign out[{0}] = {1};".format(bit, xor_chain(terms)))
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def balanced_sum_expr(items):
    items = list(items)
    if not items:
        return None
    current = items
    while len(current) > 1:
        nxt = []
        for index in range(0, len(current), 2):
            if index + 1 < len(current):
                nxt.append("({0} + {1})".format(current[index], current[index + 1]))
            else:
                nxt.append(current[index])
        current = nxt
    return current[0]


def render_threshold_popcount(module, input_width, output_width):
    lines = header(module, input_width, output_width)
    max_value = (1 << output_width) - 1
    terms = []
    for value in range(1, max_value + 1):
        lines.append("  wire ge_{0} = in >= {1};".format(value, const(input_width, value * value)))
        terms.append("{{{0}'b0, ge_{1}}}".format(output_width - 1, value))
    lines.append("  assign out = {0};".format(balanced_sum_expr(terms)))
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def interval_pred(input_width, lo, hi):
    max_input = (1 << input_width) - 1
    if lo <= 0 and hi >= max_input:
        return "1'b1"
    if lo <= 0:
        return "(in <= {0})".format(const(input_width, hi))
    if hi >= max_input:
        return "(in >= {0})".format(const(input_width, lo))
    return "((in >= {0}) & (in <= {1}))".format(const(input_width, lo), const(input_width, hi))


def render_bit_interval_or(module, input_width, output_width):
    lines = header(module, input_width, output_width)
    max_q = (1 << output_width) - 1
    max_input = (1 << input_width) - 1
    for bit in range(output_width):
        intervals = []
        start = None
        for q in range(max_q + 1):
            if (q >> bit) & 1:
                if start is None:
                    start = q
            elif start is not None:
                intervals.append((start, q - 1))
                start = None
        if start is not None:
            intervals.append((start, max_q))
        terms = []
        for qlo, qhi in intervals:
            lo = qlo * qlo
            hi = min(max_input, (qhi + 1) * (qhi + 1) - 1)
            terms.append(interval_pred(input_width, lo, hi))
        lines.append("  assign out[{0}] = {1};".format(bit, or_chain(terms)))
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def render_range_tree(module, input_width, output_width):
    lines = header(module, input_width, output_width)
    expr = range_tree_expr("in", input_width, output_width, 0, (1 << output_width) - 1, 0)
    lines.extend(["  assign out = {0};".format(expr), "endmodule", ""])
    return "\n".join(lines)


def render_restoring_proc(module, input_width, output_width):
    rem_width = input_width + 2
    root_width = output_width + 1
    lines = header(module, input_width, output_width)
    lines.extend(
        [
            "  reg [{0}:0] rem;".format(rem_width - 1),
            "  reg [{0}:0] root;".format(root_width - 1),
            "  reg [{0}:0] trial;".format(rem_width - 1),
            "  always @* begin",
            "    rem = {0};".format(zero_word(rem_width)),
            "    root = {0};".format(zero_word(root_width)),
            "    trial = {0};".format(zero_word(rem_width)),
        ]
    )
    for pair in range(output_width - 1, -1, -1):
        hi = 2 * pair + 1
        lo = 2 * pair
        lines.extend(
            [
                "    rem = (rem << 2) | {{{0}'b0, in[{1}:{2}]}};".format(rem_width - 2, hi, lo),
                "    root = root << 1;",
                "    trial = (root << 1) | {0};".format(const(rem_width, 1)),
                "    if (rem >= trial) begin",
                "      rem = rem - trial;",
                "      root = root | {0};".format(const(root_width, 1)),
                "    end",
            ]
        )
    lines.extend(["  end", "  assign out = root[{0}:0];".format(output_width - 1), "endmodule", ""])
    return "\n".join(lines)


def render_restoring_wires(module, input_width, output_width):
    rem_width = input_width + 2
    root_width = output_width + 1
    lines = header(module, input_width, output_width)
    lines.append("  wire [{0}:0] rem_0 = {1};".format(rem_width - 1, zero_word(rem_width)))
    lines.append("  wire [{0}:0] root_0 = {1};".format(root_width - 1, zero_word(root_width)))
    stage = 0
    for pair in range(output_width - 1, -1, -1):
        hi = 2 * pair + 1
        lo = 2 * pair
        lines.append("  wire [{0}:0] rem_shift_{1} = (rem_{1} << 2) | {{{2}'b0, in[{3}:{4}]}};".format(rem_width - 1, stage, rem_width - 2, hi, lo))
        lines.append("  wire [{0}:0] root_shift_{1} = root_{1} << 1;".format(root_width - 1, stage))
        lines.append("  wire [{0}:0] trial_{1} = (root_shift_{1} << 1) | {2};".format(rem_width - 1, stage, const(rem_width, 1)))
        lines.append("  wire ge_{0} = rem_shift_{0} >= trial_{0};".format(stage))
        lines.append("  wire [{0}:0] rem_{1} = ge_{2} ? (rem_shift_{2} - trial_{2}) : rem_shift_{2};".format(rem_width - 1, stage + 1, stage))
        lines.append("  wire [{0}:0] root_{1} = root_shift_{2} | {{{3}'b0, ge_{2}}};".format(root_width - 1, stage + 1, stage, root_width - 1))
        stage += 1
    lines.extend(["  assign out = root_{0}[{1}:0];".format(stage, output_width - 1), "endmodule", ""])
    return "\n".join(lines)


def digit_schedule(output_width, max_digit_bits):
    first = output_width % max_digit_bits
    if first == 0:
        first = max_digit_bits
    out = [first]
    remaining = output_width - first
    while remaining > 0:
        out.append(max_digit_bits)
        remaining -= max_digit_bits
    return out


def ternary_digit_expr(prefix, digit_bits):
    max_digit = (1 << digit_bits) - 1
    expr = const(digit_bits, 0)
    for digit in range(1, max_digit + 1):
        expr = "({0}_ge_{1} ? {2} : {3})".format(prefix, digit, const(digit_bits, digit), expr)
    return expr


def trial_select_expr(prefix, rem_width, digit_bits):
    max_digit = (1 << digit_bits) - 1
    expr = const(rem_width, 0)
    for digit in range(1, max_digit + 1):
        expr = "({0}_digit == {1} ? {0}_trial_{2} : {3})".format(
            prefix,
            const(digit_bits, digit),
            digit,
            expr,
        )
    return expr


def trial_select_prio_expr(prefix, rem_width, digit_bits):
    max_digit = (1 << digit_bits) - 1
    expr = const(rem_width, 0)
    for digit in range(1, max_digit + 1):
        expr = "({0}_ge_{1} ? {0}_trial_{1} : {2})".format(prefix, digit, expr)
    return expr


def render_radix_wires(module, input_width, output_width, max_digit_bits, prio_select=False):
    rem_width = input_width + 3
    root_width = output_width + 1
    schedule = digit_schedule(output_width, max_digit_bits)
    lines = header(module, input_width, output_width)
    lines.append("  wire [{0}:0] rem_0 = {1};".format(rem_width - 1, zero_word(rem_width)))
    lines.append("  wire [{0}:0] root_0 = {1};".format(root_width - 1, zero_word(root_width)))
    bit_hi = input_width - 1
    for stage, digit_bits in enumerate(schedule):
        group_width = 2 * digit_bits
        bit_lo = bit_hi - group_width + 1
        prefix = "r{0}".format(stage)
        lines.append("  wire [{0}:0] {1}_rem_shift = (rem_{2} << {3}) | {{{4}'b0, in[{5}:{6}]}};".format(
            rem_width - 1,
            prefix,
            stage,
            group_width,
            rem_width - group_width,
            bit_hi,
            bit_lo,
        ))
        lines.append("  wire [{0}:0] {1}_root_ext = {{{2}'b0, root_{3}}};".format(
            rem_width - 1,
            prefix,
            rem_width - root_width,
            stage,
        ))
        lines.append("  wire [{0}:0] {1}_base = {1}_root_ext << {2};".format(rem_width - 1, prefix, digit_bits + 1))
        for digit in range(1, 1 << digit_bits):
            lines.append("  wire [{0}:0] {1}_trial_{2} = ({1}_base * {3}) + {4};".format(
                rem_width - 1,
                prefix,
                digit,
                const(rem_width, digit),
                const(rem_width, digit * digit),
            ))
            lines.append("  wire {0}_ge_{1} = {0}_rem_shift >= {0}_trial_{1};".format(prefix, digit))
        lines.append("  wire [{0}:0] {1}_digit = {2};".format(digit_bits - 1, prefix, ternary_digit_expr(prefix, digit_bits)))
        if prio_select:
            trial_sel = trial_select_prio_expr(prefix, rem_width, digit_bits)
        else:
            trial_sel = trial_select_expr(prefix, rem_width, digit_bits)
        lines.append("  wire [{0}:0] {1}_trial_sel = {2};".format(rem_width - 1, prefix, trial_sel))
        lines.append("  wire [{0}:0] rem_{1} = {2}_rem_shift - {2}_trial_sel;".format(rem_width - 1, stage + 1, prefix))
        lines.append("  wire [{0}:0] root_{1} = (root_{2} << {3}) | {{{4}'b0, {5}_digit}};".format(
            root_width - 1,
            stage + 1,
            stage,
            digit_bits,
            root_width - digit_bits,
            prefix,
        ))
        bit_hi = bit_lo - 1
    lines.extend(["  assign out = root_{0}[{1}:0];".format(len(schedule), output_width - 1), "endmodule", ""])
    return "\n".join(lines)


def render_prefix_range(module, input_width, output_width, prefix_bits):
    if prefix_bits <= 0 or prefix_bits >= input_width:
        return None
    low_width = input_width - prefix_bits
    lines = header(module, input_width, output_width)
    lines.append("  wire [{0}:0] hi = in[{1}:{2}];".format(prefix_bits - 1, input_width - 1, low_width))
    lines.append("  wire [{0}:0] lo = in[{0}:0];".format(low_width - 1))
    lines.append("  reg [{0}:0] out_r;".format(output_width - 1))
    lines.append("  always @* begin")
    lines.append("    case (hi)")
    max_lo = (1 << low_width) - 1
    for high in range(1 << prefix_bits):
        base_value = high << low_width
        qlo = isqrt(base_value)
        qhi = isqrt(base_value + max_lo)
        expr = range_tree_expr("lo", low_width, output_width, qlo, qhi, base_value)
        lines.append("      {0}: out_r = {1};".format(const(prefix_bits, high), expr))
    lines.append("      default: out_r = {0};".format(zero_word(output_width)))
    lines.extend(["    endcase", "  end", "  assign out = out_r;", "endmodule", ""])
    return "\n".join(lines)


def local_delta_expr(var_expr, var_width, output_width, base_q, qhi, base_value):
    delta_max = qhi - base_q
    if delta_max <= 0:
        return const(output_width, base_q)
    terms = []
    for delta in range(1, delta_max + 1):
        threshold = (base_q + delta) * (base_q + delta) - base_value
        if threshold <= 0:
            terms.append(const(output_width, 1))
        elif threshold >= (1 << var_width):
            terms.append(zero_word(output_width))
        else:
            terms.append("{{{0}'b0, ({1} >= {2})}}".format(output_width - 1, var_expr, const(var_width, threshold)))
    delta_expr = balanced_sum_expr(terms)
    if base_q == 0:
        return delta_expr
    return "({0} + {1})".format(const(output_width, base_q), delta_expr)


def render_prefix_delta(module, input_width, output_width, prefix_bits):
    if prefix_bits <= 0 or prefix_bits >= input_width:
        return None
    low_width = input_width - prefix_bits
    lines = header(module, input_width, output_width)
    lines.append("  wire [{0}:0] hi = in[{1}:{2}];".format(prefix_bits - 1, input_width - 1, low_width))
    lines.append("  wire [{0}:0] lo = in[{0}:0];".format(low_width - 1))
    lines.append("  reg [{0}:0] out_r;".format(output_width - 1))
    lines.append("  always @* begin")
    lines.append("    case (hi)")
    max_lo = (1 << low_width) - 1
    for high in range(1 << prefix_bits):
        base_value = high << low_width
        qlo = isqrt(base_value)
        qhi = isqrt(base_value + max_lo)
        expr = local_delta_expr("lo", low_width, output_width, qlo, qhi, base_value)
        lines.append("      {0}: out_r = {1};".format(const(prefix_bits, high), expr))
    lines.append("      default: out_r = {0};".format(zero_word(output_width)))
    lines.extend(["    endcase", "  end", "  assign out = out_r;", "endmodule", ""])
    return "\n".join(lines)


def local_interval_pred(var_expr, var_width, lo, hi):
    max_value = (1 << var_width) - 1
    if lo <= 0 and hi >= max_value:
        return "1'b1"
    if lo <= 0:
        return "({0} <= {1})".format(var_expr, const(var_width, hi))
    if hi >= max_value:
        return "({0} >= {1})".format(var_expr, const(var_width, lo))
    return "(({0} >= {1}) & ({0} <= {2}))".format(var_expr, const(var_width, lo), const(var_width, hi))


def local_bit_expr(var_expr, var_width, output_width, qlo, qhi, base, bit):
    if qlo == qhi:
        return "1'b1" if ((qlo >> bit) & 1) else "1'b0"
    max_lo = (1 << var_width) - 1
    terms = []
    start = None
    for q in range(qlo, qhi + 1):
        if (q >> bit) & 1:
            if start is None:
                start = q
        elif start is not None:
            lo = max(0, start * start - base)
            hi = min(max_lo, q * q - 1 - base)
            terms.append(local_interval_pred(var_expr, var_width, lo, hi))
            start = None
    if start is not None:
        lo = max(0, start * start - base)
        hi = min(max_lo, (qhi + 1) * (qhi + 1) - 1 - base)
        terms.append(local_interval_pred(var_expr, var_width, lo, hi))
    return or_chain(terms)


def render_prefix_bitwise(module, input_width, output_width, prefix_bits):
    if prefix_bits <= 0 or prefix_bits >= input_width:
        return None
    low_width = input_width - prefix_bits
    lines = header(module, input_width, output_width)
    lines.append("  wire [{0}:0] hi = in[{1}:{2}];".format(prefix_bits - 1, input_width - 1, low_width))
    lines.append("  wire [{0}:0] lo = in[{0}:0];".format(low_width - 1))
    lines.append("  reg [{0}:0] out_r;".format(output_width - 1))
    lines.append("  always @* begin")
    lines.append("    out_r = {0};".format(zero_word(output_width)))
    lines.append("    case (hi)")
    max_lo = (1 << low_width) - 1
    for high in range(1 << prefix_bits):
        base_value = high << low_width
        qlo = isqrt(base_value)
        qhi = isqrt(base_value + max_lo)
        lines.append("      {0}: begin".format(const(prefix_bits, high)))
        for bit in range(output_width):
            expr = local_bit_expr("lo", low_width, output_width, qlo, qhi, base_value, bit)
            lines.append("        out_r[{0}] = {1};".format(bit, expr))
        lines.append("      end")
    lines.extend(["      default: out_r = {0};".format(zero_word(output_width)), "    endcase", "  end", "  assign out = out_r;", "endmodule", ""])
    return "\n".join(lines)


def thermometer_range_expr(prefix, lo, hi, max_delta):
    terms = []
    if lo > 0:
        terms.append("{0}_ge_{1}".format(prefix, lo))
    if hi < max_delta:
        terms.append("~{0}_ge_{1}".format(prefix, hi + 1))
    if not terms:
        return "1'b1"
    return "(" + " & ".join(terms) + ")"


def thermometer_bit_expr(prefix, qlo, qhi, bit):
    max_delta = qhi - qlo
    if max_delta <= 0:
        return "1'b1" if ((qlo >> bit) & 1) else "1'b0"
    terms = []
    start = None
    for delta in range(max_delta + 1):
        if ((qlo + delta) >> bit) & 1:
            if start is None:
                start = delta
        elif start is not None:
            terms.append(thermometer_range_expr(prefix, start, delta - 1, max_delta))
            start = None
    if start is not None:
        terms.append(thermometer_range_expr(prefix, start, max_delta, max_delta))
    return or_chain(terms)


def render_prefix_ge_bitwise(module, input_width, output_width, prefix_bits):
    if prefix_bits <= 0 or prefix_bits >= input_width:
        return None
    low_width = input_width - prefix_bits
    max_lo = (1 << low_width) - 1
    lines = header(module, input_width, output_width)
    lines.append("  wire [{0}:0] hi = in[{1}:{2}];".format(prefix_bits - 1, input_width - 1, low_width))
    lines.append("  wire [{0}:0] lo = in[{0}:0];".format(low_width - 1))
    for high in range(1 << prefix_bits):
        base_value = high << low_width
        qlo = isqrt(base_value)
        qhi = isqrt(base_value + max_lo)
        prefix = "h{0}".format(high)
        for delta in range(1, qhi - qlo + 1):
            threshold = (qlo + delta) * (qlo + delta) - base_value
            if threshold <= 0:
                lines.append("  wire {0}_ge_{1} = 1'b1;".format(prefix, delta))
            elif threshold >= (1 << low_width):
                lines.append("  wire {0}_ge_{1} = 1'b0;".format(prefix, delta))
            else:
                lines.append("  wire {0}_ge_{1} = lo >= {2};".format(prefix, delta, const(low_width, threshold)))
        lines.append("  wire [{0}:0] {1}_out;".format(output_width - 1, prefix))
        for bit in range(output_width):
            lines.append("  assign {0}_out[{1}] = {2};".format(prefix, bit, thermometer_bit_expr(prefix, qlo, qhi, bit)))
    lines.append("  reg [{0}:0] out_r;".format(output_width - 1))
    lines.append("  always @* begin")
    lines.append("    case (hi)")
    for high in range(1 << prefix_bits):
        lines.append("      {0}: out_r = h{1}_out;".format(const(prefix_bits, high), high))
    lines.append("      default: out_r = {0};".format(zero_word(output_width)))
    lines.extend(["    endcase", "  end", "  assign out = out_r;", "endmodule", ""])
    return "\n".join(lines)


def prefix_word_mux_expr(high_values, order):
    if len(high_values) == 1:
        return "h{0}_out".format(high_values[0])
    if not order:
        return "h{0}_out".format(high_values[0])
    bit = order[0]
    low = [value for value in high_values if ((value >> bit) & 1) == 0]
    high = [value for value in high_values if ((value >> bit) & 1) == 1]
    if not low:
        return prefix_word_mux_expr(high, order[1:])
    if not high:
        return prefix_word_mux_expr(low, order[1:])
    return "(hi[{0}] ? {1} : {2})".format(
        bit,
        prefix_word_mux_expr(high, order[1:]),
        prefix_word_mux_expr(low, order[1:]),
    )


def render_prefix_ge_tree(module, input_width, output_width, prefix_bits, order_name):
    if prefix_bits <= 0 or prefix_bits >= input_width:
        return None
    low_width = input_width - prefix_bits
    max_lo = (1 << low_width) - 1
    if order_name == "msb":
        order = list(reversed(range(prefix_bits)))
    elif order_name == "lsb":
        order = list(range(prefix_bits))
    else:
        raise RuntimeError("unknown prefix tree order: {0}".format(order_name))
    lines = header(module, input_width, output_width)
    lines.append("  wire [{0}:0] hi = in[{1}:{2}];".format(prefix_bits - 1, input_width - 1, low_width))
    lines.append("  wire [{0}:0] lo = in[{0}:0];".format(low_width - 1))
    for high in range(1 << prefix_bits):
        base_value = high << low_width
        qlo = isqrt(base_value)
        qhi = isqrt(base_value + max_lo)
        prefix = "h{0}".format(high)
        for delta in range(1, qhi - qlo + 1):
            threshold = (qlo + delta) * (qlo + delta) - base_value
            if threshold <= 0:
                lines.append("  wire {0}_ge_{1} = 1'b1;".format(prefix, delta))
            elif threshold >= (1 << low_width):
                lines.append("  wire {0}_ge_{1} = 1'b0;".format(prefix, delta))
            else:
                lines.append("  wire {0}_ge_{1} = lo >= {2};".format(prefix, delta, const(low_width, threshold)))
        lines.append("  wire [{0}:0] {1}_out;".format(output_width - 1, prefix))
        for bit in range(output_width):
            lines.append("  assign {0}_out[{1}] = {2};".format(prefix, bit, thermometer_bit_expr(prefix, qlo, qhi, bit)))
    lines.append("  assign out = {0};".format(prefix_word_mux_expr(list(range(1 << prefix_bits)), order)))
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def append_ge_bucket(lines, label, low_name, low_width, output_width, base_value):
    max_lo = (1 << low_width) - 1
    qlo = isqrt(base_value)
    qhi = isqrt(base_value + max_lo)
    for delta in range(1, qhi - qlo + 1):
        threshold = (qlo + delta) * (qlo + delta) - base_value
        if threshold <= 0:
            lines.append("  wire {0}_ge_{1} = 1'b1;".format(label, delta))
        elif threshold >= (1 << low_width):
            lines.append("  wire {0}_ge_{1} = 1'b0;".format(label, delta))
        else:
            lines.append("  wire {0}_ge_{1} = {2} >= {3};".format(label, delta, low_name, const(low_width, threshold)))
    lines.append("  wire [{0}:0] {1}_out;".format(output_width - 1, label))
    for bit in range(output_width):
        lines.append("  assign {0}_out[{1}] = {2};".format(label, bit, thermometer_bit_expr(label, qlo, qhi, bit)))


def render_prefix4_refine_ge(module, input_width, output_width, refined_highs):
    prefix_bits = 4
    if input_width <= prefix_bits + 1:
        return None
    low_width = input_width - prefix_bits
    refined_low_width = low_width - 1
    refined_highs = {value for value in refined_highs if 0 <= value < (1 << prefix_bits)}
    lines = header(module, input_width, output_width)
    lines.append("  wire [3:0] hi = in[{0}:{1}];".format(input_width - 1, low_width))
    lines.append("  wire sub = in[{0}];".format(refined_low_width))
    lines.append("  wire [{0}:0] lo = in[{0}:0];".format(low_width - 1))
    lines.append("  wire [{0}:0] lo_ref = in[{0}:0];".format(refined_low_width - 1))
    for high in range(1 << prefix_bits):
        if high in refined_highs:
            for sub in range(2):
                base_value = ((high << 1) | sub) << refined_low_width
                append_ge_bucket(lines, "h{0}_{1}".format(high, sub), "lo_ref", refined_low_width, output_width, base_value)
        else:
            base_value = high << low_width
            append_ge_bucket(lines, "h{0}".format(high), "lo", low_width, output_width, base_value)
    lines.append("  reg [{0}:0] out_r;".format(output_width - 1))
    lines.append("  always @* begin")
    lines.append("    case (hi)")
    for high in range(1 << prefix_bits):
        if high in refined_highs:
            lines.append("      4'd{0}: out_r = sub ? h{0}_1_out : h{0}_0_out;".format(high))
        else:
            lines.append("      4'd{0}: out_r = h{0}_out;".format(high))
    lines.append("      default: out_r = {0};".format(zero_word(output_width)))
    lines.extend(["    endcase", "  end", "  assign out = out_r;", "endmodule", ""])
    return "\n".join(lines)


def render_mixed_prefix_ge(module, input_width, output_width, default_prefix, override_prefix, override_bits):
    if default_prefix <= 0 or default_prefix >= input_width:
        return None
    if override_prefix <= 0 or override_prefix >= input_width:
        return None
    override_bits = {bit for bit in override_bits if 0 <= bit < output_width}
    if not override_bits:
        return None
    bit_prefix = {}
    for bit in range(output_width):
        bit_prefix[bit] = override_prefix if bit in override_bits else default_prefix

    lines = header(module, input_width, output_width)
    for prefix_bits in sorted(set(bit_prefix.values())):
        low_width = input_width - prefix_bits
        max_lo = (1 << low_width) - 1
        tag = "p{0}".format(prefix_bits)
        lines.append("  wire [{0}:0] {1}_hi = in[{2}:{3}];".format(prefix_bits - 1, tag, input_width - 1, low_width))
        lines.append("  wire [{0}:0] {1}_lo = in[{0}:0];".format(low_width - 1, tag))
        active_bits = [bit for bit, prefix in bit_prefix.items() if prefix == prefix_bits]
        for high in range(1 << prefix_bits):
            base_value = high << low_width
            qlo = isqrt(base_value)
            qhi = isqrt(base_value + max_lo)
            prefix = "{0}_h{1}".format(tag, high)
            needed_deltas = set()
            for bit in active_bits:
                for delta in range(1, qhi - qlo + 1):
                    if ((qlo + delta - 1) >> bit) & 1 != ((qlo + delta) >> bit) & 1:
                        needed_deltas.add(delta)
            for delta in sorted(needed_deltas):
                threshold = (qlo + delta) * (qlo + delta) - base_value
                if threshold <= 0:
                    lines.append("  wire {0}_ge_{1} = 1'b1;".format(prefix, delta))
                elif threshold >= (1 << low_width):
                    lines.append("  wire {0}_ge_{1} = 1'b0;".format(prefix, delta))
                else:
                    lines.append("  wire {0}_ge_{1} = {2}_lo >= {3};".format(prefix, delta, tag, const(low_width, threshold)))
            lines.append("  wire [{0}:0] {1}_out;".format(output_width - 1, prefix))
            for bit in range(output_width):
                if bit in active_bits:
                    lines.append("  assign {0}_out[{1}] = {2};".format(prefix, bit, thermometer_bit_expr(prefix, qlo, qhi, bit)))
                else:
                    lines.append("  assign {0}_out[{1}] = 1'b0;".format(prefix, bit))
        lines.append("  reg [{0}:0] {1}_out_r;".format(output_width - 1, tag))
        lines.append("  always @* begin")
        lines.append("    case ({0}_hi)".format(tag))
        for high in range(1 << prefix_bits):
            lines.append("      {0}: {1}_out_r = {1}_h{2}_out;".format(const(prefix_bits, high), tag, high))
        lines.append("      default: {0}_out_r = {1};".format(tag, zero_word(output_width)))
        lines.extend(["    endcase", "  end"])
    for bit in range(output_width):
        lines.append("  assign out[{0}] = p{1}_out_r[{0}];".format(bit, bit_prefix[bit]))
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def render_support_high_prefix_ge(module, input_width, output_width, prefix_bits, support_bits):
    support_bits = {bit for bit in support_bits if 0 <= bit < output_width}
    prefix_active = [bit for bit in range(output_width) if bit not in support_bits]
    if not prefix_active:
        return render_support_interval_or(module, input_width, output_width)
    if prefix_bits <= 0 or prefix_bits >= input_width:
        return None
    low_width = input_width - prefix_bits
    max_lo = (1 << low_width) - 1
    lines = header(module, input_width, output_width)
    lines.append("  wire [{0}:0] hi = in[{1}:{2}];".format(prefix_bits - 1, input_width - 1, low_width))
    lines.append("  wire [{0}:0] lo = in[{0}:0];".format(low_width - 1))
    for high in range(1 << prefix_bits):
        base_value = high << low_width
        qlo = isqrt(base_value)
        qhi = isqrt(base_value + max_lo)
        prefix = "h{0}".format(high)
        needed_deltas = set()
        for bit in prefix_active:
            for delta in range(1, qhi - qlo + 1):
                if ((qlo + delta - 1) >> bit) & 1 != ((qlo + delta) >> bit) & 1:
                    needed_deltas.add(delta)
        for delta in sorted(needed_deltas):
            threshold = (qlo + delta) * (qlo + delta) - base_value
            if threshold <= 0:
                lines.append("  wire {0}_ge_{1} = 1'b1;".format(prefix, delta))
            elif threshold >= (1 << low_width):
                lines.append("  wire {0}_ge_{1} = 1'b0;".format(prefix, delta))
            else:
                lines.append("  wire {0}_ge_{1} = lo >= {2};".format(prefix, delta, const(low_width, threshold)))
        lines.append("  wire [{0}:0] {1}_out;".format(output_width - 1, prefix))
        for bit in range(output_width):
            if bit in prefix_active:
                lines.append("  assign {0}_out[{1}] = {2};".format(prefix, bit, thermometer_bit_expr(prefix, qlo, qhi, bit)))
            else:
                lines.append("  assign {0}_out[{1}] = 1'b0;".format(prefix, bit))
    lines.append("  reg [{0}:0] prefix_out_r;".format(output_width - 1))
    lines.append("  always @* begin")
    lines.append("    case (hi)")
    for high in range(1 << prefix_bits):
        lines.append("      {0}: prefix_out_r = h{1}_out;".format(const(prefix_bits, high), high))
    lines.append("      default: prefix_out_r = {0};".format(zero_word(output_width)))
    lines.extend(["    endcase", "  end"])
    for bit in range(output_width):
        if bit in support_bits:
            var_width = input_width - (2 * bit)
            var_expr = "in[{0}:{1}]".format(input_width - 1, 2 * bit)
            lines.append("  assign out[{0}] = {1};".format(bit, reduced_sqrt_parity_expr(var_expr, var_width)))
        else:
            lines.append("  assign out[{0}] = prefix_out_r[{0}];".format(bit))
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def anf_masks(input_width, output_width, bit):
    values = [(isqrt_model(index, output_width) >> bit) & 1 for index in range(1 << input_width)]
    for var in range(input_width):
        step = 1 << var
        for mask in range(1 << input_width):
            if mask & step:
                values[mask] ^= values[mask ^ step]
    return [mask for mask, coeff in enumerate(values) if coeff]


def anf_expr(input_width, output_width, bit):
    terms = []
    for mask in anf_masks(input_width, output_width, bit):
        if mask == 0:
            terms.append("1'b1")
            continue
        factors = ["in[{0}]".format(var) for var in range(input_width) if mask & (1 << var)]
        terms.append("(" + " & ".join(factors) + ")")
    return xor_chain(terms)


def render_anf_high_prefix_ge(module, input_width, output_width, prefix_bits, anf_bits):
    anf_bits = {bit for bit in anf_bits if 0 <= bit < output_width}
    prefix_active = [bit for bit in range(output_width) if bit not in anf_bits]
    if not prefix_active:
        lines = header(module, input_width, output_width)
        for bit in range(output_width):
            lines.append("  assign out[{0}] = {1};".format(bit, anf_expr(input_width, output_width, bit)))
        lines.extend(["endmodule", ""])
        return "\n".join(lines)
    if prefix_bits <= 0 or prefix_bits >= input_width:
        return None
    low_width = input_width - prefix_bits
    max_lo = (1 << low_width) - 1
    lines = header(module, input_width, output_width)
    lines.append("  wire [{0}:0] hi = in[{1}:{2}];".format(prefix_bits - 1, input_width - 1, low_width))
    lines.append("  wire [{0}:0] lo = in[{0}:0];".format(low_width - 1))
    for high in range(1 << prefix_bits):
        base_value = high << low_width
        qlo = isqrt(base_value)
        qhi = isqrt(base_value + max_lo)
        prefix = "h{0}".format(high)
        needed_deltas = set()
        for bit in prefix_active:
            for delta in range(1, qhi - qlo + 1):
                if ((qlo + delta - 1) >> bit) & 1 != ((qlo + delta) >> bit) & 1:
                    needed_deltas.add(delta)
        for delta in sorted(needed_deltas):
            threshold = (qlo + delta) * (qlo + delta) - base_value
            if threshold <= 0:
                lines.append("  wire {0}_ge_{1} = 1'b1;".format(prefix, delta))
            elif threshold >= (1 << low_width):
                lines.append("  wire {0}_ge_{1} = 1'b0;".format(prefix, delta))
            else:
                lines.append("  wire {0}_ge_{1} = lo >= {2};".format(prefix, delta, const(low_width, threshold)))
        lines.append("  wire [{0}:0] {1}_out;".format(output_width - 1, prefix))
        for bit in range(output_width):
            if bit in prefix_active:
                lines.append("  assign {0}_out[{1}] = {2};".format(prefix, bit, thermometer_bit_expr(prefix, qlo, qhi, bit)))
            else:
                lines.append("  assign {0}_out[{1}] = 1'b0;".format(prefix, bit))
    lines.append("  reg [{0}:0] prefix_out_r;".format(output_width - 1))
    lines.append("  always @* begin")
    lines.append("    case (hi)")
    for high in range(1 << prefix_bits):
        lines.append("      {0}: prefix_out_r = h{1}_out;".format(const(prefix_bits, high), high))
    lines.append("      default: prefix_out_r = {0};".format(zero_word(output_width)))
    lines.extend(["    endcase", "  end"])
    for bit in range(output_width):
        if bit in anf_bits:
            lines.append("  assign out[{0}] = {1};".format(bit, anf_expr(input_width, output_width, bit)))
        else:
            lines.append("  assign out[{0}] = prefix_out_r[{0}];".format(bit))
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def render_prefix_bitwise_onehot(module, input_width, output_width, prefix_bits):
    if prefix_bits <= 0 or prefix_bits >= input_width:
        return None
    low_width = input_width - prefix_bits
    max_lo = (1 << low_width) - 1
    lines = header(module, input_width, output_width)
    lines.append("  wire [{0}:0] hi = in[{1}:{2}];".format(prefix_bits - 1, input_width - 1, low_width))
    lines.append("  wire [{0}:0] lo = in[{0}:0];".format(low_width - 1))
    for high in range(1 << prefix_bits):
        lines.append("  wire sel_{0} = hi == {1};".format(high, const(prefix_bits, high)))
    for bit in range(output_width):
        terms = []
        for high in range(1 << prefix_bits):
            base_value = high << low_width
            qlo = isqrt(base_value)
            qhi = isqrt(base_value + max_lo)
            expr = local_bit_expr("lo", low_width, output_width, qlo, qhi, base_value, bit)
            if expr == "1'b0":
                continue
            if expr == "1'b1":
                terms.append("sel_{0}".format(high))
            else:
                terms.append("(sel_{0} & {1})".format(high, expr))
        lines.append("  assign out[{0}] = {1};".format(bit, or_chain(terms)))
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def reduced_sqrt_parity_intervals(var_width):
    max_value = (1 << var_width) - 1
    max_q = isqrt(max_value)
    intervals = []
    for q in range(1, max_q + 1, 2):
        lo = q * q
        hi = min(max_value, (q + 1) * (q + 1) - 1)
        intervals.append((lo, hi))
    return intervals


def render_support_interval_or(module, input_width, output_width):
    lines = header(module, input_width, output_width)
    for bit in range(output_width):
        var_width = input_width - (2 * bit)
        var_expr = "in[{0}:{1}]".format(input_width - 1, 2 * bit)
        terms = [
            local_interval_pred(var_expr, var_width, lo, hi)
            for lo, hi in reduced_sqrt_parity_intervals(var_width)
        ]
        lines.append("  assign out[{0}] = {1};".format(bit, or_chain(terms)))
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def render_support_threshold_xor(module, input_width, output_width):
    lines = header(module, input_width, output_width)
    for bit in range(output_width):
        var_width = input_width - (2 * bit)
        var_expr = "in[{0}:{1}]".format(input_width - 1, 2 * bit)
        thresholds = []
        max_q = isqrt((1 << var_width) - 1)
        for q in range(1, max_q + 1):
            thresholds.append("({0} >= {1})".format(var_expr, const(var_width, q * q)))
        lines.append("  assign out[{0}] = {1};".format(bit, xor_chain(thresholds)))
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def plane_for_outputs(outputs, bit):
    return bytes(((value >> bit) & 1) for value in outputs)


def bdd_order(input_width, name):
    if name == "natural":
        return list(range(input_width))
    if name == "reverse":
        return list(reversed(range(input_width)))
    if name == "center":
        center = (input_width - 1) / 2.0
        return sorted(range(input_width), key=lambda bit: (abs(bit - center), -bit))
    if name == "outside":
        order = []
        lo = 0
        hi = input_width - 1
        while lo <= hi:
            order.append(hi)
            if lo != hi:
                order.append(lo)
            hi -= 1
            lo += 1
        return order
    if name == "swapmsb":
        order = list(reversed(range(input_width)))
        if input_width >= 2:
            order[0], order[1] = order[1], order[0]
        return order
    if name == "lowmix":
        return [bit for bit in [2, 0, 1] + list(range(3, input_width)) if bit < input_width]
    if name == "lowmix2":
        return [bit for bit in [2, 1, 0] + list(range(3, input_width)) if bit < input_width]
    if name == "lowmix_revtail":
        head = [bit for bit in [2, 0, 1, 3, 4, 5] if bit < input_width]
        tail = [bit for bit in reversed(range(6, input_width)) if bit not in head]
        return head + tail
    raise RuntimeError("unknown BDD order: {0}".format(name))


def edge_expr_pref(edge, prefix):
    node_id, inv = edge
    if node_id == 0:
        return "1'b1" if inv else "1'b0"
    name = "{0}_n_{1}".format(prefix, node_id)
    return "~{0}".format(name) if inv else name


def render_bdd(module, input_width, output_width, order_name):
    outputs = [isqrt_model(index, output_width) for index in range(1 << input_width)]
    order = bdd_order(input_width, order_name)
    builder = SharedBddBuilder(order)
    roots = []
    for bit in range(output_width):
        roots.append(builder.build(permute_plane(plane_for_outputs(outputs, bit), order), 0))
    lines = header(module, input_width, output_width)
    for node in builder.nodes:
        lines.append(
            "  wire n_{0} = in[{1}] ? {2} : {3};".format(
                node["id"],
                node["var"],
                edge_expr(node["high"]),
                edge_expr(node["low"]),
            )
        )
    for bit, root in enumerate(roots):
        lines.append("  assign out[{0}] = {1};".format(bit, edge_expr(root)))
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def reduced_sqrt_parity_expr(var_expr, var_width):
    terms = [
        local_interval_pred(var_expr, var_width, lo, hi)
        for lo, hi in reduced_sqrt_parity_intervals(var_width)
    ]
    return or_chain(terms)


def render_high_formula_low_bdd(module, input_width, output_width, high_count, order_name):
    if high_count <= 0 or high_count >= output_width:
        return None
    low_outputs = output_width - high_count
    outputs = [isqrt_model(index, output_width) for index in range(1 << input_width)]
    order = bdd_order(input_width, order_name)
    builder = SharedBddBuilder(order)
    roots = []
    for bit in range(low_outputs):
        roots.append(builder.build(permute_plane(plane_for_outputs(outputs, bit), order), 0))
    lines = header(module, input_width, output_width)
    for node in builder.nodes:
        lines.append(
            "  wire n_{0} = in[{1}] ? {2} : {3};".format(
                node["id"],
                node["var"],
                edge_expr(node["high"]),
                edge_expr(node["low"]),
            )
        )
    for bit, root in enumerate(roots):
        lines.append("  assign out[{0}] = {1};".format(bit, edge_expr(root)))
    for bit in range(low_outputs, output_width):
        var_width = input_width - (2 * bit)
        var_expr = "in[{0}:{1}]".format(input_width - 1, 2 * bit)
        lines.append("  assign out[{0}] = {1};".format(bit, reduced_sqrt_parity_expr(var_expr, var_width)))
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def cube_combine(left, right):
    diff = 0
    out = []
    for a, b in zip(left, right):
        if a == b:
            out.append(a)
        elif a is None or b is None:
            return None
        else:
            diff += 1
            if diff > 1:
                return None
            out.append(None)
    if diff != 1:
        return None
    return tuple(out)


@functools.lru_cache(maxsize=None)
def prime_cubes(input_width, onset):
    cubes = {tuple((minterm >> bit) & 1 for bit in range(input_width)) for minterm in onset}
    primes = set()
    while True:
        grouped = {}
        for cube in cubes:
            grouped.setdefault(sum(value == 1 for value in cube), []).append(cube)
        used = set()
        next_cubes = set()
        for count, group in grouped.items():
            for left in group:
                for right in grouped.get(count + 1, []):
                    combined = cube_combine(left, right)
                    if combined is not None:
                        used.add(left)
                        used.add(right)
                        next_cubes.add(combined)
        primes.update(cube for cube in cubes if cube not in used)
        if not next_cubes or next_cubes == cubes:
            break
        cubes = next_cubes
    return tuple(
        sorted(
            primes,
            key=lambda cube: (
                sum(value is not None for value in cube),
                tuple(2 if value is None else value for value in cube),
            ),
        )
    )


@functools.lru_cache(maxsize=None)
def cube_cover(cube):
    values = [0]
    for bit, value in enumerate(cube):
        if value is None:
            values.extend(existing | (1 << bit) for existing in list(values))
        elif value:
            values = [existing | (1 << bit) for existing in values]
    return frozenset(values)


def greedy_cube_cover(input_width, onset):
    remaining = set(onset)
    if not remaining:
        return []
    prime_list = list(prime_cubes(input_width, tuple(sorted(remaining))))
    cover_map = {cube: set(cube_cover(cube)) & remaining for cube in prime_list}
    chosen = []
    while remaining:
        owners = {}
        for cube, covered in cover_map.items():
            for minterm in covered & remaining:
                owners.setdefault(minterm, []).append(cube)
        essentials = {cubes[0] for cubes in owners.values() if len(cubes) == 1}
        if essentials:
            for cube in essentials:
                if cube in cover_map:
                    chosen.append(cube)
                    remaining -= cover_map[cube]
                    del cover_map[cube]
            continue
        cube = max(cover_map, key=lambda item: (len(cover_map[item] & remaining), sum(value is None for value in item)))
        chosen.append(cube)
        remaining -= cover_map[cube]
        del cover_map[cube]
    return chosen


def cube_expr(cube):
    terms = []
    for bit, value in enumerate(cube):
        if value is None:
            continue
        terms.append("in[{0}]".format(bit) if value else "~in[{0}]".format(bit))
    if not terms:
        return "1'b1"
    return "(" + " & ".join(terms) + ")"


def sop_expr(input_width, ones):
    all_values = set(range(1 << input_width))
    ones = set(ones)
    zeroes = all_values - ones
    one_cover = greedy_cube_cover(input_width, tuple(sorted(ones)))
    zero_cover = greedy_cube_cover(input_width, tuple(sorted(zeroes)))
    one_cost = sum(sum(value is not None for value in cube) for cube in one_cover)
    zero_cost = sum(sum(value is not None for value in cube) for cube in zero_cover)
    if len(zero_cover) < len(one_cover) or (len(zero_cover) == len(one_cover) and zero_cost < one_cost):
        return "~({0})".format(or_chain(cube_expr(cube) for cube in zero_cover))
    return or_chain(cube_expr(cube) for cube in one_cover)


def render_qm_sop(module, input_width, output_width):
    if input_width > 10:
        return None
    lines = header(module, input_width, output_width)
    for bit in range(output_width):
        ones = [index for index in range(1 << input_width) if (isqrt_model(index, output_width) >> bit) & 1]
        lines.append("  assign out[{0}] = {1};".format(bit, sop_expr(input_width, tuple(ones))))
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def render_cofbdd(module, input_width, output_width, prefix_bits, order_name):
    if prefix_bits <= 0 or prefix_bits >= input_width:
        return None
    low_width = input_width - prefix_bits
    local_order = bdd_order(low_width, order_name)
    lines = header(module, input_width, output_width)
    lines.append("  wire [{0}:0] hi = in[{1}:{2}];".format(prefix_bits - 1, input_width - 1, low_width))
    for high in range(1 << prefix_bits):
        outputs = [isqrt_model((high << low_width) | low, output_width) for low in range(1 << low_width)]
        builder = SharedBddBuilder(local_order)
        roots = []
        for bit in range(output_width):
            roots.append(builder.build(permute_plane(plane_for_outputs(outputs, bit), local_order), 0))
        prefix = "h{0}".format(high)
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
        lines.append("  wire [{0}:0] {1}_out;".format(output_width - 1, prefix))
        for bit, root in enumerate(roots):
            lines.append("  assign {0}_out[{1}] = {2};".format(prefix, bit, edge_expr_pref(root, prefix)))
    lines.append("  reg [{0}:0] out_r;".format(output_width - 1))
    lines.append("  always @* begin")
    lines.append("    case (hi)")
    for high in range(1 << prefix_bits):
        lines.append("      {0}: out_r = h{1}_out;".format(const(prefix_bits, high), high))
    lines.append("      default: out_r = {0};".format(zero_word(output_width)))
    lines.extend(["    endcase", "  end", "  assign out = out_r;", "endmodule", ""])
    return "\n".join(lines)


def render_lowbits_cofbdd_anfhi(module, input_width, output_width, prefix_bits, low_bit_count, order_name):
    if prefix_bits <= 0 or prefix_bits >= input_width:
        return None
    low_bits = set(range(min(low_bit_count, output_width)))
    if not low_bits:
        return None
    low_width = input_width - prefix_bits
    local_order = bdd_order(low_width, order_name)
    lines = header(module, input_width, output_width)
    lines.append("  wire [{0}:0] hi = in[{1}:{2}];".format(prefix_bits - 1, input_width - 1, low_width))
    for high in range(1 << prefix_bits):
        outputs = [isqrt_model((high << low_width) | low, output_width) for low in range(1 << low_width)]
        builder = SharedBddBuilder(local_order)
        roots = {}
        for bit in sorted(low_bits):
            roots[bit] = builder.build(permute_plane(plane_for_outputs(outputs, bit), local_order), 0)
        prefix = "h{0}".format(high)
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
        lines.append("  wire [{0}:0] {1}_out;".format(output_width - 1, prefix))
        for bit in range(output_width):
            if bit in low_bits:
                lines.append("  assign {0}_out[{1}] = {2};".format(prefix, bit, edge_expr_pref(roots[bit], prefix)))
            else:
                lines.append("  assign {0}_out[{1}] = 1'b0;".format(prefix, bit))
    lines.append("  reg [{0}:0] low_out_r;".format(output_width - 1))
    lines.append("  always @* begin")
    lines.append("    case (hi)")
    for high in range(1 << prefix_bits):
        lines.append("      {0}: low_out_r = h{1}_out;".format(const(prefix_bits, high), high))
    lines.append("      default: low_out_r = {0};".format(zero_word(output_width)))
    lines.extend(["    endcase", "  end"])
    for bit in range(output_width):
        if bit in low_bits:
            lines.append("  assign out[{0}] = low_out_r[{0}];".format(bit))
        else:
            lines.append("  assign out[{0}] = {1};".format(bit, anf_expr(input_width, output_width, bit)))
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def render_full_case_small(module, input_width, output_width):
    if input_width > 10:
        return None
    lines = header(module, input_width, output_width)
    lines.extend(
        [
            "  reg [{0}:0] out_r;".format(output_width - 1),
            "  always @* begin",
            "    case (in)",
        ]
    )
    for value in range(1 << input_width):
        lines.append("      {0}: out_r = {1};".format(const(input_width, value), const(output_width, isqrt_model(value, output_width))))
    lines.extend(
        [
            "      default: out_r = {0};".format(zero_word(output_width)),
            "    endcase",
            "  end",
            "  assign out = out_r;",
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


def render_source(module, input_width, output_width, source):
    if source == "direct_loop":
        return render_direct_loop(module, input_width, output_width)
    if source == "threshold_chain":
        return render_threshold_chain(module, input_width, output_width)
    if source == "threshold_xor":
        return render_threshold_xor(module, input_width, output_width)
    if source == "threshold_popcount":
        return render_threshold_popcount(module, input_width, output_width)
    if source == "bit_interval_or":
        return render_bit_interval_or(module, input_width, output_width)
    if source == "range_tree":
        return render_range_tree(module, input_width, output_width)
    if source == "restoring_proc":
        return render_restoring_proc(module, input_width, output_width)
    if source == "restoring_wires":
        return render_restoring_wires(module, input_width, output_width)
    if source == "radix4_wires":
        return render_radix_wires(module, input_width, output_width, 2)
    if source == "radix8_wires":
        return render_radix_wires(module, input_width, output_width, 3)
    if source == "radix4_prio":
        return render_radix_wires(module, input_width, output_width, 2, prio_select=True)
    if source == "radix8_prio":
        return render_radix_wires(module, input_width, output_width, 3, prio_select=True)
    if source == "radix16_prio":
        return render_radix_wires(module, input_width, output_width, 4, prio_select=True)
    if source.startswith("prefix") and source.endswith("_delta"):
        return render_prefix_delta(module, input_width, output_width, int(source[len("prefix") : -len("_delta")]))
    if source.startswith("prefix") and source.endswith("_range"):
        return render_prefix_range(module, input_width, output_width, int(source[len("prefix") : -len("_range")]))
    if source.startswith("prefix") and source.endswith("_ge_bitwise"):
        return render_prefix_ge_bitwise(module, input_width, output_width, int(source[len("prefix") : -len("_ge_bitwise")]))
    if source.startswith("prefix") and "_ge_tree_" in source:
        head, order_name = source.split("_ge_tree_", 1)
        return render_prefix_ge_tree(module, input_width, output_width, int(head[len("prefix") :]), order_name)
    if source.startswith("mix_p4_p5_p5"):
        selector = source[len("mix_p4_p5_p5") :]
        if selector.startswith("b"):
            bits = {int(selector[1:])}
        elif selector == "low2":
            bits = {0, 1}
        elif selector == "high2":
            bits = {output_width - 1, output_width - 2}
        elif selector == "even":
            bits = {bit for bit in range(output_width) if bit % 2 == 0}
        elif selector == "odd":
            bits = {bit for bit in range(output_width) if bit % 2 == 1}
        else:
            raise RuntimeError("unknown mixed prefix selector: {0}".format(source))
        return render_mixed_prefix_ge(module, input_width, output_width, 4, 5, bits)
    if source.startswith("supporthi") and source.endswith("_p4ge"):
        high_count = int(source[len("supporthi") : -len("_p4ge")])
        bits = {output_width - 1 - offset for offset in range(high_count)}
        return render_support_high_prefix_ge(module, input_width, output_width, 4, bits)
    if source.startswith("anfhi") and source.endswith("_p4ge"):
        high_count = int(source[len("anfhi") : -len("_p4ge")])
        bits = {output_width - 1 - offset for offset in range(high_count)}
        return render_anf_high_prefix_ge(module, input_width, output_width, 4, bits)
    if source == "prefix4_refine0_ge":
        return render_prefix4_refine_ge(module, input_width, output_width, {0})
    if source == "prefix4_refine01_ge":
        return render_prefix4_refine_ge(module, input_width, output_width, {0, 1})
    if source == "prefix4_refine03_ge":
        return render_prefix4_refine_ge(module, input_width, output_width, {0, 1, 2, 3})
    if source.startswith("prefix") and source.endswith("_bitwise"):
        return render_prefix_bitwise(module, input_width, output_width, int(source[len("prefix") : -len("_bitwise")]))
    if source.startswith("prefix") and source.endswith("_bitwise_oh"):
        return render_prefix_bitwise_onehot(module, input_width, output_width, int(source[len("prefix") : -len("_bitwise_oh")]))
    if source == "support_interval_or":
        return render_support_interval_or(module, input_width, output_width)
    if source == "support_threshold_xor":
        return render_support_threshold_xor(module, input_width, output_width)
    if source == "qm_sop":
        return render_qm_sop(module, input_width, output_width)
    if source.startswith("high") and "_bdd_" in source:
        head, order_name = source.split("_bdd_", 1)
        return render_high_formula_low_bdd(module, input_width, output_width, int(head[len("high") :]), order_name)
    if source.startswith("cofbdd") and source.endswith("_reverse"):
        return render_cofbdd(module, input_width, output_width, int(source[len("cofbdd") : -len("_reverse")]), "reverse")
    if source.startswith("low") and "_cofbdd" in source and source.endswith("_anfhi"):
        low_part, rest = source.split("_cofbdd", 1)
        low_bit_count = int(low_part[len("low") :])
        prefix_bits = int(rest[: -len("_anfhi")])
        return render_lowbits_cofbdd_anfhi(module, input_width, output_width, prefix_bits, low_bit_count, "reverse")
    if source == "full_case_small":
        return render_full_case_small(module, input_width, output_width)
    if source.startswith("bdd_"):
        return render_bdd(module, input_width, output_width, source[len("bdd_") :])
    raise RuntimeError("unknown source: {0}".format(source))


def empty_row(case, candidate_id, source_variant, flow, verilog_path, aig_path, semantic_ok, semantic_note, refs):
    row = {
        "case": case,
        "candidate_id": candidate_id,
        "hypothesis": "unsigned_floor_isqrt",
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
        "classification": "sqrt_specific_structural_rtl",
        "notes": semantic_note,
    }
    return row


FLOW_SCRIPTS = dict(base.FLOW_SCRIPTS)
FLOW_SCRIPTS.update(
    {
        "abc_g_aig_d6": lambda v, m, o: base.script_default(v, m, o, "aig -D 6"),
        "abc_g_aig_d8": lambda v, m, o: base.script_default(v, m, o, "aig -D 8"),
        "abc_g_aig_d10": lambda v, m, o: base.script_default(v, m, o, "aig -D 10"),
        "abc_g_AND": lambda v, m, o: base.script_default(v, m, o, "AND"),
        "abc_g_NAND": lambda v, m, o: base.script_default(v, m, o, "NAND"),
        "abc_g_NOR": lambda v, m, o: base.script_default(v, m, o, "NOR"),
        "abc_g_OR": lambda v, m, o: base.script_default(v, m, o, "OR"),
        "abc_g_XOR": lambda v, m, o: base.script_default(v, m, o, "XOR"),
        "abc_g_MUX": lambda v, m, o: base.script_default(v, m, o, "MUX"),
        "synth_preset_d6": lambda v, m, o: base.script_synth_preset(v, m, o, 6),
        "synth_preset_d8": lambda v, m, o: base.script_synth_preset(v, m, o, 8),
        "synth_preset_d10": lambda v, m, o: base.script_synth_preset(v, m, o, 10),
        "synth_preset_d12": lambda v, m, o: base.script_synth_preset(v, m, o, 12),
        "synth_preset_d16": lambda v, m, o: base.script_synth_preset(v, m, o, 16),
    }
)


def run_case(args, case, source_variants, flow_variants, refs):
    table = TruthTable(args.benchmarks / "{0}.truth".format(case))
    semantic_ok, semantic_note = verify_semantics(case, table)
    input_width = table.input_width
    output_width = table.output_width
    rows = []
    manifest = {
        "case": case,
        "truth": rel(args.benchmarks / "{0}.truth".format(case)),
        "input_width": input_width,
        "output_width": output_width,
        "constant_bits": table.constant_bits(),
        "semantic": semantic_note,
        "sources": [],
        "candidates": [],
    }

    for source_variant in source_variants:
        module = "{0}_isqrt_{1}".format(case, source_variant)
        verilog_text = render_source(module, input_width, output_width, source_variant)
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
                    generation_sec = base.run_yosys(args.yosys, script, script_path, log_path, args.timeout)
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
                    row["runtime_sec"] = "{0:.3f}".format(generation_sec + evaluated.runtime_sec)
                except (SynthError, RuntimeError, OSError, subprocess.TimeoutExpired) as exc:
                    row["notes"] = "{0}: {1}".format(type(exc).__name__, exc)[:1000]
                    row["runtime_sec"] = "{0:.3f}".format(time.time() - start)
            else:
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
        "Purpose: frontend-only integer square-root structures for `ex275-ex279`.",
        "",
        "Inputs:",
        "- Truth files: `benchmarks/ex275.truth` through `benchmarks/ex279.truth`",
        "- Previous notes: `student/cases/ex255_ex279_integer_arithmetic/README.md`",
        "- Generator/script: `student/generators/integer_ex275_ex279_isqrt_frontend.py`",
        "",
        "Artifacts:",
        "- Work directory: `{0}`".format(rel(args.work_dir)),
        "- Candidates CSV: `{0}`".format(rel(args.results_dir / "candidates.csv")),
        "- Best CSV: `{0}`".format(rel(args.results_dir / "best.csv")),
        "- Summary CSV: `{0}`".format(rel(args.results_dir / "summary.csv")),
        "",
        "Methods tried:",
        "- Exact unsigned floor integer square-root semantics verified from truth tables.",
        "- Direct trial-square loop, restoring sqrt, threshold/range classifiers, prefix range splits, small full-case tables, and shared BDDs.",
        "- Limited Yosys frontend synthflow only; no backend optimization portfolio.",
        "",
        "Best result:",
        "- See `results/best.csv`.",
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
    parser.add_argument("--run-id", default="ex275_ex279_frontend_isqrt_structures_20260609_1551")
    parser.add_argument("--cases", default="ex275,ex276,ex277,ex278,ex279")
    parser.add_argument("--sources", default="all")
    parser.add_argument("--flows", default="abc_g_aig,wreduce_abc_g_aig,synth_preset")
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
    best_by_case = {}
    for row in equivalent_rows:
        case = row["case"]
        if case not in best_by_case or int(row["adp"]) < int(best_by_case[case]["adp"]):
            best_by_case[case] = row
    best_rows = [best_by_case[case] for case in sorted(best_by_case)]

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
