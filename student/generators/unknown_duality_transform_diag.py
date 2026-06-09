#!/usr/bin/env python3
"""Search complement/permutation dualities for conservative unknown cases."""

import argparse
import csv
import os
import sys

ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", ".."))
if ROOT not in sys.path:
    sys.path.insert(0, ROOT)

from student.frontends.truth import TruthTable


KNOWN_PAIRS = {
    "ex286": [(4, 5), (6, 7)],
    "ex287": [(4, 5), (6, 7), (8, 9)],
    "ex288": [(4, 5), (6, 7), (8, 9)],
    "ex289": [(4, 5), (6, 7), (8, 9), (10, 11)],
}


def perm_identity(width):
    return tuple(range(width))


def perm_reverse(width):
    return tuple(width - 1 - bit for bit in range(width))


def perm_rotate(width, amount):
    return tuple((bit + amount) % width for bit in range(width))


def perm_swap_pairs(width, pairs):
    out = list(range(width))
    for a, b in pairs:
        out[a], out[b] = out[b], out[a]
    return tuple(out)


def compose(p, q):
    return tuple(p[q[i]] for i in range(len(p)))


def unique_perms(items):
    out = []
    seen = set()
    for item in items:
        if item not in seen:
            out.append(item)
            seen.add(item)
    return out


def candidate_perms(width, pairs, basic=False):
    base = [
        perm_identity(width),
        perm_reverse(width),
        perm_swap_pairs(width, pairs),
        compose(perm_reverse(width), perm_swap_pairs(width, pairs)),
        compose(perm_swap_pairs(width, pairs), perm_reverse(width)),
    ]
    if basic:
        return unique_perms(base)
    for amount in [1, -1, 2, -2, width // 2]:
        base.append(perm_rotate(width, amount))
    return unique_perms(base)


def apply_perm(value, perm):
    out = 0
    for src, dst in enumerate(perm):
        if (value >> src) & 1:
            out |= 1 << dst
    return out


def perm_name(perm):
    return ":".join(str(bit) for bit in perm)


def popcount(value):
    return bin(value).count("1")


def test_relation(outputs, width, pin, pout, in_mask, out_mask):
    total = len(outputs)
    ok = 0
    bit_ok = 0
    first = ""
    for x, y in enumerate(outputs):
        xp = apply_perm(x, pin) ^ in_mask
        expected = apply_perm(y, pout) ^ out_mask
        got = outputs[xp]
        if got == expected:
            ok += 1
        elif not first:
            first = "x=0x{0:x};xp=0x{1:x};y=0x{2:x};got=0x{3:x};expected=0x{4:x}".format(
                x, xp, y, got, expected
            )
        bit_ok += width - popcount(got ^ expected)
    return ok, bit_ok, total * width, first


def run_case(case, basic=False, full_mask_only=False):
    table = TruthTable(os.path.join(ROOT, "benchmarks", case + ".truth"))
    outputs = list(table.iter_outputs())
    width = table.input_width
    full = (1 << width) - 1
    pairs = KNOWN_PAIRS.get(case, [])
    in_perms = candidate_perms(width, pairs, basic=basic)
    out_perms = candidate_perms(width, pairs, basic=basic)
    in_masks = [full]
    out_masks = [full]
    # Also test one-sided high-bit toggles as a possible width-family boundary.
    if not full_mask_only:
        in_masks.extend([full ^ (1 << bit) for bit in [0, width - 1]])
        out_masks.extend([full ^ (1 << bit) for bit in [0, width - 1]])

    rows = []
    for pin in in_perms:
        for pout in out_perms:
            for in_mask in in_masks:
                for out_mask in out_masks:
                    ok, bit_ok, total_bits, first = test_relation(outputs, width, pin, pout, in_mask, out_mask)
                    rows.append((ok, bit_ok, case, pin, pout, in_mask, out_mask, total_bits, first))
    rows.sort(key=lambda row: (row[0], row[1]), reverse=True)
    return rows


def main(argv):
    parser = argparse.ArgumentParser()
    parser.add_argument("--cases", nargs="+", default=["ex286", "ex287", "ex288", "ex289"])
    parser.add_argument("--run-id", required=True)
    parser.add_argument("--basic", action="store_true")
    parser.add_argument("--full-mask-only", action="store_true")
    args = parser.parse_args(argv)
    run_dir = os.path.join(ROOT, "student", "runs", "unknown", args.run_id)
    results_dir = os.path.join(run_dir, "results")
    os.makedirs(results_dir, exist_ok=True)
    out_csv = os.path.join(results_dir, "duality_transform_diagnostics.csv")
    with open(out_csv, "w", newline="") as handle:
        writer = csv.writer(handle)
        writer.writerow(["case", "metric", "key", "value", "detail"])
        for case in args.cases:
            for ok, bit_ok, _, pin, pout, in_mask, out_mask, total_bits, first in run_case(case, basic=args.basic, full_mask_only=args.full_mask_only)[:40]:
                key = "pin={0};pout={1};imask=0x{2:x};omask=0x{3:x}".format(
                    perm_name(pin), perm_name(pout), in_mask, out_mask
                )
                detail = "bit_matches={0}/{1};first={2}".format(bit_ok, total_bits, first)
                writer.writerow([case, "affine_perm_duality", key, ok, detail])
    for name in ["candidates.csv", "best.csv", "summary.csv", "evaluate_check.csv"]:
        with open(os.path.join(results_dir, name), "w", newline="") as handle:
            if name == "summary.csv":
                handle.write("case,candidate_id,hypothesis,variant,verilog_path,aig_path,verified_truth,equivalent,area,delay,adp,notes\n")
            elif name == "evaluate_check.csv":
                handle.write("case,candidate_id,equivalent,area,delay,adp,notes\n")
            else:
                handle.write("case,candidate_id,hypothesis,variant,verilog_path,aig_path,area,delay,adp,items,notes\n")
    with open(os.path.join(run_dir, "MANIFEST.md"), "w") as handle:
        handle.write("# {0}\n\n".format(args.run_id))
        handle.write("Diagnostic-only affine/permutation complement-duality search.\n\n")
        handle.write("Artifacts:\n")
        handle.write("- `results/duality_transform_diagnostics.csv`\n\n")
        handle.write("No Verilog/AIG candidates generated. `student/seeds` and `output/` are intentionally untouched.\n")


if __name__ == "__main__":
    main(sys.argv[1:])
