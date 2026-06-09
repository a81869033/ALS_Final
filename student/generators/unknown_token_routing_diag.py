#!/usr/bin/env python3
"""Diagnostics for Hamming-weight-preserving unknown truth tables.

This script looks for token-routing structure: rotations/reflections, local
rules, and small prefix-balance transducers.  It writes CSV-only diagnostics so
follow-up generators can target only promising exact structures.
"""

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


def bits(value, width):
    return tuple((value >> bit) & 1 for bit in range(width))


def rotate_left(value, width, shift):
    mask = (1 << width) - 1
    shift %= width
    return ((value << shift) | (value >> (width - shift))) & mask


def reverse_bits(value, width):
    out = 0
    for bit in range(width):
        if (value >> bit) & 1:
            out |= 1 << (width - 1 - bit)
    return out


def hdist(a, b):
    return popcount(a ^ b)


def build_infos(outputs, width):
    infos = []
    for x, y in enumerate(outputs):
        prefix = [0]
        bal = 0
        for bit in range(width):
            bal += ((x >> bit) & 1) - ((y >> bit) & 1)
            prefix.append(bal)
        suffix_after = [0] * width
        bal = 0
        for bit in range(width - 1, -1, -1):
            suffix_after[bit] = bal
            bal += ((x >> bit) & 1) - ((y >> bit) & 1)
        infos.append({
            "x": x,
            "y": y,
            "in_pos": tuple(bit for bit in range(width) if (x >> bit) & 1),
            "out_pos": tuple(bit for bit in range(width) if (y >> bit) & 1),
            "prefix": tuple(prefix),
            "suffix_after": tuple(suffix_after),
        })
    return infos


def summarize_case(case, truth_dir):
    table = TruthTable(truth_dir / (case + ".truth"))
    outputs = list(table.iter_outputs())
    infos = build_infos(outputs, table.input_width)
    width = table.input_width
    assert table.output_width == width
    count = 1 << width

    rows = []
    preserve = sum(1 for x, y in enumerate(outputs) if popcount(x) == popcount(y))
    fixed = sum(1 for x, y in enumerate(outputs) if x == y)
    distances = Counter(hdist(x, y) for x, y in enumerate(outputs))

    best_transforms = []
    for kind in ("rot", "revrot"):
        base_reverse = kind == "revrot"
        for shift in range(width):
            match = 0
            dist_sum = 0
            for x, y in enumerate(outputs):
                tx = reverse_bits(x, width) if base_reverse else x
                tx = rotate_left(tx, width, shift)
                if tx == y:
                    match += 1
                dist_sum += hdist(tx, y)
            best_transforms.append((match, -dist_sum, kind, shift))
    best_transforms.sort(reverse=True)

    rows.append({
        "case": case,
        "metric": "basic",
        "key": "width",
        "value": str(width),
        "detail": "outputs={0} preserve={1}/{0} fixed={2}".format(count, preserve, fixed),
    })
    rows.append({
        "case": case,
        "metric": "hamming_distance",
        "key": "distribution",
        "value": ";".join("{0}:{1}".format(k, distances[k]) for k in sorted(distances)),
        "detail": "",
    })
    for rank, item in enumerate(best_transforms[:8], 1):
        match, neg_dist, kind, shift = item
        rows.append({
            "case": case,
            "metric": "global_transform",
            "key": "{0}_{1}".format(kind, shift),
            "value": str(match),
            "detail": "rank={0} avg_hdist={1:.4f}".format(rank, -neg_dist / float(count)),
        })

    rows.extend(local_rule_rows(case, infos, width))
    rows.extend(prefix_balance_rows(case, infos, width))
    rows.extend(rank_context_rows(case, infos, width))
    return rows


def local_rule_rows(case, infos, width):
    rows = []
    for include_k in (False, True):
        for ring in (False, True):
            for radius in range(0, 5):
                exact_bits = 0
                conflicts = 0
                max_keys = 0
                for out_bit in range(width):
                    seen = {}
                    bit_conflicts = 0
                    for info in infos:
                        x = info["x"]
                        y = info["y"]
                        fields = []
                        if include_k:
                            fields.append(popcount(x))
                        for off in range(-radius, radius + 1):
                            pos = out_bit + off
                            if ring:
                                pos %= width
                                fields.append((x >> pos) & 1)
                            else:
                                fields.append((x >> pos) & 1 if 0 <= pos < width else 0)
                        key = tuple(fields)
                        bit = (y >> out_bit) & 1
                        old = seen.get(key)
                        if old is None:
                            seen[key] = bit
                        elif old != bit:
                            bit_conflicts += 1
                    if bit_conflicts == 0:
                        exact_bits += 1
                    conflicts += bit_conflicts
                    max_keys = max(max_keys, len(seen))
                rows.append({
                    "case": case,
                    "metric": "local_rule",
                    "key": "r{0}_{1}_{2}".format(radius, "ring" if ring else "line", "k" if include_k else "nok"),
                    "value": str(exact_bits),
                    "detail": "conflicts={0} max_keys={1}".format(conflicts, max_keys),
                })
    return rows


