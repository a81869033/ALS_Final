#!/usr/bin/env python3
"""Frontend-only unsigned divider seeds for ex265-ex269.

The baseline integer search already identified these cases as unsigned
division with divide-by-zero saturation.  This script focuses on source
structures that expose quotient classifiers, small-denominator fast paths, and
constant-divisor pieces to Yosys before exact AIG verification.
"""

import argparse
import json
import math
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


CASES = ("ex265", "ex266", "ex267", "ex268", "ex269")
CASE_PART_WIDTH = {
    "ex265": 4,
    "ex266": 5,
    "ex267": 6,
    "ex268": 7,
    "ex269": 8,
}

SOURCE_VARIANTS = (
    "direct_guarded",
    "direct_safe",
    "direct_gt_guard",
    "restoring_narrow",
    "restoring_gt_guard",
    "case_denominator_manual",
    "case_dividend_ranges",
    "threshold_desc",
    "threshold_desc_guarded",
    "small_divisor_fast_direct",
    "small_divisor_fast_restoring",
    "shift_subtract",
    "shift_subtract_gt_guard",
    "shift_subtract_narrow",
    "radix4_shift_subtract",
    "radix4_shift_subtract_gt_guard",
    "radix4_shift_subtract_narrow",
    "radix4_compact_digit",
    "radix4_top1_shift",
    "radix4_top2_shift",
    "radix4_top3_shift",
    "radix4_top3_compact_digit",
    "radix8_shift_subtract",
    "radix8_shift_subtract_gt_guard",
    "radix8_shift_subtract_narrow",
    "binary_search_product",
    "binary_search_shiftadd",
    "binary_search_shiftadd_gt_guard",
    "denom_split_threshold_direct",
    "denom_split_threshold_restoring",
    "denom_split_direct",
    "denom_split_direct_gt_guard",
    "denom_lz_range_direct",
    "denom_lz_range_smallcase",
    "denom_lz_range_lowbdd",
    "denom_lz_range_lowrestoring",
    "sop_qm",
    "bdd_b_lsb",
    "bdd_b_msb",
    "bdd_b_msb_a_lsb",
    "bdd_b_lsb_a_msb",
    "bdd_interleave_msb",
    "bdd_interleave_lsb",
    "bdd_interleave_a_first_msb",
    "bdd_interleave_a_first_lsb",
    "bdd_a_msb",
    "bdd_greedy_b_msb",
    "bdd_greedy_interleave_msb",
    "bdd_search_best",
    "bdd_qor_order0",
    "bdd_qor_order1",
    "bdd_qor_order2",
    "bdd_comp_interleave_msb",
    "bdd_comp_search_best",
    "bdd_comp_perbit_interleave_msb",
    "bdd_comp_perbit_search_best",
    "bdd_perbit_interleave_msb",
    "bdd_perbit_search_best",
    "bdd_perbit_bitopt",
    "bdd_perbit_formula_hi2",
    "bdd_perbit_formula_hi3",
    "hybrid_bdd_hi1_interleave_lo_direct",
    "hybrid_bdd_hi2_interleave_lo_direct",
    "hybrid_bdd_hi3_interleave_lo_direct",
    "hybrid_bdd_hi4_interleave_lo_direct",
    "hybrid_bdd_hi2_bmsb_lo_direct",
    "hybrid_bdd_hi3_bmsb_lo_direct",
    "hybrid_bdd_hi4_bmsb_lo_direct",
    "hybrid_bdd_hi2_bmsb_resid_direct",
    "hybrid_bdd_hi3_bmsb_resid_direct",
    "hybrid_bdd_hi4_bmsb_resid_direct",
    "hybrid_bdd_hi2_interleave_resid_direct",
    "hybrid_bdd_hi3_interleave_resid_direct",
    "hybrid_bdd_hi4_interleave_resid_direct",
    "mtbdd_b_msb",
    "mtbdd_interleave_msb",
    "mtbdd_interleave_a_first_msb",
    "mtbdd_b_lsb_a_msb",
    "recip_floor_sn",
    "recip_floor_snp2",
    "recip_floor_s2n",
    "recip_ceil_sn",
    "recip_ceil_snp2",
    "recip_ceil_s2n",
    "lz_threshold_low2_case",
    "lz_threshold_low3_case",
    "lz_threshold_low4_case",
    "ex266_formula_hi2_low3_bdd",
    "ex266_formula_hi3_low2_bdd",
    "ex266_interval_case_bits",
    "ex266_interval_case_low2_hiformula",
    "ex266_interval_case_low3_hiformula",
    "ex266_hi2_resid_shift",
    "ex266_hi3_resid_shift",
    "ex266_hi2_resid_parallel",
    "ex266_hi3_resid_parallel",
    "ex266_parallel_threshold",
    "ex266_cof_bhi1_mtbdd",
    "ex266_cof_bhi2_mtbdd",
    "ex266_cof_bhi3_mtbdd",
    "ex266_cof_bhi4_mtbdd",
    "ex266_cof_bhi2_bitbdd",
    "ex266_cof_bhi3_bitbdd",
    "ex266_cof_bhi4_bitbdd",
    "ex266_cof_bhi1_a4_bitbdd",
    "ex266_cof_bhi2_a4_bitbdd",
    "ex266_cof_bhi2_a43_bitbdd",
    "ex266_cof_b4_b1_bitbdd",
    "ex266_cof_b4_b2_bitbdd",
    "ex266_cof_b4_b0_bitbdd",
    "ex266_cof_b3_b1_bitbdd",
    "ex266_cof_bhi2_bitbdd_wordmux",
    "ex266_cof_bhi2_a4_bitbdd_wordmux",
    "ex266_cof_bhi2_a43_bitbdd_wordmux",
    "ex266_cof_bhi3_a43_bitbdd_wordmux",
    "ex266_cof_bhi2_a43_b0_bitbdd_wordmux",
    "ex266_cof_bhi2_a43_b1_bitbdd_wordmux",
    "ex266_cof_bhi2_a4_comp_wordmux",
    "ex266_cof_bhi2_a43_comp_wordmux",
    "ex266_cof_bhi2_a4_tree_wordmux",
    "ex266_cof_bhi2_a43_tree_wordmux",
    "cof_bhi1_ahi1_bitbdd_wordmux",
    "cof_bhi2_ahi1_bitbdd_wordmux",
    "cof_bhi2_ahi2_bitbdd_wordmux",
    "cof_bhi3_ahi1_bitbdd_wordmux",
)

FLOW_VARIANTS = (
    "default",
    "wreduce_default",
    "abc_g_aig",
    "wreduce_abc_g_aig",
    "arith_wreduce_aig",
    "synth_preset",
    "abc_g_aig_d8",
    "abc_g_aig_d10",
    "abc_g_aig_d12",
    "synth_preset_d18",
    "synth_preset_d8",
    "synth_preset_d10",
    "synth_preset_d12",
    "synth_preset_d20",
    "synth_preset_d24",
    "synth_preset_d28",
    "synth_preset_d32",
    "abc_g_aig_d18",
    "abc_g_aig_d24",
)

FLOW_SCRIPTS = dict(base.FLOW_SCRIPTS)
FLOW_SCRIPTS.update(
    {
        "abc_g_aig_d8": lambda v, m, o: base.script_default(v, m, o, "aig -D 8"),
        "abc_g_aig_d10": lambda v, m, o: base.script_default(v, m, o, "aig -D 10"),
        "abc_g_aig_d12": lambda v, m, o: base.script_default(v, m, o, "aig -D 12"),
        "synth_preset_d8": lambda v, m, o: base.script_synth_preset(v, m, o, 8),
        "synth_preset_d10": lambda v, m, o: base.script_synth_preset(v, m, o, 10),
        "synth_preset_d12": lambda v, m, o: base.script_synth_preset(v, m, o, 12),
    }
)

RESULT_FIELDNAMES = base.RESULT_FIELDNAMES
BEST_FIELDNAMES = base.BEST_FIELDNAMES


def const(width, value):
    return "{0}'h{1:x}".format(width, value & ((1 << width) - 1))


def range_decl(width):
    if width <= 1:
        return ""
    return "[{0}:0] ".format(width - 1)


def power_of_two(value):
    return value > 0 and (value & (value - 1)) == 0


def int_log2(value):
    return value.bit_length() - 1


def header(module, n):
    return [
        "module {0}(in, out);".format(module),
        "  input [{0}:0] in;".format(2 * n - 1),
        "  output [{0}:0] out;".format(n - 1),
        "  wire [{0}:0] a = in[{0}:0];".format(n - 1),
        "  wire [{0}:0] b = in[{1}:{2}];".format(n - 1, 2 * n - 1, n),
        "  wire dbz = (b == {0}'b0);".format(n),
    ]


def zero_extend_shift(n, shift):
    if shift == 0:
        return "a"
    high = "a[{0}:{1}]".format(n - 1, shift)
    if shift == n:
        return "{0}'b0".format(n)
    return "{{{0}'b0, {1}}}".format(shift, high)


def const_div_expr(n, divisor):
    if divisor == 1:
        return "a"
    if power_of_two(divisor):
        return zero_extend_shift(n, int_log2(divisor))
    max_a = (1 << n) - 1
    if divisor > max_a // 2:
        return "{{{{{0}{{1'b0}}}}, (a >= {1}'d{2})}}".format(n - 1, n, divisor)
    return "a / {0}'d{1}".format(n, divisor)


