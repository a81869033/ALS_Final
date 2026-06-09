#!/usr/bin/env python3
"""Generate ANF seeds over a nonlinear endpoint-mux coordinate system."""

import argparse
import csv
import json
import subprocess
import sys
import time
from itertools import combinations
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from student.backends.abc_flow import evaluate_aig
from student.frontends.truth import TruthTable
from student.frontends.yosys_synth import SynthError, synthesize_verilog
from student.generators.unknown_algebraic_search import (
    anf_by_bit,
    eval_anf_word,
    key_lines_for_transform,
    transform_index,
    transformed_outputs,
)
from student.generators.unknown_anf_grouped_davio_search import (
    PrefixedDavioEmitter,
    choose_order,
    endpoint_order,
)
from student.generators.unknown_key_ac_decomp_search import (
    EVALUATE_FIELDNAMES,
    SUMMARY_FIELDNAMES,
    add_summary_columns,
    load_current_best,
    load_reference,
)
from student.generators.unknown_verilog_search import (
    ALL_FIELDNAMES,
    BEST_FIELDNAMES,
    parse_cases,
    range_decl,
    text_hash,
    write_csv,
    write_text,
)


def popcount(value):
    return bin(value).count("1")


def parse_list(text):
    return [item.strip() for item in text.split(",") if item.strip()]


def xor_expr(items):
    items = [item for item in items if item != "1'b0"]
    if not items:
        return "1'b0"
    if len(items) == 1:
        return items[0]
    return "(" + " ^ ".join(items) + ")"


def and_expr(items):
    items = [item for item in items if item != "1'b1"]
    if not items:
        return "1'b1"
    if len(items) == 1:
        return items[0]
    return "(" + " & ".join(items) + ")"


def bitset_items(value):
    index = 0
    while value:
        if value & 1:
            yield index
        value >>= 1
        index += 1


def feature_masks(width, degree):
    masks = [0]
    for deg in range(1, degree + 1):
        for combo in combinations(range(width), deg):
            mask = 0
            for bit in combo:
                mask |= 1 << bit
            masks.append(mask)
    return masks


def key_bit_value(key, bit, width, mode):
    if mode == "mod":
        return (key >> (bit % width)) & 1
    if 0 <= bit < width:
        return (key >> bit) & 1
    return 0


def mux_coord_bits_value(key, width, coord_mode):
    bits = []
    if coord_mode == "orig":
        coord_count = width - 2
        low_mode = "clamp"
        high_mode = "clamp"
    elif coord_mode == "full_mod":
        coord_count = width
        low_mode = "mod"
        high_mode = "mod"
    elif coord_mode in ("full_clamp", "full_clamp_simplified"):
        coord_count = width
        low_mode = "clamp"
        high_mode = "clamp"
    elif coord_mode == "full_wrap_low_zero_high":
        coord_count = width
        low_mode = "clamp"
        high_mode = "mod"
    else:
        raise RuntimeError("unknown coordinate mode: {0}".format(coord_mode))

    for bit in range(coord_count):
        low = key_bit_value(key, bit + 1, width, low_mode)
        high = key_bit_value(key, width - 2 - bit, width, high_mode) ^ key_bit_value(
            key,
            width - 1 - bit,
            width,
            high_mode,
        )
        select = (key >> bit) & 1
        bits.append(high if select else low)
    extra_bits = [0, 1, 2, width - 2, width - 1]
    bits.extend((key >> bit) & 1 for bit in extra_bits)
    return bits


def mux_coords_value(key, width, coord_mode="orig"):
    bits = mux_coord_bits_value(key, width, coord_mode)
    value = 0
    for bit, item in enumerate(bits):
        if item:
            value |= 1 << bit
    return value


def row_for_coords(coord_value, masks):
    row = 0
    for index, mask in enumerate(masks):
        if (mask & ~coord_value) == 0:
            row |= 1 << index
    return row


