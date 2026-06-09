#!/usr/bin/env python3
"""Generate per-output-bit BDDs in the prefix-key endpoint order."""

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
from student.generators.unknown_bdd_key_cofactor_search import parse_list, transformed_outputs
from student.generators.unknown_bdd_search import SharedBddBuilder, permute_plane
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


def support_for_bit(outputs, bit, width):
    support = []
    for var in range(width):
        mask = 1 << var
        depends = False
        for index in range(1 << width):
            if index & mask:
                continue
            if ((outputs[index] >> bit) & 1) != ((outputs[index | mask] >> bit) & 1):
                depends = True
                break
        if depends:
            support.append(var)
    return support


def compact_bit_plane(outputs, bit, support):
    values = [0] * (1 << len(support))
    seen = [False] * len(values)
    for index, out_value in enumerate(outputs):
        key = 0
        for pos, var in enumerate(support):
            if (index >> var) & 1:
                key |= 1 << pos
        bit_value = (out_value >> bit) & 1
        if seen[key] and values[key] != bit_value:
            raise RuntimeError("support set is not exact for bit {0}".format(bit))
        seen[key] = True
        values[key] = bit_value
    return bytes(values)


def endpoint_vars(width, reverse=False):
    order = []
    for index in range((width + 1) // 2):
        pair = (width - 1 - index, index) if reverse else (index, width - 1 - index)
        for var in pair:
            if var not in order:
                order.append(var)
    return order


def order_for_support(width, support, variant):
    if variant == "endpoint":
        ordered = endpoint_vars(width, reverse=False)
    elif variant == "endpoint_rev":
        ordered = endpoint_vars(width, reverse=True)
    elif variant == "natural":
        ordered = list(range(width))
    elif variant == "reverse":
        ordered = list(reversed(range(width)))
    else:
        raise RuntimeError("unknown order variant: {0}".format(variant))
    return [support.index(var) for var in ordered if var in support]


def prefixed_edge_expr(edge, prefix):
    node_id, inv = edge
    if node_id == 0:
        return "1'b1" if inv else "1'b0"
    name = "{0}n_{1}".format(prefix, node_id)
    return "~{0}".format(name) if inv else name


def bdd_depth(builder, edge):
    node_id, _inv = edge
    if node_id == 0:
        return 0
    node = builder.nodes[node_id - 1]
    return 1 + max(bdd_depth(builder, node["low"]), bdd_depth(builder, node["high"]))


def render(outputs, module, input_width, output_width, transform, order_variant):
    outputs_by_key = transformed_outputs(outputs, input_width, transform)
    lines = [
        "module {0}(in, out);".format(module),
        "  input {0}in;".format(range_decl(input_width)),
        "  output {0}out;".format(range_decl(output_width)),
    ]
    lines.extend(key_lines_for_transform(transform, input_width))
    bit_models = []
    bit_items = []
    total_nodes = 0
    max_depth = 0
    for bit in range(output_width):
        support = support_for_bit(outputs_by_key, bit, input_width)
        order = order_for_support(input_width, support, order_variant)
        builder = SharedBddBuilder(order)
        root = builder.build(permute_plane(compact_bit_plane(outputs_by_key, bit, support), order), 0)
        prefix = "b{0}_".format(bit)
        for node in builder.nodes:
            actual_var = support[node["var"]]
            lines.append(
                "  wire {0}n_{1} = key[{2}] ? {3} : {4};".format(
                    prefix,
                    node["id"],
                    actual_var,
                    prefixed_edge_expr(node["high"], prefix),
                    prefixed_edge_expr(node["low"], prefix),
                )
            )
        lines.append("  assign out[{0}] = {1};".format(bit, prefixed_edge_expr(root, prefix)))
        depth = bdd_depth(builder, root)
        total_nodes += len(builder.nodes)
        max_depth = max(max_depth, depth)
        bit_items.append(
            "bit{0}:support={1}:nodes={2}:depth={3}".format(
                bit,
                ":".join(str(var) for var in support),
                len(builder.nodes),
                depth,
            )
        )
        bit_models.append((support, builder, root))
    lines.append("endmodule")
    lines.append("")

    def model(index):
        key = transform_index(transform, index, input_width)
        value = 0
        for bit, (support, builder, root) in enumerate(bit_models):
            compact = 0
            for pos, var in enumerate(support):
                if (key >> var) & 1:
                    compact |= 1 << pos
            if builder.eval_edge(root, compact, {}):
                value |= 1 << bit
        return value

    items = "transform={0}; order_variant={1}; total_bdd_nodes={2}; max_bdd_depth={3}; {4}".format(
        transform,
        order_variant,
        total_nodes,
        max_depth,
        "; ".join(bit_items),
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
    return True, "exact per-bit endpoint BDD model over {0} inputs".format(len(outputs))


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
        "hypothesis": "unknown_key_perbit_endpoint_bdd",
        "variants": [],
    }
    for transform in args.transforms:
        for order_variant in args.order_variants:
            variant_label = "{0}_{1}".format(transform, order_variant)
            candidate_id = "{0}_unknown_key_perbit_endpoint_bdd_{1}".format(case, variant_label)
            module = candidate_id
            verilog_path = args.work_dir / case / "verilog" / "{0}.v".format(candidate_id)
            aig_path = args.work_dir / case / "aigs" / "{0}.aig".format(candidate_id)
            script_path = args.work_dir / case / "logs" / "{0}.ys".format(candidate_id)
            log_path = args.work_dir / case / "logs" / "{0}.yosys.log".format(candidate_id)
            start = time.time()
            row = {
                "case": case,
                "candidate_id": candidate_id,
                "hypothesis": "unknown_key_perbit_endpoint_bdd",
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
                    order_variant,
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
                        parent_id="unknown_key_perbit_endpoint_bdd",
                        source="ai_verilog",
                        tool_chain="yosys_unknown_key_perbit_endpoint_bdd",
                        aig_path=aig_path,
                        truth=truth_path,
                        abc=args.abc,
                        notes="unknown per-bit endpoint-order BDD Verilog seed",
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
    parser = argparse.ArgumentParser(description="Generate per-bit endpoint-order BDD candidates.")
    parser.add_argument("--cases", type=parse_cases, required=True)
    parser.add_argument("--transforms", type=parse_list, default=parse_list("prefix_parity_reduce"))
    parser.add_argument("--order-variants", type=parse_list, default=parse_list("endpoint,endpoint_rev"))
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
