#!/usr/bin/env python3
"""FP16 truth-table structure diagnostics for frontend seed design."""

import argparse
import csv
import math
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from student.frontends.truth import TruthTable
from student.generators.fp16_semantic_search import (
    CANONICAL_NAN,
    EXP_MAX,
    MANT_SIZE,
    choose_mode,
    output_category,
)


FIELDNAMES = [
    "case",
    "constant_bits",
    "support_bits",
    "output_zero",
    "output_subnormal",
    "output_normal",
    "output_inf",
    "output_nan",
    "negative_same_pos",
    "negative_sign_flip_pos",
    "negative_nan",
    "negative_sign_flip_input",
    "positive_full_exp_groups",
    "sign_exp_full_groups",
    "positive_total_exceptions_vs_mode",
    "sign_exp_total_exceptions_vs_mode",
    "best_positive_exp_default",
    "worst_positive_exp_default",
    "bit_entropy_desc",
    "sample_zero",
    "sample_neg_zero",
    "sample_one",
    "sample_neg_one",
    "sample_pos_inf",
    "sample_neg_inf",
    "sample_nan",
    "notes",
]


def parse_cases(text):
    out = []
    for item in text.split(","):
        item = item.strip()
        if not item:
            continue
        if "-" in item:
            start, end = item.split("-", 1)
            a = int(start[2:])
            b = int(end[2:])
            for number in range(a, b + 1):
                out.append("ex{0:03d}".format(number))
        else:
            out.append(item)
    return out


def hex16(value):
    return "0x{0:04x}".format(value & 0xFFFF)


def support_bits(outputs):
    support = []
    width = 16
    for bit in range(width):
        mask = 1 << bit
        used = False
        for index in range(1 << width):
            if (index & mask) == 0 and outputs[index] != outputs[index | mask]:
                used = True
                break
        if used:
            support.append(bit)
    return support


def entropy_score(count, total):
    if count == 0 or count == total:
        return 0.0
    p = float(count) / float(total)
    return -(p * math.log(p, 2.0) + (1.0 - p) * math.log(1.0 - p, 2.0))


def bit_entropy(outputs):
    total = len(outputs)
    rows = []
    for bit in range(16):
        ones = sum(1 for value in outputs if (value >> bit) & 1)
        rows.append((entropy_score(ones, total), bit, ones))
    rows.sort(reverse=True)
    return ";".join(
        "b{0}:{1:.3f}/{2}".format(bit, score, ones)
        for score, bit, ones in rows[:8]
    )


def relation_counts(outputs):
    counts = {
        "same_pos": 0,
        "sign_flip_pos": 0,
        "nan": 0,
        "sign_flip_input": 0,
    }
    for mag in range(0x8000):
        pos = outputs[mag]
        neg = outputs[mag | 0x8000]
        if neg == pos:
            counts["same_pos"] += 1
        if neg == (pos ^ 0x8000):
            counts["sign_flip_pos"] += 1
        if neg == CANONICAL_NAN:
            counts["nan"] += 1
        if neg == ((mag | 0x8000) ^ 0x8000):
            counts["sign_flip_input"] += 1
    return counts


def group_stats(outputs, signed_groups):
    full = 0
    total_exceptions = 0
    best = None
    worst = None
    groups = 64 if signed_groups else 32
    for group in range(groups):
        base = group << 10
        values = [outputs[base | mant] for mant in range(MANT_SIZE)]
        mode = choose_mode(values)
        exceptions = sum(1 for value in values if value != mode)
        if exceptions == 0:
            full += 1
        total_exceptions += exceptions
        item = (exceptions, group, mode)
        if best is None or exceptions < best[0]:
            best = item
        if worst is None or exceptions > worst[0]:
            worst = item
    return full, total_exceptions, best, worst


def diagnose_case(case, benchmarks):
    table = TruthTable(benchmarks / "{0}.truth".format(case))
    outputs = list(table.iter_outputs())
    counts = {"zero": 0, "subnormal": 0, "normal": 0, "inf": 0, "nan": 0}
    for value in outputs:
        counts[output_category(value)] += 1
    rel = relation_counts(outputs)
    pos_full, pos_exc, pos_best, pos_worst = group_stats(outputs, signed_groups=False)
    se_full, se_exc, _, _ = group_stats(outputs, signed_groups=True)
    constants = ";".join(
        "out[{0}]={1}".format(bit, value)
        for bit, value in table.constant_bits()
    )
    samples = {
        "sample_zero": outputs[0x0000],
        "sample_neg_zero": outputs[0x8000],
        "sample_one": outputs[0x3C00],
        "sample_neg_one": outputs[0xBC00],
        "sample_pos_inf": outputs[0x7C00],
        "sample_neg_inf": outputs[0xFC00],
        "sample_nan": outputs[0x7E01],
    }
    notes = []
    if rel["sign_flip_pos"] == 0x8000:
        notes.append("perfect odd symmetry")
    elif rel["sign_flip_pos"] > 30000:
        notes.append("near odd symmetry")
    if rel["nan"] > 20000:
        notes.append("large negative-domain canonical-NaN region")
    if pos_full > 8:
        notes.append("many positive exponent constant groups")
    return {
        "case": case,
        "constant_bits": constants,
        "support_bits": ",".join(str(bit) for bit in support_bits(outputs)),
        "output_zero": counts["zero"],
        "output_subnormal": counts["subnormal"],
        "output_normal": counts["normal"],
        "output_inf": counts["inf"],
        "output_nan": counts["nan"],
        "negative_same_pos": rel["same_pos"],
        "negative_sign_flip_pos": rel["sign_flip_pos"],
        "negative_nan": rel["nan"],
        "negative_sign_flip_input": rel["sign_flip_input"],
        "positive_full_exp_groups": pos_full,
        "sign_exp_full_groups": se_full,
        "positive_total_exceptions_vs_mode": pos_exc,
        "sign_exp_total_exceptions_vs_mode": se_exc,
        "best_positive_exp_default": "exp{0}:exceptions={1}:mode={2}".format(
            pos_best[1], pos_best[0], hex16(pos_best[2])
        ),
        "worst_positive_exp_default": "exp{0}:exceptions={1}:mode={2}".format(
            pos_worst[1], pos_worst[0], hex16(pos_worst[2])
        ),
        "bit_entropy_desc": bit_entropy(outputs),
        "sample_zero": hex16(samples["sample_zero"]),
        "sample_neg_zero": hex16(samples["sample_neg_zero"]),
        "sample_one": hex16(samples["sample_one"]),
        "sample_neg_one": hex16(samples["sample_neg_one"]),
        "sample_pos_inf": hex16(samples["sample_pos_inf"]),
        "sample_neg_inf": hex16(samples["sample_neg_inf"]),
        "sample_nan": hex16(samples["sample_nan"]),
        "notes": "; ".join(notes),
    }


def parse_args():
    parser = argparse.ArgumentParser(description="Diagnose FP16 truth structure.")
    parser.add_argument("--cases", default="ex225-ex229")
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--output", type=Path, required=True)
    return parser.parse_args()


def main():
    args = parse_args()
    rows = [diagnose_case(case, args.benchmarks) for case in parse_cases(args.cases)]
    args.output.parent.mkdir(parents=True, exist_ok=True)
    with args.output.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=FIELDNAMES)
        writer.writeheader()
        writer.writerows(rows)
    for row in rows:
        print(
            "{case}: pos_full={positive_full_exp_groups} sign_flip={negative_sign_flip_pos} nan_neg={negative_nan} pos_exc={positive_total_exceptions_vs_mode}".format(
                **row
            )
        )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
