#!/usr/bin/env python3
"""Exact high/low mantissa correction experiments for FP16 ex225.

The ex225 truth table matches FP16 log10 closely, but the current best seed is
dominated by shallow selected-bit correction logic.  This driver tries an
exact bipartite-style split for the critical mantissa correction bits: use the
mantissa high bits to select a small local low-bit run tree.
"""

import argparse
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
from student.frontends.yosys_synth import SynthError, synthesize_verilog
from student.generators.fp16_log_bitrun_hybrid import (
    MANT_BITS,
    MANT_SIZE,
    SIGN_EXP_BITS,
    bit_runs,
    emit_tree,
    ex225_manual_bit,
    ex225_manual_bit_expr,
    render_bit_cover,
    render_bitvec_cover,
    render_sign_exp_mant_case,
)
from student.generators.fp16_semantic_search import (
    BEST_FIELDNAMES,
    RESULT_FIELDNAMES,
    add_reference_columns,
    load_reference,
    metadata_row,
    rel_path,
    verify_outputs,
    write_csv,
    write_text,
)


CASE = "ex225"
LABEL = "fp16_log10"


def const_word(width, value):
    return "{0}'d{1}".format(width, value)


def emit_low_tree(lines, runs, lo_bits, indent, target):
    if len(runs) == 1:
        lines.append("{0}{1} = 1'b{2};".format(indent, target, runs[0][2]))
        return
    mid = len(runs) // 2
    left = runs[:mid]
    right = runs[mid:]
    boundary = left[-1][1]
    lines.append("{0}if (lo <= {1}) begin".format(indent, const_word(lo_bits, boundary)))
    emit_low_tree(lines, left, lo_bits, indent + "  ", target)
    lines.append("{0}end else begin".format(indent))
    emit_low_tree(lines, right, lo_bits, indent + "  ", target)
    lines.append("{0}end".format(indent))


def render_bit_hilo_cover(outputs, module, bit, hi_bits, attrs=False):
    lo_bits = MANT_BITS - hi_bits
    hi_size = 1 << hi_bits
    lo_size = 1 << lo_bits
    hi_expr = "mant[9:{0}]".format(lo_bits) if lo_bits else "mant"
    lo_expr = "mant[{0}:0]".format(lo_bits - 1) if lo_bits else "1'b0"
    case_kw = "(* parallel_case, full_case *) case" if attrs else "case"
    lines = [
        "module {0}(in, out_bit);".format(module),
        "  input [15:0] in;",
        "  output out_bit;",
        "  wire [5:0] sign_exp = in[15:10];",
        "  wire [9:0] mant = in[9:0];",
        "  wire [{0}:0] hi = {1};".format(max(hi_bits - 1, 0), hi_expr),
        "  wire [{0}:0] lo = {1};".format(max(lo_bits - 1, 0), lo_expr),
        "  reg bit_r;",
        "  always @* begin",
        "    {0} (sign_exp)".format(case_kw),
    ]
    const_se = 0
    nonconst_se = 0
    const_hi = 0
    range_hi = 0
    total_runs = 0
    max_runs = 1
    for sign_exp in range(1 << SIGN_EXP_BITS):
        values = [((outputs[(sign_exp << MANT_BITS) | mant] >> bit) & 1) for mant in range(MANT_SIZE)]
        if len(set(values)) == 1:
            const_se += 1
            lines.append("      {0}: bit_r = 1'b{1};".format(const_word(SIGN_EXP_BITS, sign_exp), values[0]))
            continue
        nonconst_se += 1
        lines.append("      {0}: begin".format(const_word(SIGN_EXP_BITS, sign_exp)))
        lines.append("        {0} (hi)".format(case_kw))
        for hi in range(hi_size):
            bucket = []
            for lo in range(lo_size):
                mant = (hi << lo_bits) | lo
                bucket.append((outputs[(sign_exp << MANT_BITS) | mant] >> bit) & 1)
            runs = bit_runs(bucket)
            if len(runs) == 1:
                const_hi += 1
                lines.append("          {0}: bit_r = 1'b{1};".format(const_word(hi_bits, hi), runs[0][2]))
            else:
                range_hi += 1
                total_runs += len(runs)
                max_runs = max(max_runs, len(runs))
                lines.append("          {0}: begin".format(const_word(hi_bits, hi)))
                emit_low_tree(lines, runs, lo_bits, "            ", "bit_r")
                lines.append("          end")
        lines.extend(["          default: bit_r = 1'b0;", "        endcase", "      end"])
    lines.extend(["      default: bit_r = 1'b0;", "    endcase", "  end", "  assign out_bit = bit_r;", "endmodule", ""])
    meta = (
        "bit={0}; hi_bits={1}; lo_bits={2}; attrs={3}; const_se={4}; "
        "nonconst_se={5}; const_hi={6}; range_hi={7}; total_low_runs={8}; max_low_runs={9}"
    ).format(bit, hi_bits, lo_bits, int(attrs), const_se, nonconst_se, const_hi, range_hi, total_runs, max_runs)
    return "\n".join(lines), meta


def emit_vec_low_tree(lines, runs, lo_bits, width, indent):
    if len(runs) == 1:
        lines.append("{0}bits_r = {1};".format(indent, const_word(width, runs[0][2])))
        return
    mid = len(runs) // 2
    left = runs[:mid]
    right = runs[mid:]
    boundary = left[-1][1]
    lines.append("{0}if (lo <= {1}) begin".format(indent, const_word(lo_bits, boundary)))
    emit_vec_low_tree(lines, left, lo_bits, width, indent + "  ")
    lines.append("{0}end else begin".format(indent))
    emit_vec_low_tree(lines, right, lo_bits, width, indent + "  ")
    lines.append("{0}end".format(indent))


def render_bitvec_hilo_cover(outputs, module, bits, hi_bits, attrs=False):
    ordered_bits = sorted(bits, reverse=True)
    width = len(ordered_bits)
    lo_bits = MANT_BITS - hi_bits
    hi_size = 1 << hi_bits
    lo_size = 1 << lo_bits
    hi_expr = "mant[9:{0}]".format(lo_bits) if lo_bits else "mant"
    lo_expr = "mant[{0}:0]".format(lo_bits - 1) if lo_bits else "1'b0"
    case_kw = "(* parallel_case, full_case *) case" if attrs else "case"

    def pack(value):
        packed = 0
        for bit in ordered_bits:
            packed = (packed << 1) | ((value >> bit) & 1)
        return packed

    lines = [
        "module {0}(in, out_bits);".format(module),
        "  input [15:0] in;",
        "  output [{0}:0] out_bits;".format(width - 1),
        "  wire [5:0] sign_exp = in[15:10];",
        "  wire [9:0] mant = in[9:0];",
        "  wire [{0}:0] hi = {1};".format(max(hi_bits - 1, 0), hi_expr),
        "  wire [{0}:0] lo = {1};".format(max(lo_bits - 1, 0), lo_expr),
        "  reg [{0}:0] bits_r;".format(width - 1),
        "  always @* begin",
        "    {0} (sign_exp)".format(case_kw),
    ]
    const_se = 0
    nonconst_se = 0
    const_hi = 0
    range_hi = 0
    total_runs = 0
    max_runs = 1
    for sign_exp in range(1 << SIGN_EXP_BITS):
        values = [pack(outputs[(sign_exp << MANT_BITS) | mant]) for mant in range(MANT_SIZE)]
        if len(set(values)) == 1:
            const_se += 1
            lines.append("      {0}: bits_r = {1};".format(const_word(SIGN_EXP_BITS, sign_exp), const_word(width, values[0])))
            continue
        nonconst_se += 1
        lines.append("      {0}: begin".format(const_word(SIGN_EXP_BITS, sign_exp)))
        lines.append("        {0} (hi)".format(case_kw))
        for hi in range(hi_size):
            bucket = []
            for lo in range(lo_size):
                mant = (hi << lo_bits) | lo
                bucket.append(pack(outputs[(sign_exp << MANT_BITS) | mant]))
            runs = bit_runs(bucket)
            if len(runs) == 1:
                const_hi += 1
                lines.append("          {0}: bits_r = {1};".format(const_word(hi_bits, hi), const_word(width, runs[0][2])))
            else:
                range_hi += 1
                total_runs += len(runs)
                max_runs = max(max_runs, len(runs))
                lines.append("          {0}: begin".format(const_word(hi_bits, hi)))
                emit_vec_low_tree(lines, runs, lo_bits, width, "            ")
                lines.append("          end")
        lines.extend(["          default: bits_r = {0};".format(const_word(width, 0)), "        endcase", "      end"])
    lines.extend(["      default: bits_r = {0};".format(const_word(width, 0)), "    endcase", "  end", "  assign out_bits = bits_r;", "endmodule", ""])
    meta = (
        "bits={0}; hi_bits={1}; lo_bits={2}; attrs={3}; const_se={4}; "
        "nonconst_se={5}; const_hi={6}; range_hi={7}; total_low_runs={8}; max_low_runs={9}"
    ).format(",".join(str(bit) for bit in ordered_bits), hi_bits, lo_bits, int(attrs), const_se, nonconst_se, const_hi, range_hi, total_runs, max_runs)
    return "\n".join(lines), meta, ordered_bits


