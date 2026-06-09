#!/usr/bin/env python3
"""Global token-to-slot matching diagnostics for conservative unknown cases."""

import argparse
import csv
import itertools
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from student.frontends.truth import TruthTable
from student.generators.unknown_verilog_search import parse_cases


def popcount(value):
    return bin(value).count("1")


def bits_of(value, width):
    return [bit for bit in range(width) if (value >> bit) & 1]


def onehot_slots(outputs, width):
    slots = []
    for token in range(width):
        value = outputs[1 << token]
        if popcount(value) != 1:
            raise RuntimeError("one-hot row is not one-hot for token {0}".format(token))
        slots.append(bits_of(value, width)[0])
    return slots


def exact_pairs(case):
    return {
        "ex286": [(4, 5), (6, 7)],
        "ex287": [(4, 5), (6, 7), (8, 9)],
        "ex288": [(4, 5), (6, 7), (8, 9)],
        "ex289": [(4, 5), (6, 7), (8, 9), (10, 11)],
    }.get(case, [])


def token_order(case, width, onehot, style):
    if style == "natural":
        return list(range(width))
    if style == "reverse":
        return list(reversed(range(width)))
    if style == "home":
        return sorted(range(width), key=lambda bit: (onehot[bit], bit))
    if style == "home_reverse":
        return sorted(range(width), key=lambda bit: (-onehot[bit], bit))
    if style == "sym":
        out = []
        used = set()
        for left, right in exact_pairs(case):
            out.extend([left, right])
            used.add(left)
            used.add(right)
        out.extend(bit for bit in range(width) if bit not in used)
        return out
    raise RuntimeError("unknown token order {0}".format(style))


def output_transform(mask, width, style):
    if style == "identity":
        return mask
    if style == "reverse":
        out = 0
        for bit in range(width):
            if (mask >> bit) & 1:
                out |= 1 << (width - 1 - bit)
        return out
    raise RuntimeError("unknown output transform {0}".format(style))


