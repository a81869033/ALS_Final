#!/usr/bin/env python3
"""Popcount-layer diagnostics for unknown Hamming-weight-preserving cases."""

import argparse
import csv
from collections import Counter, defaultdict
from pathlib import Path
import sys


ROOT = Path(__file__).resolve().parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from student.frontends.truth import TruthTable


def popcount(value):
    return bin(value).count("1")


def positions(value, width):
    return tuple(bit for bit in range(width) if (value >> bit) & 1)


def jaccard(a, b):
    inter = popcount(a & b)
    uni = popcount(a | b)
    return 1.0 if uni == 0 else float(inter) / float(uni)


def layer_rows(case, outputs, width):
    rows = []
    by_weight = defaultdict(list)
    for x, y in enumerate(outputs):
        by_weight[popcount(x)].append((x, y))
    for weight in range(width + 1):
        items = by_weight[weight]
        out_counter = Counter(y for _x, y in items)
        max_pre = max(out_counter.values()) if out_counter else 0
        singleton = sum(1 for value in out_counter.values() if value == 1)
        fixed = sum(1 for x, y in items if x == y)
        avg_hdist = sum(popcount(x ^ y) for x, y in items) / float(len(items) or 1)
        avg_jacc = sum(jaccard(x, y) for x, y in items) / float(len(items) or 1)
        rows.append({
            "case": case,
            "metric": "layer",
            "key": str(weight),
            "value": str(len(out_counter)),
            "detail": "inputs={0}; max_preimage={1}; singleton_outputs={2}; fixed={3}; avg_hdist={4:.4f}; avg_jaccard={5:.4f}".format(
                len(items), max_pre, singleton, fixed, avg_hdist, avg_jacc
            ),
        })
    return rows


def endpoint_rows(case, outputs, width):
    rows = []
    for weight in range(1, width):
        pairs = [(x, y) for x, y in enumerate(outputs) if popcount(x) == weight]
        if not pairs:
            continue
        input_min_counts = Counter()
        input_max_counts = Counter()
        output_min_counts = Counter()
        output_max_counts = Counter()
        delta_min = Counter()
        delta_max = Counter()
        for x, y in pairs:
            ip = positions(x, width)
            op = positions(y, width)
            input_min_counts[ip[0]] += 1
            input_max_counts[ip[-1]] += 1
            output_min_counts[op[0]] += 1
            output_max_counts[op[-1]] += 1
            delta_min[(op[0] - ip[0]) % width] += 1
            delta_max[(op[-1] - ip[-1]) % width] += 1
        for name, counter in (
            ("in_min", input_min_counts),
            ("in_max", input_max_counts),
            ("out_min", output_min_counts),
            ("out_max", output_max_counts),
            ("delta_min", delta_min),
            ("delta_max", delta_max),
        ):
            top = counter.most_common(6)
            rows.append({
                "case": case,
                "metric": "endpoint",
                "key": "{0}_w{1}".format(name, weight),
                "value": str(top[0][1] if top else 0),
                "detail": ";".join("{0}:{1}".format(k, v) for k, v in top),
            })
    return rows


