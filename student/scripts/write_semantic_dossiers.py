#!/usr/bin/env python3
"""Write per-case semantic reconstruction notes for BF16/FP16 unary cases.

The output is intentionally documentation-first.  It records what has been
confirmed from the truth table, what semantic RTL shape should be pursued, and
which broad structural searches should not be repeated.
"""

import argparse
import csv
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from student.frontends.truth import TruthTable


CASE_LABELS = {
    **{
        "ex{0:03d}".format(200 + offset): label
        for offset, label in enumerate(
            [
                "bf16_exp",
                "bf16_exp2",
                "bf16_exp10",
                "bf16_log",
                "bf16_log2",
                "bf16_log10",
                "bf16_sin",
                "bf16_tan",
                "bf16_sinh",
                "bf16_tanh",
                "bf16_sigmoid",
                "bf16_reciprocal",
                "bf16_square",
                "bf16_sqrt",
                "bf16_reciprocal_square",
                "bf16_reciprocal_sqrt",
                "bf16_cube",
                "bf16_cbrt",
                "bf16_reciprocal_cube",
                "bf16_reciprocal_cbrt",
            ]
        )
    },
    **{
        "ex{0:03d}".format(220 + offset): label
        for offset, label in enumerate(
            [
                "fp16_exp",
                "fp16_exp2",
                "fp16_exp10",
                "fp16_log",
                "fp16_log2",
                "fp16_log10",
                "fp16_sin",
                "fp16_tan",
                "fp16_sinh",
                "fp16_tanh",
                "fp16_sigmoid",
                "fp16_reciprocal",
                "fp16_square",
                "fp16_sqrt",
                "fp16_reciprocal_square",
                "fp16_reciprocal_sqrt",
                "fp16_cube",
                "fp16_cbrt",
                "fp16_reciprocal_cube",
                "fp16_reciprocal_cbrt",
            ]
        )
    },
}

CASE_OPS = {
    "reciprocal": "recip",
    "square": "square",
    "sqrt": "sqrt",
    "reciprocal_square": "recip_square",
    "reciprocal_sqrt": "recip_sqrt",
    "cube": "cube",
    "cbrt": "cbrt",
    "reciprocal_cube": "recip_cube",
    "reciprocal_cbrt": "recip_cbrt",
}


def parse_cases(value):
    cases = []
    seen = set()
    for item in value.split(","):
        item = item.strip()
        if not item:
            continue
        if "-" in item:
            start, end = item.split("-", 1)
            start_num = int(start[2:])
            end_num = int(end[2:])
            expanded = ["ex{0:03d}".format(num) for num in range(start_num, end_num + 1)]
        else:
            expanded = [item]
        for case in expanded:
            if case not in seen:
                cases.append(case)
                seen.add(case)
    return cases


def load_best_rows(paths):
    rows = {}
    for path in paths:
        if not path.is_file():
            continue
        with path.open(newline="") as handle:
            for row in csv.DictReader(handle):
                rows[row["case"]] = row
    return rows


