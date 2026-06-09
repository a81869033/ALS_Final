#!/usr/bin/env python3
"""Finite collision/algebra diagnostics for conservative unknown cases."""

import argparse
import csv
import itertools
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from student.frontends.truth import TruthTable


SUMMARY_FIELDS = [
    "case",
    "width",
    "scheme",
    "label_count",
    "pair_table_entries",
    "twohot_exact",
    "twohot_total",
    "twohot_accuracy",
    "full_row_matches",
    "full_total",
    "full_bit_accuracy",
    "first_mismatch",
    "notes",
]

RUN_SUMMARY_FIELDS = [
    "case",
    "current_best_adp",
    "reference_adp",
    "current_ratio_to_reference",
    "best_diag_scheme",
    "best_diag_twohot_exact",
    "best_diag_twohot_total",
    "best_diag_full_rows",
    "best_diag_full_total",
    "best_diag_full_bit_accuracy",
    "conclusion",
]

AFFINE_FIELDS = [
    "case",
    "width",
    "family",
    "params",
    "twohot_exact",
    "twohot_total",
    "accuracy",
    "first_mismatch",
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


def bits_of(value, width):
    return tuple(bit for bit in range(width) if (value >> bit) & 1)


def onepos(value):
    if value == 0 or value & (value - 1):
        return None
    return (value & -value).bit_length() - 1


def swap_bits(value, left, right):
    lb = (value >> left) & 1
    rb = (value >> right) & 1
    if lb == rb:
        return value
    return value ^ (1 << left) ^ (1 << right)


def exact_swap_pairs(outputs, width):
    pairs = []
    for left, right in itertools.combinations(range(width), 2):
        if all(outputs[value] == outputs[swap_bits(value, left, right)] for value in range(1 << width)):
            pairs.append((left, right))
    return pairs


def sym_classes(outputs, width):
    parent = list(range(width))

    def find(value):
        while parent[value] != value:
            parent[value] = parent[parent[value]]
            value = parent[value]
        return value

    def union(left, right):
        lroot = find(left)
        rroot = find(right)
        if lroot != rroot:
            parent[max(lroot, rroot)] = min(lroot, rroot)

    for left, right in exact_swap_pairs(outputs, width):
        union(left, right)
    return [find(bit) for bit in range(width)]


def singleton_homes(outputs, width):
    homes = []
    for bit in range(width):
        pos = onepos(outputs[1 << bit])
        homes.append(-1 if pos is None else pos)
    return homes


def label_schemes(outputs, width):
    homes = singleton_homes(outputs, width)
    syms = sym_classes(outputs, width)
    by_home_seen = {}
    home_occ = []
    for bit, home in enumerate(homes):
        occ = by_home_seen.get(home, 0)
        by_home_seen[home] = occ + 1
        home_occ.append(occ)

    schemes = {
        "home": [(homes[bit],) for bit in range(width)],
        "home_occ": [(homes[bit], home_occ[bit]) for bit in range(width)],
        "home_sym": [(homes[bit], syms[bit]) for bit in range(width)],
        "sym_only": [(syms[bit],) for bit in range(width)],
    }
    for mod in (2, 3, 4, 5, 8):
        schemes["raw_mod{0}".format(mod)] = [(bit % mod,) for bit in range(width)]
        schemes["home_mod{0}".format(mod)] = [(homes[bit], bit % mod) for bit in range(width)]
    schemes["identity_control"] = [(bit,) for bit in range(width)]
    return schemes


def majority(values):
    counts = {}
    for value in values:
        counts[value] = counts.get(value, 0) + 1
    return max(counts.items(), key=lambda item: (item[1], -item[0]))[0]


def pair_model(outputs, width, labels):
    pair_values = {}
    for left, right in itertools.combinations(range(width), 2):
        key = tuple(sorted((labels[left], labels[right])))
        pair_values.setdefault(key, []).append(outputs[(1 << left) | (1 << right)])
    table = {key: majority(values) for key, values in pair_values.items()}

    exact = 0
    first = ""
    for left, right in itertools.combinations(range(width), 2):
        key = tuple(sorted((labels[left], labels[right])))
        pred = table[key]
        exp = outputs[(1 << left) | (1 << right)]
        if pred == exp:
            exact += 1
        elif not first:
            first = "twohot({0},{1}):pred=0x{2:x}:exp=0x{3:x}".format(left, right, pred, exp)
    return table, exact, first


def correction_superposition(outputs, width, labels, pair_table):
    homes = singleton_homes(outputs, width)
    corrections = {}
    for left, right in itertools.combinations(range(width), 2):
        home_mask = (1 << homes[left]) ^ (1 << homes[right])
        key = tuple(sorted((labels[left], labels[right])))
        corrections.setdefault(key, []).append(pair_table[key] ^ home_mask)
    corr_table = {key: majority(values) for key, values in corrections.items()}

    rows = 0
    bit_matches = 0
    first = ""
    for mask, expected in enumerate(outputs):
        active = bits_of(mask, width)
        pred = 0
        for bit in active:
            pred ^= 1 << homes[bit]
        for pos, left in enumerate(active):
            for right in active[pos + 1 :]:
                key = tuple(sorted((labels[left], labels[right])))
                pred ^= corr_table[key]
        if pred == expected:
            rows += 1
        elif not first:
            first = "in=0x{0:x}:pred=0x{1:x}:exp=0x{2:x}".format(mask, pred, expected)
        bit_matches += width - popcount(pred ^ expected)
    return rows, bit_matches, first


def affine_pair_best(outputs, width):
    pairs = list(itertools.combinations(range(width), 2))
    families = []
    for family in ("sumdiff", "symmetric_affine"):
        best = (-1, "", "")
        for a in range(width):
            for b in range(width):
                for c in range(width):
                    exact = 0
                    first = ""
                    for left, right in pairs:
                        if family == "sumdiff":
                            pred = (1 << ((a * (left + right) + c) % width)) | (
                                1 << ((b * (left - right) + c) % width)
                            )
                        else:
                            pred = (1 << ((a * left + b * right + c) % width)) | (
                                1 << ((a * right + b * left + c) % width)
                            )
                        exp = outputs[(1 << left) | (1 << right)]
                        if pred == exp:
                            exact += 1
                        elif not first:
                            first = "twohot({0},{1}):pred=0x{2:x}:exp=0x{3:x}".format(
                                left, right, pred, exp
                            )
                    if exact > best[0]:
                        best = (exact, "a={0};b={1};c={2}".format(a, b, c), first)
        families.append((family, best[1], best[0], best[2]))
    return families


def run_case(case, truth_dir):
    table = TruthTable(truth_dir / "{0}.truth".format(case))
    if table.input_width != table.output_width:
        raise RuntimeError("{0}: expected conservative width, got {1}->{2}".format(case, table.input_width, table.output_width))
    width = table.input_width
    outputs = list(table.iter_outputs())
    pair_total = width * (width - 1) // 2
    summary_rows = []
    for scheme, labels in sorted(label_schemes(outputs, width).items()):
        pair_table, twohot_exact, first_pair = pair_model(outputs, width, labels)
        full_rows, full_bits, first_full = correction_superposition(outputs, width, labels, pair_table)
        label_count = len(set(labels))
        summary_rows.append(
            {
                "case": case,
                "width": width,
                "scheme": scheme,
                "label_count": label_count,
                "pair_table_entries": len(pair_table),
                "twohot_exact": twohot_exact,
                "twohot_total": pair_total,
                "twohot_accuracy": "{0:.6f}".format(twohot_exact / float(pair_total)),
                "full_row_matches": full_rows,
                "full_total": len(outputs),
                "full_bit_accuracy": "{0:.6f}".format(full_bits / float(len(outputs) * width)),
                "first_mismatch": first_full or first_pair,
                "notes": "shared majority pair table plus XOR correction superposition",
            }
        )
    affine_rows = []
    for family, params, exact, first in affine_pair_best(outputs, width):
        affine_rows.append(
            {
                "case": case,
                "width": width,
                "family": family,
                "params": params,
                "twohot_exact": exact,
                "twohot_total": pair_total,
                "accuracy": "{0:.6f}".format(exact / float(pair_total)),
                "first_mismatch": first,
            }
        )
    return summary_rows, affine_rows


def write_csv(path, fields, rows):
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields)
        writer.writeheader()
        writer.writerows(rows)


