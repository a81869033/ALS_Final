#!/usr/bin/env python3
"""Fixed-popcount slice polynomial diagnostics for conservative unknown cases."""

import argparse
import csv
import itertools
import math
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from student.frontends.truth import TruthTable
from student.generators.unknown_verilog_search import parse_cases


def parse_list(text):
    return [item.strip() for item in text.split(",") if item.strip()]


def popcount(value):
    return bin(value).count("1")


def monomial_masks(width, degree):
    masks = [0]
    for deg in range(1, degree + 1):
        for bits in itertools.combinations(range(width), deg):
            mask = 0
            for bit in bits:
                mask |= 1 << bit
            masks.append(mask)
    return masks


def layer_inputs(width, weight):
    values = []
    for bits in itertools.combinations(range(width), weight):
        value = 0
        for bit in bits:
            value |= 1 << bit
        values.append(value)
    return values


def basis_rank(vectors):
    basis = {}
    for vector in vectors:
        value = vector
        while value:
            pivot = value.bit_length() - 1
            old = basis.get(pivot)
            if old is None:
                basis[pivot] = value
                break
            value ^= old
    return basis


def in_span(value, basis):
    current = value
    while current:
        pivot = current.bit_length() - 1
        old = basis.get(pivot)
        if old is None:
            return False
        current ^= old
    return True


def feature_vectors(inputs, mono_masks):
    vectors = []
    for mono in mono_masks:
        bits = 0
        for row, value in enumerate(inputs):
            if mono == 0 or (value & mono) == mono:
                bits |= 1 << row
        vectors.append(bits)
    return vectors


def output_vectors(outputs, inputs, output_width):
    vectors = []
    for out_bit in range(output_width):
        bits = 0
        for row, value in enumerate(inputs):
            if (outputs[value] >> out_bit) & 1:
                bits |= 1 << row
        vectors.append(bits)
    return vectors


def run_case(case, benchmarks, degrees):
    table = TruthTable(benchmarks / "{0}.truth".format(case))
    if table.input_width != table.output_width:
        raise RuntimeError("{0}: width mismatch".format(case))
    width = table.input_width
    outputs = list(table.iter_outputs())
    rows = []
    for degree in degrees:
        mono_masks = monomial_masks(width, degree)
        for weight in range(width + 1):
            inputs = layer_inputs(width, weight)
            features = feature_vectors(inputs, mono_masks)
            basis = basis_rank(features)
            out_vecs = output_vectors(outputs, inputs, table.output_width)
            exact_bits = []
            for bit, vec in enumerate(out_vecs):
                if in_span(vec, basis):
                    exact_bits.append(bit)
            rows.append(
                {
                    "case": case,
                    "degree": degree,
                    "weight": weight,
                    "input_width": width,
                    "output_width": table.output_width,
                    "layer_rows": len(inputs),
                    "feature_count": len(mono_masks),
                    "feature_rank": len(basis),
                    "exact_bit_count": len(exact_bits),
                    "exact_bits": ":".join(str(bit) for bit in exact_bits),
                    "layer_all_bits_exact": "1" if len(exact_bits) == table.output_width else "0",
                    "notes": "output bits in span of monomials degree<={0} restricted to popcount layer".format(degree),
                }
            )
    return rows


def summarize(rows):
    out = []
    for case in sorted(set(row["case"] for row in rows)):
        case_rows = [row for row in rows if row["case"] == case]
        width = int(case_rows[0]["output_width"])
        for degree in sorted(set(int(row["degree"]) for row in case_rows)):
            deg_rows = [row for row in case_rows if int(row["degree"]) == degree]
            total_bit_layers = len(deg_rows) * width
            exact_bit_layers = sum(int(row["exact_bit_count"]) for row in deg_rows)
            all_layer_bits = sum(1 for row in deg_rows if row["layer_all_bits_exact"] == "1")
            bits_all_layers = []
            for bit in range(width):
                if all(str(bit) in row["exact_bits"].split(":") for row in deg_rows):
                    bits_all_layers.append(bit)
            out.append(
                {
                    "case": case,
                    "degree": degree,
                    "layers": len(deg_rows),
                    "exact_bit_layers": exact_bit_layers,
                    "total_bit_layers": total_bit_layers,
                    "exact_fraction": "{0:.6f}".format(exact_bit_layers / float(total_bit_layers)),
                    "all_bits_exact_layers": all_layer_bits,
                    "bits_exact_all_layers": ":".join(str(bit) for bit in bits_all_layers),
                    "max_feature_rank": max(int(row["feature_rank"]) for row in deg_rows),
                    "max_layer_rows": max(int(row["layer_rows"]) for row in deg_rows),
                    "feature_count": max(int(row["feature_count"]) for row in deg_rows),
                }
            )
    return out


