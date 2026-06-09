#!/usr/bin/env python3
"""Generate transformed-key cofactor-BDD Verilog seeds for unknown functions."""

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
    key_lines_for_transform,
    transform_index,
)
from student.generators.unknown_bdd_search import (
    SharedBddBuilder,
    edge_expr,
    permute_plane,
    plane_for_outputs,
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


def parse_list(value):
    out = []
    seen = set()
    for item in value.split(","):
        item = item.strip()
        if item and item not in seen:
            out.append(item)
            seen.add(item)
    if not out:
        raise argparse.ArgumentTypeError("empty list")
    return out


def parse_variants(value):
    variants = []
    for item in parse_list(value):
        if item.startswith("top"):
            try:
                count = int(item[3:])
            except ValueError:
                raise argparse.ArgumentTypeError("variant must be topN or bits_A_B: {0}".format(item))
            if count < 1 or count > 8:
                raise argparse.ArgumentTypeError("topN must be 1..8: {0}".format(item))
        elif item.startswith("bits_"):
            bits = [part for part in item[5:].split("_") if part != ""]
            if not bits:
                raise argparse.ArgumentTypeError("empty bits variant: {0}".format(item))
            try:
                [int(part) for part in bits]
            except ValueError:
                raise argparse.ArgumentTypeError("bits variant must use integers: {0}".format(item))
        else:
            raise argparse.ArgumentTypeError("variant must be topN or bits_A_B: {0}".format(item))
        variants.append(item)
    return variants


def interleave_order(width):
    order = []
    for index in range((width + 1) // 2):
        other = width - 1 - index
        order.append(index)
        if other != index:
            order.append(other)
    return order


def transformed_outputs(outputs, width, transform):
    values = [0] * len(outputs)
    seen = [False] * len(outputs)
    for index, value in enumerate(outputs):
        key = transform_index(transform, index, width)
        if seen[key]:
            raise RuntimeError("non-bijective transform {0}".format(transform))
        seen[key] = True
        values[key] = value
    return values


def compact_inner_values(outputs_by_key, width, outer_bits, outer_value):
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
        values.append(outputs_by_key[key])
    return values, inner_bits


def build_group_bdd(values, output_width, order):
    builder = SharedBddBuilder(order)
    roots = []
    for bit in range(output_width):
        roots.append(builder.build(permute_plane(plane_for_outputs(values, bit), order), 0))
    return builder, roots


def prefixed_edge_expr(edge, prefix):
    node_id, inv = edge
    if node_id == 0:
        return "1'b1" if inv else "1'b0"
    name = "{0}n_{1}".format(prefix, node_id)
    return "~{0}".format(name) if inv else name


def emit_group(lines, outputs_by_key, width, output_width, full_order, outer_bits, outer_value, group_name):
    values, inner_bits = compact_inner_values(outputs_by_key, width, outer_bits, outer_value)
    inner_order = [inner_bits.index(bit) for bit in full_order if bit in inner_bits]
    builder, roots = build_group_bdd(values, output_width, inner_order)
    prefix = "{0}_".format(group_name)
    lines.append("  wire {0}{1};".format(range_decl(output_width), group_name))
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


def key_vector_expr(signal, bits):
    if len(bits) == 1:
        return "{0}[{1}]".format(signal, bits[0])
    return "{" + ", ".join("{0}[{1}]".format(signal, bit) for bit in reversed(bits)) + "}"


def render(outputs, module, input_width, output_width, transform, variant):
    full_order = interleave_order(input_width)
    if variant.startswith("top"):
        outer_bits = full_order[: int(variant[3:])]
    elif variant.startswith("bits_"):
        outer_bits = [int(part) for part in variant[5:].split("_") if part != ""]
        if len(set(outer_bits)) != len(outer_bits):
            raise RuntimeError("duplicate outer bits in {0}".format(variant))
        if any(bit < 0 or bit >= input_width for bit in outer_bits):
            raise RuntimeError("outer bit outside width {0}: {1}".format(input_width, variant))
    else:
        raise RuntimeError("unknown variant {0}".format(variant))
    outer_count = len(outer_bits)
    inner_bits = [bit for bit in range(input_width) if bit not in outer_bits]
    outputs_by_key = transformed_outputs(outputs, input_width, transform)

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

    group_nodes = []
    group_models = []
    inner_bits_seen = None
    for outer_value in range(1 << outer_count):
        group_name = "g_{0}".format(outer_value)
        nodes, compact_bits, builder, roots = emit_group(
            lines,
            outputs_by_key,
            input_width,
            output_width,
            full_order,
            outer_bits,
            outer_value,
            group_name,
        )
        if inner_bits_seen is None:
            inner_bits_seen = compact_bits
        group_nodes.append(nodes)
        group_models.append((builder, roots))

    lines.append("  reg {0}out_r;".format(range_decl(output_width)))
    lines.append("  always @* begin")
    lines.append("    case (outer_key)")
    for outer_value in range(1 << outer_count):
        lines.append("      {0}'d{1}: out_r = g_{1};".format(outer_count, outer_value))
    lines.append("      default: out_r = g_0;")
    lines.append("    endcase")
    lines.append("  end")
    lines.append("  assign out = out_r;")
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
        builder, roots = group_models[outer_value]
        value = 0
        memo = {}
        for bit, root in enumerate(roots):
            if builder.eval_edge(root, inner_value, memo):
                value |= 1 << bit
        return value

    items = "transform={0}; outer_bits={1}; inner_bits={2}; group_bdd_nodes={3}; total_group_bdd_nodes={4}".format(
        transform,
        ":".join(str(bit) for bit in outer_bits),
        ":".join(str(bit) for bit in inner_bits),
        ":".join(str(count) for count in group_nodes),
        sum(group_nodes),
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
    return True, "exact transformed-key cofactor-BDD model over {0} inputs".format(len(outputs))


def best_rows(rows):
    grouped = {}
    for result_row in rows:
        grouped.setdefault(result_row["case"], []).append(result_row)
    best = []
    for case in sorted(grouped):
        valid = [
            result_row
            for result_row in grouped[case]
            if result_row["equivalent"] == "1" and result_row["adp"]
        ]
        if valid:
            item = min(valid, key=lambda result_row: int(result_row["adp"]))
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
        "hypothesis": "unknown_key_cofactor_bdd",
        "variants": [],
    }
    for transform in args.transforms:
        for variant in args.variants:
            candidate_id = "{0}_unknown_key_cofactor_bdd_{1}_{2}".format(case, transform, variant)
            module = candidate_id
            verilog_path = args.work_dir / case / "verilog" / "{0}.v".format(candidate_id)
            aig_path = args.work_dir / case / "aigs" / "{0}.aig".format(candidate_id)
            script_path = args.work_dir / case / "logs" / "{0}.ys".format(candidate_id)
            log_path = args.work_dir / case / "logs" / "{0}.yosys.log".format(candidate_id)
            start = time.time()
            row = {
                "case": case,
                "candidate_id": candidate_id,
                "hypothesis": "unknown_key_cofactor_bdd",
                "variant": "{0}_{1}".format(transform, variant),
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
                        parent_id="unknown_key_cofactor_bdd",
                        source="ai_verilog",
                        tool_chain="yosys_unknown_key_cofactor_bdd",
                        aig_path=aig_path,
                        truth=truth_path,
                        abc=args.abc,
                        notes="unknown transformed-key cofactor-BDD Verilog seed",
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
                "{0} {1}_{2} eq={3} area={4} delay={5} adp={6}".format(
                    case,
                    transform,
                    variant,
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
    parser = argparse.ArgumentParser(description="Generate transformed-key cofactor-BDD candidates.")
    parser.add_argument("--cases", type=parse_cases, required=True)
    parser.add_argument("--transforms", type=parse_list, default=parse_list("prefix_parity_reduce"))
    parser.add_argument("--variants", type=parse_variants, default=parse_variants("top2,top3"))
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--work-dir", type=Path, required=True)
    parser.add_argument("--results", type=Path, required=True)
    parser.add_argument("--best-results", type=Path, required=True)
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
    write_text(args.work_dir / "manifest.json", json.dumps(rows, indent=2, sort_keys=True) + "\n")
    print("Results: {0}".format(args.results))
    print("Best: {0}".format(args.best_results))
    print("Rows: {0}".format(len(rows)))
    print("Best cases: {0}/{1}".format(len(best), len(args.cases)))
    return 0 if len(best) == len(args.cases) else 1


if __name__ == "__main__":
    raise SystemExit(main())
