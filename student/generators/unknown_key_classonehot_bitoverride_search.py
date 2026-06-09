#!/usr/bin/env python3
"""Generate classonehot prefix-key BDDs with low-bit ANF overrides."""

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
from student.generators.unknown_algebraic_search import (
    anf_by_bit,
    eval_anf_terms,
    key_lines_for_transform,
    transform_index,
)
from student.generators.unknown_bdd_key_cofactor_search import (
    build_group_bdd,
    compact_inner_values,
    key_vector_expr,
    prefixed_edge_expr,
    transformed_outputs,
)
from student.generators.unknown_key_ac_decomp_search import (
    EVALUATE_FIELDNAMES,
    SUMMARY_FIELDNAMES,
    add_summary_columns,
    assign_classes,
    load_current_best,
    load_reference,
    variant_bits,
)
from student.generators.unknown_key_canonical_cofactor_search import order_for_style
from student.generators.unknown_verilog_search import (
    ALL_FIELDNAMES,
    BEST_FIELDNAMES,
    parse_cases,
    range_decl,
    text_hash,
    write_csv,
    write_text,
)


def xor_expr(items):
    if not items:
        return "1'b0"
    if len(items) == 1:
        return items[0]
    return "(" + " ^ ".join(items) + ")"


def and_expr(items):
    if not items:
        return "1'b1"
    if len(items) == 1:
        return items[0]
    return "(" + " & ".join(items) + ")"


def signal_for_mask(lines, cache, mask, width):
    if mask == 0:
        return "1'b1"
    if mask in cache:
        return cache[mask]
    name = "anf_m_{0:x}".format(mask)
    terms = ["key[{0}]".format(bit) for bit in range(width) if (mask >> bit) & 1]
    lines.append("  wire {0} = {1};".format(name, and_expr(terms)))
    cache[mask] = name
    return name


def emit_selected_group(lines, outputs_by_key, width, full_order, outer_bits, outer_value, keep_bits, group_name):
    values, inner_bits = compact_inner_values(outputs_by_key, width, outer_bits, outer_value)
    inner_order = [inner_bits.index(bit) for bit in full_order if bit in inner_bits]
    packed = []
    for value in values:
        out = 0
        for pos, bit in enumerate(keep_bits):
            if (value >> bit) & 1:
                out |= 1 << pos
        packed.append(out)
    builder, roots = build_group_bdd(packed, len(keep_bits), inner_order)
    prefix = "{0}_".format(group_name)
    lines.append("  wire {0}{1};".format(range_decl(len(keep_bits)), group_name))
    for node in builder.nodes:
        lines.append(
            "  wire {0}n_{1} = inner_key[{2}] ? {3} : {4};".format(
                prefix,
                node["id"],
                node["var"],
                prefixed_edge_expr(node["high"], prefix),
                prefixed_edge_expr(node["low"], prefix),
            )
        )
    for bit, root in enumerate(roots):
        lines.append("  assign {0}[{1}] = {2};".format(group_name, bit, prefixed_edge_expr(root, prefix)))
    return len(builder.nodes), inner_bits, builder, roots


def selected_signatures(outputs_by_key, width, outer_bits, keep_bits):
    signatures = []
    for outer_value in range(1 << len(outer_bits)):
        values, _inner_bits = compact_inner_values(outputs_by_key, width, outer_bits, outer_value)
        packed = []
        for value in values:
            out = 0
            for pos, bit in enumerate(keep_bits):
                if (value >> bit) & 1:
                    out |= 1 << pos
            packed.append(out)
        signatures.append(tuple(packed))
    return signatures