def word(value, width):
    return "0x{0:0{1}x}".format(value, max(1, (width + 3) // 4))


def fields(value, exp_bits, mant_bits):
    sign = (value >> (exp_bits + mant_bits)) & 1
    exp = (value >> mant_bits) & ((1 << exp_bits) - 1)
    mant = value & ((1 << mant_bits) - 1)
    return sign, exp, mant


def category(value, exp_bits, mant_bits):
    _sign, exp, mant = fields(value, exp_bits, mant_bits)
    exp_max = (1 << exp_bits) - 1
    if exp == 0:
        return "zero/subnormal"
    if exp == exp_max and mant == 0:
        return "inf"
    if exp == exp_max:
        return "nan"
    return "normal"


def run_ranges(values):
    if not values:
        return []
    ranges = []
    start = values[0]
    prev = values[0]
    for value in values[1:]:
        if value == prev + 1:
            prev = value
            continue
        ranges.append((start, prev))
        start = value
        prev = value
    ranges.append((start, prev))
    return ranges


def format_ranges(ranges):
    if not ranges:
        return "none"
    parts = []
    for start, end in ranges:
        if start == end:
            parts.append(str(start))
        else:
            parts.append("{0}-{1}".format(start, end))
    return ", ".join(parts)


def relation_stats(outputs, width, exp_bits, mant_bits):
    mant_size = 1 << mant_bits
    exp_max = (1 << exp_bits) - 1
    total = 0
    matches = {
        "same_positive_output": 0,
        "sign_flip_positive_output": 0,
        "canonical_nan": 0,
        "positive_zero": 0,
    }
    canonical_nan = 0x7FC0 if width == 16 and exp_bits == 8 else 0x7E00
    # The project's BF16 and FP16 outputs are both 16-bit words; canonical NaN
    # differs by format.
    if exp_bits == 5:
        canonical_nan = 0x7E00
    for exp in range(1, exp_max):
        for mant in range(mant_size):
            mag = (exp << mant_bits) | mant
            positive = outputs[mag]
            negative = outputs[mag | (1 << (width - 1))]
            total += 1
            if negative == positive:
                matches["same_positive_output"] += 1
            if negative == (positive ^ (1 << (width - 1))):
                matches["sign_flip_positive_output"] += 1
            if negative == canonical_nan:
                matches["canonical_nan"] += 1
            if negative == 0:
                matches["positive_zero"] += 1
    best = max(matches, key=lambda key: matches[key])
    return best, matches[best], total, matches


def base_exp(op, exp, bias):
    if op == "recip":
        return 2 * bias - exp
    if op == "square":
        return 2 * exp - bias
    if op == "sqrt":
        return (exp + bias) // 2
    if op == "recip_square":
        return 3 * bias - 2 * exp
    if op == "recip_sqrt":
        return (3 * bias - exp) // 2
    if op == "cube":
        return 3 * exp - 2 * bias
    if op == "cbrt":
        return (exp + 2 * bias) // 3
    if op == "recip_cube":
        return 4 * bias - 3 * exp
    if op == "recip_cbrt":
        return (4 * bias - exp) // 3
    raise ValueError(op)


def op_mod(op):
    if op in ("sqrt", "recip_sqrt"):
        return 2
    if op in ("cbrt", "recip_cbrt"):
        return 3
    return 1


def arithmetic_fit(label, outputs, width, exp_bits, mant_bits, bias):
    suffix = label.split("_", 1)[1]
    op = CASE_OPS.get(suffix)
    if op is None:
        return None
    exp_max = (1 << exp_bits) - 1
    mant_size = 1 << mant_bits
    mod = op_mod(op)
    table = {}
    normal_seen = 0
    skipped = 0
    inconsistencies = []
    deltas = []
    for exp in range(1, exp_max):
        for mant in range(mant_size):
            input_value = (exp << mant_bits) | mant
            output = outputs[input_value]
            if category(output, exp_bits, mant_bits) != "normal":
                skipped += 1
                continue
            _sign, out_exp, out_mant = fields(output, exp_bits, mant_bits)
            key = (exp % mod, mant)
            value = (out_exp - base_exp(op, exp, bias), out_mant)
            old = table.get(key)
            if old is not None and old != value and len(inconsistencies) < 8:
                inconsistencies.append((key, old, value))
            table[key] = value
            deltas.append(value[0])
            normal_seen += 1
    return {
        "op": op,
        "mod": mod,
        "fits": not inconsistencies,
        "normal_seen": normal_seen,
        "non_normal_normal_domain": skipped,
        "table_entries": len(table),
        "delta_min": min(deltas) if deltas else "",
        "delta_max": max(deltas) if deltas else "",
        "inconsistencies": inconsistencies,
    }


def exp_group_stats(outputs, width, exp_bits, mant_bits):
    exp_max = (1 << exp_bits) - 1
    mant_size = 1 << mant_bits
    stats = []
    for sign in (0, 1):
        constant = []
        active = []
        zero = []
        inf = []
        nan = []
        normal = []
        for exp in range(1, exp_max):
            values = [outputs[(sign << (width - 1)) | (exp << mant_bits) | mant] for mant in range(mant_size)]
            cats = {category(value, exp_bits, mant_bits) for value in values}
            if len(set(values)) == 1:
                constant.append(exp)
            else:
                active.append(exp)
            if cats == {"zero/subnormal"}:
                zero.append(exp)
            elif cats == {"inf"}:
                inf.append(exp)
            elif cats == {"nan"}:
                nan.append(exp)
            elif cats == {"normal"}:
                normal.append(exp)
        stats.append(
            {
                "sign": sign,
                "constant": constant,
                "active": active,
                "zero": zero,
                "inf": inf,
                "nan": nan,
                "normal": normal,
            }
        )
    return stats


def compact_count(values):
    return len(run_ranges(values))


def analyze_case(case, benchmarks):
    label = CASE_LABELS[case]
    fmt = label.split("_", 1)[0]
    if fmt == "bf16":
        width, exp_bits, mant_bits, bias = 16, 8, 7, 127
    else:
        width, exp_bits, mant_bits, bias = 16, 5, 10, 15
    table = TruthTable(benchmarks / "{0}.truth".format(case))
    outputs = list(table.iter_outputs())
    cats = {}
    for value in outputs:
        name = category(value, exp_bits, mant_bits)
        cats[name] = cats.get(name, 0) + 1
    relation = relation_stats(outputs, width, exp_bits, mant_bits)
    groups = exp_group_stats(outputs, width, exp_bits, mant_bits)
    arith = arithmetic_fit(label, outputs, width, exp_bits, mant_bits, bias)
    samples = {
        "+0": 0,
        "-0": 1 << (width - 1),
        "+1": bias << mant_bits,
        "-1": (1 << (width - 1)) | (bias << mant_bits),
        "+2": (bias + 1) << mant_bits,
        "+inf": ((1 << exp_bits) - 1) << mant_bits,
        "-inf": (1 << (width - 1)) | (((1 << exp_bits) - 1) << mant_bits),
        "nan": (((1 << exp_bits) - 1) << mant_bits) | 1,
    }
    sample_text = {name: word(outputs[index], width) for name, index in samples.items()}
    return {
        "case": case,
        "label": label,
        "format": fmt,
        "width": width,
        "exp_bits": exp_bits,
        "mant_bits": mant_bits,
        "bias": bias,
        "category_counts": cats,
        "relation": relation,
        "groups": groups,
        "arith": arith,
        "samples": sample_text,
    }


def target_shape(analysis):
    fmt = analysis["format"]
    label = analysis["label"]
    mant_entries = 1 << analysis["mant_bits"]
    if analysis["arith"] is not None:
        arith = analysis["arith"]
        if arith["fits"]:
            return (
                "Use exponent arithmetic for `{0}` with `exp % {1}` mantissa LUT. "
                "Normal-domain table has {2} entries, delta range {3}..{4}; "
                "special/overflow/underflow cases stay as explicit guards."
            ).format(
                arith["op"],
                arith["mod"],
                arith["table_entries"],
                arith["delta_min"],
                arith["delta_max"],
            )
        return (
            "Arithmetic hypothesis `{0}` is not yet clean: mantissa/exponent table "
            "has inconsistent keys. First isolate the exceptional exponent or rounding "
            "region instead of emitting more structural variants."
        ).format(arith["op"])
    if fmt == "bf16":
        return (
            "Use BF16 field RTL: DAZ/FTZ and special cases first, then exponent-range "
            "guards plus one 128-entry mantissa transform only for active ranges of `{0}`."
        ).format(label)
    return (
        "Use FP16 field RTL: split sign/exponent/mantissa, collapse constant/zero/inf/"
        "passthrough exponent ranges, then use localized {0}-entry mantissa tables only "
        "for active exponent groups of `{1}`."
    ).format(mant_entries, label)


def write_case_doc(path, analysis, best):
    relation_name, relation_hits, relation_total, relation_all = analysis["relation"]
    groups = analysis["groups"]
    arith = analysis["arith"]
    lines = []
    lines.append("# {0} {1}".format(analysis["case"], analysis["label"]))
    lines.append("")
    lines.append("## Current Best")
    lines.append("")
    if best:
        lines.append("- classification: `{0}`".format(best.get("classification", "")))
        lines.append("- variant: `{0}`".format(best.get("variant", "")))
        lines.append("- ADP/reference ratio: `{0}`".format(best.get("adp_ratio_to_reference", "")))
        lines.append("- verilog: `{0}`".format(best.get("verilog_path", "")))
    else:
        lines.append("- no current best row found")
    lines.append("")
    lines.append("## Confirmed Truth Facts")
    lines.append("")
    lines.append("- format: `{0}`".format(analysis["format"]))
    lines.append("- fields: sign 1 bit, exponent {0} bits, mantissa {1} bits".format(analysis["exp_bits"], analysis["mant_bits"]))
    lines.append("- output categories: `{0}`".format(analysis["category_counts"]))
    lines.append("- best negative-input relation: `{0}` ({1}/{2})".format(relation_name, relation_hits, relation_total))
    lines.append("- relation matches: `{0}`".format(relation_all))
    lines.append("- samples: `{0}`".format(analysis["samples"]))
    lines.append("")
    lines.append("## Exponent Groups")
    lines.append("")
    for group in groups:
        sign = group["sign"]
        lines.append("- sign={0} constant output exponent ranges: {1}".format(sign, format_ranges(run_ranges(group["constant"]))))
        lines.append("- sign={0} active mantissa-LUT exponent ranges: {1}".format(sign, format_ranges(run_ranges(group["active"]))))
        lines.append("- sign={0} all-zero/subnormal ranges: {1}".format(sign, format_ranges(run_ranges(group["zero"]))))
        lines.append("- sign={0} all-inf ranges: {1}".format(sign, format_ranges(run_ranges(group["inf"]))))
        lines.append("- sign={0} all-nan ranges: {1}".format(sign, format_ranges(run_ranges(group["nan"]))))
    lines.append("")
    lines.append("## Semantic Direction")
    lines.append("")
    lines.append(target_shape(analysis))
    if best and best.get("variant") == "semantic_arith_fields_with_exceptions":
        lines.append("")
        lines.append(
            "Current primary candidate already uses exponent arithmetic plus a "
            "normal-domain rounding exception table.  The next improvement should "
            "replace those exceptions with an explicit rounding/carry condition if "
            "one is found."
        )
    lines.append("")
    if arith is not None:
        lines.append("Arithmetic fit:")
        lines.append("")
        lines.append("- op: `{0}`".format(arith["op"]))
        lines.append("- fits shared mantissa table: `{0}`".format(arith["fits"]))
        lines.append("- normal-domain entries: `{0}`".format(arith["table_entries"]))
        lines.append("- non-normal normal-domain outputs: `{0}`".format(arith["non_normal_normal_domain"]))
        lines.append("- inconsistencies: `{0}`".format(arith["inconsistencies"]))
        lines.append("")
    lines.append("## Focused Next Work")
    lines.append("")
    lines.append("- Keep at most one primary semantic RTL and one small alternative for this case.")
    lines.append("- Use current structural best only as a witness for grouping and corner cases.")
    lines.append("- Do not repeat broad variants such as raw value-case, sign-pair, or full `sign_exp_mant_case` unless they explain a semantic blocker.")
    lines.append("- Verify exact truth equivalence before keeping any Verilog candidate.")
    lines.append("")
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text("\n".join(lines))


def write_csv(path, rows):
    fieldnames = [
        "case",
        "label",
        "format",
        "current_classification",
        "current_variant",
        "adp_ratio_to_reference",
        "semantic_priority",
        "sign_relation",
        "arith_fit",
        "active_exp_groups_pos",
        "active_exp_groups_neg",
        "doc_path",
    ]
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(rows)


def priority(analysis, best):
    classification = best.get("classification", "") if best else ""
    ratio = float(best.get("adp_ratio_to_reference", "999") or 999) if best else 999.0
    if classification == "semantic_exact" and ratio <= 1.5:
        return "watch"
    if classification != "semantic_exact" and ratio > 1.5:
        return "high"
    if classification != "semantic_exact":
        return "medium"
    return "medium"


def main(argv=None):
    parser = argparse.ArgumentParser(description="Write semantic reconstruction dossiers.")
    parser.add_argument("--cases", default="ex200-ex239", type=parse_cases)
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument(
        "--best-csv",
        action="append",
        type=Path,
        default=[
            ROOT / "student" / "work" / "reverse_bf16_semantic_20260604_1522" / "bf16_best.csv",
            ROOT / "student" / "work" / "reverse_fp16_semantic_20260604_1522" / "fp16_best.csv",
        ],
    )
    parser.add_argument(
        "--work-dir",
        type=Path,
        default=ROOT / "student" / "work" / "semantic_reconstruction_20260604_1638",
    )
    args = parser.parse_args(argv)

    cases = [case for case in args.cases if case in CASE_LABELS]
    best_rows = load_best_rows(args.best_csv)
    summary_rows = []
    for case in cases:
        analysis = analyze_case(case, args.benchmarks)
        case_dir = args.work_dir / case
        doc_path = case_dir / "semantic_notes.md"
        best = best_rows.get(case, {})
        write_case_doc(doc_path, analysis, best)
        relation_name = analysis["relation"][0]
        arith = analysis["arith"]
        groups = analysis["groups"]
        summary_rows.append(
            {
                "case": case,
                "label": analysis["label"],
                "format": analysis["format"],
                "current_classification": best.get("classification", ""),
                "current_variant": best.get("variant", ""),
                "adp_ratio_to_reference": best.get("adp_ratio_to_reference", ""),
                "semantic_priority": priority(analysis, best),
                "sign_relation": relation_name,
                "arith_fit": "" if arith is None else str(arith["fits"]),
                "active_exp_groups_pos": compact_count(groups[0]["active"]),
                "active_exp_groups_neg": compact_count(groups[1]["active"]),
                "doc_path": str(doc_path),
            }
        )

    write_csv(args.work_dir / "semantic_gap_summary.csv", summary_rows)
    print("Wrote {0} case dossiers under {1}".format(len(summary_rows), args.work_dir))
    print("Summary: {0}".format(args.work_dir / "semantic_gap_summary.csv"))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
