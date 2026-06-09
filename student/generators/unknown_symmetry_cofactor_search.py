#!/usr/bin/env python3
"""Cofactor/class-onehot source rewrite for pair-symmetry unknown cases."""

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
from student.frontends.yosys_synth import SynthError, synthesize_verilog
from student.generators.unknown_bdd_search import (
    SharedBddBuilder,
    permute_plane,
    plane_for_outputs,
)
from student.generators.unknown_symmetry_bdd import (
    key_outputs,
    order_by_name,
    parse_list,
    parse_pairs,
    verify_pair_symmetry,
)
from student.generators.unknown_verilog_search import (
    ALL_FIELDNAMES,
    BEST_FIELDNAMES,
    const_word,
    parse_cases,
    range_decl,
    text_hash,
    write_csv,
    write_text,
)


def prefixed_edge_expr(edge, prefix):
    node_id, inv = edge
    if node_id == 0:
        return "1'b1" if inv else "1'b0"
    name = "{0}n_{1}".format(prefix, node_id)
    return "~{0}".format(name) if inv else name


def outer_bits_for_order(width, pairs, order_name, outer_count):
    order = order_by_name(order_name, width, pairs)
    return order[:outer_count]


def parse_outer_bitsets(text):
    bitsets = []
    for item in text.split(","):
        item = item.strip()
        if not item:
            continue
        bits = tuple(int(part) for part in item.split(":") if part != "")
        if not bits:
            raise argparse.ArgumentTypeError("empty outer bitset item")
        if len(set(bits)) != len(bits):
            raise argparse.ArgumentTypeError("duplicate bit in outer bitset: {0}".format(item))
        bitsets.append(bits)
    return bitsets


def parse_int_list(text):
    values = []
    for item in text.split(","):
        item = item.strip()
        if item:
            values.append(int(item))
    return values


def popcount(value):
    return bin(value).count("1")


def bit_support(outputs, input_width, bit):
    support = []
    for var in range(input_width):
        mask = 1 << var
        depends = False
        for index, value in enumerate(outputs):
            if ((value >> bit) ^ (outputs[index ^ mask] >> bit)) & 1:
                depends = True
                break
        if depends:
            support.append(var)
    return support


def anf_coefficients_for_bit(outputs, input_width, bit, support):
    values = []
    for key in range(1 << len(support)):
        index = 0
        for pos, var in enumerate(support):
            if (key >> pos) & 1:
                index |= 1 << var
        values.append((outputs[index] >> bit) & 1)
    coeffs = values[:]
    for pos in range(len(support)):
        step = 1 << pos
        for mask in range(1 << len(support)):
            if mask & step:
                coeffs[mask] ^= coeffs[mask ^ step]
    return coeffs


def emit_anf_bit(lines, outputs, input_width, bit):
    support = bit_support(outputs, input_width, bit)
    coeffs = anf_coefficients_for_bit(outputs, input_width, bit, support)
    terms = []
    for mask, coeff in enumerate(coeffs):
        if not coeff:
            continue
        if mask == 0:
            terms.append("1'b1")
            continue
        factors = ["in[{0}]".format(support[pos]) for pos in range(len(support)) if (mask >> pos) & 1]
        terms.append("(" + " & ".join(factors) + ")")
    expr = "1'b0" if not terms else " ^ ".join(terms)
    lines.append("  wire anf_bit_{0} = {1};".format(bit, expr))
    return "bit{0}:support={1}:terms={2}".format(bit, ":".join(str(item) for item in support), len(terms))


def compact_values(projected, width, output_width, outer_bits, outer_value):
    inner_bits = [bit for bit in range(width) if bit not in outer_bits]
    values = []
    for inner_value in range(1 << len(inner_bits)):
        key = 0
        for pos, bit in enumerate(inner_bits):
            if (inner_value >> pos) & 1:
                key |= 1 << bit
        for pos, bit in enumerate(outer_bits):
            if (outer_value >> pos) & 1:
                key |= 1 << bit
        values.append(projected[key] & ((1 << output_width) - 1))
    return tuple(values), inner_bits


