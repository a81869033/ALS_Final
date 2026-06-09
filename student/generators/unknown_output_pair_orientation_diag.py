#!/usr/bin/env python3
"""Output adjacent-pair orientation diagnostics for conservative unknowns."""

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


def pair_encoding(value, width):
    encoded = 0
    pos = 0
    orient = -1
    conflict = False
    mixed = 0
    for bit in range(0, width - 1, 2):
        a = (value >> bit) & 1
        b = (value >> (bit + 1)) & 1
        count = a + b
        encoded |= count << pos
        pos += 2
        if count == 1:
            current = a
            mixed += 1
            if orient < 0:
                orient = current
            elif orient != current:
                conflict = True
    if width & 1:
        encoded |= ((value >> (width - 1)) & 1) << pos
        pos += 1
    if orient < 0:
        orient = 0
    encoded |= orient << pos
    pos += 1
    return encoded, pos, conflict, mixed


def decode_pair(encoded, width):
    pos = 0
    orient_pos = 2 * (width // 2) + (1 if width & 1 else 0)
    orient = (encoded >> orient_pos) & 1
    out = 0
    for bit in range(0, width - 1, 2):
        count = (encoded >> pos) & 3
        pos += 2
        if count == 1:
            if orient:
                out |= 1 << bit
            else:
                out |= 1 << (bit + 1)
        elif count == 2:
            out |= (1 << bit) | (1 << (bit + 1))
    if width & 1:
        if (encoded >> pos) & 1:
            out |= 1 << (width - 1)
    return out


def bdd_nodes(outputs, input_width, output_width):
    order = interleave_order(input_width)
    builder = SharedBddBuilder(order)
    for bit in range(output_width):
        builder.build(permute_plane(plane_for_outputs(outputs, bit), order), 0)
    return len(builder.nodes)


def run_case(case, benchmarks):
    table = TruthTable(benchmarks / "{0}.truth".format(case))
    outputs = list(table.iter_outputs())
    width = table.output_width
    encoded_outputs = []
    conflicts = 0
    mixed_hist = {}
    first_conflict = ""
    encoded_width = None
    decode_bad = 0
    for index, output in enumerate(outputs):
        encoded, enc_width, conflict, mixed = pair_encoding(output, width)
        encoded_width = enc_width
        encoded_outputs.append(encoded)
        mixed_hist[mixed] = mixed_hist.get(mixed, 0) + 1
        if conflict:
            conflicts += 1
            if not first_conflict:
                first_conflict = "x=0x{0:x};out=0x{1:x};encoded=0x{2:x}".format(index, output, encoded)
        if decode_pair(encoded, width) != output:
            decode_bad += 1
    unique_outputs = len(set(outputs))
    unique_encoded = len(set(encoded_outputs))
    raw_nodes = bdd_nodes(outputs, table.input_width, width)
    encoded_nodes = bdd_nodes(encoded_outputs, table.input_width, encoded_width)
    return {
        "case": case,
        "input_width": table.input_width,
        "output_width": width,
        "encoded_width": encoded_width,
        "truth_rows": len(outputs),
        "unique_outputs": unique_outputs,
        "unique_encoded": unique_encoded,
        "orientation_conflicts": conflicts,
        "decode_bad": decode_bad,
        "mixed_pair_hist": ";".join("m{0}:{1}".format(k, mixed_hist[k]) for k in sorted(mixed_hist)),
        "raw_bdd_nodes": raw_nodes,
        "encoded_bdd_nodes": encoded_nodes,
        "node_delta": encoded_nodes - raw_nodes,
        "node_ratio": "{0:.6f}".format(encoded_nodes / float(raw_nodes) if raw_nodes else 0.0),
        "first_conflict": first_conflict,
        "notes": "adjacent output pairs encoded as count plus one shared mixed-pair orientation bit",
    }


def write_csv(path, fieldnames, rows):
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(rows)


def write_manifest(path, run_id, cases, work_dir, results_dir):
    text = """# {0}

Run ID: `{0}`

Purpose: Test whether low-degree image constraints imply a compact adjacent
output-pair encoding: per-pair population count plus a shared orientation bit
for all mixed adjacent pairs.

Inputs:
- Cases: `{1}`
- Truth files: `benchmarks/<case>.truth`
- Script: `student/generators/unknown_output_pair_orientation_diag.py`

Artifacts:
- Work directory: `{2}`
- Results directory: `{3}`
- Results: `results/summary.csv`

Notes:
- Diagnostic only; no Verilog/AIG candidates emitted.
- `student/seeds` and `output/` are intentionally untouched.
""".format(run_id, ",".join(cases), work_dir, results_dir)
    path.write_text(text)


def main(argv=None):
    parser = argparse.ArgumentParser()
    parser.add_argument("--cases", required=True)
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--run-id", required=True)
    parser.add_argument("--work-dir", type=Path, required=True)
    parser.add_argument("--results-dir", type=Path, required=True)
    args = parser.parse_args(argv)

    cases = parse_cases(args.cases)
    rows = [run_case(case, args.benchmarks) for case in cases]
    fields = [
        "case",
        "input_width",
        "output_width",
        "encoded_width",
        "truth_rows",
        "unique_outputs",
        "unique_encoded",
        "orientation_conflicts",
        "decode_bad",
        "mixed_pair_hist",
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
    write_manifest(args.results_dir.parent / "MANIFEST.md", args.run_id, cases, args.work_dir, args.results_dir)
    for row in rows:
        print(
            "{case} conflicts={orientation_conflicts} raw_nodes={raw_bdd_nodes} encoded_nodes={encoded_bdd_nodes} ratio={node_ratio}".format(
                **row
            )
        )
    print("rows={0} output={1}".format(len(rows), args.results_dir / "summary.csv"))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
