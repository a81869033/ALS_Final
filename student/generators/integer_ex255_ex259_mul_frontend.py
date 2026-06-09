#!/usr/bin/env python3
"""Deep frontend seeds for ex255-ex259 unsigned multiplication.

The existing integer generator found the right semantics, but its direct
multiply source zero-extends both N-bit operands to the 2N-bit output width
before multiplying.  This script tests narrower source encodings and a small
set of synthesis scripts that are still frontend seed generation, not backend
portfolio optimization.
"""

import argparse
import csv
import json
import math
import shlex
import subprocess
import sys
import time
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from student.backends.abc_flow import evaluate_aig
from student.frontends.truth import TruthTable
from student.frontends.yosys_synth import DEFAULT_YOSYS, SynthError, run_command, yosys_quote


CASES = ("ex255", "ex256", "ex257", "ex258", "ex259")
CASE_PART_WIDTH = {
    "ex255": 4,
    "ex256": 5,
    "ex257": 6,
    "ex258": 7,
    "ex259": 8,
}

SOURCE_VARIANTS = (
    "direct_context",
    "wide_ext_direct",
    "balanced_rows",
    "csa_vector",
    "csa_prefix",
    "csa_androws",
    "csa_concat",
    "csa_concat_rev",
    "csa_concat_evenodd",
    "csa_concat_outside",
    "csa_concat_center",
    "booth_radix4",
    "wallace_bits",
    "wallace_bits_prefix",
    "wallace_bits_rev",
    "wallace_bits_outside",
    "wallace_bits_rev_prefix",
    "wallace_bits_outside_prefix",
    "dadda_bits",
    "dadda_bits_prefix",
    "highbit_correction",
    "column_carry",
    "case_b_const",
    "split_half",
    "karatsuba_even",
    "sorted_operands",
)

FLOW_VARIANTS = (
    "default",
    "no_internal_abc",
    "wreduce_default",
    "wreduce_no_internal_abc",
    "abc_g_aig",
    "wreduce_abc_g_aig",
    "arith_wreduce_aig",
    "synth_preset",
    "abc_g_aig_d18",
    "abc_g_aig_d20",
    "abc_g_aig_d24",
    "abc_g_aig_d28",
    "abc_g_aig_d32",
    "synth_preset_d18",
    "synth_preset_d20",
    "synth_preset_d24",
    "synth_preset_d28",
    "synth_preset_d32",
)

RESULT_FIELDNAMES = [
    "case",
    "candidate_id",
    "hypothesis",
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
    "classification",
    "notes",
]

BEST_FIELDNAMES = [
    "case",
    "candidate_id",
    "hypothesis",
    "variant",
    "verilog_path",
    "aig_path",
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


def rel(path):
    path = Path(path)
    try:
        return str(path.relative_to(ROOT))
    except ValueError:
        return str(path)


def write_text(path, text):
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w") as handle:
        handle.write(text)


def write_csv(path, fieldnames, rows):
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fieldnames, lineterminator="\n")
        writer.writeheader()
        for row in rows:
            writer.writerow({name: row.get(name, "") for name in fieldnames})


def const(width, value):
    return "{0}'h{1:x}".format(width, value & ((1 << width) - 1))


def zero_word(width):
    return "{0}'b0".format(width)


def load_reference(path):
    refs = {}
    if not Path(path).exists():
        return refs
    with Path(path).open(newline="") as handle:
        for row in csv.DictReader(handle):
            case = (row.get("case") or "").strip()
            try:
                refs[case] = int(row.get("adp") or "")
            except ValueError:
                pass
    return refs


def parse_list(value, allowed):
    if value == "all":
        return list(allowed)
    out = []
    for item in value.split(","):
        item = item.strip()
        if not item:
            continue
        if item not in allowed:
            raise argparse.ArgumentTypeError("unknown item {0}; allowed: {1}".format(item, ",".join(allowed)))
        out.append(item)
    if not out:
        raise argparse.ArgumentTypeError("empty list")
    return out


def verify_semantics(case, table):
    n = CASE_PART_WIDTH[case]
    if table.input_width != 2 * n or table.output_width != 2 * n:
        return False, "unexpected widths input={0} output={1} n={2}".format(
            table.input_width,
            table.output_width,
            n,
        )
    mask = (1 << n) - 1
    for index, expected in enumerate(table.iter_outputs()):
        a = index & mask
        b = (index >> n) & mask
        actual = a * b
        if actual != expected:
            return False, "mismatch index={0} expected=0x{1:x} actual=0x{2:x}".format(index, expected, actual)
    return True, "exact unsigned low{0} * high{0} over {1} inputs".format(n, table.num_inputs)


