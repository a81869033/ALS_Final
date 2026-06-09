#!/usr/bin/env python3
"""Bucket-count prefix-layout diagnostics for conservative unknown cases."""

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


SUMMARY_FIELDS = [
    "case",
    "mode",
    "bucket_order",
    "output_order",
    "selector_policy",
    "matches",
    "total_rows",
    "match_ratio",
    "bit_mismatches",
    "total_bits",
    "bit_match_ratio",
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


def center_order(items):
    center = (len(items) - 1) / 2.0
    return sorted(items, key=lambda item: (abs(item - center), item))


def outside_order(items):
    center = (len(items) - 1) / 2.0
    return sorted(items, key=lambda item: (-abs(item - center), item))


def rotate_order(order, amount):
    if not order:
        return order
    amount %= len(order)
    return order[amount:] + order[:amount]


def candidate_bucket_orders(buckets):
    base = list(range(len(buckets)))
    sizes = [len(members) for _slot, members, _bits in buckets]
    slots = [slot for slot, _members, _bits in buckets]
    raw = [
        ("slot_asc", sorted(base, key=lambda index: (slots[index], index))),
        ("slot_desc", sorted(base, key=lambda index: (-slots[index], index))),
        ("size_desc", sorted(base, key=lambda index: (-sizes[index], slots[index], index))),
        ("size_asc", sorted(base, key=lambda index: (sizes[index], slots[index], index))),
        ("center_slot", sorted(base, key=lambda index: (abs(slots[index] - sum(slots) / float(len(slots))), slots[index]))),
        ("outside_slot", sorted(base, key=lambda index: (-abs(slots[index] - sum(slots) / float(len(slots))), slots[index]))),
    ]
    out = []
    seen = set()
    for name, order in raw:
        key = tuple(order)
        if key not in seen:
            seen.add(key)
            out.append((name, order))
    return out


def candidate_output_orders(width, onehot):
    slots = sorted(set(onehot))
    rest = [bit for bit in range(width) if bit not in slots]
    raw = [
        ("natural", list(range(width))),
        ("reverse", list(reversed(range(width)))),
        ("center", center_order(list(range(width)))),
        ("outside", outside_order(list(range(width)))),
        ("onehot_slots_first", slots + rest),
        ("onehot_slots_last", rest + slots),
        ("onehot_slots_rev_first", list(reversed(slots)) + rest),
    ]
    out = []
    seen = set()
    for name, order in raw:
        key = tuple(order)
        if key not in seen:
            seen.add(key)
            out.append((name, order))
    return out


def layout_from_counts(counts, bucket_order, output_order, mode, offset):
    order = rotate_order(output_order, offset)
    out = 0
    cursor = 0
    if mode == "prefix_ones":
        for bucket_index in bucket_order:
            for _ in range(counts[bucket_index]):
                if cursor < len(order):
                    out |= 1 << order[cursor]
                    cursor += 1
            cursor += 0
    elif mode == "prefix_zeros":
        total = sum(counts)
        zeros = len(order) - total
        cursor = zeros
        for bucket_index in bucket_order:
            for _ in range(counts[bucket_index]):
                if cursor < len(order):
                    out |= 1 << order[cursor]
                    cursor += 1
    elif mode == "bucket_segment":
        # Each bucket owns a segment whose length is its one-hot bucket size.
        cursor = 0
        for bucket_index in bucket_order:
            count = counts[bucket_index]
            segment = len(order) - cursor
            take = min(count, segment)
            for pos in range(take):
                out |= 1 << order[cursor + pos]
            cursor += max(count, 1)
    else:
        raise RuntimeError("unknown mode {0}".format(mode))
    return out


def evaluate_rows(rows, width, mode, bucket_order, output_order, selector_policy):
    matches = 0
    bit_mismatches = 0
    first = ""
    for counts, selector_key, expected in rows:
        offset = 0
        if selector_policy == "selector_offset":
            offset = selector_key % width
        elif selector_policy == "selector_offset_rev":
            offset = (-selector_key) % width
        predicted = layout_from_counts(counts, bucket_order, output_order, mode, offset)
        if predicted == expected:
            matches += 1
        elif not first:
            first = "counts={0};sel={1};pred=0x{2:x};exp=0x{3:x}".format(
                ":".join(str(item) for item in counts),
                selector_key,
                predicted,
                expected,
            )
        bit_mismatches += popcount(predicted ^ expected)
    return matches, bit_mismatches, first


def selector_specific_best(rows, width, mode, bucket_orders, output_orders):
    by_selector = {}
    for counts, selector_key, expected in rows:
        by_selector.setdefault(selector_key, []).append((counts, selector_key, expected))
    total_matches = 0
    total_bit_mismatches = 0
    policies = []
    for selector_key, subset in sorted(by_selector.items()):
        best = None
        for bname, border in bucket_orders:
            for oname, oorder in output_orders:
                for offset in range(width):
                    wrapped = []
                    for counts, _selector, expected in subset:
                        wrapped.append((counts, offset, expected))
                    matches, bit_mismatches, _first = evaluate_rows(
                        wrapped,
                        width,
                        mode,
                        border,
                        oorder,
                        "selector_offset",
                    )
                    item = (matches, -bit_mismatches, bname, oname, offset)
                    if best is None or item > best:
                        best = item
        total_matches += best[0]
        total_bit_mismatches += -best[1]
        policies.append("{0}:{1}:{2}:off{3}".format(selector_key, best[2], best[3], best[4]))
    return total_matches, total_bit_mismatches, ";".join(policies[:16])


def build_case_rows(case, benchmarks):
    table = TruthTable(benchmarks / "{0}.truth".format(case))
    outputs = list(table.iter_outputs())
    width = table.input_width
    onehot = onehot_slots(outputs, width)
    buckets = bucket_info(onehot)
    features = feature_candidates(case, width)
    selector_rows = []
    feature_values_by_row = []
    for value, output in enumerate(outputs):
        fvals = tuple(feature_value(feature, value) for feature in features)
        feature_values_by_row.append(fvals)
        selector_rows.append((bucket_counts(value, buckets), fvals, output))
    selected, trace = greedy_selectors(selector_rows, features, len(outputs), 8)
    rows = []
    for value, output in enumerate(outputs):
        selectors = tuple(feature_values_by_row[value][index] for index in selected)
        selector_key = 0
        for bit in selectors:
            selector_key = (selector_key << 1) | bit
        rows.append((bucket_counts(value, buckets), selector_key, output))
    selected_names = [feature_name(features[index]) for index in selected]
    return table, outputs, onehot, buckets, rows, selected_names, trace


def run_case(case, benchmarks, selector_specific):
    table, _outputs, onehot, buckets, rows, selected_names, _trace = build_case_rows(case, benchmarks)
    width = table.input_width
    bucket_orders = candidate_bucket_orders(buckets)
    output_orders = candidate_output_orders(width, onehot)
    results = []
    for mode in ("prefix_ones", "prefix_zeros", "bucket_segment"):
        for bname, border in bucket_orders:
            for oname, oorder in output_orders:
                for selector_policy in ("none", "selector_offset", "selector_offset_rev"):
                    matches, bit_mismatches, first = evaluate_rows(
                        rows, width, mode, border, oorder, selector_policy
                    )
                    results.append(
                        {
                            "case": case,
                            "mode": mode,
                            "bucket_order": bname,
                            "output_order": oname,
                            "selector_policy": selector_policy,
                            "matches": matches,
                            "total_rows": len(rows),
                            "match_ratio": "{0:.6f}".format(matches / float(len(rows))),
                            "bit_mismatches": bit_mismatches,
                            "total_bits": len(rows) * width,
                            "bit_match_ratio": "{0:.6f}".format(1.0 - bit_mismatches / float(len(rows) * width)),
                            "notes": "selectors={0}; first={1}".format(":".join(selected_names), first),
                        }
                    )
        if selector_specific:
            matches, bit_mismatches, policy = selector_specific_best(rows, width, mode, bucket_orders, output_orders)
            results.append(
                {
                    "case": case,
                    "mode": mode,
                    "bucket_order": "selector_specific",
                    "output_order": "selector_specific",
                    "selector_policy": "selector_specific_layout_offset",
                    "matches": matches,
                    "total_rows": len(rows),
                    "match_ratio": "{0:.6f}".format(matches / float(len(rows))),
                    "bit_mismatches": bit_mismatches,
                    "total_bits": len(rows) * width,
                    "bit_match_ratio": "{0:.6f}".format(1.0 - bit_mismatches / float(len(rows) * width)),
                    "notes": "selectors={0}; policies={1}".format(":".join(selected_names), policy),
                }
            )
    results.sort(key=lambda row: (int(row["matches"]), float(row["bit_match_ratio"])), reverse=True)
    print(
        "{0}: best {1}/{2} mode={3} bit={4}".format(
            case,
            results[0]["matches"],
            results[0]["total_rows"],
            results[0]["mode"],
            results[0]["bit_match_ratio"],
        ),
        flush=True,
    )
    return results[:80]


def write_csv(path, fields, rows):
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields)
        writer.writeheader()
        writer.writerows(rows)