def prefix_balance_rows(case, infos, width):
    rows = []
    balances_by_cut = [Counter() for _ in range(width + 1)]
    max_abs = 0
    for info in infos:
        for bit, bal in enumerate(info["prefix"]):
            max_abs = max(max_abs, abs(bal))
            balances_by_cut[bit][bal] += 1
    rows.append({
        "case": case,
        "metric": "prefix_balance",
        "key": "state_counts",
        "value": ",".join(str(len(c)) for c in balances_by_cut),
        "detail": "max_abs={0}".format(max_abs),
    })

    for direction in ("fwd", "rev"):
        for lookahead in range(0, 7):
            exact_positions = 0
            conflicts = 0
            max_keys = 0
            for pos in range(width):
                seen = {}
                bit_conflicts = 0
                for info in infos:
                    x = info["x"]
                    y = info["y"]
                    if direction == "fwd":
                        bal = info["prefix"][pos]
                        fields = [bal]
                        for off in range(lookahead + 1):
                            p = pos + off
                            fields.append((x >> p) & 1 if p < width else 0)
                        out_bit = (y >> pos) & 1
                    else:
                        rev_pos = width - 1 - pos
                        bal = info["suffix_after"][rev_pos]
                        fields = [bal]
                        for off in range(lookahead + 1):
                            p = rev_pos - off
                            fields.append((x >> p) & 1 if p >= 0 else 0)
                        out_bit = (y >> rev_pos) & 1
                    key = tuple(fields)
                    old = seen.get(key)
                    if old is None:
                        seen[key] = out_bit
                    elif old != out_bit:
                        bit_conflicts += 1
                if bit_conflicts == 0:
                    exact_positions += 1
                conflicts += bit_conflicts
                max_keys = max(max_keys, len(seen))
            rows.append({
                "case": case,
                "metric": "balance_transducer",
                "key": "{0}_la{1}".format(direction, lookahead),
                "value": str(exact_positions),
                "detail": "conflicts={0} max_keys={1}".format(conflicts, max_keys),
            })
    return rows


def rank_context_rows(case, infos, width):
    rows = []
    for include_k in (False, True):
        for radius in range(0, 4):
            conflicts = 0
            exact_ranks = 0
            for rank in range(width):
                seen = {}
                rank_conflicts = 0
                active = 0
                for info in infos:
                    x = info["x"]
                    in_pos = info["in_pos"]
                    out_pos = info["out_pos"]
                    if rank >= len(in_pos):
                        continue
                    active += 1
                    pos = in_pos[rank]
                    fields = []
                    if include_k:
                        fields.append(len(in_pos))
                    fields.append(rank)
                    fields.append(pos)
                    for off in range(-radius, radius + 1):
                        p = pos + off
                        fields.append((x >> p) & 1 if 0 <= p < width else 0)
                    key = tuple(fields)
                    val = out_pos[rank]
                    old = seen.get(key)
                    if old is None:
                        seen[key] = val
                    elif old != val:
                        rank_conflicts += 1
                if active and rank_conflicts == 0:
                    exact_ranks += 1
                conflicts += rank_conflicts
            rows.append({
                "case": case,
                "metric": "rank_context",
                "key": "r{0}_{1}".format(radius, "k" if include_k else "nok"),
                "value": str(exact_ranks),
                "detail": "conflicts={0}".format(conflicts),
            })
    return rows


def write_manifest(path, run_id, cases):
    text = """# {0}

Run ID: `{0}`

Purpose: Bounded token-routing diagnostics for ex286-ex289 after wide affine
token-rank search proved too expensive.

Inputs:
- Truth files: benchmarks/ex286.truth through benchmarks/ex289.truth
- Generator/script: student/generators/unknown_token_routing_diag.py

Artifacts:
- Results: student/runs/unknown/{0}/results/token_routing_diagnostics.csv

Methods tried:
- Hamming-weight preservation and distance distribution
- Rotation/reflection match rates
- Local line/ring rules with optional popcount key
- Prefix-balance transducer tests with bounded lookahead
- Token rank/context collision tests

Best result:
- Diagnostic-only run; no Verilog/AIG candidates generated.

Notes:
- This run intentionally avoids output/ and student/seeds.
- Follow-up should generate RTL only for exact or low-conflict structures.
""".format(run_id)
    path.write_text(text)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--cases", default="ex286,ex287,ex288,ex289")
    parser.add_argument("--truth-dir", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--run-id", required=True)
    args = parser.parse_args()

    cases = [item.strip() for item in args.cases.split(",") if item.strip()]
    run_dir = ROOT / "student" / "runs" / "unknown" / args.run_id
    results_dir = run_dir / "results"
    results_dir.mkdir(parents=True, exist_ok=True)

    rows = []
    for case in cases:
        rows.extend(summarize_case(case, args.truth_dir))

    with (results_dir / "token_routing_diagnostics.csv").open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=["case", "metric", "key", "value", "detail"])
        writer.writeheader()
        writer.writerows(rows)

    for name in ("candidates.csv", "best.csv", "summary.csv", "evaluate_check.csv"):
        with (results_dir / name).open("w", newline="") as handle:
            handle.write("case,candidate_id,hypothesis,variant,verilog_path,aig_path,verified_truth,equivalent,area,delay,adp,notes\n")
    write_manifest(run_dir / "MANIFEST.md", args.run_id, cases)


if __name__ == "__main__":
    main()
