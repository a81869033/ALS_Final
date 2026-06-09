#!/usr/bin/env python3
"""Low-dimensional bucket-count moment diagnostics for ex286-ex289.

The exact bucket-count classifiers prove that bucket counts plus a few selector
bits determine the output, but direct key tables are far too large.  This
diagnostic tests whether the exact key collapses under compact integer
coordinates: moments, residues, prefix moments, and small mixed selector
coordinates.  A compact exact coordinate set would be a high-leverage frontend
source; otherwise this excludes another table-decomposition route.
"""

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
    parse_cases,
)


FIELDS = [
    "case",
    "family",
    "feature_set",
    "feature_count",
    "key_count",
    "matches",
    "total_rows",
    "exact",
    "max_conflict",
    "notes",
]


def popcount(value):
    return bin(value).count("1")


def majority_stats(outputs, keys):
    buckets = {}
    for key, output in zip(keys, outputs):
        hist = buckets.setdefault(key, {})
        hist[output] = hist.get(output, 0) + 1
    matches = 0
    max_conflict = 0
    for hist in buckets.values():
        total = sum(hist.values())
        best = max(hist.values())
        matches += best
        max_conflict = max(max_conflict, total - best)
    return matches, len(buckets), max_conflict


def count_rows(width, buckets, all_features, selected):
    rows = []
    for value in range(1 << width):
        counts = bucket_counts(value, buckets)
        selectors = tuple(feature_value(all_features[index], value) for index in selected)
        rows.append((counts, selectors))
    return rows


def count_width(max_value):
    width = 0
    value = 1
    while value <= max_value:
        value <<= 1
        width += 1
    return max(width, 1)