def render_bit_toggle_cover(outputs, module, bit, attrs=False):
    case_kw = "(* parallel_case, full_case *) case" if attrs else "case"
    lines = [
        "module {0}(in, out_bit);".format(module),
        "  input [15:0] in;",
        "  output out_bit;",
        "  wire [5:0] sign_exp = in[15:10];",
        "  wire [9:0] mant = in[9:0];",
        "  reg bit_r;",
        "  always @* begin",
        "    {0} (sign_exp)".format(case_kw),
    ]
    const_se = 0
    toggle_se = 0
    total_thresholds = 0
    max_thresholds = 0
    for sign_exp in range(1 << SIGN_EXP_BITS):
        values = [((outputs[(sign_exp << MANT_BITS) | mant] >> bit) & 1) for mant in range(MANT_SIZE)]
        runs = bit_runs(values)
        if len(runs) == 1:
            const_se += 1
            lines.append("      {0}: bit_r = 1'b{1};".format(const_word(SIGN_EXP_BITS, sign_exp), runs[0][2]))
            continue
        toggle_se += 1
        thresholds = [run[1] for run in runs[:-1]]
        total_thresholds += len(thresholds)
        max_thresholds = max(max_thresholds, len(thresholds))
        terms = ["(mant > {0})".format(const_word(MANT_BITS, boundary)) for boundary in thresholds]
        expr = " ^ ".join(["1'b{0}".format(runs[0][2])] + terms)
        lines.append("      {0}: bit_r = {1};".format(const_word(SIGN_EXP_BITS, sign_exp), expr))
    lines.extend(["      default: bit_r = 1'b0;", "    endcase", "  end", "  assign out_bit = bit_r;", "endmodule", ""])
    meta = "bit={0}; toggle_cover; attrs={1}; const_se={2}; toggle_se={3}; thresholds={4}; max_thresholds={5}".format(
        bit,
        int(attrs),
        const_se,
        toggle_se,
        total_thresholds,
        max_thresholds,
    )
    return "\n".join(lines), meta


def interval_patterns(start, end, width):
    patterns = []
    value = start
    while value <= end:
        remaining = end - value + 1
        if value == 0:
            block = 1 << (remaining.bit_length() - 1)
        else:
            block = value & -value
            while block > remaining:
                block >>= 1
        suffix = block.bit_length() - 1
        prefix_len = width - suffix
        prefix = value >> suffix
        pattern = format(prefix, "0{0}b".format(prefix_len)) + ("?" * suffix)
        patterns.append(pattern)
        value += block
    return patterns


def render_bitvec_cube_cover(outputs, module, bits, cube_sign_exps, attrs=False):
    ordered_bits = sorted(bits, reverse=True)
    width = len(ordered_bits)
    case_kw = "(* parallel_case, full_case *) casez" if attrs else "casez"

    def pack(value):
        packed = 0
        for bit in ordered_bits:
            packed = (packed << 1) | ((value >> bit) & 1)
        return packed

    def emit_vec_tree(vec_lines, runs, indent):
        if len(runs) == 1:
            vec_lines.append("{0}bits_r = {1};".format(indent, const_word(width, runs[0][2])))
            return
        mid = len(runs) // 2
        left = runs[:mid]
        right = runs[mid:]
        boundary = left[-1][1]
        vec_lines.append("{0}if (mant <= {1}) begin".format(indent, const_word(MANT_BITS, boundary)))
        emit_vec_tree(vec_lines, left, indent + "  ")
        vec_lines.append("{0}end else begin".format(indent))
        emit_vec_tree(vec_lines, right, indent + "  ")
        vec_lines.append("{0}end".format(indent))

    lines = [
        "module {0}(in, out_bits);".format(module),
        "  input [15:0] in;",
        "  output [{0}:0] out_bits;".format(width - 1),
        "  wire [5:0] sign_exp = in[15:10];",
        "  wire [9:0] mant = in[9:0];",
        "  reg [{0}:0] bits_r;".format(width - 1),
        "  always @* begin",
        "    case (sign_exp)",
    ]
    const_se = 0
    tree_se = 0
    cube_se = 0
    cube_items = 0
    tree_runs = 0
    for sign_exp in range(1 << SIGN_EXP_BITS):
        values = [pack(outputs[(sign_exp << MANT_BITS) | mant]) for mant in range(MANT_SIZE)]
        runs = bit_runs(values)
        if len(runs) == 1:
            const_se += 1
            lines.append("      {0}: bits_r = {1};".format(const_word(SIGN_EXP_BITS, sign_exp), const_word(width, runs[0][2])))
        elif sign_exp in cube_sign_exps:
            cube_se += 1
            lines.append("      {0}: begin".format(const_word(SIGN_EXP_BITS, sign_exp)))
            lines.append("        {0} (mant)".format(case_kw))
            for start, end, value in runs:
                for pattern in interval_patterns(start, end, MANT_BITS):
                    cube_items += 1
                    lines.append("          10'b{0}: bits_r = {1};".format(pattern, const_word(width, value)))
            lines.extend(["          default: bits_r = {0};".format(const_word(width, 0)), "        endcase", "      end"])
        else:
            tree_se += 1
            tree_runs += len(runs)
            lines.append("      {0}: begin".format(const_word(SIGN_EXP_BITS, sign_exp)))
            emit_vec_tree(lines, runs, "        ")
            lines.append("      end")
    lines.extend(["      default: bits_r = {0};".format(const_word(width, 0)), "    endcase", "  end", "  assign out_bits = bits_r;", "endmodule", ""])
    meta = "bits={0}; cube_sign_exps={1}; attrs={2}; const_se={3}; tree_se={4}; cube_se={5}; tree_runs={6}; cube_items={7}".format(
        ",".join(str(bit) for bit in ordered_bits),
        ",".join("0x{0:02x}".format(item) for item in sorted(cube_sign_exps)),
        int(attrs),
        const_se,
        tree_se,
        cube_se,
        tree_runs,
        cube_items,
    )
    return "\n".join(lines), meta, ordered_bits


def render_hilo_hybrid(outputs, module, variant):
    table_module = module + "_table"
    table_v, table_items, _ = render_sign_exp_mant_case(outputs, table_module)
    use_vec = variant["mode"] == "vec_hilo"
    attrs = variant.get("attrs", False)
    lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [15:0] out;",
        "  wire [15:0] table_out;",
        "  wire [5:0] sign_exp = in[15:10];",
        "  wire [9:0] mant = in[9:0];",
        "  {0} u_table(.in(in), .out(table_out));".format(table_module),
        "  wire bit14_manual = {0};".format(ex225_manual_bit_expr(14)),
    ]
    modules = [table_v]
    metas = ["table_items={0}".format(table_items), "manual_bit14=threshold_expr"]
    selected = {14}
    if variant.get("bit12") == "run":
        bit12_module = module + "_bit12_run"
        bit12_v, bit12_meta = render_bit_cover(outputs, bit12_module, 12, 32)
        modules.append(bit12_v)
        metas.append("bit12_run: {0}".format(bit12_meta))
        lines.append("  wire bit12_out;")
        lines.append("  {0} u_bit12(.in(in), .out_bit(bit12_out));".format(bit12_module))
        selected.add(12)
    elif variant.get("bit12") == "manual":
        lines.append("  wire bit12_out = {0};".format(ex225_manual_bit_expr(12)))
        metas.append("bit12_manual=threshold_expr")
        selected.add(12)
    elif variant.get("bit12") == "hilo":
        bit12_module = module + "_bit12_hilo"
        bit12_v, bit12_meta = render_bit_hilo_cover(outputs, bit12_module, 12, variant["bit12_hi"], attrs=attrs)
        modules.append(bit12_v)
        metas.append("bit12_hilo: {0}".format(bit12_meta))
        lines.append("  wire bit12_out;")
        lines.append("  {0} u_bit12(.in(in), .out_bit(bit12_out));".format(bit12_module))
        selected.add(12)

    if use_vec:
        vec_module = module + "_bitvec_hilo"
        vec_v, vec_meta, ordered_bits = render_bitvec_hilo_cover(outputs, vec_module, variant["vec_bits"], variant["hi_bits"], attrs=attrs)
        modules.append(vec_v)
        metas.append("vec_hilo: {0}".format(vec_meta))
        lines.append("  wire [{0}:0] vec_bits;".format(len(ordered_bits) - 1))
        lines.append("  {0} u_vec(.in(in), .out_bits(vec_bits));".format(vec_module))
        vec_index = {bit: index for index, bit in enumerate(reversed(ordered_bits))}
        selected.update(ordered_bits)
    elif variant["mode"] == "bit9_toggle":
        bit9_module = module + "_bit9_toggle"
        bit9_v, bit9_meta = render_bit_toggle_cover(outputs, bit9_module, 9, attrs=attrs)
        modules.append(bit9_v)
        metas.append("bit9_toggle: {0}".format(bit9_meta))
        lines.append("  wire bit9_out;")
        lines.append("  {0} u_bit9(.in(in), .out_bit(bit9_out));".format(bit9_module))
        vec_index = {}
        selected.add(9)
    else:
        bit9_module = module + "_bit9_hilo"
        bit9_v, bit9_meta = render_bit_hilo_cover(outputs, bit9_module, 9, variant["hi_bits"], attrs=attrs)
        modules.append(bit9_v)
        metas.append("bit9_hilo: {0}".format(bit9_meta))
        lines.append("  wire bit9_out;")
        lines.append("  {0} u_bit9(.in(in), .out_bit(bit9_out));".format(bit9_module))
        vec_index = {}
        selected.add(9)

    for bit in range(16):
        if bit == 14:
            lines.append("  assign out[14] = bit14_manual;")
        elif bit == 12 and 12 in selected and not (use_vec and bit in vec_index):
            lines.append("  assign out[12] = bit12_out;")
        elif bit == 9 and not (use_vec and bit in vec_index):
            lines.append("  assign out[9] = bit9_out;")
        elif use_vec and bit in vec_index:
            lines.append("  assign out[{0}] = vec_bits[{1}];".format(bit, vec_index[bit]))
        else:
            lines.append("  assign out[{0}] = table_out[{0}];".format(bit))
    lines.extend(["endmodule", ""])
    lines.extend(modules)

    def model(index):
        sign_exp = index >> MANT_BITS
        mant = index & (MANT_SIZE - 1)
        value = outputs[index]
        value = (value & ~(1 << 14)) | (ex225_manual_bit(14, sign_exp, mant) << 14)
        if variant.get("bit12") == "manual":
            value = (value & ~(1 << 12)) | (ex225_manual_bit(12, sign_exp, mant) << 12)
        return value

    return "\n".join(lines), "; ".join(metas), model