def render_direct_guarded(module, n):
    lines = header(module, n)
    lines.extend(
        [
            "  assign out = dbz ? {0} : (a / b);".format(const(n, (1 << n) - 1)),
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


def render_direct_safe(module, n):
    lines = header(module, n)
    lines.extend(
        [
            "  wire [{0}:0] safe_b = dbz ? {1}'d1 : b;".format(n - 1, n),
            "  wire [{0}:0] q = a / safe_b;".format(n - 1),
            "  assign out = dbz ? {0} : q;".format(const(n, (1 << n) - 1)),
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


def render_direct_gt_guard(module, n):
    lines = header(module, n)
    lines.extend(
        [
            "  assign out = dbz ? {0} : ((b > a) ? {1}'b0 : (a / b));".format(
                const(n, (1 << n) - 1), n
            ),
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


def restoring_body(n, gt_guard=False):
    lines = [
        "  reg [{0}:0] quotient;".format(n - 1),
        "  reg [{0}:0] rem;".format(n),
        "  integer i;",
        "  always @* begin",
        "    quotient = {0}'b0;".format(n),
        "    rem = {0}'b0;".format(n + 1),
        "    if (dbz) begin",
        "      quotient = {0};".format(const(n, (1 << n) - 1)),
        "    end",
    ]
    if gt_guard:
        lines.extend(
            [
                "    else if (b > a) begin",
                "      quotient = {0}'b0;".format(n),
                "    end",
            ]
        )
    lines.extend(
        [
            "    else begin",
            "      for (i = {0}; i >= 0; i = i - 1) begin".format(n - 1),
            "        rem = {{rem[{0}:0], a[i]}};".format(n - 1),
            "        if (rem >= {1'b0, b}) begin",
            "          rem = rem - {1'b0, b};",
            "          quotient[i] = 1'b1;",
            "        end",
            "      end",
            "    end",
            "  end",
            "  assign out = quotient;",
        ]
    )
    return lines


def render_restoring_narrow(module, n):
    lines = header(module, n)
    lines.extend(restoring_body(n, False))
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def render_restoring_gt_guard(module, n):
    lines = header(module, n)
    lines.extend(restoring_body(n, True))
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def render_case_denominator_manual(module, n):
    lines = header(module, n)
    lines.extend(
        [
            "  reg [{0}:0] q;".format(n - 1),
            "  always @* begin",
            "    case (b)",
            "      {0}'d0: q = {1};".format(n, const(n, (1 << n) - 1)),
        ]
    )
    for divisor in range(1, 1 << n):
        lines.append(
            "      {0}'d{1}: q = {2};".format(n, divisor, const_div_expr(n, divisor))
        )
    lines.extend(
        [
            "      default: q = {0}'b0;".format(n),
            "    endcase",
            "  end",
            "  assign out = q;",
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


def render_case_dividend_ranges(module, n):
    # This representation is compact for n<=6, but grows quickly after that.
    if n > 6:
        return None
    lines = header(module, n)
    lines.extend(
        [
            "  reg [{0}:0] q;".format(n - 1),
            "  always @* begin",
            "    if (dbz) begin",
            "      q = {0};".format(const(n, (1 << n) - 1)),
            "    end else begin",
            "      case (a)",
        ]
    )
    for aval in range(1 << n):
        lines.append("        {0}'d{1}: begin".format(n, aval))
        lines.append("          q = {0}'b0;".format(n))
        if aval > 0:
            emitted = set()
            for qval in range(min(aval, (1 << n) - 1), 0, -1):
                threshold = aval // qval
                if threshold < 1 or threshold in emitted:
                    continue
                emitted.add(threshold)
                keyword = "if" if len(emitted) == 1 else "else if"
                lines.append(
                    "          {0} (b <= {1}'d{2}) q = {1}'d{3};".format(keyword, n, threshold, qval)
                )
        lines.append("        end")
    lines.extend(
        [
            "        default: q = {0}'b0;".format(n),
            "      endcase",
            "    end",
            "  end",
            "  assign out = q;",
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


def render_threshold_desc(module, n, gt_guard=False):
    if n > 6:
        return None
    lines = header(module, n)
    max_q = (1 << n) - 1
    lines.extend(
        [
            "  reg [{0}:0] q;".format(n - 1),
            "  always @* begin",
            "    q = {0}'b0;".format(n),
            "    if (dbz) begin",
            "      q = {0};".format(const(n, max_q)),
            "    end",
        ]
    )
    if gt_guard:
        lines.extend(
            [
                "    else if (b > a) begin",
                "      q = {0}'b0;".format(n),
                "    end",
            ]
        )
    lines.append("    else begin")
    first = True
    for qval in range(max_q, 0, -1):
        keyword = "if" if first else "else if"
        lines.append(
            "      {0} ({{{1}'b0, a}} >= ({2}'d{3} * {{{1}'b0, b}})) q = {1}'d{3};".format(
                keyword, n, 2 * n, qval
            )
        )
        first = False
    lines.extend(
        [
            "    end",
            "  end",
            "  assign out = q;",
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


def render_small_divisor_fast(module, n, fallback):
    lines = header(module, n)
    pow_terms = []
    for divisor in (1, 2, 4, 8, 16, 32, 64, 128):
        if divisor < (1 << n):
            pow_terms.append(divisor)
    lines.extend(
        [
            "  reg [{0}:0] q;".format(n - 1),
            "  always @* begin",
            "    if (dbz) begin",
            "      q = {0};".format(const(n, (1 << n) - 1)),
            "    end else if (b > a) begin",
            "      q = {0}'b0;".format(n),
            "    end",
        ]
    )
    for divisor in pow_terms:
        lines.append(
            "    else if (b == {0}'d{1}) begin q = {2}; end".format(
                n, divisor, const_div_expr(n, divisor)
            )
        )
    if fallback == "direct":
        lines.append("    else begin q = a / b; end")
    elif fallback == "restoring":
        # A small local restoring loop for the non-trivial denominator path.
        lines.extend(
            [
                "    else begin",
                "      q = {0}'b0;".format(n),
                "      rem = {0}'b0;".format(n + 1),
                "      for (i = {0}; i >= 0; i = i - 1) begin".format(n - 1),
                "        rem = {{rem[{0}:0], a[i]}};".format(n - 1),
                "        if (rem >= {1'b0, b}) begin",
                "          rem = rem - {1'b0, b};",
                "          q[i] = 1'b1;",
                "        end",
                "      end",
                "    end",
            ]
        )
    else:
        raise RuntimeError("unknown fallback {0}".format(fallback))
    lines.extend(["  end", "  assign out = q;", "endmodule", ""])
    if fallback == "restoring":
        lines.insert(6, "  reg [{0}:0] rem;".format(n))
        lines.insert(7, "  integer i;")
    return "\n".join(lines)


def shift_subtract_body(n, gt_guard=False):
    wide = 2 * n
    lines = [
        "  reg [{0}:0] q;".format(n - 1),
        "  reg [{0}:0] rem;".format(wide - 1),
        "  reg [{0}:0] denom_shift;".format(wide - 1),
        "  integer i;",
        "  always @* begin",
        "    q = {0}'b0;".format(n),
        "    rem = {{{0}'b0, a}};".format(n),
        "    denom_shift = {0}'b0;".format(wide),
        "    if (dbz) begin",
        "      q = {0};".format(const(n, (1 << n) - 1)),
        "    end",
    ]
    if gt_guard:
        lines.extend(
            [
                "    else if (b > a) begin",
                "      q = {0}'b0;".format(n),
                "    end",
            ]
        )
    lines.extend(
        [
            "    else begin",
            "      for (i = {0}; i >= 0; i = i - 1) begin".format(n - 1),
            "        denom_shift = {{{0}'b0, b}} << i;".format(n),
            "        if (rem >= denom_shift) begin",
            "          rem = rem - denom_shift;",
            "          q[i] = 1'b1;",
            "        end",
            "      end",
            "    end",
            "  end",
            "  assign out = q;",
        ]
    )
    return lines


def render_shift_subtract(module, n, gt_guard=False):
    lines = header(module, n)
    lines.extend(shift_subtract_body(n, gt_guard))
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def render_radix_shift_subtract(module, n, radix_bits, gt_guard=False, narrow=False):
    wide = 2 * n + 2
    max_digit = (1 << radix_bits) - 1
    lines = header(module, n)
    lines.extend(
        [
            "  reg [{0}:0] q;".format(n - 1),
            "  reg [{0}:0] rem;".format((n - 1) if narrow else (wide - 1)),
            "  reg [{0}:0] denom1;".format(wide - 1),
        ]
    )
    for digit in range(2, max_digit + 1):
        lines.append("  reg [{0}:0] denom{1};".format(wide - 1, digit))
    lines.extend(
        [
            "  always @* begin",
            "    q = {0}'b0;".format(n),
            "    rem = a;" if narrow else "    rem = {{{0}'b0, a}};".format(wide - n),
            "    denom1 = {0}'b0;".format(wide),
        ]
    )
    for digit in range(2, max_digit + 1):
        lines.append("    denom{0} = {1}'b0;".format(digit, wide))
    lines.extend(
        [
            "    if (dbz) begin",
            "      q = {0};".format(const(n, (1 << n) - 1)),
            "    end",
        ]
    )
    if gt_guard:
        lines.extend(
            [
                "    else if (b > a) begin",
                "      q = {0}'b0;".format(n),
                "    end",
            ]
        )
    lines.append("    else begin")
    first_bits = n % radix_bits
    if first_bits == 0:
        first_bits = radix_bits
    shift = n - first_bits
    while shift >= 0:
        group_bits = first_bits if shift == n - first_bits else radix_bits
        group_max = (1 << group_bits) - 1
        lines.append("      denom1 = {{{0}'b0, b}} << {1};".format(wide - n, shift))
        for digit in range(2, group_max + 1):
            if digit & (digit - 1) == 0:
                lines.append("      denom{0} = denom1 << {1};".format(digit, digit.bit_length() - 1))
            else:
                parts = []
                bit = 0
                temp = digit
                while temp:
                    if temp & 1:
                        parts.append("denom1" if bit == 0 else "(denom1 << {0})".format(bit))
                    temp >>= 1
                    bit += 1
                lines.append("      denom{0} = {1};".format(digit, " + ".join(parts)))
        for digit in range(group_max, 0, -1):
            keyword = "if" if digit == group_max else "else if"
            if group_bits == 1:
                q_assign = "q[{0}] = 1'b1;".format(shift)
            else:
                q_assign = "q[{0}:{1}] = {2}'d{3};".format(shift + group_bits - 1, shift, group_bits, digit)
            if narrow:
                condition = "((denom{0}[{1}:{2}] == {3}'b0) && (rem >= denom{0}[{4}:0]))".format(
                    digit, wide - 1, n, wide - n, n - 1
                )
                subtract_value = "denom{0}[{1}:0]".format(digit, n - 1)
            else:
                condition = "(rem >= denom{0})".format(digit)
                subtract_value = "denom{0}".format(digit)
            lines.extend(
                [
                    "      {0} {1} begin".format(keyword, condition),
                    "        rem = rem - {0};".format(subtract_value),
                    "        {0}".format(q_assign),
                    "      end",
                ]
            )
        shift -= radix_bits
    lines.extend(
        [
            "    end",
            "  end",
            "  assign out = q;",
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


def render_grouped_shift_subtract(module, n, groups):
    wide = 2 * n + 2
    max_digit = max((1 << bits) - 1 for bits in groups)
    lines = header(module, n)
    lines.extend(
        [
            "  reg [{0}:0] q;".format(n - 1),
            "  reg [{0}:0] rem;".format(wide - 1),
            "  reg [{0}:0] denom1;".format(wide - 1),
        ]
    )
    for digit in range(2, max_digit + 1):
        lines.append("  reg [{0}:0] denom{1};".format(wide - 1, digit))
    lines.extend(
        [
            "  always @* begin",
            "    q = {0}'b0;".format(n),
            "    rem = {{{0}'b0, a}};".format(wide - n),
            "    denom1 = {0}'b0;".format(wide),
        ]
    )
    for digit in range(2, max_digit + 1):
        lines.append("    denom{0} = {1}'b0;".format(digit, wide))
    lines.extend(
        [
            "    if (dbz) begin",
            "      q = {0};".format(const(n, (1 << n) - 1)),
            "    end else begin",
        ]
    )
    shift = n
    for group_bits in groups:
        shift -= group_bits
        group_max = (1 << group_bits) - 1
        lines.append("      denom1 = {{{0}'b0, b}} << {1};".format(wide - n, shift))
        for digit in range(2, group_max + 1):
            if digit & (digit - 1) == 0:
                lines.append("      denom{0} = denom1 << {1};".format(digit, digit.bit_length() - 1))
            else:
                parts = []
                bit = 0
                temp = digit
                while temp:
                    if temp & 1:
                        parts.append("denom1" if bit == 0 else "(denom1 << {0})".format(bit))
                    temp >>= 1
                    bit += 1
                lines.append("      denom{0} = {1};".format(digit, " + ".join(parts)))
        for digit in range(group_max, 0, -1):
            keyword = "if" if digit == group_max else "else if"
            if group_bits == 1:
                q_assign = "q[{0}] = 1'b1;".format(shift)
            else:
                q_assign = "q[{0}:{1}] = {2}'d{3};".format(shift + group_bits - 1, shift, group_bits, digit)
            lines.extend(
                [
                    "      {0} (rem >= denom{1}) begin".format(keyword, digit),
                    "        rem = rem - denom{0};".format(digit),
                    "        {0}".format(q_assign),
                    "      end",
                ]
            )
    lines.extend(
        [
            "    end",
            "  end",
            "  assign out = q;",
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


def render_radix4_topk_shift(module, n, top_groups):
    groups = []
    remaining = n
    used = 0
    while remaining > 0:
        if used < top_groups and remaining >= 2:
            groups.append(2)
            remaining -= 2
            used += 1
        else:
            groups.append(1)
            remaining -= 1
    return render_grouped_shift_subtract(module, n, groups)


def render_radix4_compact_digit(module, n, top_groups=None):
    """Radix-4 shift/subtract with explicit shared digit flags.

    The older radix-4 source emits an if/else subtract chain.  This version
    exposes the three quotient digit predicates, the selected subtractor input,
    and the digit mux separately; that gives Yosys a different sharing point for
    comparator/subtractor logic without changing the semantic divider model.
    """

    wide = 2 * n + 2
    groups = []
    if top_groups is None:
        first_bits = n % 2
        if first_bits == 0:
            first_bits = 2
        remaining = n
        groups.append(first_bits)
        remaining -= first_bits
        while remaining > 0:
            groups.append(2)
            remaining -= 2
    else:
        remaining = n
        used = 0
        while remaining > 0:
            if used < top_groups and remaining >= 2:
                groups.append(2)
                remaining -= 2
                used += 1
            else:
                groups.append(1)
                remaining -= 1

    lines = header(module, n)
    lines.extend(
        [
            "  reg [{0}:0] q;".format(n - 1),
            "  reg [{0}:0] rem;".format(wide - 1),
            "  reg [{0}:0] denom1;".format(wide - 1),
            "  reg [{0}:0] denom2;".format(wide - 1),
            "  reg [{0}:0] denom3;".format(wide - 1),
            "  reg [{0}:0] sub;".format(wide - 1),
            "  reg [1:0] digit;",
            "  reg ge1;",
            "  reg ge2;",
            "  reg ge3;",
            "  always @* begin",
            "    q = {0}'b0;".format(n),
            "    rem = {{{0}'b0, a}};".format(wide - n),
            "    denom1 = {0}'b0;".format(wide),
            "    denom2 = {0}'b0;".format(wide),
            "    denom3 = {0}'b0;".format(wide),
            "    sub = {0}'b0;".format(wide),
            "    digit = 2'b00;",
            "    ge1 = 1'b0;",
            "    ge2 = 1'b0;",
            "    ge3 = 1'b0;",
            "    if (dbz) begin",
            "      q = {0};".format(const(n, (1 << n) - 1)),
            "    end else begin",
        ]
    )
    shift = n
    for group_bits in groups:
        shift -= group_bits
        group_max = (1 << group_bits) - 1
        lines.extend(
            [
                "      denom1 = {{{0}'b0, b}} << {1};".format(wide - n, shift),
                "      denom2 = denom1 << 1;",
                "      denom3 = denom2 + denom1;",
                "      ge1 = (rem >= denom1);",
            ]
        )
        if group_max >= 2:
            lines.append("      ge2 = (rem >= denom2);")
        else:
            lines.append("      ge2 = 1'b0;")
        if group_max >= 3:
            lines.append("      ge3 = (rem >= denom3);")
        else:
            lines.append("      ge3 = 1'b0;")
        lines.extend(
            [
                "      digit = ge3 ? 2'd3 : (ge2 ? 2'd2 : (ge1 ? 2'd1 : 2'd0));",
                "      sub = ge3 ? denom3 : (ge2 ? denom2 : (ge1 ? denom1 : {0}'b0));".format(wide),
                "      rem = rem - sub;",
            ]
        )
        if group_bits == 1:
            lines.append("      q[{0}] = digit[0];".format(shift))
        else:
            lines.append("      q[{0}:{1}] = digit;".format(shift + group_bits - 1, shift))
    lines.extend(
        [
            "    end",
            "  end",
            "  assign out = q;",
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


def shifted_b_term(n, bit):
    width = 2 * n
    return "({{{0}'b0, b}} << {1})".format(n, bit)


def render_binary_search_product(module, n, shiftadd=False, gt_guard=False):
    width = 2 * n
    lines = header(module, n)
    lines.extend(
        [
            "  reg [{0}:0] q;".format(n - 1),
            "  reg [{0}:0] cand;".format(n - 1),
            "  reg [{0}:0] prod;".format(width - 1),
            "  always @* begin",
            "    q = {0}'b0;".format(n),
            "    cand = {0}'b0;".format(n),
            "    prod = {0}'b0;".format(width),
            "    if (dbz) begin",
            "      q = {0};".format(const(n, (1 << n) - 1)),
            "    end",
        ]
    )
    if gt_guard:
        lines.extend(
            [
                "    else if (b > a) begin",
                "      q = {0}'b0;".format(n),
                "    end",
            ]
        )
    lines.append("    else begin")
    for bit in range(n - 1, -1, -1):
        lines.append("      cand = q | {0};".format(const(n, 1 << bit)))
        if shiftadd:
            terms = [shifted_b_term(n, idx) for idx in range(n) if idx == bit]
            for idx in range(n):
                if idx == bit:
                    continue
                terms.append("(q[{0}] ? {1} : {2}'b0)".format(idx, shifted_b_term(n, idx), width))
            lines.append("      prod = {0};".format(" + ".join(terms)))
        else:
            lines.append("      prod = cand * {{ {0}'b0, b }};".format(n))
        lines.extend(
            [
                "      if ({{{0}'b0, a}} >= prod) begin".format(n),
                "        q[{0}] = 1'b1;".format(bit),
                "      end",
            ]
        )
    lines.extend(
        [
            "    end",
            "  end",
            "  assign out = q;",
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


def render_denom_split_threshold(module, n, fallback):
    split = max(2, n // 2)
    max_q = ((1 << n) - 1) >> split
    low_width = split
    high_range = "{0}:{1}".format(n - 1, split)
    lines = header(module, n)
    lines.extend(
        [
            "  wire high_denom = |b[{0}];".format(high_range),
            "  wire [{0}:0] b_low = b[{0}:0];".format(low_width - 1),
            "  reg [{0}:0] q;".format(n - 1),
        ]
    )
    if fallback == "restoring":
        lines.extend(
            [
                "  reg [{0}:0] rem;".format(n),
                "  integer i;",
            ]
        )
    lines.extend(
        [
            "  always @* begin",
            "    q = {0}'b0;".format(n),
            "    if (dbz) begin",
            "      q = {0};".format(const(n, (1 << n) - 1)),
            "    end else if (b > a) begin",
            "      q = {0}'b0;".format(n),
            "    end else if (high_denom) begin",
        ]
    )
    first = True
    for qval in range(max_q, 0, -1):
        keyword = "if" if first else "else if"
        lines.append(
            "      {0} ({{{1}'b0, a}} >= ({2}'d{3} * {{{1}'b0, b}})) q = {1}'d{3};".format(
                keyword, n, 2 * n, qval
            )
        )
        first = False
    if max_q > 0:
        lines.append("      else q = {0}'b0;".format(n))
    lines.append("    end else begin")
    if fallback == "direct":
        lines.append("      q = a / b_low;")
    elif fallback == "restoring":
        lines.extend(
            [
                "      rem = {0}'b0;".format(n + 1),
                "      for (i = {0}; i >= 0; i = i - 1) begin".format(n - 1),
                "        rem = {{rem[{0}:0], a[i]}};".format(n - 1),
                "        if (rem >= {{{0}'b0, b_low}}) begin".format(n + 1 - low_width),
                "          rem = rem - {{{0}'b0, b_low}};".format(n + 1 - low_width),
                "          q[i] = 1'b1;",
                "        end",
                "      end",
            ]
        )
    else:
        raise RuntimeError("unknown split fallback {0}".format(fallback))
    lines.extend(
        [
            "    end",
            "  end",
            "  assign out = q;",
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


def render_denom_split_direct(module, n, gt_guard=False):
    split = max(2, n // 2)
    high_range = "{0}:{1}".format(n - 1, split)
    lines = header(module, n)
    lines.extend(
        [
            "  wire high_denom = |b[{0}];".format(high_range),
            "  wire [{0}:0] b_low = b[{0}:0];".format(split - 1),
            "  wire [{0}:0] q_high = a / b;".format(n - split - 1),
            "  wire [{0}:0] q_low = a / b_low;".format(n - 1),
        ]
    )
    if gt_guard:
        lines.append(
            "  assign out = dbz ? {0} : ((b > a) ? {1}'b0 : (high_denom ? {{{2}'b0, q_high}} : q_low));".format(
                const(n, (1 << n) - 1), n, split
            )
        )
    else:
        lines.append(
            "  assign out = dbz ? {0} : (high_denom ? {{{1}'b0, q_high}} : q_low);".format(
                const(n, (1 << n) - 1), split
            )
        )
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def render_denom_lz_range_direct(module, n):
    split = max(2, n // 2)
    lines = header(module, n)
    lines.append("  wire [{0}:0] safe_b = dbz ? {1}'d1 : b;".format(n - 1, n))
    for bit in range(n - 1, split - 1, -1):
        width = n - bit
        lines.append("  wire [{0}:0] q_ge_{1} = a / safe_b;".format(width - 1, bit))
    lines.extend(
        [
            "  wire [{0}:0] b_low = b[{0}:0];".format(split - 1),
            "  wire [{0}:0] safe_b_low = (b_low == {1}'b0) ? {1}'d1 : b_low;".format(split - 1, split),
            "  wire [{0}:0] q_low = a / safe_b_low;".format(n - 1),
            "  reg [{0}:0] q;".format(n - 1),
            "  always @* begin",
            "    if (dbz) begin",
            "      q = {0};".format(const(n, (1 << n) - 1)),
            "    end else if (b > a) begin",
            "      q = {0}'b0;".format(n),
            "    end",
        ]
    )
    for bit in range(n - 1, split - 1, -1):
        width = n - bit
        pad = n - width
        lines.append(
            "    else if (b[{0}]) begin q = {{{1}'b0, q_ge_{0}}}; end".format(bit, pad)
        )
    lines.extend(
        [
            "    else begin q = q_low; end",
            "  end",
            "  assign out = q;",
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


def render_denom_lz_range_smallcase(module, n):
    split = max(2, n // 2)
    lines = header(module, n)
    lines.append("  wire [{0}:0] safe_b = dbz ? {1}'d1 : b;".format(n - 1, n))
    for bit in range(n - 1, split - 1, -1):
        width = n - bit
        lines.append("  wire [{0}:0] q_ge_{1} = a / safe_b;".format(width - 1, bit))
    lines.extend(
        [
            "  reg [{0}:0] q;".format(n - 1),
            "  always @* begin",
            "    if (dbz) begin",
            "      q = {0};".format(const(n, (1 << n) - 1)),
            "    end else if (b > a) begin",
            "      q = {0}'b0;".format(n),
            "    end",
        ]
    )
    for bit in range(n - 1, split - 1, -1):
        width = n - bit
        pad = n - width
        lines.append(
            "    else if (b[{0}]) begin q = {{{1}'b0, q_ge_{0}}}; end".format(bit, pad)
        )
    lines.extend(
        [
            "    else begin",
            "      case (b[{0}:0])".format(split - 1),
        ]
    )
    for divisor in range(1, 1 << split):
        lines.append(
            "        {0}'d{1}: q = {2};".format(split, divisor, const_div_expr(n, divisor))
        )
    lines.extend(
        [
            "        default: q = {0}'b0;".format(n),
            "      endcase",
            "    end",
            "  end",
            "  assign out = q;",
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


def low_div_bit(index, n, split, out_bit):
    a = index & ((1 << n) - 1)
    b = (index >> n) & ((1 << split) - 1)
    value = ((1 << n) - 1) if b == 0 else a // b
    return (value >> out_bit) & 1


def build_low_bdd_for_bit(n, split, out_bit, order, unique, nodes):
    cache = {}
    all_indices = tuple(range(1 << (n + split)))

    def rec(level, indices):
        key = (level, indices)
        if key in cache:
            return cache[key]
        first = low_div_bit(indices[0], n, split, out_bit)
        same = True
        for item in indices[1:]:
            if low_div_bit(item, n, split, out_bit) != first:
                same = False
                break
        if same or level >= len(order):
            cache[key] = first
            return first
        var = order[level]
        low = []
        high = []
        mask_value = 1 << var
        for item in indices:
            if item & mask_value:
                high.append(item)
            else:
                low.append(item)
        low_id = rec(level + 1, tuple(low)) if low else 0
        high_id = rec(level + 1, tuple(high)) if high else 0
        if low_id == high_id:
            result = low_id
        else:
            node_key = (var, low_id, high_id)
            result = unique.get(node_key)
            if result is None:
                result = len(nodes) + 2
                unique[node_key] = result
                nodes.append(node_key)
        cache[key] = result
        return result

    return rec(0, all_indices)


def low_bdd_order(n, split):
    return list(range(n + split - 1, n - 1, -1)) + list(range(n - 1, -1, -1))


def low_bdd_var_expr(var, n):
    if var < n:
        return "a[{0}]".format(var)
    return "b_low[{0}]".format(var - n)


def low_bdd_expr(node_id):
    if node_id == 0:
        return "1'b0"
    if node_id == 1:
        return "1'b1"
    return "lowbdd_n{0}".format(node_id)


def render_denom_lz_range_lowbdd(module, n):
    split = max(2, n // 2)
    order = low_bdd_order(n, split)
    unique = {}
    nodes = []
    roots = []
    for bit in range(n):
        roots.append(build_low_bdd_for_bit(n, split, bit, order, unique, nodes))

    lines = header(module, n)
    lines.append("  wire [{0}:0] safe_b = dbz ? {1}'d1 : b;".format(n - 1, n))
    for bit in range(n - 1, split - 1, -1):
        width = n - bit
        lines.append("  wire [{0}:0] q_ge_{1} = a / safe_b;".format(width - 1, bit))
    lines.append("  wire [{0}:0] b_low = b[{0}:0];".format(split - 1))
    lines.append("  // Low-denominator reduced BDD order: {0}".format(",".join(str(item) for item in order)))
    for offset, (var, low, high) in enumerate(nodes):
        node_id = offset + 2
        lines.append(
            "  wire lowbdd_n{0} = {1} ? {2} : {3};".format(
                node_id, low_bdd_var_expr(var, n), low_bdd_expr(high), low_bdd_expr(low)
            )
        )
    lines.append("  wire [{0}:0] q_low_bdd = {{{1}}};".format(n - 1, ", ".join(low_bdd_expr(root) for root in reversed(roots))))
    lines.extend(
        [
            "  reg [{0}:0] q;".format(n - 1),
            "  always @* begin",
            "    if (dbz) begin",
            "      q = {0};".format(const(n, (1 << n) - 1)),
            "    end else if (b > a) begin",
            "      q = {0}'b0;".format(n),
            "    end",
        ]
    )
    for bit in range(n - 1, split - 1, -1):
        width = n - bit
        pad = n - width
        lines.append(
            "    else if (b[{0}]) begin q = {{{1}'b0, q_ge_{0}}}; end".format(bit, pad)
        )
    lines.extend(
        [
            "    else begin q = q_low_bdd; end",
            "  end",
            "  assign out = q;",
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


def render_denom_lz_range_lowrestoring(module, n):
    split = max(2, n // 2)
    lines = header(module, n)
    lines.append("  wire [{0}:0] safe_b = dbz ? {1}'d1 : b;".format(n - 1, n))
    for bit in range(n - 1, split - 1, -1):
        width = n - bit
        lines.append("  wire [{0}:0] q_ge_{1} = a / safe_b;".format(width - 1, bit))
    lines.extend(
        [
            "  wire [{0}:0] b_low = b[{0}:0];".format(split - 1),
            "  reg [{0}:0] q;".format(n - 1),
            "  reg [{0}:0] rem;".format(n),
            "  integer i;",
            "  always @* begin",
            "    q = {0}'b0;".format(n),
            "    rem = {0}'b0;".format(n + 1),
            "    if (dbz) begin",
            "      q = {0};".format(const(n, (1 << n) - 1)),
            "    end else if (b > a) begin",
            "      q = {0}'b0;".format(n),
            "    end",
        ]
    )
    for bit in range(n - 1, split - 1, -1):
        width = n - bit
        pad = n - width
        lines.append(
            "    else if (b[{0}]) begin q = {{{1}'b0, q_ge_{0}}}; end".format(bit, pad)
        )
    lines.extend(
        [
            "    else begin",
            "      for (i = {0}; i >= 0; i = i - 1) begin".format(n - 1),
            "        rem = {{rem[{0}:0], a[i]}};".format(n - 1),
            "        if (rem >= {{{0}'b0, b_low}}) begin".format(n + 1 - split),
            "          rem = rem - {{{0}'b0, b_low}};".format(n + 1 - split),
            "          q[i] = 1'b1;",
            "        end",
            "      end",
            "    end",
            "  end",
            "  assign out = q;",
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


def combine_implicants(left, right):
    left_mask, left_value = left
    right_mask, right_value = right
    if left_mask != right_mask:
        return None
    diff = (left_value ^ right_value) & left_mask
    if diff == 0 or (diff & (diff - 1)) != 0:
        return None
    new_mask = left_mask & ~diff
    return (new_mask, left_value & new_mask)


def prime_implicants(minterms, input_width):
    current = set(((1 << input_width) - 1, item) for item in minterms)
    primes = set()
    while current:
        used = set()
        next_terms = set()
        items = sorted(current)
        for index, left in enumerate(items):
            for right in items[index + 1 :]:
                merged = combine_implicants(left, right)
                if merged is not None:
                    used.add(left)
                    used.add(right)
                    next_terms.add(merged)
        primes.update(term for term in current if term not in used)
        if next_terms == current:
            break
        current = next_terms
    return sorted(primes, key=lambda term: (bin(term[0]).count("1"), term[0], term[1]))


def covers(term, minterm):
    mask_value, value = term
    return (minterm & mask_value) == value


def cover_minterms(minterms, primes):
    remaining = set(minterms)
    selected = []
    while remaining:
        essential = None
        for minterm in sorted(remaining):
            covering = [prime for prime in primes if covers(prime, minterm)]
            if len(covering) == 1:
                essential = covering[0]
                break
        if essential is None:
            essential = max(
                primes,
                key=lambda prime: (len([item for item in remaining if covers(prime, item)]), -bin(prime[0]).count("1")),
            )
        if essential in selected:
            break
        selected.append(essential)
        remaining = set(item for item in remaining if not covers(essential, item))
    return selected


def sop_expr(terms, input_width):
    if not terms:
        return "1'b0"
    parts = []
    for mask_value, value in terms:
        if mask_value == 0:
            return "1'b1"
        literals = []
        for bit in range(input_width):
            if mask_value & (1 << bit):
                if value & (1 << bit):
                    literals.append("in[{0}]".format(bit))
                else:
                    literals.append("~in[{0}]".format(bit))
        if not literals:
            parts.append("1'b1")
        elif len(literals) == 1:
            parts.append(literals[0])
        else:
            parts.append("(" + " & ".join(literals) + ")")
    return " | ".join(parts)


def render_sop_qm(module, n):
    if n > 5:
        return None
    input_width = 2 * n
    out_mask = (1 << n) - 1
    bit_terms = []
    for out_bit in range(n):
        minterms = []
        for index in range(1 << input_width):
            a = index & out_mask
            b = (index >> n) & out_mask
            value = out_mask if b == 0 else a // b
            if (value >> out_bit) & 1:
                minterms.append(index)
        primes = prime_implicants(minterms, input_width)
        selected = cover_minterms(minterms, primes)
        bit_terms.append(selected)

    lines = [
        "module {0}(in, out);".format(module),
        "  input [{0}:0] in;".format(input_width - 1),
        "  output [{0}:0] out;".format(n - 1),
        "  // Exact per-bit Quine-McCluskey greedy SOP for small unsigned division.",
    ]
    for bit, terms in enumerate(bit_terms):
        lines.append("  assign out[{0}] = {1};".format(bit, sop_expr(terms, input_width)))
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def bdd_order(n, variant):
    a_bits = list(range(n))
    b_bits = list(range(n, 2 * n))
    if variant == "bdd_b_lsb":
        return b_bits + a_bits
    if variant == "bdd_b_msb":
        return list(reversed(b_bits)) + list(reversed(a_bits))
    if variant == "bdd_b_msb_a_lsb":
        return list(reversed(b_bits)) + a_bits
    if variant == "bdd_b_lsb_a_msb":
        return b_bits + list(reversed(a_bits))
    if variant == "bdd_a_msb":
        return list(reversed(a_bits)) + list(reversed(b_bits))
    if variant == "bdd_interleave_msb":
        order = []
        for bit in range(n - 1, -1, -1):
            order.append(n + bit)
            order.append(bit)
        return order
    if variant == "bdd_interleave_lsb":
        order = []
        for bit in range(n):
            order.append(n + bit)
            order.append(bit)
        return order
    if variant == "bdd_interleave_a_first_msb":
        order = []
        for bit in range(n - 1, -1, -1):
            order.append(bit)
            order.append(n + bit)
        return order
    if variant == "bdd_interleave_a_first_lsb":
        order = []
        for bit in range(n):
            order.append(bit)
            order.append(n + bit)
        return order
    if variant == "bdd_search_best":
        if n == 5:
            return [9, 8, 4, 3, 7, 6, 2, 1, 0, 5]
        if n == 6:
            return [11, 10, 5, 9, 4, 8, 3, 7, 2, 0, 1, 6]
        return bdd_order(n, "bdd_interleave_msb")
    if variant == "bdd_qor_order0" and n == 5:
        return [8, 4, 9, 7, 3, 2, 0, 1, 6, 5]
    if variant == "bdd_qor_order1" and n == 5:
        return [9, 8, 4, 7, 2, 3, 0, 1, 6, 5]
    if variant == "bdd_qor_order2" and n == 5:
        return [3, 8, 9, 7, 4, 2, 5, 1, 6, 0]
    raise RuntimeError("unknown BDD order variant {0}".format(variant))


def semantic_bit(index, n, out_bit):
    mask = (1 << n) - 1
    a = index & mask
    b = (index >> n) & mask
    value = mask if b == 0 else a // b
    return (value >> out_bit) & 1


def build_bdd_for_bit(n, out_bit, order, unique, nodes):
    cache = {}
    all_indices = tuple(range(1 << (2 * n)))

    def rec(level, indices):
        key = (level, indices)
        if key in cache:
            return cache[key]
        first = semantic_bit(indices[0], n, out_bit)
        same = True
        for item in indices[1:]:
            if semantic_bit(item, n, out_bit) != first:
                same = False
                break
        if same or level >= len(order):
            result = first
            cache[key] = result
            return result
        var = order[level]
        low = []
        high = []
        bit_mask = 1 << var
        for item in indices:
            if item & bit_mask:
                high.append(item)
            else:
                low.append(item)
        low_id = rec(level + 1, tuple(low)) if low else 0
        high_id = rec(level + 1, tuple(high)) if high else 0
        if low_id == high_id:
            result = low_id
        else:
            node_key = (var, low_id, high_id)
            result = unique.get(node_key)
            if result is None:
                result = len(nodes) + 2
                unique[node_key] = result
                nodes.append(node_key)
        cache[key] = result
        return result

    return rec(0, all_indices)


def bdd_node_count(n, order):
    unique = {}
    nodes = []
    for out_bit in range(n):
        build_bdd_for_bit(n, out_bit, order, unique, nodes)
    return len(nodes)


def greedy_bdd_order(n, start_order):
    order = list(start_order)
    best = bdd_node_count(n, order)
    improved = True
    passes = 0
    while improved and passes < 4:
        improved = False
        passes += 1
        for idx in range(len(order) - 1):
            trial = list(order)
            trial[idx], trial[idx + 1] = trial[idx + 1], trial[idx]
            score = bdd_node_count(n, trial)
            if score < best:
                order = trial
                best = score
                improved = True
    return order


def bdd_expr(node_id):
    if node_id == 0:
        return "1'b0"
    if node_id == 1:
        return "1'b1"
    return "bdd_n{0}".format(node_id)


def render_bdd(module, n, variant):
    if variant in ("bdd_greedy_b_msb", "bdd_greedy_interleave_msb") and n > 6:
        return None
    if n > 8:
        return None
    if variant == "bdd_greedy_b_msb":
        order = greedy_bdd_order(n, bdd_order(n, "bdd_b_msb"))
    elif variant == "bdd_greedy_interleave_msb":
        order = greedy_bdd_order(n, bdd_order(n, "bdd_interleave_msb"))
    else:
        order = bdd_order(n, variant)
    unique = {}
    nodes = []
    roots = []
    for out_bit in range(n):
        roots.append(build_bdd_for_bit(n, out_bit, order, unique, nodes))

    lines = header(module, n)
    lines.append("  // Reduced BDD decision DAG; variable order: {0}".format(",".join(str(item) for item in order)))
    for offset, (var, low, high) in enumerate(nodes):
        node_id = offset + 2
        lines.append(
            "  wire bdd_n{0} = in[{1}] ? {2} : {3};".format(
                node_id, var, bdd_expr(high), bdd_expr(low)
            )
        )
    lines.append("  assign out = {{{0}}};".format(", ".join(bdd_expr(root) for root in reversed(roots))))
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def comp_edge_not(edge):
    return edge ^ 1


def comp_edge_expr(edge, prefix):
    if edge == 0:
        return "1'b0"
    if edge == 1:
        return "1'b1"
    expr = "{0}_n{1}".format(prefix, edge >> 1)
    if edge & 1:
        return "~{0}".format(expr)
    return expr


def comp_mk(var, low, high, unique, nodes):
    if low == high:
        return low
    invert = high & 1
    if invert:
        low = comp_edge_not(low)
        high = comp_edge_not(high)
    key = (var, low, high)
    node_id = unique.get(key)
    if node_id is None:
        node_id = len(nodes) + 1
        unique[key] = node_id
        nodes.append(key)
    return (node_id << 1) ^ invert


def build_comp_bdd_for_bit(n, out_bit, order, unique, nodes):
    cache = {}
    all_indices = tuple(range(1 << (2 * n)))

    def rec(level, indices):
        key = (level, indices)
        if key in cache:
            return cache[key]
        first = semantic_bit(indices[0], n, out_bit)
        same = True
        for item in indices[1:]:
            if semantic_bit(item, n, out_bit) != first:
                same = False
                break
        if same or level >= len(order):
            result = 1 if first else 0
            cache[key] = result
            return result
        var = order[level]
        low = []
        high = []
        bit_mask = 1 << var
        for item in indices:
            if item & bit_mask:
                high.append(item)
            else:
                low.append(item)
        low_id = rec(level + 1, tuple(low)) if low else 0
        high_id = rec(level + 1, tuple(high)) if high else 0
        result = comp_mk(var, low_id, high_id, unique, nodes)
        cache[key] = result
        return result

    return rec(0, all_indices)


def render_comp_bdd(module, n, variant):
    if n > 8:
        return None
    if variant == "bdd_comp_interleave_msb":
        order = bdd_order(n, "bdd_interleave_msb")
    elif variant == "bdd_comp_search_best":
        order = bdd_order(n, "bdd_search_best")
    else:
        raise RuntimeError("unknown complemented BDD variant {0}".format(variant))
    unique = {}
    nodes = []
    roots = []
    for out_bit in range(n):
        roots.append(build_comp_bdd_for_bit(n, out_bit, order, unique, nodes))

    prefix = "cbd"
    lines = header(module, n)
    lines.append("  // Reduced BDD with complemented edges; variable order: {0}".format(",".join(str(item) for item in order)))
    for offset, (var, low, high) in enumerate(nodes):
        node_id = offset + 1
        lines.append(
            "  wire {0}_n{1} = in[{2}] ? {3} : {4};".format(
                prefix,
                node_id,
                var,
                comp_edge_expr(high, prefix),
                comp_edge_expr(low, prefix),
            )
        )
    lines.append("  assign out = {{{0}}};".format(", ".join(comp_edge_expr(root, prefix) for root in reversed(roots))))
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def render_comp_bdd_perbit(module, n, variant):
    if n > 7:
        return None
    if variant == "bdd_comp_perbit_interleave_msb":
        order = bdd_order(n, "bdd_interleave_msb")
    elif variant == "bdd_comp_perbit_search_best":
        order = bdd_order(n, "bdd_search_best")
    else:
        raise RuntimeError("unknown complemented per-bit BDD variant {0}".format(variant))

    roots = {}
    bit_nodes = {}
    for out_bit in range(n):
        unique = {}
        nodes = []
        roots[out_bit] = build_comp_bdd_for_bit(n, out_bit, order, unique, nodes)
        bit_nodes[out_bit] = nodes

    lines = header(module, n)
    lines.append("  // Per-output complemented-edge BDDs. order: {0}".format(",".join(str(item) for item in order)))
    for out_bit, nodes in bit_nodes.items():
        prefix = "cpbd{0}".format(out_bit)
        for offset, (var, low, high) in enumerate(nodes):
            node_id = offset + 1
            lines.append(
                "  wire {0}_n{1} = in[{2}] ? {3} : {4};".format(
                    prefix,
                    node_id,
                    var,
                    comp_edge_expr(high, prefix),
                    comp_edge_expr(low, prefix),
                )
            )
    for out_bit in range(n):
        prefix = "cpbd{0}".format(out_bit)
        lines.append("  wire q{0}_bdd = {1};".format(out_bit, comp_edge_expr(roots[out_bit], prefix)))
    lines.append("  assign out = {{{0}}};".format(", ".join("q{0}_bdd".format(bit) for bit in range(n - 1, -1, -1))))
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def render_bdd_perbit(module, n, variant):
    if n > 7:
        return None
    if variant in ("bdd_perbit_interleave_msb", "bdd_perbit_formula_hi2", "bdd_perbit_formula_hi3"):
        order = bdd_order(n, "bdd_interleave_msb")
    elif variant == "bdd_perbit_search_best":
        order = bdd_order(n, "bdd_search_best")
    elif variant == "bdd_perbit_bitopt":
        order = None
    else:
        raise RuntimeError("unknown per-bit BDD variant {0}".format(variant))

    skip_high = 0
    if variant == "bdd_perbit_formula_hi2":
        if n != 5:
            return None
        skip_high = 2
    elif variant == "bdd_perbit_formula_hi3":
        if n != 5:
            return None
        skip_high = 3

    roots = {}
    bit_nodes = {}
    for out_bit in range(n - skip_high):
        bit_order = order
        if variant == "bdd_perbit_bitopt":
            if n != 5:
                return None
            bit_order = {
                0: [9, 4, 8, 3, 7, 2, 6, 1, 0, 5],
                1: [4, 8, 7, 3, 6, 2, 1, 5, 0, 9],
                2: [0, 8, 4, 7, 6, 3, 2, 5, 1, 9],
                3: [6, 4, 9, 1, 7, 5, 3, 0, 8, 2],
                4: [9, 8, 7, 6, 5, 4, 3, 2, 1, 0],
            }[out_bit]
        unique = {}
        nodes = []
        roots[out_bit] = build_bdd_for_bit(n, out_bit, bit_order, unique, nodes)
        bit_nodes[out_bit] = nodes

    lines = header(module, n)
    if variant == "bdd_perbit_bitopt":
        lines.append("  // Per-output BDDs with independently searched ex266 orders.")
    else:
        lines.append("  // Per-output BDDs; no cross-bit node sharing. order: {0}".format(",".join(str(item) for item in order)))
    if skip_high:
        lines.append("  wire q4_formula = {0};".format(ex266_q4_expr()))
        lines.append("  wire q3_formula = {0};".format(ex266_q3_expr()))
        if skip_high == 3:
            lines.append("  wire q2_formula = {0};".format(ex266_q2_expr()))
    for out_bit, nodes in bit_nodes.items():
        prefix = "pbd{0}".format(out_bit)
        for offset, (var, low, high) in enumerate(nodes):
            node_id = offset + 2
            lines.append(
                "  wire {0}_n{1} = in[{2}] ? {3} : {4};".format(
                    prefix,
                    node_id,
                    var,
                    selected_bdd_expr(high, prefix),
                    selected_bdd_expr(low, prefix),
                )
            )
    for out_bit in range(n - skip_high):
        prefix = "pbd{0}".format(out_bit)
        lines.append("  wire q{0}_bdd = {1};".format(out_bit, selected_bdd_expr(roots[out_bit], prefix)))
    if skip_high == 3:
        lines.append("  assign out = {q4_formula, q3_formula, q2_formula, q1_bdd, q0_bdd};")
    elif skip_high == 2:
        lines.append("  assign out = {q4_formula, q3_formula, q2_bdd, q1_bdd, q0_bdd};")
    else:
        lines.append("  assign out = {{{0}}};".format(", ".join("q{0}_bdd".format(bit) for bit in range(n - 1, -1, -1))))
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def render_hybrid_bdd_high_lo_direct(module, n, high_count, order_name, residual=False):
    if high_count >= n:
        return None
    low_bits = n - high_count
    order = bdd_order(n, order_name)
    unique = {}
    nodes = []
    high_roots = []
    for out_bit in range(low_bits, n):
        high_roots.append(build_bdd_for_bit(n, out_bit, order, unique, nodes))

    lines = header(module, n)
    lines.append(
        "  // Hybrid high-bit BDD plus low-width direct quotient. high_count={0}, order={1}, residual={2}".format(
            high_count, order_name, "1" if residual else "0"
        )
    )
    for offset, (var, low, high) in enumerate(nodes):
        node_id = offset + 2
        lines.append(
            "  wire hbdd_n{0} = in[{1}] ? {2} : {3};".format(
                node_id, var, bdd_expr(high).replace("bdd_n", "hbdd_n"), bdd_expr(low).replace("bdd_n", "hbdd_n")
            )
        )
    high_expr = ", ".join(
        bdd_expr(root).replace("bdd_n", "hbdd_n") for root in reversed(high_roots)
    )
    lines.extend(
        [
            "  wire [{0}:0] q_high_bits = {{{1}}};".format(high_count - 1, high_expr),
            "  wire [{0}:0] safe_b = dbz ? {1}'d1 : b;".format(n - 1, n),
        ]
    )
    if residual:
        lines.extend(
            [
                "  wire [{0}:0] q_high_value = {{q_high_bits, {1}'b0}};".format(n - 1, low_bits),
                "  wire [{0}:0] high_prod = {{1'b0, q_high_value}} * {{1'b0, b}};".format(2 * n + 1),
                "  wire [{0}:0] residual = {{{1}'b0, a}} - high_prod;".format(2 * n + 1, n + 2),
                "  wire [{0}:0] q_low_raw = residual / {{1'b0, safe_b}};".format(low_bits - 1),
            ]
        )
    else:
        lines.append("  wire [{0}:0] q_low_raw = a / safe_b;".format(low_bits - 1))
    lines.append(
        "  wire [{0}:0] q_low = dbz ? {1} : q_low_raw;".format(
            low_bits - 1, const(low_bits, (1 << low_bits) - 1)
        )
    )
    lines.append("  assign out = {{{0}, q_low}};".format(high_expr))
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def mtbdd_terminal_id(value, terminals):
    if value not in terminals:
        terminals[value] = -(len(terminals) + 1)
    return terminals[value]


def mtbdd_output_value(index, n):
    mask = (1 << n) - 1
    a = index & mask
    b = (index >> n) & mask
    return mask if b == 0 else a // b


def build_mtbdd(n, order):
    unique = {}
    nodes = []
    terminals = {}
    cache = {}
    all_indices = tuple(range(1 << (2 * n)))

    def rec(level, indices):
        key = (level, indices)
        if key in cache:
            return cache[key]
        first = mtbdd_output_value(indices[0], n)
        same = True
        for item in indices[1:]:
            if mtbdd_output_value(item, n) != first:
                same = False
                break
        if same or level >= len(order):
            result = mtbdd_terminal_id(first, terminals)
            cache[key] = result
            return result
        var = order[level]
        low = []
        high = []
        mask_value = 1 << var
        for item in indices:
            if item & mask_value:
                high.append(item)
            else:
                low.append(item)
        low_id = rec(level + 1, tuple(low)) if low else mtbdd_terminal_id(0, terminals)
        high_id = rec(level + 1, tuple(high)) if high else mtbdd_terminal_id(0, terminals)
        if low_id == high_id:
            result = low_id
        else:
            node_key = (var, low_id, high_id)
            result = unique.get(node_key)
            if result is None:
                result = len(nodes)
                unique[node_key] = result
                nodes.append(node_key)
        cache[key] = result
        return result

    root = rec(0, all_indices)
    terminal_by_id = {node_id: value for value, node_id in terminals.items()}
    return nodes, terminal_by_id, root


def mtbdd_expr(node_id, n, terminal_by_id):
    if node_id < 0:
        return const(n, terminal_by_id[node_id])
    return "mtbdd_n{0}".format(node_id)


def render_mtbdd(module, n, variant):
    if variant == "mtbdd_b_msb":
        order = bdd_order(n, "bdd_b_msb")
    elif variant == "mtbdd_interleave_msb":
        order = bdd_order(n, "bdd_interleave_msb")
    elif variant == "mtbdd_interleave_a_first_msb":
        order = bdd_order(n, "bdd_interleave_a_first_msb")
    elif variant == "mtbdd_b_lsb_a_msb":
        order = bdd_order(n, "bdd_b_lsb_a_msb")
    else:
        raise RuntimeError("unknown MTBDD variant {0}".format(variant))
    nodes, terminal_by_id, root = build_mtbdd(n, order)
    lines = header(module, n)
    lines.append("  // Multi-terminal BDD over the whole quotient word; order: {0}".format(",".join(str(item) for item in order)))
    for node_id, (var, low, high) in enumerate(nodes):
        lines.append(
            "  wire [{0}:0] mtbdd_n{1} = in[{2}] ? {3} : {4};".format(
                n - 1,
                node_id,
                var,
                mtbdd_expr(high, n, terminal_by_id),
                mtbdd_expr(low, n, terminal_by_id),
            )
        )
    lines.append("  assign out = {0};".format(mtbdd_expr(root, n, terminal_by_id)))
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def reciprocal_shift(n, variant):
    if variant.endswith("_sn"):
        return n
    if variant.endswith("_snp2"):
        return n + 2
    if variant.endswith("_s2n"):
        return 2 * n
    raise RuntimeError("unknown reciprocal shift variant {0}".format(variant))


def render_reciprocal_correct(module, n, variant):
    shift = reciprocal_shift(n, variant)
    mode = "ceil" if variant.startswith("recip_ceil") else "floor"
    rec_width = shift + 1
    prod_width = n + rec_width
    lines = header(module, n)
    lines.extend(
        [
            "  reg [{0}:0] recip;".format(rec_width - 1),
            "  always @* begin",
            "    case (b)",
            "      {0}'d0: recip = {1}'d0;".format(n, rec_width),
        ]
    )
    for divisor in range(1, 1 << n):
        if mode == "ceil":
            rec = ((1 << shift) + divisor - 1) // divisor
        else:
            rec = (1 << shift) // divisor
        lines.append("      {0}'d{1}: recip = {2}'d{3};".format(n, divisor, rec_width, rec))
    lines.extend(
        [
            "      default: recip = {0}'d0;".format(rec_width),
            "    endcase",
            "  end",
            "  wire [{0}:0] prod = a * recip;".format(prod_width - 1),
            "  wire [{0}:0] q0_ext = prod[{1}:{2}];".format(n, shift + n - 1, shift),
            "  wire [{0}:0] q0 = q0_ext[{0}:0];".format(n - 1),
        ]
    )
    if mode == "floor":
        lines.extend(
            [
                "  wire [{0}:0] q_plus = {{1'b0, q0}} + {1}'d1;".format(n, n + 1),
                "  wire [{0}:0] corr_prod = q_plus * {{1'b0, b}};".format(2 * n + 1),
                "  wire inc = (corr_prod <= {{{0}'b0, a}});".format(n + 2),
                "  wire [{0}:0] q_corr = inc ? q_plus[{0}:0] : q0;".format(n - 1),
            ]
        )
    else:
        lines.extend(
            [
                "  wire [{0}:0] corr_prod = {{1'b0, q0}} * {{1'b0, b}};".format(2 * n + 1),
                "  wire dec = (corr_prod > {{{0}'b0, a}});".format(n + 2),
                "  wire [{0}:0] q_corr = q0 - {{ {1}'b0, dec }};".format(n - 1, n - 1),
            ]
        )
    lines.extend(
        [
            "  assign out = dbz ? {0} : q_corr;".format(const(n, (1 << n) - 1)),
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


def render_lz_threshold_lowcase(module, n, low_bits):
    if low_bits >= n:
        return None
    low_limit = 1 << low_bits
    lines = header(module, n)
    lines.extend(
        [
            "  reg [{0}:0] q;".format(n - 1),
            "  always @* begin",
            "    q = {0}'b0;".format(n),
            "    if (dbz) begin",
            "      q = {0};".format(const(n, (1 << n) - 1)),
            "    end else if (b > a) begin",
            "      q = {0}'b0;".format(n),
            "    end else if (b < {0}'d{1}) begin".format(n, low_limit),
            "      case (b[{0}:0])".format(low_bits - 1),
        ]
    )
    for divisor in range(1, low_limit):
        lines.append(
            "        {0}'d{1}: q = {2};".format(low_bits, divisor, const_div_expr(n, divisor))
        )
    lines.extend(
        [
            "        default: q = {0}'b0;".format(n),
            "      endcase",
            "    end",
        ]
    )
    for bit in range(n - 1, low_bits - 1, -1):
        qmax = (1 << (n - bit)) - 1
        lines.append("    else if (b[{0}]) begin".format(bit))
        first = True
        for qval in range(qmax, 0, -1):
            keyword = "if" if first else "else if"
            lines.append(
                "      {0} ({{{1}'b0, a}} >= ({2}'d{3} * {{{1}'b0, b}})) q = {1}'d{3};".format(
                    keyword, n, 2 * n, qval
                )
            )
            first = False
        lines.append("    end")
    lines.extend(
        [
            "  end",
            "  assign out = q;",
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


def ex266_q4_expr():
    return "(dbz || ((b == 5'd1) && a[4]))"


def ex266_q3_expr():
    return (
        "(dbz || ((b == 5'd1) && a[3]) || "
        "((b == 5'd2) && a[4]) || ((b == 5'd3) && (a >= 5'd24)))"
    )


def ex266_q2_expr():
    return (
        "(dbz || ((b == 5'd1) && a[2]) || ((b == 5'd2) && a[3]) || "
        "((b == 5'd3) && (a >= 5'd12) && (a < 5'd24)) || "
        "((b == 5'd4) && a[4]) || ((b == 5'd5) && (a >= 5'd20)) || "
        "((b == 5'd6) && (a >= 5'd24)) || ((b == 5'd7) && (a >= 5'd28)))"
    )


def selected_bdd_expr(node_id, prefix):
    if node_id == 0:
        return "1'b0"
    if node_id == 1:
        return "1'b1"
    return "{0}_n{1}".format(prefix, node_id)


def render_ex266_formula_high_low_bdd(module, n, high_bits):
    if n != 5 or high_bits not in (2, 3):
        return None
    low_bits = n - high_bits
    order = bdd_order(n, "bdd_search_best")
    unique = {}
    nodes = []
    roots = []
    for out_bit in range(low_bits):
        roots.append(build_bdd_for_bit(n, out_bit, order, unique, nodes))

    prefix = "lbd"
    lines = header(module, n)
    lines.append("  // ex266-specific: formula quotient high bits plus shared low-bit BDD.")
    lines.append("  wire q4_formula = {0};".format(ex266_q4_expr()))
    lines.append("  wire q3_formula = {0};".format(ex266_q3_expr()))
    if high_bits == 3:
        lines.append("  wire q2_formula = {0};".format(ex266_q2_expr()))
    lines.append("  // Low BDD order: {0}".format(",".join(str(item) for item in order)))
    for offset, (var, low, high) in enumerate(nodes):
        node_id = offset + 2
        lines.append(
            "  wire {0}_n{1} = in[{2}] ? {3} : {4};".format(
                prefix,
                node_id,
                var,
                selected_bdd_expr(high, prefix),
                selected_bdd_expr(low, prefix),
            )
        )
    low_concat = ", ".join(selected_bdd_expr(root, prefix) for root in reversed(roots))
    if high_bits == 2:
        lines.append("  assign out = {{q4_formula, q3_formula, {0}}};".format(low_concat))
    else:
        lines.append("  assign out = {{q4_formula, q3_formula, q2_formula, {0}}};".format(low_concat))
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def a_range_expr(n, lo, hi):
    max_a = (1 << n) - 1
    lo = max(0, lo)
    hi = min(max_a, hi)
    if lo > hi:
        return "1'b0"
    if lo == 0 and hi == max_a:
        return "1'b1"
    if lo == hi:
        return "(a == {0}'d{1})".format(n, lo)
    if lo == 0:
        return "(a <= {0}'d{1})".format(n, hi)
    if hi == max_a:
        return "(a >= {0}'d{1})".format(n, lo)
    return "((a >= {0}'d{1}) && (a <= {0}'d{2}))".format(n, lo, hi)


def quotient_bit_interval_expr(n, divisor, out_bit):
    if divisor == 0:
        return "1'b1"
    if divisor == 1:
        return "a[{0}]".format(out_bit)
    if power_of_two(divisor):
        src_bit = out_bit + int_log2(divisor)
        if src_bit >= n:
            return "1'b0"
        return "a[{0}]".format(src_bit)
    max_a = (1 << n) - 1
    max_q = max_a // divisor
    ranges = []
    start = None
    prev = None
    for qval in range(max_q + 1):
        if ((qval >> out_bit) & 1) == 0:
            if start is not None:
                ranges.append((start * divisor, min(max_a, (prev + 1) * divisor - 1)))
                start = None
            continue
        if start is None:
            start = qval
        prev = qval
    if start is not None:
        ranges.append((start * divisor, min(max_a, (prev + 1) * divisor - 1)))
    if not ranges:
        return "1'b0"
    return " || ".join(a_range_expr(n, lo, hi) for lo, hi in ranges)


def render_ex266_interval_case(module, n, high_formula_bits):
    if n != 5:
        return None
    if high_formula_bits not in (0, 2, 3):
        return None
    low_bits = n if high_formula_bits == 0 else n - high_formula_bits
    lines = header(module, n)
    if high_formula_bits:
        lines.append("  wire q4_formula = {0};".format(ex266_q4_expr()))
        lines.append("  wire q3_formula = {0};".format(ex266_q3_expr()))
        if high_formula_bits == 3:
            lines.append("  wire q2_formula = {0};".format(ex266_q2_expr()))
        lines.append("  reg [{0}:0] q_low;".format(low_bits - 1))
    else:
        lines.append("  reg [{0}:0] q;".format(n - 1))
    lines.extend(
        [
            "  always @* begin",
            "    {0} = {1}'b0;".format("q_low" if high_formula_bits else "q", low_bits if high_formula_bits else n),
            "    case (b)",
        ]
    )
    for divisor in range(0, 1 << n):
        lines.append("      {0}'d{1}: begin".format(n, divisor))
        for out_bit in range(low_bits):
            target = "q_low[{0}]".format(out_bit) if high_formula_bits else "q[{0}]".format(out_bit)
            lines.append("        {0} = {1};".format(target, quotient_bit_interval_expr(n, divisor, out_bit)))
        lines.append("      end")
    lines.extend(
        [
            "      default: begin end",
            "    endcase",
            "  end",
        ]
    )
    if high_formula_bits == 2:
        lines.append("  assign out = {q4_formula, q3_formula, q_low};")
    elif high_formula_bits == 3:
        lines.append("  assign out = {q4_formula, q3_formula, q2_formula, q_low};")
    else:
        lines.append("  assign out = q;")
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def render_ex266_hi_residual_shift(module, n, high_bits):
    if n != 5 or high_bits not in (2, 3):
        return None
    low_bits = n - high_bits
    width = 10
    lines = header(module, n)
    lines.append("  wire q4_formula = {0};".format(ex266_q4_expr()))
    lines.append("  wire q3_formula = {0};".format(ex266_q3_expr()))
    if high_bits == 3:
        lines.append("  wire q2_formula = {0};".format(ex266_q2_expr()))
    lines.extend(
        [
            "  wire [{0}:0] b_wide = {{{1}'b0, b}};".format(width - 1, width - n),
            "  wire [{0}:0] prod_q4 = q4_formula ? (b_wide << 4) : {1}'b0;".format(width - 1, width),
            "  wire [{0}:0] prod_q3 = q3_formula ? (b_wide << 3) : {1}'b0;".format(width - 1, width),
        ]
    )
    if high_bits == 3:
        lines.append("  wire [{0}:0] prod_q2 = q2_formula ? (b_wide << 2) : {1}'b0;".format(width - 1, width))
        lines.append("  wire [{0}:0] high_prod = prod_q4 + prod_q3 + prod_q2;".format(width - 1))
    else:
        lines.append("  wire [{0}:0] high_prod = prod_q4 + prod_q3;".format(width - 1))
    lines.extend(
        [
            "  wire [{0}:0] residual_start = {{{1}'b0, a}} - high_prod;".format(width - 1, width - n),
            "  reg [{0}:0] q_low;".format(low_bits - 1),
            "  reg [{0}:0] rem;".format(width - 1),
            "  reg [{0}:0] denom_shift;".format(width - 1),
            "  integer i;",
            "  always @* begin",
            "    q_low = {0}'b0;".format(low_bits),
            "    rem = residual_start;",
            "    denom_shift = {0}'b0;".format(width),
            "    if (dbz) begin",
            "      q_low = {0};".format(const(low_bits, (1 << low_bits) - 1)),
            "    end else begin",
            "      for (i = {0}; i >= 0; i = i - 1) begin".format(low_bits - 1),
            "        denom_shift = b_wide << i;",
            "        if (rem >= denom_shift) begin",
            "          rem = rem - denom_shift;",
            "          q_low[i] = 1'b1;",
            "        end",
            "      end",
            "    end",
            "  end",
        ]
    )
    if high_bits == 3:
        lines.append("  assign out = dbz ? 5'h1f : {q4_formula, q3_formula, q2_formula, q_low};")
    else:
        lines.append("  assign out = dbz ? 5'h1f : {q4_formula, q3_formula, q_low};")
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def render_ex266_hi_residual_parallel(module, n, high_bits):
    if n != 5 or high_bits not in (2, 3):
        return None
    low_bits = n - high_bits
    width = 10
    max_digit = (1 << low_bits) - 1
    lines = header(module, n)
    lines.append("  wire q4_formula = {0};".format(ex266_q4_expr()))
    lines.append("  wire q3_formula = {0};".format(ex266_q3_expr()))
    if high_bits == 3:
        lines.append("  wire q2_formula = {0};".format(ex266_q2_expr()))
    lines.extend(
        [
            "  wire [{0}:0] a_wide = {{{1}'b0, a}};".format(width - 1, width - n),
            "  wire [{0}:0] b_wide = {{{1}'b0, b}};".format(width - 1, width - n),
            "  wire [{0}:0] prod_q4 = q4_formula ? (b_wide << 4) : {1}'b0;".format(width - 1, width),
            "  wire [{0}:0] prod_q3 = q3_formula ? (b_wide << 3) : {1}'b0;".format(width - 1, width),
        ]
    )
    if high_bits == 3:
        lines.append("  wire [{0}:0] prod_q2 = q2_formula ? (b_wide << 2) : {1}'b0;".format(width - 1, width))
        lines.append("  wire [{0}:0] high_prod = prod_q4 + prod_q3 + prod_q2;".format(width - 1))
    else:
        lines.append("  wire [{0}:0] high_prod = prod_q4 + prod_q3;".format(width - 1))
    for digit in range(1, max_digit + 1):
        if digit == 1:
            multiple = "b_wide"
        elif digit & (digit - 1) == 0:
            multiple = "(b_wide << {0})".format(digit.bit_length() - 1)
        else:
            parts = []
            bit = 0
            temp = digit
            while temp:
                if temp & 1:
                    parts.append("b_wide" if bit == 0 else "(b_wide << {0})".format(bit))
                temp >>= 1
                bit += 1
            multiple = " + ".join(parts)
        lines.append("  wire ge{0} = (a_wide >= (high_prod + {1}));".format(digit, multiple))
    if low_bits == 2:
        lines.extend(
            [
                "  wire q1_low = ge2;",
                "  wire q0_low = (ge1 && !ge2) || ge3;",
                "  assign out = dbz ? 5'h1f : {q4_formula, q3_formula, q2_formula, q1_low, q0_low};",
            ]
        )
    else:
        lines.extend(
            [
                "  wire q2_low = ge4;",
                "  wire q1_low = (ge2 && !ge4) || ge6;",
                "  wire q0_low = (ge1 && !ge2) || (ge3 && !ge4) || (ge5 && !ge6) || ge7;",
                "  assign out = dbz ? 5'h1f : {q4_formula, q3_formula, q2_low, q1_low, q0_low};",
            ]
        )
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def const_multiple_expr(signal, value):
    if value == 0:
        return "10'b0"
    if value == 1:
        return signal
    if value & (value - 1) == 0:
        return "({0} << {1})".format(signal, value.bit_length() - 1)
    parts = []
    bit = 0
    temp = value
    while temp:
        if temp & 1:
            parts.append(signal if bit == 0 else "({0} << {1})".format(signal, bit))
        temp >>= 1
        bit += 1
    return "(" + " + ".join(parts) + ")"


def render_ex266_parallel_threshold(module, n):
    if n != 5:
        return None
    width = 10
    lines = header(module, n)
    lines.extend(
        [
            "  wire [{0}:0] a_wide = {{{1}'b0, a}};".format(width - 1, width - n),
            "  wire [{0}:0] b_wide = {{{1}'b0, b}};".format(width - 1, width - n),
        ]
    )
    for threshold in range(1, 32):
        lines.append(
            "  wire ge{0} = (a_wide >= {1});".format(
                threshold, const_multiple_expr("b_wide", threshold)
            )
        )
    lines.extend(
        [
            "  wire q4 = ge16;",
            "  wire q3 = (ge8 && !ge16) || ge24;",
            "  wire q2 = (ge4 && !ge8) || (ge12 && !ge16) || (ge20 && !ge24) || ge28;",
            "  wire q1 = (ge2 && !ge4) || (ge6 && !ge8) || (ge10 && !ge12) || (ge14 && !ge16) || (ge18 && !ge20) || (ge22 && !ge24) || (ge26 && !ge28) || ge30;",
            "  wire q0 = (ge1 && !ge2) || (ge3 && !ge4) || (ge5 && !ge6) || (ge7 && !ge8) || (ge9 && !ge10) || (ge11 && !ge12) || (ge13 && !ge14) || (ge15 && !ge16) || (ge17 && !ge18) || (ge19 && !ge20) || (ge21 && !ge22) || (ge23 && !ge24) || (ge25 && !ge26) || (ge27 && !ge28) || (ge29 && !ge30) || ge31;",
            "  assign out = dbz ? 5'h1f : {q4, q3, q2, q1, q0};",
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


def udiv_value_from_assign(assign, n):
    a_value = 0
    b_value = 0
    for bit in range(n):
        a_value |= assign[bit] << bit
        b_value |= assign[n + bit] << bit
    return ((1 << n) - 1) if b_value == 0 else a_value // b_value


def ex266_value_from_assign(assign):
    return udiv_value_from_assign(assign, 5)


def cofactor_order_interleave(n, fixed_vars):
    fixed = set(fixed_vars)
    order = []
    for bit in range(n - 1, -1, -1):
        for var in (n + bit, bit):
            if var not in fixed:
                order.append(var)
    return order


def build_cofactor_mtbdd(n, fixed, order):
    unique = {}
    nodes = []
    terminals = {}
    assigns = []
    for mask_value in range(1 << len(order)):
        assign = dict(fixed)
        for offset, var in enumerate(order):
            assign[var] = (mask_value >> offset) & 1
        assigns.append(assign)

    def terminal(value):
        if value not in terminals:
            terminals[value] = -(len(terminals) + 1)
        return terminals[value]

    cache = {}

    def rec(level, indices):
        key = (level, tuple(indices))
        if key in cache:
            return cache[key]
        first = udiv_value_from_assign(assigns[indices[0]], n)
        same = True
        for item in indices[1:]:
            if udiv_value_from_assign(assigns[item], n) != first:
                same = False
                break
        if same or level >= len(order):
            result = terminal(first)
            cache[key] = result
            return result
        var = order[level]
        low = []
        high = []
        for item in indices:
            if assigns[item][var]:
                high.append(item)
            else:
                low.append(item)
        low_id = rec(level + 1, low) if low else terminal(0)
        high_id = rec(level + 1, high) if high else terminal(0)
        if low_id == high_id:
            result = low_id
        else:
            node_key = (var, low_id, high_id)
            result = unique.get(node_key)
            if result is None:
                result = len(nodes)
                unique[node_key] = result
                nodes.append(node_key)
        cache[key] = result
        return result

    root = rec(0, list(range(len(assigns))))
    terminal_by_id = {node_id: value for value, node_id in terminals.items()}
    return nodes, terminal_by_id, root


def cofactor_mtbdd_expr(prefix, node_id, n, terminal_by_id):
    if node_id < 0:
        return const(n, terminal_by_id[node_id])
    return "{0}_n{1}".format(prefix, node_id)


def render_ex266_cofactor_mtbdd(module, n, high_bits):
    if n != 5 or high_bits not in (1, 2, 3, 4):
        return None
    fixed_vars = [n + bit for bit in range(n - 1, n - high_bits - 1, -1)]
    order = cofactor_order_interleave(n, fixed_vars)
    groups = 1 << high_bits
    lines = header(module, n)
    lines.append(
        "  // ex266 word-level MTBDD cofactors by b high {0} bits; inner order: {1}".format(
            high_bits, ",".join(str(item) for item in order)
        )
    )
    group_roots = []
    for group in range(groups):
        fixed = {}
        for offset, var in enumerate(fixed_vars):
            fixed[var] = (group >> (high_bits - 1 - offset)) & 1
        nodes, terminal_by_id, root = build_cofactor_mtbdd(n, fixed, order)
        prefix = "cof{0}".format(group)
        for node_id, (var, low, high) in enumerate(nodes):
            lines.append(
                "  wire [{0}:0] {1}_n{2} = in[{3}] ? {4} : {5};".format(
                    n - 1,
                    prefix,
                    node_id,
                    var,
                    cofactor_mtbdd_expr(prefix, high, n, terminal_by_id),
                    cofactor_mtbdd_expr(prefix, low, n, terminal_by_id),
                )
            )
        root_expr = cofactor_mtbdd_expr(prefix, root, n, terminal_by_id)
        lines.append("  wire [{0}:0] {1}_out = {2};".format(n - 1, prefix, root_expr))
        group_roots.append("{0}_out".format(prefix))
    sel_hi = n - 1
    sel_lo = n - high_bits
    lines.extend(
        [
            "  reg [{0}:0] q;".format(n - 1),
            "  always @* begin",
            "    case (b[{0}:{1}])".format(sel_hi, sel_lo),
        ]
    )
    for group, expr in enumerate(group_roots):
        lines.append("      {0}'d{1}: q = {2};".format(high_bits, group, expr))
    lines.extend(
        [
            "      default: q = {0}'b0;".format(n),
            "    endcase",
            "  end",
            "  assign out = q;",
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


def build_fixed_bdd_for_bit(n, out_bit, fixed, order, unique, nodes):
    assigns = []
    for mask_value in range(1 << len(order)):
        assign = dict(fixed)
        for offset, var in enumerate(order):
            assign[var] = (mask_value >> offset) & 1
        assigns.append(assign)

    cache = {}

    def bit_value(assign):
        return (udiv_value_from_assign(assign, n) >> out_bit) & 1

    def rec(level, indices):
        key = (level, tuple(indices))
        if key in cache:
            return cache[key]
        first = bit_value(assigns[indices[0]])
        same = True
        for item in indices[1:]:
            if bit_value(assigns[item]) != first:
                same = False
                break
        if same or level >= len(order):
            cache[key] = first
            return first
        var = order[level]
        low = []
        high = []
        for item in indices:
            if assigns[item][var]:
                high.append(item)
            else:
                low.append(item)
        low_id = rec(level + 1, low) if low else 0
        high_id = rec(level + 1, high) if high else 0
        if low_id == high_id:
            result = low_id
        else:
            node_key = (var, low_id, high_id)
            result = unique.get(node_key)
            if result is None:
                result = len(nodes) + 2
                unique[node_key] = result
                nodes.append(node_key)
        cache[key] = result
        return result

    return rec(0, list(range(len(assigns))))


def fixed_bdd_expr(prefix, node_id):
    if node_id == 0:
        return "1'b0"
    if node_id == 1:
        return "1'b1"
    return "{0}_n{1}".format(prefix, node_id)


def render_ex266_cofactor_bitbdd_vars(module, n, fixed_vars):
    if not fixed_vars:
        return None
    fixed_vars = list(fixed_vars)
    high_bits = len(fixed_vars)
    order = cofactor_order_interleave(n, fixed_vars)
    groups = 1 << high_bits
    lines = header(module, n)
    lines.append(
        "  // ex266 per-bit BDD cofactors by selector vars {0}; inner order: {1}".format(
            ",".join(str(item) for item in fixed_vars), ",".join(str(item) for item in order)
        )
    )
    lines.append("  wire [{0}:0] cof_sel = {{{1}}};".format(high_bits - 1, ", ".join("in[{0}]".format(var) for var in fixed_vars)))
    bit_group_exprs = {bit: [] for bit in range(n)}
    for group in range(groups):
        fixed = {}
        for offset, var in enumerate(fixed_vars):
            fixed[var] = (group >> (high_bits - 1 - offset)) & 1
        for out_bit in range(n):
            unique = {}
            nodes = []
            root = build_fixed_bdd_for_bit(n, out_bit, fixed, order, unique, nodes)
            prefix = "cb{0}_{1}".format(group, out_bit)
            for offset, (var, low, high) in enumerate(nodes):
                node_id = offset + 2
                lines.append(
                    "  wire {0}_n{1} = in[{2}] ? {3} : {4};".format(
                        prefix,
                        node_id,
                        var,
                        fixed_bdd_expr(prefix, high),
                        fixed_bdd_expr(prefix, low),
                    )
                )
            bit_group_exprs[out_bit].append(fixed_bdd_expr(prefix, root))

    for out_bit in range(n):
        lines.append("  reg q{0};".format(out_bit))
        lines.append("  always @* begin")
        lines.append("    case (cof_sel)")
        for group, expr in enumerate(bit_group_exprs[out_bit]):
            lines.append("      {0}'d{1}: q{2} = {3};".format(high_bits, group, out_bit, expr))
        lines.extend(
            [
                "      default: q{0} = 1'b0;".format(out_bit),
                "    endcase",
                "  end",
            ]
        )
    lines.append("  assign out = {q4, q3, q2, q1, q0};")
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def render_ex266_cofactor_bitbdd_wordmux(module, n, fixed_vars):
    if not fixed_vars:
        return None
    fixed_vars = list(fixed_vars)
    high_bits = len(fixed_vars)
    order = cofactor_order_interleave(n, fixed_vars)
    groups = 1 << high_bits
    lines = header(module, n)
    lines.append(
        "  // ex266 per-bit BDD cofactors with shared word mux; selector vars {0}; inner order: {1}".format(
            ",".join(str(item) for item in fixed_vars), ",".join(str(item) for item in order)
        )
    )
    lines.append("  wire [{0}:0] cof_sel = {{{1}}};".format(high_bits - 1, ", ".join("in[{0}]".format(var) for var in fixed_vars)))
    group_bit_exprs = []
    for group in range(groups):
        fixed = {}
        for offset, var in enumerate(fixed_vars):
            fixed[var] = (group >> (high_bits - 1 - offset)) & 1
        bit_exprs = []
        for out_bit in range(n):
            unique = {}
            nodes = []
            root = build_fixed_bdd_for_bit(n, out_bit, fixed, order, unique, nodes)
            prefix = "cwm{0}_{1}".format(group, out_bit)
            for offset, (var, low, high) in enumerate(nodes):
                node_id = offset + 2
                lines.append(
                    "  wire {0}_n{1} = in[{2}] ? {3} : {4};".format(
                        prefix,
                        node_id,
                        var,
                        fixed_bdd_expr(prefix, high),
                        fixed_bdd_expr(prefix, low),
                    )
                )
            bit_exprs.append(fixed_bdd_expr(prefix, root))
        lines.append("  wire [{0}:0] group{1}_out = {{{2}}};".format(n - 1, group, ", ".join(reversed(bit_exprs))))
        group_bit_exprs.append("group{0}_out".format(group))
    lines.extend(
        [
            "  reg [{0}:0] q;".format(n - 1),
            "  always @* begin",
            "    case (cof_sel)",
        ]
    )
    for group, expr in enumerate(group_bit_exprs):
        lines.append("      {0}'d{1}: q = {2};".format(high_bits, group, expr))
    lines.extend(
        [
            "      default: q = {0}'b0;".format(n),
            "    endcase",
            "  end",
            "  assign out = q;",
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


def build_fixed_comp_bdd_for_bit(n, out_bit, fixed, order, unique, nodes):
    assigns = []
    for mask_value in range(1 << len(order)):
        assign = dict(fixed)
        for offset, var in enumerate(order):
            assign[var] = (mask_value >> offset) & 1
        assigns.append(assign)

    def bit_value(assign):
        return (udiv_value_from_assign(assign, n) >> out_bit) & 1

    cache = {}

    def rec(level, indices):
        key = (level, tuple(indices))
        if key in cache:
            return cache[key]
        first = bit_value(assigns[indices[0]])
        same = True
        for item in indices[1:]:
            if bit_value(assigns[item]) != first:
                same = False
                break
        if same or level >= len(order):
            result = 1 if first else 0
            cache[key] = result
            return result
        var = order[level]
        low = []
        high = []
        for item in indices:
            if assigns[item][var]:
                high.append(item)
            else:
                low.append(item)
        low_id = rec(level + 1, low) if low else 0
        high_id = rec(level + 1, high) if high else 0
        result = comp_mk(var, low_id, high_id, unique, nodes)
        cache[key] = result
        return result

    return rec(0, list(range(len(assigns))))


def render_ex266_cofactor_comp_wordmux(module, n, fixed_vars):
    if not fixed_vars:
        return None
    fixed_vars = list(fixed_vars)
    high_bits = len(fixed_vars)
    order = cofactor_order_interleave(n, fixed_vars)
    groups = 1 << high_bits
    lines = header(module, n)
    lines.append(
        "  // ex266 complemented per-bit BDD cofactors with shared word mux; selector vars {0}; inner order: {1}".format(
            ",".join(str(item) for item in fixed_vars), ",".join(str(item) for item in order)
        )
    )
    lines.append("  wire [{0}:0] cof_sel = {{{1}}};".format(high_bits - 1, ", ".join("in[{0}]".format(var) for var in fixed_vars)))
    group_exprs = []
    for group in range(groups):
        fixed = {}
        for offset, var in enumerate(fixed_vars):
            fixed[var] = (group >> (high_bits - 1 - offset)) & 1
        bit_exprs = []
        for out_bit in range(n):
            unique = {}
            nodes = []
            root = build_fixed_comp_bdd_for_bit(n, out_bit, fixed, order, unique, nodes)
            prefix = "ccwm{0}_{1}".format(group, out_bit)
            for offset, (var, low, high) in enumerate(nodes):
                node_id = offset + 1
                lines.append(
                    "  wire {0}_n{1} = in[{2}] ? {3} : {4};".format(
                        prefix,
                        node_id,
                        var,
                        comp_edge_expr(high, prefix),
                        comp_edge_expr(low, prefix),
                    )
                )
            bit_exprs.append(comp_edge_expr(root, prefix))
        lines.append("  wire [{0}:0] group{1}_out = {{{2}}};".format(n - 1, group, ", ".join(reversed(bit_exprs))))
        group_exprs.append("group{0}_out".format(group))
    lines.extend(
        [
            "  reg [{0}:0] q;".format(n - 1),
            "  always @* begin",
            "    case (cof_sel)",
        ]
    )
    for group, expr in enumerate(group_exprs):
        lines.append("      {0}'d{1}: q = {2};".format(high_bits, group, expr))
    lines.extend(
        [
            "      default: q = {0}'b0;".format(n),
            "    endcase",
            "  end",
            "  assign out = q;",
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


def mux_tree_expr(items, sel_name, bit_index):
    if len(items) == 1:
        return items[0]
    half = len(items) // 2
    low_expr = mux_tree_expr(items[:half], sel_name, bit_index - 1)
    high_expr = mux_tree_expr(items[half:], sel_name, bit_index - 1)
    return "({0}[{1}] ? {2} : {3})".format(sel_name, bit_index, high_expr, low_expr)


def render_ex266_cofactor_tree_wordmux(module, n, fixed_vars):
    if not fixed_vars:
        return None
    fixed_vars = list(fixed_vars)
    high_bits = len(fixed_vars)
    order = cofactor_order_interleave(n, fixed_vars)
    groups = 1 << high_bits
    lines = header(module, n)
    lines.append(
        "  // ex266 per-bit BDD cofactors with explicit balanced word mux tree; selector vars {0}; inner order: {1}".format(
            ",".join(str(item) for item in fixed_vars), ",".join(str(item) for item in order)
        )
    )
    lines.append("  wire [{0}:0] cof_sel = {{{1}}};".format(high_bits - 1, ", ".join("in[{0}]".format(var) for var in fixed_vars)))
    group_exprs = []
    for group in range(groups):
        fixed = {}
        for offset, var in enumerate(fixed_vars):
            fixed[var] = (group >> (high_bits - 1 - offset)) & 1
        bit_exprs = []
        for out_bit in range(n):
            unique = {}
            nodes = []
            root = build_fixed_bdd_for_bit(n, out_bit, fixed, order, unique, nodes)
            prefix = "ctwm{0}_{1}".format(group, out_bit)
            for offset, (var, low, high) in enumerate(nodes):
                node_id = offset + 2
                lines.append(
                    "  wire {0}_n{1} = in[{2}] ? {3} : {4};".format(
                        prefix,
                        node_id,
                        var,
                        fixed_bdd_expr(prefix, high),
                        fixed_bdd_expr(prefix, low),
                    )
                )
            bit_exprs.append(fixed_bdd_expr(prefix, root))
        lines.append("  wire [{0}:0] group{1}_out = {{{2}}};".format(n - 1, group, ", ".join(reversed(bit_exprs))))
        group_exprs.append("group{0}_out".format(group))
    lines.append("  assign out = {0};".format(mux_tree_expr(group_exprs, "cof_sel", high_bits - 1)))
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def render_ex266_cofactor_bitbdd(module, n, high_bits):
    if n != 5 or high_bits not in (2, 3, 4):
        return None
    fixed_vars = [n + bit for bit in range(n - 1, n - high_bits - 1, -1)]
    return render_ex266_cofactor_bitbdd_vars(module, n, fixed_vars)


def selector_bhi_ahi(n, b_high_bits, a_high_bits):
    if b_high_bits <= 0 or a_high_bits < 0:
        return None
    if b_high_bits > n or a_high_bits > n:
        return None
    vars_out = []
    vars_out.extend(n + bit for bit in range(n - 1, n - b_high_bits - 1, -1))
    vars_out.extend(bit for bit in range(n - 1, n - a_high_bits - 1, -1))
    return vars_out


def render_verilog(module, n, variant):
    if variant == "direct_guarded":
        return render_direct_guarded(module, n)
    if variant == "direct_safe":
        return render_direct_safe(module, n)
    if variant == "direct_gt_guard":
        return render_direct_gt_guard(module, n)
    if variant == "restoring_narrow":
        return render_restoring_narrow(module, n)
    if variant == "restoring_gt_guard":
        return render_restoring_gt_guard(module, n)
    if variant == "case_denominator_manual":
        return render_case_denominator_manual(module, n)
    if variant == "case_dividend_ranges":
        return render_case_dividend_ranges(module, n)
    if variant == "threshold_desc":
        return render_threshold_desc(module, n, False)
    if variant == "threshold_desc_guarded":
        return render_threshold_desc(module, n, True)
    if variant == "small_divisor_fast_direct":
        return render_small_divisor_fast(module, n, "direct")
    if variant == "small_divisor_fast_restoring":
        return render_small_divisor_fast(module, n, "restoring")
    if variant == "shift_subtract":
        return render_shift_subtract(module, n, False)
    if variant == "shift_subtract_gt_guard":
        return render_shift_subtract(module, n, True)
    if variant == "shift_subtract_narrow":
        return render_radix_shift_subtract(module, n, 1, False, True)
    if variant == "radix4_shift_subtract":
        return render_radix_shift_subtract(module, n, 2, False)
    if variant == "radix4_shift_subtract_gt_guard":
        return render_radix_shift_subtract(module, n, 2, True)
    if variant == "radix4_shift_subtract_narrow":
        return render_radix_shift_subtract(module, n, 2, False, True)
    if variant == "radix4_compact_digit":
        return render_radix4_compact_digit(module, n)
    if variant == "radix4_top1_shift":
        return render_radix4_topk_shift(module, n, 1)
    if variant == "radix4_top2_shift":
        return render_radix4_topk_shift(module, n, 2)
    if variant == "radix4_top3_shift":
        return render_radix4_topk_shift(module, n, 3)
    if variant == "radix4_top3_compact_digit":
        return render_radix4_compact_digit(module, n, 3)
    if variant == "radix8_shift_subtract":
        return render_radix_shift_subtract(module, n, 3, False)
    if variant == "radix8_shift_subtract_gt_guard":
        return render_radix_shift_subtract(module, n, 3, True)
    if variant == "radix8_shift_subtract_narrow":
        return render_radix_shift_subtract(module, n, 3, False, True)
    if variant == "binary_search_product":
        return render_binary_search_product(module, n, False, False)
    if variant == "binary_search_shiftadd":
        return render_binary_search_product(module, n, True, False)
    if variant == "binary_search_shiftadd_gt_guard":
        return render_binary_search_product(module, n, True, True)
    if variant == "denom_split_threshold_direct":
        return render_denom_split_threshold(module, n, "direct")
    if variant == "denom_split_threshold_restoring":
        return render_denom_split_threshold(module, n, "restoring")
    if variant == "denom_split_direct":
        return render_denom_split_direct(module, n, False)
    if variant == "denom_split_direct_gt_guard":
        return render_denom_split_direct(module, n, True)
    if variant == "denom_lz_range_direct":
        return render_denom_lz_range_direct(module, n)
    if variant == "denom_lz_range_smallcase":
        return render_denom_lz_range_smallcase(module, n)
    if variant == "denom_lz_range_lowbdd":
        return render_denom_lz_range_lowbdd(module, n)
    if variant == "denom_lz_range_lowrestoring":
        return render_denom_lz_range_lowrestoring(module, n)
    if variant == "sop_qm":
        return render_sop_qm(module, n)
    if variant in (
        "bdd_b_lsb",
        "bdd_b_msb",
        "bdd_b_msb_a_lsb",
        "bdd_b_lsb_a_msb",
        "bdd_interleave_msb",
        "bdd_interleave_lsb",
        "bdd_interleave_a_first_msb",
        "bdd_interleave_a_first_lsb",
        "bdd_a_msb",
        "bdd_greedy_b_msb",
        "bdd_greedy_interleave_msb",
        "bdd_search_best",
        "bdd_qor_order0",
        "bdd_qor_order1",
        "bdd_qor_order2",
    ):
        return render_bdd(module, n, variant)
    if variant in ("bdd_comp_interleave_msb", "bdd_comp_search_best"):
        return render_comp_bdd(module, n, variant)
    if variant in ("bdd_comp_perbit_interleave_msb", "bdd_comp_perbit_search_best"):
        return render_comp_bdd_perbit(module, n, variant)
    if variant in (
        "bdd_perbit_interleave_msb",
        "bdd_perbit_search_best",
        "bdd_perbit_bitopt",
        "bdd_perbit_formula_hi2",
        "bdd_perbit_formula_hi3",
    ):
        return render_bdd_perbit(module, n, variant)
    if variant.startswith("hybrid_bdd_hi") and (variant.endswith("_lo_direct") or variant.endswith("_resid_direct")):
        parts = variant.split("_")
        high_count = int(parts[2][2:])
        order_name = "bdd_interleave_msb" if "interleave" in variant else "bdd_b_msb"
        return render_hybrid_bdd_high_lo_direct(module, n, high_count, order_name, "resid" in variant)
    if variant.startswith("mtbdd_"):
        return render_mtbdd(module, n, variant)
    if variant.startswith("recip_"):
        return render_reciprocal_correct(module, n, variant)
    if variant.startswith("lz_threshold_low") and variant.endswith("_case"):
        low_bits = int(variant.split("_")[2][3:])
        return render_lz_threshold_lowcase(module, n, low_bits)
    if variant == "ex266_formula_hi2_low3_bdd":
        return render_ex266_formula_high_low_bdd(module, n, 2)
    if variant == "ex266_formula_hi3_low2_bdd":
        return render_ex266_formula_high_low_bdd(module, n, 3)
    if variant == "ex266_interval_case_bits":
        return render_ex266_interval_case(module, n, 0)
    if variant == "ex266_interval_case_low2_hiformula":
        return render_ex266_interval_case(module, n, 3)
    if variant == "ex266_interval_case_low3_hiformula":
        return render_ex266_interval_case(module, n, 2)
    if variant == "ex266_hi2_resid_shift":
        return render_ex266_hi_residual_shift(module, n, 2)
    if variant == "ex266_hi3_resid_shift":
        return render_ex266_hi_residual_shift(module, n, 3)
    if variant == "ex266_hi2_resid_parallel":
        return render_ex266_hi_residual_parallel(module, n, 2)
    if variant == "ex266_hi3_resid_parallel":
        return render_ex266_hi_residual_parallel(module, n, 3)
    if variant == "ex266_parallel_threshold":
        return render_ex266_parallel_threshold(module, n)
    if variant == "ex266_cof_bhi1_mtbdd":
        return render_ex266_cofactor_mtbdd(module, n, 1)
    if variant == "ex266_cof_bhi2_mtbdd":
        return render_ex266_cofactor_mtbdd(module, n, 2)
    if variant == "ex266_cof_bhi3_mtbdd":
        return render_ex266_cofactor_mtbdd(module, n, 3)
    if variant == "ex266_cof_bhi4_mtbdd":
        return render_ex266_cofactor_mtbdd(module, n, 4)
    if variant == "ex266_cof_bhi2_bitbdd":
        return render_ex266_cofactor_bitbdd(module, n, 2)
    if variant == "ex266_cof_bhi3_bitbdd":
        return render_ex266_cofactor_bitbdd(module, n, 3)
    if variant == "ex266_cof_bhi4_bitbdd":
        return render_ex266_cofactor_bitbdd(module, n, 4)
    if variant == "ex266_cof_bhi1_a4_bitbdd":
        return render_ex266_cofactor_bitbdd_vars(module, n, [9, 4])
    if variant == "ex266_cof_bhi2_a4_bitbdd":
        return render_ex266_cofactor_bitbdd_vars(module, n, [9, 8, 4])
    if variant == "ex266_cof_bhi2_a43_bitbdd":
        return render_ex266_cofactor_bitbdd_vars(module, n, [9, 8, 4, 3])
    if variant == "ex266_cof_b4_b1_bitbdd":
        return render_ex266_cofactor_bitbdd_vars(module, n, [9, 6])
    if variant == "ex266_cof_b4_b2_bitbdd":
        return render_ex266_cofactor_bitbdd_vars(module, n, [9, 7])
    if variant == "ex266_cof_b4_b0_bitbdd":
        return render_ex266_cofactor_bitbdd_vars(module, n, [9, 5])
    if variant == "ex266_cof_b3_b1_bitbdd":
        return render_ex266_cofactor_bitbdd_vars(module, n, [8, 6])
    if variant == "ex266_cof_bhi2_bitbdd_wordmux":
        return render_ex266_cofactor_bitbdd_wordmux(module, n, [9, 8])
    if variant == "ex266_cof_bhi2_a4_bitbdd_wordmux":
        return render_ex266_cofactor_bitbdd_wordmux(module, n, [9, 8, 4])
    if variant == "ex266_cof_bhi2_a43_bitbdd_wordmux":
        return render_ex266_cofactor_bitbdd_wordmux(module, n, [9, 8, 4, 3])
    if variant == "ex266_cof_bhi3_a43_bitbdd_wordmux":
        return render_ex266_cofactor_bitbdd_wordmux(module, n, [9, 8, 7, 4, 3])
    if variant == "ex266_cof_bhi2_a43_b0_bitbdd_wordmux":
        return render_ex266_cofactor_bitbdd_wordmux(module, n, [9, 8, 4, 3, 5])
    if variant == "ex266_cof_bhi2_a43_b1_bitbdd_wordmux":
        return render_ex266_cofactor_bitbdd_wordmux(module, n, [9, 8, 4, 3, 6])
    if variant == "ex266_cof_bhi2_a4_comp_wordmux":
        return render_ex266_cofactor_comp_wordmux(module, n, [9, 8, 4])
    if variant == "ex266_cof_bhi2_a43_comp_wordmux":
        return render_ex266_cofactor_comp_wordmux(module, n, [9, 8, 4, 3])
    if variant == "ex266_cof_bhi2_a4_tree_wordmux":
        return render_ex266_cofactor_tree_wordmux(module, n, [9, 8, 4])
    if variant == "ex266_cof_bhi2_a43_tree_wordmux":
        return render_ex266_cofactor_tree_wordmux(module, n, [9, 8, 4, 3])
    if variant == "cof_bhi1_ahi1_bitbdd_wordmux":
        return render_ex266_cofactor_bitbdd_wordmux(module, n, selector_bhi_ahi(n, 1, 1))
    if variant == "cof_bhi2_ahi1_bitbdd_wordmux":
        return render_ex266_cofactor_bitbdd_wordmux(module, n, selector_bhi_ahi(n, 2, 1))
    if variant == "cof_bhi2_ahi2_bitbdd_wordmux":
        return render_ex266_cofactor_bitbdd_wordmux(module, n, selector_bhi_ahi(n, 2, 2))
    if variant == "cof_bhi3_ahi1_bitbdd_wordmux":
        return render_ex266_cofactor_bitbdd_wordmux(module, n, selector_bhi_ahi(n, 3, 1))
    raise RuntimeError("unknown source variant: {0}".format(variant))


def verify_semantics(case, table):
    n = CASE_PART_WIDTH[case]
    if table.input_width != 2 * n or table.output_width != n:
        return False, "unexpected width input={0} output={1} n={2}".format(
            table.input_width, table.output_width, n
        )
    out_mask = (1 << n) - 1
    for index in range(table.num_inputs):
        a = index & out_mask
        b = (index >> n) & out_mask
        expected = out_mask if b == 0 else a // b
        actual = table.get_output(index)
        if actual != expected:
            return False, "mismatch index={0} a={1} b={2} expected=0x{3:x} actual=0x{4:x}".format(
                index, a, b, expected, actual
            )
    return True, "unsigned low{0}_high{0}:a/b dbz=max exact".format(n)


def empty_row(case, candidate_id, source_variant, flow, verilog_path, aig_path, semantic_ok, semantic_note, refs):
    row = {
        "case": case,
        "candidate_id": candidate_id,
        "hypothesis": "unsigned low{0}_high{0}:a/b dbz=max".format(CASE_PART_WIDTH[case]),
        "variant": "{0}+{1}".format(source_variant, flow),
        "verilog_path": base.rel(verilog_path),
        "aig_path": base.rel(aig_path),
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
        "classification": "semantic_udiv_exact" if semantic_ok else "semantic_check_failed",
        "notes": semantic_note,
    }
    return row


def run_case(args, case, source_variants, flow_variants, refs):
    table = TruthTable(args.benchmarks / "{0}.truth".format(case))
    semantic_ok, semantic_note = verify_semantics(case, table)
    n = CASE_PART_WIDTH[case]
    rows = []
    manifest = {
        "case": case,
        "truth": base.rel(args.benchmarks / "{0}.truth".format(case)),
        "input_width": table.input_width,
        "output_width": table.output_width,
        "semantic": semantic_note,
        "sources": [],
        "candidates": [],
    }

    for source_variant in source_variants:
        module = "{0}_udiv_{1}".format(case, source_variant)
        verilog_text = render_verilog(module, n, source_variant)
        if verilog_text is None:
            manifest["sources"].append({"source": source_variant, "skipped": "too large for this n"})
            continue
        verilog_path = args.work_dir / case / "verilog" / "{0}.v".format(module)
        base.write_text(verilog_path, verilog_text)
        manifest["sources"].append({"source": source_variant, "verilog": base.rel(verilog_path)})

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

    base.write_text(args.work_dir / case / "manifest.json", json.dumps(manifest, indent=2, sort_keys=True) + "\n")
    return rows


def write_manifest(args, rows, best):
    lines = [
        "# {0}".format(args.run_id),
        "",
        "Run ID: `{0}`".format(args.run_id),
        "",
        "Purpose: frontend-only unsigned division seeds for `ex265-ex269`.",
        "",
        "Inputs:",
        "- Truth files: `benchmarks/ex265.truth` through `benchmarks/ex269.truth`",
        "- Existing baseline: `student/runs/integer/ex255_ex279_current/results/candidates.csv`",
        "- Generator/script: `student/generators/integer_ex265_ex269_udiv_frontend.py`",
        "",
        "Artifacts:",
        "- Work directory: `{0}`".format(base.rel(args.work_dir)),
        "- Candidates CSV: `{0}`".format(base.rel(args.results_dir / "candidates.csv")),
        "- Best CSV: `{0}`".format(base.rel(args.results_dir / "best.csv")),
        "- Summary CSV: `{0}`".format(base.rel(args.results_dir / "summary.csv")),
        "",
        "Methods tried:",
        "- Direct guarded division, safe-divisor source rewrite, greater-than-zero guard, narrow restoring divider, constant-denominator manual paths, dividend-range classifiers, quotient threshold classifiers, and small-divisor fast paths.",
        "- Limited Yosys frontend synth scripts from the existing integer flow.",
        "",
        "Notes:",
        "- Every retained AIG row is checked against the official truth table convention through `evaluate_aig`.",
        "- No backend optimization portfolio was run.",
        "- No `student/seeds` bundle is updated in this partial batch.",
        "",
        "Run totals:",
        "- candidates: {0}".format(len(rows)),
        "- equivalent: {0}".format(len([row for row in rows if row.get("equivalent") == "1"])),
        "- best cases: {0}".format(len(best)),
        "",
    ]
    base.write_text(args.runs_dir / "MANIFEST.md", "\n".join(lines))


def parse_args(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--run-id", default="ex265_ex269_frontend_udiv_struct_20260609_0735")
    parser.add_argument("--cases", default=",".join(CASES))
    parser.add_argument("--sources", default="all")
    parser.add_argument("--flows", default="default,wreduce_default,abc_g_aig,wreduce_abc_g_aig,arith_wreduce_aig,synth_preset")
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--abc", type=Path, default=ROOT / "student" / "abc")
    parser.add_argument("--yosys", type=Path, default=DEFAULT_YOSYS)
    parser.add_argument("--timeout", type=int, default=300)
    parser.add_argument("--work-dir", type=Path)
    parser.add_argument("--runs-dir", type=Path)
    return parser.parse_args(argv)


def main(argv=None):
    args = parse_args(argv)
    cases = base.parse_list(args.cases, CASES)
    sources = base.parse_list(args.sources, SOURCE_VARIANTS)
    flows = base.parse_list(args.flows, FLOW_VARIANTS)
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
    base.write_csv(args.results_dir / "candidates.csv", RESULT_FIELDNAMES, all_rows)
    base.write_csv(args.results_dir / "best.csv", BEST_FIELDNAMES, best)
    base.write_csv(
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
    base.write_csv(
        args.results_dir / "evaluate_check.csv",
        ["case", "candidate_id", "equivalent", "area", "delay", "adp", "aig_path", "notes"],
        all_rows,
    )
    write_manifest(args, all_rows, best)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