def weights_for(bucket_count):
    indices = list(range(bucket_count))
    return {
        "lin": [i + 1 for i in indices],
        "revlin": [bucket_count - i for i in indices],
        "quad": [(i + 1) * (i + 1) for i in indices],
        "tri": [(i + 1) * (i + 2) // 2 for i in indices],
        "alt": [1 if i % 2 == 0 else -1 for i in indices],
        "center": [2 * i - bucket_count + 1 for i in indices],
    }


def scalar_features(counts, selectors):
    bucket_count = len(counts)
    weights = weights_for(bucket_count)
    out = []
    total = sum(counts)
    out.append(("total", total))
    out.append(("sumsq", sum(value * value for value in counts)))
    out.append(("nonzero", sum(1 for value in counts if value)))
    out.append(("oddmask", sum((count & 1) << index for index, count in enumerate(counts))))
    out.append(("gt1mask", sum((1 if count > 1 else 0) << index for index, count in enumerate(counts))))
    for name, items in weights.items():
        out.append(("moment_{0}".format(name), sum(count * weight for count, weight in zip(counts, items))))
    for modulus in (2, 3, 4, 5, 7, 8):
        for name, items in weights.items():
            out.append(("res_{0}_m{1}".format(name, modulus), sum(count * weight for count, weight in zip(counts, items)) % modulus))
    for index, selector in enumerate(selectors):
        out.append(("sel{0}".format(index), selector))
    for modulus in (2, 3, 4):
        mixed = 0
        for index, selector in enumerate(selectors):
            mixed += selector * (index + 1)
        out.append(("selmix_m{0}".format(modulus), mixed % modulus))
    return out


def prefix_feature_sets(counts, selectors):
    prefix = []
    total = 0
    for count in counts:
        total += count
        prefix.append(total)
    suffix = []
    total = 0
    for count in reversed(counts):
        total += count
        suffix.append(total)
    suffix = list(reversed(suffix))
    return {
        "prefix_counts": tuple(prefix),
        "suffix_counts": tuple(suffix),
        "prefix_parity": tuple(value & 1 for value in prefix),
        "suffix_parity": tuple(value & 1 for value in suffix),
        "prefix_mod3": tuple(value % 3 for value in prefix),
        "suffix_mod3": tuple(value % 3 for value in suffix),
        "prefix_mod4": tuple(value % 4 for value in prefix),
        "selector_tuple": tuple(selectors),
        "prefix_parity_selectors": tuple(value & 1 for value in prefix) + tuple(selectors),
        "prefix_mod3_selectors": tuple(value % 3 for value in prefix) + tuple(selectors),
    }


def evaluate_feature_sets(case, outputs, count_data, scalar_limit):
    rows = []
    total_rows = len(outputs)

    # Whole-vector families: if even these are not exact, related compact RTL is
    # unlikely to be worth emitting.
    for family_name in sorted(prefix_feature_sets(count_data[0][0], count_data[0][1])):
        keys = [prefix_feature_sets(counts, selectors)[family_name] for counts, selectors in count_data]
        matches, key_count, max_conflict = majority_stats(outputs, keys)
        rows.append(
            {
                "case": case,
                "family": "vector",
                "feature_set": family_name,
                "feature_count": str(len(keys[0]) if keys else 0),
                "key_count": str(key_count),
                "matches": str(matches),
                "total_rows": str(total_rows),
                "exact": "1" if matches == total_rows else "0",
                "max_conflict": str(max_conflict),
                "notes": "whole vector coordinate family",
            }
        )

    scalar_names = [name for name, _value in scalar_features(count_data[0][0], count_data[0][1])]
    scalar_values = []
    for counts, selectors in count_data:
        scalar_values.append([value for _name, value in scalar_features(counts, selectors)])

    # Greedy forward selection over compact scalar features, using whole-word
    # majority matches as the objective.
    selected = []
    current_keys = [tuple() for _ in count_data]
    current_matches, current_key_count, current_conflict = majority_stats(outputs, current_keys)
    rows.append(
        {
            "case": case,
            "family": "scalar_greedy",
            "feature_set": "base",
            "feature_count": "0",
            "key_count": str(current_key_count),
            "matches": str(current_matches),
            "total_rows": str(total_rows),
            "exact": "1" if current_matches == total_rows else "0",
            "max_conflict": str(current_conflict),
            "notes": "greedy compact moment/residue scalar selection",
        }
    )
    for step in range(scalar_limit):
        best = None
        for index, name in enumerate(scalar_names):
            if index in selected:
                continue
            keys = [key + (values[index],) for key, values in zip(current_keys, scalar_values)]
            matches, key_count, max_conflict = majority_stats(outputs, keys)
            candidate = (matches, -key_count, -max_conflict, index, key_count, max_conflict, keys)
            if best is None or candidate > best:
                best = candidate
        selected.append(best[3])
        current_keys = best[6]
        current_matches = best[0]
        current_key_count = best[4]
        current_conflict = best[5]
        names = [scalar_names[index] for index in selected]
        rows.append(
            {
                "case": case,
                "family": "scalar_greedy",
                "feature_set": ":".join(names),
                "feature_count": str(len(selected)),
                "key_count": str(current_key_count),
                "matches": str(current_matches),
                "total_rows": str(total_rows),
                "exact": "1" if current_matches == total_rows else "0",
                "max_conflict": str(current_conflict),
                "notes": "greedy compact moment/residue scalar selection",
            }
        )
        if current_matches == total_rows:
            break

    # Pairwise moments can reveal a hidden 2-coordinate arithmetic map.
    pair_rows = []
    for left, right in itertools.combinations(range(len(scalar_names)), 2):
        keys = [(values[left], values[right]) for values in scalar_values]
        matches, key_count, max_conflict = majority_stats(outputs, keys)
        pair_rows.append((matches, -key_count, -max_conflict, left, right, key_count, max_conflict))
    pair_rows.sort(reverse=True)
    for matches, neg_key_count, neg_conflict, left, right, key_count, max_conflict in pair_rows[:20]:
        rows.append(
            {
                "case": case,
                "family": "scalar_pair_top",
                "feature_set": "{0}:{1}".format(scalar_names[left], scalar_names[right]),
                "feature_count": "2",
                "key_count": str(key_count),
                "matches": str(matches),
                "total_rows": str(total_rows),
                "exact": "1" if matches == total_rows else "0",
                "max_conflict": str(max_conflict),
                "notes": "top pairwise compact coordinates",
            }
        )
    return rows


def write_csv(path, fields, rows):
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields)
        writer.writeheader()
        writer.writerows(rows)


