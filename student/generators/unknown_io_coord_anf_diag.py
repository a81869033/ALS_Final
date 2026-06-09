#!/usr/bin/env python3
"""Input/output coordinate ANF diagnostics for conservative unknown cases."""

import argparse
import csv
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from student.frontends.truth import TruthTable
from student.generators.unknown_bucket_count_classifier import onehot_slots


SUMMARY_FIELDS = [
    "case",
    "input_coord",
    "output_coord",
    "degree",
    "exact_bits",
    "total_bits",
    "total_terms",
    "low_degree_terms",
    "max_degree",
    "bit_term_counts",
    "bit_degrees",
    "notes",
]

EMPTY_FRONTEND_FIELDS = [
    "case",
    "candidate_id",
    "hypothesis",
    "variant",
    "verilog_path",
    "aig_path",
    "verified_truth",
    "equivalent",
    "area",
    "delay",
    "adp",
    "notes",
]


def parse_cases(text):
    out = []
    for item in text.split(","):
        item = item.strip()
        if not item:
            continue
        if "-" in item:
            left, right = item.split("-", 1)
            prefix = left[:2]
            start = int(left[2:])
            end = int(right[2:] if right.startswith(prefix) else right)
            out.extend("{0}{1:03d}".format(prefix, value) for value in range(start, end + 1))
        else:
            out.append(item)
    return out


def popcount(value):
    return bin(value).count("1")


def bit_reverse(value, width):
    out = 0
    for bit in range(width):
        if (value >> bit) & 1:
            out |= 1 << (width - 1 - bit)
    return out


def order_by_name(width, outputs, name):
    bits = list(range(width))
    if name == "natural":
        return bits
    if name == "reverse":
        return list(reversed(bits))
    if name == "onehot":
        slots = onehot_slots(outputs, width)
        return sorted(bits, key=lambda bit: (slots[bit], bit))
    if name == "onehot_rev":
        slots = onehot_slots(outputs, width)
        return sorted(bits, key=lambda bit: (-slots[bit], bit))
    raise RuntimeError("unknown order {0}".format(name))


def coord_transform(value, width, outputs, name):
    if name == "raw":
        return value
    if name == "reverse_bits":
        return bit_reverse(value, width)
    if name.startswith("prefix_") or name.startswith("suffix_"):
        kind, order_name = name.split("_", 1)
        order = order_by_name(width, outputs, order_name)
        iterable = order if kind == "prefix" else list(reversed(order))
        temp = {}
        acc = 0
        for bit in iterable:
            acc ^= (value >> bit) & 1
            temp[bit] = acc
        out = 0
        for bit in range(width):
            if temp[bit]:
                out |= 1 << bit
        return out
    if name.startswith("gray_"):
        order_name = name.split("_", 1)[1]
        order = order_by_name(width, outputs, order_name)
        out = 0
        prev = 0
        for bit in order:
            current = (value >> bit) & 1
            if current ^ prev:
                out |= 1 << bit
            prev = current
        return out
    raise RuntimeError("unknown coordinate transform {0}".format(name))


def transformed_table(outputs, width, input_coord, output_coord):
    values = [0] * len(outputs)
    seen = [False] * len(outputs)
    for index, output in enumerate(outputs):
        tx = coord_transform(index, width, outputs, input_coord)
        ty = coord_transform(output, width, outputs, output_coord)
        if seen[tx]:
            raise RuntimeError("input coordinate is not bijective: {0}".format(input_coord))
        seen[tx] = True
        values[tx] = ty
    return values


def anf_coefficients(bit_values, width):
    coeffs = list(bit_values)
    for pos in range(width):
        step = 1 << pos
        for mask in range(1 << width):
            if mask & step:
                coeffs[mask] ^= coeffs[mask ^ step]
    return coeffs


def degree_profile(coeffs):
    term_count = 0
    max_degree = 0
    degree_counts = {}
    for mask, coeff in enumerate(coeffs):
        if not coeff:
            continue
        degree = popcount(mask)
        term_count += 1
        max_degree = max(max_degree, degree)
        degree_counts[degree] = degree_counts.get(degree, 0) + 1
    return term_count, max_degree, degree_counts


