#!/usr/bin/env python3
"""Bucket-count collision relaxation diagnostics for conservative unknown cases."""

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
    "order",
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


def center_order(width):
    center = (width - 1) / 2.0
    return sorted(range(width), key=lambda bit: (abs(bit - center), bit))


def outside_order(width):
    center = (width - 1) / 2.0
    return sorted(range(width), key=lambda bit: (-abs(bit - center), bit))


def rotate_order(order, amount):
    if not order:
        return order
    amount %= len(order)
    return order[amount:] + order[:amount]


def candidate_orders(width, onehot):
    slots = sorted(set(onehot))
    rest = [bit for bit in range(width) if bit not in slots]
    raw = [
        ("natural", list(range(width))),
        ("reverse", list(reversed(range(width)))),
        ("center", center_order(width)),
        ("outside", outside_order(width)),
        ("homes_first", slots + rest),
        ("homes_last", rest + slots),
        ("homes_rev_first", list(reversed(slots)) + rest),
    ]
    out = []
    seen = set()
    for name, order in raw:
        key = tuple(order)
        if key not in seen:
            seen.add(key)
            out.append((name, order))
    return out


def initial_counts(width, buckets, counts):
    occ = [0] * width
    for count, (slot, _members, _bits) in zip(counts, buckets):
        occ[slot] += count
    return occ


def mask_from_occ(occ):
    out = 0
    for bit, value in enumerate(occ):
        if value:
            out |= 1 << bit
    return out


def relax_parking(occ, order):
    state = list(occ)
    carry = 0
    out_occ = [0] * len(state)
    for bit in order:
        total = state[bit] + carry
        if total > 0:
            out_occ[bit] = 1
            carry = total - 1
        else:
            carry = 0
    # If carry remains, place it in the earliest free slots to model a saturating line.
    for bit in order:
        if carry <= 0:
            break
        if out_occ[bit] == 0:
            out_occ[bit] = 1
            carry -= 1
    return mask_from_occ(out_occ)


def relax_binary(occ, order):
    state = list(occ)
    carry = 0
    out_occ = [0] * len(state)
    for bit in order:
        total = state[bit] + carry
        out_occ[bit] = total & 1
        carry = total >> 1
    return mask_from_occ(out_occ)


def relax_balanced_parking(occ, order):
    out_occ = [0] * len(occ)
    for bit in order:
        for _ in range(occ[bit]):
            placed = False
            for radius in range(len(occ)):
                candidates = []
                if bit - radius >= 0:
                    candidates.append(bit - radius)
                if radius and bit + radius < len(occ):
                    candidates.append(bit + radius)
                for candidate in candidates:
                    if out_occ[candidate] == 0:
                        out_occ[candidate] = 1
                        placed = True
                        break
                if placed:
                    break
    return mask_from_occ(out_occ)


def relax_sandpile(occ, order, cycle, rounds):
    state = list(occ)
    width = len(state)
    for _round in range(rounds):
        changed = False
        for bit in order:
            while state[bit] > 1:
                state[bit] -= 2
                if cycle:
                    state[(bit - 1) % width] += 1
                    state[(bit + 1) % width] += 1
                else:
                    if bit > 0:
                        state[bit - 1] += 1
                    else:
                        state[bit] += 1
                    if bit + 1 < width:
                        state[bit + 1] += 1
                    else:
                        state[bit] += 1
                changed = True
        if not changed:
            break
    return mask_from_occ([1 if value else 0 for value in state])


def predict(mode, occ, order):
    if mode == "parking":
        return relax_parking(occ, order)
    if mode == "binary":
        return relax_binary(occ, order)
    if mode == "balanced_parking":
        return relax_balanced_parking(occ, order)
    if mode == "sandpile_line":
        return relax_sandpile(occ, order, False, len(occ))
    if mode == "sandpile_cycle":
        return relax_sandpile(occ, order, True, len(occ))
    raise RuntimeError("unknown mode {0}".format(mode))


def evaluate(rows, mode, base_order, selector_policy, width):
    matches = 0
    bit_mismatches = 0
    first = ""
    for occ, selector_key, expected in rows:
        order = base_order
        if selector_policy == "rotate_selector":
            order = rotate_order(base_order, selector_key)
        elif selector_policy == "rotate_selector_rev":
            order = rotate_order(base_order, -selector_key)
        predicted = predict(mode, occ, order)
        if predicted == expected:
            matches += 1
        elif not first:
            first = "occ={0};sel={1};pred=0x{2:x};exp=0x{3:x}".format(
                ":".join(str(item) for item in occ),
                selector_key,
                predicted,
                expected,
            )
        bit_mismatches += popcount(predicted ^ expected)
    return matches, bit_mismatches, first


