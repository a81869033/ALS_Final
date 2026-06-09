#!/usr/bin/env python3
"""Complement/permutation duality CSP diagnostic for ex286-ex289.

This diagnostic searches for high-leverage relations of the form

    f(P(~x)) = Q(~f(x))

where P and Q are bit permutations.  Such a relation would allow the same kind
of half-domain wrapper that made ex289 improve substantially, but with P/Q not
limited to identity/reverse/rotate.  The search derives Q from one-hot and
co-singleton behavior for each candidate P, then checks low-weight samples
before any full-table scan.
"""

import argparse
import csv
import itertools
import math
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from student.frontends.truth import TruthTable


KNOWN_PAIRS = {
    "ex286": [(4, 5), (6, 7)],
    "ex287": [(4, 5), (6, 7), (8, 9)],
    "ex288": [(4, 5), (6, 7), (8, 9)],
    "ex289": [(4, 5), (6, 7), (8, 9), (10, 11)],
}

FIELDS = [
    "case",
    "metric",
    "candidate",
    "sample_matches",
    "sample_total",
    "full_matches",
    "full_total",
    "bit_matches",
    "bit_total",
    "input_perm",
    "output_perm",
    "notes",
]


def parse_cases(text):
    return [item.strip() for item in text.split(",") if item.strip()]


def one_position(value):
    if value == 0 or (value & (value - 1)) != 0:
        return None
    return (value & -value).bit_length() - 1


def popcount(value):
    return bin(value).count("1")


def perm_identity(width):
    return tuple(range(width))


def perm_reverse(width):
    return tuple(width - 1 - bit for bit in range(width))


def perm_rotate(width, amount):
    return tuple((bit + amount) % width for bit in range(width))


def perm_affine_mod(width, scale, offset):
    return tuple((scale * bit + offset) % width for bit in range(width))


def perm_pair_swaps(width, pairs, mask):
    perm = list(range(width))
    for index, (left, right) in enumerate(pairs):
        if (mask >> index) & 1:
            perm[left], perm[right] = perm[right], perm[left]
    return tuple(perm)


def compose(left, right):
    return tuple(left[right[bit]] for bit in range(len(left)))


def invert_perm(perm):
    inv = [0] * len(perm)
    for src, dst in enumerate(perm):
        inv[dst] = src
    return tuple(inv)


def perm_name(perm):
    return ":".join(str(bit) for bit in perm)


def apply_perm(value, perm):
    out = 0
    for src, dst in enumerate(perm):
        if (value >> src) & 1:
            out |= 1 << dst
    return out


def unique_named(items):
    out = []
    seen = set()
    for name, perm in items:
        if perm in seen:
            continue
        seen.add(perm)
        out.append((name, perm))
    return out


def base_perms(width):
    items = [
        ("id", perm_identity(width)),
        ("rev", perm_reverse(width)),
    ]
    for amount in range(width):
        items.append(("rot{0}".format(amount), perm_rotate(width, amount)))
    for scale in range(width):
        if math.gcd(scale, width) != 1:
            continue
        for offset in range(width):
            items.append(("aff{0}_{1}".format(scale, offset), perm_affine_mod(width, scale, offset)))
    return unique_named(items)


def candidate_input_perms(width, pairs, limit_pair_composes):
    bases = base_perms(width)
    pair_items = [
        ("ps{0:x}".format(mask), perm_pair_swaps(width, pairs, mask))
        for mask in range(1 << len(pairs))
    ]
    items = []
    for base_name, base in bases:
        items.append((base_name, base))
        if limit_pair_composes:
            for pair_name, pair_perm in pair_items:
                if pair_name == "ps0":
                    continue
                items.append(("{0}+{1}".format(base_name, pair_name), compose(pair_perm, base)))
                items.append(("{0}+post{1}".format(base_name, pair_name), compose(base, pair_perm)))
    return unique_named(items)


