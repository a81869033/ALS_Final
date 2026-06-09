#!/usr/bin/env python3
"""Arbitrary output-linear-coordinate ANF diagnostics for unknown cases."""

import argparse
import csv
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


def parity(value):
    return popcount(value) & 1


def mobius_word(outputs, input_width):
    coeffs = list(outputs)
    size = 1 << input_width
    for bit in range(input_width):
        step = 1 << bit
        for base in range(0, size, step << 1):
            for offset in range(step):
                high = base + step + offset
                coeffs[high] ^= coeffs[base + offset]
    return coeffs


def row_basis(rows):
    basis = {}
    for row in rows:
        value = row
        while value:
            pivot = value.bit_length() - 1
            old = basis.get(pivot)
            if old is None:
                basis[pivot] = value
                break
            value ^= old
    return basis


def nullspace_basis(rows, width):
    basis = row_basis(rows)
    pivots = set(basis)
    free = [bit for bit in range(width) if bit not in pivots]
    out = []
    for free_bit in free:
        vector = 1 << free_bit
        changed = True
        while changed:
            changed = False
            for pivot, row in sorted(basis.items()):
                if parity(vector & row):
                    vector ^= 1 << pivot
                    changed = True
        out.append(vector)
    return out, basis


def degree_term_stats(coeffs, output_mask):
    terms = 0
    max_degree = -1
    degree_hist = {}
    for mono, coeff_vector in enumerate(coeffs):
        if parity(coeff_vector & output_mask):
            terms += 1
            degree = popcount(mono)
            max_degree = max(max_degree, degree)
            degree_hist[degree] = degree_hist.get(degree, 0) + 1
    return terms, max_degree, degree_hist


def run_case(case, benchmarks, degrees):
    table = TruthTable(benchmarks / "{0}.truth".format(case))
    outputs = list(table.iter_outputs())
    coeffs = mobius_word(outputs, table.input_width)
    rows = []
    basis_rows = []
    nonzero_by_degree = {}
    for mono, coeff in enumerate(coeffs):
        if coeff:
            degree = popcount(mono)
            nonzero_by_degree[degree] = nonzero_by_degree.get(degree, 0) + 1
    for degree in degrees:
        high_rows = [coeff for mono, coeff in enumerate(coeffs) if popcount(mono) > degree and coeff]
        null_basis, high_basis = nullspace_basis(high_rows, table.output_width)
        basis_terms = []
        basis_degrees = []
        basis_masks = []
        for vector in null_basis:
            terms, max_degree, hist = degree_term_stats(coeffs, vector)
            basis_terms.append(terms)
            basis_degrees.append(max_degree)
            basis_masks.append("0x{0:x}".format(vector))
            basis_rows.append(
                {
                    "case": case,
                    "target_degree": degree,
                    "basis_mask": "0x{0:x}".format(vector),
                    "basis_popcount": popcount(vector),
                    "terms": terms,
                    "actual_degree": max_degree,
                    "degree_hist": ";".join("d{0}:{1}".format(k, hist[k]) for k in sorted(hist)),
                    "notes": "output XOR coordinate in nullspace of high-degree ANF coefficients",
                }
            )
        rows.append(
            {
                "case": case,
                "input_width": table.input_width,
                "output_width": table.output_width,
                "target_degree": degree,
                "high_coeff_rows": len(high_rows),
                "high_coeff_rank": len(high_basis),
                "low_degree_nullity": len(null_basis),
                "basis_masks": ":".join(basis_masks),
                "basis_term_counts": ":".join(str(item) for item in basis_terms),
                "basis_actual_degrees": ":".join(str(item) for item in basis_degrees),
                "nonzero_coeffs_by_degree": ";".join(
                    "d{0}:{1}".format(k, nonzero_by_degree[k]) for k in sorted(nonzero_by_degree)
                ),
                "notes": "dimension of output-linear coordinates with ANF degree <= target_degree",
            }
        )
    return rows, basis_rows


def write_csv(path, fieldnames, rows):
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(rows)


def write_manifest(path, run_id, cases, work_dir, results_dir, degrees):
    text = """# {0}

Run ID: `{0}`

Purpose: Diagnose whether ex286-ex289 have a hidden low-degree ANF basis after
an arbitrary linear transform of output bits. This is stronger than testing
fixed raw/prefix/reverse output coordinates.

Inputs:
- Cases: `{1}`
- Truth files: `benchmarks/<case>.truth`
- Script: `student/generators/unknown_output_linear_anf_diag.py`

Artifacts:
- Work directory: `{2}`
- Results directory: `{3}`
- Results: `results/summary.csv`, `results/basis.csv`

Methods tried:
- Word-level Mobius transform of the multi-output truth table.
- Nullspace of all output coefficient vectors above each target degree `{4}`.

Notes:
- Diagnostic only; no Verilog/AIG candidates emitted unless a high-dimensional
  low-degree output basis appears in a later run.
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
    parser.add_argument("--degrees", default="1,2,3,4")
    args = parser.parse_args(argv)

    cases = parse_cases(args.cases)
    degrees = [int(item) for item in parse_list(args.degrees)]
    rows = []
    basis_rows = []
    for case in cases:
        case_rows, case_basis = run_case(case, args.benchmarks, degrees)
        rows.extend(case_rows)
        basis_rows.extend(case_basis)
    summary_fields = [
        "case",
        "input_width",
        "output_width",
        "target_degree",
        "high_coeff_rows",
        "high_coeff_rank",
        "low_degree_nullity",
        "basis_masks",
        "basis_term_counts",
        "basis_actual_degrees",
        "nonzero_coeffs_by_degree",
        "notes",
    ]
    basis_fields = [
        "case",
        "target_degree",
        "basis_mask",
        "basis_popcount",
        "terms",
        "actual_degree",
        "degree_hist",
        "notes",
    ]
    write_csv(args.results_dir / "summary.csv", summary_fields, rows)
    write_csv(args.results_dir / "basis.csv", basis_fields, basis_rows)
    empty_fields = ["case", "candidate_id", "equivalent", "area", "delay", "adp", "notes"]
    write_csv(args.results_dir / "candidates.csv", empty_fields, [])
    write_csv(args.results_dir / "best.csv", empty_fields, [])
    write_csv(args.results_dir / "evaluate_check.csv", empty_fields, [])
    write_manifest(args.results_dir.parent / "MANIFEST.md", args.run_id, cases, args.work_dir, args.results_dir, degrees)
    for case in cases:
        best = max([row for row in rows if row["case"] == case], key=lambda row: int(row["low_degree_nullity"]))
        print(
            "{0} best degree={1} nullity={2}/{3} rank={4} basis={5}".format(
                case,
                best["target_degree"],
                best["low_degree_nullity"],
                best["output_width"],
                best["high_coeff_rank"],
                best["basis_masks"],
            )
        )
    print("rows={0} output={1}".format(len(rows), args.results_dir / "summary.csv"))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