def solve_partial(rows, rhs_words, cols, output_width):
    basis = []
    inconsistent = 0
    for row, rhs in zip(rows, rhs_words):
        for pivot, basis_row, basis_rhs in basis:
            if (row >> pivot) & 1:
                row ^= basis_row
                rhs ^= basis_rhs
        if row == 0:
            inconsistent |= rhs
            continue
        pivot = row.bit_length() - 1
        reduced = []
        for old_pivot, old_row, old_rhs in basis:
            if (old_row >> pivot) & 1:
                old_row ^= row
                old_rhs ^= rhs
            reduced.append((old_pivot, old_row, old_rhs))
        reduced.append((pivot, row, rhs))
        reduced.sort(reverse=True)
        basis = reduced

    solutions = [0] * output_width
    for pivot, _row, rhs in basis:
        for bit in range(output_width):
            if ((inconsistent >> bit) & 1) == 0 and ((rhs >> bit) & 1):
                solutions[bit] |= 1 << pivot
    ok_bits = []
    for bit, solution in enumerate(solutions):
        if (inconsistent >> bit) & 1:
            continue
        good = True
        for row, expected in zip(rows, rhs_words):
            if (popcount(row & solution) & 1) != ((expected >> bit) & 1):
                good = False
                break
        if good:
            ok_bits.append(bit)
    return ok_bits, solutions, inconsistent


def key_bit_expr(bit, width, mode):
    if mode == "mod":
        return "key[{0}]".format(bit % width)
    if 0 <= bit < width:
        return "key[{0}]".format(bit)
    return "1'b0"


def coord_signal_lines(width, coord_mode="orig"):
    coord_width = width + 3 if coord_mode == "orig" else width + 5
    lines = ["  wire {0}mc;".format(range_decl(coord_width))]
    if coord_mode == "orig":
        coord_count = width - 2
        low_mode = "clamp"
        high_mode = "clamp"
    elif coord_mode == "full_mod":
        coord_count = width
        low_mode = "mod"
        high_mode = "mod"
    elif coord_mode in ("full_clamp", "full_clamp_simplified"):
        coord_count = width
        low_mode = "clamp"
        high_mode = "clamp"
    elif coord_mode == "full_wrap_low_zero_high":
        coord_count = width
        low_mode = "clamp"
        high_mode = "mod"
    else:
        raise RuntimeError("unknown coordinate mode: {0}".format(coord_mode))
    if coord_mode == "full_clamp_simplified":
        for bit in range(width - 1):
            lines.append(
                "  assign mc[{0}] = key[{0}] ? in[{1}] : in[{2}];".format(
                    bit,
                    width - 1 - bit,
                    bit + 1,
                )
            )
        lines.append("  assign mc[{0}] = key[{0}] & in[0];".format(width - 1))
    else:
        for bit in range(coord_count):
            high_a = key_bit_expr(width - 2 - bit, width, high_mode)
            high_b = key_bit_expr(width - 1 - bit, width, high_mode)
            low = key_bit_expr(bit + 1, width, low_mode)
            lines.append(
                "  assign mc[{0}] = key[{0}] ? ({1} ^ {2}) : {3};".format(
                    bit,
                    high_a,
                    high_b,
                    low,
                )
            )
    extras = [0, 1, 2, width - 2, width - 1]
    for offset, key_bit in enumerate(extras):
        if coord_mode == "full_clamp_simplified" and key_bit == 0:
            lines.append("  assign mc[{0}] = in[0];".format(coord_count + offset))
        else:
            lines.append("  assign mc[{0}] = key[{1}];".format(coord_count + offset, key_bit))
    return lines


def feature_signal(lines, cache, mask):
    if mask == 0:
        return "1'b1"
    if mask in cache:
        return cache[mask]
    name = "mf_{0:x}".format(mask)
    terms = ["mc[{0}]".format(bit) for bit in bitset_items(mask)]
    lines.append("  wire {0} = {1};".format(name, and_expr(terms)))
    cache[mask] = name
    return name


def eval_solution(coord_value, masks, solution):
    total = 0
    for index, mask in enumerate(masks):
        if ((solution >> index) & 1) and ((mask & ~coord_value) == 0):
            total ^= 1
    return total