def render(outputs, module, input_width, output_width, transform, variant, inner_order_style, override_low):
    if override_low <= 0 or override_low >= output_width:
        raise RuntimeError("override_low must be between 1 and output_width-1")
    full_order = order_for_style(input_width, inner_order_style)
    outer_bits = variant_bits(input_width, variant)
    outer_count = len(outer_bits)
    inner_bits = [bit for bit in range(input_width) if bit not in outer_bits]
    keep_bits = list(range(override_low, output_width))
    outputs_by_key = transformed_outputs(outputs, input_width, transform)
    terms_by_bit = anf_by_bit(outputs_by_key, input_width, output_width)

    signatures = selected_signatures(outputs_by_key, input_width, outer_bits, keep_bits)
    _class_signatures, class_ids = assign_classes(signatures, "first")
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

    anf_cache = {}
    override_terms = 0
    for bit in range(override_low):
        signals = [signal_for_mask(lines, anf_cache, mask, input_width) for mask in terms_by_bit[bit]]
        override_terms += len(signals)
        lines.append("  assign out[{0}] = {1};".format(bit, xor_expr(signals)))

    group_nodes = {}
    group_models = {}
    inner_bits_seen = None
    for rep in unique_reps:
        group_name = "g_{0}".format(rep)
        nodes, compact_bits, builder, roots = emit_selected_group(
            lines,
            outputs_by_key,
            input_width,
            full_order,
            outer_bits,
            rep,
            keep_bits,
            group_name,
        )
        if inner_bits_seen is None:
            inner_bits_seen = compact_bits
        group_nodes[rep] = nodes
        group_models[rep] = (builder, roots)

    values_by_rep = {}
    for outer_value, rep in enumerate(rep_by_outer):
        values_by_rep.setdefault(rep, []).append(outer_value)
    for rep in unique_reps:
        terms = [
            "(outer_key == {0}'d{1})".format(outer_count, outer_value)
            for outer_value in values_by_rep[rep]
        ]
        lines.append("  wire sel_g_{0} = {1};".format(rep, " | ".join(terms)))
    for pos, bit in enumerate(keep_bits):
        terms = [
            "(sel_g_{0} & g_{0}[{1}])".format(rep, pos)
            for rep in unique_reps
        ]
        lines.append("  assign out[{0}] = {1};".format(bit, " | ".join(terms)))
    lines.append("endmodule")
    lines.append("")

    def model(index):
        key = transform_index(transform, index, input_width)
        outer_value = 0
        for pos, bit in enumerate(outer_bits):
            if (key >> bit) & 1:
                outer_value |= 1 << pos
        inner_value = 0
        for pos, bit in enumerate(inner_bits_seen):
            if (key >> bit) & 1:
                inner_value |= 1 << pos
        value = 0
        for bit in range(override_low):
            if eval_anf_terms(terms_by_bit[bit], key):
                value |= 1 << bit
        rep = rep_by_outer[outer_value]
        builder, roots = group_models[rep]
        memo = {}
        for pos, root in enumerate(roots):
            if builder.eval_edge(root, inner_value, memo):
                value |= 1 << keep_bits[pos]
        return value

    items = (
        "transform={0}; variant={1}; outer_bits={2}; inner_bits={3}; "
        "inner_order_style={4}; override_low={5}; keep_bits={6}; "
        "class_count={7}; override_anf_terms={8}; override_unique_terms={9}; "
        "selected_group_bdd_nodes={10}; group_bdd_nodes={11}"
    ).format(
        transform,
        variant,
        ":".join(str(bit) for bit in outer_bits),
        ":".join(str(bit) for bit in inner_bits),
        inner_order_style,
        override_low,
        ":".join(str(bit) for bit in keep_bits),
        len(unique_reps),
        override_terms,
        len(anf_cache),
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
    return True, "exact classonehot BDD with low-bit ANF override over {0} inputs".format(len(outputs))


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
        "hypothesis": "unknown_key_classonehot_bitoverride",
        "variants": [],
    }
    for transform in args.transforms:
        for variant in args.variants:
            for inner_order_style in args.inner_orders:
                for override_low in args.override_lows:
                    variant_label = "{0}_{1}_{2}_low{3}".format(transform, variant, inner_order_style, override_low)
                    candidate_id = "{0}_unknown_key_classonehot_bitoverride_{1}".format(case, variant_label)
                    module = candidate_id
                    verilog_path = args.work_dir / case / "verilog" / "{0}.v".format(candidate_id)
                    aig_path = args.work_dir / case / "aigs" / "{0}.aig".format(candidate_id)
                    script_path = args.work_dir / case / "logs" / "{0}.ys".format(candidate_id)
                    log_path = args.work_dir / case / "logs" / "{0}.yosys.log".format(candidate_id)
                    start = time.time()
                    row = {
                        "case": case,
                        "candidate_id": candidate_id,
                        "hypothesis": "unknown_key_classonehot_bitoverride",
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
                            inner_order_style,
                            override_low,
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
                                parent_id="unknown_key_classonehot_bitoverride",
                                source="ai_verilog",
                                tool_chain="yosys_unknown_key_classonehot_bitoverride",
                                aig_path=aig_path,
                                truth=truth_path,
                                abc=args.abc,
                                notes="unknown classonehot BDD with low-bit ANF override Verilog seed",
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


def parse_list(text):
    return [item.strip() for item in text.split(",") if item.strip()]


def parse_int_list(text):
    return [int(item.strip()) for item in text.split(",") if item.strip()]


def parse_args(argv=None):
    parser = argparse.ArgumentParser(description="Generate classonehot BDD candidates with low-bit ANF overrides.")
    parser.add_argument("--cases", type=parse_cases, required=True)
    parser.add_argument("--transforms", type=parse_list, default=parse_list("prefix_parity_reduce"))
    parser.add_argument("--variants", type=parse_list, default=parse_list("top6"))
    parser.add_argument("--inner-orders", type=parse_list, default=parse_list("endpoint,endpoint_rev"))
    parser.add_argument("--override-lows", type=parse_int_list, default=parse_int_list("4,5"))
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