def selector_specific_best(rows, modes, orders, width):
    by_selector = {}
    for occ, selector_key, expected in rows:
        by_selector.setdefault(selector_key, []).append((occ, selector_key, expected))
    total_matches = 0
    total_bit_mismatches = 0
    policies = []
    for selector_key, subset in sorted(by_selector.items()):
        best = None
        for mode in modes:
            for order_name, order in orders:
                matches, bit_mismatches, _first = evaluate(subset, mode, order, "none", width)
                item = (matches, -bit_mismatches, mode, order_name)
                if best is None or item > best:
                    best = item
        total_matches += best[0]
        total_bit_mismatches += -best[1]
        policies.append("{0}:{1}:{2}".format(selector_key, best[2], best[3]))
    return total_matches, total_bit_mismatches, ";".join(policies[:16])


def build_rows(case, benchmarks):
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
    selected, _trace = greedy_selectors(selector_rows, features, len(outputs), 8)
    rows = []
    for value, output in enumerate(outputs):
        counts = bucket_counts(value, buckets)
        selector_key = 0
        for index in selected:
            selector_key = (selector_key << 1) | feature_values_by_row[value][index]
        rows.append((initial_counts(width, buckets, counts), selector_key, output))
    return table, onehot, rows, [feature_name(features[index]) for index in selected]


def run_case(case, benchmarks):
    table, onehot, rows, selected_names = build_rows(case, benchmarks)
    width = table.input_width
    modes = ["parking", "binary", "balanced_parking", "sandpile_line", "sandpile_cycle"]
    orders = candidate_orders(width, onehot)
    result_rows = []
    for mode in modes:
        for order_name, order in orders:
            for selector_policy in ("none", "rotate_selector", "rotate_selector_rev"):
                matches, bit_mismatches, first = evaluate(rows, mode, order, selector_policy, width)
                result_rows.append(
                    {
                        "case": case,
                        "mode": mode,
                        "order": order_name,
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
    matches, bit_mismatches, policies = selector_specific_best(rows, modes, orders, width)
    result_rows.append(
        {
            "case": case,
            "mode": "selector_specific",
            "order": "selector_specific",
            "selector_policy": "selector_specific_mode_order",
            "matches": matches,
            "total_rows": len(rows),
            "match_ratio": "{0:.6f}".format(matches / float(len(rows))),
            "bit_mismatches": bit_mismatches,
            "total_bits": len(rows) * width,
            "bit_match_ratio": "{0:.6f}".format(1.0 - bit_mismatches / float(len(rows) * width)),
            "notes": "selectors={0}; policies={1}".format(":".join(selected_names), policies),
        }
    )
    result_rows.sort(key=lambda row: (int(row["matches"]), float(row["bit_match_ratio"])), reverse=True)
    print(
        "{0}: best {1}/{2} mode={3} bit={4}".format(
            case,
            result_rows[0]["matches"],
            result_rows[0]["total_rows"],
            result_rows[0]["mode"],
            result_rows[0]["bit_match_ratio"],
        ),
        flush=True,
    )
    return result_rows[:80]


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

Purpose: Diagnostic-only bucket-count collision-relaxation search for
ex286-ex289.  This tests whether exact one-hot home bucket counts can be
converted to output occupancy by small local carry/relaxation rules such as
parking carry, binary carry, balanced nearest parking, or line/cycle sandpile.

Inputs:
- Truth files: {1}
- Script: `student/generators/unknown_bucket_relaxation_diag.py`

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
    args = parser.parse_args(argv)

    run_dir = ROOT / "student" / "runs" / "unknown" / args.run_id
    results_dir = run_dir / "results"
    rows = []
    for case in args.cases:
        rows.extend(run_case(case, args.benchmarks))
        write_csv(results_dir / "summary.csv", SUMMARY_FIELDS, rows)
    write_empty_frontend_csvs(results_dir)
    write_manifest(run_dir, args.run_id, args.cases)
    print("Results: {0}".format(results_dir))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