def render(outputs, module, input_width, output_width, transform, degree, require_all, coord_mode="orig"):
    values = transformed_outputs(outputs, input_width, transform)
    coord_width = input_width + 3 if coord_mode == "orig" else input_width + 5
    masks = feature_masks(coord_width, degree)
    rows = []
    rhs_words = []
    for key, value in enumerate(values):
        coord_value = mux_coords_value(key, input_width, coord_mode)
        rows.append(row_for_coords(coord_value, masks))
        rhs_words.append(value)
    ok_bits, solutions, inconsistent = solve_partial(rows, rhs_words, len(masks), output_width)
    if require_all and len(ok_bits) != output_width:
        raise RuntimeError("degree {0} solved only bits {1}".format(degree, ok_bits))

    lines = [
        "module {0}(in, out);".format(module),
        "  input {0}in;".format(range_decl(input_width)),
        "  output {0}out;".format(range_decl(output_width)),
    ]
    lines.extend(key_lines_for_transform(transform, input_width))
    lines.extend(coord_signal_lines(input_width, coord_mode))

    feature_cache = {}
    used_features = set()
    for bit in ok_bits:
        for index in bitset_items(solutions[bit]):
            used_features.add(masks[index])
    for mask in sorted(used_features, key=lambda item: (popcount(item), item)):
        feature_signal(lines, feature_cache, mask)

    for bit in range(output_width):
        if bit not in ok_bits:
            lines.append("  assign out[{0}] = 1'b0;".format(bit))
            continue
        terms = [feature_signal(lines, feature_cache, masks[index]) for index in bitset_items(solutions[bit])]
        lines.append("  assign out[{0}] = {1};".format(bit, xor_expr(terms)))
    lines.append("endmodule")
    lines.append("")

    term_counts = [popcount(solutions[bit]) if bit in ok_bits else 0 for bit in range(output_width)]
    items = (
        "transform={0}; coord_mode={1}; degree={2}; coord_width={3}; features={4}; "
        "ok_bits={5}; inconsistent=0x{6:x}; used_features={7}; term_counts={8}"
    ).format(
        transform,
        coord_mode,
        degree,
        coord_width,
        len(masks),
        ":".join(str(bit) for bit in ok_bits),
        inconsistent,
        len(used_features),
        ":".join(str(count) for count in term_counts),
    )

    def model(index):
        key = transform_index(transform, index, input_width) if transform != "identity" else index
        coord_value = mux_coords_value(key, input_width, coord_mode)
        word = 0
        for bit in ok_bits:
            if eval_solution(coord_value, masks, solutions[bit]):
                word |= 1 << bit
        return word

    return "\n".join(lines), items, model, ok_bits


def reduction_xor_expr(indices):
    indices = tuple(sorted(set(indices)))
    if not indices:
        return "1'b0"
    if len(indices) == 1:
        return "mc[{0}]".format(indices[0])
    contiguous = indices == tuple(range(indices[0], indices[-1] + 1))
    if contiguous:
        if indices[0] == indices[-1]:
            return "mc[{0}]".format(indices[0])
        return "^mc[{0}:{1}]".format(indices[-1], indices[0])
    return "^{" + ", ".join("mc[{0}]".format(index) for index in reversed(indices)) + "}"


def render_balanced_prefix_lines(lines, coord_width):
    previous = ["mc[{0}]".format(bit) for bit in range(coord_width)]
    step = 1
    stage = 0
    while step < coord_width:
        current = []
        for bit in range(coord_width):
            if bit < step:
                current.append(previous[bit])
                continue
            name = "bp_{0}_{1}".format(stage, bit)
            lines.append("  wire {0} = {1} ^ {2};".format(name, previous[bit], previous[bit - step]))
            current.append(name)
        previous = current
        step <<= 1
        stage += 1
    return previous


