#!/usr/bin/env python3
"""Image/preimage and bucket-key canonical representative diagnostics."""

import argparse
import csv
from collections import Counter, defaultdict
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
    "metric",
    "key",
    "value",
    "detail",
]

REP_FIELDS = [
    "case",
    "class_key_count",
    "representative_model",
    "matches",
    "total_classes",
    "match_ratio",
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


def bit_reverse(value, width):
    out = 0
    for bit in range(width):
        if (value >> bit) & 1:
            out |= 1 << (width - 1 - bit)
    return out


def packed_by_order(value, order):
    out = 0
    for pos, bit in enumerate(order):
        if (value >> bit) & 1:
            out |= 1 << pos
    return out


def unpack_by_order(packed, order):
    out = 0
    for pos, bit in enumerate(order):
        if (packed >> pos) & 1:
            out |= 1 << bit
    return out


def center_order(width):
    center = (width - 1) / 2.0
    return sorted(range(width), key=lambda bit: (abs(bit - center), bit))


def outside_order(width):
    center = (width - 1) / 2.0
    return sorted(range(width), key=lambda bit: (-abs(bit - center), bit))


def candidate_orders(width, outputs):
    slots = onehot_slots(outputs, width)
    raw = [
        ("natural", list(range(width))),
        ("reverse", list(reversed(range(width)))),
        ("center", center_order(width)),
        ("outside", outside_order(width)),
        ("onehot", sorted(range(width), key=lambda bit: (slots[bit], bit))),
        ("onehot_rev", sorted(range(width), key=lambda bit: (-slots[bit], bit))),
    ]
    out = []
    seen = set()
    for name, order in raw:
        key = tuple(order)
        if key not in seen:
            seen.add(key)
            out.append((name, order))
    return out


def class_data(case, outputs, width):
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
    selected_names = [feature_name(features[index]) for index in selected]
    classes = {}
    for value, output in enumerate(outputs):
        selectors = tuple(feature_values_by_row[value][index] for index in selected)
        key = (bucket_counts(value, buckets), selectors)
        bucket = classes.setdefault(key, {"inputs": [], "output": output})
        if bucket["output"] != output:
            raise RuntimeError("non-exact class key for {0}".format(case))
        bucket["inputs"].append(value)
    return classes, selected_names


def representative_models(width, outputs):
    models = []
    for order_name, order in candidate_orders(width, outputs):
        for kind in ("min", "max"):
            models.append(("{0}_{1}".format(kind, order_name), order, kind, "identity"))
            models.append(("{0}_{1}_bitrev".format(kind, order_name), order, kind, "bitrev"))
    return models


def choose_rep(values, order, kind):
    packed_values = [(packed_by_order(value, order), value) for value in values]
    if kind == "min":
        return min(packed_values)[1]
    if kind == "max":
        return max(packed_values)[1]
    raise RuntimeError("unknown representative kind {0}".format(kind))


def run_case(case, benchmarks):
    table = TruthTable(benchmarks / "{0}.truth".format(case))
    outputs = list(table.iter_outputs())
    width = table.input_width
    rows = []
    rep_rows = []

    image_by_layer = defaultdict(set)
    preimage_counts = Counter(outputs)
    layer_preimage = defaultdict(Counter)
    fixed = 0
    for value, output in enumerate(outputs):
        layer = popcount(value)
        image_by_layer[layer].add(output)
        layer_preimage[layer][output] += 1
        if value == output:
            fixed += 1
    rows.append(
        {
            "case": case,
            "metric": "image_size_by_layer",
            "key": "all_layers",
            "value": ";".join(
                "w{0}:{1}".format(layer, len(image_by_layer[layer]))
                for layer in sorted(image_by_layer)
            ),
            "detail": "layer_size/image_size; fixed_rows={0}/{1}".format(fixed, len(outputs)),
        }
    )
    rows.append(
        {
            "case": case,
            "metric": "preimage_distribution",
            "key": "all_outputs",
            "value": ";".join(
                "{0}:{1}".format(size, count)
                for size, count in sorted(Counter(preimage_counts.values()).items())
            ),
            "detail": "unique_outputs={0}".format(len(preimage_counts)),
        }
    )
    for layer in sorted(layer_preimage):
        dist = Counter(layer_preimage[layer].values())
        rows.append(
            {
                "case": case,
                "metric": "layer_preimage_distribution",
                "key": "w{0}".format(layer),
                "value": ";".join("{0}:{1}".format(size, count) for size, count in sorted(dist.items())),
                "detail": "image_size={0}".format(len(layer_preimage[layer])),
            }
        )

    classes, selected_names = class_data(case, outputs, width)
    in_class = 0
    first_not_in = ""
    for key, data in classes.items():
        if data["output"] in data["inputs"]:
            in_class += 1
        elif not first_not_in:
            first_not_in = "key={0};out=0x{1:x};first_input=0x{2:x}".format(
                key,
                data["output"],
                data["inputs"][0],
            )
    rows.append(
        {
            "case": case,
            "metric": "bucket_key_class_output_membership",
            "key": "output_in_input_class",
            "value": "{0}/{1}".format(in_class, len(classes)),
            "detail": "selectors={0}; first_not_in={1}".format(":".join(selected_names), first_not_in),
        }
    )

    for model_name, order, kind, post in representative_models(width, outputs):
        matches = 0
        first = ""
        for key, data in classes.items():
            pred = choose_rep(data["inputs"], order, kind)
            if post == "bitrev":
                pred = bit_reverse(pred, width)
            expected = data["output"]
            if pred == expected:
                matches += 1
            elif not first:
                first = "key={0};pred=0x{1:x};exp=0x{2:x};class_size={3}".format(
                    key,
                    pred,
                    expected,
                    len(data["inputs"]),
                )
        rep_rows.append(
            {
                "case": case,
                "class_key_count": len(classes),
                "representative_model": model_name,
                "matches": matches,
                "total_classes": len(classes),
                "match_ratio": "{0:.6f}".format(matches / float(len(classes))),
                "first_mismatch": first,
            }
        )
    rep_rows.sort(key=lambda row: int(row["matches"]), reverse=True)
    print(
        "{0}: unique_outputs={1} output_in_class={2}/{3} best_rep={4}/{3}".format(
            case,
            len(preimage_counts),
            in_class,
            len(classes),
            rep_rows[0]["matches"],
        ),
        flush=True,
    )
    return rows, rep_rows[:40]


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

Purpose: Diagnostic-only image/preimage and bucket-key representative search
for ex286-ex289.  This tests whether the conservative truth maps are
canonicalizers: many inputs mapping to a smaller image, or each exact bucket-key
class choosing a simple min/max representative under candidate bit orders.

Inputs:
- Truth files: {1}
- Script: `student/generators/unknown_canonical_image_diag.py`

Artifacts:
- Results directory: `student/runs/unknown/{0}/results/`
- Summary CSV: `results/summary.csv`
- Representative CSV: `results/representatives.csv`
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
    summary_rows = []
    rep_rows = []
    for case in args.cases:
        case_summary, case_rep = run_case(case, args.benchmarks)
        summary_rows.extend(case_summary)
        rep_rows.extend(case_rep)
        write_csv(results_dir / "summary.csv", SUMMARY_FIELDS, summary_rows)
        write_csv(results_dir / "representatives.csv", REP_FIELDS, rep_rows)
    write_empty_frontend_csvs(results_dir)
    write_manifest(run_dir, args.run_id, args.cases)
    print("Results: {0}".format(results_dir))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
