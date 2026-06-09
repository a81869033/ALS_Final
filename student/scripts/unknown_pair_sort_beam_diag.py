#!/usr/bin/env python3
"""Beam-search diagnostics for small conservative pair-sort networks."""

import argparse
import csv
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from student.frontends.truth import TruthTable
from student.generators.unknown_verilog_search import parse_cases


FIELDS = [
    "case",
    "depth",
    "rank",
    "bit_score",
    "row_mismatches",
    "path",
    "notes",
]


def popcount(value):
    return bin(value).count("1")


def bitsets_from_outputs(outputs, width):
    bitsets = []
    for bit in range(width):
        packed = 0
        for index, value in enumerate(outputs):
            if (value >> bit) & 1:
                packed |= 1 << index
        bitsets.append(packed)
    return tuple(bitsets)


def identity_bitsets(width):
    rows = 1 << width
    bitsets = []
    for bit in range(width):
        packed = 0
        mask = 1 << bit
        for index in range(rows):
            if index & mask:
                packed |= 1 << index
        bitsets.append(packed)
    return tuple(bitsets)


def apply_pair_sort(bitsets, left, right, high_to_left):
    a = bitsets[left]
    b = bitsets[right]
    high = a | b
    low = a & b
    out = list(bitsets)
    if high_to_left:
        out[left] = high
        out[right] = low
    else:
        out[left] = low
        out[right] = high
    return tuple(out)


def score(bitsets, target):
    return sum(popcount(a ^ b) for a, b in zip(bitsets, target))


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


def row_mismatches_sample(bitsets, outputs, width, indices):
    mismatches = 0
    for index in indices:
        expected = outputs[index]
        actual = 0
        for bit, packed in enumerate(bitsets):
            if (packed >> index) & 1:
                actual |= 1 << bit
        if actual != expected:
            mismatches += 1
    return mismatches


def sample_indices(width):
    rows = 1 << width
    selected = set([0, rows - 1])
    for bit in range(width):
        selected.add(1 << bit)
    for a in range(width):
        for b in range(a + 1, width):
            selected.add((1 << a) | (1 << b))
    step = max(1, rows // 512)
    for index in range(0, rows, step):
        selected.add(index)
    return sorted(selected)


def network_ops(width):
    ops = []
    for left in range(width):
        for right in range(left + 1, width):
            ops.append((left, right, 0))
            ops.append((left, right, 1))
    return ops


def run_case(case, benchmarks, max_depth, beam_size, report_rows):
    table = TruthTable(benchmarks / "{0}.truth".format(case))
    outputs = list(table.iter_outputs())
    width = table.input_width
    target = bitsets_from_outputs(outputs, width)
    ops = network_ops(width)
    sample = sample_indices(width)
    start = identity_bitsets(width)
    beam = [(score(start, target), (), start)]
    rows = []
    seen = {start}
    for depth in range(0, max_depth + 1):
        for rank, (bit_score, path, bitsets) in enumerate(beam[:report_rows], 1):
            rows.append(
                {
                    "case": case,
                    "depth": depth,
                    "rank": rank,
                    "bit_score": bit_score,
                    "row_mismatches": row_mismatches_sample(bitsets, outputs, width, sample),
                    "path": ";".join(path),
                    "notes": "row_mismatches sampled over {0} rows".format(len(sample)),
                }
            )
        if depth == max_depth or beam[0][0] == 0:
            break
        candidates = []
        for _bit_score, path, bitsets in beam:
            previous = path[-1] if path else ""
            for left, right, high_to_left in ops:
                opname = "{0}:{1}:{2}".format(left, right, high_to_left)
                if opname == previous:
                    continue
                nxt = apply_pair_sort(bitsets, left, right, high_to_left)
                if nxt in seen:
                    continue
                seen.add(nxt)
                candidates.append((score(nxt, target), path + (opname,), nxt))
        candidates.sort(key=lambda item: item[0])
        beam = candidates[:beam_size]
    best_score, best_path, best_bitsets = beam[0]
    rows.append(
        {
            "case": case,
            "depth": "final",
            "rank": 1,
            "bit_score": best_score,
            "row_mismatches": row_mismatches(best_bitsets, outputs, width),
            "path": ";".join(best_path),
            "notes": "full row mismatch for final best",
        }
    )
    return rows


def main(argv=None):
    parser = argparse.ArgumentParser()
    parser.add_argument("--cases", type=parse_cases, required=True)
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--max-depth", type=int, default=8)
    parser.add_argument("--beam-size", type=int, default=64)
    parser.add_argument("--report-rows", type=int, default=5)
    parser.add_argument("--results", type=Path, required=True)
    args = parser.parse_args(argv)

    rows = []
    for case in args.cases:
        case_rows = run_case(case, args.benchmarks, args.max_depth, args.beam_size, args.report_rows)
        rows.extend(case_rows)
        final = case_rows[-1]
        print(
            "{0} final bit_score={1} rows={2} path={3}".format(
                case,
                final["bit_score"],
                final["row_mismatches"],
                final["path"],
            )
        )
    args.results.parent.mkdir(parents=True, exist_ok=True)
    with args.results.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=FIELDS)
        writer.writeheader()
        writer.writerows(rows)
    print("rows={0} output={1}".format(len(rows), args.results))


if __name__ == "__main__":
    raise SystemExit(main())
