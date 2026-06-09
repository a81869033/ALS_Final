#!/usr/bin/env python3
"""Field diagnostics for component-wise adjacent output-pair encoding."""

import argparse
import csv
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from student.frontends.truth import TruthTable
from student.generators.unknown_bdd_search import SharedBddBuilder, permute_plane, plane_for_outputs
from student.generators.unknown_verilog_search import parse_cases
from student.scripts.unknown_output_pair_component_diag import components_from_relations, pair_encoding


def interleave_order(width):
    order = []
    for index in range((width + 1) // 2):
        other = width - 1 - index
        order.append(index)
        if other != index:
            order.append(other)
    return order


def popcount(value):
    return bin(value).count("1")


def bdd_nodes_for_bits(words, input_width, bits):
    builder = SharedBddBuilder(interleave_order(input_width))
    for bit in bits:
        builder.build(permute_plane(plane_for_outputs(words, bit), builder.order), 0)
    return len(builder.nodes)


def support_for_bit(words, input_width, bit):
    support = []
    for var in range(input_width):
        step = 1 << var
        depends = False
        for index in range(len(words)):
            if index & step:
                continue
            if ((words[index] >> bit) ^ (words[index | step] >> bit)) & 1:
                depends = True
                break
        if depends:
            support.append(var)
    return support


def run_case(case, benchmarks, relations_path):
    table = TruthTable(benchmarks / "{0}.truth".format(case))
    outputs = list(table.iter_outputs())
    components = components_from_relations(relations_path, case, table.output_width)
    encoded = []
    encoded_width = None
    conflicts = 0
    for output in outputs:
        value, width, conflict = pair_encoding(output, table.output_width, components)
        encoded.append(value)
        encoded_width = width
        if conflict:
            conflicts += 1
    pair_count_bits = []
    pair_count_width = 2 * (table.output_width // 2)
    for bit in range(pair_count_width):
        pair_count_bits.append(bit)
    if table.output_width & 1:
        pair_count_bits.append(pair_count_width)
    orient_start = pair_count_width + (1 if table.output_width & 1 else 0)
    orient_bits = list(range(orient_start, encoded_width))
    count_nodes = bdd_nodes_for_bits(encoded, table.input_width, pair_count_bits)
    orient_nodes = bdd_nodes_for_bits(encoded, table.input_width, orient_bits)
    all_nodes = bdd_nodes_for_bits(encoded, table.input_width, list(range(encoded_width)))
    field_rows = []
    for bit in range(encoded_width):
        support = support_for_bit(encoded, table.input_width, bit)
        if bit in orient_bits:
            kind = "orientation"
            index = bit - orient_start
        elif table.output_width & 1 and bit == pair_count_width:
            kind = "odd_tail"
            index = 0
        else:
            kind = "pair_count"
            index = bit // 2
        field_rows.append(
            {
                "case": case,
                "encoded_bit": bit,
                "field_kind": kind,
                "field_index": index,
                "support_size": len(support),
                "support": ":".join(str(item) for item in support),
                "ones": sum((word >> bit) & 1 for word in encoded),
                "notes": "raw input support for encoded output field",
            }
        )
    summary = {
        "case": case,
        "input_width": table.input_width,
        "output_width": table.output_width,
        "encoded_width": encoded_width,
        "components": ";".join(":".join(str(pair) for pair in comp) for comp in components),
        "component_count": len(components),
        "orientation_conflicts": conflicts,
        "encoded_all_bdd_nodes": all_nodes,
        "pair_count_bdd_nodes": count_nodes,
        "orientation_bdd_nodes": orient_nodes,
        "max_pair_count_support": max(int(row["support_size"]) for row in field_rows if row["field_kind"] in ("pair_count", "odd_tail")),
        "max_orientation_support": max([int(row["support_size"]) for row in field_rows if row["field_kind"] == "orientation"] or [0]),
        "notes": "component encoded output field split: pair counts versus orientation bits",
    }
    return summary, field_rows


def write_csv(path, fieldnames, rows):
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(rows)


def write_manifest(path, run_id, cases, work_dir, results_dir, relations):
    text = """# {0}

Run ID: `{0}`

Purpose: Split component-wise adjacent output-pair encoding into pair-count
fields and orientation fields, to identify whether either part is compact
enough to become a frontend source.

Inputs:
- Cases: `{1}`
- Relations: `{2}`
- Script: `student/generators/unknown_output_pair_component_field_diag.py`

Artifacts:
- Work directory: `{3}`
- Results directory: `{4}`
- Results: `results/summary.csv`, `results/field_support.csv`

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
    summaries = []
    fields = []
    for case in cases:
        summary, field_rows = run_case(case, args.benchmarks, args.relations)
        summaries.append(summary)
        fields.extend(field_rows)
    summary_fields = [
        "case",
        "input_width",
        "output_width",
        "encoded_width",
        "components",
        "component_count",
        "orientation_conflicts",
        "encoded_all_bdd_nodes",
        "pair_count_bdd_nodes",
        "orientation_bdd_nodes",
        "max_pair_count_support",
        "max_orientation_support",
        "notes",
    ]
    field_names = ["case", "encoded_bit", "field_kind", "field_index", "support_size", "support", "ones", "notes"]
    write_csv(args.results_dir / "summary.csv", summary_fields, summaries)
    write_csv(args.results_dir / "field_support.csv", field_names, fields)
    empty_fields = ["case", "candidate_id", "equivalent", "area", "delay", "adp", "notes"]
    write_csv(args.results_dir / "candidates.csv", empty_fields, [])
    write_csv(args.results_dir / "best.csv", empty_fields, [])
    write_csv(args.results_dir / "evaluate_check.csv", empty_fields, [])
    write_manifest(args.results_dir.parent / "MANIFEST.md", args.run_id, cases, args.work_dir, args.results_dir, args.relations)
    for row in summaries:
        print(
            "{case} count_nodes={pair_count_bdd_nodes} orient_nodes={orientation_bdd_nodes} max_support={max_pair_count_support}/{max_orientation_support}".format(
                **row
            )
        )
    print("rows={0} output={1}".format(len(summaries), args.results_dir / "summary.csv"))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
