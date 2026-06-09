#!/usr/bin/env python3
"""Pair-interaction diagnostics for Hamming-weight-preserving unknown cases."""

import argparse
import csv
import itertools
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from student.frontends.truth import TruthTable
from student.generators.unknown_bdd_search import SharedBddBuilder, permute_plane
from student.generators.unknown_verilog_search import parse_cases


FIELDS = ["case", "metric", "key", "value", "detail"]
EMPTY_CANDIDATE_HEADER = (
    "case,candidate_id,hypothesis,variant,verilog_path,aig_path,"
    "verified_truth,equivalent,area,delay,adp,notes\n"
)


def popcount(value):
    return bin(value).count("1")


def positions(value, width):
    return tuple(bit for bit in range(width) if (value >> bit) & 1)


def one_position(value):
    if value == 0 or (value & (value - 1)) != 0:
        return -1
    return (value & -value).bit_length() - 1


def gf_rank(rows):
    basis = {}
    for row in rows:
        value = row
        while value:
            pivot = value.bit_length() - 1
            old = basis.get(pivot)
            if old is None:
                basis[pivot] = value
                break
            value ^= old
    return len(basis)


def gf_basis(rows):
    basis = {}
    for index, row in enumerate(rows):
        value = row
        used = 0
        while value:
            pivot = value.bit_length() - 1
            old = basis.get(pivot)
            if old is None:
                basis[pivot] = (value, 1 << index)
                break
            value ^= old[0]
            used ^= old[1]
    return basis


def rank_matrix_for_output(outputs, width, out_bit):
    rows = []
    ones = 0
    for left in range(width):
        row = 0
        for right in range(width):
            if left == right:
                continue
            if (outputs[(1 << left) | (1 << right)] >> out_bit) & 1:
                row |= 1 << right
                ones += 1
        rows.append(row)
    return rows, ones // 2


def pair_rows(case, outputs, width):
    rows = []
    onehot = [one_position(outputs[1 << bit]) for bit in range(width)]
    rows.append(
        {
            "case": case,
            "metric": "onehot_map",
            "key": "input_to_output_slot",
            "value": ":".join(str(item) for item in onehot),
            "detail": "",
        }
    )

    by_onehot_pair = {}
    conflicts = 0
    first = ""
    for left, right in itertools.combinations(range(width), 2):
        key = tuple(sorted((onehot[left], onehot[right])))
        value = outputs[(1 << left) | (1 << right)]
        old = by_onehot_pair.get(key)
        if old is None:
            by_onehot_pair[key] = value
        elif old != value:
            conflicts += 1
            if not first:
                first = "inputs={0}:{1};slot_pair={2};old=0x{3:x};new=0x{4:x}".format(
                    left, right, ":".join(str(item) for item in key), old, value
                )
    rows.append(
        {
            "case": case,
            "metric": "twohot_onehot_pair_conflicts",
            "key": "slot_pair_to_output",
            "value": str(conflicts),
            "detail": "keys={0};pairs={1};first={2}".format(
                len(by_onehot_pair), width * (width - 1) // 2, first
            ),
        }
    )

    rank_items = []
    low_rank_bits = []
    for out_bit in range(width):
        matrix_rows, ones = rank_matrix_for_output(outputs, width, out_bit)
        rank = gf_rank(matrix_rows)
        rank_items.append("b{0}:r{1}:ones{2}".format(out_bit, rank, ones))
        if rank <= 4:
            low_rank_bits.append(out_bit)
        rows.append(
            {
                "case": case,
                "metric": "twohot_output_matrix",
                "key": "out{0}".format(out_bit),
                "value": str(rank),
                "detail": "ones={0};rows={1}".format(
                    ones,
                    ":".join("{0:x}".format(item) for item in matrix_rows),
                ),
            }
        )
    rows.append(
        {
            "case": case,
            "metric": "twohot_rank_summary",
            "key": "all_output_bits",
            "value": ";".join(rank_items),
            "detail": "low_rank_bits={0}".format(":".join(str(bit) for bit in low_rank_bits)),
        }
    )
    return rows


def degree2_rows(case, outputs, width):
    """Check whether low-rank two-hot bits extend to degree-2 ANF bits."""
    rows = []
    samples = [value for value in range(1 << width)]
    for out_bit in range(width):
        # Build the exact degree-2 polynomial implied by zero/one/two-hot rows.
        const = outputs[0] >> out_bit & 1
        linear = []
        for bit in range(width):
            linear.append(((outputs[1 << bit] >> out_bit) & 1) ^ const)
        quadratic = {}
        for left, right in itertools.combinations(range(width), 2):
            val = (outputs[(1 << left) | (1 << right)] >> out_bit) & 1
            coeff = val ^ const ^ linear[left] ^ linear[right]
            if coeff:
                quadratic[(left, right)] = 1
        matches = 0
        first = ""
        for index in samples:
            value = const
            for bit in range(width):
                if (index >> bit) & 1:
                    value ^= linear[bit]
            active = positions(index, width)
            for pos, left in enumerate(active):
                for right in active[pos + 1 :]:
                    if (left, right) in quadratic:
                        value ^= 1
            expected = (outputs[index] >> out_bit) & 1
            if value == expected:
                matches += 1
            elif not first:
                first = "x=0x{0:x};expected={1};pred={2}".format(index, expected, value)
        if matches == len(samples) or matches > len(samples) * 3 // 4 or out_bit in (0, 1, width - 2, width - 1):
            rows.append(
                {
                    "case": case,
                    "metric": "degree2_from_twohot",
                    "key": "out{0}".format(out_bit),
                    "value": "{0}/{1}".format(matches, len(samples)),
                    "detail": "linear={0};quadratic_terms={1};first={2}".format(
                        "".join(str(item) for item in linear), len(quadratic), first
                    ),
                }
            )
    return rows