def render_cube_hybrid(outputs, module, variant):
    table_module = module + "_table"
    table_v, table_items, _ = render_sign_exp_mant_case(outputs, table_module)
    vec_module = module + "_bitvec_cube"
    vec_v, vec_meta, ordered_bits = render_bitvec_cube_cover(
        outputs,
        vec_module,
        [12, 9],
        set(variant["cube_sign_exps"]),
        attrs=variant.get("attrs", False),
    )
    vec_index = {bit: index for index, bit in enumerate(reversed(ordered_bits))}
    lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [15:0] out;",
        "  wire [15:0] table_out;",
        "  wire [5:0] sign_exp = in[15:10];",
        "  wire [9:0] mant = in[9:0];",
        "  wire [{0}:0] vec_bits;".format(len(ordered_bits) - 1),
        "  {0} u_table(.in(in), .out(table_out));".format(table_module),
        "  {0} u_vec(.in(in), .out_bits(vec_bits));".format(vec_module),
        "  wire bit14_manual = {0};".format(ex225_manual_bit_expr(14)),
    ]
    for bit in range(16):
        if bit == 14:
            lines.append("  assign out[14] = bit14_manual;")
        elif bit in vec_index:
            lines.append("  assign out[{0}] = vec_bits[{1}];".format(bit, vec_index[bit]))
        else:
            lines.append("  assign out[{0}] = table_out[{0}];".format(bit))
    lines.extend(["endmodule", "", table_v, vec_v])

    def model(index):
        sign_exp = index >> MANT_BITS
        mant = index & (MANT_SIZE - 1)
        value = outputs[index]
        value = (value & ~(1 << 14)) | (ex225_manual_bit(14, sign_exp, mant) << 14)
        return value

    items = "table_items={0}; manual_bit14=threshold_expr; vec_cube: {1}".format(table_items, vec_meta)
    return "\n".join(lines), items, model


def sign_formula_expr(style):
    if style == "cmp":
        return "(sign_exp[4:0] == 5'd0) || ((!sign_exp[5]) && (sign_exp[4:0] < 5'd15))"
    if style == "bits":
        return "(sign_exp[4:0] == 5'd0) || ((!sign_exp[5]) && (!sign_exp[4]) && (!(sign_exp[3] && sign_exp[2] && sign_exp[1] && sign_exp[0])))"
    if style == "range":
        return "(sign_exp <= 6'h0e) || (sign_exp == 6'h20)"
    if style == "bits2":
        return "((!sign_exp[5]) && (!sign_exp[4]) && (!(sign_exp[3] && sign_exp[2] && sign_exp[1] && sign_exp[0]))) || (sign_exp == 6'h20)"
    raise ValueError("unsupported sign style")


def sign_formula_value(index):
    sign = (index >> 15) & 1
    exp = (index >> 10) & 31
    return int(exp == 0 or ((not sign) and exp < 15))


def render_sign_manual_hybrid(outputs, module, variant):
    table_module = module + "_table"
    table_v, table_items, _ = render_sign_exp_mant_case(outputs, table_module)
    vec_module = module + "_bitvec"
    vec_v, vec_meta, ordered_bits = render_bitvec_cover(outputs, vec_module, [12, 9], 32)
    vec_index = {bit: index for index, bit in enumerate(reversed(ordered_bits))}
    sign_style = variant["sign_style"]
    manual_bits = set(variant.get("manual_bits", []))
    lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [15:0] out;",
        "  wire [15:0] table_out;",
        "  wire [5:0] sign_exp = in[15:10];",
        "  wire [9:0] mant = in[9:0];",
        "  wire [{0}:0] vec_bits;".format(len(ordered_bits) - 1),
        "  {0} u_table(.in(in), .out(table_out));".format(table_module),
        "  {0} u_vec(.in(in), .out_bits(vec_bits));".format(vec_module),
        "  wire bit15_manual = {0};".format(sign_formula_expr(sign_style)),
        "  wire bit14_manual = {0};".format(ex225_manual_bit_expr(14)),
    ]
    if 13 in manual_bits:
        lines.append("  wire bit13_manual = {0};".format(ex225_manual_bit_expr(13)))
    if 12 in manual_bits:
        lines.append("  wire bit12_manual = {0};".format(ex225_manual_bit_expr(12)))
    for bit in range(16):
        if bit == 15:
            lines.append("  assign out[15] = bit15_manual;")
        elif bit == 14:
            lines.append("  assign out[14] = bit14_manual;")
        elif bit == 13 and 13 in manual_bits:
            lines.append("  assign out[13] = bit13_manual;")
        elif bit == 12 and 12 in manual_bits:
            lines.append("  assign out[12] = bit12_manual;")
        elif bit in vec_index:
            lines.append("  assign out[{0}] = vec_bits[{1}];".format(bit, vec_index[bit]))
        else:
            lines.append("  assign out[{0}] = table_out[{0}];".format(bit))
    lines.extend(["endmodule", "", table_v, vec_v])

    def model(index):
        sign_exp = index >> MANT_BITS
        mant = index & (MANT_SIZE - 1)
        value = outputs[index]
        value = (value & ~(1 << 15)) | (sign_formula_value(index) << 15)
        value = (value & ~(1 << 14)) | (ex225_manual_bit(14, sign_exp, mant) << 14)
        for bit in manual_bits:
            value = (value & ~(1 << bit)) | (ex225_manual_bit(bit, sign_exp, mant) << bit)
        return value

    items = "manual_sign={0}; manual_bits={1}; table_items={2}; {3}".format(
        sign_style,
        ",".join(str(bit) for bit in sorted(manual_bits | {14}, reverse=True)),
        table_items,
        vec_meta,
    )
    return "\n".join(lines), items, model