def write_empty_frontend_csvs(results_dir):
    for name in ("candidates.csv", "best.csv", "evaluate_check.csv"):
        write_csv(results_dir / name, EMPTY_FRONTEND_FIELDS, [])


def load_reference_adp():
    path = ROOT / "reference_result.csv"
    values = {}
    with path.open() as handle:
        reader = csv.DictReader(handle)
        for row in reader:
            values[row["case"]] = int(row["adp"])
    return values


def load_current_best_adp():
    path = ROOT / "student" / "results" / "current_best_by_case.csv"
    values = {}
    with path.open() as handle:
        reader = csv.DictReader(handle)
        for row in reader:
            values[row["case"]] = int(row["best_adp"])
    return values


def run_summary_rows(summary_rows):
    ref = load_reference_adp()
    cur = load_current_best_adp()
    by_case = {}
    for row in summary_rows:
        by_case.setdefault(row["case"], []).append(row)
    rows = []
    for case in sorted(by_case):
        best = max(
            by_case[case],
            key=lambda row: (
                int(row["full_row_matches"]),
                float(row["full_bit_accuracy"]),
                int(row["twohot_exact"]),
            ),
        )
        current = cur.get(case, 0)
        reference = ref.get(case, 0)
        ratio = current / float(reference) if reference else 0.0
        rows.append(
            {
                "case": case,
                "current_best_adp": current,
                "reference_adp": reference,
                "current_ratio_to_reference": "{0:.6f}".format(ratio),
                "best_diag_scheme": best["scheme"],
                "best_diag_twohot_exact": best["twohot_exact"],
                "best_diag_twohot_total": best["twohot_total"],
                "best_diag_full_rows": best["full_row_matches"],
                "best_diag_full_total": best["full_total"],
                "best_diag_full_bit_accuracy": best["full_bit_accuracy"],
                "conclusion": "reject finite pair-collision algebra as a large-drop structure",
            }
        )
    return rows