def candidate_relation_pairs(width, pairs, pair_composes):
    base = base_perms(width)
    if not pair_composes:
        expanded = base
    else:
        expanded = candidate_input_perms(width, pairs, True)
    pairs_out = []
    seen = set()

    def add(name, pin, qout):
        key = (pin, qout)
        if key in seen:
            return
        seen.add(key)
        pairs_out.append((name, pin, qout))

    for pname, pin in base:
        for qname, qout in base:
            add("base:{0}|{1}".format(pname, qname), pin, qout)
    if pair_composes:
        base_set = set(perm for _name, perm in base)
        for pname, pin in expanded:
            if pin in base_set:
                continue
            for qname, qout in base:
                add("pinpair:{0}|{1}".format(pname, qname), pin, qout)
        for pname, pin in base:
            for qname, qout in expanded:
                if qout in base_set:
                    continue
                add("qpair:{0}|{1}".format(pname, qname), pin, qout)
    return pairs_out


def derive_q_from_p(pin, onehot_home, cosingleton_hole):
    width = len(pin)
    q = [None] * width
    for input_bit, home in enumerate(onehot_home):
        if home is None:
            return None
        hole = cosingleton_hole[pin[input_bit]]
        if hole is None:
            return None
        if q[home] is not None and q[home] != hole:
            return None
        q[home] = hole
    if any(item is None for item in q) or len(set(q)) != width:
        return None
    return tuple(q)


def derive_p_from_q(qout, onehot_home, cosingleton_hole):
    width = len(qout)
    hole_inv = invert_perm(tuple(cosingleton_hole))
    p = [None] * width
    for input_bit, home in enumerate(onehot_home):
        p[input_bit] = hole_inv[qout[home]]
    if len(set(p)) != width:
        return None
    return tuple(p)


def sample_indices(width, max_weight):
    values = set()
    for weight in range(max_weight + 1):
        for bits in itertools.combinations(range(width), weight):
            value = 0
            for bit in bits:
                value |= 1 << bit
            values.add(value)
            values.add(((1 << width) - 1) ^ value)
    return sorted(values)


def score_relation(outputs, width, pin, qout, indices):
    full = (1 << width) - 1
    matches = 0
    bit_matches = 0
    first = ""
    for x in indices:
        xp = apply_perm(x ^ full, pin)
        predicted = apply_perm(outputs[x] ^ full, qout)
        got = outputs[xp]
        if got == predicted:
            matches += 1
        elif not first:
            first = "x=0x{0:x};xp=0x{1:x};got=0x{2:x};pred=0x{3:x}".format(
                x, xp, got, predicted
            )
        bit_matches += width - popcount(got ^ predicted)
    return matches, bit_matches, first


def vector_left(outputs, width, pin, indices):
    full = (1 << width) - 1
    return tuple(outputs[apply_perm(x ^ full, pin)] for x in indices)


def vector_right(outputs, width, qout, indices):
    full = (1 << width) - 1
    return tuple(apply_perm(outputs[x] ^ full, qout) for x in indices)


def run_case_exact_sample(case, benchmarks, max_sample_weight, pair_composes):
    table = TruthTable(benchmarks / "{0}.truth".format(case))
    outputs = list(table.iter_outputs())
    width = table.input_width
    samples = sample_indices(width, max_sample_weight)
    perms = candidate_input_perms(width, KNOWN_PAIRS.get(case, []), pair_composes)

    left = {}
    for name, pin in perms:
        left.setdefault(vector_left(outputs, width, pin, samples), []).append((name, pin))
    rows = []
    hits = []
    for qname, qout in perms:
        key = vector_right(outputs, width, qout, samples)
        if key not in left:
            continue
        for pname, pin in left[key]:
            hits.append((pname, pin, qname, qout))

    full_indices = list(range(1 << width))
    for pname, pin, qname, qout in hits[:200]:
        full_matches, bit_matches, first = score_relation(outputs, width, pin, qout, full_indices)
        rows.append(
            {
                "case": case,
                "metric": "complement_perm_duality_exact_sample",
                "candidate": "{0}|{1}".format(pname, qname),
                "sample_matches": str(len(samples)),
                "sample_total": str(len(samples)),
                "full_matches": str(full_matches),
                "full_total": str(len(outputs)),
                "bit_matches": str(bit_matches),
                "bit_total": str(len(outputs) * width),
                "input_perm": perm_name(pin),
                "output_perm": perm_name(qout),
                "notes": "full_first_mismatch={0}".format(first),
            }
        )
    if not rows:
        rows.append(
            {
                "case": case,
                "metric": "complement_perm_duality_exact_sample",
                "candidate": "no_exact_sample_hit",
                "sample_matches": "0",
                "sample_total": str(len(samples)),
                "full_matches": "",
                "full_total": str(len(outputs)),
                "bit_matches": "",
                "bit_total": str(len(samples) * width),
                "input_perm": "",
                "output_perm": "",
                "notes": "no P/Q pair in the candidate permutation family matched the low-weight sample exactly",
            }
        )
    return rows


