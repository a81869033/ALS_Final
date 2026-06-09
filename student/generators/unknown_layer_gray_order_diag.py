#!/usr/bin/env python3
"""Gray-filtered same-popcount layer order diagnostics."""

import argparse
import csv
import math
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from student.frontends.truth import TruthTable


SUMMARY_FIELDS = [
    "case",
    "model",
    "input_order",
    "output_order",
    "matches",
    "total_rows",
    "match_ratio",
    "bit_mismatches",
    "total_bits",
    "bit_match_ratio",
    "exact_layers",
    "best_layer_notes",
]

LAYER_FIELDS = [
    "case",
    "model",
    "input_order",
    "output_order",
    "layer",
    "layer_size",
    "matches",
    "match_ratio",
    "param",
    "mean_cyclic_distance",
    "max_cyclic_distance",
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


def gray(value):
    return value ^ (value >> 1)


def ungray(value):
    out = 0
    while value:
        out ^= value
        value >>= 1
    return out


def cyclic_distance(left, right, size):
    diff = abs(left - right)
    return min(diff, size - diff)


def layer_values(width):
    layers = [[] for _ in range(width + 1)]
    for value in range(1 << width):
        layers[popcount(value)].append(value)
    return layers


def order_key(name, value, width):
    if name == "value":
        return value
    if name == "rev_value":
        return bit_reverse(value, width)
    if name == "gray_value":
        return gray(value)
    if name == "rev_gray_value":
        return gray(bit_reverse(value, width))
    if name == "brgc_index":
        return ungray(value)
    if name == "rev_brgc_index":
        return ungray(bit_reverse(value, width))
    if name == "gray_then_reverse":
        return bit_reverse(gray(value), width)
    if name == "reverse_gray_then_reverse":
        return bit_reverse(gray(bit_reverse(value, width)), width)
    raise RuntimeError("unknown order {0}".format(name))


def rank_maps(width, order_name):
    maps = []
    for values in layer_values(width):
        ordered = sorted(values, key=lambda value: (order_key(order_name, value, width), value))
        maps.append({value: rank for rank, value in enumerate(ordered)})
    return maps


def score_shift(pairs, size):
    hist = {}
    for x_rank, y_rank in pairs:
        shift = (y_rank - x_rank) % size
        hist[shift] = hist.get(shift, 0) + 1
    shift, matches = max(hist.items(), key=lambda item: (item[1], -item[0]))
    distances = [cyclic_distance((x_rank + shift) % size, y_rank, size) for x_rank, y_rank in pairs]
    return matches, "shift={0}".format(shift), sum(distances) / float(len(distances)), max(distances)


def score_affine(pairs, size):
    best = None
    multipliers = [1, -1, 2, -2, 3, -3, 5, -5, 7, -7, 11, -11]
    for raw_a in multipliers:
        a = raw_a % size
        if math.gcd(a, size) != 1:
            continue
        hist = {}
        for x_rank, y_rank in pairs:
            b = (y_rank - a * x_rank) % size
            hist[b] = hist.get(b, 0) + 1
        if not hist:
            continue
        b, matches = max(hist.items(), key=lambda item: (item[1], -item[0]))
        distances = [cyclic_distance((a * x_rank + b) % size, y_rank, size) for x_rank, y_rank in pairs]
        item = (matches, "a={0};b={1}".format(raw_a, b), sum(distances) / float(len(distances)), max(distances))
        if best is None or (item[0], -item[2], -item[3]) > (best[0], -best[2], -best[3]):
            best = item
    if best is None:
        return 0, "none", float(size), size
    return best


def score_direct(pairs, size, kind):
    matches = 0
    distances = []
    for x_rank, y_rank in pairs:
        if kind == "identity":
            pred = x_rank
        elif kind == "reverse":
            pred = size - 1 - x_rank
        elif kind == "rank_gray":
            pred = gray(x_rank)
        elif kind == "rank_ungray":
            pred = ungray(x_rank)
        else:
            raise RuntimeError("unknown direct kind {0}".format(kind))
        if pred >= size:
            distances.append(size)
            continue
        if pred == y_rank:
            matches += 1
        distances.append(cyclic_distance(pred, y_rank, size))
    return matches, kind, sum(distances) / float(len(distances)), max(distances)


def evaluate_case(case, benchmarks, orders):
    table = TruthTable(benchmarks / "{0}.truth".format(case))
    width = table.input_width
    outputs = list(table.iter_outputs())
    layers = layer_values(width)
    ranks = {name: rank_maps(width, name) for name in orders}
    ordered_values = {
        name: [
            sorted(values, key=lambda candidate: (order_key(name, candidate, width), candidate))
            for values in layers
        ]
        for name in orders
    }
    summary_rows = []
    layer_rows = []
    for in_order in orders:
        for out_order in orders:
            model_layers = {"shift": [], "affine": [], "identity": [], "reverse": [], "rank_gray": [], "rank_ungray": []}
            for layer, values in enumerate(layers):
                size = len(values)
                if size <= 1:
                    for model in model_layers:
                        model_layers[model].append((size, size, "trivial", 0.0, 0))
                    continue
                pairs = [(ranks[in_order][layer][value], ranks[out_order][layer][outputs[value]]) for value in values]
                model_layers["shift"].append((size,) + score_shift(pairs, size))
                model_layers["affine"].append((size,) + score_affine(pairs, size))
                for direct in ("identity", "reverse", "rank_gray", "rank_ungray"):
                    model_layers[direct].append((size,) + score_direct(pairs, size, direct))
            for model, items in model_layers.items():
                matches = sum(item[1] for item in items)
                bit_mismatches = 0
                # Row match is the primary diagnostic.  Bit mismatch is computed by replaying
                # the layer prediction to keep the summary comparable to other runs.
                exact_layers = []
                notes = []
                for layer, item in enumerate(items):
                    size, layer_matches, param, mean_dist, max_dist = item
                    if size and layer_matches == size:
                        exact_layers.append(layer)
                    if size > 1:
                        notes.append("w{0}:{1}/{2}:{3}".format(layer, layer_matches, size, param))
                    layer_rows.append(
                        {
                            "case": case,
                            "model": model,
                            "input_order": in_order,
                            "output_order": out_order,
                            "layer": layer,
                            "layer_size": size,
                            "matches": layer_matches,
                            "match_ratio": "{0:.6f}".format(layer_matches / float(size) if size else 1.0),
                            "param": param,
                            "mean_cyclic_distance": "{0:.6f}".format(mean_dist),
                            "max_cyclic_distance": max_dist,
                        }
                    )
                # Compute predicted outputs for bit match.
                for value, expected in enumerate(outputs):
                    layer = popcount(value)
                    values = layers[layer]
                    size = len(values)
                    if size <= 1:
                        pred = value
                    else:
                        x_rank = ranks[in_order][layer][value]
                        param = items[layer][2]
                        if model == "shift":
                            shift = int(param.split("=", 1)[1])
                            pred_rank = (x_rank + shift) % size
                        elif model == "affine":
                            parts = dict(part.split("=") for part in param.split(";"))
                            pred_rank = (int(parts["a"]) * x_rank + int(parts["b"])) % size
                        elif model == "identity":
                            pred_rank = x_rank
                        elif model == "reverse":
                            pred_rank = size - 1 - x_rank
                        elif model == "rank_gray":
                            pred_rank = gray(x_rank)
                        elif model == "rank_ungray":
                            pred_rank = ungray(x_rank)
                        if pred_rank >= size:
                            pred = 0
                        else:
                            pred = ordered_values[out_order][layer][pred_rank]
                    bit_mismatches += popcount(pred ^ expected)
                summary_rows.append(
                    {
                        "case": case,
                        "model": model,
                        "input_order": in_order,
                        "output_order": out_order,
                        "matches": matches,
                        "total_rows": len(outputs),
                        "match_ratio": "{0:.6f}".format(matches / float(len(outputs))),
                        "bit_mismatches": bit_mismatches,
                        "total_bits": len(outputs) * width,
                        "bit_match_ratio": "{0:.6f}".format(1.0 - bit_mismatches / float(len(outputs) * width)),
                        "exact_layers": ":".join(str(layer) for layer in exact_layers),
                        "best_layer_notes": ";".join(notes[:8]),
                    }
                )
    summary_rows.sort(key=lambda row: (int(row["matches"]), float(row["bit_match_ratio"])), reverse=True)
    layer_rows.sort(key=lambda row: (row["case"], row["model"], row["input_order"], row["output_order"], int(row["layer"])))
    print(
        "{0}: best {1}/{2} model={3} orders={4}->{5} bit={6}".format(
            case,
            summary_rows[0]["matches"],
            summary_rows[0]["total_rows"],
            summary_rows[0]["model"],
            summary_rows[0]["input_order"],
            summary_rows[0]["output_order"],
            summary_rows[0]["bit_match_ratio"],
        ),
        flush=True,
    )
    return summary_rows[:80], layer_rows


def write_csv(path, fields, rows):
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields)
        writer.writeheader()
        writer.writerows(rows)


