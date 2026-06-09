#!/usr/bin/env python3
"""Feature-span diagnostics for mod-4 output lane parity coordinates."""

import argparse
import csv
import itertools
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from student.frontends.truth import TruthTable
from student.generators.unknown_bucket_count_classifier import (
    bucket_counts,
    bucket_info,
    feature_candidates,
    feature_name,
    feature_value,
    greedy_selectors,
    onehot_slots,
)
from student.generators.unknown_verilog_search import parse_cases


def parse_list(text):
    return [item.strip() for item in text.split(",") if item.strip()]


def popcount(value):
    return bin(value).count("1")


def parity(value):
    return popcount(value) & 1


def count_bits(count, width):
    return [(count >> bit) & 1 for bit in range(width)]


def count_width(max_value):
    width = 1
    while (1 << width) <= max_value:
        width += 1
    return width


def exact_pairs(case):
    return {
        "ex286": [(4, 5), (6, 7)],
        "ex287": [(4, 5), (6, 7), (8, 9)],
        "ex288": [(4, 5), (6, 7), (8, 9)],
        "ex289": [(4, 5), (6, 7), (8, 9), (10, 11)],
    }.get(case, [])


def feature_rows(case, width, outputs, set_name):
    onehot = onehot_slots(outputs, width)
    rows = []
    names = []
    if set_name == "input_lane_parity":
        names = ["in_lane{0}_parity".format(lane) for lane in range(4)]
        for value in range(1 << width):
            rows.append(tuple(parity(value & lane_mask(width, lane)) for lane in range(4)))
    elif set_name == "home_lane_parity":
        names = ["home_lane{0}_parity".format(lane) for lane in range(4)]
        groups = [[bit for bit, slot in enumerate(onehot) if slot % 4 == lane] for lane in range(4)]
        for value in range(1 << width):
            rows.append(tuple(parity(sum(((value >> bit) & 1) for bit in group)) for group in groups))
    elif set_name == "home_lane_count_bits":
        groups = [[bit for bit, slot in enumerate(onehot) if slot % 4 == lane] for lane in range(4)]
        widths = [count_width(len(group)) for group in groups]
        for lane, bits in enumerate(widths):
            names.extend("home_lane{0}_cnt{1}".format(lane, bit) for bit in range(bits))
        for value in range(1 << width):
            row = []
            for group, bits in zip(groups, widths):
                count = sum(((value >> bit) & 1) for bit in group)
                row.extend(count_bits(count, bits))
            rows.append(tuple(row))
    elif set_name == "raw_pair_signals":
        pairs = exact_pairs(case)
        paired = set(bit for pair in pairs for bit in pair)
        for left, right in pairs:
            names.extend(["xor{0}_{1}".format(left, right), "and{0}_{1}".format(left, right), "or{0}_{1}".format(left, right)])
        names.extend("raw{0}".format(bit) for bit in range(width) if bit not in paired)
        for value in range(1 << width):
            row = []
            for left, right in pairs:
                a = (value >> left) & 1
                b = (value >> right) & 1
                row.extend([a ^ b, a & b, a | b])
            row.extend((value >> bit) & 1 for bit in range(width) if bit not in paired)
            rows.append(tuple(row))
    elif set_name == "bucket_count_bits":
        buckets = bucket_info(onehot)
        for index, (_slot, members, _bits) in enumerate(buckets):
            for bit in range(count_width(len(members))):
                names.append("bucket{0}_cnt{1}".format(index, bit))
        for value in range(1 << width):
            row = []
            counts = bucket_counts(value, buckets)
            for count, (_slot, members, _bits) in zip(counts, buckets):
                row.extend(count_bits(count, count_width(len(members))))
            rows.append(tuple(row))
    elif set_name == "bucket_count_bits_selectors":
        buckets = bucket_info(onehot)
        features = feature_candidates(case, width)
        base_rows = []
        for value, output in enumerate(outputs):
            base_rows.append(
                (
                    bucket_counts(value, buckets),
                    tuple(feature_value(feature, value) for feature in features),
                    output,
                )
            )
        selected, _trace = greedy_selectors(base_rows, features, len(outputs), 8)
        for index, (_slot, members, _bits) in enumerate(buckets):
            for bit in range(count_width(len(members))):
                names.append("bucket{0}_cnt{1}".format(index, bit))
        names.extend("sel_{0}".format(feature_name(features[index])) for index in selected)
        for value in range(1 << width):
            row = []
            counts = bucket_counts(value, buckets)
            for count, (_slot, members, _bits) in zip(counts, buckets):
                row.extend(count_bits(count, count_width(len(members))))
            row.extend(feature_value(features[index], value) for index in selected)
            rows.append(tuple(row))
    else:
        raise RuntimeError("unknown feature set {0}".format(set_name))
    return names, rows


def lane_mask(width, lane):
    mask = 0
    for bit in range(width):
        if bit % 4 == lane:
            mask |= 1 << bit
    return mask


def target_vector(outputs, width, lane):
    mask = lane_mask(width, lane)
    vec = 0
    for row, output in enumerate(outputs):
        if parity(output & mask):
            vec |= 1 << row
    return vec


def monomial_vector(feature_values, mono):
    vec = 0
    for row, values in enumerate(feature_values):
        ok = True
        for bit in range(len(values)):
            if (mono >> bit) & 1 and not values[bit]:
                ok = False
                break
        if ok:
            vec |= 1 << row
    return vec