def render_grouped(
    outputs,
    module,
    input_width,
    output_width,
    transform,
    degree,
    require_all,
    coord_mode="orig",
    xor_style="prefix",
    group_style="high",
):
    if degree != 2:
        raise RuntimeError("grouped emit currently supports degree 2 only")
    values = transformed_outputs(outputs, input_width, transform)
    coord_width = input_width + 3 if coord_mode == "orig" else input_width + 5
    masks = feature_masks(coord_width, degree)
    rows = []
    rhs_words = []
    for key, value in enumerate(values):
        coord_value = mux_coords_value(key, input_width, coord_mode)
        rows.append(row_for_coords(coord_value, masks))
        rhs_words.append(value)
    ok_bits, solutions, inconsistent = solve_partial(rows, rhs_words, len(masks), output_width)
    if require_all and len(ok_bits) != output_width:
        raise RuntimeError("degree {0} solved only bits {1}".format(degree, ok_bits))

    lines = [
        "module {0}(in, out);".format(module),
        "  input {0}in;".format(range_decl(input_width)),
        "  output {0}out;".format(range_decl(output_width)),
    ]
    lines.extend(key_lines_for_transform(transform, input_width))
    lines.extend(coord_signal_lines(input_width, coord_mode))

    prefix_names = []
    if xor_style == "prefix":
        for bit in range(coord_width):
            name = "px_{0}".format(bit)
            expr = "mc[0]" if bit == 0 else "px_{0} ^ mc[{1}]".format(bit - 1, bit)
            lines.append("  wire {0} = {1};".format(name, expr))
            prefix_names.append(name)
    elif xor_style == "balanced_prefix":
        prefix_names = render_balanced_prefix_lines(lines, coord_width)
    elif xor_style == "direct_reduce":
        prefix_names = []
    else:
        raise RuntimeError("unknown grouped xor style: {0}".format(xor_style))

    xor_cache = {}
    and_cache = {}

    def linear_xor_signal(indices):
        indices = tuple(sorted(set(indices)))
        if not indices:
            return "1'b0"
        if len(indices) == 1:
            return "mc[{0}]".format(indices[0])
        if xor_style == "direct_reduce":
            if indices not in xor_cache:
                name = "mx_{0}".format(len(xor_cache))
                lines.append("  wire {0} = {1};".format(name, reduction_xor_expr(indices)))
                xor_cache[indices] = name
            return xor_cache[indices]
        if indices[0] == 0 and indices[-1] == len(indices) - 1:
            return prefix_names[indices[-1]]
        contiguous = indices == tuple(range(indices[0], indices[-1] + 1))
        if contiguous and indices[0] > 0:
            key = ("range", indices[0], indices[-1])
            if key not in xor_cache:
                name = "mx_{0}".format(len(xor_cache))
                lines.append(
                    "  wire {0} = {1} ^ {2};".format(
                        name,
                        prefix_names[indices[-1]],
                        prefix_names[indices[0] - 1],
                    )
                )
                xor_cache[key] = name
            return xor_cache[key]
        if indices not in xor_cache:
            name = "mx_{0}".format(len(xor_cache))
            lines.append(
                "  wire {0} = {1};".format(
                    name,
                    xor_expr(["mc[{0}]".format(index) for index in indices]),
                )
            )
            xor_cache[indices] = name
        return xor_cache[indices]

    def grouped_and_signal(bit, indices):
        indices = tuple(sorted(set(indices)))
        if not indices:
            return "1'b0"
        key = (bit, indices)
        if key not in and_cache:
            name = "mg_{0}".format(len(and_cache))
            lines.append("  wire {0} = mc[{1}] & {2};".format(name, bit, linear_xor_signal(indices)))
            and_cache[key] = name
        return and_cache[key]

    orientation_counts = {"high": 0, "low": 0}
    out_terms = [[] for _ in range(output_width)]
    for bit in ok_bits:
        grouped_high = {}
        grouped_low = {}
        for index in bitset_items(solutions[bit]):
            mask = masks[index]
            term_bits = list(bitset_items(mask))
            if not term_bits:
                out_terms[bit].append("1'b1")
            elif len(term_bits) == 1:
                out_terms[bit].append("mc[{0}]".format(term_bits[0]))
            elif len(term_bits) == 2:
                low, high = term_bits
                grouped_high.setdefault(high, []).append(low)
                grouped_low.setdefault(low, []).append(high)
            else:
                raise RuntimeError("unexpected degree >2 term in grouped emit")
        if group_style == "high":
            selected = "high"
        elif group_style == "dual":
            selected = "low" if len(grouped_low) < len(grouped_high) else "high"
        else:
            raise RuntimeError("unknown group style: {0}".format(group_style))
        orientation_counts[selected] += 1
        if selected == "high":
            for high in sorted(grouped_high):
                out_terms[bit].append(grouped_and_signal(high, grouped_high[high]))
        else:
            for low in sorted(grouped_low):
                out_terms[bit].append(grouped_and_signal(low, grouped_low[low]))

    for bit in range(output_width):
        if bit not in ok_bits:
            lines.append("  assign out[{0}] = 1'b0;".format(bit))
        else:
            lines.append("  assign out[{0}] = {1};".format(bit, xor_expr(out_terms[bit])))
    lines.append("endmodule")
    lines.append("")

    term_counts = [popcount(solutions[bit]) if bit in ok_bits else 0 for bit in range(output_width)]
    items = (
        "transform={0}; coord_mode={1}; emit_style=grouped; xor_style={2}; group_style={3}; degree={4}; coord_width={5}; "
        "features={6}; ok_bits={7}; inconsistent=0x{8:x}; grouped_ands={9}; "
        "linear_xors={10}; group_orientations=high:{11}:low:{12}; term_counts={13}"
    ).format(
        transform,
        coord_mode,
        xor_style,
        group_style,
        degree,
        coord_width,
        len(masks),
        ":".join(str(bit) for bit in ok_bits),
        inconsistent,
        len(and_cache),
        len(xor_cache),
        orientation_counts["high"],
        orientation_counts["low"],
        ":".join(str(count) for count in term_counts),
    )

    def model(index):
        key = transform_index(transform, index, input_width) if transform != "identity" else index
        coord_value = mux_coords_value(key, input_width, coord_mode)
        word = 0
        for bit in ok_bits:
            if eval_solution(coord_value, masks, solutions[bit]):
                word |= 1 << bit
        return word

    return "\n".join(lines), items, model, ok_bits


