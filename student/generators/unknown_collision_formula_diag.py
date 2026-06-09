#!/usr/bin/env python3
"""Targeted collision/carry primitive diagnostics for conservative unknowns."""

import argparse
import csv
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


FIELDS = [
    "case",
    "output_bit",
    "primitive_count",
    "exact_kind",
    "exact_expr",
    "best_expr",
    "best_matches",
    "total_rows",
    "best_match_ratio",
    "notes",
]


def parse_cases(text):
    return [item.strip() for item in text.split(",") if item.strip()]


def predicate_mask(values, op, threshold):
    mask = 0
    for index, value in enumerate(values):
        if op == "ge":
            ok = value >= threshold
        elif op == "le":
            ok = value <= threshold
        elif op == "eq":
            ok = value == threshold
        else:
            raise RuntimeError("unknown op {0}".format(op))
        if ok:
            mask |= 1 << index
    return mask


def add_value_predicates(primitives, name, values):
    for threshold in range(min(values), max(values) + 1):
        for op, symbol in (("ge", ">="), ("le", "<="), ("eq", "==")):
            primitives.append(
                (
                    "{0}{1}{2}".format(name, symbol, threshold),
                    predicate_mask(values, op, threshold),
                )
            )


def dedup_primitives(primitives):
    seen = {}
    out = []
    for name, mask in primitives:
        if mask in seen:
            continue
        seen[mask] = name
        out.append((name, mask))
    return out


def target_masks(outputs, width):
    masks = []
    for bit in range(width):
        mask = 0
        for index, output in enumerate(outputs):
            if (output >> bit) & 1:
                mask |= 1 << index
        masks.append(mask)
    return masks


def match_score(mask, target, all_mask, rows):
    diff = mask ^ target
    return rows - bin(diff).count("1")


def build_primitives(case, outputs, width):
    buckets = bucket_info(onehot_slots(outputs, width))
    features = feature_candidates(case, width)
    rows_for_select = []
    for value, output in enumerate(outputs):
        rows_for_select.append(
            (
                bucket_counts(value, buckets),
                tuple(feature_value(feature, value) for feature in features),
                output,
            )
        )
    selected, _trace = greedy_selectors(rows_for_select, features, len(outputs), 8)
    counts_by_row = [bucket_counts(value, buckets) for value in range(len(outputs))]
    selectors_by_row = [
        [feature_value(features[index], value) for index in selected]
        for value in range(len(outputs))
    ]

    primitives = []
    bucket_names = ["c{0}_s{1}".format(index, bucket[0]) for index, bucket in enumerate(buckets)]
    for index, name in enumerate(bucket_names):
        values = [counts[index] for counts in counts_by_row]
        add_value_predicates(primitives, name, values)

    # Prefix/suffix and short windows are the natural carry-chain observables.
    bucket_count = len(buckets)
    for start in range(bucket_count):
        for stop in range(start + 1, bucket_count + 1):
            width_span = stop - start
            if start != 0 and stop != bucket_count and width_span > 4:
                continue
            name = "sum_c{0}_{1}".format(start, stop)
            values = [sum(counts[start:stop]) for counts in counts_by_row]
            add_value_predicates(primitives, name, values)

    for selector_index, feature_index in enumerate(selected):
        name = feature_name(features[feature_index])
        values = [selectors[selector_index] for selectors in selectors_by_row]
        add_value_predicates(primitives, name, values)

    # Carry-with-subtype terms catch patterns like "collision plus subtype bit".
    for bucket_index, bucket_name in enumerate(bucket_names):
        for selector_index, feature_index in enumerate(selected):
            selector_name = feature_name(features[feature_index])
            values = [
                counts[bucket_index] + selectors[selector_index]
                for counts, selectors in zip(counts_by_row, selectors_by_row)
            ]
            add_value_predicates(primitives, "{0}+{1}".format(bucket_name, selector_name), values)

    return dedup_primitives(primitives), buckets, [feature_name(features[index]) for index in selected]


