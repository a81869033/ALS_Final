#!/usr/bin/env python3
"""Cumulative capacity transport diagnostics for output pair counts.

If the hard pair-count fields are a histogram/packing transform of exact input
bucket counts, they should be reproducible by prefix sums, capacity bins, and a
small selector-controlled offset/permutation.  This diagnostic checks that
structured hypothesis directly.
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
    "model",
    "bucket_order",
    "pair_order",
    "offset_mode",
    "matches",
    "total_rows",
    "exact",
    "bit_matches",
    "total_fields",
    "first_mismatch",
    "notes",
]


def output_pair_counts(value, width):
    out = []
    for bit in range(0, width - 1, 2):
        out.append(((value >> bit) & 1) + ((value >> (bit + 1)) & 1))
    if width & 1:
        out.append((value >> (width - 1)) & 1)
    return tuple(out)


def order_variants(size):
    orders = {
        "asc": tuple(range(size)),
        "desc": tuple(reversed(range(size))),
    }
    center = sorted(range(size), key=lambda item: (abs(item - (size - 1) / 2.0), item))
    orders["center"] = tuple(center)
    outside = []
    left = 0
    right = size - 1
    while left <= right:
        outside.append(left)
        if right != left:
            outside.append(right)
        left += 1
        right -= 1
    orders["outside"] = tuple(outside)
    return orders


def rotate_tuple(items, amount):
    amount %= len(items)
    return tuple(items[(index + amount) % len(items)] for index in range(len(items)))


def selector_offset(selectors, mode, modulo):
    if modulo <= 0:
        return 0
    if mode == "zero":
        return 0
    if mode == "selbits":
        value = 0
        for index, bit in enumerate(selectors):
            value |= bit << index
        return value % modulo
    if mode == "selsum":
        return sum((index + 1) * bit for index, bit in enumerate(selectors)) % modulo
    if mode == "selxor":
        value = 0
        for index, bit in enumerate(selectors):
            if bit:
                value ^= index + 1
        return value % modulo
    raise RuntimeError("unknown offset mode")


def pack_counts(counts, bucket_order, pair_order, offset, pair_count, capacities, model):
    ordered_counts = [counts[index] for index in bucket_order]
    if model == "prefix_capacity":
        slots = []
        for count in ordered_counts:
            slots.extend([1] * count)
        result = [0] * pair_count
        cursor = offset % pair_count
        remaining_capacity = list(capacities)
        for _token in slots:
            for _attempt in range(pair_count):
                pair = pair_order[cursor % pair_count]
                if remaining_capacity[pair] > 0:
                    result[pair] += 1
                    remaining_capacity[pair] -= 1
                    break
                cursor += 1
            cursor += 1
        return tuple(result)
    if model == "prefix_windows":
        prefix = [0]
        for count in ordered_counts:
            prefix.append(prefix[-1] + count)
        total = prefix[-1]
        result = [0] * pair_count
        start = offset
        for pos, pair in enumerate(pair_order):
            lo = (start + pos * 2) % max(total, 1)
            hi = lo + capacities[pair]
            # Count tokens in a cyclic interval over the packed token rank line.
            if total == 0:
                result[pair] = 0
            elif hi <= total:
                result[pair] = max(0, hi - lo)
            else:
                result[pair] = max(0, total - lo) + (hi % total)
            result[pair] = min(result[pair], capacities[pair])
        return tuple(result)
    raise RuntimeError("unknown model")


def context(case, benchmarks, max_selectors):
    table = TruthTable(benchmarks / "{0}.truth".format(case))
    outputs = list(table.iter_outputs())
    buckets = bucket_info(onehot_slots(outputs, table.input_width))
    features = feature_candidates(case, table.input_width)
    rows = []
    for value, output in enumerate(outputs):
        rows.append((bucket_counts(value, buckets), tuple(feature_value(f, value) for f in features), output))
    selected, _trace = greedy_selectors(rows, features, len(outputs), max_selectors)
    selected_names = ":".join(feature_name(features[index]) for index in selected)
    states = []
    targets = []
    for value, output in enumerate(outputs):
        counts = bucket_counts(value, buckets)
        selectors = tuple(feature_value(features[index], value) for index in selected)
        states.append((counts, selectors))
        targets.append(output_pair_counts(output, table.output_width))
    return table, len(buckets), selected_names, states, targets


def score(states, targets, bucket_order, pair_order, offset_mode, model, capacities):
    matches = 0
    bit_matches = 0
    first = ""
    pair_count = len(pair_order)
    for row, ((counts, selectors), target) in enumerate(zip(states, targets)):
        offset = selector_offset(selectors, offset_mode, pair_count)
        pred = pack_counts(counts, bucket_order, pair_order, offset, pair_count, capacities, model)
        if pred == target:
            matches += 1
        elif not first:
            first = "row={0}:pred={1}:target={2}".format(row, ":".join(map(str, pred)), ":".join(map(str, target)))
        bit_matches += sum(1 for left, right in zip(pred, target) if left == right)
    return matches, bit_matches, first


def run_case(case, benchmarks, max_selectors):
    table, bucket_count, selected_names, states, targets = context(case, benchmarks, max_selectors)
    pair_count = len(targets[0])
    capacities = [2] * (table.output_width // 2)
    if table.output_width & 1:
        capacities.append(1)
    bucket_orders = order_variants(bucket_count)
    pair_orders = order_variants(pair_count)
    # Include rotations of the two most plausible pair orders.
    for base_name in ("asc", "desc"):
        base = pair_orders[base_name]
        for amount in range(1, min(pair_count, 5)):
            pair_orders["{0}_rot{1}".format(base_name, amount)] = rotate_tuple(base, amount)
    rows = []
    for model in ("prefix_capacity", "prefix_windows"):
        for bucket_name, bucket_order in bucket_orders.items():
            for pair_name, pair_order in pair_orders.items():
                for offset_mode in ("zero", "selbits", "selsum", "selxor"):
                    matches, bit_matches, first = score(
                        states,
                        targets,
                        bucket_order,
                        pair_order,
                        offset_mode,
                        model,
                        capacities,
                    )
                    rows.append(
                        {
                            "case": case,
                            "model": model,
                            "bucket_order": bucket_name,
                            "pair_order": pair_name,
                            "offset_mode": offset_mode,
                            "matches": matches,
                            "total_rows": len(targets),
                            "exact": "1" if matches == len(targets) else "0",
                            "bit_matches": bit_matches,
                            "total_fields": len(targets) * pair_count,
                            "first_mismatch": first,
                            "notes": "buckets={0}; selectors={1}; capacities={2}".format(
                                bucket_count, selected_names, ":".join(map(str, capacities))
                            ),
                        }
                    )
    return sorted(rows, key=lambda row: (int(row["matches"]), int(row["bit_matches"])), reverse=True)


def write_csv(path, fields, rows):
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields)
        writer.writeheader()
        writer.writerows(rows)


def write_empty_frontend_csvs(results_dir):
    candidate_fields = ["case", "candidate_id", "hypothesis", "variant", "verilog_path", "aig_path", "area", "delay", "adp", "items", "notes"]
    summary_fields = ["case", "candidate_id", "hypothesis", "variant", "verilog_path", "aig_path", "verified_truth", "equivalent", "area", "delay", "adp", "notes"]
    write_csv(results_dir / "candidates.csv", candidate_fields, [])
    write_csv(results_dir / "best.csv", candidate_fields, [])
    write_csv(results_dir / "summary.csv", summary_fields, [])
    write_csv(results_dir / "evaluate_check.csv", summary_fields, [])


def parse_args(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--cases", type=parse_cases, required=True)
    parser.add_argument("--run-id", required=True)
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--max-selectors", type=int, default=8)
    return parser.parse_args(argv)


def main(argv=None):
    args = parse_args(argv)
    run_dir = ROOT / "student" / "runs" / "unknown" / args.run_id
    results_dir = run_dir / "results"
    rows = []
    for case in args.cases:
        case_rows = run_case(case, args.benchmarks, args.max_selectors)
        rows.extend(case_rows)
        best = case_rows[0]
        print(
            "{0} best {1}/{2} model={3} bucket={4} pair={5} offset={6}".format(
                case,
                best["matches"],
                best["total_rows"],
                best["model"],
                best["bucket_order"],
                best["pair_order"],
                best["offset_mode"],
            ),
            flush=True,
        )
    write_csv(results_dir / "paircount_transport_diagnostics.csv", FIELDS, rows)
    write_empty_frontend_csvs(results_dir)
    with (run_dir / "MANIFEST.md").open("w") as handle:
        handle.write("# {0}\n\n".format(args.run_id))
        handle.write("Diagnostic-only cumulative capacity transport search for output adjacent-pair counts.\n\n")
        handle.write("Purpose: test whether output pair-count fields are generated by prefix packing / capacity transport over exact input bucket counts.\n\n")
        handle.write("Inputs:\n- Cases: `{0}`\n- Script: `student/generators/unknown_paircount_transport_diag.py`\n\n".format(",".join(args.cases)))
        handle.write("Artifacts:\n- `results/paircount_transport_diagnostics.csv`\n- Empty frontend CSVs: `results/summary.csv`, `results/candidates.csv`, `results/best.csv`, `results/evaluate_check.csv`\n\n")
        exact = [row for row in rows if row["exact"] == "1"]
        if exact:
            handle.write("Notes:\n- Exact transport hit found; inspect diagnostics before RTL generation.\n")
        else:
            handle.write("Notes:\n- No exact transport model found; no Verilog/AIG candidates emitted.\n")
        handle.write("- `student/seeds` and `output/` are intentionally untouched.\n")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