def build_basis(vectors):
    basis = {}
    combos = {}
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
    return basis, combos


def solve_span(target, basis, combos):
    value = target
    combo = 0
    while value:
        pivot = value.bit_length() - 1
        old = basis.get(pivot)
        if old is None:
            return False, 0
        value ^= old
        combo ^= combos[pivot]
    return True, combo


def monomial_masks(feature_count, degree):
    masks = [0]
    for deg in range(1, degree + 1):
        for bits in itertools.combinations(range(feature_count), deg):
            mask = 0
            for bit in bits:
                mask |= 1 << bit
            masks.append(mask)
    return masks


def run_case(case, benchmarks, feature_sets, degrees):
    table = TruthTable(benchmarks / "{0}.truth".format(case))
    outputs = list(table.iter_outputs())
    rows = []
    for set_name in feature_sets:
        names, values = feature_rows(case, table.input_width, outputs, set_name)
        for degree in degrees:
            if len(names) > 24 and degree >= 3:
                rows.append(
                    {
                        "case": case,
                        "feature_set": set_name,
                        "degree": degree,
                        "lane": "all",
                        "feature_count": len(names),
                        "monomial_count": "",
                        "exact": "skip",
                        "solution_terms": "",
                        "solution": "",
                        "notes": "skipped large monomial set",
                    }
                )
                continue
            monos = monomial_masks(len(names), degree)
            vectors = [monomial_vector(values, mono) for mono in monos]
            basis, combos = build_basis(vectors)
            for lane in range(4):
                target = target_vector(outputs, table.output_width, lane)
                exact, combo = solve_span(target, basis, combos)
                solution = []
                if exact:
                    for idx, mono in enumerate(monos):
                        if (combo >> idx) & 1:
                            if mono == 0:
                                solution.append("1")
                            else:
                                solution.append("*".join(names[bit] for bit in range(len(names)) if (mono >> bit) & 1))
                rows.append(
                    {
                        "case": case,
                        "feature_set": set_name,
                        "degree": degree,
                        "lane": lane,
                        "feature_count": len(names),
                        "monomial_count": len(monos),
                        "exact": "1" if exact else "0",
                        "solution_terms": len(solution) if exact else "",
                        "solution": ";".join(solution[:80]),
                        "notes": "lane parity in feature monomial span",
                    }
                )
    return rows


def write_csv(path, fieldnames, rows):
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(rows)


def write_manifest(path, run_id, cases, work_dir, results_dir, feature_sets, degrees):
    text = """# {0}

Run ID: `{0}`

Purpose: Diagnose whether the mod-4 output lane parity coordinates found by
output-linear ANF can be expressed using cheaper semantic feature sets.

Inputs:
- Cases: `{1}`
- Truth files: `benchmarks/<case>.truth`
- Script: `student/generators/unknown_lane_parity_feature_diag.py`

Artifacts:
- Work directory: `{2}`
- Results directory: `{3}`
- Results: `results/summary.csv`

Methods tried:
- Feature sets: `{4}`
- Monomial degrees: `{5}`

Notes:
- Diagnostic only; no Verilog/AIG candidates emitted.
- `student/seeds` and `output/` are intentionally untouched.
""".format(
        run_id,
        ",".join(cases),
        work_dir,
        results_dir,
        ",".join(feature_sets),
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
    parser.add_argument("--feature-sets", default="input_lane_parity,home_lane_parity,home_lane_count_bits,raw_pair_signals,bucket_count_bits,bucket_count_bits_selectors")
    parser.add_argument("--degrees", default="1,2")
    args = parser.parse_args(argv)

    cases = parse_cases(args.cases)
    feature_sets = parse_list(args.feature_sets)
    degrees = [int(item) for item in parse_list(args.degrees)]
    rows = []
    for case in cases:
        rows.extend(run_case(case, args.benchmarks, feature_sets, degrees))
    fields = [
        "case",
        "feature_set",
        "degree",
        "lane",
        "feature_count",
        "monomial_count",
        "exact",
        "solution_terms",
        "solution",
        "notes",
    ]
    write_csv(args.results_dir / "summary.csv", fields, rows)
    empty_fields = ["case", "candidate_id", "equivalent", "area", "delay", "adp", "notes"]
    write_csv(args.results_dir / "candidates.csv", empty_fields, [])
    write_csv(args.results_dir / "best.csv", empty_fields, [])
    write_csv(args.results_dir / "evaluate_check.csv", empty_fields, [])
    write_manifest(args.results_dir.parent / "MANIFEST.md", args.run_id, cases, args.work_dir, args.results_dir, feature_sets, degrees)
    for case in cases:
        exact_rows = [row for row in rows if row["case"] == case and row["exact"] == "1"]
        best = sorted(exact_rows, key=lambda row: (int(row["degree"]), int(row["solution_terms"] or 999999)))[:4]
        print("{0} exact={1} best={2}".format(case, len(exact_rows), ";".join("{0}/d{1}/lane{2}/terms{3}".format(row["feature_set"], row["degree"], row["lane"], row["solution_terms"]) for row in best)))
    print("rows={0} output={1}".format(len(rows), args.results_dir / "summary.csv"))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