def render_manual_bits_vec_hybrid(outputs, module, variant):
    manual_bits = set(variant["manual_bits"])
    vec_bits = variant.get("vec_bits", [12, 9])
    table_module = module + "_table"
    table_v, table_items, _ = render_sign_exp_mant_case(outputs, table_module)
    vec_module = module + "_bitvec"
    vec_v, vec_meta, ordered_bits = render_bitvec_cover(outputs, vec_module, vec_bits, 32)
    vec_index = {bit: index for index, bit in enumerate(reversed(ordered_bits))}
    lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [15:0] out;",
        "  wire [15:0] table_out;",
        "  wire [5:0] sign_exp = in[15:10];",
        "  wire [9:0] mant = in[9:0];",
        "  wire [{0}:0] vec_bits;".format(len(ordered_bits) - 1),
        "  {0} u_table(.in(in), .out(table_out));".format(table_module),
        "  {0} u_vec(.in(in), .out_bits(vec_bits));".format(vec_module),
    ]
    for bit in sorted(manual_bits, reverse=True):
        lines.append("  wire bit{0}_manual = {1};".format(bit, ex225_manual_bit_expr(bit)))
    for bit in range(16):
        if bit in manual_bits:
            lines.append("  assign out[{0}] = bit{0}_manual;".format(bit))
        elif bit in vec_index:
            lines.append("  assign out[{0}] = vec_bits[{1}];".format(bit, vec_index[bit]))
        else:
            lines.append("  assign out[{0}] = table_out[{0}];".format(bit))
    lines.extend(["endmodule", "", table_v, vec_v])

    def model(index):
        sign_exp = index >> MANT_BITS
        mant = index & (MANT_SIZE - 1)
        value = outputs[index]
        for bit in manual_bits:
            value = (value & ~(1 << bit)) | (ex225_manual_bit(bit, sign_exp, mant) << bit)
        return value

    items = "manual_bits={0}; vec_bits={1}; table_items={2}; {3}".format(
        ",".join(str(bit) for bit in sorted(manual_bits, reverse=True)),
        ",".join(str(bit) for bit in sorted(vec_bits, reverse=True)),
        table_items,
        vec_meta,
    )
    return "\n".join(lines), items, model


def render_packed_run_table(outputs, module, keep_bits, threshold):
    ordered = sorted(keep_bits, reverse=True)
    width = len(ordered)

    def pack(value):
        packed = 0
        for bit in ordered:
            packed = (packed << 1) | ((value >> bit) & 1)
        return packed

    def emit_packed_tree(lines, runs, indent):
        if len(runs) == 1:
            lines.append("{0}out_r = {1};".format(indent, const_word(width, runs[0][2])))
            return
        mid = len(runs) // 2
        left = runs[:mid]
        right = runs[mid:]
        boundary = left[-1][1]
        lines.append("{0}if (mant <= {1}) begin".format(indent, const_word(MANT_BITS, boundary)))
        emit_packed_tree(lines, left, indent + "  ")
        lines.append("{0}end else begin".format(indent))
        emit_packed_tree(lines, right, indent + "  ")
        lines.append("{0}end".format(indent))

    lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [{0}:0] out;".format(width - 1),
        "  wire [5:0] sign_exp = in[15:10];",
        "  wire [9:0] mant = in[9:0];",
        "  reg [{0}:0] out_r;".format(width - 1),
        "  always @* begin",
        "    case (sign_exp)",
    ]
    const_groups = 0
    tree_groups = 0
    table_groups = 0
    tree_items = 0
    table_items = 0
    for sign_exp in range(1 << SIGN_EXP_BITS):
        values = [pack(outputs[(sign_exp << MANT_BITS) | mant]) for mant in range(MANT_SIZE)]
        runs = bit_runs(values)
        if len(runs) == 1:
            const_groups += 1
            lines.append("      {0}: out_r = {1};".format(const_word(SIGN_EXP_BITS, sign_exp), const_word(width, runs[0][2])))
        elif len(runs) <= threshold:
            tree_groups += 1
            tree_items += len(runs)
            lines.append("      {0}: begin".format(const_word(SIGN_EXP_BITS, sign_exp)))
            emit_packed_tree(lines, runs, "        ")
            lines.append("      end")
        else:
            table_groups += 1
            lines.append("      {0}: begin".format(const_word(SIGN_EXP_BITS, sign_exp)))
            lines.append("        case (mant)")
            for mant, value in enumerate(values):
                table_items += 1
                lines.append("          {0}: out_r = {1};".format(const_word(MANT_BITS, mant), const_word(width, value)))
            lines.extend(["          default: out_r = {0};".format(const_word(width, 0)), "        endcase", "      end"])
    lines.extend(["      default: out_r = {0};".format(const_word(width, 0)), "    endcase", "  end", "  assign out = out_r;", "endmodule", ""])
    bit_to_index = {bit: width - 1 - index for index, bit in enumerate(ordered)}
    meta = "packed_run keep_bits={0}; threshold={1}; const_groups={2}; tree_groups={3}; table_groups={4}; tree_items={5}; table_items={6}".format(
        ",".join(str(bit) for bit in ordered),
        threshold,
        const_groups,
        tree_groups,
        table_groups,
        tree_items,
        table_items,
    )
    return "\n".join(lines), meta, bit_to_index


def render_packed_run_hybrid(outputs, module, variant):
    selected = {14, 12, 9}
    keep_bits = [bit for bit in range(16) if bit not in selected]
    table_module = module + "_packed_run_table"
    table_v, table_meta, table_index = render_packed_run_table(outputs, table_module, keep_bits, variant["threshold"])
    vec_module = module + "_bitvec"
    vec_v, vec_meta, ordered_bits = render_bitvec_cover(outputs, vec_module, [12, 9], 32)
    vec_index = {bit: index for index, bit in enumerate(reversed(ordered_bits))}
    lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [15:0] out;",
        "  wire [{0}:0] table_bits;".format(len(keep_bits) - 1),
        "  wire [5:0] sign_exp = in[15:10];",
        "  wire [9:0] mant = in[9:0];",
        "  wire [{0}:0] vec_bits;".format(len(ordered_bits) - 1),
        "  {0} u_table(.in(in), .out(table_bits));".format(table_module),
        "  {0} u_vec(.in(in), .out_bits(vec_bits));".format(vec_module),
        "  wire bit14_manual = {0};".format(ex225_manual_bit_expr(14)),
    ]
    for bit in range(16):
        if bit == 14:
            lines.append("  assign out[14] = bit14_manual;")
        elif bit in vec_index:
            lines.append("  assign out[{0}] = vec_bits[{1}];".format(bit, vec_index[bit]))
        else:
            lines.append("  assign out[{0}] = table_bits[{1}];".format(bit, table_index[bit]))
    lines.extend(["endmodule", "", table_v, vec_v])

    def model(index):
        sign_exp = index >> MANT_BITS
        mant = index & (MANT_SIZE - 1)
        value = outputs[index]
        value = (value & ~(1 << 14)) | (ex225_manual_bit(14, sign_exp, mant) << 14)
        return value

    items = "{0}; manual_bit14=threshold_expr; {1}".format(table_meta, vec_meta)
    return "\n".join(lines), items, model


BDD_ORDERS = {
    "se_mant_msb": list(range(15, 9, -1)) + list(range(9, -1, -1)),
    "mant_msb_se": list(range(9, -1, -1)) + list(range(15, 9, -1)),
    "interleave": [15, 9, 14, 8, 13, 7, 12, 6, 11, 5, 10, 4, 3, 2, 1, 0],
    "se_mant_lsb": list(range(15, 9, -1)) + list(range(0, 10)),
}


def render_bdd_bit_cover(outputs, module, bit, order_name):
    order = BDD_ORDERS[order_name]
    values = [((value >> bit) & 1) for value in outputs]
    unique = {}
    nodes = {}
    memo = {}

    def build(level, value, mask):
        key = (level, value, mask)
        if key in memo:
            return memo[key]
        if level == len(order):
            result = values[value]
        else:
            var = order[level]
            low = build(level + 1, value & ~(1 << var), mask | (1 << var))
            high = build(level + 1, value | (1 << var), mask | (1 << var))
            if low == high:
                result = low
            else:
                node_key = (var, low, high)
                result = unique.get(node_key)
                if result is None:
                    result = len(unique) + 2
                    unique[node_key] = result
                    nodes[result] = node_key
        memo[key] = result
        return result

    root = build(0, 0, 0)

    def node_expr(node):
        if node == 0:
            return "1'b0"
        if node == 1:
            return "1'b1"
        return "n{0}".format(node)

    lines = [
        "module {0}(in, out_bit);".format(module),
        "  input [15:0] in;",
        "  output out_bit;",
    ]
    for node in sorted(nodes):
        lines.append("  wire n{0};".format(node))
    for node in sorted(nodes):
        var, low, high = nodes[node]
        lines.append("  assign n{0} = in[{1}] ? {2} : {3};".format(node, var, node_expr(high), node_expr(low)))
    lines.append("  assign out_bit = {0};".format(node_expr(root)))
    lines.extend(["endmodule", ""])
    meta = "bit={0}; bdd_order={1}; nodes={2}".format(bit, order_name, len(nodes))
    return "\n".join(lines), meta