def render_hybrid(outputs, module, input_width, output_width, transform, degree, order_mode, coord_mode="orig"):
    values = transformed_outputs(outputs, input_width, transform)
    terms_by_bit = anf_by_bit(values, input_width, output_width)
    coord_width = input_width + 3 if coord_mode == "orig" else input_width + 5
    masks = feature_masks(coord_width, degree)
    rows = []
    rhs_words = []
    for key, value in enumerate(values):
        coord_value = mux_coords_value(key, input_width, coord_mode)
        rows.append(row_for_coords(coord_value, masks))
        rhs_words.append(value)
    ok_bits, solutions, inconsistent = solve_partial(rows, rhs_words, len(masks), output_width)
    missing_bits = [bit for bit in range(output_width) if bit not in ok_bits]
    if not missing_bits:
        return render(
            outputs,
            module,
            input_width,
            output_width,
            transform,
            degree,
            require_all=True,
            coord_mode=coord_mode,
        )

    if order_mode == "endpoint":
        order = endpoint_order(input_width, reverse=False)
        order_name = "endpoint"
    elif order_mode == "endpoint_rev":
        order = endpoint_order(input_width, reverse=True)
        order_name = "endpoint_rev"
    elif order_mode == "best_node":
        order_name, order, _nodes, _depth = choose_order([terms_by_bit[bit] for bit in missing_bits], input_width, "node")
    elif order_mode == "best_depth":
        order_name, order, _nodes, _depth = choose_order([terms_by_bit[bit] for bit in missing_bits], input_width, "depth")
    else:
        raise RuntimeError("unknown hybrid order: {0}".format(order_mode))

    lines = [
        "module {0}(in, out);".format(module),
        "  input {0}in;".format(range_decl(input_width)),
        "  output {0}out;".format(range_decl(output_width)),
    ]
    lines.extend(key_lines_for_transform(transform, input_width))
    lines.extend(coord_signal_lines(input_width, coord_mode))

    feature_cache = {}
    used_features = set()
    for bit in ok_bits:
        for index in bitset_items(solutions[bit]):
            used_features.add(masks[index])
    for mask in sorted(used_features, key=lambda item: (popcount(item), item)):
        feature_signal(lines, feature_cache, mask)

    for bit in ok_bits:
        terms = [feature_signal(lines, feature_cache, masks[index]) for index in bitset_items(solutions[bit])]
        lines.append("  wire solved_{0} = {1};".format(bit, xor_expr(terms)))

    residual_signals = {}
    for bit in missing_bits:
        emitter = PrefixedDavioEmitter(lines, 100000, order, "rd{0}_".format(bit))
        residual_signals[bit] = emitter.emit(terms_by_bit[bit])

    for bit in range(output_width):
        if bit in residual_signals:
            lines.append("  assign out[{0}] = {1};".format(bit, residual_signals[bit]))
        else:
            lines.append("  assign out[{0}] = solved_{0};".format(bit))
    lines.append("endmodule")
    lines.append("")

    term_counts = [popcount(solutions[bit]) if bit in ok_bits else 0 for bit in range(output_width)]
    items = (
        "transform={0}; coord_mode={1}; hybrid_degree={2}; coord_width={3}; features={4}; "
        "ok_bits={5}; residual_bits={6}; residual_order={7}; inconsistent=0x{8:x}; "
        "used_features={9}; term_counts={10}; residual_terms={11}"
    ).format(
        transform,
        coord_mode,
        degree,
        coord_width,
        len(masks),
        ":".join(str(bit) for bit in ok_bits),
        ":".join(str(bit) for bit in missing_bits),
        order_name,
        inconsistent,
        len(used_features),
        ":".join(str(count) for count in term_counts),
        ":".join(str(len(terms_by_bit[bit])) for bit in missing_bits),
    )

    def model(index):
        key = transform_index(transform, index, input_width) if transform != "identity" else index
        coord_value = mux_coords_value(key, input_width, coord_mode)
        word = 0
        residual_word = eval_anf_word(terms_by_bit, key)
        for bit in range(output_width):
            if bit in residual_signals:
                if (residual_word >> bit) & 1:
                    word |= 1 << bit
            elif eval_solution(coord_value, masks, solutions[bit]):
                word |= 1 << bit
        return word

    return "\n".join(lines), items, model, ok_bits