def write_manifest(run_dir, run_id, cases):
    text = """# {0}

Run ID: `{0}`

Purpose: Diagnostic-only finite collision/algebra search for ex286-ex289.  This
tests whether low-weight conservative behavior can be explained by compact
hidden labels, a small pair-collision table, or simple modular affine pair
operations.  These are large-drop candidates only if the two-hot layer and the
full-table correction superposition are both close to exact.

Inputs:
- Truth files: {1}
- Script: `student/generators/unknown_finite_collision_diag.py`

Artifacts:
- Results directory: `student/runs/unknown/{0}/results/`
- Main diagnostics: `results/finite_collision_summary.csv`
- Modular pair diagnostics: `results/finite_affine_pair_summary.csv`
- Run summary: `results/summary.csv`
- Empty frontend CSVs: `results/candidates.csv`, `results/best.csv`, `results/evaluate_check.csv`

Methods tried:
- Hidden labels from one-hot home slot, exact input symmetries, home occurrence,
  raw modular labels, and home-plus-modular labels.
- Majority pair-collision table for each label scheme.
- Full-table XOR correction superposition derived from singleton homes and pair
  collision tables.
- Symmetric modular affine two-hot pair rules.

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
    parser.add_argument("--truth-dir", type=Path, default=ROOT / "benchmarks")
    args = parser.parse_args(argv)

    run_dir = ROOT / "student" / "runs" / "unknown" / args.run_id
    results_dir = run_dir / "results"
    all_summary = []
    all_affine = []
    for case in args.cases:
        summary_rows, affine_rows = run_case(case, args.truth_dir)
        all_summary.extend(summary_rows)
        all_affine.extend(affine_rows)
        best = max(summary_rows, key=lambda row: (int(row["full_row_matches"]), int(row["twohot_exact"])))
        print(
            "{0}: best {1} full={2}/{3} twohot={4}/{5}".format(
                case,
                best["scheme"],
                best["full_row_matches"],
                best["full_total"],
                best["twohot_exact"],
                best["twohot_total"],
            ),
            flush=True,
        )
    write_csv(results_dir / "finite_collision_summary.csv", SUMMARY_FIELDS, all_summary)
    write_csv(results_dir / "finite_affine_pair_summary.csv", AFFINE_FIELDS, all_affine)
    write_csv(results_dir / "summary.csv", RUN_SUMMARY_FIELDS, run_summary_rows(all_summary))
    write_empty_frontend_csvs(results_dir)
    write_manifest(run_dir, args.run_id, args.cases)
    print("Results: {0}".format(results_dir))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