def run_case(case, benchmarks, max_sample_weight, full_top, pair_composes):
    table = TruthTable(benchmarks / "{0}.truth".format(case))
    outputs = list(table.iter_outputs())
    width = table.input_width
    full_indices = list(range(1 << width))
    samples = sample_indices(width, max_sample_weight)
    full = (1 << width) - 1
    onehot_home = [one_position(outputs[1 << bit]) for bit in range(width)]
    cosingleton_hole = [
        one_position(full ^ outputs[full ^ (1 << bit)])
        for bit in range(width)
    ]
    if any(item is None for item in onehot_home) or any(item is None for item in cosingleton_hole):
        return [
            {
                "case": case,
                "metric": "complement_perm_duality",
                "candidate": "precheck",
                "sample_matches": "0",
                "sample_total": str(len(samples)),
                "full_matches": "",
                "full_total": str(len(outputs)),
                "bit_matches": "",
                "bit_total": str(len(samples) * width),
                "input_perm": "",
                "output_perm": "",
                "notes": "one-hot or co-singleton layer is not permutation-like",
            }
        ]

    candidates = []
    for name, pin in candidate_input_perms(width, KNOWN_PAIRS.get(case, []), pair_composes):
        qout = derive_q_from_p(pin, onehot_home, cosingleton_hole)
        if qout is not None:
            candidates.append(("pin:" + name, pin, qout))

    # Also search the dual view: assume Q is simple and infer the corresponding P.
    for name, qout in candidate_input_perms(width, KNOWN_PAIRS.get(case, []), pair_composes):
        pin = None
        if len(set(cosingleton_hole)) == width:
            pin = derive_p_from_q(qout, onehot_home, cosingleton_hole)
        if pin is not None:
            candidates.append(("qout:" + name, pin, qout))
    candidates.extend(
        candidate_relation_pairs(width, KNOWN_PAIRS.get(case, []), pair_composes)
    )

    unique = []
    seen = set()
    for name, pin, qout in candidates:
        key = (pin, qout)
        if key in seen:
            continue
        seen.add(key)
        unique.append((name, pin, qout))
    if not unique:
        return [
            {
                "case": case,
                "metric": "complement_perm_duality",
                "candidate": "no_candidates",
                "sample_matches": "0",
                "sample_total": str(len(samples)),
                "full_matches": "",
                "full_total": str(len(outputs)),
                "bit_matches": "0",
                "bit_total": str(len(samples) * width),
                "input_perm": "",
                "output_perm": "",
                "notes": "no affine/pair-composed P or Q survived one-hot/co-singleton permutation constraints",
            }
        ]

    rows = []
    scored = []
    for name, pin, qout in unique:
        sample_matches, sample_bit_matches, first = score_relation(outputs, width, pin, qout, samples)
        scored.append((sample_matches, sample_bit_matches, name, pin, qout, first))
    scored.sort(key=lambda item: (item[0], item[1]), reverse=True)

    full_checked = 0
    for sample_matches, sample_bit_matches, name, pin, qout, first in scored[: max(full_top, 1)]:
        full_matches = ""
        bit_matches = str(sample_bit_matches)
        notes = "sample_first_mismatch={0}".format(first)
        if sample_matches == len(samples) or full_checked < full_top:
            full_checked += 1
            fm, fb, full_first = score_relation(outputs, width, pin, qout, full_indices)
            full_matches = str(fm)
            bit_matches = str(fb)
            notes = "full_first_mismatch={0}".format(full_first)
        rows.append(
            {
                "case": case,
                "metric": "complement_perm_duality",
                "candidate": name,
                "sample_matches": str(sample_matches),
                "sample_total": str(len(samples)),
                "full_matches": full_matches,
                "full_total": str(len(outputs)),
                "bit_matches": bit_matches,
                "bit_total": str(len(outputs) * width if full_matches else len(samples) * width),
                "input_perm": perm_name(pin),
                "output_perm": perm_name(qout),
                "notes": notes,
            }
        )
    return rows


