#!/usr/bin/env python3
"""Cofactored pair-count MDD diagnostics for pair-symmetric unknown cases."""

import argparse
import csv
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from student.frontends.truth import TruthTable
from student.generators.unknown_paircount_mdd_search import MddBuilder, domains, pair_count_key
from student.generators.unknown_symmetry_bdd import parse_pairs, verify_pair_symmetry
from student.generators.unknown_verilog_search import parse_cases


def parse_list(text):
    return [item.strip() for item in text.split(",") if item.strip()]


def order_for_style(var_count, style):
    if style == "forward":
        return list(range(var_count))
    if style == "reverse":
        return list(reversed(range(var_count)))
    if style == "center":
        mid = (var_count - 1) / 2.0
        return sorted(range(var_count), key=lambda item: (abs(item - mid), item))
    if style == "edge":
        mid = (var_count - 1) / 2.0
        return sorted(range(var_count), key=lambda item: (-abs(item - mid), item))
    raise RuntimeError("unknown order style {0}".format(style))


def project_table(table, outer_vars, outer_value, doms):
    remaining = [var for var in range(len(doms)) if var not in outer_vars]
    projected = {}
    for key, value in table.items():
        ok = True
        tmp = outer_value
        for var in reversed(outer_vars):
            digit = tmp % doms[var]
            tmp //= doms[var]
            if key[var] != digit:
                ok = False
                break
        if not ok:
            continue
        projected[tuple(key[var] for var in remaining)] = value
    return tuple(sorted(projected.items())), remaining


def outer_space(doms, outer_vars):
    total = 1
    for var in outer_vars:
        total *= doms[var]
    return total


def build_mdd(values, remaining, doms, output_width):
    rem_doms = [doms[var] for var in remaining]
    order = list(range(len(remaining)))
    builder = MddBuilder(rem_doms, order)
    table = dict(values)
    roots = {}
    for bit in range(output_width):
        roots[bit] = builder.build({key: (value >> bit) & 1 for key, value in table.items()})
    return builder, roots


def run_case(case, pairs, benchmarks, order_styles, outer_counts):
    truth = TruthTable(benchmarks / "{0}.truth".format(case))
    outputs = list(truth.iter_outputs())
    ok, note = verify_pair_symmetry(outputs, truth.input_width, pairs)
    if not ok:
        raise RuntimeError("{0}: {1}".format(case, note))
    table = {}
    for index, output in enumerate(outputs):
        key = pair_count_key(index, truth.input_width, pairs)
        previous = table.get(key)
        if previous is not None and previous != output:
            raise RuntimeError("{0}: pair-count key conflict".format(case))
        table[key] = output
    doms = domains(truth.input_width, pairs)
    rows = []
    for style in order_styles:
        order = order_for_style(len(doms), style)
        for outer_count in outer_counts:
            outer_vars = order[:outer_count]
            reps = {}
            remaining = None
            for outer_value in range(outer_space(doms, outer_vars)):
                values, current_remaining = project_table(table, outer_vars, outer_value, doms)
                remaining = current_remaining
                reps.setdefault(values, len(reps))
            total_nodes = 0
            max_nodes = 0
            for values in reps:
                builder, _roots = build_mdd(values, remaining, doms, truth.output_width)
                total_nodes += len(builder.nodes)
                max_nodes = max(max_nodes, len(builder.nodes))
            rows.append(
                {
                    "case": case,
                    "order_style": style,
                    "outer_count": outer_count,
                    "outer_vars": ":".join(str(var) for var in outer_vars),
                    "remaining_vars": ":".join(str(var) for var in remaining),
                    "classes": len(reps),
                    "total_mdd_nodes": total_nodes,
                    "max_group_nodes": max_nodes,
                    "domain_vars": len(doms),
                    "notes": "cofactored pair-count MDD node diagnostic",
                }
            )
    return rows


def main(argv=None):
    parser = argparse.ArgumentParser()
    parser.add_argument("--cases", type=parse_cases, required=True)
    parser.add_argument("--pairs", type=parse_pairs, required=True)
    parser.add_argument("--orders", type=parse_list, default=parse_list("forward,reverse,center,edge"))
    parser.add_argument("--outer-counts", default="2,3,4,5")
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--results", type=Path, required=True)
    args = parser.parse_args(argv)

    outer_counts = [int(item) for item in args.outer_counts.split(",") if item.strip()]
    rows = []
    for case in args.cases:
        rows.extend(run_case(case, args.pairs, args.benchmarks, args.orders, outer_counts))
    fields = [
        "case",
        "order_style",
        "outer_count",
        "outer_vars",
        "remaining_vars",
        "classes",
        "total_mdd_nodes",
        "max_group_nodes",
        "domain_vars",
        "notes",
    ]
    args.results.parent.mkdir(parents=True, exist_ok=True)
    with args.results.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields)
        writer.writeheader()
        writer.writerows(rows)
    for case in sorted(set(row["case"] for row in rows)):
        best = min([row for row in rows if row["case"] == case], key=lambda row: int(row["total_mdd_nodes"]))
        print(
            "{0} best {1} k{2} classes={3} nodes={4}".format(
                case,
                best["order_style"],
                best["outer_count"],
                best["classes"],
                best["total_mdd_nodes"],
            )
        )
    print("rows={0} output={1}".format(len(rows), args.results))


if __name__ == "__main__":
    raise SystemExit(main())
