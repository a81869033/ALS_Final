#!/usr/bin/env python3
"""Component-wise adjacent output-pair orientation diagnostics."""

import argparse
import csv
import re
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from student.frontends.truth import TruthTable
from student.generators.unknown_bdd_search import SharedBddBuilder, permute_plane, plane_for_outputs
from student.generators.unknown_verilog_search import parse_cases


def interleave_order(width):
    order = []
    for index in range((width + 1) // 2):
        other = width - 1 - index
        order.append(index)
        if other != index:
            order.append(other)
    return order


def bdd_nodes(outputs, input_width, output_width):
    builder = SharedBddBuilder(interleave_order(input_width))
    for bit in range(output_width):
        builder.build(permute_plane(plane_for_outputs(outputs, bit), builder.order), 0)
    return len(builder.nodes)


def parent_find(parent, item):
    parent.setdefault(item, item)
    while parent[item] != item:
        parent[item] = parent[parent[item]]
        item = parent[item]
    return item


def parent_union(parent, left, right):
    lroot = parent_find(parent, left)
    rroot = parent_find(parent, right)
    if lroot != rroot:
        parent[rroot] = lroot


def parse_relation_pair_edge(relation):
    vars_found = sorted(set(int(item) for item in re.findall(r"y(\d+)", relation)))
    if len(vars_found) != 4:
        return None
    pairs = []
    for bit in vars_found:
        if bit % 2:
            continue
        if bit + 1 in vars_found:
            pairs.append(bit // 2)
    if len(pairs) == 2:
        return tuple(pairs)
    return None


def components_from_relations(path, case, width):
    parent = {}
    pair_count = width // 2
    for pair in range(pair_count):
        parent_find(parent, pair)
    if path and path.is_file():
        for row in csv.DictReader(path.open()):
            if row.get("case") != case or row.get("degree") != "3":
                continue
            edge = parse_relation_pair_edge(row.get("relation", ""))
            if edge is not None:
                parent_union(parent, edge[0], edge[1])
    groups = {}
    for pair in range(pair_count):
        root = parent_find(parent, pair)
        groups.setdefault(root, []).append(pair)
    return list(groups.values())


def pair_encoding(value, width, components):
    encoded = 0
    pos = 0
    orientation_by_component = []
    pair_to_component = {}
    for comp_index, component in enumerate(components):
        orientation_by_component.append(-1)
        for pair in component:
            pair_to_component[pair] = comp_index
    conflict = False
    for pair in range(width // 2):
        bit = pair * 2
        a = (value >> bit) & 1
        b = (value >> (bit + 1)) & 1
        count = a + b
        encoded |= count << pos
        pos += 2
        if count == 1:
            comp = pair_to_component[pair]
            current = a
            old = orientation_by_component[comp]
            if old < 0:
                orientation_by_component[comp] = current
            elif old != current:
                conflict = True
    if width & 1:
        encoded |= ((value >> (width - 1)) & 1) << pos
        pos += 1
    for orient in orientation_by_component:
        if orient < 0:
            orient = 0
        encoded |= orient << pos
        pos += 1
    return encoded, pos, conflict


def run_case(case, benchmarks, relations_path):
    table = TruthTable(benchmarks / "{0}.truth".format(case))
    outputs = list(table.iter_outputs())
    width = table.output_width
    components = components_from_relations(relations_path, case, width)
    encoded_outputs = []
    conflicts = 0
    first = ""
    encoded_width = None
    for index, output in enumerate(outputs):
        encoded, enc_width, conflict = pair_encoding(output, width, components)
        encoded_width = enc_width
        encoded_outputs.append(encoded)
        if conflict:
            conflicts += 1
            if not first:
                first = "x=0x{0:x};out=0x{1:x};encoded=0x{2:x}".format(index, output, encoded)
    raw_nodes = bdd_nodes(outputs, table.input_width, table.output_width)
    encoded_nodes = bdd_nodes(encoded_outputs, table.input_width, encoded_width)
    return {
        "case": case,
        "input_width": table.input_width,
        "output_width": width,
        "encoded_width": encoded_width,
        "components": ";".join(":".join(str(pair) for pair in comp) for comp in components),
        "component_count": len(components),
        "truth_rows": len(outputs),
        "unique_outputs": len(set(outputs)),
        "unique_encoded": len(set(encoded_outputs)),
        "orientation_conflicts": conflicts,
        "raw_bdd_nodes": raw_nodes,
        "encoded_bdd_nodes": encoded_nodes,
        "node_delta": encoded_nodes - raw_nodes,
        "node_ratio": "{0:.6f}".format(encoded_nodes / float(raw_nodes) if raw_nodes else 0.0),
        "first_conflict": first,
        "notes": "component-wise adjacent output-pair count plus orientation encoding",
    }


def write_csv(path, fieldnames, rows):
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(rows)


def write_manifest(path, run_id, cases, work_dir, results_dir, relations):
    text = """# {0}

Run ID: `{0}`

Purpose: Refine adjacent output-pair orientation encoding by using connected
components from degree-3 image constraints, instead of one global orientation
bit for every pair.

Inputs:
- Cases: `{1}`
- Relations: `{2}`
- Script: `student/generators/unknown_output_pair_component_diag.py`

Artifacts:
- Work directory: `{3}`
- Results directory: `{4}`

Notes:
- Diagnostic only; no Verilog/AIG candidates emitted.
- `student/seeds` and `output/` are intentionally untouched.
""".format(run_id, ",".join(cases), relations, work_dir, results_dir)
    path.write_text(text)


def main(argv=None):
    parser = argparse.ArgumentParser()
    parser.add_argument("--cases", required=True)
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--relations", type=Path, required=True)
    parser.add_argument("--run-id", required=True)
    parser.add_argument("--work-dir", type=Path, required=True)
    parser.add_argument("--results-dir", type=Path, required=True)
    args = parser.parse_args(argv)

    cases = parse_cases(args.cases)
    rows = [run_case(case, args.benchmarks, args.relations) for case in cases]
    fields = [
        "case",
        "input_width",
        "output_width",
        "encoded_width",
        "components",
        "component_count",
        "truth_rows",
        "unique_outputs",
        "unique_encoded",
        "orientation_conflicts",
        "raw_bdd_nodes",
        "encoded_bdd_nodes",
        "node_delta",
        "node_ratio",
        "first_conflict",
        "notes",
    ]
    write_csv(args.results_dir / "summary.csv", fields, rows)
    empty_fields = ["case", "candidate_id", "equivalent", "area", "delay", "adp", "notes"]
    write_csv(args.results_dir / "candidates.csv", empty_fields, [])
    write_csv(args.results_dir / "best.csv", empty_fields, [])
    write_csv(args.results_dir / "evaluate_check.csv", empty_fields, [])
    write_manifest(args.results_dir.parent / "MANIFEST.md", args.run_id, cases, args.work_dir, args.results_dir, args.relations)
    for row in rows:
        print(
            "{case} comps={component_count} conflicts={orientation_conflicts} raw={raw_bdd_nodes} enc={encoded_bdd_nodes} ratio={node_ratio}".format(
                **row
            )
        )
    print("rows={0} output={1}".format(len(rows), args.results_dir / "summary.csv"))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