def write_csv(path, fields, rows):
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields)
        writer.writeheader()
        writer.writerows(rows)


def write_empty_frontend_csvs(results_dir):
    candidate_fields = [
        "case",
        "candidate_id",
        "hypothesis",
        "variant",
        "verilog_path",
        "aig_path",
        "area",
        "delay",
        "adp",
        "items",
        "notes",
    ]
    summary_fields = [
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
    write_csv(results_dir / "candidates.csv", candidate_fields, [])
    write_csv(results_dir / "best.csv", candidate_fields, [])
    write_csv(results_dir / "summary.csv", summary_fields, [])
    write_csv(results_dir / "evaluate_check.csv", summary_fields, [])


def write_manifest(run_dir, run_id, cases, rows, max_sample_weight):
    with (run_dir / "MANIFEST.md").open("w") as handle:
        handle.write("# {0}\n\n".format(run_id))
        handle.write("Diagnostic-only complement/permutation duality CSP search.\n\n")
        handle.write("Purpose: search for exact `f(P(~x)) = Q(~f(x))` relations with affine/index and known-pair-composed P/Q candidates. ")
        handle.write("An exact hit would be a high-leverage half-domain frontend source analogous to the ex289 duality wrapper.\n\n")
        handle.write("Inputs:\n")
        handle.write("- Cases: `{0}`\n".format(",".join(cases)))
        handle.write("- Sample gate: Hamming weight <= `{0}` and complements\n".format(max_sample_weight))
        handle.write("- Script: `student/generators/unknown_affine_duality_csp_diag.py`\n\n")
        handle.write("Artifacts:\n")
        handle.write("- Results: `results/affine_duality_csp_diagnostics.csv`, `results/summary.csv`, `results/candidates.csv`, `results/best.csv`, `results/evaluate_check.csv`\n\n")
        handle.write("Notes:\n")
        exact = [
            row for row in rows
            if row["full_matches"] and row["full_matches"] == row["full_total"]
        ]
        if exact:
            handle.write("- Exact relation(s) found; inspect diagnostics before generating RTL.\n")
        else:
            handle.write("- No exact relation found in this candidate family; no Verilog/AIG candidates emitted.\n")
        handle.write("- `student/seeds` and `output/` are intentionally untouched.\n")


def parse_args(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--cases", type=parse_cases, required=True)
    parser.add_argument("--run-id", required=True)
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--max-sample-weight", type=int, default=2)
    parser.add_argument("--full-top", type=int, default=40)
    parser.add_argument("--no-pair-composes", action="store_true")
    parser.add_argument("--exact-sample-hash-only", action="store_true")
    return parser.parse_args(argv)


def main(argv=None):
    args = parse_args(argv)
    run_dir = ROOT / "student" / "runs" / "unknown" / args.run_id
    results_dir = run_dir / "results"
    rows = []
    for case in args.cases:
        if args.exact_sample_hash_only:
            case_rows = run_case_exact_sample(
                case,
                args.benchmarks,
                args.max_sample_weight,
                not args.no_pair_composes,
            )
        else:
            case_rows = run_case(
                case,
                args.benchmarks,
                args.max_sample_weight,
                args.full_top,
                not args.no_pair_composes,
            )
        rows.extend(case_rows)
        best = max(case_rows, key=lambda row: (int(row["sample_matches"]), int(row["bit_matches"] or "0")))
        print(
            "{0} best sample={1}/{2} full={3}/{4} candidate={5}".format(
                case,
                best["sample_matches"],
                best["sample_total"],
                best["full_matches"] or "-",
                best["full_total"],
                best["candidate"],
            ),
            flush=True,
        )
    write_csv(results_dir / "affine_duality_csp_diagnostics.csv", FIELDS, rows)
    write_empty_frontend_csvs(results_dir)
    write_manifest(run_dir, args.run_id, args.cases, rows, args.max_sample_weight)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