def write_empty_frontend_csvs(results_dir):
    for name in ("candidates.csv", "best.csv", "evaluate_check.csv"):
        write_csv(results_dir / name, EMPTY_FRONTEND_FIELDS, [])


def write_manifest(run_dir, run_id, cases, orders):
    text = """# {0}

Run ID: `{0}`

Purpose: Diagnostic-only Gray-filtered same-popcount layer order search for
ex286-ex289.  This tests whether the conservative maps are compact successors
or affine transforms inside each popcount layer under BRGC-filtered or
bit-reversed Gray orders.

Inputs:
- Truth files: {1}
- Script: `student/generators/unknown_layer_gray_order_diag.py`
- Orders: `{2}`

Artifacts:
- Results directory: `student/runs/unknown/{0}/results/`
- Summary CSV: `results/summary.csv`
- Layer CSV: `results/layer_details.csv`
- Empty frontend CSVs: `results/candidates.csv`, `results/best.csv`, `results/evaluate_check.csv`

Best result:
- Diagnostic only; no Verilog/AIG candidates generated.

Notes:
- `student/seeds` and `output/` are intentionally untouched.
""".format(
        run_id,
        ", ".join("benchmarks/{0}.truth".format(case) for case in cases),
        ",".join(orders),
    )
    (run_dir / "MANIFEST.md").write_text(text)


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--cases", type=parse_cases, default=parse_cases("ex286-ex289"))
    parser.add_argument("--run-id", required=True)
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument(
        "--orders",
        type=parse_cases,
        default=parse_cases("value,rev_value,gray_value,rev_gray_value,brgc_index,rev_brgc_index,gray_then_reverse,reverse_gray_then_reverse"),
    )
    args = parser.parse_args(argv)

    run_dir = ROOT / "student" / "runs" / "unknown" / args.run_id
    results_dir = run_dir / "results"
    summary_rows = []
    layer_rows = []
    for case in args.cases:
        case_summary, case_layers = evaluate_case(case, args.benchmarks, args.orders)
        summary_rows.extend(case_summary)
        layer_rows.extend(case_layers)
        write_csv(results_dir / "summary.csv", SUMMARY_FIELDS, summary_rows)
        write_csv(results_dir / "layer_details.csv", LAYER_FIELDS, layer_rows)
    write_empty_frontend_csvs(results_dir)
    write_manifest(run_dir, args.run_id, args.cases, args.orders)
    print("Results: {0}".format(results_dir))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
