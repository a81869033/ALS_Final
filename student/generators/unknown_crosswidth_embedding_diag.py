#!/usr/bin/env python3
"""Cross-width restriction/projection diagnostics into ex289."""

import argparse
import csv
import itertools
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from student.frontends.truth import TruthTable


FIELDS = [
    "case",
    "target_case",
    "mode",
    "input_embeddings",
    "sample_survivors",
    "full_checked",
    "best_matches",
    "total_rows",
    "notes",
]


def parse_cases(text):
    return [item.strip() for item in text.split(",") if item.strip()]


def onepos(value):
    if value == 0 or (value & (value - 1)) != 0:
        return None
    return (value & -value).bit_length() - 1


def project_ordered(value, positions):
    out = 0
    for index, position in enumerate(positions):
        if (value >> position) & 1:
            out |= 1 << index
    return out


def project_permuted(value, outmap):
    out = 0
    for small_bit, big_bit in enumerate(outmap):
        if (value >> big_bit) & 1:
            out |= 1 << small_bit
    return out


def embed(value, positions, missing, constmask):
    out = 0
    for index, position in enumerate(positions):
        if (value >> index) & 1:
            out |= 1 << position
    for index, position in enumerate(missing):
        if (constmask >> index) & 1:
            out |= 1 << position
    return out


def samples_for_width(width):
    samples = [0]
    samples.extend(1 << bit for bit in range(width))
    samples.extend((1 << left) | (1 << right) for left in range(width) for right in range(left + 1, width))
    return samples


def ordered_projection(case, outputs, width, target_outputs, target_width):
    output_positions = list(itertools.combinations(range(target_width), width))
    samples = samples_for_width(width)
    input_embeddings = 0
    sample_survivors = 0
    full_checked = 0
    best = 0
    for positions in itertools.combinations(range(target_width), width):
        missing = tuple(position for position in range(target_width) if position not in positions)
        for constmask in range(1 << len(missing)):
            input_embeddings += 1
            embedded_sample = [target_outputs[embed(value, positions, missing, constmask)] for value in samples]
            for out_positions in output_positions:
                if all(
                    project_ordered(target_value, out_positions) == outputs[value]
                    for value, target_value in zip(samples, embedded_sample)
                ):
                    sample_survivors += 1
                    full_checked += 1
                    matches = 0
                    for value, expected in enumerate(outputs):
                        if project_ordered(target_outputs[embed(value, positions, missing, constmask)], out_positions) == expected:
                            matches += 1
                    best = max(best, matches)
    return input_embeddings, sample_survivors, full_checked, best


def onehot_permuted_projection(case, outputs, width, target_outputs, target_width):
    samples = samples_for_width(width)
    input_embeddings = 0
    sample_survivors = 0
    full_checked = 0
    best = 0
    for positions in itertools.combinations(range(target_width), width):
        missing = tuple(position for position in range(target_width) if position not in positions)
        for constmask in range(1 << len(missing)):
            input_embeddings += 1
            outmap = [None] * width
            ok = True
            for bit in range(width):
                small_bit = onepos(outputs[1 << bit])
                target_bit = onepos(target_outputs[embed(1 << bit, positions, missing, constmask)])
                if small_bit is None or target_bit is None:
                    ok = False
                    break
                if outmap[small_bit] is not None and outmap[small_bit] != target_bit:
                    ok = False
                    break
                outmap[small_bit] = target_bit
            if not ok or any(bit is None for bit in outmap) or len(set(outmap)) != width:
                continue
            if all(
                project_permuted(target_outputs[embed(value, positions, missing, constmask)], outmap) == outputs[value]
                for value in samples
            ):
                sample_survivors += 1
                full_checked += 1
                matches = 0
                for value, expected in enumerate(outputs):
                    if project_permuted(target_outputs[embed(value, positions, missing, constmask)], outmap) == expected:
                        matches += 1
                best = max(best, matches)
    return input_embeddings, sample_survivors, full_checked, best


def run_case(case, target_case, benchmarks):
    table = TruthTable(benchmarks / "{0}.truth".format(case))
    target_table = TruthTable(benchmarks / "{0}.truth".format(target_case))
    outputs = list(table.iter_outputs())
    target_outputs = list(target_table.iter_outputs())
    rows = []
    for mode, fn in (
        ("ordered_input_ordered_output", ordered_projection),
        ("ordered_input_onehot_output_permutation", onehot_permuted_projection),
    ):
        input_embeddings, sample_survivors, full_checked, best = fn(
            case,
            outputs,
            table.input_width,
            target_outputs,
            target_table.input_width,
        )
        rows.append(
            {
                "case": case,
                "target_case": target_case,
                "mode": mode,
                "input_embeddings": input_embeddings,
                "sample_survivors": sample_survivors,
                "full_checked": full_checked,
                "best_matches": best,
                "total_rows": len(outputs),
                "notes": "zero/one-hot/two-hot sample prune before full-table check",
            }
        )
        print(
            "{0}->{1} {2} survivors={3} best={4}/{5}".format(
                case, target_case, mode, sample_survivors, best, len(outputs)
            ),
            flush=True,
        )
    return rows


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
    parser.add_argument("--target-case", default="ex289")
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--results-dir", type=Path, required=True)
    return parser.parse_args(argv)


def main(argv=None):
    args = parse_args(argv)
    rows = []
    for case in args.cases:
        rows.extend(run_case(case, args.target_case, args.benchmarks))
        write_csv(args.results_dir / "crosswidth_embedding_diagnostics.csv", FIELDS, rows)
    write_csv(args.results_dir / "summary.csv", FIELDS, rows)
    write_empty_frontend_csvs(args.results_dir)
    print("rows={0} results={1}".format(len(rows), args.results_dir))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