def build_group(values, inner_bits, output_width, full_order, skip_bits):
    order = [inner_bits.index(bit) for bit in full_order if bit in inner_bits]
    builder = SharedBddBuilder(order)
    roots = {}
    for bit in range(output_width):
        if bit in skip_bits:
            continue
        roots[bit] = builder.build(permute_plane(plane_for_outputs(values, bit), order), 0)
    return builder, roots


def build_groups_global(reps, inner_bits, output_width, full_order, skip_bits):
    order = [inner_bits.index(bit) for bit in full_order if bit in inner_bits]
    builder = SharedBddBuilder(order)
    groups = []
    for values in reps:
        roots = {}
        for bit in range(output_width):
            if bit in skip_bits:
                continue
            roots[bit] = builder.build(permute_plane(plane_for_outputs(values, bit), order), 0)
        groups.append((builder, roots))
    return groups


def emit_key(lines, width, pairs):
    assigned = set()
    lines.append("  wire {0}key;".format(range_decl(width)))
    for left, right in pairs:
        lines.append("  assign key[{0}] = in[{0}] | in[{1}];".format(left, right))
        lines.append("  assign key[{0}] = in[{1}] & in[{0}];".format(right, left))
        assigned.add(left)
        assigned.add(right)
    for bit in range(width):
        if bit not in assigned:
            lines.append("  assign key[{0}] = in[{0}];".format(bit))


def outer_key_expr(outer_bits):
    if len(outer_bits) == 1:
        return "key[{0}]".format(outer_bits[0])
    return "{" + ", ".join("key[{0}]".format(bit) for bit in reversed(outer_bits)) + "}"


def emit_group(lines, name, builder, roots, inner_bits, output_width):
    lines.append("  wire {0}{1};".format(range_decl(output_width), name))
    for node in builder.nodes:
        lines.append(
            "  wire {0}n_{1} = key[{2}] ? {3} : {4};".format(
                name + "_",
                node["id"],
                inner_bits[node["var"]],
                prefixed_edge_expr(node["high"], name + "_"),
                prefixed_edge_expr(node["low"], name + "_"),
            )
        )
    for bit, root in sorted(roots.items()):
        lines.append("  assign {0}[{1}] = {2};".format(name, bit, prefixed_edge_expr(root, name + "_")))


def emit_key_bdd_bits(lines, builder, roots):
    prefix = "kb_"
    for node in builder.nodes:
        lines.append(
            "  wire {0}n_{1} = key[{2}] ? {3} : {4};".format(
                prefix,
                node["id"],
                node["var"],
                prefixed_edge_expr(node["high"], prefix),
                prefixed_edge_expr(node["low"], prefix),
            )
        )
    for bit, root in sorted(roots.items()):
        lines.append("  wire key_bdd_bit_{0} = {1};".format(bit, prefixed_edge_expr(root, prefix)))


def emit_global_groups(lines, groups, inner_bits, output_width):
    if not groups:
        return
    builder = groups[0][0]
    prefix = "gb_"
    for node in builder.nodes:
        lines.append(
            "  wire {0}n_{1} = key[{2}] ? {3} : {4};".format(
                prefix,
                node["id"],
                inner_bits[node["var"]],
                prefixed_edge_expr(node["high"], prefix),
                prefixed_edge_expr(node["low"], prefix),
            )
        )
    for index, (_builder, roots) in enumerate(groups):
        name = "g_{0}".format(index)
        lines.append("  wire {0}{1};".format(range_decl(output_width), name))
        for bit, root in sorted(roots.items()):
            lines.append("  assign {0}[{1}] = {2};".format(name, bit, prefixed_edge_expr(root, prefix)))


