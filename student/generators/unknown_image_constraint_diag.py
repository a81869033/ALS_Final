#!/usr/bin/env python3
"""Low-degree constraints satisfied by the output image of unknown cases."""

import argparse
import csv
import itertools
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


def image_vector(image, mono):
    vec = 0
    for row, value in enumerate(image):
        if mono == 0 or (value & mono) == mono:
            vec |= 1 << row
    return vec


def nullspace(vectors):
    basis = {}
    combos = {}
    relations = []
    for idx, vector in enumerate(vectors):
        value = vector
        combo = 1 << idx
        while value:
            pivot = value.bit_length() - 1
            old = basis.get(pivot)
            if old is None:
                basis[pivot] = value
                combos[pivot] = combo
                break
            value ^= old
            combo ^= combos[pivot]
        if value == 0:
            relations.append(combo)
    return relations, basis


def relation_text(combo, monos, width):
    terms = []
    for idx, mono in enumerate(monos):
        if not ((combo >> idx) & 1):
            continue
        if mono == 0:
            terms.append("1")
        else:
            terms.append("*".join("y{0}".format(bit) for bit in range(width) if (mono >> bit) & 1))
    return " ^ ".join(terms)


def run_case(case, benchmarks, degrees, max_relations):
    table = TruthTable(benchmarks / "{0}.truth".format(case))
    outputs = list(table.iter_outputs())
    image = sorted(set(outputs))
    width = table.output_width
    rows = []
    relation_rows = []
    for degree in degrees:
        monos = monomial_masks(width, degree)
        vectors = [image_vector(image, mono) for mono in monos]
        rels, basis = nullspace(vectors)
        rows.append(
            {
                "case": case,
                "degree": degree,
                "output_width": width,
                "image_size": len(image),
                "monomial_count": len(monos),
                "rank_on_image": len(basis),
                "constraint_nullity": len(rels),
                "notes": "GF(2) polynomial relations of degree<=target that vanish on output image",
            }
        )
        for idx, combo in enumerate(rels[:max_relations]):
            relation_rows.append(
                {
                    "case": case,
                    "degree": degree,
                    "relation_index": idx,
                    "term_count": popcount(combo),
                    "relation": relation_text(combo, monos, width),
                    "notes": "relation evaluates to zero on every unique output image value",
                }
            )
    return rows, relation_rows


def write_csv(path, fieldnames, rows):
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(rows)


def write_manifest(path, run_id, cases, work_dir, results_dir, degrees):
    text = """# {0}

Run ID: `{0}`

Purpose: Diagnose whether the output image of ex286-ex289 lies in a low-degree
GF(2) variety, which could imply a compact parameterized output source.

Inputs:
- Cases: `{1}`
- Truth files: `benchmarks/<case>.truth`
- Script: `student/generators/unknown_image_constraint_diag.py`

Artifacts:
- Work directory: `{2}`
- Results directory: `{3}`
- Results: `results/summary.csv`, `results/relations.csv`

Methods tried:
- Polynomial relations of degree `{4}` over unique output image points.

Notes:
- Diagnostic only; no Verilog/AIG candidates emitted.
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
    parser.add_argument("--max-relations", type=int, default=12)
    args = parser.parse_args(argv)

    cases = parse_cases(args.cases)
    degrees = [int(item) for item in parse_list(args.degrees)]
    rows = []
    relation_rows = []
    for case in cases:
        case_rows, case_relations = run_case(case, args.benchmarks, degrees, args.max_relations)
        rows.extend(case_rows)
        relation_rows.extend(case_relations)
    summary_fields = [
        "case",
        "degree",
        "output_width",
        "image_size",
        "monomial_count",
        "rank_on_image",
        "constraint_nullity",
        "notes",
    ]
    relation_fields = ["case", "degree", "relation_index", "term_count", "relation", "notes"]
    write_csv(args.results_dir / "summary.csv", summary_fields, rows)
    write_csv(args.results_dir / "relations.csv", relation_fields, relation_rows)
    empty_fields = ["case", "candidate_id", "equivalent", "area", "delay", "adp", "notes"]
    write_csv(args.results_dir / "candidates.csv", empty_fields, [])
    write_csv(args.results_dir / "best.csv", empty_fields, [])
    write_csv(args.results_dir / "evaluate_check.csv", empty_fields, [])
    write_manifest(args.results_dir.parent / "MANIFEST.md", args.run_id, cases, args.work_dir, args.results_dir, degrees)
    for case in cases:
        best = max([row for row in rows if row["case"] == case], key=lambda row: int(row["constraint_nullity"]))
        print(
            "{0} best degree={1} nullity={2} rank={3}/{4} image={5}".format(
                case,
                best["degree"],
                best["constraint_nullity"],
                best["rank_on_image"],
                best["monomial_count"],
                best["image_size"],
            )
        )
    print("rows={0} output={1}".format(len(rows), args.results_dir / "summary.csv"))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