def write_csv(path, fieldnames, rows):
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(rows)


def write_manifest(path, run_id, cases, work_dir, results_dir, degrees):
    text = """# {0}

Run ID: `{0}`

Purpose: Diagnose whether the Hamming-weight-preserving unknown functions are
low-degree polynomial maps on each fixed-popcount slice. This can expose layer
local structure that ordinary global ANF misses.

Inputs:
- Cases: `{1}`
- Truth files: `benchmarks/<case>.truth`
- Script: `student/generators/unknown_slice_poly_diag.py`

Artifacts:
- Work directory: `{2}`
- Results directory: `{3}`
- Results: `results/summary.csv`, `results/slice_detail.csv`

Methods tried:
- GF(2) span checks using all monomials of degree `<= {4}` restricted to each
  popcount layer.

Notes:
- Diagnostic only; no Verilog/AIG candidates emitted unless a compact exact
  slice model is found in a later run.
- `student/seeds` and `output/` are intentionally untouched.
""".format(
        run_id,
        ",".join(cases),
        work_dir,
        results_dir,
        ",".join(str(item) for item in degrees),
    )
    path.write_text(text)


def main(argv=None):
    parser = argparse.ArgumentParser()
    parser.add_argument("--cases", required=True)
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--run-id", required=True)
    parser.add_argument("--work-dir", type=Path, required=True)
    parser.add_argument("--results-dir", type=Path, required=True)
    parser.add_argument("--degrees", default="1,2,3")
    args = parser.parse_args(argv)

    cases = parse_cases(args.cases)
    degrees = [int(item) for item in parse_list(args.degrees)]
    rows = []
    for case in cases:
        rows.extend(run_case(case, args.benchmarks, degrees))
    detail_fields = [
        "case",
        "degree",
        "weight",
        "input_width",
        "output_width",
        "layer_rows",
        "feature_count",
        "feature_rank",
        "exact_bit_count",
        "exact_bits",
        "layer_all_bits_exact",
        "notes",
    ]
    summary_rows = summarize(rows)
    summary_fields = [
        "case",
        "degree",
        "layers",
        "exact_bit_layers",
        "total_bit_layers",
        "exact_fraction",
        "all_bits_exact_layers",
        "bits_exact_all_layers",
        "max_feature_rank",
        "max_layer_rows",
        "feature_count",
    ]
    write_csv(args.results_dir / "slice_detail.csv", detail_fields, rows)
    write_csv(args.results_dir / "summary.csv", summary_fields, summary_rows)
    empty_fields = ["case", "candidate_id", "equivalent", "area", "delay", "adp", "notes"]
    write_csv(args.results_dir / "candidates.csv", empty_fields, [])
    write_csv(args.results_dir / "best.csv", empty_fields, [])
    write_csv(args.results_dir / "evaluate_check.csv", empty_fields, [])
    write_manifest(args.results_dir.parent / "MANIFEST.md", args.run_id, cases, args.work_dir, args.results_dir, degrees)
    for case in cases:
        best = max(
            [row for row in summary_rows if row["case"] == case],
            key=lambda row: (float(row["exact_fraction"]), int(row["all_bits_exact_layers"])),
        )
        print(
            "{0} best degree={1} exact={2}/{3} all_layers={4} bits_all_layers={5}".format(
                case,
                best["degree"],
                best["exact_bit_layers"],
                best["total_bit_layers"],
                best["all_bits_exact_layers"],
                best["bits_exact_all_layers"],
            )
        )
    print("rows={0} output={1}".format(len(rows), args.results_dir / "summary.csv"))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
