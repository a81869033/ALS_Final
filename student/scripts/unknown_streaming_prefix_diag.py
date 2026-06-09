#!/usr/bin/env python3
"""Streaming prefix determinism diagnostics for conservative unknown cases."""

import argparse
import csv
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from student.frontends.truth import TruthTable
from student.generators.unknown_bucket_count_classifier import onehot_slots


def parse_cases(text):
    return [item.strip() for item in text.split(",") if item.strip()]


def parse_list(text):
    return [item.strip() for item in text.split(",") if item.strip()]


def order_by_name(width, outputs, name):
    if name == "natural":
        return list(range(width))
    if name == "reverse":
        return list(reversed(range(width)))
    if name == "center":
        center = (width - 1) / 2.0
        return sorted(range(width), key=lambda bit: (abs(bit - center), bit))
    if name == "outside":
        center = (width - 1) / 2.0
        return sorted(range(width), key=lambda bit: (-abs(bit - center), bit))
    if name == "onehot_slot":
        slots = onehot_slots(outputs, width)
        return sorted(range(width), key=lambda bit: (slots[bit], bit))
    if name == "onehot_slot_rev":
        slots = onehot_slots(outputs, width)
        return sorted(range(width), key=lambda bit: (-slots[bit], bit))
    raise RuntimeError("unknown order {0}".format(name))


def project_prefix(value, order, count):
    out = 0
    for pos, bit in enumerate(order[:count]):
        if (value >> bit) & 1:
            out |= 1 << pos
    return out


def majority_conflicts(pairs):
    buckets = {}
    for key, value in pairs:
        hist = buckets.setdefault(key, {})
        hist[value] = hist.get(value, 0) + 1
    conflicts = sum(1 for hist in buckets.values() if len(hist) > 1)
    majority = sum(max(hist.values()) for hist in buckets.values())
    return len(buckets), conflicts, majority


def run_case(case, benchmarks, order_names, lookaheads):
    table = TruthTable(benchmarks / "{0}.truth".format(case))
    outputs = list(table.iter_outputs())
    width = table.input_width
    rows = []
    orders = {
        name: order_by_name(width, outputs, name)
        for name in order_names
    }
    for in_name, in_order in orders.items():
        for out_name, out_order in orders.items():
            for lookahead in lookaheads:
                best_exact_prefix = 0
                worst_conflicts = 0
                total_majority = 0
                total_rows = 0
                max_prefix_rows = []
                for out_prefix_len in range(1, width + 1):
                    in_prefix_len = min(width, out_prefix_len + lookahead)
                    pairs = []
                    for index, output in enumerate(outputs):
                        in_prefix = project_prefix(index, in_order, in_prefix_len)
                        out_prefix = project_prefix(output, out_order, out_prefix_len)
                        pairs.append((in_prefix, out_prefix))
                    keys, conflicts, majority = majority_conflicts(pairs)
                    total_majority += majority
                    total_rows += len(outputs)
                    worst_conflicts = max(worst_conflicts, conflicts)
                    if conflicts == 0 and out_prefix_len == best_exact_prefix + 1:
                        best_exact_prefix = out_prefix_len
                    max_prefix_rows.append(
                        "{0}:{1}:{2}:{3}".format(out_prefix_len, in_prefix_len, conflicts, keys)
                    )
                rows.append(
                    {
                        "case": case,
                        "input_width": width,
                        "input_order": in_name,
                        "output_order": out_name,
                        "lookahead": lookahead,
                        "best_exact_output_prefix": best_exact_prefix,
                        "worst_conflicts": worst_conflicts,
                        "majority_match_ratio": "{0:.6f}".format(float(total_majority) / float(total_rows)),
                        "prefix_conflicts_keys": ";".join(max_prefix_rows),
                        "input_order_bits": ":".join(str(bit) for bit in in_order),
                        "output_order_bits": ":".join(str(bit) for bit in out_order),
                    }
                )
                print(
                    "{0} in={1} out={2} look={3} exact_prefix={4} worst_conflicts={5} maj={6:.4f}".format(
                        case,
                        in_name,
                        out_name,
                        lookahead,
                        best_exact_prefix,
                        worst_conflicts,
                        float(total_majority) / float(total_rows),
                    ),
                    flush=True,
                )
    return rows


def write_csv(path, rows):
    path.parent.mkdir(parents=True, exist_ok=True)
    fields = [
        "case",
        "input_width",
        "input_order",
        "output_order",
        "lookahead",
        "best_exact_output_prefix",
        "worst_conflicts",
        "majority_match_ratio",
        "prefix_conflicts_keys",
        "input_order_bits",
        "output_order_bits",
    ]
    with path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields)
        writer.writeheader()
        writer.writerows(rows)


def parse_args():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--cases", type=parse_cases, required=True)
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument(
        "--orders",
        type=parse_list,
        default=parse_list("natural,reverse,center,outside,onehot_slot,onehot_slot_rev"),
    )
    parser.add_argument("--lookaheads", type=parse_list, default=parse_list("0,1,2,3,4,6,8"))
    parser.add_argument("--results", type=Path, required=True)
    return parser.parse_args()


def main():
    args = parse_args()
    lookaheads = [int(item) for item in args.lookaheads]
    rows = []
    for case in args.cases:
        rows.extend(run_case(case, args.benchmarks, args.orders, lookaheads))
        write_csv(args.results, rows)
    print("rows={0} output={1}".format(len(rows), args.results))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