def render_bdd_hybrid(outputs, module, variant):
    table_module = module + "_table"
    table_v, table_items, _ = render_sign_exp_mant_case(outputs, table_module)
    lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [15:0] out;",
        "  wire [15:0] table_out;",
        "  wire [5:0] sign_exp = in[15:10];",
        "  wire [9:0] mant = in[9:0];",
        "  {0} u_table(.in(in), .out(table_out));".format(table_module),
        "  wire bit14_manual = {0};".format(ex225_manual_bit_expr(14)),
    ]
    modules = [table_v]
    metas = ["table_items={0}".format(table_items), "manual_bit14=threshold_expr"]
    selected = {14}
    order = variant["order"]
    for bit in variant["bdd_bits"]:
        bit_module = "{0}_bit{1}_bdd".format(module, bit)
        bit_v, bit_meta = render_bdd_bit_cover(outputs, bit_module, bit, order)
        modules.append(bit_v)
        metas.append(bit_meta)
        lines.append("  wire bit{0}_out;".format(bit))
        lines.append("  {0} u_bit{1}(.in(in), .out_bit(bit{1}_out));".format(bit_module, bit))
        selected.add(bit)
    if variant.get("bit12") == "run":
        bit12_module = module + "_bit12_run"
        bit12_v, bit12_meta = render_bit_cover(outputs, bit12_module, 12, 32)
        modules.append(bit12_v)
        metas.append("bit12_run: {0}".format(bit12_meta))
        lines.append("  wire bit12_out;")
        lines.append("  {0} u_bit12run(.in(in), .out_bit(bit12_out));".format(bit12_module))
        selected.add(12)
    elif variant.get("bit12") == "manual":
        lines.append("  wire bit12_out = {0};".format(ex225_manual_bit_expr(12)))
        metas.append("bit12_manual=threshold_expr")
        selected.add(12)

    for bit in range(16):
        if bit == 14:
            lines.append("  assign out[14] = bit14_manual;")
        elif bit in selected and bit != 14:
            lines.append("  assign out[{0}] = bit{0}_out;".format(bit))
        else:
            lines.append("  assign out[{0}] = table_out[{0}];".format(bit))
    lines.extend(["endmodule", ""])
    lines.extend(modules)

    def model(index):
        sign_exp = index >> MANT_BITS
        mant = index & (MANT_SIZE - 1)
        value = outputs[index]
        value = (value & ~(1 << 14)) | (ex225_manual_bit(14, sign_exp, mant) << 14)
        if variant.get("bit12") == "manual":
            value = (value & ~(1 << 12)) | (ex225_manual_bit(12, sign_exp, mant) << 12)
        return value

    return "\n".join(lines), "; ".join(metas), model


def render_mtbdd_cover(outputs, module, bits, order_name):
    order = BDD_ORDERS[order_name]
    ordered_bits = sorted(bits, reverse=True)
    width = len(ordered_bits)
    values = []
    for value in outputs:
        packed = 0
        for bit in ordered_bits:
            packed = (packed << 1) | ((value >> bit) & 1)
        values.append(packed)

    unique = {}
    nodes = {}
    memo = {}

    def build(level, value, mask):
        key = (level, value, mask)
        if key in memo:
            return memo[key]
        if level == len(order):
            result = ("leaf", values[value])
        else:
            var = order[level]
            low = build(level + 1, value & ~(1 << var), mask | (1 << var))
            high = build(level + 1, value | (1 << var), mask | (1 << var))
            if low == high:
                result = low
            else:
                node_key = (var, low, high)
                result = unique.get(node_key)
                if result is None:
                    result = ("node", len(unique))
                    unique[node_key] = result
                    nodes[result[1]] = node_key
        memo[key] = result
        return result

    root = build(0, 0, 0)

    def expr(ref):
        kind, value = ref
        if kind == "leaf":
            return const_word(width, value)
        return "n{0}".format(value)

    lines = [
        "module {0}(in, out_bits);".format(module),
        "  input [15:0] in;",
        "  output [{0}:0] out_bits;".format(width - 1),
    ]
    for node in sorted(nodes):
        lines.append("  wire [{0}:0] n{1};".format(width - 1, node))
    for node in sorted(nodes):
        var, low, high = nodes[node]
        lines.append("  assign n{0} = in[{1}] ? {2} : {3};".format(node, var, expr(high), expr(low)))
    lines.append("  assign out_bits = {0};".format(expr(root)))
    lines.extend(["endmodule", ""])
    meta = "mtbdd bits={0}; order={1}; nodes={2}".format(
        ",".join(str(bit) for bit in ordered_bits),
        order_name,
        len(nodes),
    )
    return "\n".join(lines), meta, ordered_bits


def render_mtbdd_hybrid(outputs, module, variant):
    table_module = module + "_table"
    table_v, table_items, _ = render_sign_exp_mant_case(outputs, table_module)
    mtbdd_module = module + "_mtbdd"
    mtbdd_v, mtbdd_meta, ordered_bits = render_mtbdd_cover(outputs, mtbdd_module, variant["mtbdd_bits"], variant["order"])
    mtbdd_index = {bit: index for index, bit in enumerate(reversed(ordered_bits))}
    manual_bits = set(variant.get("manual_bits", []))
    lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [15:0] out;",
        "  wire [15:0] table_out;",
        "  wire [5:0] sign_exp = in[15:10];",
        "  wire [9:0] mant = in[9:0];",
        "  wire [{0}:0] mtbdd_bits;".format(len(ordered_bits) - 1),
        "  {0} u_table(.in(in), .out(table_out));".format(table_module),
        "  {0} u_mtbdd(.in(in), .out_bits(mtbdd_bits));".format(mtbdd_module),
    ]
    if variant.get("manual_sign"):
        style = variant.get("sign_style", "cmp")
        lines.append("  wire bit15_manual = {0};".format(sign_formula_expr(style)))
        manual_bits.add(15)
    for bit in sorted(manual_bits, reverse=True):
        if bit == 15:
            continue
        lines.append("  wire bit{0}_manual = {1};".format(bit, ex225_manual_bit_expr(bit)))
    for bit in range(16):
        if bit == 15 and bit in manual_bits:
            lines.append("  assign out[15] = bit15_manual;")
        elif bit in manual_bits:
            lines.append("  assign out[{0}] = bit{0}_manual;".format(bit))
        elif bit in mtbdd_index:
            lines.append("  assign out[{0}] = mtbdd_bits[{1}];".format(bit, mtbdd_index[bit]))
        else:
            lines.append("  assign out[{0}] = table_out[{0}];".format(bit))
    lines.extend(["endmodule", "", table_v, mtbdd_v])

    def model(index):
        sign_exp = index >> MANT_BITS
        mant = index & (MANT_SIZE - 1)
        value = outputs[index]
        if 15 in manual_bits:
            value = (value & ~(1 << 15)) | (sign_formula_value(index) << 15)
        for bit in manual_bits:
            if bit == 15:
                continue
            value = (value & ~(1 << bit)) | (ex225_manual_bit(bit, sign_exp, mant) << bit)
        return value

    items = "table_items={0}; {1}; manual_bits={2}".format(
        table_items,
        mtbdd_meta,
        ",".join(str(bit) for bit in sorted(manual_bits, reverse=True)),
    )
    return "\n".join(lines), items, model


def render_predecode_cover(outputs, module, bits, pre_sign_exps=None):
    ordered_bits = sorted(bits, reverse=True)
    width = len(ordered_bits)
    pre_set = None if pre_sign_exps is None else set(pre_sign_exps)

    def pack(value):
        packed = 0
        for bit in ordered_bits:
            packed = (packed << 1) | ((value >> bit) & 1)
        return packed

    runs_by_se = {}
    thresholds = []
    threshold_index = {}
    for sign_exp in range(1 << SIGN_EXP_BITS):
        values = [pack(outputs[(sign_exp << MANT_BITS) | mant]) for mant in range(MANT_SIZE)]
        runs = bit_runs(values)
        runs_by_se[sign_exp] = runs
        if pre_set is None or sign_exp in pre_set:
            for start, end, value in runs[:-1]:
                if end not in threshold_index:
                    threshold_index[end] = len(thresholds)
                    thresholds.append(end)

    def bit_expr(runs, out_index):
        bit_mask = 1 << out_index
        initial = 1 if (runs[0][2] & bit_mask) else 0
        terms = ["1'b{0}".format(initial)]
        prev = initial
        for index, (start, end, value) in enumerate(runs[:-1]):
            next_bit = 1 if (runs[index + 1][2] & bit_mask) else 0
            if next_bit != prev:
                terms.append("gt_{0}".format(threshold_index[end]))
            prev = next_bit
        if len(terms) == 1:
            return terms[0]
        return " ^ ".join(terms)

    lines = [
        "module {0}(in, out_bits);".format(module),
        "  input [15:0] in;",
        "  output [{0}:0] out_bits;".format(width - 1),
        "  wire [5:0] sign_exp = in[15:10];",
        "  wire [9:0] mant = in[9:0];",
    ]
    for threshold in thresholds:
        lines.append("  wire gt_{0} = mant > {1};".format(threshold_index[threshold], const_word(MANT_BITS, threshold)))
    lines.extend(["  reg [{0}:0] bits_r;".format(width - 1), "  always @* begin", "    case (sign_exp)"])
    const_groups = 0
    expr_groups = 0
    tree_groups = 0
    total_runs = 0

    def emit_packed_tree(tree_lines, runs, indent):
        if len(runs) == 1:
            tree_lines.append("{0}bits_r = {1};".format(indent, const_word(width, runs[0][2])))
            return
        mid = len(runs) // 2
        left = runs[:mid]
        right = runs[mid:]
        boundary = left[-1][1]
        tree_lines.append("{0}if (mant <= {1}) begin".format(indent, const_word(MANT_BITS, boundary)))
        emit_packed_tree(tree_lines, left, indent + "  ")
        tree_lines.append("{0}end else begin".format(indent))
        emit_packed_tree(tree_lines, right, indent + "  ")
        tree_lines.append("{0}end".format(indent))

    for sign_exp in range(1 << SIGN_EXP_BITS):
        runs = runs_by_se[sign_exp]
        if len(runs) == 1:
            const_groups += 1
            lines.append("      {0}: bits_r = {1};".format(const_word(SIGN_EXP_BITS, sign_exp), const_word(width, runs[0][2])))
            continue
        if pre_set is not None and sign_exp not in pre_set:
            tree_groups += 1
            total_runs += len(runs)
            lines.append("      {0}: begin".format(const_word(SIGN_EXP_BITS, sign_exp)))
            emit_packed_tree(lines, runs, "        ")
            lines.append("      end")
            continue
        expr_groups += 1
        total_runs += len(runs)
        exprs = [bit_expr(runs, index) for index in range(width)]
        lines.append("      {0}: bits_r = {{{1}}};".format(const_word(SIGN_EXP_BITS, sign_exp), ", ".join(reversed(exprs))))
    lines.extend(["      default: bits_r = {0};".format(const_word(width, 0)), "    endcase", "  end", "  assign out_bits = bits_r;", "endmodule", ""])
    group_text = "all" if pre_set is None else ",".join("0x{0:02x}".format(item) for item in sorted(pre_set))
    meta = "predecode bits={0}; groups={1}; thresholds={2}; const_groups={3}; expr_groups={4}; tree_groups={5}; total_runs={6}".format(
        ",".join(str(bit) for bit in ordered_bits),
        group_text,
        len(thresholds),
        const_groups,
        expr_groups,
        tree_groups,
        total_runs,
    )
    return "\n".join(lines), meta, ordered_bits


