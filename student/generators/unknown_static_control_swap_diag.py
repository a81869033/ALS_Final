#!/usr/bin/env python3
"""Static-feature controlled-swap diagnostics for conservative unknown cases."""

import argparse
import csv
import itertools
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from student.frontends.truth import TruthTable


POPCOUNT_8 = [bin(index).count("1") for index in range(256)]

DETAIL_FIELDS = [
    "case",
    "start",
    "depth",
    "score",
    "row_mismatches",
    "gate",
    "notes",
]

SUMMARY_FIELDS = [
    "case",
    "start",
    "initial_score",
    "initial_row_mismatches",
    "best_depth",
    "best_score",
    "best_row_mismatches",
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


def popcount_factory(num_bits):
    num_bytes = (num_bits + 7) // 8

    def popcount(value):
        return sum(POPCOUNT_8[byte] for byte in value.to_bytes(num_bytes, "little"))

    return popcount


def popcount_small(value):
    return bin(value).count("1")


def bits_of(value, width):
    return [bit for bit in range(width) if (value >> bit) & 1]


def onepos(value):
    if value == 0 or value & (value - 1):
        return -1
    return (value & -value).bit_length() - 1


def bitsets_from_values(values, width):
    bitsets = []
    for bit in range(width):
        packed = 0
        for index, value in enumerate(values):
            if (value >> bit) & 1:
                packed |= 1 << index
        bitsets.append(packed)
    return bitsets


def row_mismatches(bitsets, target_values, width):
    mismatches = 0
    for index, expected in enumerate(target_values):
        value = 0
        for bit, packed in enumerate(bitsets):
            if (packed >> index) & 1:
                value |= 1 << bit
        if value != expected:
            mismatches += 1
    return mismatches


def score(bitsets, target_bitsets, popcount):
    return sum(popcount(left ^ right) for left, right in zip(bitsets, target_bitsets))


def swap_score_delta(bitsets, target_bitsets, control_mask, left, right, popcount):
    swap_mask = control_mask & (bitsets[left] ^ bitsets[right])
    if not swap_mask:
        return 0
    new_left = bitsets[left] ^ swap_mask
    new_right = bitsets[right] ^ swap_mask
    old = popcount(bitsets[left] ^ target_bitsets[left]) + popcount(bitsets[right] ^ target_bitsets[right])
    new = popcount(new_left ^ target_bitsets[left]) + popcount(new_right ^ target_bitsets[right])
    return new - old


def apply_swap(bitsets, control_mask, left, right):
    swap_mask = control_mask & (bitsets[left] ^ bitsets[right])
    updated = list(bitsets)
    updated[left] = bitsets[left] ^ swap_mask
    updated[right] = bitsets[right] ^ swap_mask
    return updated


def onehot_slots(outputs, width):
    return [onepos(outputs[1 << bit]) for bit in range(width)]


def exact_swap_pairs(outputs, width):
    pairs = []
    for left, right in itertools.combinations(range(width), 2):
        ok = True
        for value in range(1 << width):
            lb = (value >> left) & 1
            rb = (value >> right) & 1
            if lb == rb:
                swapped = value
            else:
                swapped = value ^ (1 << left) ^ (1 << right)
            if outputs[value] != outputs[swapped]:
                ok = False
                break
        if ok:
            pairs.append((left, right))
    return pairs


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


def bucket_info(onehot):
    by_slot = {}
    for bit, slot in enumerate(onehot):
        by_slot.setdefault(slot, []).append(bit)
    return [(slot, tuple(bits)) for slot, bits in sorted(by_slot.items())]


def control_masks(outputs, width, full_mask, mode):
    controls = []
    seen = set()

    def add(name, mask):
        mask &= full_mask
        if mask == 0 or mask == full_mask or mask in seen:
            return
        seen.add(mask)
        controls.append((name, mask))

    for bit in range(width):
        mask = 0
        for row in range(1 << width):
            if (row >> bit) & 1:
                mask |= 1 << row
        add("in{0}".format(bit), mask)
        add("not_in{0}".format(bit), full_mask ^ mask)

    pairs = exact_swap_pairs(outputs, width)
    for left, right in pairs:
        or_mask = 0
        and_mask = 0
        xor_mask = 0
        for row in range(1 << width):
            lb = (row >> left) & 1
            rb = (row >> right) & 1
            if lb | rb:
                or_mask |= 1 << row
            if lb & rb:
                and_mask |= 1 << row
            if lb ^ rb:
                xor_mask |= 1 << row
        add("pair{0}_{1}_or".format(left, right), or_mask)
        add("pair{0}_{1}_and".format(left, right), and_mask)
        add("pair{0}_{1}_xor".format(left, right), xor_mask)

    prefix_parity = 0
    for stop in range(width):
        prefix_parity ^= 1 << stop
        mask = 0
        for row in range(1 << width):
            if popcount_small(row & ((1 << (stop + 1)) - 1)) & 1:
                mask |= 1 << row
        add("prefix_parity_le{0}".format(stop), mask)

    intervals = []
    for stop in range(1, width + 1):
        intervals.append((0, stop))
    for start in range(width):
        intervals.append((start, width))
    if mode == "wide":
        for start in range(width):
            for stop in range(start + 1, width + 1):
                span = stop - start
                if span <= 5 or start == 0 or stop == width:
                    intervals.append((start, stop))
    intervals = sorted(set(intervals))
    for start, stop in intervals:
        span = stop - start
        if span <= 0:
            continue
        field_mask = ((1 << stop) - 1) ^ ((1 << start) - 1)
        for threshold in range(1, min(span, 4) + 1):
            ge_mask = 0
            eq_mask = 0
            for row in range(1 << width):
                count = popcount_small(row & field_mask)
                if count >= threshold:
                    ge_mask |= 1 << row
                if count == threshold:
                    eq_mask |= 1 << row
            add("cnt{0}_{1}_ge{2}".format(start, stop - 1, threshold), ge_mask)
            add("cnt{0}_{1}_eq{2}".format(start, stop - 1, threshold), eq_mask)

    onehot = onehot_slots(outputs, width)
    for bucket_index, (_slot, members) in enumerate(bucket_info(onehot)):
        if len(members) <= 1:
            continue
        field_mask = 0
        for bit in members:
            field_mask |= 1 << bit
        for threshold in range(1, len(members) + 1):
            ge_mask = 0
            eq_mask = 0
            for row in range(1 << width):
                count = popcount_small(row & field_mask)
                if count >= threshold:
                    ge_mask |= 1 << row
                if count == threshold:
                    eq_mask |= 1 << row
            add("bucket{0}_ge{1}".format(bucket_index, threshold), ge_mask)
            add("bucket{0}_eq{1}".format(bucket_index, threshold), eq_mask)

    return controls


def start_values(name, width, pairs):
    if name == "identity":
        return list(range(1 << width))
    if name == "pair_canonical":
        return [pair_key_value(row, pairs) for row in range(1 << width)]
    raise RuntimeError("unknown start: {0}".format(name))


def run_greedy(case, outputs, width, start_name, controls, pairs, max_depth):
    count = 1 << width
    popcount = popcount_factory(count)
    target_bitsets = bitsets_from_values(outputs, width)
    bitsets = bitsets_from_values(start_values(start_name, width, pairs), width)
    current_score = score(bitsets, target_bitsets, popcount)
    current_rows = row_mismatches(bitsets, outputs, width)
    rows = [
        {
            "case": case,
            "start": start_name,
            "depth": "0",
            "score": current_score,
            "row_mismatches": current_rows,
            "gate": "",
            "notes": "controls={0}; exact_pairs={1}".format(
                len(controls),
                ":".join("{0}-{1}".format(left, right) for left, right in pairs),
            ),
        }
    ]
    best_snapshot = (0, current_score, current_rows)
    for depth in range(1, max_depth + 1):
        best = None
        for cname, cmask in controls:
            inv_variants = ((cname, cmask), ("not({0})".format(cname), ((1 << count) - 1) ^ cmask))
            for vname, vmask in inv_variants:
                for left, right in itertools.combinations(range(width), 2):
                    delta = swap_score_delta(bitsets, target_bitsets, vmask, left, right, popcount)
                    if best is None or delta < best[0]:
                        best = (delta, vname, vmask, left, right)
        if best is None or best[0] >= 0:
            rows.append(
                {
                    "case": case,
                    "start": start_name,
                    "depth": str(depth),
                    "score": current_score,
                    "row_mismatches": current_rows,
                    "gate": "",
                    "notes": "stopped; no improving static-feature controlled swap",
                }
            )
            break
        delta, control_name, control_mask, left, right = best
        bitsets = apply_swap(bitsets, control_mask, left, right)
        current_score += delta
        current_rows = row_mismatches(bitsets, outputs, width)
        rows.append(
            {
                "case": case,
                "start": start_name,
                "depth": str(depth),
                "score": current_score,
                "row_mismatches": current_rows,
                "gate": "{0}:swap{1}_{2}:delta{3}".format(control_name, left, right, delta),
                "notes": "static-feature controlled swap",
            }
        )
        if current_score < best_snapshot[1]:
            best_snapshot = (depth, current_score, current_rows)
        if current_score == 0:
            break
    return rows, best_snapshot


def write_csv(path, fields, rows):
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields)
        writer.writeheader()
        writer.writerows(rows)