def emit_classonehot(lines, output_width, outer_count, rep_by_outer, reps, skip_bits):
    lines.append("  wire {0}outer_key = {1};".format(range_decl(outer_count), outer_key_expr(rep_by_outer["outer_bits"])))
    for rep_index in range(len(reps)):
        matches = [
            "(outer_key == {0})".format(const_word(outer_count, outer_value))
            for outer_value, outer_rep in enumerate(rep_by_outer["reps"])
            if outer_rep == rep_index
        ]
        expr = " | ".join(matches) if matches else "1'b0"
        lines.append("  wire cls_{0} = {1};".format(rep_index, expr))
    for bit in range(output_width):
        if bit in skip_bits:
            continue
        terms = ["(cls_{0} & g_{0}[{1}])".format(rep_index, bit) for rep_index in range(len(reps))]
        lines.append("  assign out[{0}] = {1};".format(bit, " | ".join(terms) if terms else "1'b0"))


def emit_classcase(lines, output_width, outer_count, rep_by_outer, reps, skip_bits):
    lines.append("  wire {0}outer_key = {1};".format(range_decl(outer_count), outer_key_expr(rep_by_outer["outer_bits"])))
    lines.append("  reg {0}out_mux;".format(range_decl(output_width)))
    lines.append("  always @* begin")
    lines.append("    out_mux = {0};".format("{0}'b0".format(output_width)))
    lines.append("    case (outer_key)")
    for outer_value, rep_index in enumerate(rep_by_outer["reps"]):
        lines.append("      {0}: out_mux = g_{1};".format(const_word(outer_count, outer_value), rep_index))
    lines.append("      default: begin end")
    lines.append("    endcase")
    lines.append("  end")
    for bit in range(output_width):
        if bit in skip_bits:
            continue
        lines.append("  assign out[{0}] = out_mux[{0}];".format(bit))


def tree_mux_expr(outer_count, rep_by_outer, reps, lo, hi):
    if hi - lo == 1:
        return "g_{0}".format(rep_by_outer["reps"][lo])
    mid = (lo + hi) // 2
    bit = (hi - lo).bit_length() - 2
    low_expr = tree_mux_expr(outer_count, rep_by_outer, reps, lo, mid)
    high_expr = tree_mux_expr(outer_count, rep_by_outer, reps, mid, hi)
    if low_expr == high_expr:
        return low_expr
    return "(outer_key[{0}] ? {1} : {2})".format(bit, high_expr, low_expr)


def emit_classtree(lines, output_width, outer_count, rep_by_outer, reps, skip_bits):
    lines.append("  wire {0}outer_key = {1};".format(range_decl(outer_count), outer_key_expr(rep_by_outer["outer_bits"])))
    lines.append("  wire {0}out_mux = {1};".format(
        range_decl(output_width),
        tree_mux_expr(outer_count, rep_by_outer, reps, 0, 1 << outer_count),
    ))
    for bit in range(output_width):
        if bit in skip_bits:
            continue
        lines.append("  assign out[{0}] = out_mux[{0}];".format(bit))


def count_sum_expr(prefix, bits, width):
    if not bits:
        return "{0}'d0".format(width)
    terms = ["{{{{{0}{{1'b0}}}}, {1}[{2}]}}".format(width - 1, prefix, bit) for bit in bits]
    return " + ".join(terms)


def emit_popcount_repair(lines, input_width, output_width, repair_bits):
    if not repair_bits:
        return
    if len(repair_bits) != 1:
        raise RuntimeError("popcount repair supports exactly one repaired bit")
    repair_bit = next(iter(repair_bits))
    count_width = input_width.bit_length() + 1
    known_bits = [bit for bit in range(output_width) if bit != repair_bit]
    lines.append("  wire [{0}:0] in_popcount = {1};".format(count_width - 1, count_sum_expr("in", range(input_width), count_width)))
    lines.append("  wire [{0}:0] known_out_popcount = {1};".format(count_width - 1, count_sum_expr("out", known_bits, count_width)))
    lines.append("  assign out[{0}] = (in_popcount == (known_out_popcount + {1}'d1));".format(repair_bit, count_width))


