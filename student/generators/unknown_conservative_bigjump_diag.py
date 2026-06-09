#!/usr/bin/env python3
"""High-leverage conservative-map diagnostics for ex286-ex289.

These cases exactly preserve Hamming weight, but previous BDD/cofactor seeds are
far above reference.  This script tests structural hypotheses that could lead
to a much smaller frontend RTL:

- output-state insertion recurrences,
- small candidate-slot matching/parking,
- generalized input/output permutation symmetries,
- layer-rank permutations,
- independent small-block scatter,
- simple prefix/suffix count transport.

It is diagnostic-only and intentionally emits no Verilog/AIG candidates.
"""

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


FIELDS = ["case", "metric", "key", "value", "detail"]
EMPTY_CANDIDATE_HEADER = (
    "case,candidate_id,hypothesis,variant,verilog_path,aig_path,"
    "verified_truth,equivalent,area,delay,adp,notes\n"
)


def popcount(value):
    return bin(value).count("1")


def positions(value, width):
    return [bit for bit in range(width) if (value >> bit) & 1]


def one_position(value):
    if value == 0 or (value & (value - 1)) != 0:
        return -1
    return (value & -value).bit_length() - 1


def bit_reverse(value, width):
    result = 0
    for bit in range(width):
        if (value >> bit) & 1:
            result |= 1 << (width - 1 - bit)
    return result


def swap_bits(value, bit_a, bit_b):
    a = (value >> bit_a) & 1
    b = (value >> bit_b) & 1
    if a == b:
        return value
    return value ^ (1 << bit_a) ^ (1 << bit_b)


def apply_perm(value, perm):
    result = 0
    for old_bit, new_bit in enumerate(perm):
        if (value >> old_bit) & 1:
            result |= 1 << new_bit
    return result


def order_styles(width, onehot):
    return {
        "natural": list(range(width)),
        "reverse": list(reversed(range(width))),
        "onehot": sorted(range(width), key=lambda bit: (onehot[bit], bit)),
        "onehot_rev": sorted(range(width), key=lambda bit: (-onehot[bit], bit)),
    }


def insertion_rows(case, outputs, width, onehot):
    rows = []
    for name, order in order_styles(width, onehot).items():
        prefixes = [0]
        total_conflicts = 0
        stage_items = []
        for bit in order:
            transition = {}
            conflicts = 0
            for prefix in prefixes:
                before = outputs[prefix]
                after = outputs[prefix | (1 << bit)]
                old = transition.get(before)
                if old is None:
                    transition[before] = after
                elif old != after:
                    conflicts += 1
            total_conflicts += conflicts
            stage_items.append(
                "{0}:states={1}:conflicts={2}".format(bit, len(transition), conflicts)
            )
            prefixes += [prefix | (1 << bit) for prefix in prefixes]
        rows.append(
            {
                "case": case,
                "metric": "output_state_insertion",
                "key": name,
                "value": str(total_conflicts),
                "detail": ";".join(stage_items),
            }
        )
    return rows


def kuhn_match(left_bits, candidates, output_bits):
    output_set = set(output_bits)
    output_index = {bit: index for index, bit in enumerate(output_bits)}
    adjacency = []
    for bit in left_bits:
        options = [output_index[item] for item in candidates[bit] & output_set]
        if not options:
            return False
        adjacency.append(options)
    order = sorted(range(len(adjacency)), key=lambda index: len(adjacency[index]))
    match_to = [-1] * len(output_bits)

    def dfs(left_index, seen):
        for right_index in adjacency[left_index]:
            if seen[right_index]:
                continue
            seen[right_index] = True
            if match_to[right_index] < 0 or dfs(match_to[right_index], seen):
                match_to[right_index] = left_index
                return True
        return False

    for left_index in order:
        if not dfs(left_index, [False] * len(output_bits)):
            return False
    return True