def adjacent_rows(case, outputs, width):
    rows = []
    masks = [(1 << weight) - 1 for weight in range(width + 1)]
    for weight in range(1, min(width, 8) + 1):
        # Contiguous runs and simple centered masks are cheap fingerprints for
        # canonical placement within a popcount layer.
        matches = Counter()
        total = 0
        for x, y in enumerate(outputs):
            if popcount(x) != weight:
                continue
            total += 1
            for start in range(width):
                mask = 0
                for off in range(weight):
                    mask |= 1 << ((start + off) % width)
                if y == mask:
                    matches["ring_run"] += 1
            if y == masks[weight]:
                matches["low_run"] += 1
            if y == (((1 << weight) - 1) << ((width - weight) // 2)):
                matches["center_run"] += 1
            if y == (((1 << weight) - 1) << (width - weight)):
                matches["high_run"] += 1
        rows.append({
            "case": case,
            "metric": "canonical_run",
            "key": str(weight),
            "value": str(total),
            "detail": ";".join("{0}:{1}".format(k, matches[k]) for k in sorted(matches)),
        })
    return rows


def pair_feature_rows(case, outputs, width, pairs):
    rows = []
    paired = set(bit for pair in pairs for bit in pair)
    singles = [bit for bit in range(width) if bit not in paired]
    for out_bit in range(width):
        for feature_name in ("pair_counts", "pair_counts_pop", "pair_counts_singles"):
            seen = {}
            conflicts = 0
            for x, y in enumerate(outputs):
                fields = []
                for a, b in pairs:
                    fields.append(((x >> a) & 1) + ((x >> b) & 1))
                if feature_name != "pair_counts":
                    fields.append(popcount(x))
                if feature_name == "pair_counts_singles":
                    for bit in singles:
                        fields.append((x >> bit) & 1)
                key = tuple(fields)
                val = (y >> out_bit) & 1
                old = seen.get(key)
                if old is None:
                    seen[key] = val
                elif old != val:
                    conflicts += 1
            if conflicts == 0 or out_bit in (0, 1, width - 2, width - 1):
                rows.append({
                    "case": case,
                    "metric": "pair_feature_bit",
                    "key": "{0}_out{1}".format(feature_name, out_bit),
                    "value": str(0 if conflicts == 0 else conflicts),
                    "detail": "keys={0}; exact={1}".format(len(seen), int(conflicts == 0)),
                })
    return rows


def write_manifest(run_dir, run_id, cases):
    text = """# {0}

Run ID: `{0}`

Purpose: Popcount-layer diagnostics for ex286-ex289, focusing on whether the
Hamming-weight-preserving maps collapse to small layer classifiers, canonical
placements, endpoint transforms, or pair-count features.

Inputs:
- Truth files: benchmarks/ex286.truth through benchmarks/ex289.truth
- Script: student/generators/unknown_popcount_layer_diag.py

Artifacts:
- Results: student/runs/unknown/{0}/results/popcount_layer_diagnostics.csv

Best result:
- Diagnostic-only run; no Verilog/AIG candidates generated.

Notes:
- This run intentionally avoids output/ and student/seeds.
""".format(run_id)
    (run_dir / "MANIFEST.md").write_text(text)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--cases", default="ex286,ex287,ex288,ex289")
    parser.add_argument("--run-id", required=True)
    parser.add_argument("--truth-dir", type=Path, default=ROOT / "benchmarks")
    args = parser.parse_args()

    pairs_by_case = {
        "ex286": [(4, 5), (6, 7)],
        "ex287": [(4, 5), (6, 7), (8, 9)],
        "ex288": [(4, 5), (6, 7), (8, 9)],
        "ex289": [(4, 5), (6, 7), (8, 9), (10, 11)],
    }
    cases = [item.strip() for item in args.cases.split(",") if item.strip()]
    run_dir = ROOT / "student" / "runs" / "unknown" / args.run_id
    results_dir = run_dir / "results"
    results_dir.mkdir(parents=True, exist_ok=True)

    rows = []
    for case in cases:
        table = TruthTable(args.truth_dir / (case + ".truth"))
        outputs = list(table.iter_outputs())
        rows.extend(layer_rows(case, outputs, table.input_width))
        rows.extend(endpoint_rows(case, outputs, table.input_width))
        rows.extend(adjacent_rows(case, outputs, table.input_width))
        rows.extend(pair_feature_rows(case, outputs, table.input_width, pairs_by_case.get(case, [])))

    with (results_dir / "popcount_layer_diagnostics.csv").open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=["case", "metric", "key", "value", "detail"])
        writer.writeheader()
        writer.writerows(rows)
    for name in ("candidates.csv", "best.csv", "summary.csv", "evaluate_check.csv"):
        (results_dir / name).write_text("case,candidate_id,hypothesis,variant,verilog_path,aig_path,verified_truth,equivalent,area,delay,adp,notes\n")
    write_manifest(run_dir, args.run_id, cases)


if __name__ == "__main__":
    main()
