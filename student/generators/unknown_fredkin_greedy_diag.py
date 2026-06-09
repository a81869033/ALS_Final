#!/usr/bin/env python3
"""Bitset-parallel Fredkin greedy diagnostic for conservative unknown cases."""

import argparse
import csv
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from student.frontends.truth import TruthTable
from student.generators.unknown_verilog_search import parse_cases


FIELDS = ["case", "depth", "score", "row_mismatches", "gate", "notes"]
EMPTY_CANDIDATE_HEADER = (
    "case,candidate_id,hypothesis,variant,verilog_path,aig_path,"
    "verified_truth,equivalent,area,delay,adp,notes\n"
)
POPCOUNT_8 = [bin(index).count("1") for index in range(256)]


def popcount_factory(num_bits):
    num_bytes = (num_bits + 7) // 8

    def popcount(value):
        return sum(POPCOUNT_8[byte] for byte in value.to_bytes(num_bytes, "little"))

    return popcount


def pair_key(index, pairs):
    value = index
    for left, right in pairs:
        left_bit = (index >> left) & 1
        right_bit = (index >> right) & 1
        if left_bit | right_bit:
            value |= 1 << left
        else:
            value &= ~(1 << left)
        if left_bit & right_bit:
            value |= 1 << right
        else:
            value &= ~(1 << right)
    return value


def bitsets_from_values(values, width):
    bitsets = []
    for bit in range(width):
        packed = 0
        for index, value in enumerate(values):
            if (value >> bit) & 1:
                packed |= 1 << index
        bitsets.append(packed)
    return bitsets


def row_mismatches(bitsets, outputs, width):
    mismatches = 0
    for index, expected in enumerate(outputs):
        actual = 0
        for bit, packed in enumerate(bitsets):
            if (packed >> index) & 1:
                actual |= 1 << bit
        if actual != expected:
            mismatches += 1
    return mismatches


def apply_fredkin(bitsets, control, left, right, invert_control, full_mask):
    updated = list(bitsets)
    control_bits = bitsets[control]
    if invert_control:
        control_bits ^= full_mask
    swap_mask = control_bits & (bitsets[left] ^ bitsets[right])
    updated[left] = bitsets[left] ^ swap_mask
    updated[right] = bitsets[right] ^ swap_mask
    return updated


def run_case(case, pairs, max_depth, truth_dir):
    table = TruthTable(truth_dir / "{0}.truth".format(case))
    outputs = list(table.iter_outputs())
    width = table.input_width
    count = 1 << width
    full_mask = (1 << count) - 1
    popcount = popcount_factory(count)
    target_bitsets = bitsets_from_values(outputs, width)
    initial_values = [pair_key(index, pairs) for index in range(count)]
    bitsets = bitsets_from_values(initial_values, width)

    def score(current):
        return sum(popcount(left ^ right) for left, right in zip(current, target_bitsets))

    rows = []
    current_score = score(bitsets)
    rows.append(
        {
            "case": case,
            "depth": "0",
            "score": str(current_score),
            "row_mismatches": str(row_mismatches(bitsets, outputs, width)),
            "gate": "",
            "notes": "initial pair-canonical key",
        }
    )
    for depth in range(1, max_depth + 1):
        best = None
        for control in range(width):
            for left in range(width):
                if left == control:
                    continue
                for right in range(left + 1, width):
                    if right == control:
                        continue
                    for invert_control in (0, 1):
                        candidate = apply_fredkin(
                            bitsets,
                            control,
                            left,
                            right,
                            invert_control,
                            full_mask,
                        )
                        candidate_score = score(candidate)
                        if best is None or candidate_score < best[0]:
                            best = (
                                candidate_score,
                                control,
                                left,
                                right,
                                invert_control,
                                candidate,
                            )
        if best is None or best[0] >= current_score:
            rows.append(
                {
                    "case": case,
                    "depth": str(depth),
                    "score": str(current_score),
                    "row_mismatches": str(row_mismatches(bitsets, outputs, width)),
                    "gate": "",
                    "notes": "stopped; no improving Fredkin gate",
                }
            )
            break
        current_score, control, left, right, invert_control, bitsets = best
        rows.append(
            {
                "case": case,
                "depth": str(depth),
                "score": str(current_score),
                "row_mismatches": str(row_mismatches(bitsets, outputs, width)),
                "gate": "{0}:{1}:{2}:{3}".format(control, left, right, invert_control),
                "notes": "greedy Fredkin gate control:left:right:invert",
            }
        )
        if current_score == 0:
            break
    return rows


def parse_pairs(text):
    pairs = []
    for item in text.split(","):
        item = item.strip()
        if not item:
            continue
        left, right = item.split(":", 1)
        pairs.append((int(left), int(right)))
    return pairs


def write_manifest(run_dir, run_id, cases, pairs, max_depth):
    text = """# {0}

Run ID: `{0}`

Purpose: Diagnostic-only greedy Fredkin/controlled-swap probe after exact input
pair canonicalization.  This checks whether a small number of conservative
controlled swaps can rapidly approach the target truth table.

Inputs:
- Truth files: {1}
- Script: `student/generators/unknown_fredkin_greedy_diag.py`
- Pair canonicalization: `{2}`
- Max depth: `{3}`

Artifacts:
- Results: `student/runs/unknown/{0}/results/fredkin_greedy_diagnostics.csv`

Best result:
- Diagnostic-only run; no Verilog/AIG candidates generated.

Notes:
- `student/seeds` and `output/` are intentionally untouched.
""".format(
        run_id,
        ", ".join("benchmarks/{0}.truth".format(case) for case in cases),
        ",".join("{0}:{1}".format(left, right) for left, right in pairs),
        max_depth,
    )
    (run_dir / "MANIFEST.md").write_text(text)


def main(argv=None):
    parser = argparse.ArgumentParser()
    parser.add_argument("--cases", type=parse_cases, required=True)
    parser.add_argument("--pairs", type=parse_pairs, required=True)
    parser.add_argument("--run-id", required=True)
    parser.add_argument("--max-depth", type=int, default=20)
    parser.add_argument("--truth-dir", type=Path, default=ROOT / "benchmarks")
    args = parser.parse_args(argv)

    run_dir = ROOT / "student" / "runs" / "unknown" / args.run_id
    results_dir = run_dir / "results"
    results_dir.mkdir(parents=True, exist_ok=True)
    rows = []
    for case in args.cases:
        rows.extend(run_case(case, args.pairs, args.max_depth, args.truth_dir))
        print("{0}: Fredkin greedy diagnostics complete".format(case), flush=True)
    with (results_dir / "fredkin_greedy_diagnostics.csv").open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=FIELDS)
        writer.writeheader()
        writer.writerows(rows)
    for name in ("candidates.csv", "best.csv", "summary.csv", "evaluate_check.csv"):
        (results_dir / name).write_text(EMPTY_CANDIDATE_HEADER)
    write_manifest(run_dir, args.run_id, args.cases, args.pairs, args.max_depth)
    print("Results: {0}".format(results_dir / "fredkin_greedy_diagnostics.csv"))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