def sample_indices(width, limit, max_sample_weight):
    selected = set()
    if max_sample_weight >= 0:
        for weight in range(0, min(max_sample_weight, width) + 1):
            for bits in itertools.combinations(range(width), weight):
                value = 0
                for bit in bits:
                    value |= 1 << bit
                selected.add(value)
        return sorted(selected)
    for weight in range(0, min(3, width) + 1):
        for bits in itertools.combinations(range(width), weight):
            value = 0
            for bit in bits:
                value |= 1 << bit
            selected.add(value)
    total = 1 << width
    step = max(1, total // max(1, limit))
    for value in range(0, total, step):
        selected.add(value)
    selected.add(total - 1)
    return sorted(selected)


def pair_weight(outputs, width, onehot, home_bonus):
    weights = [[0 for _slot in range(width)] for _token in range(width)]
    for token, slot in enumerate(onehot):
        weights[token][slot] += home_bonus
    for left, right in itertools.combinations(range(width), 2):
        out_slots = bits_of(outputs[(1 << left) | (1 << right)], width)
        for token in (left, right):
            for slot in out_slots:
                weights[token][slot] += 1
    return weights


def low_weight_weight(outputs, width, onehot, max_weight, home_bonus):
    weights = [[0 for _slot in range(width)] for _token in range(width)]
    for token, slot in enumerate(onehot):
        weights[token][slot] += home_bonus
    for weight in range(2, max_weight + 1):
        for tokens in itertools.combinations(range(width), weight):
            mask = 0
            for token in tokens:
                mask |= 1 << token
            out_slots = bits_of(outputs[mask], width)
            for token in tokens:
                for slot in out_slots:
                    weights[token][slot] += 1
    return weights


def distance_weight(width, onehot, home_bonus):
    weights = [[0 for _slot in range(width)] for _token in range(width)]
    for token, home in enumerate(onehot):
        for slot in range(width):
            dist = min((slot - home) % width, (home - slot) % width)
            weights[token][slot] = home_bonus - dist
    return weights


def make_weights(outputs, width, onehot, style, home_bonus):
    if style == "pair_freq":
        return pair_weight(outputs, width, onehot, home_bonus)
    if style == "low3_freq":
        return low_weight_weight(outputs, width, onehot, 3, home_bonus)
    if style == "low4_freq":
        return low_weight_weight(outputs, width, onehot, 4, home_bonus)
    if style == "home_distance":
        return distance_weight(width, onehot, home_bonus)
    raise RuntimeError("unknown weight style {0}".format(style))


def choose_better(old_score, old_mask, new_score, new_mask, tie):
    if old_score is None or new_score > old_score:
        return new_score, new_mask
    if new_score < old_score:
        return old_score, old_mask
    if tie == "low":
        return (new_score, new_mask) if new_mask < old_mask else (old_score, old_mask)
    if tie == "high":
        return (new_score, new_mask) if new_mask > old_mask else (old_score, old_mask)
    raise RuntimeError("unknown tie {0}".format(tie))


def matching_mask(mask, width, order, weights, tie):
    active = [token for token in order if (mask >> token) & 1]
    states = {0: 0}
    for token in active:
        nxt = {}
        for used, score in states.items():
            for slot in range(width):
                if (used >> slot) & 1:
                    continue
                new_mask = used | (1 << slot)
                new_score = score + weights[token][slot]
                old_score = nxt.get(new_mask)
                if old_score is None:
                    nxt[new_mask] = new_score
                elif new_score > old_score:
                    nxt[new_mask] = new_score
        states = nxt
    best_score = None
    best_mask = None
    for out_mask, score in states.items():
        best_score, best_mask = choose_better(best_score, best_mask, score, out_mask, tie)
    return best_mask


def parse_list(text):
    return [item.strip() for item in text.split(",") if item.strip()]


def run_case(case, benchmarks, sample_limit, max_sample_weight, weight_styles, home_bonuses, order_styles, ties, transforms):
    table = TruthTable(benchmarks / "{0}.truth".format(case))
    if table.input_width != table.output_width:
        raise RuntimeError("{0}: width mismatch".format(case))
    width = table.input_width
    outputs = list(table.iter_outputs())
    onehot = onehot_slots(outputs, width)
    sample = sample_indices(width, sample_limit, max_sample_weight)
    rows = []
    for weight_style in weight_styles:
        for home_bonus in home_bonuses:
            weights = make_weights(outputs, width, onehot, weight_style, home_bonus)
            for order_style in order_styles:
                order = token_order(case, width, onehot, order_style)
                for tie in ties:
                    for transform in transforms:
                        exact = 0
                        bit_matches = 0
                        first = ""
                        for value in sample:
                            got = output_transform(matching_mask(value, width, order, weights, tie), width, transform)
                            expected = outputs[value]
                            if got == expected:
                                exact += 1
                            elif not first:
                                first = "x=0x{0:x};got=0x{1:x};expected=0x{2:x}".format(value, got, expected)
                            bit_matches += width - popcount(got ^ expected)
                        rows.append(
                            {
                                "case": case,
                                "input_width": width,
                                "output_width": width,
                                "sample_rows": len(sample),
                                "weight_style": weight_style,
                                "home_bonus": home_bonus,
                                "token_order": order_style,
                                "tie": tie,
                                "output_transform": transform,
                                "row_matches": exact,
                                "bit_matches": bit_matches,
                                "bit_total": len(sample) * width,
                                "first_mismatch": first,
                                "notes": "sampled global maximum-weight token-slot matching",
                            }
                        )
    return rows


def write_csv(path, fieldnames, rows):
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(rows)


def write_manifest(path, run_id, cases, work_dir, results_dir, sample_limit):
    text = """# {0}

Run ID: `{0}`

Purpose: Diagnose whether ex286-ex289 are compact conservative token-routing
functions expressible as global maximum-weight token-to-slot matching learned
from one-hot and low-weight behavior.

Inputs:
- Cases: `{1}`
- Truth files: `benchmarks/<case>.truth`
- Script: `student/generators/unknown_matching_diag.py`

Artifacts:
- Work directory: `{2}`
- Results directory: `{3}`
- Results: `results/summary.csv`

Methods tried:
- Weight matrices from two-hot rows, low-weight rows, and home-slot distance.
- Token orders: natural, reverse, home, home_reverse, symmetry-pair order.
- Tie policies: low/high output mask; output transforms identity/reverse.
- Stratified sample target: `{4}`.

Notes:
- Diagnostic only; no Verilog/AIG candidates emitted.
- `student/seeds` and `output/` are intentionally untouched.
""".format(
        run_id,
        ",".join(cases),
        work_dir,
        results_dir,
        sample_limit,
    )
    path.write_text(text)


def main(argv=None):
    parser = argparse.ArgumentParser()
    parser.add_argument("--cases", required=True)
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--run-id", required=True)
    parser.add_argument("--work-dir", type=Path, required=True)
    parser.add_argument("--results-dir", type=Path, required=True)
    parser.add_argument("--sample-limit", type=int, default=1024)
    parser.add_argument("--max-sample-weight", type=int, default=-1)
    parser.add_argument("--weight-styles", default="pair_freq,low3_freq,home_distance")
    parser.add_argument("--home-bonuses", default="0,16,64")
    parser.add_argument("--orders", default="home,sym,natural")
    parser.add_argument("--ties", default="low,high")
    parser.add_argument("--transforms", default="identity,reverse")
    args = parser.parse_args(argv)

    cases = parse_cases(args.cases)
    weight_styles = parse_list(args.weight_styles)
    home_bonuses = [int(item) for item in parse_list(args.home_bonuses)]
    order_styles = parse_list(args.orders)
    ties = parse_list(args.ties)
    transforms = parse_list(args.transforms)
    rows = []
    for case in cases:
        rows.extend(
            run_case(
                case,
                args.benchmarks,
                args.sample_limit,
                args.max_sample_weight,
                weight_styles,
                home_bonuses,
                order_styles,
                ties,
                transforms,
            )
        )
    fields = [
        "case",
        "input_width",
        "output_width",
        "sample_rows",
        "weight_style",
        "home_bonus",
        "token_order",
        "tie",
        "output_transform",
        "row_matches",
        "bit_matches",
        "bit_total",
        "first_mismatch",
        "notes",
    ]
    write_csv(args.results_dir / "summary.csv", fields, rows)
    empty_fields = ["case", "candidate_id", "equivalent", "area", "delay", "adp", "notes"]
    write_csv(args.results_dir / "candidates.csv", empty_fields, [])
    write_csv(args.results_dir / "best.csv", empty_fields, [])
    write_csv(args.results_dir / "evaluate_check.csv", empty_fields, [])
    write_manifest(args.results_dir.parent / "MANIFEST.md", args.run_id, cases, args.work_dir, args.results_dir, args.sample_limit)
    for case in cases:
        best = max(
            [row for row in rows if row["case"] == case],
            key=lambda row: (int(row["row_matches"]), int(row["bit_matches"])),
        )
        print(
            "{0} best rows={1}/{2} bits={3}/{4} model={5}+hb{6}/{7}/{8}/{9}".format(
                case,
                best["row_matches"],
                best["sample_rows"],
                best["bit_matches"],
                best["bit_total"],
                best["weight_style"],
                best["home_bonus"],
                best["token_order"],
                best["tie"],
                best["output_transform"],
            )
        )
    print("rows={0} output={1}".format(len(rows), args.results_dir / "summary.csv"))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