def matching_rows(case, outputs, width, onehot, caps):
    freq_by_input = []
    pair_sizes = []
    for bit in range(width):
        freq = {onehot[bit]: 100000}
        for other in range(width):
            if other == bit:
                continue
            for output_bit in positions(outputs[(1 << bit) | (1 << other)], width):
                freq[output_bit] = freq.get(output_bit, 0) + 1
        freq_by_input.append(freq)
        pair_sizes.append(len(freq))

    rows = [
        {
            "case": case,
            "metric": "slot_candidate_sizes",
            "key": "twohot_profile",
            "value": ":".join(str(item) for item in pair_sizes),
            "detail": "candidate positions per input bit from one-hot/two-hot outputs",
        }
    ]
    for cap in caps:
        candidates = []
        for freq in freq_by_input:
            chosen = sorted(freq.items(), key=lambda item: (-item[1], item[0]))[:cap]
            candidates.append(set(output_bit for output_bit, _count in chosen))
        failures = 0
        first = ""
        for index, expected in enumerate(outputs):
            input_bits = positions(index, width)
            output_bits = positions(expected, width)
            if not kuhn_match(input_bits, candidates, output_bits):
                failures += 1
                if not first:
                    first = "x=0x{0:x};y=0x{1:x};weight={2}".format(
                        index, expected, len(input_bits)
                    )
        rows.append(
            {
                "case": case,
                "metric": "small_slot_matching",
                "key": "cap{0}".format(cap),
                "value": str(failures),
                "detail": first,
            }
        )
    return rows


def generalized_symmetry_rows(case, outputs, width):
    rows = []
    hits = []
    for bit_a, bit_b in itertools.combinations(range(width), 2):
        mapping = {}
        ok = True
        for bit in range(width):
            src = one_position(outputs[1 << bit])
            dst = one_position(outputs[swap_bits(1 << bit, bit_a, bit_b)])
            if src < 0 or dst < 0:
                ok = False
                break
            old = mapping.get(src)
            if old is not None and old != dst:
                ok = False
                break
            mapping[src] = dst
        if not ok:
            continue
        perm = list(range(width))
        for src, dst in mapping.items():
            perm[src] = dst
        if len(set(perm)) != width:
            continue
        matches = 0
        for index, expected in enumerate(outputs):
            if outputs[swap_bits(index, bit_a, bit_b)] == apply_perm(expected, perm):
                matches += 1
        if matches == len(outputs):
            hits.append("{0}:{1}->outperm:{2}".format(bit_a, bit_b, ":".join(map(str, perm))))
    rows.append(
        {
            "case": case,
            "metric": "generalized_symmetry",
            "key": "input_swap_output_perm",
            "value": str(len(hits)),
            "detail": ";".join(hits),
        }
    )
    return rows


def masks_by_weight(width, weight):
    return [value for value in range(1 << width) if popcount(value) == weight]


def layer_rank_rows(case, outputs, width):
    rows = []
    for weight in range(1, width):
        masks = masks_by_weight(width, weight)
        rank = {value: index for index, value in enumerate(masks)}
        total = len(masks)
        bits = max(1, (total - 1).bit_length())
        tests = {
            "identity": lambda item: item,
            "reverse": lambda item: total - 1 - item,
            "bit_reverse": lambda item: bit_reverse(item, bits) % total,
            "bit_reverse_complement": lambda item: (bit_reverse(item, bits) ^ ((1 << bits) - 1)) % total,
        }
        best_name = ""
        best_matches = -1
        for name, func in tests.items():
            matches = 0
            for source in masks:
                if func(rank[source]) == rank[outputs[source]]:
                    matches += 1
            if matches > best_matches:
                best_matches = matches
                best_name = name
        if weight <= 4 or weight >= width - 4 or best_matches > total // 4:
            rows.append(
                {
                    "case": case,
                    "metric": "layer_rank_simple",
                    "key": "w{0}".format(weight),
                    "value": "{0}/{1}".format(best_matches, total),
                    "detail": best_name,
                }
            )
    return rows


def block_scatter_rows(case, outputs, width, block_size):
    groups = []
    for start in range(0, width, block_size):
        groups.append(tuple(range(start, min(width, start + block_size))))
    group_maps = []
    for group in groups:
        mapping = {}
        for pattern in range(1 << len(group)):
            index = 0
            for offset, bit in enumerate(group):
                if (pattern >> offset) & 1:
                    index |= 1 << bit
            mapping[pattern] = outputs[index]
        group_maps.append((group, mapping))
    mismatches = 0
    popcount_bad = 0
    first = ""
    for index, expected in enumerate(outputs):
        predicted = 0
        for group, mapping in group_maps:
            pattern = 0
            for offset, bit in enumerate(group):
                if (index >> bit) & 1:
                    pattern |= 1 << offset
            predicted |= mapping[pattern]
        if predicted != expected:
            mismatches += 1
            if popcount(predicted) != popcount(index):
                popcount_bad += 1
            if not first:
                first = "x=0x{0:x};expected=0x{1:x};pred=0x{2:x}".format(
                    index, expected, predicted
                )
    return [
        {
            "case": case,
            "metric": "independent_block_scatter",
            "key": "block{0}".format(block_size),
            "value": str(mismatches),
            "detail": "groups={0};popcount_bad={1};first={2}".format(
                "|".join(":".join(str(bit) for bit in group) for group in groups),
                popcount_bad,
                first,
            ),
        }
    ]