def emit_parity_repair(lines, input_width, output_width, repair_bits):
    for repair_bit in sorted(repair_bits):
        known_bits = [bit for bit in range(output_width) if bit != repair_bit]
        known_expr = " ^ ".join("out[{0}]".format(bit) for bit in known_bits)
        if not known_expr:
            known_expr = "1'b0"
        lines.append("  assign out[{0}] = (^in) ^ ({1});".format(repair_bit, known_expr))


def render(outputs, module, input_width, output_width, pairs, order_name, policy, outer_count, explicit_outer_bits=None, anf_bits=None, key_bdd_bits=None, mux_style="onehot", bdd_share_style="group", popcount_repair_bits=None, parity_repair_bits=None):
    anf_bits = set(anf_bits or [])
    key_bdd_bits = set(key_bdd_bits or [])
    popcount_repair_bits = set(popcount_repair_bits or [])
    parity_repair_bits = set(parity_repair_bits or [])
    if len(parity_repair_bits) > 1:
        raise RuntimeError("parity repair supports exactly one repaired bit")
    repair_sets = [anf_bits, key_bdd_bits, popcount_repair_bits, parity_repair_bits]
    for left_index, left in enumerate(repair_sets):
        for right in repair_sets[left_index + 1 :]:
            if left & right:
                raise RuntimeError("same output bit cannot use more than one repair style")
    skip_bits = anf_bits | key_bdd_bits | popcount_repair_bits | parity_repair_bits
    full_order = order_by_name(order_name, input_width, pairs)
    outer_bits = list(explicit_outer_bits) if explicit_outer_bits is not None else outer_bits_for_order(input_width, pairs, order_name, outer_count)
    outer_count = len(outer_bits)
    projected = key_outputs(outputs, input_width, output_width, pairs, policy)
    reps = []
    rep_index_by_values = {}
    rep_by_outer = []
    inner_bits = None
    for outer_value in range(1 << outer_count):
        values, current_inner_bits = compact_values(projected, input_width, output_width, outer_bits, outer_value)
        if inner_bits is None:
            inner_bits = current_inner_bits
        rep_index = rep_index_by_values.get(values)
        if rep_index is None:
            rep_index = len(reps)
            rep_index_by_values[values] = rep_index
            reps.append(values)
        rep_by_outer.append(rep_index)

    if bdd_share_style == "group":
        groups = [build_group(values, inner_bits, output_width, full_order, skip_bits) for values in reps]
    elif bdd_share_style == "global":
        groups = build_groups_global(reps, inner_bits, output_width, full_order, skip_bits)
    else:
        raise RuntimeError("unknown BDD share style: {0}".format(bdd_share_style))
    lines = [
        "module {0}(in, out);".format(module),
        "  input {0}in;".format(range_decl(input_width)),
        "  output {0}out;".format(range_decl(output_width)),
    ]
    emit_key(lines, input_width, pairs)
    anf_items = []
    for bit in sorted(anf_bits):
        anf_items.append(emit_anf_bit(lines, outputs, input_width, bit))
    key_bdd_builder = SharedBddBuilder(full_order)
    key_bdd_roots = {}
    for bit in sorted(key_bdd_bits):
        key_bdd_roots[bit] = key_bdd_builder.build(permute_plane(plane_for_outputs(projected, bit), full_order), 0)
    if key_bdd_bits:
        emit_key_bdd_bits(lines, key_bdd_builder, key_bdd_roots)
    if bdd_share_style == "group":
        for rep_index, (builder, roots) in enumerate(groups):
            emit_group(lines, "g_{0}".format(rep_index), builder, roots, inner_bits, output_width)
    else:
        emit_global_groups(lines, groups, inner_bits, output_width)
    if mux_style == "onehot":
        emit_classonehot(
            lines,
            output_width,
            outer_count,
            {"outer_bits": outer_bits, "reps": rep_by_outer},
            reps,
            skip_bits,
        )
    elif mux_style == "case":
        emit_classcase(
            lines,
            output_width,
            outer_count,
            {"outer_bits": outer_bits, "reps": rep_by_outer},
            reps,
            skip_bits,
        )
    elif mux_style == "tree":
        emit_classtree(
            lines,
            output_width,
            outer_count,
            {"outer_bits": outer_bits, "reps": rep_by_outer},
            reps,
            skip_bits,
        )
    else:
        raise RuntimeError("unknown mux style: {0}".format(mux_style))
    for bit in sorted(anf_bits):
        lines.append("  assign out[{0}] = anf_bit_{0};".format(bit))
    for bit in sorted(key_bdd_bits):
        lines.append("  assign out[{0}] = key_bdd_bit_{0};".format(bit))
    emit_popcount_repair(lines, input_width, output_width, popcount_repair_bits)
    emit_parity_repair(lines, input_width, output_width, parity_repair_bits)
    lines.append("endmodule")
    lines.append("")

    def model(index):
        key = 0
        for left, right in pairs:
            lb = (index >> left) & 1
            rb = (index >> right) & 1
            if lb | rb:
                key |= 1 << left
            if lb & rb:
                key |= 1 << right
        for bit in range(input_width):
            if any(bit in pair for pair in pairs):
                continue
            if (index >> bit) & 1:
                key |= 1 << bit
        outer_value = 0
        for pos, bit in enumerate(outer_bits):
            if (key >> bit) & 1:
                outer_value |= 1 << pos
        inner_value = 0
        for pos, bit in enumerate(inner_bits):
            if (key >> bit) & 1:
                inner_value |= 1 << pos
        rep_index = rep_by_outer[outer_value]
        builder, roots = groups[rep_index]
        value = 0
        memo = {}
        for bit in range(output_width):
            if bit in anf_bits:
                bit_value = (outputs[index] >> bit) & 1
            elif bit in key_bdd_bits:
                bit_value = key_bdd_builder.eval_edge(key_bdd_roots[bit], key, {})
            elif bit in popcount_repair_bits:
                continue
            elif bit in parity_repair_bits:
                continue
            else:
                bit_value = builder.eval_edge(roots[bit], inner_value, memo)
            if bit_value:
                value |= 1 << bit
        for bit in popcount_repair_bits:
            if popcount(index) == popcount(value) + 1:
                value |= 1 << bit
        input_parity = popcount(index) & 1
        for bit in sorted(parity_repair_bits):
            if (input_parity ^ (popcount(value) & 1)) != 0:
                value |= 1 << bit
        return value

    key_bdd_items = "bits={0}:nodes={1}".format(
        ":".join(str(bit) for bit in sorted(key_bdd_bits)),
        len(key_bdd_builder.nodes),
    )
    items = "pairs={0}; order={1}; policy={2}; mux_style={3}; bdd_share={4}; outer_bits={5}; inner_bits={6}; classes={7}; group_nodes={8}; total_group_nodes={9}; anf_bits={10}; key_bdd_bits={11}; popcount_repair_bits={12}; parity_repair_bits={13}".format(
        ",".join("{0}:{1}".format(a, b) for a, b in pairs),
        order_name,
        policy,
        mux_style,
        bdd_share_style,
        ":".join(str(bit) for bit in outer_bits),
        ":".join(str(bit) for bit in inner_bits),
        len(reps),
        ":".join(str(len(builder.nodes)) for builder, _roots in groups),
        sum(len(builder.nodes) for builder, _roots in groups),
        "; ".join(anf_items),
        key_bdd_items,
        ":".join(str(bit) for bit in sorted(popcount_repair_bits)),
        ":".join(str(bit) for bit in sorted(parity_repair_bits)),
    )
    return "\n".join(lines), items, model