def render_predecode_hybrid(outputs, module, variant):
    table_module = module + "_table"
    table_v, table_items, _ = render_sign_exp_mant_case(outputs, table_module)
    pre_module = module + "_predecode"
    pre_v, pre_meta, ordered_bits = render_predecode_cover(outputs, pre_module, variant["pre_bits"], variant.get("pre_sign_exps"))
    pre_index = {bit: index for index, bit in enumerate(reversed(ordered_bits))}
    manual_bits = set(variant.get("manual_bits", []))
    lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [15:0] out;",
        "  wire [15:0] table_out;",
        "  wire [5:0] sign_exp = in[15:10];",
        "  wire [9:0] mant = in[9:0];",
        "  wire [{0}:0] pre_bits;".format(len(ordered_bits) - 1),
        "  {0} u_table(.in(in), .out(table_out));".format(table_module),
        "  {0} u_pre(.in(in), .out_bits(pre_bits));".format(pre_module),
    ]
    if variant.get("manual_sign"):
        lines.append("  wire bit15_manual = {0};".format(sign_formula_expr(variant.get("sign_style", "cmp"))))
        manual_bits.add(15)
    for bit in sorted(manual_bits, reverse=True):
        if bit == 15:
            continue
        lines.append("  wire bit{0}_manual = {1};".format(bit, ex225_manual_bit_expr(bit)))
    for bit in range(16):
        if bit == 15 and bit in manual_bits:
            lines.append("  assign out[15] = bit15_manual;")
        elif bit in manual_bits:
            lines.append("  assign out[{0}] = bit{0}_manual;".format(bit))
        elif bit in pre_index:
            lines.append("  assign out[{0}] = pre_bits[{1}];".format(bit, pre_index[bit]))
        else:
            lines.append("  assign out[{0}] = table_out[{0}];".format(bit))
    lines.extend(["endmodule", "", table_v, pre_v])

    def model(index):
        sign_exp = index >> MANT_BITS
        mant = index & (MANT_SIZE - 1)
        value = outputs[index]
        if 15 in manual_bits:
            value = (value & ~(1 << 15)) | (sign_formula_value(index) << 15)
        for bit in manual_bits:
            if bit == 15:
                continue
            value = (value & ~(1 << bit)) | (ex225_manual_bit(bit, sign_exp, mant) << bit)
        return value

    items = "table_items={0}; {1}; manual_bits={2}".format(
        table_items,
        pre_meta,
        ",".join(str(bit) for bit in sorted(manual_bits, reverse=True)),
    )
    return "\n".join(lines), items, model


def render_all_bdd_hybrid(outputs, module, variant):
    order = variant["order"]
    manual_bits = set(variant.get("manual_bits", []))
    lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [15:0] out;",
    ]
    if manual_bits:
        lines.extend([
            "  wire [5:0] sign_exp = in[15:10];",
            "  wire [9:0] mant = in[9:0];",
        ])
    modules = []
    metas = []
    for bit in range(16):
        if bit in manual_bits:
            lines.append("  wire bit{0}_out = {1};".format(bit, ex225_manual_bit_expr(bit)))
            metas.append("bit={0}; manual_expr".format(bit))
            continue
        bit_module = "{0}_bit{1}_bdd".format(module, bit)
        bit_v, bit_meta = render_bdd_bit_cover(outputs, bit_module, bit, order)
        modules.append(bit_v)
        metas.append(bit_meta)
        lines.append("  wire bit{0}_out;".format(bit))
        lines.append("  {0} u_bit{1}(.in(in), .out_bit(bit{1}_out));".format(bit_module, bit))
    for bit in range(16):
        lines.append("  assign out[{0}] = bit{0}_out;".format(bit))
    lines.extend(["endmodule", ""])
    lines.extend(modules)

    def model(index):
        sign_exp = index >> MANT_BITS
        mant = index & (MANT_SIZE - 1)
        value = outputs[index]
        for bit in manual_bits:
            value = (value & ~(1 << bit)) | (ex225_manual_bit(bit, sign_exp, mant) << bit)
        return value

    return "\n".join(lines), "; ".join(metas), model


def render_toggle_hybrid(outputs, module, variant):
    table_module = module + "_table"
    table_v, table_items, _ = render_sign_exp_mant_case(outputs, table_module)
    attrs = variant.get("attrs", False)
    lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [15:0] out;",
        "  wire [15:0] table_out;",
        "  wire [5:0] sign_exp = in[15:10];",
        "  wire [9:0] mant = in[9:0];",
        "  {0} u_table(.in(in), .out(table_out));".format(table_module),
        "  wire bit14_manual = {0};".format(ex225_manual_bit_expr(14)),
    ]
    modules = [table_v]
    metas = ["table_items={0}".format(table_items), "manual_bit14=threshold_expr"]
    selected = {14}

    if variant.get("bit12") == "run":
        bit12_module = module + "_bit12_run"
        bit12_v, bit12_meta = render_bit_cover(outputs, bit12_module, 12, 32)
        modules.append(bit12_v)
        metas.append("bit12_run: {0}".format(bit12_meta))
        lines.append("  wire bit12_out;")
        lines.append("  {0} u_bit12(.in(in), .out_bit(bit12_out));".format(bit12_module))
        selected.add(12)
    elif variant.get("bit12") == "manual":
        lines.append("  wire bit12_out = {0};".format(ex225_manual_bit_expr(12)))
        metas.append("bit12_manual=threshold_expr")
        selected.add(12)
    elif variant.get("bit12") == "toggle":
        bit12_module = module + "_bit12_toggle"
        bit12_v, bit12_meta = render_bit_toggle_cover(outputs, bit12_module, 12, attrs=attrs)
        modules.append(bit12_v)
        metas.append("bit12_toggle: {0}".format(bit12_meta))
        lines.append("  wire bit12_out;")
        lines.append("  {0} u_bit12(.in(in), .out_bit(bit12_out));".format(bit12_module))
        selected.add(12)

    bit9_module = module + "_bit9_toggle"
    bit9_v, bit9_meta = render_bit_toggle_cover(outputs, bit9_module, 9, attrs=attrs)
    modules.append(bit9_v)
    metas.append("bit9_toggle: {0}".format(bit9_meta))
    lines.append("  wire bit9_out;")
    lines.append("  {0} u_bit9(.in(in), .out_bit(bit9_out));".format(bit9_module))
    selected.add(9)

    for bit in range(16):
        if bit == 14:
            lines.append("  assign out[14] = bit14_manual;")
        elif bit == 12 and bit in selected:
            lines.append("  assign out[12] = bit12_out;")
        elif bit == 9:
            lines.append("  assign out[9] = bit9_out;")
        else:
            lines.append("  assign out[{0}] = table_out[{0}];".format(bit))
    lines.extend(["endmodule", ""])
    lines.extend(modules)

    def model(index):
        sign_exp = index >> MANT_BITS
        mant = index & (MANT_SIZE - 1)
        value = outputs[index]
        value = (value & ~(1 << 14)) | (ex225_manual_bit(14, sign_exp, mant) << 14)
        if variant.get("bit12") == "manual":
            value = (value & ~(1 << 12)) | (ex225_manual_bit(12, sign_exp, mant) << 12)
        return value

    return "\n".join(lines), "; ".join(metas), model