def run_case(case, benchmarks, input_coords, output_coords, degrees):
    table = TruthTable(benchmarks / "{0}.truth".format(case))
    outputs = list(table.iter_outputs())
    width = table.input_width
    rows = []
    for input_coord in input_coords:
        for output_coord in output_coords:
            transformed = transformed_table(outputs, width, input_coord, output_coord)
            profiles = []
            total_terms = 0
            max_degree = 0
            bit_term_counts = []
            bit_degrees = []
            for bit in range(width):
                bit_values = [((value >> bit) & 1) for value in transformed]
                coeffs = anf_coefficients(bit_values, width)
                term_count, bit_degree, degree_counts = degree_profile(coeffs)
                profiles.append((term_count, bit_degree, degree_counts))
                total_terms += term_count
                max_degree = max(max_degree, bit_degree)
                bit_term_counts.append(term_count)
                bit_degrees.append(bit_degree)
            for degree in degrees:
                exact_bits = 0
                low_terms = 0
                for term_count, bit_degree, degree_counts in profiles:
                    low_terms += sum(count for deg, count in degree_counts.items() if deg <= degree)
                    if bit_degree <= degree:
                        exact_bits += 1
                rows.append(
                    {
                        "case": case,
                        "input_coord": input_coord,
                        "output_coord": output_coord,
                        "degree": degree,
                        "exact_bits": exact_bits,
                        "total_bits": width,
                        "total_terms": total_terms,
                        "low_degree_terms": low_terms,
                        "max_degree": max_degree,
                        "bit_term_counts": ":".join(str(item) for item in bit_term_counts),
                        "bit_degrees": ":".join(str(item) for item in bit_degrees),
                        "notes": "output-coordinate ANF over transformed input coordinates",
                    }
                )
    rows.sort(
        key=lambda row: (
            int(row["exact_bits"]),
            -int(row["total_terms"]),
            -int(row["max_degree"]),
            int(row["low_degree_terms"]),
        ),
        reverse=True,
    )
    print(
        "{0}: best deg{1} exact_bits={2}/{3} coords={4}->{5} terms={6}".format(
            case,
            rows[0]["degree"],
            rows[0]["exact_bits"],
            rows[0]["total_bits"],
            rows[0]["input_coord"],
            rows[0]["output_coord"],
            rows[0]["total_terms"],
        ),
        flush=True,
    )
    return rows[:120]


def write_csv(path, fields, rows):
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields)
        writer.writeheader()
        writer.writerows(rows)


def write_empty_frontend_csvs(results_dir):
    for name in ("candidates.csv", "best.csv", "evaluate_check.csv"):
        write_csv(results_dir / name, EMPTY_FRONTEND_FIELDS, [])


def write_manifest(run_dir, run_id, cases, input_coords, output_coords, degrees):
    text = """# {0}

Run ID: `{0}`

Purpose: Diagnostic-only input/output coordinate ANF search for ex286-ex289.
This checks whether applying linear prefix/suffix/Gray-like transforms to both
input and output exposes low-degree exact output-coordinate bits, similar to the
kind of coordinate collapse that enabled ex280-ex284 compressor sources.

Inputs:
- Truth files: {1}
- Script: `student/generators/unknown_io_coord_anf_diag.py`
- Input coords: `{2}`
- Output coords: `{3}`
- Degrees: `{4}`

Artifacts:
- Results directory: `student/runs/unknown/{0}/results/`
- Summary CSV: `results/summary.csv`
- Empty frontend CSVs: `results/candidates.csv`, `results/best.csv`, `results/evaluate_check.csv`

Best result:
- Diagnostic only; no Verilog/AIG candidates generated.

Notes:
- `student/seeds` and `output/` are intentionally untouched.
""".format(
        run_id,
        ", ".join("benchmarks/{0}.truth".format(case) for case in cases),
        ",".join(input_coords),
        ",".join(output_coords),
        ",".join(str(item) for item in degrees),
    )
    (run_dir / "MANIFEST.md").write_text(text)


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--cases", type=parse_cases, default=parse_cases("ex286-ex289"))
    parser.add_argument("--run-id", required=True)
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument(
        "--input-coords",
        type=parse_cases,
        default=parse_cases("raw,reverse_bits,prefix_natural,suffix_natural,prefix_reverse,suffix_reverse,prefix_onehot,suffix_onehot,gray_natural,gray_reverse"),
    )
    parser.add_argument(
        "--output-coords",
        type=parse_cases,
        default=parse_cases("raw,reverse_bits,prefix_natural,suffix_natural,prefix_reverse,suffix_reverse,prefix_onehot,suffix_onehot,gray_natural,gray_reverse"),
    )
    parser.add_argument("--degrees", type=parse_cases, default=parse_cases("1,2,3,4"))
    args = parser.parse_args(argv)

    degrees = [int(item) for item in args.degrees]
    run_dir = ROOT / "student" / "runs" / "unknown" / args.run_id
    results_dir = run_dir / "results"
    rows = []
    for case in args.cases:
        rows.extend(run_case(case, args.benchmarks, args.input_coords, args.output_coords, degrees))
        write_csv(results_dir / "summary.csv", SUMMARY_FIELDS, rows)
    write_empty_frontend_csvs(results_dir)
    write_manifest(run_dir, args.run_id, args.cases, args.input_coords, args.output_coords, degrees)
    print("Results: {0}".format(results_dir))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