def verify_outputs(outputs, model):
    for index, expected in enumerate(outputs):
        actual = model(index)
        if actual != expected:
            return False, "first mismatch index={0} expected=0x{1:x} actual=0x{2:x}".format(index, expected, actual)
    return True, "exact symmetry cofactor class-onehot model over {0} inputs".format(len(outputs))


def best_rows(rows):
    best = []
    for case in sorted(set(row["case"] for row in rows)):
        valid = [row for row in rows if row["case"] == case and row["equivalent"] == "1" and row["adp"]]
        if valid:
            item = min(valid, key=lambda row: int(row["adp"]))
            best.append({name: item.get(name, "") for name in BEST_FIELDNAMES})
    return best


def run_case(args, case):
    truth_path = args.benchmarks / "{0}.truth".format(case)
    table = TruthTable(truth_path)
    outputs = list(table.iter_outputs())
    ok, note = verify_pair_symmetry(outputs, table.input_width, args.pairs)
    if not ok and args.require_symmetry:
        raise RuntimeError("{0}: {1}".format(case, note))
    rows = []
    manifest = {
        "case": case,
        "truth": str(truth_path),
        "input_width": table.input_width,
        "output_width": table.output_width,
        "hypothesis": "unknown_symmetry_cofactor_classonehot",
        "variants": [],
    }
    for order_name in args.orders:
        for policy in args.invalid_policies:
            outer_specs = [(None, outer_count) for outer_count in args.outer_counts]
            outer_specs.extend((bits, len(bits)) for bits in args.outer_bitsets)
            for explicit_outer_bits, outer_count in outer_specs:
                for mux_style in args.mux_styles:
                    for bdd_share_style in args.bdd_share_styles:
                        if explicit_outer_bits is None:
                            variant = "{0}_{1}_k{2}_{3}_{4}".format(order_name, policy, outer_count, mux_style, bdd_share_style)
                        else:
                            variant = "{0}_{1}_bits_{2}_{3}_{4}".format(
                                order_name,
                                policy,
                                "_".join(str(bit) for bit in explicit_outer_bits),
                                mux_style,
                                bdd_share_style,
                            )
                        if args.popcount_repair_bits:
                            variant = "{0}_pcrepair_{1}".format(
                                variant,
                                "_".join(str(bit) for bit in args.popcount_repair_bits),
                            )
                        if args.key_bdd_bits:
                            variant = "{0}_keybdd_{1}".format(
                                variant,
                                "_".join(str(bit) for bit in args.key_bdd_bits),
                            )
                        if args.parity_repair_bits:
                            variant = "{0}_parrepair_{1}".format(
                                variant,
                                "_".join(str(bit) for bit in args.parity_repair_bits),
                            )
                        candidate_id = "{0}_unknown_symcof_{1}".format(case, variant)
                        verilog_path = args.work_dir / case / "verilog" / "{0}.v".format(candidate_id)
                        aig_path = args.work_dir / case / "aigs" / "{0}.aig".format(candidate_id)
                        script_path = args.work_dir / case / "logs" / "{0}.ys".format(candidate_id)
                        log_path = args.work_dir / case / "logs" / "{0}.yosys.log".format(candidate_id)
                        start = time.time()
                        row = {
                            "case": case,
                            "candidate_id": candidate_id,
                            "hypothesis": "unknown_symmetry_cofactor_classonehot",
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
                            "notes": note,
                        }
                        try:
                            verilog, items, model = render(
                                outputs,
                                candidate_id,
                                table.input_width,
                                table.output_width,
                                args.pairs,
                                order_name,
                                policy,
                                outer_count,
                                explicit_outer_bits=explicit_outer_bits,
                                anf_bits=args.anf_bits,
                                key_bdd_bits=args.key_bdd_bits,
                                mux_style=mux_style,
                                bdd_share_style=bdd_share_style,
                                popcount_repair_bits=args.popcount_repair_bits,
                                parity_repair_bits=args.parity_repair_bits,
                            )
                            row["items"] = "{0}; hash={1}".format(items, text_hash(verilog)[:12])
                            verified, verify_note = verify_outputs(outputs, model)
                            row["verified_truth"] = "1" if verified else "0"
                            row["notes"] = verify_note
                            write_text(verilog_path, verilog)
                            if verified:
                                yosys_log = synthesize_verilog(
                                    verilog=verilog_path,
                                    module=candidate_id,
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
                                    parent_id="unknown_symmetry_cofactor_classonehot",
                                    source="ai_verilog",
                                    tool_chain="yosys_unknown_symmetry_cofactor_classonehot",
                                    aig_path=aig_path,
                                    truth=truth_path,
                                    abc=args.abc,
                                    notes="unknown symmetry cofactor class-onehot Verilog seed",
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


def parse_outer_counts(text):
    counts = []
    for item in text.split(","):
        item = item.strip()
        if item:
            counts.append(int(item))
    if not counts:
        raise argparse.ArgumentTypeError("empty outer-count list")
    return counts


def parse_args(argv=None):
    parser = argparse.ArgumentParser(description="Generate symmetry cofactor class-onehot candidates.")
    parser.add_argument("--cases", type=parse_cases, required=True)
    parser.add_argument("--pairs", type=parse_pairs, default=parse_pairs("4:5"))
    parser.add_argument("--orders", type=parse_list, default=parse_list("interleave"))
    parser.add_argument("--invalid-policies", type=parse_list, default=parse_list("f10,f00"))
    parser.add_argument("--outer-counts", type=parse_outer_counts, default=parse_outer_counts("2,3,4"))
    parser.add_argument("--outer-bitsets", type=parse_outer_bitsets, default=[])
    parser.add_argument("--anf-bits", type=parse_int_list, default=[])
    parser.add_argument("--key-bdd-bits", type=parse_int_list, default=[])
    parser.add_argument("--popcount-repair-bits", type=parse_int_list, default=[])
    parser.add_argument("--parity-repair-bits", type=parse_int_list, default=[])
    parser.add_argument("--mux-styles", type=parse_list, default=parse_list("onehot"))
    parser.add_argument("--bdd-share-styles", type=parse_list, default=parse_list("group"))
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--work-dir", type=Path, required=True)
    parser.add_argument("--results", type=Path, required=True)
    parser.add_argument("--best-results", type=Path, required=True)
    parser.add_argument("--summary-results", type=Path, required=True)
    parser.add_argument("--evaluate-check", type=Path, required=True)
    parser.add_argument("--yosys", type=Path, default=ROOT / "student" / "tools" / "conda-env" / "bin" / "yosys")
    parser.add_argument("--abc", type=Path, default=ROOT / "student" / "abc")
    parser.add_argument("--timeout", type=int, default=900)
    parser.add_argument("--no-yosys-abc", action="store_true")
    parser.add_argument("--require-symmetry", action="store_true", default=True)
    return parser.parse_args(argv)


def main(argv=None):
    args = parse_args(argv)
    rows = []
    for case in args.cases:
        rows.extend(run_case(args, case))
    write_csv(args.results, ALL_FIELDNAMES, rows)
    best = best_rows(rows)
    write_csv(args.best_results, BEST_FIELDNAMES, best)
    summary = []
    for case in args.cases:
        case_rows = [row for row in rows if row["case"] == case]
        valid = [row for row in case_rows if row["equivalent"] == "1" and row["adp"]]
        best_adp = min((int(row["adp"]) for row in valid), default=None)
        summary.append(
            {
                "case": case,
                "rows": len(case_rows),
                "verified": sum(1 for row in case_rows if row["verified_truth"] == "1"),
                "equivalent": sum(1 for row in case_rows if row["equivalent"] == "1"),
                "best_adp": "" if best_adp is None else str(best_adp),
            }
        )
    write_csv(args.summary_results, ["case", "rows", "verified", "equivalent", "best_adp"], summary)
    write_csv(
        args.evaluate_check,
        ["case", "candidate_id", "equivalent", "area", "delay", "adp", "notes"],
        [
            {
                "case": row["case"],
                "candidate_id": row["candidate_id"],
                "equivalent": row["equivalent"],
                "area": row["area"],
                "delay": row["delay"],
                "adp": row["adp"],
                "notes": row["notes"],
            }
            for row in rows
        ],
    )
    print("Results: {0}".format(args.results))
    print("Best: {0}".format(args.best_results))
    print("Rows: {0}".format(len(rows)))
    print("Best cases: {0}/{1}".format(len(best), len(args.cases)))
    return 0 if best else 1


if __name__ == "__main__":
    raise SystemExit(main())