def variant_specs():
    specs = []
    for hi_bits in (4, 5, 6, 7, 8):
        specs.append({
            "name": "manual14_bit12run_bit9hilo_h{0}".format(hi_bits),
            "mode": "bit9_hilo",
            "hi_bits": hi_bits,
            "bit12": "run",
        })
        specs.append({
            "name": "manual14_bit12manual_bit9hilo_h{0}".format(hi_bits),
            "mode": "bit9_hilo",
            "hi_bits": hi_bits,
            "bit12": "manual",
        })
        specs.append({
            "name": "manual14_vec12_9_hilo_h{0}".format(hi_bits),
            "mode": "vec_hilo",
            "hi_bits": hi_bits,
            "vec_bits": [12, 9],
        })
    for hi_bits in (5, 6, 7):
        specs.append({
            "name": "manual14_bit12hilo_h{0}_bit9hilo_h{0}".format(hi_bits),
            "mode": "bit9_hilo",
            "hi_bits": hi_bits,
            "bit12": "hilo",
            "bit12_hi": hi_bits,
        })
        specs.append({
            "name": "manual14_vec12_9_hilo_attr_h{0}".format(hi_bits),
            "mode": "vec_hilo",
            "hi_bits": hi_bits,
            "vec_bits": [12, 9],
            "attrs": True,
        })
    specs.extend([
        {
            "name": "manual14_bit12run_bit9toggle",
            "mode": "toggle",
            "bit12": "run",
        },
        {
            "name": "manual14_bit12manual_bit9toggle",
            "mode": "toggle",
            "bit12": "manual",
        },
        {
            "name": "manual14_bit12toggle_bit9toggle",
            "mode": "toggle",
            "bit12": "toggle",
        },
        {
            "name": "manual14_bit12run_bit9toggle_attr",
            "mode": "toggle",
            "bit12": "run",
            "attrs": True,
        },
        {
            "name": "manual14_bit12toggle_bit9toggle_attr",
            "mode": "toggle",
            "bit12": "toggle",
            "attrs": True,
        },
    ])
    specs.extend([
        {
            "name": "manual14_vec12_9_cube_0e",
            "mode": "cube",
            "cube_sign_exps": [0x0E],
        },
        {
            "name": "manual14_vec12_9_cube_0f",
            "mode": "cube",
            "cube_sign_exps": [0x0F],
        },
        {
            "name": "manual14_vec12_9_cube_0e_0f",
            "mode": "cube",
            "cube_sign_exps": [0x0E, 0x0F],
        },
        {
            "name": "manual14_vec12_9_cube_0e_0f_attr",
            "mode": "cube",
            "cube_sign_exps": [0x0E, 0x0F],
            "attrs": True,
        },
        {
            "name": "manual14_vec12_9_cube_many",
            "mode": "cube",
            "cube_sign_exps": [0x0D, 0x0E, 0x0F, 0x10],
        },
    ])
    specs.extend([
        {
            "name": "manual15cmp_14_bitvec12_9",
            "mode": "sign_manual",
            "sign_style": "cmp",
        },
        {
            "name": "manual15bits_14_bitvec12_9",
            "mode": "sign_manual",
            "sign_style": "bits",
        },
        {
            "name": "manual15cmp_14_13_bitvec12_9",
            "mode": "sign_manual",
            "sign_style": "cmp",
            "manual_bits": [13],
        },
        {
            "name": "manual15bits_14_13_bitvec12_9",
            "mode": "sign_manual",
            "sign_style": "bits",
            "manual_bits": [13],
        },
        {
            "name": "manual15cmp_14_12_bitvec9",
            "mode": "sign_manual",
            "sign_style": "cmp",
            "manual_bits": [12],
        },
        {
            "name": "manual14_13_bitvec12_9",
            "mode": "manual_bits_vec",
            "manual_bits": [14, 13],
            "vec_bits": [12, 9],
        },
        {
            "name": "manual14_13_12_bitvec9",
            "mode": "manual_bits_vec",
            "manual_bits": [14, 13, 12],
            "vec_bits": [9],
        },
    ])
    for threshold in (128, 256, 512, 1024):
        specs.append({
            "name": "manual14_bitvec12_9_packedrun_t{0}".format(threshold),
            "mode": "packed_run",
            "threshold": threshold,
        })
    for order in ("se_mant_msb", "mant_msb_se", "interleave"):
        specs.extend([
            {
                "name": "manual14_bit12run_bdd9_{0}".format(order),
                "mode": "bdd",
                "order": order,
                "bdd_bits": [9],
                "bit12": "run",
            },
            {
                "name": "manual14_bdd12_9_{0}".format(order),
                "mode": "bdd",
                "order": order,
                "bdd_bits": [12, 9],
            },
        ])
    specs.extend([
        {
            "name": "manual14_mtbdd12_9_se_mant_msb",
            "mode": "mtbdd",
            "order": "se_mant_msb",
            "mtbdd_bits": [12, 9],
            "manual_bits": [14],
        },
        {
            "name": "manual14_mtbdd13_12_9_se_mant_msb",
            "mode": "mtbdd",
            "order": "se_mant_msb",
            "mtbdd_bits": [13, 12, 9],
            "manual_bits": [14],
        },
        {
            "name": "manual14_mtbdd14_13_12_9_se_mant_msb",
            "mode": "mtbdd",
            "order": "se_mant_msb",
            "mtbdd_bits": [14, 13, 12, 9],
        },
        {
            "name": "manual15_14_13_mtbdd12_9_se_mant_msb",
            "mode": "mtbdd",
            "order": "se_mant_msb",
            "mtbdd_bits": [12, 9],
            "manual_bits": [14, 13],
            "manual_sign": True,
        },
        {
            "name": "manual14_mtbdd13_12_9_interleave",
            "mode": "mtbdd",
            "order": "interleave",
            "mtbdd_bits": [13, 12, 9],
            "manual_bits": [14],
        },
    ])
    specs.extend([
        {
            "name": "manual14_predecode12_9",
            "mode": "predecode",
            "pre_bits": [12, 9],
            "manual_bits": [14],
        },
        {
            "name": "manual14_predecode13_12_9",
            "mode": "predecode",
            "pre_bits": [13, 12, 9],
            "manual_bits": [14],
        },
        {
            "name": "manual14_13_predecode12_9",
            "mode": "predecode",
            "pre_bits": [12, 9],
            "manual_bits": [14, 13],
        },
        {
            "name": "manual15_14_13_predecode12_9",
            "mode": "predecode",
            "pre_bits": [12, 9],
            "manual_bits": [14, 13],
            "manual_sign": True,
        },
        {
            "name": "manual15_14_13_predecode12_9_complex2",
            "mode": "predecode",
            "pre_bits": [12, 9],
            "pre_sign_exps": [0x0E, 0x0F],
            "manual_bits": [14, 13],
            "manual_sign": True,
        },
        {
            "name": "manual15_14_13_predecode12_9_complex4",
            "mode": "predecode",
            "pre_bits": [12, 9],
            "pre_sign_exps": [0x0D, 0x0E, 0x0F, 0x10],
            "manual_bits": [14, 13],
            "manual_sign": True,
        },
        {
            "name": "manual15_14_13_predecode12_9_complex8",
            "mode": "predecode",
            "pre_bits": [12, 9],
            "pre_sign_exps": [0x08, 0x0D, 0x0E, 0x0F, 0x10, 0x15, 0x18, 0x1C],
            "manual_bits": [14, 13],
            "manual_sign": True,
        },
        {
            "name": "manual15bits_14_13_predecode12_9",
            "mode": "predecode",
            "pre_bits": [12, 9],
            "manual_bits": [14, 13],
            "manual_sign": True,
            "sign_style": "bits",
        },
        {
            "name": "manual15range_14_13_predecode12_9",
            "mode": "predecode",
            "pre_bits": [12, 9],
            "manual_bits": [14, 13],
            "manual_sign": True,
            "sign_style": "range",
        },
        {
            "name": "manual15bits2_14_13_predecode12_9",
            "mode": "predecode",
            "pre_bits": [12, 9],
            "manual_bits": [14, 13],
            "manual_sign": True,
            "sign_style": "bits2",
        },
        {
            "name": "manual15_14_13_12_predecode9",
            "mode": "predecode",
            "pre_bits": [9],
            "manual_bits": [14, 13, 12],
            "manual_sign": True,
        },
        {
            "name": "manual15bits_14_13_12_predecode9",
            "mode": "predecode",
            "pre_bits": [9],
            "manual_bits": [14, 13, 12],
            "manual_sign": True,
            "sign_style": "bits",
        },
        {
            "name": "manual15_14_predecode13_12_9",
            "mode": "predecode",
            "pre_bits": [13, 12, 9],
            "manual_bits": [14],
            "manual_sign": True,
        },
        {
            "name": "manual15bits_14_predecode13_12_9",
            "mode": "predecode",
            "pre_bits": [13, 12, 9],
            "manual_bits": [14],
            "manual_sign": True,
            "sign_style": "bits",
        },
        {
            "name": "predecode15_14_13_12_9",
            "mode": "predecode",
            "pre_bits": [15, 14, 13, 12, 9],
        },
        {
            "name": "manual14_predecode15_13_12_9",
            "mode": "predecode",
            "pre_bits": [15, 13, 12, 9],
            "manual_bits": [14],
        },
    ])
    specs.extend([
        {
            "name": "allbits_bdd_se_mant_msb",
            "mode": "all_bdd",
            "order": "se_mant_msb",
        },
        {
            "name": "manual14_allbits_bdd_se_mant_msb",
            "mode": "all_bdd",
            "order": "se_mant_msb",
            "manual_bits": [14],
        },
    ])
    return specs


