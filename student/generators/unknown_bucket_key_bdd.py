#!/usr/bin/env python3
"""BDD decomposition of exact bucket-count key functions."""

import argparse
import csv
import json
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from student.frontends.truth import TruthTable
from student.generators.unknown_bdd_search import build_bdd, edge_expr
from student.generators.unknown_bucket_count_classifier import (
    bucket_counts,
    bucket_info,
    build_mapping,
    emit_common_prefix,
    emit_key_logic,
    exact_pairs,
    feature_candidates,
    feature_name,
    feature_value,
    greedy_selectors,
    onehot_slots,
    parse_cases,
)


def field_ranges(buckets, selector_count):
    width = sum(bucket[2] for bucket in buckets) + selector_count
    ranges = []
    cursor = width
    for index, (_slot, _members, bits) in enumerate(buckets):
        cursor -= bits
        ranges.append(("cnt{0}".format(index), list(range(cursor, cursor + bits))))
    for index in range(selector_count):
        cursor -= 1
        ranges.append(("sel{0}".format(index), [cursor]))
    return width, ranges


def key_orders(buckets, selector_count):
    key_width, ranges = field_ranges(buckets, selector_count)
    selectors = []
    counts = []
    for name, bits in ranges:
        if name.startswith("sel"):
            selectors.extend(bits)
        else:
            counts.extend(bits)
    field_lsb = []
    field_msb = []
    for _name, bits in ranges:
        field_lsb.extend(sorted(bits))
        field_msb.extend(sorted(bits, reverse=True))
    orders = {
        "natural": list(range(key_width)),
        "reverse": list(reversed(range(key_width))),
        "selectors_first": selectors + counts,
        "selectors_last": counts + selectors,
        "fields_lsb": field_lsb,
        "fields_msb": field_msb,
    }
    unique = {}
    for name, order in orders.items():
        if sorted(order) != list(range(key_width)):
            raise RuntimeError("bad order {0}: {1}".format(name, order))
        key = tuple(order)
        if key not in unique.values():
            unique[name] = order
    return unique


def build_case_model(case, benchmarks, max_selectors):
    table = TruthTable(benchmarks / "{0}.truth".format(case))
    outputs = list(table.iter_outputs())
    width = table.input_width
    onehot = onehot_slots(outputs, width)
    buckets = bucket_info(onehot)
    features = feature_candidates(case, width)
    rows = []
    for value, output in enumerate(outputs):
        rows.append(
            (
                bucket_counts(value, buckets),
                tuple(feature_value(feature, value) for feature in features),
                output,
            )
        )
    selected, trace = greedy_selectors(rows, features, len(outputs), max_selectors)
    if trace[-1][2] != len(outputs):
        raise RuntimeError("{0} did not become exact".format(case))
    mapping = build_mapping(outputs, buckets, features, selected)
    key_width = sum(bucket[2] for bucket in buckets) + len(selected)
    key_outputs = [0] * (1 << key_width)
    for key, output in mapping.items():
        key_outputs[key] = output
    return table, buckets, features, selected, mapping, key_outputs


def bdd_model(builder, roots, key):
    value = 0
    memo = {}
    for bit, root in enumerate(roots):
        if builder.eval_edge(root, key, memo):
            value |= 1 << bit
    return value


def emit_bdd_verilog(module, table, buckets, features, selected, builder, roots, path):
    lines, key_width = emit_common_prefix(module, table.input_width, buckets, features, selected)
    lines.append("  output [{0}:0] out;".format(table.output_width - 1))
    emit_key_logic(lines, table.input_width, buckets, features, selected, key_width)
    for node in builder.nodes:
        lines.append(
            "  wire n_{0} = key[{1}] ? {2} : {3};".format(
                node["id"],
                node["var"],
                edge_expr(node["high"]),
                edge_expr(node["low"]),
            )
        )
    for bit, root in enumerate(roots):
        lines.append("  assign out[{0}] = {1};".format(bit, edge_expr(root)))
    lines.append("endmodule")
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text("\n".join(lines) + "\n")


def run_case(case, benchmarks, work_dir, max_selectors, emit_best):
    table, buckets, features, selected, mapping, key_outputs = build_case_model(case, benchmarks, max_selectors)
    orders = key_orders(buckets, len(selected))
    rows = []
    built = {}
    for order_name, order in orders.items():
        builder, roots = build_bdd(key_outputs, len(order), table.output_width, order)
        reachable_ok = all(bdd_model(builder, roots, key) == output for key, output in mapping.items())
        rows.append(
            {
                "case": case,
                "order_name": order_name,
                "order_bits": ":".join(str(bit) for bit in order),
                "input_width": table.input_width,
                "output_width": table.output_width,
                "bucket_count": len(buckets),
                "selected_features": ":".join(feature_name(features[index]) for index in selected),
                "key_width": len(order),
                "mapped_keys": len(mapping),
                "bdd_nodes": len(builder.nodes),
                "reachable_exact": "1" if reachable_ok else "0",
                "verilog_path": "",
                "module": "",
            }
        )
        built[order_name] = (builder, roots)
    if emit_best:
        best = min(rows, key=lambda row: int(row["bdd_nodes"]))
        builder, roots = built[best["order_name"]]
        module = "{0}_unknown_bucket_key_bdd_{1}".format(case, best["order_name"])
        verilog = work_dir / case / "verilog" / "{0}.v".format(module)
        emit_bdd_verilog(module, table, buckets, features, selected, builder, roots, verilog)
        best["verilog_path"] = str(verilog)
        best["module"] = module
    return rows


def main(argv=None):
    parser = argparse.ArgumentParser()
    parser.add_argument("--cases", required=True)
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--work-dir", type=Path, required=True)
    parser.add_argument("--results", type=Path, required=True)
    parser.add_argument("--seed-json", type=Path)
    parser.add_argument("--max-selectors", type=int, default=8)
    parser.add_argument("--emit-best", action="store_true")
    args = parser.parse_args(argv)

    rows = []
    seeds = {}
    for case in parse_cases(args.cases):
        case_rows = run_case(case, args.benchmarks, args.work_dir, args.max_selectors, args.emit_best)
        rows.extend(case_rows)
        emitted = [row for row in case_rows if row["verilog_path"]]
        if emitted:
            row = emitted[0]
            seeds[case] = {
                "label": "unknown_bucket_key_bdd",
                "module": row["module"],
                "variant": "bucket_key_bdd_{0}".format(row["order_name"]),
                "verilog": row["verilog_path"],
            }
    fields = [
        "case",
        "order_name",
        "order_bits",
        "input_width",
        "output_width",
        "bucket_count",
        "selected_features",
        "key_width",
        "mapped_keys",
        "bdd_nodes",
        "reachable_exact",
        "verilog_path",
        "module",
    ]
    args.results.parent.mkdir(parents=True, exist_ok=True)
    with args.results.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields)
        writer.writeheader()
        writer.writerows(rows)
    if args.seed_json:
        args.seed_json.parent.mkdir(parents=True, exist_ok=True)
        args.seed_json.write_text(json.dumps(seeds, indent=2) + "\n")
    for case in sorted({row["case"] for row in rows}):
        best = min([row for row in rows if row["case"] == case], key=lambda row: int(row["bdd_nodes"]))
        print(
            "{case} best_order={order_name} nodes={bdd_nodes} mapped_keys={mapped_keys} emitted={verilog_path}".format(
                **best
            )
        )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