def analyze_bit(target, primitives, all_mask, rows, top_pair_primitives):
    best_expr = ""
    best_matches = -1
    scored = []
    for name, mask in primitives:
        for expr, candidate in ((name, mask), ("!({0})".format(name), mask ^ all_mask)):
            score = match_score(candidate, target, all_mask, rows)
            scored.append((score, name, mask))
            if score > best_matches:
                best_matches = score
                best_expr = expr
            if candidate == target:
                return "primitive", expr, best_expr, best_matches

    scored.sort(reverse=True)
    pair_primitives = []
    seen = set()
    for _score, name, mask in scored:
        if mask in seen:
            continue
        seen.add(mask)
        pair_primitives.append((name, mask))
        if len(pair_primitives) >= top_pair_primitives:
            break

    for left_index, (left_name, left_mask) in enumerate(pair_primitives):
        for right_name, right_mask in pair_primitives[left_index + 1 :]:
            candidates = [
                ("({0})^({1})".format(left_name, right_name), left_mask ^ right_mask),
                ("({0})&({1})".format(left_name, right_name), left_mask & right_mask),
                ("({0})|({1})".format(left_name, right_name), left_mask | right_mask),
            ]
            for expr, candidate in candidates:
                score = match_score(candidate, target, all_mask, rows)
                if score > best_matches:
                    best_matches = score
                    best_expr = expr
                if candidate == target:
                    return "two_primitive", expr, best_expr, best_matches
                inv = candidate ^ all_mask
                inv_expr = "!({0})".format(expr)
                score = match_score(inv, target, all_mask, rows)
                if score > best_matches:
                    best_matches = score
                    best_expr = inv_expr
                if inv == target:
                    return "two_primitive", inv_expr, best_expr, best_matches

    return "", "", best_expr, best_matches


def run_case(case, benchmarks, top_pair_primitives):
    table = TruthTable(benchmarks / "{0}.truth".format(case))
    outputs = list(table.iter_outputs())
    width = table.output_width
    rows = len(outputs)
    all_mask = (1 << rows) - 1
    primitives, buckets, selectors = build_primitives(case, outputs, width)
    targets = target_masks(outputs, width)
    out_rows = []
    print(
        "{0} primitives={1} buckets={2} selectors={3}".format(
            case,
            len(primitives),
            ",".join(str(bucket[0]) for bucket in buckets),
            ":".join(selectors),
        ),
        flush=True,
    )
    for bit, target in enumerate(targets):
        exact_kind, exact_expr, best_expr, best_matches = analyze_bit(
            target, primitives, all_mask, rows, top_pair_primitives
        )
        print(
            "{0} bit{1} exact={2} best={3}/{4}".format(
                case, bit, exact_kind or "-", best_matches, rows
            ),
            flush=True,
        )
        out_rows.append(
            {
                "case": case,
                "output_bit": bit,
                "primitive_count": len(primitives),
                "exact_kind": exact_kind,
                "exact_expr": exact_expr,
                "best_expr": best_expr,
                "best_matches": best_matches,
                "total_rows": rows,
                "best_match_ratio": "{0:.6f}".format(best_matches / float(rows)),
                "notes": "bucket slots {0}; selectors {1}".format(
                    ":".join(str(bucket[0]) for bucket in buckets),
                    ":".join(selectors),
                ),
            }
        )
    return out_rows


def write_csv(path, rows):
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=FIELDS)
        writer.writeheader()
        writer.writerows(rows)


def write_empty_frontend_csvs(results_dir):
    fields = [
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
    for name in ("candidates.csv", "best.csv", "evaluate_check.csv"):
        with (results_dir / name).open("w", newline="") as handle:
            writer = csv.DictWriter(handle, fieldnames=fields)
            writer.writeheader()


def parse_args(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--cases", type=parse_cases, required=True)
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--results-dir", type=Path, required=True)
    parser.add_argument("--top-pair-primitives", type=int, default=80)
    return parser.parse_args(argv)


def main(argv=None):
    args = parse_args(argv)
    rows = []
    for case in args.cases:
        rows.extend(run_case(case, args.benchmarks, args.top_pair_primitives))
        write_csv(args.results_dir / "collision_formula_diagnostics.csv", rows)
    summary = []
    for case in args.cases:
        case_rows = [row for row in rows if row["case"] == case]
        exact_bits = [row["output_bit"] for row in case_rows if row["exact_kind"]]
        best_row = max(case_rows, key=lambda row: int(row["best_matches"]))
        summary.append(
            {
                "case": case,
                "output_bit": "summary",
                "primitive_count": best_row["primitive_count"],
                "exact_kind": "bits={0}".format(":".join(str(bit) for bit in exact_bits)),
                "exact_expr": "",
                "best_expr": best_row["best_expr"],
                "best_matches": best_row["best_matches"],
                "total_rows": best_row["total_rows"],
                "best_match_ratio": best_row["best_match_ratio"],
                "notes": "diagnostic-only; exact primitive bits {0}".format(
                    ":".join(str(bit) for bit in exact_bits)
                ),
            }
        )
    write_csv(args.results_dir / "summary.csv", summary)
    write_empty_frontend_csvs(args.results_dir)
    print("rows={0} results={1}".format(len(rows), args.results_dir))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