def write_empty_frontend_csvs(results_dir):
    for name in ("candidates.csv", "best.csv", "evaluate_check.csv"):
        write_csv(results_dir / name, EMPTY_FRONTEND_FIELDS, [])


def write_manifest(run_dir, run_id, cases):
    text = """# {0}

Run ID: `{0}`

Purpose: Diagnostic-only bucket-count prefix/layout search for ex286-ex289.
This tests whether exact one-hot bucket counts plus selector bits implement a
small histogram-to-output layout such as prefix thermometer placement, selector
offset rotation, or selector-specific bucket/output order.

Inputs:
- Truth files: {1}
- Script: `student/generators/unknown_bucket_layout_diag.py`

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
    )
    (run_dir / "MANIFEST.md").write_text(text)


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--cases", type=parse_cases, default=parse_cases("ex286-ex289"))
    parser.add_argument("--run-id", required=True)
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--selector-specific", action="store_true")
    args = parser.parse_args(argv)

    run_dir = ROOT / "student" / "runs" / "unknown" / args.run_id
    results_dir = run_dir / "results"
    rows = []
    for case in args.cases:
        rows.extend(run_case(case, args.benchmarks, args.selector_specific))
    write_csv(results_dir / "summary.csv", SUMMARY_FIELDS, rows)
    write_empty_frontend_csvs(results_dir)
    write_manifest(run_dir, args.run_id, args.cases)
    print("Results: {0}".format(results_dir))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