def write_empty_frontend_csvs(results_dir):
    for name in ("candidates.csv", "best.csv", "evaluate_check.csv"):
        write_csv(results_dir / name, EMPTY_FRONTEND_FIELDS, [])


def write_manifest(run_dir, run_id, cases, max_depth):
    text = """# {0}

Run ID: `{0}`

Purpose: Diagnostic-only static-feature controlled-swap search for ex286-ex289.
This strengthens the earlier Fredkin greedy check by allowing controls from
raw input bits, exact symmetry-pair signals, prefix/window count thresholds, and
one-hot bucket-count thresholds.  It remains frontend-RTL-relevant because each
step is a conservative mux-swap with a small static control.

Inputs:
- Truth files: {1}
- Script: `student/generators/unknown_static_control_swap_diag.py`
- Max greedy depth: `{2}`

Artifacts:
- Results directory: `student/runs/unknown/{0}/results/`
- Detail CSV: `results/static_control_swap_diagnostics.csv`
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
    )
    (run_dir / "MANIFEST.md").write_text(text)


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--cases", type=parse_cases, default=parse_cases("ex286-ex289"))
    parser.add_argument("--run-id", required=True)
    parser.add_argument("--truth-dir", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--max-depth", type=int, default=12)
    parser.add_argument("--control-mode", choices=("narrow", "wide"), default="narrow")
    args = parser.parse_args(argv)

    run_dir = ROOT / "student" / "runs" / "unknown" / args.run_id
    results_dir = run_dir / "results"
    detail_rows = []
    summary_rows = []
    for case in args.cases:
        table = TruthTable(args.truth_dir / "{0}.truth".format(case))
        if table.input_width != table.output_width:
            raise RuntimeError("{0}: width mismatch".format(case))
        outputs = list(table.iter_outputs())
        width = table.input_width
        full_mask = (1 << (1 << width)) - 1
        pairs = exact_swap_pairs(outputs, width)
        controls = control_masks(outputs, width, full_mask, args.control_mode)
        for start in ("identity", "pair_canonical"):
            rows, best = run_greedy(case, outputs, width, start, controls, pairs, args.max_depth)
            detail_rows.extend(rows)
            initial = rows[0]
            best_depth, best_score, best_mismatches = best
            summary_rows.append(
                {
                    "case": case,
                    "start": start,
                    "initial_score": initial["score"],
                    "initial_row_mismatches": initial["row_mismatches"],
                    "best_depth": best_depth,
                    "best_score": best_score,
                    "best_row_mismatches": best_mismatches,
                    "score_reduction": int(initial["score"]) - int(best_score),
                    "row_reduction": int(initial["row_mismatches"]) - int(best_mismatches),
                    "conclusion": "strong lead" if best_mismatches < (1 << width) // 10 else "weak controlled-routing lead",
                }
            )
            print(
                "{0} {1}: best depth {2} score {3} rows {4}".format(
                    case, start, best_depth, best_score, best_mismatches
                ),
                flush=True,
            )
    write_csv(results_dir / "static_control_swap_diagnostics.csv", DETAIL_FIELDS, detail_rows)
    write_csv(results_dir / "summary.csv", SUMMARY_FIELDS, summary_rows)
    write_empty_frontend_csvs(results_dir)
    write_manifest(run_dir, args.run_id, args.cases, args.max_depth)
    print("Results: {0}".format(results_dir))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