def interleave_order(width):
    order = []
    low = 0
    high = width - 1
    while low <= high:
        order.append(low)
        if high != low:
            order.append(high)
        low += 1
        high -= 1
    return order


def degree2_model(outputs, width, out_bit):
    const = (outputs[0] >> out_bit) & 1
    linear = [((outputs[1 << bit] >> out_bit) & 1) ^ const for bit in range(width)]
    quadratic = set()
    for left, right in itertools.combinations(range(width), 2):
        val = (outputs[(1 << left) | (1 << right)] >> out_bit) & 1
        if val ^ const ^ linear[left] ^ linear[right]:
            quadratic.add((left, right))
    values = []
    for index in range(1 << width):
        value = const
        active = positions(index, width)
        for bit in active:
            value ^= linear[bit]
        for pos, left in enumerate(active):
            for right in active[pos + 1 :]:
                if (left, right) in quadratic:
                    value ^= 1
        values.append(value)
    return values, linear, quadratic


def bdd_node_count(bit_values, order):
    builder = SharedBddBuilder(order)
    root = builder.build(permute_plane(bit_values, order), 0)
    return len(builder.nodes), root


def residual_bdd_rows(case, outputs, width):
    rows = []
    order = interleave_order(width)
    for out_bit in range(width):
        raw = [(value >> out_bit) & 1 for value in outputs]
        degree2, linear, quadratic = degree2_model(outputs, width, out_bit)
        residual = [left ^ right for left, right in zip(raw, degree2)]
        raw_nodes, _raw_root = bdd_node_count(raw, order)
        residual_nodes, _residual_root = bdd_node_count(residual, order)
        matches = len(raw) - sum(residual)
        if (
            residual_nodes < raw_nodes
            or matches > len(raw) * 3 // 4
            or out_bit in (0, 1, width - 2, width - 1)
        ):
            rows.append(
                {
                    "case": case,
                    "metric": "degree2_residual_bdd",
                    "key": "out{0}".format(out_bit),
                    "value": "{0}->{1}".format(raw_nodes, residual_nodes),
                    "detail": "matches={0}/{1};linear_terms={2};quadratic_terms={3};order={4}".format(
                        matches,
                        len(raw),
                        sum(linear),
                        len(quadratic),
                        ":".join(str(bit) for bit in order),
                    ),
                }
            )
    return rows


def write_manifest(run_dir, run_id, cases):
    text = """# {0}

Run ID: `{0}`

Purpose: Diagnostic-only pair-interaction analysis for ex286-ex289.  This tests
whether the Hamming-weight-preserving maps expose a compact two-hot interaction
structure, low-rank output matrices, or degree-2 behavior implied by one/two-hot
rows.

Inputs:
- Truth files: {1}
- Script: `student/generators/unknown_pair_interaction_diag.py`

Artifacts:
- Results: `student/runs/unknown/{0}/results/pair_interaction_diagnostics.csv`

Best result:
- Diagnostic-only run; no Verilog/AIG candidates generated.

Notes:
- `student/seeds` and `output/` are intentionally untouched.
""".format(
        run_id,
        ", ".join("benchmarks/{0}.truth".format(case) for case in cases),
    )
    (run_dir / "MANIFEST.md").write_text(text)


def main(argv=None):
    parser = argparse.ArgumentParser()
    parser.add_argument("--cases", type=parse_cases, default=parse_cases("ex286-ex289"))
    parser.add_argument("--run-id", required=True)
    parser.add_argument("--truth-dir", type=Path, default=ROOT / "benchmarks")
    args = parser.parse_args(argv)

    run_dir = ROOT / "student" / "runs" / "unknown" / args.run_id
    results_dir = run_dir / "results"
    results_dir.mkdir(parents=True, exist_ok=True)

    rows = []
    for case in args.cases:
        table = TruthTable(args.truth_dir / "{0}.truth".format(case))
        outputs = list(table.iter_outputs())
        rows.extend(pair_rows(case, outputs, table.input_width))
        rows.extend(degree2_rows(case, outputs, table.input_width))
        rows.extend(residual_bdd_rows(case, outputs, table.input_width))
        print("{0}: pair interaction diagnostics complete".format(case), flush=True)

    with (results_dir / "pair_interaction_diagnostics.csv").open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=FIELDS)
        writer.writeheader()
        writer.writerows(rows)
    for name in ("candidates.csv", "best.csv", "summary.csv", "evaluate_check.csv"):
        (results_dir / name).write_text(EMPTY_CANDIDATE_HEADER)
    write_manifest(run_dir, args.run_id, args.cases)
    print("Results: {0}".format(results_dir / "pair_interaction_diagnostics.csv"))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