def header(module, n):
    width = 2 * n
    return [
        "module {0}(in, out);".format(module),
        "  input [{0}:0] in;".format(width - 1),
        "  output [{0}:0] out;".format(width - 1),
        "  wire [{0}:0] a = in[{0}:0];".format(n - 1),
        "  wire [{0}:0] b = in[{1}:{2}];".format(n - 1, width - 1, n),
    ]


def shifted_a_expr(n, width, shift):
    base = "{{{0}'b0, a}}".format(width - n)
    if shift == 0:
        return base
    return "({0} << {1})".format(base, shift)


def const_mul_expr(n, width, value):
    if value == 0:
        return zero_word(width)
    terms = []
    for bit in range(n):
        if value & (1 << bit):
            terms.append(shifted_a_expr(n, width, bit))
    if not terms:
        return zero_word(width)
    return " + ".join(terms)


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


def render_direct_context(module, n):
    lines = header(module, n)
    width = 2 * n
    lines.extend(
        [
            "  wire [{0}:0] product = a * b;".format(width - 1),
            "  assign out = product;",
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


def render_wide_ext_direct(module, n):
    lines = header(module, n)
    width = 2 * n
    lines.extend(
        [
            "  wire [{0}:0] a_ext = {{{1}'b0, a}};".format(width - 1, width - n),
            "  wire [{0}:0] b_ext = {{{1}'b0, b}};".format(width - 1, width - n),
            "  assign out = a_ext * b_ext;",
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


def render_balanced_rows(module, n):
    lines = header(module, n)
    width = 2 * n
    terms = []
    for bit in range(n):
        name = "row{0}".format(bit)
        terms.append(name)
        lines.append(
            "  wire [{0}:0] {1} = b[{2}] ? {3} : {4};".format(
                width - 1,
                name,
                bit,
                shifted_a_expr(n, width, bit),
                zero_word(width),
            )
        )
    lines.append("  assign out = {0};".format(balanced_sum_expr(terms)))
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def render_csa_vector(module, n):
    return render_csa_generic(module, n, "mux_shift", "natural", use_prefix=False)


def ordered_bits(n, order):
    if order == "natural":
        return list(range(n))
    if order == "reverse":
        return list(reversed(range(n)))
    if order == "evenodd":
        return list(range(0, n, 2)) + list(range(1, n, 2))
    if order == "outside":
        out = []
        lo = 0
        hi = n - 1
        while lo <= hi:
            out.append(lo)
            if lo != hi:
                out.append(hi)
            lo += 1
            hi -= 1
        return out
    if order == "center":
        out = []
        center = (n - 1) // 2
        for dist in range(n):
            left = center - dist
            right = center + 1 + dist
            if 0 <= left < n:
                out.append(left)
            if 0 <= right < n:
                out.append(right)
            if len(out) == n:
                return out
    raise RuntimeError("unknown row order: {0}".format(order))


def row_expr(n, width, bit, style):
    shifted = shifted_a_expr(n, width, bit)
    if style == "mux_shift":
        return "b[{0}] ? {1} : {2}".format(bit, shifted, zero_word(width))
    if style == "and_shift":
        return "({{{0}{{b[{1}]}}}} & {2})".format(width, bit, shifted)
    if style == "concat_and":
        parts = []
        high_zeros = width - n - bit
        if high_zeros > 0:
            parts.append("{%d{1'b0}}" % high_zeros)
        parts.append("(a & {%d{b[%d]}})" % (n, bit))
        if bit > 0:
            parts.append("{%d{1'b0}}" % bit)
        return "{" + ", ".join(parts) + "}"
    raise RuntimeError("unknown row style: {0}".format(style))


def render_csa_generic(module, n, style, order, use_prefix=False):
    lines = header(module, n)
    width = 2 * n
    rows = []
    for row_index, bit in enumerate(ordered_bits(n, order)):
        name = "row{0}".format(row_index)
        rows.append(name)
        lines.append("  wire [{0}:0] {1} = {2};".format(width - 1, name, row_expr(n, width, bit, style)))

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
    if use_prefix:
        append_prefix_adder(lines, width, rows[0], rows[1], "prefix_sum", "ks")
        lines.append("  assign out = prefix_sum;")
    else:
        lines.append("  assign out = {0};".format(" + ".join(rows)))
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def render_csa_androws(module, n):
    return render_csa_generic(module, n, "and_shift", "natural", use_prefix=False)


def render_csa_concat(module, n):
    return render_csa_generic(module, n, "concat_and", "natural", use_prefix=False)


def render_csa_concat_rev(module, n):
    return render_csa_generic(module, n, "concat_and", "reverse", use_prefix=False)


def render_csa_concat_evenodd(module, n):
    return render_csa_generic(module, n, "concat_and", "evenodd", use_prefix=False)


def render_csa_concat_outside(module, n):
    return render_csa_generic(module, n, "concat_and", "outside", use_prefix=False)


def render_csa_concat_center(module, n):
    return render_csa_generic(module, n, "concat_and", "center", use_prefix=False)


def append_prefix_adder(lines, width, x_name, y_name, out_name, prefix):
    lines.append("  wire [{0}:0] {1};".format(width - 1, out_name))
    for bit in range(width):
        lines.append("  wire {0}_p0_{1} = {2}[{1}] ^ {3}[{1}];".format(prefix, bit, x_name, y_name))
        lines.append("  wire {0}_g0_{1} = {2}[{1}] & {3}[{1}];".format(prefix, bit, x_name, y_name))

    prev_p = "{0}_p0".format(prefix)
    prev_g = "{0}_g0".format(prefix)
    stage = 1
    step = 1
    while step < width:
        for bit in range(width):
            p_name = "{0}_p{1}_{2}".format(prefix, stage, bit)
            g_name = "{0}_g{1}_{2}".format(prefix, stage, bit)
            if bit >= step:
                lines.append(
                    "  wire {0} = {1}_{2} & {1}_{3};".format(
                        p_name,
                        prev_p,
                        bit,
                        bit - step,
                    )
                )
                lines.append(
                    "  wire {0} = {1}_{2} | ({3}_{2} & {1}_{4});".format(
                        g_name,
                        prev_g,
                        bit,
                        prev_p,
                        bit - step,
                    )
                )
            else:
                lines.append("  wire {0} = {1}_{2};".format(p_name, prev_p, bit))
                lines.append("  wire {0} = {1}_{2};".format(g_name, prev_g, bit))
        prev_p = "{0}_p{1}".format(prefix, stage)
        prev_g = "{0}_g{1}".format(prefix, stage)
        stage += 1
        step <<= 1

    lines.append("  assign {0}[0] = {1}_p0_0;".format(out_name, prefix))
    for bit in range(1, width):
        lines.append("  assign {0}[{1}] = {2}_p0_{1} ^ {3}_{4};".format(out_name, bit, prefix, prev_g, bit - 1))


def render_csa_prefix(module, n):
    return render_csa_generic(module, n, "mux_shift", "natural", use_prefix=True)


def render_column_carry(module, n):
    lines = header(module, n)
    width = 2 * n
    carry_width = int(math.ceil(math.log(n + 1, 2))) + 2
    lines.append("  wire [{0}:0] carry0 = {1}'b0;".format(carry_width - 1, carry_width))
    carry_name = "carry0"
    for col in range(width - 1):
        terms = [carry_name]
        for i in range(n):
            j = col - i
            if 0 <= j < n:
                terms.append("(a[{0}] & b[{1}])".format(i, j))
        sum_name = "sum{0}".format(col)
        next_carry = "carry{0}".format(col + 1)
        lines.append("  wire [{0}:0] {1} = {2};".format(carry_width - 1, sum_name, " + ".join(terms)))
        lines.append("  assign out[{0}] = {1}[0];".format(col, sum_name))
        lines.append("  wire [{0}:0] {1} = {2} >> 1;".format(carry_width - 1, next_carry, sum_name))
        carry_name = next_carry
    lines.append("  assign out[{0}] = {1}[0];".format(width - 1, carry_name))
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def booth_code_expr(n, group):
    prev = "1'b0" if group == 0 else "b[{0}]".format(2 * group - 1)
    mid_index = 2 * group
    high_index = 2 * group + 1
    mid = "1'b0" if mid_index >= n else "b[{0}]".format(mid_index)
    high = "1'b0" if high_index >= n else "b[{0}]".format(high_index)
    return "{{{0}, {1}, {2}}}".format(high, mid, prev)


def render_booth_radix4(module, n):
    width = 2 * n
    signed_width = width + 3
    groups = (n + 2) // 2
    lines = header(module, n)
    lines.extend(
        [
            "  wire signed [{0}:0] a_s = {{{1}'b0, a}};".format(signed_width - 1, signed_width - n),
            "  reg signed [{0}:0] acc;".format(signed_width - 1),
            "  reg signed [{0}:0] pp;".format(signed_width - 1),
            "  always @* begin",
            "    acc = {0}'sd0;".format(signed_width),
        ]
    )
    for group in range(groups):
        shift = 2 * group
        lines.extend(
            [
                "    case ({0})".format(booth_code_expr(n, group)),
                "      3'b000, 3'b111: pp = {0}'sd0;".format(signed_width),
                "      3'b001, 3'b010: pp = a_s;",
                "      3'b011: pp = a_s <<< 1;",
                "      3'b100: pp = -(a_s <<< 1);",
                "      3'b101, 3'b110: pp = -a_s;",
                "      default: pp = {0}'sd0;".format(signed_width),
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


def order_column_entries(entries, order):
    if order == "natural":
        return entries
    if order == "reverse":
        return list(reversed(entries))
    if order == "outside":
        out = []
        lo = 0
        hi = len(entries) - 1
        while lo <= hi:
            out.append(entries[lo])
            if lo != hi:
                out.append(entries[hi])
            lo += 1
            hi -= 1
        return out
    raise RuntimeError("unknown Wallace item order: {0}".format(order))


def render_wallace_bits_generic(module, n, use_prefix=False, item_order="natural"):
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
        columns[index].extend(order_column_entries(entries, item_order))

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
                s = "w_s{0}_{1}_{2}".format(stage, col_index, comp)
                c = "w_c{0}_{1}_{2}".format(stage, col_index, comp)
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
        if len(items) == 0:
            row0_bits.append("1'b0")
            row1_bits.append("1'b0")
        elif len(items) == 1:
            row0_bits.append(items[0])
            row1_bits.append("1'b0")
        elif len(items) == 2:
            row0_bits.append(items[0])
            row1_bits.append(items[1])
        else:
            raise RuntimeError("wallace reduction left {0} bits in column {1}".format(len(items), col_index))
    lines.append("  wire [{0}:0] row0 = {{{1}}};".format(width, ", ".join(reversed(row0_bits))))
    lines.append("  wire [{0}:0] row1 = {{{1}}};".format(width, ", ".join(reversed(row1_bits))))
    if use_prefix:
        append_prefix_adder(lines, width + 1, "row0", "row1", "wallace_sum", "wks")
        lines.append("  assign out = wallace_sum[{0}:0];".format(width - 1))
    else:
        lines.append("  wire [{0}:0] wallace_sum = row0 + row1;".format(width))
        lines.append("  assign out = wallace_sum[{0}:0];".format(width - 1))
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def render_wallace_bits(module, n):
    return render_wallace_bits_generic(module, n, use_prefix=False, item_order="natural")


def render_wallace_bits_prefix(module, n):
    return render_wallace_bits_generic(module, n, use_prefix=True, item_order="natural")


def render_wallace_bits_rev(module, n):
    return render_wallace_bits_generic(module, n, use_prefix=False, item_order="reverse")


def render_wallace_bits_outside(module, n):
    return render_wallace_bits_generic(module, n, use_prefix=False, item_order="outside")


def render_wallace_bits_rev_prefix(module, n):
    return render_wallace_bits_generic(module, n, use_prefix=True, item_order="reverse")


def render_wallace_bits_outside_prefix(module, n):
    return render_wallace_bits_generic(module, n, use_prefix=True, item_order="outside")


def dadda_targets(max_height):
    values = [2]
    while values[-1] < max_height:
        values.append(int(math.floor(values[-1] * 1.5)))
    if values[-1] >= max_height:
        values.pop()
    return list(reversed(values))


def render_dadda_bits_generic(module, n, use_prefix=False):
    width = 2 * n
    lines = header(module, n)
    columns = [[] for _ in range(width + 1)]
    for i in range(n):
        for j in range(n):
            name = "pp_{0}_{1}".format(i, j)
            lines.append("  wire {0} = a[{1}] & b[{2}];".format(name, i, j))
            columns[i + j].append(name)

    for stage, target in enumerate(dadda_targets(n)):
        next_columns = [[] for _ in range(width + 1)]
        for col_index, col_items in enumerate(columns):
            items = list(col_items)
            comp = 0
            while len(items) > target:
                if len(items) >= 3 and len(items) - target >= 2:
                    x = items.pop(0)
                    y = items.pop(0)
                    z = items.pop(0)
                    s = "d_s{0}_{1}_{2}".format(stage, col_index, comp)
                    c = "d_c{0}_{1}_{2}".format(stage, col_index, comp)
                    lines.append("  wire {0} = {1} ^ {2} ^ {3};".format(s, x, y, z))
                    lines.append("  wire {0} = ({1} & {2}) | ({1} & {3}) | ({2} & {3});".format(c, x, y, z))
                    next_columns[col_index].append(s)
                    if col_index + 1 <= width:
                        next_columns[col_index + 1].append(c)
                elif len(items) >= 2:
                    x = items.pop(0)
                    y = items.pop(0)
                    s = "d_hs{0}_{1}_{2}".format(stage, col_index, comp)
                    c = "d_hc{0}_{1}_{2}".format(stage, col_index, comp)
                    lines.append("  wire {0} = {1} ^ {2};".format(s, x, y))
                    lines.append("  wire {0} = {1} & {2};".format(c, x, y))
                    next_columns[col_index].append(s)
                    if col_index + 1 <= width:
                        next_columns[col_index + 1].append(c)
                else:
                    break
                comp += 1
            next_columns[col_index].extend(items)
        columns = next_columns

    while any(len(col) > 2 for col in columns):
        next_columns = [[] for _ in range(width + 1)]
        for col_index, col_items in enumerate(columns):
            items = list(col_items)
            comp = 0
            while len(items) >= 3:
                x = items.pop(0)
                y = items.pop(0)
                z = items.pop(0)
                s = "df_s{0}_{1}".format(col_index, comp)
                c = "df_c{0}_{1}".format(col_index, comp)
                lines.append("  wire {0} = {1} ^ {2} ^ {3};".format(s, x, y, z))
                lines.append("  wire {0} = ({1} & {2}) | ({1} & {3}) | ({2} & {3});".format(c, x, y, z))
                next_columns[col_index].append(s)
                if col_index + 1 <= width:
                    next_columns[col_index + 1].append(c)
                comp += 1
            next_columns[col_index].extend(items)
        columns = next_columns

    row0_bits = []
    row1_bits = []
    for col_index in range(width + 1):
        items = columns[col_index]
        if len(items) == 0:
            row0_bits.append("1'b0")
            row1_bits.append("1'b0")
        elif len(items) == 1:
            row0_bits.append(items[0])
            row1_bits.append("1'b0")
        elif len(items) == 2:
            row0_bits.append(items[0])
            row1_bits.append(items[1])
        else:
            raise RuntimeError("dadda reduction left {0} bits in column {1}".format(len(items), col_index))
    lines.append("  wire [{0}:0] row0 = {{{1}}};".format(width, ", ".join(reversed(row0_bits))))
    lines.append("  wire [{0}:0] row1 = {{{1}}};".format(width, ", ".join(reversed(row1_bits))))
    if use_prefix:
        append_prefix_adder(lines, width + 1, "row0", "row1", "dadda_sum", "dks")
        lines.append("  assign out = dadda_sum[{0}:0];".format(width - 1))
    else:
        lines.append("  wire [{0}:0] dadda_sum = row0 + row1;".format(width))
        lines.append("  assign out = dadda_sum[{0}:0];".format(width - 1))
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def render_dadda_bits(module, n):
    return render_dadda_bits_generic(module, n, use_prefix=False)


def render_dadda_bits_prefix(module, n):
    return render_dadda_bits_generic(module, n, use_prefix=True)


def render_highbit_correction(module, n):
    if n < 2:
        return None
    width = 2 * n
    lo = n - 1
    lines = header(module, n)
    lines.extend(
        [
            "  wire [{0}:0] a_lo = a[{0}:0];".format(lo - 1),
            "  wire [{0}:0] b_lo = b[{0}:0];".format(lo - 1),
            "  wire a_hi = a[{0}];".format(n - 1),
            "  wire b_hi = b[{0}];".format(n - 1),
            "  wire [{0}:0] p_lo = a_lo * b_lo;".format(2 * lo - 1),
            "  wire [{0}:0] cross_a = a_hi ? {{1'b0, b_lo}} : {1}'b0;".format(lo, lo + 1),
            "  wire [{0}:0] cross_b = b_hi ? {{1'b0, a_lo}} : {1}'b0;".format(lo, lo + 1),
            "  wire [{0}:0] cross = cross_a + cross_b;".format(lo),
            "  wire [{0}:0] term_lo = {{{1}'b0, p_lo}};".format(width - 1, width - 2 * lo),
            "  wire [{0}:0] term_cross = {{{1}'b0, cross}} << {2};".format(width - 1, width - (lo + 1), lo),
            "  wire [{0}:0] term_hi = (a_hi & b_hi) ? ({1}'b1 << {2}) : {1}'b0;".format(width - 1, width, 2 * lo),
            "  assign out = (term_lo + term_hi) + term_cross;",
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


def render_case_b_const(module, n):
    width = 2 * n
    lines = header(module, n)
    lines.extend(
        [
            "  reg [{0}:0] out_r;".format(width - 1),
            "  always @* begin",
            "    case (b)",
        ]
    )
    for value in range(1 << n):
        lines.append("      {0}'d{1}: out_r = {2};".format(n, value, const_mul_expr(n, width, value)))
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


def render_split_half(module, n):
    width = 2 * n
    lo = n // 2
    hi = n - lo
    lines = header(module, n)
    lines.extend(
        [
            "  wire [{0}:0] a0 = a[{0}:0];".format(lo - 1),
            "  wire [{0}:0] b0 = b[{0}:0];".format(lo - 1),
            "  wire [{0}:0] a1 = a[{1}:{2}];".format(hi - 1, n - 1, lo),
            "  wire [{0}:0] b1 = b[{1}:{2}];".format(hi - 1, n - 1, lo),
            "  wire [{0}:0] p00 = a0 * b0;".format(2 * lo - 1),
            "  wire [{0}:0] p01 = a0 * b1;".format(lo + hi - 1),
            "  wire [{0}:0] p10 = a1 * b0;".format(lo + hi - 1),
            "  wire [{0}:0] p11 = a1 * b1;".format(2 * hi - 1),
            "  wire [{0}:0] t00 = {{{1}'b0, p00}};".format(width - 1, width - 2 * lo),
            "  wire [{0}:0] t01 = {{{1}'b0, p01}} << {2};".format(width - 1, width - lo - hi, lo),
            "  wire [{0}:0] t10 = {{{1}'b0, p10}} << {2};".format(width - 1, width - lo - hi, lo),
            "  wire [{0}:0] t11 = {{{1}'b0, p11}} << {2};".format(width - 1, width - 2 * hi, 2 * lo),
            "  assign out = (t00 + t11) + (t01 + t10);",
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


def render_karatsuba_even(module, n):
    if n % 2:
        return None
    width = 2 * n
    h = n // 2
    lines = header(module, n)
    lines.extend(
        [
            "  wire [{0}:0] a0 = a[{0}:0];".format(h - 1),
            "  wire [{0}:0] b0 = b[{0}:0];".format(h - 1),
            "  wire [{0}:0] a1 = a[{1}:{2}];".format(h - 1, n - 1, h),
            "  wire [{0}:0] b1 = b[{1}:{2}];".format(h - 1, n - 1, h),
            "  wire [{0}:0] p0 = a0 * b0;".format(2 * h - 1),
            "  wire [{0}:0] p2 = a1 * b1;".format(2 * h - 1),
            "  wire [{0}:0] sa = {{1'b0, a0}} + {{1'b0, a1}};".format(h),
            "  wire [{0}:0] sb = {{1'b0, b0}} + {{1'b0, b1}};".format(h),
            "  wire [{0}:0] ps = sa * sb;".format(2 * h + 1),
            "  wire [{0}:0] mid = ps - {{2'b0, p0}} - {{2'b0, p2}};".format(2 * h + 1),
            "  wire [{0}:0] t0 = {{{1}'b0, p0}};".format(width - 1, width - 2 * h),
            "  wire [{0}:0] tm = {{{1}'b0, mid}} << {2};".format(width - 1, width - (2 * h + 2), h),
            "  wire [{0}:0] t2 = {{{1}'b0, p2}} << {2};".format(width - 1, width - 2 * h, 2 * h),
            "  assign out = t0 + tm + t2;",
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


def render_sorted_operands(module, n):
    width = 2 * n
    lines = header(module, n)
    lines.extend(
        [
            "  wire swap = a > b;",
            "  wire [{0}:0] x = swap ? b : a;".format(n - 1),
            "  wire [{0}:0] y = swap ? a : b;".format(n - 1),
            "  wire [{0}:0] product = x * y;".format(width - 1),
            "  assign out = product;",
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


RENDERERS = {
    "direct_context": render_direct_context,
    "wide_ext_direct": render_wide_ext_direct,
    "balanced_rows": render_balanced_rows,
    "csa_vector": render_csa_vector,
    "csa_prefix": render_csa_prefix,
    "csa_androws": render_csa_androws,
    "csa_concat": render_csa_concat,
    "csa_concat_rev": render_csa_concat_rev,
    "csa_concat_evenodd": render_csa_concat_evenodd,
    "csa_concat_outside": render_csa_concat_outside,
    "csa_concat_center": render_csa_concat_center,
    "booth_radix4": render_booth_radix4,
    "wallace_bits": render_wallace_bits,
    "wallace_bits_prefix": render_wallace_bits_prefix,
    "wallace_bits_rev": render_wallace_bits_rev,
    "wallace_bits_outside": render_wallace_bits_outside,
    "wallace_bits_rev_prefix": render_wallace_bits_rev_prefix,
    "wallace_bits_outside_prefix": render_wallace_bits_outside_prefix,
    "dadda_bits": render_dadda_bits,
    "dadda_bits_prefix": render_dadda_bits_prefix,
    "highbit_correction": render_highbit_correction,
    "column_carry": render_column_carry,
    "case_b_const": render_case_b_const,
    "split_half": render_split_half,
    "karatsuba_even": render_karatsuba_even,
    "sorted_operands": render_sorted_operands,
}


def script_default(verilog, module, output, abc_gate="AND"):
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


def script_wreduce(verilog, module, output, abc_gate="AND"):
    return "\n".join(
        [
            "read_verilog {0}".format(yosys_quote(verilog)),
            "hierarchy -check -top {0}".format(module),
            "proc",
            "flatten",
            "tribuf -logic",
            "deminout",
            "opt",
            "wreduce",
            "opt_expr",
            "opt_reduce",
            "opt_muxtree",
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


def script_no_internal_abc(verilog, module, output, wreduce=False):
    lines = [
        "read_verilog {0}".format(yosys_quote(verilog)),
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
            "memory",
            "opt",
            "techmap",
            "opt",
            "aigmap",
            "opt",
            "clean",
            "write_aiger -symbols {0}".format(yosys_quote(output)),
        ]
    )
    return "\n".join(lines) + "\n"


def script_arith_wreduce_aig(verilog, module, output):
    return "\n".join(
        [
            "read_verilog {0}".format(yosys_quote(verilog)),
            "hierarchy -check -top {0}".format(module),
            "proc",
            "flatten",
            "tribuf -logic",
            "deminout",
            "opt",
            "wreduce",
            "opt",
            "alumacc",
            "opt",
            "share",
            "opt",
            "techmap",
            "opt",
            "abc -g aig",
            "opt",
            "aigmap",
            "opt",
            "clean",
            "write_aiger -symbols {0}".format(yosys_quote(output)),
        ]
    ) + "\n"


def script_synth_preset(verilog, module, output, delay_target=None):
    abc_cmd = "abc -g aig"
    if delay_target is not None:
        abc_cmd += " -D {0}".format(delay_target)
    return "\n".join(
        [
            "read_verilog {0}".format(yosys_quote(verilog)),
            "synth -top {0} -flatten".format(module),
            abc_cmd,
            "aigmap",
            "opt",
            "clean",
            "write_aiger -symbols {0}".format(yosys_quote(output)),
        ]
    ) + "\n"


FLOW_SCRIPTS = {
    "default": lambda v, m, o: script_default(v, m, o, "AND"),
    "no_internal_abc": lambda v, m, o: script_no_internal_abc(v, m, o, False),
    "wreduce_default": lambda v, m, o: script_wreduce(v, m, o, "AND"),
    "wreduce_no_internal_abc": lambda v, m, o: script_no_internal_abc(v, m, o, True),
    "abc_g_aig": lambda v, m, o: script_default(v, m, o, "aig"),
    "wreduce_abc_g_aig": lambda v, m, o: script_wreduce(v, m, o, "aig"),
    "arith_wreduce_aig": script_arith_wreduce_aig,
    "synth_preset": script_synth_preset,
    "abc_g_aig_d18": lambda v, m, o: script_default(v, m, o, "aig -D 18"),
    "abc_g_aig_d20": lambda v, m, o: script_default(v, m, o, "aig -D 20"),
    "abc_g_aig_d24": lambda v, m, o: script_default(v, m, o, "aig -D 24"),
    "abc_g_aig_d28": lambda v, m, o: script_default(v, m, o, "aig -D 28"),
    "abc_g_aig_d32": lambda v, m, o: script_default(v, m, o, "aig -D 32"),
    "synth_preset_d18": lambda v, m, o: script_synth_preset(v, m, o, 18),
    "synth_preset_d20": lambda v, m, o: script_synth_preset(v, m, o, 20),
    "synth_preset_d24": lambda v, m, o: script_synth_preset(v, m, o, 24),
    "synth_preset_d28": lambda v, m, o: script_synth_preset(v, m, o, 28),
    "synth_preset_d32": lambda v, m, o: script_synth_preset(v, m, o, 32),
}


def run_yosys(yosys, script, script_path, log_path, timeout):
    for line in script.splitlines():
        if line.startswith("write_aiger "):
            output = shlex.split(line)[-1]
            Path(output).parent.mkdir(parents=True, exist_ok=True)
    write_text(script_path, script)
    start = time.time()
    code, output = run_command([str(yosys), "-s", str(script_path)], timeout=timeout)
    write_text(log_path, output)
    if code != 0:
        raise SynthError("Yosys failed exit={0}; see {1}".format(code, rel(log_path)))
    return time.time() - start


def empty_row(case, candidate_id, source_variant, flow, verilog_path, aig_path, semantic_ok, semantic_note, refs):
    row = {
        "case": case,
        "candidate_id": candidate_id,
        "hypothesis": "unsigned low{0}_high{0}:a*b".format(CASE_PART_WIDTH[case]),
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
        "classification": "semantic_mul_exact" if semantic_ok else "semantic_check_failed",
        "notes": semantic_note,
    }
    return row


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
            row = empty_row(case, candidate_id, source_variant, flow, verilog_path, aig_path, semantic_ok, semantic_note, refs)
            start = time.time()
            if semantic_ok:
                try:
                    script = FLOW_SCRIPTS[flow](verilog_path, module, aig_path)
                    run_yosys(args.yosys, script, script_path, log_path, args.timeout)
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
        "Purpose: deep frontend-only unsigned multiplier seeds for `ex255-ex259`.",
        "",
        "Inputs:",
        "- Truth files: `benchmarks/ex255.truth` through `benchmarks/ex259.truth`",
        "- Existing baseline: `student/runs/integer/ex255_ex279_current/results/candidates.csv`",
        "- Generator/script: `student/generators/integer_ex255_ex259_mul_frontend.py`",
        "",
        "Artifacts:",
        "- Work directory: `{0}`".format(rel(args.work_dir)),
        "- Candidates CSV: `{0}`".format(rel(args.results_dir / "candidates.csv")),
        "- Best CSV: `{0}`".format(rel(args.results_dir / "best.csv")),
        "- Summary CSV: `{0}`".format(rel(args.results_dir / "summary.csv")),
        "",
        "Methods tried:",
        "- Narrow/context multiply source, wide zero-extend recheck, balanced row addition, vector CSA, column-carry, operand-case constant multiply, split-half, Karatsuba when applicable, and sorted operands.",
        "- Limited Yosys frontend synth scripts: default, explicit `wreduce`, `abc -g aig`, arithmetic/wreduce/share, and `synth` preset.",
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
    parser.add_argument("--run-id", default="ex255_ex259_frontend_umul_deep_20260609_0013")
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
    cases = parse_list(args.cases, CASES)
    sources = parse_list(args.sources, SOURCE_VARIANTS)
    flows = parse_list(args.flows, FLOW_VARIANTS)
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
