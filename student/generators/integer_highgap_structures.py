#!/usr/bin/env python3
"""Targeted frontend-only probes for integer high-gap cases.

This is intentionally small: it tests structures that are different from the
large prior sweeps for the current integer outliers.
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
from student.generators import integer_ex265_ex269_udiv_frontend as udiv
from student.generators import integer_ex270_ex274_square_frontend as square
from student.generators import integer_ex275_ex279_isqrt_frontend as isqrt


CASES = ("ex266", "ex267", "ex270", "ex273", "ex274", "ex276")
CASE_KIND = {
    "ex266": "udiv",
    "ex267": "udiv",
    "ex270": "square",
    "ex273": "square",
    "ex274": "square",
    "ex276": "isqrt",
}
CASE_WIDTH = {
    "ex266": 5,
    "ex267": 6,
    "ex270": 8,
    "ex273": 14,
    "ex274": 16,
    "ex276": 10,
}
CASE_OUT_WIDTH = {
    "ex266": 5,
    "ex267": 6,
    "ex270": 16,
    "ex273": 28,
    "ex274": 32,
    "ex276": 5,
}

SOURCE_VARIANTS = (
    "udiv_cof_bhi3_a_hi1_wordmux",
    "udiv_cof_bhi2_a_hi2_wordmux",
    "udiv_cof_bhi3_a_hi2_wordmux",
    "udiv_cof_bhi4_a_hi1_wordmux",
    "udiv_cof_bhi4_a_hi2_wordmux",
    "udiv_cof_bhi3_a_hi3_wordmux",
    "udiv_cof_bhi4_a_hi3_wordmux",
    "udiv_cof_bhi2_bmid2_a_hi3_wordmux",
    "udiv_cof_bhi3_bmid1_a_hi2_wordmux",
    "udiv_cof_bhi2_blo1_a_hi1_wordmux",
    "udiv_hybrid_top1_deep",
    "udiv_hybrid_top2_deep",
    "udiv_hybrid_top3_deep",
    "udiv_ex266_hybrid_top1_a43",
    "udiv_ex266_hybrid_top2_a43",
    "udiv_ex266_hybrid_top1_b2a4",
    "udiv_ex266_hybrid_top2_b2a4",
    "square_fullrow_csa_csel4",
    "square_fullrow_csa_csel6",
    "square_fullrow_csa_csel8",
    "square_halfprod_mid",
    "square_halfprod_lowheavy",
    "square_pairadder_tree",
    "square_hybrid_bdd_mid4",
    "square_hybrid_bdd_mid6",
    "square_hybrid_bdd_top2_mid2",
    "square_hybrid_bdd_top4_mid2",
    "isqrt_p4ge_hand_hi",
    "isqrt_p3ge_hand_hi",
    "isqrt_square_threshold_wordtree",
    "isqrt_threshold_toggle_bits",
    "isqrt_threshold_toggle_shared",
)

FLOW_VARIANTS = (
    "abc_g_aig",
    "wreduce_abc_g_aig",
    "arith_wreduce_aig",
    "synth_preset",
    "abc_g_aig_d8",
    "abc_g_aig_d10",
    "abc_g_aig_d12",
    "synth_preset_d8",
    "synth_preset_d10",
    "synth_preset_d12",
    "synth_preset_d16",
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
        "synth_preset_d16": lambda v, m, o: base.script_synth_preset(v, m, o, 16),
    }
)


def load_reference(path):
    refs = {}
    with Path(path).open(newline="") as handle:
        for row in csv.DictReader(handle):
            case = row.get("case", "").strip()
            if case:
                refs[case] = {
                    "area": int(row["area"]),
                    "delay": int(row["delay"]),
                    "adp": int(row["adp"]),
                }
    return refs


def const(width, value):
    return "{0}'d{1}".format(width, value)


def zero(width):
    return "{0}'b0".format(width)


def header(module, in_width, out_width):
    return [
        "module {0}(in, out);".format(module),
        "  input [{0}:0] in;".format(in_width - 1),
        "  output [{0}:0] out;".format(out_width - 1),
    ]


def verify_case_semantics(case, table):
    kind = CASE_KIND[case]
    if kind == "udiv":
        return udiv.verify_semantics(case, table)
    if kind == "square":
        return square.verify_semantics(case, table)
    if kind == "isqrt":
        return isqrt.verify_semantics(case, table)
    return False, "unknown kind"


def fixed_vars_for_udiv(case, source):
    n = CASE_WIDTH[case]
    b = lambda bit: n + bit
    a = lambda bit: bit
    if source == "udiv_cof_bhi3_a_hi1_wordmux":
        return [b(n - 1), b(n - 2), b(n - 3), a(n - 1)]
    if source == "udiv_cof_bhi2_a_hi2_wordmux":
        return [b(n - 1), b(n - 2), a(n - 1), a(n - 2)]
    if source == "udiv_cof_bhi3_a_hi2_wordmux":
        return [b(n - 1), b(n - 2), b(n - 3), a(n - 1), a(n - 2)]
    if source == "udiv_cof_bhi4_a_hi1_wordmux":
        return [b(n - 1), b(n - 2), b(n - 3), b(n - 4), a(n - 1)]
    if source == "udiv_cof_bhi4_a_hi2_wordmux":
        return [b(n - 1), b(n - 2), b(n - 3), b(n - 4), a(n - 1), a(n - 2)]
    if source == "udiv_cof_bhi3_a_hi3_wordmux":
        return [b(n - 1), b(n - 2), b(n - 3), a(n - 1), a(n - 2), a(n - 3)]
    if source == "udiv_cof_bhi4_a_hi3_wordmux":
        return [b(n - 1), b(n - 2), b(n - 3), b(n - 4), a(n - 1), a(n - 2), a(n - 3)]
    if source == "udiv_cof_bhi2_bmid2_a_hi3_wordmux":
        mid0 = max(0, n - 4)
        mid1 = max(0, n - 5)
        return [b(n - 1), b(n - 2), b(mid0), b(mid1), a(n - 1), a(n - 2), a(n - 3)]
    if source == "udiv_cof_bhi3_bmid1_a_hi2_wordmux":
        mid = max(0, n - 4)
        return [b(n - 1), b(n - 2), b(n - 3), b(mid), a(n - 1), a(n - 2)]
    if source == "udiv_cof_bhi2_blo1_a_hi1_wordmux":
        return [b(n - 1), b(n - 2), b(0), a(n - 1)]
    return None


def render_udiv(module, case, source):
    fixed = fixed_vars_for_udiv(case, source)
    if fixed is None:
        if source == "udiv_ex266_hybrid_top1_a43":
            return render_ex266_hybrid_bits(module, CASE_WIDTH[case], 1, "a43")
        if source == "udiv_ex266_hybrid_top2_a43":
            return render_ex266_hybrid_bits(module, CASE_WIDTH[case], 2, "a43")
        if source == "udiv_ex266_hybrid_top1_b2a4":
            return render_ex266_hybrid_bits(module, CASE_WIDTH[case], 1, "b2a4")
        if source == "udiv_ex266_hybrid_top2_b2a4":
            return render_ex266_hybrid_bits(module, CASE_WIDTH[case], 2, "b2a4")
        if source == "udiv_hybrid_top1_deep":
            return render_udiv_hybrid_bits(module, CASE_WIDTH[case], 1)
        if source == "udiv_hybrid_top2_deep":
            return render_udiv_hybrid_bits(module, CASE_WIDTH[case], 2)
        if source == "udiv_hybrid_top3_deep":
            return render_udiv_hybrid_bits(module, CASE_WIDTH[case], 3)
        return None
    return udiv.render_ex266_cofactor_bitbdd_wordmux(module, CASE_WIDTH[case], fixed)


def render_ex266_hybrid_bits(module, n, top_count, deep_kind):
    if n != 5:
        return None
    b = lambda bit: n + bit
    a = lambda bit: bit
    shallow = [b(4), b(3), a(4)]
    if deep_kind == "a43":
        deep = [b(4), b(3), a(4), a(3)]
    elif deep_kind == "b2a4":
        deep = [b(4), b(3), b(2), a(4)]
    else:
        return None
    lines = udiv.header(module, n)
    top_bits = list(range(n - top_count, n))
    low_bits = [bit for bit in range(n) if bit not in top_bits]
    low_exprs = bdd_wordmux_bit_exprs(lines, n, shallow, "e266_lo", low_bits)
    top_exprs = bdd_wordmux_bit_exprs(lines, n, deep, "e266_hi", top_bits)
    bits = []
    for bit in range(n):
        bits.append(top_exprs.get(bit, low_exprs.get(bit, "1'b0")))
    lines.append("  assign out = {{{0}}};".format(", ".join(reversed(bits))))
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def bdd_wordmux_bit_exprs(lines, n, fixed_vars, label, selected_bits):
    fixed_vars = list(fixed_vars)
    order = udiv.cofactor_order_interleave(n, fixed_vars)
    groups = 1 << len(fixed_vars)
    lines.append("  wire [{0}:0] {1}_sel = {{{2}}};".format(len(fixed_vars) - 1, label, ", ".join("in[{0}]".format(var) for var in fixed_vars)))
    out = {}
    for out_bit in selected_bits:
        group_exprs = []
        for group in range(groups):
            fixed = {}
            for offset, var in enumerate(fixed_vars):
                fixed[var] = (group >> (len(fixed_vars) - 1 - offset)) & 1
            unique = {}
            nodes = []
            root = udiv.build_fixed_bdd_for_bit(n, out_bit, fixed, order, unique, nodes)
            prefix = "{0}_{1}_{2}".format(label, out_bit, group)
            for offset, (var, low, high) in enumerate(nodes):
                node_id = offset + 2
                lines.append(
                    "  wire {0}_n{1} = in[{2}] ? {3} : {4};".format(
                        prefix,
                        node_id,
                        var,
                        udiv.fixed_bdd_expr(prefix, high),
                        udiv.fixed_bdd_expr(prefix, low),
                    )
                )
            group_exprs.append(udiv.fixed_bdd_expr(prefix, root))
        lines.append("  reg {0}_bit{1};".format(label, out_bit))
        lines.append("  always @* begin")
        lines.append("    case ({0}_sel)".format(label))
        for group, expr in enumerate(group_exprs):
            lines.append("      {0}'d{1}: {2}_bit{3} = {4};".format(len(fixed_vars), group, label, out_bit, expr))
        lines.append("      default: {0}_bit{1} = 1'b0;".format(label, out_bit))
        lines.append("    endcase")
        lines.append("  end")
        out[out_bit] = "{0}_bit{1}".format(label, out_bit)
    return out


def render_udiv_hybrid_bits(module, n, top_count):
    if n < 6:
        return None
    lines = udiv.header(module, n)
    b = lambda bit: n + bit
    a = lambda bit: bit
    shallow = [b(n - 1), b(n - 2), b(n - 3), b(max(0, n - 4)), a(n - 1), a(n - 2)]
    deep = [b(n - 1), b(n - 2), b(n - 3), b(max(0, n - 4)), a(n - 1), a(n - 2), a(n - 3)]
    top_bits = list(range(n - top_count, n))
    low_bits = [bit for bit in range(n) if bit not in top_bits]
    low_exprs = bdd_wordmux_bit_exprs(lines, n, shallow, "hy_lo", low_bits)
    top_exprs = bdd_wordmux_bit_exprs(lines, n, deep, "hy_hi", top_bits)
    bits = []
    for bit in range(n):
        bits.append(top_exprs.get(bit, low_exprs.get(bit, "1'b0")))
    lines.append("  assign out = {{{0}}};".format(", ".join(reversed(bits))))
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def square_terms(width, n):
    terms = []
    for i in range(n):
        terms.append("(x[{0}] ? ({1}'d1 << {2}) : {1}'d0)".format(i, width, 2 * i))
    for i in range(n):
        for j in range(i + 1, n):
            terms.append("((x[{0}] & x[{1}]) ? ({2}'d1 << {3}) : {2}'d0)".format(i, j, width, i + j + 1))
    return terms


def append_fullrow_csa(lines, out_name, terms, width, csel_group):
    names = []
    for idx, expr in enumerate(terms):
        name = "term_{0}".format(idx)
        lines.append("  wire [{0}:0] {1} = {2};".format(width - 1, name, expr))
        names.append(name)
    stage = 0
    while len(names) > 2:
        next_names = []
        for idx in range(0, len(names), 3):
            group = names[idx : idx + 3]
            if len(group) < 3:
                next_names.extend(group)
                continue
            a, b, c = group
            s = "csa_s_{0}_{1}".format(stage, idx)
            cy = "csa_c_{0}_{1}".format(stage, idx)
            lines.append("  wire [{0}:0] {1} = {2} ^ {3} ^ {4};".format(width - 1, s, a, b, c))
            lines.append("  wire [{0}:0] {1} = (({2} & {3}) | ({2} & {4}) | ({3} & {4})) << 1;".format(width - 1, cy, a, b, c))
            next_names.extend([s, cy])
        names = next_names
        stage += 1
    lines.append("  wire [{0}:0] row0 = {1};".format(width - 1, names[0]))
    lines.append("  wire [{0}:0] row1 = {1};".format(width - 1, names[1] if len(names) > 1 else zero(width)))
    square.append_carryselect_adder(lines, out_name, "row0", "row1", width, csel_group)


def render_square_fullrow_csa(module, n, csel_group):
    width = 2 * n
    lines = header(module, n, width)
    lines.append("  wire [{0}:0] x = in;".format(n - 1))
    append_fullrow_csa(lines, "out", square_terms(width, n), width, csel_group)
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def render_square_halfprod(module, n, split):
    width = 2 * n
    hiw = n - split
    lines = header(module, n, width)
    lines.append("  wire [{0}:0] lo = in[{0}:0];".format(split - 1))
    lines.append("  wire [{0}:0] hi = in[{1}:{2}];".format(hiw - 1, n - 1, split))
    lines.append("  wire [{0}:0] lo_sq = lo * lo;".format(2 * split - 1))
    lines.append("  wire [{0}:0] hi_sq = hi * hi;".format(2 * hiw - 1))
    lines.append("  wire [{0}:0] cross = lo * hi;".format(n - 1))
    lines.append("  wire [{0}:0] lo_ext = {{{1}'b0, lo_sq}};".format(width - 1, width - 2 * split))
    lines.append("  wire [{0}:0] cross_ext = {{{1}'b0, cross, {2}'b0}};".format(width - 1, width - n - split - 1, split + 1))
    lines.append("  wire [{0}:0] hi_ext = {{{1}'b0, hi_sq, {2}'b0}};".format(width - 1, max(0, width - 2 * hiw - 2 * split), 2 * split))
    lines.append("  assign out = lo_ext + cross_ext + hi_ext;")
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def balanced_add_expr(items):
    if not items:
        return "0"
    cur = list(items)
    while len(cur) > 1:
        nxt = []
        for idx in range(0, len(cur), 2):
            if idx + 1 < len(cur):
                nxt.append("({0} + {1})".format(cur[idx], cur[idx + 1]))
            else:
                nxt.append(cur[idx])
        cur = nxt
    return cur[0]


def render_square_pairadder_tree(module, n):
    width = 2 * n
    lines = header(module, n, width)
    lines.append("  wire [{0}:0] x = in;".format(n - 1))
    lines.append("  assign out = {0};".format(balanced_add_expr(square_terms(width, n))))
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def render_square(module, case, source):
    n = CASE_WIDTH[case]
    if source == "square_fullrow_csa_csel4":
        return render_square_fullrow_csa(module, n, 4)
    if source == "square_fullrow_csa_csel6":
        return render_square_fullrow_csa(module, n, 6)
    if source == "square_fullrow_csa_csel8":
        return render_square_fullrow_csa(module, n, 8)
    if source == "square_halfprod_mid":
        return render_square_halfprod(module, n, n // 2)
    if source == "square_halfprod_lowheavy":
        return render_square_halfprod(module, n, max(3, n // 2 - 1))
    if source == "square_pairadder_tree":
        return render_square_pairadder_tree(module, n)
    if source == "square_hybrid_bdd_mid4":
        width = 2 * n
        return square.render_hybrid_bddbits(module, n, list(range(width - 8, width - 4)), shared=True)
    if source == "square_hybrid_bdd_mid6":
        width = 2 * n
        return square.render_hybrid_bddbits(module, n, list(range(width - 10, width - 4)), shared=True)
    if source == "square_hybrid_bdd_top2_mid2":
        width = 2 * n
        return square.render_hybrid_bddbits(module, n, [width - 1, width - 2, width - 7, width - 8], shared=True)
    if source == "square_hybrid_bdd_top4_mid2":
        width = 2 * n
        return square.render_hybrid_bddbits(module, n, [width - 1, width - 2, width - 3, width - 4, width - 7, width - 8], shared=True)
    return None


def hand_hi_expr(input_name):
    q4 = "({0}[9] | {0}[8])".format(input_name)
    q3 = "((~{0}[9] & ~{0}[8] & ({0}[7] | {0}[6])) | ({0}[9] & ({0}[8] | {0}[7] | {0}[6])))".format(input_name)
    return q4, q3


def render_isqrt_hand_hi(module, input_width, output_width, prefix_bits):
    base_text = isqrt.render_prefix_ge_bitwise(module, input_width, output_width, prefix_bits)
    if input_width != 10 or output_width != 5 or base_text is None:
        return None
    lines = base_text.splitlines()
    out_lines = []
    for line in lines:
        if line.strip() == "assign out = out_r;":
            q4, q3 = hand_hi_expr("in")
            out_lines.append("  wire q4_hand = {0};".format(q4))
            out_lines.append("  wire q3_hand = {0};".format(q3))
            out_lines.append("  assign out = {q4_hand, q3_hand, out_r[2:0]};")
        else:
            out_lines.append(line)
    return "\n".join(out_lines) + "\n"


def range_tree_word_expr(input_name, input_width, output_width, lo, hi):
    if lo == hi:
        return const(output_width, lo)
    mid = (lo + hi + 1) // 2
    thresh = mid * mid
    return "({0} >= {1} ? {2} : {3})".format(
        input_name,
        const(input_width, thresh),
        range_tree_word_expr(input_name, input_width, output_width, mid, hi),
        range_tree_word_expr(input_name, input_width, output_width, lo, mid - 1),
    )


def render_isqrt_threshold_wordtree(module, input_width, output_width):
    lines = header(module, input_width, output_width)
    lines.append("  assign out = {0};".format(range_tree_word_expr("in", input_width, output_width, 0, (1 << output_width) - 1)))
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def cmp_ge_expr(signal, width, value):
    if value <= 0:
        return "1'b1"
    if value >= (1 << width):
        return "1'b0"
    return "({0} >= {1})".format(signal, const(width, value))


def render_isqrt_threshold_toggle_bits(module, input_width, output_width, shared=False):
    lines = header(module, input_width, output_width)
    max_q = (1 << output_width) - 1
    if shared:
        thresholds = sorted({q * q for q in range(1, max_q + 1)})
        for threshold in thresholds:
            lines.append("  wire ge_{0} = {1};".format(threshold, cmp_ge_expr("in", input_width, threshold)))
        ge = lambda threshold: "ge_{0}".format(threshold)
    else:
        ge = lambda threshold: cmp_ge_expr("in", input_width, threshold)
    for bit in range(output_width):
        terms = []
        for q in range(1, max_q + 1):
            prev = (q - 1) >> bit
            cur = q >> bit
            if (prev & 1) != (cur & 1):
                terms.append(ge(q * q))
        lines.append("  assign out[{0}] = {1};".format(bit, isqrt.xor_chain(terms)))
    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def render_isqrt(module, case, source):
    input_width = CASE_WIDTH[case]
    output_width = CASE_OUT_WIDTH[case]
    if source == "isqrt_p4ge_hand_hi":
        return render_isqrt_hand_hi(module, input_width, output_width, 4)
    if source == "isqrt_p3ge_hand_hi":
        return render_isqrt_hand_hi(module, input_width, output_width, 3)
    if source == "isqrt_square_threshold_wordtree":
        return render_isqrt_threshold_wordtree(module, input_width, output_width)
    if source == "isqrt_threshold_toggle_bits":
        return render_isqrt_threshold_toggle_bits(module, input_width, output_width, False)
    if source == "isqrt_threshold_toggle_shared":
        return render_isqrt_threshold_toggle_bits(module, input_width, output_width, True)
    return None


def render_verilog(module, case, source):
    kind = CASE_KIND[case]
    if kind == "udiv":
        return render_udiv(module, case, source)
    if kind == "square":
        return render_square(module, case, source)
    if kind == "isqrt":
        return render_isqrt(module, case, source)
    return None


def row_template(case, candidate_id, source, flow, verilog_path, aig_path, semantic_ok, semantic_note, refs):
    ref = refs.get(case, {})
    return {
        "case": case,
        "candidate_id": candidate_id,
        "hypothesis": {
            "udiv": "unsigned lowN_highN:a/b dbz=max",
            "square": "unsigned_square_x_times_x",
            "isqrt": "unsigned_floor_isqrt",
        }[CASE_KIND[case]],
        "variant": "{0}+{1}".format(source, flow),
        "verilog_path": base.rel(verilog_path),
        "aig_path": base.rel(aig_path),
        "verified_truth": "1" if semantic_ok else "0",
        "synthesized": "0",
        "equivalent": "0",
        "area": "",
        "delay": "",
        "adp": "",
        "reference_adp": str(ref.get("adp", "")),
        "adp_ratio_to_reference": "",
        "within_1p5_reference": "",
        "beats_reference": "",
        "runtime_sec": "0.000",
        "classification": {
            "udiv": "semantic_udiv_exact",
            "square": "square_specific_structural_rtl",
            "isqrt": "sqrt_specific_structural_rtl",
        }[CASE_KIND[case]],
        "notes": semantic_note,
    }


def add_ref(row, refs):
    ref = refs.get(row["case"], {}).get("adp")
    if not ref or not row.get("adp"):
        return
    adp = int(row["adp"])
    ratio = adp / ref
    row["reference_adp"] = str(ref)
    row["adp_ratio_to_reference"] = "{0:.6f}".format(ratio)
    row["within_1p5_reference"] = "1" if ratio <= 1.5 else "0"
    row["beats_reference"] = "1" if adp < ref else "0"


def applicable(case, source):
    if CASE_KIND[case] == "udiv":
        return source.startswith("udiv_")
    if CASE_KIND[case] == "square":
        return source.startswith("square_")
    if CASE_KIND[case] == "isqrt":
        return source.startswith("isqrt_")
    return False


def run_case(args, case, sources, flows, refs):
    table = TruthTable(args.benchmarks / "{0}.truth".format(case))
    semantic_ok, semantic_note = verify_case_semantics(case, table)
    rows = []
    manifest = {
        "case": case,
        "truth": base.rel(args.benchmarks / "{0}.truth".format(case)),
        "semantic": semantic_note,
        "input_width": table.input_width,
        "output_width": table.output_width,
        "sources": [],
        "candidates": [],
    }
    for source in sources:
        if not applicable(case, source):
            continue
        module = "{0}_{1}".format(case, source)
        text = render_verilog(module, case, source)
        if text is None:
            manifest["sources"].append({"source": source, "skipped": "not applicable"})
            continue
        verilog_path = args.work_dir / case / "verilog" / "{0}.v".format(module)
        base.write_text(verilog_path, text)
        manifest["sources"].append({"source": source, "verilog": base.rel(verilog_path)})
        for flow in flows:
            candidate_id = "{0}_{1}".format(module, flow)
            aig_path = args.work_dir / case / "aigs" / "{0}.aig".format(candidate_id)
            script_path = args.work_dir / case / "logs" / "{0}.ys".format(candidate_id)
            log_path = args.work_dir / case / "logs" / "{0}.yosys.log".format(candidate_id)
            row = row_template(case, candidate_id, source, flow, verilog_path, aig_path, semantic_ok, semantic_note, refs)
            start = time.time()
            if semantic_ok:
                try:
                    script = FLOW_SCRIPTS[flow](verilog_path, module, aig_path)
                    base.run_yosys(args.yosys, script, script_path, log_path, args.timeout)
                    row["synthesized"] = "1"
                    evaluated = evaluate_aig(
                        case=case,
                        candidate_id=candidate_id,
                        parent_id=source,
                        source="verilog_frontend",
                        tool_chain=flow,
                        aig_path=aig_path,
                        truth=args.benchmarks / "{0}.truth".format(case),
                        abc=args.abc,
                        notes="{0}; source={1}; flow={2}".format(semantic_note, source, flow),
                        timeout=args.timeout,
                    )
                    row["equivalent"] = "1" if evaluated.equivalent else "0"
                    if evaluated.area is not None:
                        row["area"] = str(evaluated.area)
                        row["delay"] = str(evaluated.delay)
                        row["adp"] = str(evaluated.adp)
                        add_ref(row, refs)
                    row["notes"] = evaluated.notes
                except (SynthError, RuntimeError, OSError, subprocess.TimeoutExpired) as exc:
                    row["notes"] = "{0}: {1}".format(type(exc).__name__, exc)[:1000]
            row["runtime_sec"] = "{0:.3f}".format(time.time() - start)
            rows.append(row)
            manifest["candidates"].append(row)
    base.write_text(args.work_dir / case / "manifest.json", json.dumps(manifest, indent=2, sort_keys=True) + "\n")
    return rows


def best_rows(rows):
    out = []
    for case in sorted({row["case"] for row in rows}):
        valid = [row for row in rows if row["case"] == case and row.get("equivalent") == "1" and row.get("adp")]
        if not valid:
            continue
        valid.sort(key=lambda row: (int(row["adp"]), int(row["delay"]), int(row["area"]), row["candidate_id"]))
        out.append({name: valid[0].get(name, "") for name in base.BEST_FIELDNAMES})
    return out


def summary_rows(best, refs):
    rows = []
    for row in best:
        ref = refs.get(row["case"], {}).get("adp")
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
        "Purpose: targeted frontend-only high-gap integer structure probes for `ex266`, `ex267`, `ex273`, `ex274`, and `ex276`.",
        "",
        "Inputs:",
        "- Truth files: `benchmarks/exNNN.truth`",
        "- Case notes: `student/cases/ex255_ex279_integer_arithmetic/`",
        "- Generator/script: `student/generators/integer_highgap_structures.py`",
        "",
        "Artifacts:",
        "- Work directory: `{0}`".format(base.rel(args.work_dir)),
        "- Candidates CSV: `{0}`".format(base.rel(args.results_dir / "candidates.csv")),
        "- Best CSV: `{0}`".format(base.rel(args.results_dir / "best.csv")),
        "- Summary CSV: `{0}`".format(base.rel(args.results_dir / "summary.csv")),
        "",
        "Methods tried:",
        "- UDIV: additional magnitude cofactor word-mux selectors beyond the previous best keys.",
        "- Square: full-width balanced CSA rows, half-product decomposition, and pairwise adder trees.",
        "- ISQRT: hand high-bit formulas combined with prefix-ge low bits, plus a balanced square-threshold word tree.",
        "",
        "Notes:",
        "- Every AIG row is exact-checked against the official truth table convention through `evaluate_aig`.",
        "- This is frontend seed synthesis only; no backend optimization portfolio was run.",
        "- No `student/seeds` bundle is updated by this partial follow-up.",
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
    parser.add_argument("--run-id", default="ex266_ex267_ex273_ex274_ex276_frontend_highgap_struct_20260609_1732")
    parser.add_argument("--cases", default=",".join(CASES))
    parser.add_argument("--sources", default="all")
    parser.add_argument("--flows", default="abc_g_aig,wreduce_abc_g_aig,arith_wreduce_aig,synth_preset")
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
    sources = SOURCE_VARIANTS if args.sources == "all" else base.parse_list(args.sources, SOURCE_VARIANTS)
    flows = base.parse_list(args.flows, FLOW_VARIANTS)
    if args.work_dir is None:
        args.work_dir = ROOT / "student" / "work" / args.run_id
    if args.runs_dir is None:
        args.runs_dir = ROOT / "student" / "runs" / "integer" / args.run_id
    args.results_dir = args.runs_dir / "results"
    refs = load_reference(ROOT / "reference_result.csv")
    all_rows = []
    for case in cases:
        all_rows.extend(run_case(args, case, sources, flows, refs))
    best = best_rows(all_rows)
    base.write_csv(args.results_dir / "candidates.csv", base.RESULT_FIELDNAMES, all_rows)
    base.write_csv(args.results_dir / "best.csv", base.BEST_FIELDNAMES, best)
    base.write_csv(
        args.results_dir / "summary.csv",
        ["case", "best_area", "best_delay", "best_adp", "reference_adp", "ratio_to_reference", "within_1p5_reference", "beats_reference", "candidate_id", "notes"],
        summary_rows(best, refs),
    )
    base.write_csv(args.results_dir / "evaluate_check.csv", base.RESULT_FIELDNAMES, all_rows)
    write_manifest(args, all_rows, best)
    print("wrote {0} candidates, {1} best rows".format(len(all_rows), len(best)))
    print(args.results_dir / "best.csv")


if __name__ == "__main__":
    main()
