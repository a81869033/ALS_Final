#!/usr/bin/env python3
"""Sampled static-feature controlled-swap smoke for conservative unknown cases."""

import argparse
import csv
import itertools
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from student.frontends.truth import TruthTable


DETAIL_FIELDS = [
    "case",
    "start",
    "depth",
    "score",
    "sample_row_mismatches",
    "gate",
    "notes",
]

SUMMARY_FIELDS = [
    "case",
    "start",
    "sample_rows",
    "initial_score",
    "initial_sample_row_mismatches",
    "best_depth",
    "best_score",
    "best_sample_row_mismatches",
    "score_reduction",
    "row_reduction",
    "conclusion",
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

KNOWN_PAIRS = {
    "ex286": [(4, 5), (6, 7)],
    "ex287": [(4, 5), (6, 7), (8, 9)],
    "ex288": [(4, 5), (6, 7), (8, 9)],
    "ex289": [(4, 5), (6, 7), (8, 9), (10, 11)],
}


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


def bitsets_from_values(values, width):
    bitsets = []
    for bit in range(width):
        packed = 0
        for index, value in enumerate(values):
            if (value >> bit) & 1:
                packed |= 1 << index
        bitsets.append(packed)
    return bitsets


def sample_indices(width, limit):
    total = 1 << width
    rows = set()
    for value in range(total):
        if popcount(value) <= 2:
            rows.add(value)
    by_weight = [[] for _ in range(width + 1)]
    for value in range(total):
        by_weight[popcount(value)].append(value)
    per_weight = max(1, limit // (width + 1))
    for weight, values in enumerate(by_weight):
        if len(values) <= per_weight:
            rows.update(values)
            continue
        step = max(1, len(values) // per_weight)
        rows.update(values[index] for index in range(0, len(values), step)[:per_weight])
    return sorted(rows)[:limit]


def pair_key_value(index, pairs):
    value = index
    for left, right in pairs:
        lb = (index >> left) & 1
        rb = (index >> right) & 1
        if lb | rb:
            value |= 1 << left
        else:
            value &= ~(1 << left)
        if lb & rb:
            value |= 1 << right
        else:
            value &= ~(1 << right)
    return value


def start_values(name, samples, pairs):
    if name == "identity":
        return list(samples)
    if name == "pair_canonical":
        return [pair_key_value(value, pairs) for value in samples]
    raise RuntimeError("unknown start {0}".format(name))


def row_mismatches(bitsets, expected_values, width):
    mismatches = 0
    for index, expected in enumerate(expected_values):
        value = 0
        for bit, packed in enumerate(bitsets):
            if (packed >> index) & 1:
                value |= 1 << bit
        if value != expected:
            mismatches += 1
    return mismatches


def score(bitsets, target_bitsets):
    return sum(popcount(left ^ right) for left, right in zip(bitsets, target_bitsets))


def apply_swap(bitsets, control, left, right):
    swap_mask = control & (bitsets[left] ^ bitsets[right])
    out = list(bitsets)
    out[left] ^= swap_mask
    out[right] ^= swap_mask
    return out


def swap_delta(bitsets, target_bitsets, control, left, right):
    swap_mask = control & (bitsets[left] ^ bitsets[right])
    if not swap_mask:
        return 0
    nl = bitsets[left] ^ swap_mask
    nr = bitsets[right] ^ swap_mask
    old = popcount(bitsets[left] ^ target_bitsets[left]) + popcount(bitsets[right] ^ target_bitsets[right])
    new = popcount(nl ^ target_bitsets[left]) + popcount(nr ^ target_bitsets[right])
    return new - old


def control_masks(samples, width, pairs):
    full_mask = (1 << len(samples)) - 1
    controls = []
    seen = set()

    def add(name, mask):
        if mask == 0 or mask == full_mask or mask in seen:
            return
        seen.add(mask)
        controls.append((name, mask))

    for bit in range(width):
        mask = 0
        for index, value in enumerate(samples):
            if (value >> bit) & 1:
                mask |= 1 << index
        add("in{0}".format(bit), mask)

    for left, right in pairs:
        masks = {"or": 0, "and": 0, "xor": 0}
        for index, value in enumerate(samples):
            lb = (value >> left) & 1
            rb = (value >> right) & 1
            if lb | rb:
                masks["or"] |= 1 << index
            if lb & rb:
                masks["and"] |= 1 << index
            if lb ^ rb:
                masks["xor"] |= 1 << index
        for kind, mask in masks.items():
            add("pair{0}_{1}_{2}".format(left, right, kind), mask)

    intervals = []
    for stop in range(1, width + 1):
        intervals.append((0, stop))
    for start in range(width):
        intervals.append((start, width))
    for start, stop in sorted(set(intervals)):
        span = stop - start
        field_mask = ((1 << stop) - 1) ^ ((1 << start) - 1)
        for threshold in range(1, min(span, 4) + 1):
            ge_mask = 0
            eq_mask = 0
            for index, value in enumerate(samples):
                count = popcount(value & field_mask)
                if count >= threshold:
                    ge_mask |= 1 << index
                if count == threshold:
                    eq_mask |= 1 << index
            add("cnt{0}_{1}_ge{2}".format(start, stop - 1, threshold), ge_mask)
            add("cnt{0}_{1}_eq{2}".format(start, stop - 1, threshold), eq_mask)
    return controls


def greedy(case, width, outputs, samples, start, controls, pairs, max_depth):
    expected = [outputs[value] for value in samples]
    target_bitsets = bitsets_from_values(expected, width)
    bitsets = bitsets_from_values(start_values(start, samples, pairs), width)
    current_score = score(bitsets, target_bitsets)
    current_rows = row_mismatches(bitsets, expected, width)
    rows = [
        {
            "case": case,
            "start": start,
            "depth": "0",
            "score": current_score,
            "sample_row_mismatches": current_rows,
            "gate": "",
            "notes": "sample_rows={0}; controls={1}".format(len(samples), len(controls)),
        }
    ]
    best = (0, current_score, current_rows)
    full_mask = (1 << len(samples)) - 1
    for depth in range(1, max_depth + 1):
        best_gate = None
        for cname, cmask in controls:
            for vname, vmask in ((cname, cmask), ("not({0})".format(cname), full_mask ^ cmask)):
                for left, right in itertools.combinations(range(width), 2):
                    delta = swap_delta(bitsets, target_bitsets, vmask, left, right)
                    if best_gate is None or delta < best_gate[0]:
                        best_gate = (delta, vname, vmask, left, right)
        if best_gate is None or best_gate[0] >= 0:
            break
        delta, control_name, control, left, right = best_gate
        bitsets = apply_swap(bitsets, control, left, right)
        current_score += delta
        current_rows = row_mismatches(bitsets, expected, width)
        rows.append(
            {
                "case": case,
                "start": start,
                "depth": str(depth),
                "score": current_score,
                "sample_row_mismatches": current_rows,
                "gate": "{0}:swap{1}_{2}:delta{3}".format(control_name, left, right, delta),
                "notes": "sampled static-feature controlled swap",
            }
        )
        if current_score < best[1]:
            best = (depth, current_score, current_rows)
    return rows, best


def write_csv(path, fields, rows):
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields)
        writer.writeheader()
        writer.writerows(rows)


def write_empty_frontend_csvs(results_dir):
    for name in ("candidates.csv", "best.csv", "evaluate_check.csv"):
        write_csv(results_dir / name, EMPTY_FRONTEND_FIELDS, [])


def write_manifest(run_dir, run_id, cases, max_depth, sample_limit):
    text = """# {0}

Run ID: `{0}`

Purpose: Sampled static-feature controlled-swap smoke for ex286-ex289 after the
full-table version was too slow and ex286 showed weak early full-table results.
The sample includes all weight<=2 rows plus deterministic stratified rows.

Inputs:
- Truth files: {1}
- Script: `student/generators/unknown_static_control_swap_sample_diag.py`
- Max depth: `{2}`
- Sample limit: `{3}`

Artifacts:
- Results directory: `student/runs/unknown/{0}/results/`
- Detail CSV: `results/static_control_swap_sample_diagnostics.csv`
- Summary CSV: `results/summary.csv`
- Empty frontend CSVs: `results/candidates.csv`, `results/best.csv`, `results/evaluate_check.csv`

Best result:
- Diagnostic only; no Verilog/AIG candidates generated.

Notes:
- `student/seeds` and `output/` are intentionally untouched.
""".format(
        run_id,
        ", ".join("benchmarks/{0}.truth".format(case) for case in cases),
        max_depth,
        sample_limit,
    )
    (run_dir / "MANIFEST.md").write_text(text)


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--cases", type=parse_cases, default=parse_cases("ex286-ex289"))
    parser.add_argument("--run-id", required=True)
    parser.add_argument("--truth-dir", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--max-depth", type=int, default=12)
    parser.add_argument("--sample-limit", type=int, default=2048)
    args = parser.parse_args(argv)

    run_dir = ROOT / "student" / "runs" / "unknown" / args.run_id
    results_dir = run_dir / "results"
    detail_rows = []
    summary_rows = []
    for case in args.cases:
        table = TruthTable(args.truth_dir / "{0}.truth".format(case))
        width = table.input_width
        outputs = list(table.iter_outputs())
        pairs = KNOWN_PAIRS.get(case, [])
        samples = sample_indices(width, args.sample_limit)
        controls = control_masks(samples, width, pairs)
        for start in ("identity", "pair_canonical"):
            rows, best = greedy(case, width, outputs, samples, start, controls, pairs, args.max_depth)
            detail_rows.extend(rows)
            initial = rows[0]
            best_depth, best_score, best_rows = best
            conclusion = "weak controlled-routing lead"
            if best_rows < len(samples) // 10:
                conclusion = "strong sampled lead; consider full RTL search"
            summary_rows.append(
                {
                    "case": case,
                    "start": start,
                    "sample_rows": len(samples),
                    "initial_score": initial["score"],
                    "initial_sample_row_mismatches": initial["sample_row_mismatches"],
                    "best_depth": best_depth,
                    "best_score": best_score,
                    "best_sample_row_mismatches": best_rows,
                    "score_reduction": int(initial["score"]) - int(best_score),
                    "row_reduction": int(initial["sample_row_mismatches"]) - int(best_rows),
                    "conclusion": conclusion,
                }
            )
            print(
                "{0} {1}: sample rows {2} best depth {3} score {4} mismatches {5}".format(
                    case, start, len(samples), best_depth, best_score, best_rows
                ),
                flush=True,
            )
    write_csv(results_dir / "static_control_swap_sample_diagnostics.csv", DETAIL_FIELDS, detail_rows)
    write_csv(results_dir / "summary.csv", SUMMARY_FIELDS, summary_rows)
    write_empty_frontend_csvs(results_dir)
    write_manifest(run_dir, args.run_id, args.cases, args.max_depth, args.sample_limit)
    print("Results: {0}".format(results_dir))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