def empty_row(candidate_id, variant, verilog_path, aig_path):
    return {
        "case": CASE,
        "candidate_id": candidate_id,
        "hypothesis/function_guess": LABEL,
        "variant": variant,
        "verilog_path": rel_path(verilog_path),
        "aig_path": rel_path(aig_path),
        "verified_truth": "0",
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
        "items": "",
        "classification": "structural_exact",
        "notes": "",
    }


def best_rows(rows):
    valid = [row for row in rows if row.get("equivalent") == "1" and row.get("adp")]
    if not valid:
        return []
    best = min(valid, key=lambda row: int(row["adp"]))
    return [{name: best.get(name, "") for name in BEST_FIELDNAMES}]


def run(args):
    refs = load_reference(args.reference)
    truth_path = args.benchmarks / "{0}.truth".format(CASE)
    table = TruthTable(truth_path)
    outputs = list(table.iter_outputs())
    specs = variant_specs()
    if args.variants:
        wanted = {item.strip() for item in args.variants.split(",") if item.strip()}
        specs = [spec for spec in specs if spec["name"] in wanted]

    rows = []
    manifest = {
        "run_id": args.run_id,
        "case": CASE,
        "truth": rel_path(truth_path),
        "hypothesis/function_guess": LABEL,
        "metadata": metadata_row(CASE, table, outputs),
        "method": "exact bipartite-style high/low mantissa correction for selected log10 bits",
        "variants": [],
    }
    for spec in specs:
        variant = spec["name"]
        candidate_id = "{0}_{1}_{2}".format(CASE, LABEL, variant)
        module = candidate_id
        case_dir = args.work_dir / CASE
        verilog_path = case_dir / "verilog" / "{0}.v".format(candidate_id)
        aig_path = case_dir / "aigs" / "{0}.aig".format(candidate_id)
        script_path = case_dir / "logs" / "{0}.ys".format(candidate_id)
        log_path = case_dir / "logs" / "{0}.yosys.log".format(candidate_id)
        row = empty_row(candidate_id, variant, verilog_path, aig_path)
        start = time.time()
        try:
            if spec["mode"] == "toggle":
                verilog, items, model = render_toggle_hybrid(outputs, module, spec)
            elif spec["mode"] == "cube":
                verilog, items, model = render_cube_hybrid(outputs, module, spec)
            elif spec["mode"] == "sign_manual":
                verilog, items, model = render_sign_manual_hybrid(outputs, module, spec)
            elif spec["mode"] == "manual_bits_vec":
                verilog, items, model = render_manual_bits_vec_hybrid(outputs, module, spec)
            elif spec["mode"] == "packed_run":
                verilog, items, model = render_packed_run_hybrid(outputs, module, spec)
            elif spec["mode"] == "bdd":
                verilog, items, model = render_bdd_hybrid(outputs, module, spec)
            elif spec["mode"] == "mtbdd":
                verilog, items, model = render_mtbdd_hybrid(outputs, module, spec)
            elif spec["mode"] == "predecode":
                verilog, items, model = render_predecode_hybrid(outputs, module, spec)
            elif spec["mode"] == "all_bdd":
                verilog, items, model = render_all_bdd_hybrid(outputs, module, spec)
            else:
                verilog, items, model = render_hilo_hybrid(outputs, module, spec)
            row["items"] = items
            verified, note = verify_outputs(outputs, model)
            row["verified_truth"] = "1" if verified else "0"
            row["notes"] = note
            write_text(verilog_path, verilog)
            if verified:
                yosys_log = synthesize_verilog(
                    verilog=verilog_path,
                    module=module,
                    output=aig_path,
                    yosys=args.yosys,
                    timeout=args.timeout,
                    script_out=script_path,
                )
                write_text(log_path, yosys_log)
                row["synthesized"] = "1"
                evaluated = evaluate_aig(
                    case=CASE,
                    candidate_id=candidate_id,
                    parent_id=LABEL,
                    source="ai_verilog",
                    tool_chain="yosys_fp16_ex225_hilo_correction_{0}".format(variant),
                    aig_path=aig_path,
                    truth=truth_path,
                    abc=args.abc,
                    notes="exact high/low mantissa correction; {0}".format(items),
                    timeout=args.timeout,
                )
                row["equivalent"] = "1" if evaluated.equivalent else "0"
                row["area"] = "" if evaluated.area is None else str(evaluated.area)
                row["delay"] = "" if evaluated.delay is None else str(evaluated.delay)
                row["adp"] = "" if evaluated.adp is None else str(evaluated.adp)
                row["notes"] = evaluated.notes
        except (RuntimeError, SynthError, OSError, subprocess.TimeoutExpired) as exc:
            row["notes"] = "{0}: {1}".format(type(exc).__name__, exc)[:1000]
        row["runtime_sec"] = "{0:.3f}".format(time.time() - start)
        add_reference_columns(row, refs)
        rows.append(row)
        manifest["variants"].append(row)
        print("{0} eq={1} area={2} delay={3} adp={4}".format(variant, row["equivalent"], row["area"], row["delay"], row["adp"]))
        sys.stdout.flush()

    write_csv(args.results / "candidates.csv", RESULT_FIELDNAMES, rows)
    write_csv(args.results / "best.csv", BEST_FIELDNAMES, best_rows(rows))
    write_csv(args.results / "summary.csv", RESULT_FIELDNAMES, rows)
    write_text(args.work_dir / CASE / "manifest.json", json.dumps(manifest, indent=2) + "\n")
    write_text(
        args.run_dir / "MANIFEST.md",
        "# {0}\n\nRun ID: `{0}`\n\nPurpose: exact high/low mantissa correction for ex225 bit9/bit12 selected-bit bottlenecks.\n\nInputs:\n- Truth file: `{1}`\n- Generator: `student/generators/fp16_ex225_hilo_correction.py`\n\nArtifacts:\n- Work directory: `{2}`\n- Candidates CSV: `{3}`\n- Best CSV: `{4}`\n\nMethods tried:\n- Bipartite-style mantissa split: high bits select a local low-bit run tree.\n- Manual bit14 threshold retained from current best.\n- Crossed bit9 high/low with bit12 run-cover, bit12 manual formula, bit12 high/low, and shared bit12/bit9 vector high/low.\n\nBest result:\n- See `{4}`.\n\nNotes:\n- Frontend-only exact verification plus single Yosys AIG synthesis; no backend optimization portfolio.\n".format(
            args.run_id,
            rel_path(truth_path),
            rel_path(args.work_dir),
            rel_path(args.results / "candidates.csv"),
            rel_path(args.results / "best.csv"),
        ),
    )
    return rows


def parse_args():
    parser = argparse.ArgumentParser(description="Run exact ex225 high/low correction experiments.")
    parser.add_argument("--run-id", required=True)
    parser.add_argument("--work-dir", type=Path, required=True)
    parser.add_argument("--run-dir", type=Path, required=True)
    parser.add_argument("--results", type=Path, required=True)
    parser.add_argument("--variants", default="")
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--reference", type=Path, default=ROOT / "reference_result.csv")
    parser.add_argument("--yosys", type=Path, default=ROOT / "student" / "tools" / "conda-env" / "bin" / "yosys")
    parser.add_argument("--abc", type=Path, default=ROOT / "student" / "abc")
    parser.add_argument("--timeout", type=int, default=900)
    return parser.parse_args()


def main():
    args = parse_args()
    args.work_dir.mkdir(parents=True, exist_ok=True)
    args.run_dir.mkdir(parents=True, exist_ok=True)
    args.results.mkdir(parents=True, exist_ok=True)
    run(args)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