def verify_outputs(outputs, model):
    for index, expected in enumerate(outputs):
        actual = model(index)
        if actual != expected:
            return False, "first mismatch index={0} expected=0x{1:x} actual=0x{2:x}".format(
                index,
                expected,
                actual,
            )
    return True, "exact mux-coordinate ANF model over {0} inputs".format(len(outputs))


def best_rows(rows):
    best = []
    for case in sorted(set(row["case"] for row in rows)):
        valid = [
            row
            for row in rows
            if row["case"] == case and row["equivalent"] == "1" and row["adp"]
        ]
        if valid:
            item = min(valid, key=lambda row: int(row["adp"]))
            best.append({name: item.get(name, "") for name in BEST_FIELDNAMES})
    return best


def run_case(args, case):
    truth_path = args.benchmarks / "{0}.truth".format(case)
    table = TruthTable(truth_path)
    outputs = list(table.iter_outputs())
    rows = []
    manifest = {
        "case": case,
        "truth": str(truth_path),
        "input_width": table.input_width,
        "output_width": table.output_width,
        "hypothesis": "unknown_muxcoord_anf",
        "variants": [],
    }
    for transform in args.transforms:
        for coord_mode in args.coord_modes:
            variant_prefix = transform if coord_mode == "orig" else "{0}_{1}".format(transform, coord_mode)
            for emit_style in args.emit_styles:
                styled_prefix = variant_prefix if emit_style == "flat" else "{0}_{1}".format(variant_prefix, emit_style)
                for degree in args.degrees:
                    variant = "{0}_deg{1}".format(styled_prefix, degree)
                    candidate_id = "{0}_unknown_muxcoord_anf_{1}".format(case, variant)
                    module = candidate_id
                    verilog_path = args.work_dir / case / "verilog" / "{0}.v".format(candidate_id)
                    aig_path = args.work_dir / case / "aigs" / "{0}.aig".format(candidate_id)
                    script_path = args.work_dir / case / "logs" / "{0}.ys".format(candidate_id)
                    log_path = args.work_dir / case / "logs" / "{0}.yosys.log".format(candidate_id)
                    start = time.time()
                    row = {
                        "case": case,
                        "candidate_id": candidate_id,
                        "hypothesis": "unknown_muxcoord_anf",
                        "variant": variant,
                        "verilog_path": str(verilog_path),
                        "aig_path": str(aig_path),
                        "verified_truth": "0",
                        "synthesized": "0",
                        "equivalent": "0",
                        "area": "",
                        "delay": "",
                        "adp": "",
                        "runtime_sec": "0.000",
                        "items": "",
                        "notes": "",
                    }
                    try:
                        if emit_style == "flat":
                            verilog, items, model, ok_bits = render(
                                outputs,
                                module,
                                table.input_width,
                                table.output_width,
                                transform,
                                degree,
                                require_all=not args.allow_partial,
                                coord_mode=coord_mode,
                            )
                        elif emit_style in ("grouped", "grouped_direct", "grouped_balanced", "grouped_dual"):
                            group_style = "high"
                            if emit_style in ("grouped", "grouped_dual"):
                                xor_style = "prefix"
                            elif emit_style == "grouped_direct":
                                xor_style = "direct_reduce"
                            else:
                                xor_style = "balanced_prefix"
                            if emit_style == "grouped_dual":
                                group_style = "dual"
                            verilog, items, model, ok_bits = render_grouped(
                                outputs,
                                module,
                                table.input_width,
                                table.output_width,
                                transform,
                                degree,
                                require_all=not args.allow_partial,
                                coord_mode=coord_mode,
                                xor_style=xor_style,
                                group_style=group_style,
                            )
                        else:
                            raise RuntimeError("unknown emit style: {0}".format(emit_style))
                        row["items"] = "{0}; hash={1}".format(items, text_hash(verilog)[:12])
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
                                use_abc=not args.no_yosys_abc,
                                script_out=script_path,
                            )
                            write_text(log_path, yosys_log)
                            row["synthesized"] = "1"
                            evaluated = evaluate_aig(
                                case=case,
                                candidate_id=candidate_id,
                                parent_id="unknown_muxcoord_anf",
                                source="ai_verilog",
                                tool_chain="yosys_unknown_muxcoord_anf",
                                aig_path=aig_path,
                                truth=truth_path,
                                abc=args.abc,
                                notes="unknown mux-coordinate ANF Verilog seed",
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
                    rows.append(row)
                    manifest["variants"].append(row)
                    print(
                        "{0} {1} verified={2} eq={3} area={4} delay={5} adp={6}".format(
                            case,
                            variant,
                            row["verified_truth"],
                            row["equivalent"],
                            row["area"],
                            row["delay"],
                            row["adp"],
                        ),
                        flush=True,
                    )
            for degree in args.hybrid_degrees:
                for order_mode in args.hybrid_orders:
                    variant = "{0}_deg{1}_hybrid_{2}".format(variant_prefix, degree, order_mode)
                    candidate_id = "{0}_unknown_muxcoord_anf_{1}".format(case, variant)
                    module = candidate_id
                    verilog_path = args.work_dir / case / "verilog" / "{0}.v".format(candidate_id)
                    aig_path = args.work_dir / case / "aigs" / "{0}.aig".format(candidate_id)
                    script_path = args.work_dir / case / "logs" / "{0}.ys".format(candidate_id)
                    log_path = args.work_dir / case / "logs" / "{0}.yosys.log".format(candidate_id)
                    start = time.time()
                    row = {
                        "case": case,
                        "candidate_id": candidate_id,
                        "hypothesis": "unknown_muxcoord_anf",
                        "variant": variant,
                        "verilog_path": str(verilog_path),
                        "aig_path": str(aig_path),
                        "verified_truth": "0",
                        "synthesized": "0",
                        "equivalent": "0",
                        "area": "",
                        "delay": "",
                        "adp": "",
                        "runtime_sec": "0.000",
                        "items": "",
                        "notes": "",
                    }
                    try:
                        verilog, items, model, ok_bits = render_hybrid(
                            outputs,
                            module,
                            table.input_width,
                            table.output_width,
                            transform,
                            degree,
                            order_mode,
                            coord_mode=coord_mode,
                        )
                        row["items"] = "{0}; hash={1}".format(items, text_hash(verilog)[:12])
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
                                use_abc=not args.no_yosys_abc,
                                script_out=script_path,
                            )
                            write_text(log_path, yosys_log)
                            row["synthesized"] = "1"
                            evaluated = evaluate_aig(
                                case=case,
                                candidate_id=candidate_id,
                                parent_id="unknown_muxcoord_anf",
                                source="ai_verilog",
                                tool_chain="yosys_unknown_muxcoord_anf",
                                aig_path=aig_path,
                                truth=truth_path,
                                abc=args.abc,
                                notes="unknown mux-coordinate ANF hybrid Verilog seed",
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
                    rows.append(row)
                    manifest["variants"].append(row)
                    print(
                        "{0} {1} verified={2} eq={3} area={4} delay={5} adp={6}".format(
                            case,
                            variant,
                            row["verified_truth"],
                            row["equivalent"],
                            row["area"],
                            row["delay"],
                            row["adp"],
                        ),
                        flush=True,
                    )
    write_text(args.work_dir / case / "manifest.json", json.dumps(manifest, indent=2, sort_keys=True) + "\n")
    return rows


def parse_degrees(text):
    return [int(item) for item in parse_list(text)]


def parse_args(argv=None):
    parser = argparse.ArgumentParser(description="Generate mux-coordinate ANF candidates.")
    parser.add_argument("--cases", type=parse_cases, required=True)
    parser.add_argument("--transforms", type=parse_list, default=parse_list("prefix_parity_reduce"))
    parser.add_argument("--coord-modes", type=parse_list, default=parse_list("orig"))
    parser.add_argument("--emit-styles", type=parse_list, default=parse_list("flat"))
    parser.add_argument("--degrees", type=parse_degrees, default=parse_degrees("3"))
    parser.add_argument("--hybrid-degrees", type=parse_degrees, default=[])
    parser.add_argument("--hybrid-orders", type=parse_list, default=parse_list("endpoint_rev"))
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--work-dir", type=Path, required=True)
    parser.add_argument("--results", type=Path, required=True)
    parser.add_argument("--best-results", type=Path, required=True)
    parser.add_argument("--summary-results", type=Path)
    parser.add_argument("--evaluate-check", type=Path)
    parser.add_argument("--reference", type=Path, default=ROOT / "reference_result.csv")
    parser.add_argument("--current-best", type=Path, default=ROOT / "student" / "results" / "current_best_by_case.csv")
    parser.add_argument("--abc", type=Path, default=ROOT / "student" / "abc")
    parser.add_argument("--yosys", type=Path, default=ROOT / "student" / "tools" / "conda-env" / "bin" / "yosys")
    parser.add_argument("--timeout", type=int, default=1800)
    parser.add_argument("--allow-partial", action="store_true")
    parser.add_argument("--no-yosys-abc", action="store_true")
    return parser.parse_args(argv)


def main(argv=None):
    args = parse_args(argv)
    rows = []
    for case in args.cases:
        rows.extend(run_case(args, case))
    write_csv(args.results, ALL_FIELDNAMES, rows)
    best = best_rows(rows)
    write_csv(args.best_results, BEST_FIELDNAMES, best)
    if args.summary_results:
        refs = load_reference(args.reference)
        current = load_current_best(args.current_best)
        write_csv(args.summary_results, SUMMARY_FIELDNAMES, [add_summary_columns(row, refs, current) for row in best])
    if args.evaluate_check:
        write_csv(
            args.evaluate_check,
            EVALUATE_FIELDNAMES,
            [{name: row.get(name, "") for name in EVALUATE_FIELDNAMES} for row in rows],
        )
    write_text(args.work_dir / "manifest.json", json.dumps(rows, indent=2, sort_keys=True) + "\n")
    print("Results: {0}".format(args.results))
    print("Best: {0}".format(args.best_results))
    print("Rows: {0}".format(len(rows)))
    print("Best cases: {0}/{1}".format(len(best), len(args.cases)))
    return 0 if len(best) == len(args.cases) else 1


if __name__ == "__main__":
    raise SystemExit(main())
