#!/usr/bin/env python3
"""Generate prefix-key cofactor BDDs with equivalent outer states shared."""

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
from student.generators.unknown_algebraic_search import key_lines_for_transform, transform_index
from student.generators.unknown_bdd_key_cofactor_search import (
    emit_group,
    interleave_order,
    key_vector_expr,
    parse_list,
    parse_variants,
    transformed_outputs,
)
from student.generators.unknown_key_ac_decomp_search import (
    EVALUATE_FIELDNAMES,
    SUMMARY_FIELDNAMES,
    add_summary_columns,
    assign_classes,
    load_current_best,
    load_reference,
    signatures_for_partition,
    variant_bits,
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


def order_for_style(width, style):
    if style.startswith("bits_"):
        order = [int(part) for part in style[5:].split("_") if part != ""]
        if len(set(order)) != len(order):
            raise RuntimeError("duplicate bits in inner order style: {0}".format(style))
        if any(bit < 0 or bit >= width for bit in order):
            raise RuntimeError("bit outside width {0} in inner order style: {1}".format(width, style))
        return order
    if style == "endpoint":
        return interleave_order(width)
    if style == "endpoint_rev":
        order = []
        for index in range((width + 1) // 2):
            pair = (width - 1 - index, index)
            for bit in pair:
                if bit not in order:
                    order.append(bit)
        return order
    if style == "natural":
        return list(range(width))
    if style == "reverse":
        return list(reversed(range(width)))
    raise RuntimeError("unknown inner order style: {0}".format(style))


def popcount(value):
    return bin(value).count("1")


def covered_values(term, width):
    mask, bits = term
    return [value for value in range(1 << width) if (value & mask) == bits]


def minimized_sop_terms(values, width):
    onset = set(values)
    terms = set(((1 << width) - 1, value) for value in values)
    changed = True
    while changed:
        changed = False
        new_terms = set(terms)
        items = list(terms)
        for left_index, left in enumerate(items):
            left_mask, left_bits = left
            for right in items[left_index + 1 :]:
                right_mask, right_bits = right
                if left_mask != right_mask:
                    continue
                diff = (left_bits ^ right_bits) & left_mask
                if popcount(diff) != 1:
                    continue
                merged = (left_mask ^ diff, left_bits & (left_mask ^ diff))
                if all(value in onset for value in covered_values(merged, width)):
                    if merged not in new_terms:
                        new_terms.add(merged)
                        changed = True
        terms = new_terms
    prime_terms = sorted(
        terms,
        key=lambda term: (popcount(term[0]), term[0], term[1]),
    )
    covers = []
    for term in prime_terms:
        covered = set(value for value in covered_values(term, width) if value in onset)
        if covered:
            covers.append((term, covered))
    if len(covers) > 20:
        return sorted(((1 << width) - 1, value) for value in values)
    best = None
    for selector in range(1, 1 << len(covers)):
        covered = set()
        chosen = []
        literal_count = 0
        for index, item in enumerate(covers):
            if (selector >> index) & 1:
                term, term_cover = item
                chosen.append(term)
                covered.update(term_cover)
                literal_count += popcount(term[0])
        if covered == onset:
            score = (len(chosen), literal_count, chosen)
            if best is None or score < best:
                best = score
    if best is None:
        raise RuntimeError("failed to minimize class selector for {0}".format(values))
    return best[2]


def sop_term_expr(term):
    mask, bits = term
    literals = []
    bit = 0
    while bit <= mask.bit_length():
        if (mask >> bit) & 1:
            literal = "outer_key[{0}]".format(bit)
            if not ((bits >> bit) & 1):
                literal = "~{0}".format(literal)
            literals.append(literal)
        bit += 1
    if not literals:
        return "1'b1"
    if len(literals) == 1:
        return literals[0]
    return "(" + " & ".join(literals) + ")"


def sop_expr(values, width):
    terms = minimized_sop_terms(values, width)
    exprs = [sop_term_expr(term) for term in terms]
    if len(exprs) == 1:
        return exprs[0]
    return "(" + " | ".join(exprs) + ")"


def emit_class_key_case(lines, outer_count, rep_by_outer, unique_reps):
    if outer_count == 1:
        lines.append("  reg class_key;")
    else:
        lines.append("  reg {0}class_key;".format(range_decl(outer_count)))
    lines.append("  always @* begin")
    lines.append("    case (outer_key)")
    for outer_value, rep in enumerate(rep_by_outer):
        lines.append("      {0}'d{1}: class_key = {0}'d{2};".format(outer_count, outer_value, rep))
    lines.append("      default: class_key = {0}'d{1};".format(outer_count, unique_reps[0]))
    lines.append("    endcase")
    lines.append("  end")


def emit_class_key_bits(lines, outer_count, rep_by_outer):
    if outer_count == 1:
        lines.append("  wire class_key;")
    else:
        lines.append("  wire {0}class_key;".format(range_decl(outer_count)))
    for bit in range(outer_count):
        values = [outer_value for outer_value, rep in enumerate(rep_by_outer) if (rep >> bit) & 1]
        lines.append("  assign class_key[{0}] = {1};".format(bit, sop_expr(values, outer_count)))


def top6_rule_canon(value):
    out = value

    def bit(index):
        return (value >> index) & 1

    if bit(2) and bit(0) and not bit(5) and not bit(4) and not bit(3):
        out &= ~(1 << 2)
    if bit(1) and bit(3) and not bit(0):
        out &= ~(1 << 1)
    if bit(5) and bit(3) and not bit(2) and not (bit(0) and bit(1)):
        out &= ~(1 << 3)
    if bit(5) and bit(3) and not bit(2) and bit(0) and not bit(1):
        out |= 1 << 1
    return out


def emit_class_key_top6_rules(lines, outer_count, rep_by_outer):
    expected = [top6_rule_canon(value) for value in range(1 << outer_count)]
    if outer_count != 6 or expected != rep_by_outer:
        raise RuntimeError("top6 rule canonicalization does not match class map")
    lines.append("  reg {0}class_key;".format(range_decl(outer_count)))
    lines.append("  always @* begin")
    lines.append("    class_key = outer_key;")
    lines.append("    if (outer_key[2] & outer_key[0] & ~outer_key[5] & ~outer_key[4] & ~outer_key[3])")
    lines.append("      class_key[2] = 1'b0;")
    lines.append("    if (outer_key[1] & outer_key[3] & ~outer_key[0])")
    lines.append("      class_key[1] = 1'b0;")
    lines.append("    if (outer_key[5] & outer_key[3] & ~outer_key[2] & ~(outer_key[0] & outer_key[1]))")
    lines.append("      class_key[3] = 1'b0;")
    lines.append("    if (outer_key[5] & outer_key[3] & ~outer_key[2] & outer_key[0] & ~outer_key[1])")
    lines.append("      class_key[1] = 1'b1;")
    lines.append("  end")


def emit_class_key_case_mux(lines, output_width, outer_count, unique_reps):
    lines.append("  reg {0}out_r;".format(range_decl(output_width)))
    lines.append("  always @* begin")
    lines.append("    case (class_key)")
    for rep in unique_reps:
        lines.append("      {0}'d{1}: out_r = g_{1};".format(outer_count, rep))
    lines.append("      default: out_r = g_{0};".format(unique_reps[0]))
    lines.append("    endcase")
    lines.append("  end")
    lines.append("  assign out = out_r;")


def emit_class_key_onehot_mux(lines, output_width, outer_count, unique_reps):
    for rep in unique_reps:
        lines.append("  wire sel_g_{0} = class_key == {1}'d{0};".format(rep, outer_count))
    for bit in range(output_width):
        terms = [
            "(sel_g_{0} & g_{0}[{1}])".format(rep, bit)
            for rep in unique_reps
        ]
        lines.append("  assign out[{0}] = {1};".format(bit, " | ".join(terms)))


def or_tree(lines, terms, prefix):
    if not terms:
        return "1'b0"
    if len(terms) == 1:
        return terms[0]
    signals = list(terms)
    level = 0
    while len(signals) > 1:
        next_signals = []
        for index in range(0, len(signals), 2):
            if index + 1 >= len(signals):
                next_signals.append(signals[index])
                continue
            name = "{0}_or_l{1}_{2}".format(prefix, level, index // 2)
            lines.append("  wire {0} = {1} | {2};".format(name, signals[index], signals[index + 1]))
            next_signals.append(name)
        signals = next_signals
        level += 1
    return signals[0]


def emit_classonehot(lines, output_width, outer_count, rep_by_outer, unique_reps, tree):
    values_by_rep = {}
    for outer_value, rep in enumerate(rep_by_outer):
        values_by_rep.setdefault(rep, []).append(outer_value)
    for rep in unique_reps:
        terms = [
            "(outer_key == {0}'d{1})".format(outer_count, outer_value)
            for outer_value in values_by_rep[rep]
        ]
        if tree:
            lines.append("  wire sel_g_{0} = {1};".format(rep, or_tree(lines, terms, "sel_g_{0}".format(rep))))
        else:
            lines.append("  wire sel_g_{0} = {1};".format(rep, " | ".join(terms)))
    for bit in range(output_width):
        terms = [
            "(sel_g_{0} & g_{0}[{1}])".format(rep, bit)
            for rep in unique_reps
        ]
        if tree:
            lines.append("  assign out[{0}] = {1};".format(bit, or_tree(lines, terms, "out_{0}".format(bit))))
        else:
            lines.append("  assign out[{0}] = {1};".format(bit, " | ".join(terms)))


def render(outputs, module, input_width, output_width, transform, variant, encoding, mux_style, inner_order_style):
    full_order = order_for_style(input_width, inner_order_style)
    outer_bits = variant_bits(input_width, variant)
    outer_count = len(outer_bits)
    inner_bits = [bit for bit in range(input_width) if bit not in outer_bits]
    outputs_by_key = transformed_outputs(outputs, input_width, transform)
    _free_bits, signatures, all_group_nodes = signatures_for_partition(
        outputs_by_key,
        input_width,
        output_width,
        outer_bits,
    )
    _class_signatures, class_ids = assign_classes(signatures, encoding)
    representative = {}
    for outer_value, class_id in enumerate(class_ids):
        representative.setdefault(class_id, outer_value)
    rep_by_outer = [representative[class_id] for class_id in class_ids]
    unique_reps = []
    seen = set()
    for rep in rep_by_outer:
        if rep not in seen:
            unique_reps.append(rep)
            seen.add(rep)

    lines = [
        "module {0}(in, out);".format(module),
        "  input {0}in;".format(range_decl(input_width)),
        "  output {0}out;".format(range_decl(output_width)),
    ]
    lines.extend(key_lines_for_transform(transform, input_width))
    lines.append("  wire {0}inner_key;".format(range_decl(len(inner_bits))))
    for pos, bit in enumerate(inner_bits):
        lines.append("  assign inner_key[{0}] = key[{1}];".format(pos, bit))
    if outer_count == 1:
        lines.append("  wire outer_key = {0};".format(key_vector_expr("key", outer_bits)))
    else:
        lines.append("  wire {0}outer_key = {1};".format(range_decl(outer_count), key_vector_expr("key", outer_bits)))

    group_nodes = {}
    group_models = {}
    for rep in unique_reps:
        group_name = "g_{0}".format(rep)
        nodes, _compact_bits, builder, roots = emit_group(
            lines,
            outputs_by_key,
            input_width,
            output_width,
            full_order,
            outer_bits,
            rep,
            group_name,
        )
        group_nodes[rep] = nodes
        group_models[rep] = (builder, roots)

    if mux_style == "case":
        lines.append("  reg {0}out_r;".format(range_decl(output_width)))
        lines.append("  always @* begin")
        lines.append("    case (outer_key)")
        for outer_value, rep in enumerate(rep_by_outer):
            lines.append("      {0}'d{1}: out_r = g_{2};".format(outer_count, outer_value, rep))
        lines.append("      default: out_r = g_{0};".format(unique_reps[0]))
        lines.append("    endcase")
        lines.append("  end")
        lines.append("  assign out = out_r;")
    elif mux_style == "onehot":
        for outer_value in range(1 << outer_count):
            lines.append("  wire sel_{0} = outer_key == {1}'d{0};".format(outer_value, outer_count))
        for bit in range(output_width):
            terms = [
                "(sel_{0} & g_{1}[{2}])".format(outer_value, rep, bit)
                for outer_value, rep in enumerate(rep_by_outer)
            ]
            lines.append("  assign out[{0}] = {1};".format(bit, " | ".join(terms)))
    elif mux_style == "classonehot":
        emit_classonehot(lines, output_width, outer_count, rep_by_outer, unique_reps, False)
    elif mux_style == "classonehottree":
        emit_classonehot(lines, output_width, outer_count, rep_by_outer, unique_reps, True)
    elif mux_style == "classsop":
        values_by_rep = {}
        for outer_value, rep in enumerate(rep_by_outer):
            values_by_rep.setdefault(rep, []).append(outer_value)
        for rep in unique_reps:
            lines.append("  wire sel_g_{0} = {1};".format(rep, sop_expr(values_by_rep[rep], outer_count)))
        for bit in range(output_width):
            terms = [
                "(sel_g_{0} & g_{0}[{1}])".format(rep, bit)
                for rep in unique_reps
            ]
            lines.append("  assign out[{0}] = {1};".format(bit, " | ".join(terms)))
    elif mux_style == "classcase":
        emit_class_key_case(lines, outer_count, rep_by_outer, unique_reps)
        emit_class_key_case_mux(lines, output_width, outer_count, unique_reps)
    elif mux_style == "classbitscase":
        emit_class_key_bits(lines, outer_count, rep_by_outer)
        emit_class_key_case_mux(lines, output_width, outer_count, unique_reps)
    elif mux_style == "classbitsonehot":
        emit_class_key_bits(lines, outer_count, rep_by_outer)
        emit_class_key_onehot_mux(lines, output_width, outer_count, unique_reps)
    elif mux_style == "classrulescase":
        emit_class_key_top6_rules(lines, outer_count, rep_by_outer)
        emit_class_key_case_mux(lines, output_width, outer_count, unique_reps)
    elif mux_style == "classrulesonehot":
        emit_class_key_top6_rules(lines, outer_count, rep_by_outer)
        emit_class_key_onehot_mux(lines, output_width, outer_count, unique_reps)
    elif mux_style.startswith("tree"):
        try:
            low_width = int(mux_style[4:])
        except ValueError:
            raise RuntimeError("tree mux style must be treeN: {0}".format(mux_style))
        if low_width < 1 or low_width >= outer_count:
            raise RuntimeError("tree mux low width outside outer count: {0}".format(mux_style))
        high_width = outer_count - low_width
        if low_width == 1:
            lines.append("  wire outer_low = outer_key[0];")
        else:
            lines.append("  wire {0}outer_low = outer_key[{1}:0];".format(range_decl(low_width), low_width - 1))
        if high_width == 1:
            lines.append("  wire outer_high = outer_key[{0}];".format(low_width))
        else:
            lines.append("  wire {0}outer_high = outer_key[{1}:{2}];".format(range_decl(high_width), outer_count - 1, low_width))
        for high_value in range(1 << high_width):
            lines.append("  reg {0}mux_hi_{1};".format(range_decl(output_width), high_value))
            lines.append("  always @* begin")
            lines.append("    case (outer_low)")
            for low_value in range(1 << low_width):
                outer_value = (high_value << low_width) | low_value
                lines.append(
                    "      {0}'d{1}: mux_hi_{2} = g_{3};".format(
                        low_width,
                        low_value,
                        high_value,
                        rep_by_outer[outer_value],
                    )
                )
            lines.append("      default: mux_hi_{0} = g_{1};".format(high_value, rep_by_outer[high_value << low_width]))
            lines.append("    endcase")
            lines.append("  end")
        lines.append("  reg {0}out_r;".format(range_decl(output_width)))
        lines.append("  always @* begin")
        lines.append("    case (outer_high)")
        for high_value in range(1 << high_width):
            lines.append("      {0}'d{1}: out_r = mux_hi_{1};".format(high_width, high_value))
        lines.append("      default: out_r = mux_hi_0;")
        lines.append("    endcase")
        lines.append("  end")
        lines.append("  assign out = out_r;")
    else:
        raise RuntimeError("unknown mux style: {0}".format(mux_style))
    lines.append("endmodule")
    lines.append("")

    def model(index):
        key = transform_index(transform, index, input_width)
        outer_value = 0
        for pos, bit in enumerate(outer_bits):
            if (key >> bit) & 1:
                outer_value |= 1 << pos
        inner_value = 0
        for pos, bit in enumerate(inner_bits):
            if (key >> bit) & 1:
                inner_value |= 1 << pos
        rep = rep_by_outer[outer_value]
        builder, roots = group_models[rep]
        value = 0
        memo = {}
        for bit, root in enumerate(roots):
            if builder.eval_edge(root, inner_value, memo):
                value |= 1 << bit
        return value

    items = (
        "transform={0}; outer_bits={1}; inner_bits={2}; class_encoding={3}; "
        "outer_states={4}; class_count={5}; unique_reps={6}; rep_by_outer={7}; "
        "mux_style={8}; inner_order_style={9}; old_group_bdd_nodes={10}; unique_group_bdd_nodes={11}; group_bdd_nodes={12}"
    ).format(
        transform,
        ":".join(str(bit) for bit in outer_bits),
        ":".join(str(bit) for bit in inner_bits),
        encoding,
        1 << outer_count,
        len(unique_reps),
        ":".join(str(rep) for rep in unique_reps),
        ":".join(str(rep) for rep in rep_by_outer),
        mux_style,
        inner_order_style,
        sum(all_group_nodes),
        sum(group_nodes.values()),
        ":".join(str(group_nodes[rep]) for rep in unique_reps),
    )
    return "\n".join(lines), items, model


def verify_outputs(outputs, model):
    for index, expected in enumerate(outputs):
        actual = model(index)
        if actual != expected:
            return False, "first mismatch index={0} expected=0x{1:x} actual=0x{2:x}".format(
                index,
                expected,
                actual,
            )
    return True, "exact canonical prefix-key cofactor model over {0} inputs".format(len(outputs))


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
        "hypothesis": "unknown_key_canonical_cofactor_bdd",
        "variants": [],
    }
    for transform in args.transforms:
        for variant in args.variants:
            for encoding in args.encodings:
                for mux_style in args.mux_styles:
                    for inner_order_style in args.inner_orders:
                        variant_label = "{0}_{1}_{2}_{3}_{4}".format(transform, variant, encoding, mux_style, inner_order_style)
                        candidate_id = "{0}_unknown_key_canonical_cofactor_bdd_{1}".format(case, variant_label)
                        module = candidate_id
                        verilog_path = args.work_dir / case / "verilog" / "{0}.v".format(candidate_id)
                        aig_path = args.work_dir / case / "aigs" / "{0}.aig".format(candidate_id)
                        script_path = args.work_dir / case / "logs" / "{0}.ys".format(candidate_id)
                        log_path = args.work_dir / case / "logs" / "{0}.yosys.log".format(candidate_id)
                        start = time.time()
                        row = {
                            "case": case,
                            "candidate_id": candidate_id,
                            "hypothesis": "unknown_key_canonical_cofactor_bdd",
                            "variant": variant_label,
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
                            verilog, items, model = render(
                                outputs,
                                module,
                                table.input_width,
                                table.output_width,
                                transform,
                                variant,
                                encoding,
                                mux_style,
                                inner_order_style,
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
                                    parent_id="unknown_key_canonical_cofactor_bdd",
                                    source="ai_verilog",
                                    tool_chain="yosys_unknown_key_canonical_cofactor_bdd",
                                    aig_path=aig_path,
                                    truth=truth_path,
                                    abc=args.abc,
                                    notes="unknown canonical prefix-key cofactor-BDD Verilog seed",
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
                            "{0} {1} eq={2} area={3} delay={4} adp={5}".format(
                                case,
                                variant_label,
                                row["equivalent"],
                                row["area"],
                                row["delay"],
                                row["adp"],
                            ),
                            flush=True,
                        )
    write_text(args.work_dir / case / "manifest.json", json.dumps(manifest, indent=2, sort_keys=True) + "\n")
    return rows


def parse_args(argv=None):
    parser = argparse.ArgumentParser(description="Generate canonical prefix-key cofactor candidates.")
    parser.add_argument("--cases", type=parse_cases, required=True)
    parser.add_argument("--transforms", type=parse_list, default=parse_list("prefix_parity_reduce"))
    parser.add_argument("--variants", type=parse_variants, default=parse_variants("top4,top5,top6"))
    parser.add_argument("--encodings", type=parse_list, default=parse_list("first"))
    parser.add_argument("--mux-styles", type=parse_list, default=parse_list("case"))
    parser.add_argument("--inner-orders", type=parse_list, default=parse_list("endpoint"))
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
    parser.add_argument("--timeout", type=int, default=900)
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