def write_empty_frontend_csvs(results_dir):
    candidate_fields = [
        "case",
        "candidate_id",
        "hypothesis",
        "variant",
        "verilog_path",
        "aig_path",
        "area",
        "delay",
        "adp",
        "items",
        "notes",
    ]
    summary_fields = [
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
    for name in ("candidates.csv", "best.csv"):
        write_csv(results_dir / name, candidate_fields, [])
    for name in ("summary.csv", "evaluate_check.csv"):
        write_csv(results_dir / name, summary_fields, [])


def run_case(case, benchmarks, max_selectors, scalar_limit):
    table = TruthTable(benchmarks / "{0}.truth".format(case))
    outputs = list(table.iter_outputs())
    onehot = onehot_slots(outputs, table.input_width)
    buckets = bucket_info(onehot)
    all_features = feature_candidates(case, table.input_width)
    row_data = []
    for value, output in enumerate(outputs):
        row_data.append(
            (
                bucket_counts(value, buckets),
                tuple(feature_value(feature, value) for feature in all_features),
                output,
            )
        )
    selected, trace = greedy_selectors(row_data, all_features, len(outputs), max_selectors)
    count_data = count_rows(table.input_width, buckets, all_features, selected)
    rows = evaluate_feature_sets(case, outputs, count_data, scalar_limit)
    selected_names = ":".join(feature_name(all_features[index]) for index in selected)
    for row in rows:
        row["notes"] += "; buckets={0}; selectors={1}".format(len(buckets), selected_names)
    return rows


def parse_args(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--cases", type=parse_cases, required=True)
    parser.add_argument("--run-id", required=True)
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--max-selectors", type=int, default=8)
    parser.add_argument("--scalar-limit", type=int, default=8)
    return parser.parse_args(argv)


def main(argv=None):
    args = parse_args(argv)
    run_dir = ROOT / "student" / "runs" / "unknown" / args.run_id
    results_dir = run_dir / "results"
    rows = []
    for case in args.cases:
        case_rows = run_case(case, args.benchmarks, args.max_selectors, args.scalar_limit)
        rows.extend(case_rows)
        best = max(case_rows, key=lambda row: (int(row["matches"]), -int(row["key_count"])))
        print(
            "{0} best {1} {2} matches={3}/{4} keys={5}".format(
                case,
                best["family"],
                best["feature_set"],
                best["matches"],
                best["total_rows"],
                best["key_count"],
            ),
            flush=True,
        )
    write_csv(results_dir / "bucket_moment_diagnostics.csv", FIELDS, rows)
    write_empty_frontend_csvs(results_dir)
    with (run_dir / "MANIFEST.md").open("w") as handle:
        handle.write("# {0}\n\n".format(args.run_id))
        handle.write("Diagnostic-only low-dimensional bucket-count moment search.\n\n")
        handle.write("Purpose: test whether exact bucket-count classifier state collapses to compact moment/residue/prefix coordinates before emitting any RTL.\n\n")
        handle.write("Inputs:\n")
        handle.write("- Cases: `{0}`\n".format(",".join(args.cases)))
        handle.write("- Script: `student/generators/unknown_bucket_moment_diag.py`\n\n")
        handle.write("Artifacts:\n")
        handle.write("- `results/bucket_moment_diagnostics.csv`\n")
        handle.write("- Empty frontend CSVs: `results/summary.csv`, `results/candidates.csv`, `results/best.csv`, `results/evaluate_check.csv`\n\n")
        exact = [row for row in rows if row["exact"] == "1"]
        if exact:
            handle.write("Notes:\n- Exact compact coordinate hit found; inspect diagnostics before RTL generation.\n")
        else:
            handle.write("Notes:\n- No exact compact coordinate family found; no Verilog/AIG candidates emitted.\n")
        handle.write("- `student/seeds` and `output/` are intentionally untouched.\n")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
