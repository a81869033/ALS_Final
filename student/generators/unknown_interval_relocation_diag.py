#!/usr/bin/env python3
"""Run/interval relocation and combination-neighbor diagnostics."""

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
    "variant",
    "matches",
    "total_rows",
    "match_ratio",
    "bit_mismatches",
    "total_bits",
    "bit_match_ratio",
    "notes",
]

INTERVAL_FIELDS = [
    "case",
    "interval_start",
    "interval_len",
    "output_bits",
    "notes",
]


def parse_cases(text):
    return [item.strip() for item in text.split(",") if item.strip()]


def popcount(value):
    return bin(value).count("1")


def bits(value, width):
    return [bit for bit in range(width) if (value >> bit) & 1]


def bit_reverse(value, width):
    out = 0
    for index in range(width):
        if (value >> index) & 1:
            out |= 1 << (width - 1 - index)
    return out


def rotate_left(value, width, amount):
    amount %= width
    mask = (1 << width) - 1
    return ((value << amount) | (value >> (width - amount))) & mask


def combinations_by_layer(width):
    out = {}
    for layer in range(width + 1):
        values = []
        for combo in itertools.combinations(range(width), layer):
            value = 0
            for bit in combo:
                value |= 1 << bit
            values.append(value)
        out[layer] = values
    return out


def rank_maps(layers):
    maps = {}
    for layer, values in layers.items():
        maps[layer] = {value: index for index, value in enumerate(values)}
    return maps


def next_combination_model(width, step, reverse_domain=False, reverse_output=False):
    layers = combinations_by_layer(width)
    maps = rank_maps(layers)

    def model(value):
        source = bit_reverse(value, width) if reverse_domain else value
        layer = popcount(source)
        values = layers[layer]
        if len(values) <= 1:
            out = source
        else:
            rank = maps[layer][source]
            out = values[(rank + step) % len(values)]
        return bit_reverse(out, width) if reverse_output else out

    return model


def run_intervals(value, width):
    intervals = []
    index = 0
    while index < width:
        if (value >> index) & 1:
            start = index
            while index < width and ((value >> index) & 1):
                index += 1
            intervals.append((start, index - start))
        else:
            index += 1
    return intervals


def interval_table_model(outputs, width, combine):
    interval_out = {}
    for start in range(width):
        for length in range(1, width - start + 1):
            interval_out[(start, length)] = outputs[((1 << length) - 1) << start]

    def model(value):
        out = 0
        for interval in run_intervals(value, width):
            item = interval_out[interval]
            if combine == "or":
                out |= item
            elif combine == "xor":
                out ^= item
            elif combine == "add_mod2":
                out ^= item
            else:
                raise RuntimeError("unknown combine {0}".format(combine))
        return out

    return model


def arithmetic_models(width):
    mask = (1 << width) - 1
    models = []
    constants = [1, 3, 5, 7, 9, 15, mask - 1]
    for constant in constants:
        models.append(("mul_{0}".format(constant), lambda value, c=constant: (value * c) & mask))
        models.append(
            (
                "rev_mul_{0}".format(constant),
                lambda value, c=constant: bit_reverse((bit_reverse(value, width) * c) & mask, width),
            )
        )
    for amount in range(1, min(width, 8)):
        models.append(("rotl_{0}".format(amount), lambda value, a=amount: rotate_left(value, width, a)))
    return models


def evaluate_model(outputs, width, name, model):
    matches = 0
    bit_mismatches = 0
    for value, expected in enumerate(outputs):
        predicted = model(value)
        if predicted == expected:
            matches += 1
        bit_mismatches += popcount(predicted ^ expected)
    rows = len(outputs)
    return {
        "variant": name,
        "matches": matches,
        "total_rows": rows,
        "match_ratio": "{0:.6f}".format(matches / float(rows)),
        "bit_mismatches": bit_mismatches,
        "total_bits": rows * width,
        "bit_match_ratio": "{0:.6f}".format(1.0 - bit_mismatches / float(rows * width)),
    }


def run_case(case, benchmarks):
    table = TruthTable(benchmarks / "{0}.truth".format(case))
    outputs = list(table.iter_outputs())
    width = table.input_width
    rows = []
    interval_rows = []
    for start in range(width):
        for length in range(1, width - start + 1):
            out = outputs[((1 << length) - 1) << start]
            interval_rows.append(
                {
                    "case": case,
                    "interval_start": start,
                    "interval_len": length,
                    "output_bits": ":".join(str(bit) for bit in bits(out, width)),
                    "notes": "single contiguous input run",
                }
            )

    models = []
    for step in list(range(-8, 9)) + [16, -16, 32, -32]:
        if step == 0:
            continue
        for reverse_domain in (False, True):
            for reverse_output in (False, True):
                name = "comb_step_{0}_rd{1}_ro{2}".format(
                    step, int(reverse_domain), int(reverse_output)
                )
                models.append((name, next_combination_model(width, step, reverse_domain, reverse_output)))
    for combine in ("or", "xor"):
        models.append(("interval_superpose_{0}".format(combine), interval_table_model(outputs, width, combine)))
    models.extend(arithmetic_models(width))

    for name, model in models:
        row = evaluate_model(outputs, width, name, model)
        row["case"] = case
        row["notes"] = "diagnostic-only semantic model"
        rows.append(row)
    rows.sort(key=lambda row: (int(row["matches"]), float(row["bit_match_ratio"])), reverse=True)
    print(
        "{0} best {1} matches={2}/{3} bit_match={4}".format(
            case,
            rows[0]["variant"],
            rows[0]["matches"],
            rows[0]["total_rows"],
            rows[0]["bit_match_ratio"],
        ),
        flush=True,
    )
    return rows, interval_rows


def write_csv(path, fields, rows):
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields)
        writer.writeheader()
        writer.writerows(rows)


def write_empty_frontend_csvs(results_dir):
    fields = [
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
    for name in ("candidates.csv", "best.csv", "evaluate_check.csv"):
        write_csv(results_dir / name, fields, [])


def parse_args(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--cases", type=parse_cases, required=True)
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--results-dir", type=Path, required=True)
    return parser.parse_args(argv)


def main(argv=None):
    args = parse_args(argv)
    all_rows = []
    all_interval_rows = []
    summary = []
    for case in args.cases:
        rows, interval_rows = run_case(case, args.benchmarks)
        all_rows.extend(dict(row) for row in rows)
        all_interval_rows.extend(interval_rows)
        summary.append(rows[0])
        write_csv(args.results_dir / "interval_relocation_diagnostics.csv", SUMMARY_FIELDS, all_rows)
        write_csv(args.results_dir / "single_interval_outputs.csv", INTERVAL_FIELDS, all_interval_rows)
    write_csv(args.results_dir / "summary.csv", SUMMARY_FIELDS, summary)
    write_empty_frontend_csvs(args.results_dir)
    print("rows={0} results={1}".format(len(all_rows), args.results_dir))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