def prefix_count_rows(case, outputs, width):
    rows = []
    interesting = set([1, 2, 4, 8, 12, width - 1])
    for out_prefix in range(1, width):
        target = [popcount(outputs[index] & ((1 << out_prefix) - 1)) for index in range(1 << width)]
        best_matches = -1
        best_name = ""
        for boundary in range(width + 1):
            prefix_matches = 0
            suffix_matches = 0
            low_mask = (1 << boundary) - 1
            high_mask = ((1 << width) - 1) ^ low_mask
            for index, expected in enumerate(target):
                if popcount(index & low_mask) == expected:
                    prefix_matches += 1
                if popcount(index & high_mask) == expected:
                    suffix_matches += 1
            if prefix_matches > best_matches:
                best_matches = prefix_matches
                best_name = "prefix{0}".format(boundary)
            if suffix_matches > best_matches:
                best_matches = suffix_matches
                best_name = "suffix{0}".format(boundary)
        if out_prefix in interesting or best_matches > (1 << width) * 3 // 4:
            rows.append(
                {
                    "case": case,
                    "metric": "prefix_count_transport",
                    "key": "out_prefix{0}".format(out_prefix),
                    "value": "{0}/{1}".format(best_matches, 1 << width),
                    "detail": best_name,
                }
            )
    return rows


def write_manifest(run_dir, run_id, cases):
    text = """# {0}

Run ID: `{0}`

Purpose: Diagnostic-only search for high-leverage conservative structures in
ex286-ex289.  The tests target structures that could plausibly beat BDD/cofactor
ADP by a large margin: insertion recurrences, small-slot matching/parking,
generalized symmetry, layer-rank transforms, independent block scatter, and
prefix-count transport.

Inputs:
- Truth files: {1}
- Script: `student/generators/unknown_conservative_bigjump_diag.py`

Artifacts:
- Results: `student/runs/unknown/{0}/results/conservative_bigjump_diagnostics.csv`

Best result:
- Diagnostic-only run; no Verilog/AIG candidates generated.

Notes:
- `student/seeds` and `output/` are intentionally untouched.
""".format(
        run_id,
        ", ".join("benchmarks/{0}.truth".format(case) for case in cases),
    )
    (run_dir / "MANIFEST.md").write_text(text)


def main(argv=None):
    parser = argparse.ArgumentParser()
    parser.add_argument("--cases", type=parse_cases, default=parse_cases("ex286-ex289"))
    parser.add_argument("--run-id", required=True)
    parser.add_argument("--truth-dir", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--slot-caps", default="1,2,3,4,5,6,8")
    args = parser.parse_args(argv)

    slot_caps = [int(item) for item in args.slot_caps.split(",") if item.strip()]
    run_dir = ROOT / "student" / "runs" / "unknown" / args.run_id
    results_dir = run_dir / "results"
    results_dir.mkdir(parents=True, exist_ok=True)

    rows = []
    for case in args.cases:
        table = TruthTable(args.truth_dir / "{0}.truth".format(case))
        outputs = list(table.iter_outputs())
        width = table.input_width
        onehot = [one_position(outputs[1 << bit]) for bit in range(width)]
        rows.append(
            {
                "case": case,
                "metric": "onehot_map",
                "key": "input_to_output_slot",
                "value": ":".join(str(item) for item in onehot),
                "detail": "single-token output slot by input bit",
            }
        )
        rows.extend(insertion_rows(case, outputs, width, onehot))
        rows.extend(matching_rows(case, outputs, width, onehot, slot_caps))
        rows.extend(generalized_symmetry_rows(case, outputs, width))
        rows.extend(layer_rank_rows(case, outputs, width))
        rows.extend(block_scatter_rows(case, outputs, width, 4))
        rows.extend(prefix_count_rows(case, outputs, width))
        print("{0}: diagnostics complete".format(case), flush=True)

    with (results_dir / "conservative_bigjump_diagnostics.csv").open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=FIELDS)
        writer.writeheader()
        writer.writerows(rows)
    for name in ("candidates.csv", "best.csv", "summary.csv", "evaluate_check.csv"):
        (results_dir / name).write_text(EMPTY_CANDIDATE_HEADER)
    write_manifest(run_dir, args.run_id, args.cases)
    print("Results: {0}".format(results_dir / "conservative_bigjump_diagnostics.csv"))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
