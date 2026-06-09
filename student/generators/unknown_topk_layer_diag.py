#!/usr/bin/env python3
"""Top-k and layer/block diagnostics for conservative unknown cases."""

import argparse
import csv
import itertools
import os
import sys

ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", ".."))
if ROOT not in sys.path:
    sys.path.insert(0, ROOT)

from student.frontends.truth import TruthTable


def popcount(value):
    return bin(value).count("1")


def bitrev_index(index, width):
    out = 0
    for bit in range(width):
        if (index >> bit) & 1:
            out |= 1 << (width - 1 - bit)
    return out


def transform_mask(mask, width, mode):
    if mode == "identity":
        return mask
    out = 0
    for bit in range(width):
        if not ((mask >> bit) & 1):
            continue
        if mode == "reverse":
            dst = width - 1 - bit
        elif mode == "bit_reverse":
            dst = bitrev_index(bit, (width - 1).bit_length()) % width
        elif mode == "rot1":
            dst = (bit + 1) % width
        elif mode == "rotr1":
            dst = (bit - 1) % width
        else:
            raise ValueError(mode)
        out |= 1 << dst
    return out


def topk_mask(scores, k):
    if k <= 0:
        return 0
    ranked = sorted(range(len(scores)), key=lambda bit: (scores[bit], -bit), reverse=True)
    out = 0
    for bit in ranked[:k]:
        out |= 1 << bit
    return out


def eval_topk(outputs, width, score_fn, indices=None):
    if indices is None:
        indices = range(len(outputs))
        rows = len(outputs)
    else:
        rows = len(indices)
    exact = 0
    bit_matches = 0
    first = ""
    for x in indices:
        expected = outputs[x]
        k = popcount(x)
        got = topk_mask(score_fn(x), k)
        if got == expected:
            exact += 1
        elif not first:
            first = "x=0x{0:x};expected=0x{1:x};got=0x{2:x}".format(x, expected, got)
        bit_matches += width - popcount(got ^ expected)
    return exact, bit_matches, rows * width, first


def sample_indices(width):
    total = 1 << width
    selected = set()
    for weight_limit in range(0, min(2, width) + 1):
        for bits in itertools.combinations(range(width), weight_limit):
            value = 0
            for bit in bits:
                value |= 1 << bit
            selected.add(value)
    step = max(1, total // 512)
    for value in range(0, total, step):
        selected.add(value)
    selected.add(total - 1)
    return sorted(selected)


def singleton_map(outputs, width):
    mapping = []
    for bit in range(width):
        out = outputs[1 << bit]
        if out and (out & (out - 1)) == 0:
            mapping.append(out.bit_length() - 1)
        else:
            mapping.append(-1)
    return mapping


def make_score_family(width, transform, family, params, onehot):
    bias_mode = params.get("bias", "asc")
    scale = params.get("scale", 64)
    radius = params.get("radius", 0)
    a = params.get("a", 1)
    b = params.get("b", 0)

    def bias(bit):
        if bias_mode == "asc":
            return bit
        if bias_mode == "desc":
            return width - 1 - bit
        if bias_mode == "center":
            return -abs(2 * bit - (width - 1))
        if bias_mode == "edge":
            return abs(2 * bit - (width - 1))
        return 0

    def score(x):
        m = transform_mask(x, width, transform)
        scores = []
        for out_bit in range(width):
            value = bias(out_bit)
            if family == "local_window":
                total = 0
                for delta in range(-radius, radius + 1):
                    src = out_bit + delta
                    if 0 <= src < width and ((m >> src) & 1):
                        total += 1
                value += scale * total
            elif family == "cyclic_window":
                total = 0
                for delta in range(-radius, radius + 1):
                    src = (out_bit + delta) % width
                    if (m >> src) & 1:
                        total += 1
                value += scale * total
            elif family == "triangular":
                total = 0
                for delta in range(-radius, radius + 1):
                    src = out_bit + delta
                    if 0 <= src < width and ((m >> src) & 1):
                        total += radius + 1 - abs(delta)
                value += scale * total
            elif family == "prefix_suffix":
                pref = popcount(m & ((1 << (out_bit + 1)) - 1))
                suff = popcount(m >> out_bit)
                value += scale * (a * pref + b * suff)
            elif family == "singleton_vote":
                total = 0
                for in_bit, slot in enumerate(onehot):
                    if slot == out_bit and ((m >> in_bit) & 1):
                        total += 1
                value += scale * total
            elif family == "singleton_distance":
                total = 0
                for in_bit, slot in enumerate(onehot):
                    if not ((m >> in_bit) & 1):
                        continue
                    d = abs(out_bit - slot)
                    total -= min(d, width - d)
                value += scale * total
            else:
                raise ValueError(family)
            scores.append(value)
        return scores

    return score


def score_family_rows(case, outputs, width):
    sampled = []
    full = []
    onehot = singleton_map(outputs, width)
    indices = sample_indices(width)
    transforms = ["identity", "reverse"]
    biases = ["asc", "desc", "center", "edge", "none"]
    for transform in transforms:
        for bias in biases:
            for family in ["local_window", "cyclic_window", "triangular"]:
                for radius in range(0, min(6, width - 1) + 1):
                    if family == "triangular" and radius == 0:
                        continue
                    params = {"radius": radius, "bias": bias}
                    fn = make_score_family(width, transform, family, params, onehot)
                    exact, bits, total_bits, first = eval_topk(outputs, width, fn, indices)
                    sampled.append((exact, bits, case, family, transform, params, total_bits, first))
            for a in range(-3, 4):
                for b in range(-3, 4):
                    if a == 0 and b == 0:
                        continue
                    params = {"a": a, "b": b, "bias": bias}
                    fn = make_score_family(width, transform, "prefix_suffix", params, onehot)
                    exact, bits, total_bits, first = eval_topk(outputs, width, fn, indices)
                    sampled.append((exact, bits, case, "prefix_suffix", transform, params, total_bits, first))
            for family in ["singleton_vote", "singleton_distance"]:
                params = {"bias": bias}
                fn = make_score_family(width, transform, family, params, onehot)
                exact, bits, total_bits, first = eval_topk(outputs, width, fn, indices)
                sampled.append((exact, bits, case, family, transform, params, total_bits, first))
    sampled.sort(key=lambda row: (row[0], row[1]), reverse=True)
    for _, _, _, family, transform, params, _, _ in sampled[:15]:
        fn = make_score_family(width, transform, family, params, onehot)
        exact, bits, total_bits, first = eval_topk(outputs, width, fn)
        full.append((exact, bits, case, family, transform, params, total_bits, first))
    full.sort(key=lambda row: (row[0], row[1]), reverse=True)
    return full


def tiny_score_family_rows(case, outputs, width, sample_only=False):
    rows = []
    onehot = singleton_map(outputs, width)
    candidates = []
    for bias in ["asc", "desc", "none", "center", "edge"]:
        for family in ["singleton_vote", "singleton_distance"]:
            candidates.append((family, "identity", {"bias": bias}))
    for bias in ["asc", "desc", "none"]:
        for a, b in [(1, 0), (0, 1), (1, 1), (2, 1), (1, 2), (3, 2), (2, 3)]:
            candidates.append(("prefix_suffix", "identity", {"a": a, "b": b, "bias": bias}))
            candidates.append(("prefix_suffix", "reverse", {"a": a, "b": b, "bias": bias}))
        for family in ["local_window", "cyclic_window"]:
            for radius in [1, 2, 3]:
                candidates.append((family, "identity", {"radius": radius, "bias": bias}))
                candidates.append((family, "reverse", {"radius": radius, "bias": bias}))
    for family, transform, params in candidates:
        fn = make_score_family(width, transform, family, params, onehot)
        indices = sample_indices(width) if sample_only else None
        exact, bits, total_bits, first = eval_topk(outputs, width, fn, indices)
        rows.append((exact, bits, case, family, transform, params, total_bits, first))
    rows.sort(key=lambda row: (row[0], row[1]), reverse=True)
    return rows


def compositions(total, parts, min_size=1):
    if parts == 1:
        if total >= min_size:
            yield (total,)
        return
    for head in range(min_size, total - min_size * (parts - 1) + 1):
        for tail in compositions(total - head, parts - 1, min_size):
            yield (head,) + tail


def ranges_from_sizes(sizes):
    ranges = []
    start = 0
    for size in sizes:
        ranges.append((start, start + size))
        start += size
    return ranges


def block_counts(mask, ranges):
    return tuple(popcount((mask >> start) & ((1 << (end - start)) - 1)) for start, end in ranges)


def block_diag_rows(case, outputs, width):
    rows = []
    size_sets = set()
    for parts in range(2, min(4, width) + 1):
        for sizes in compositions(width, parts):
            size_sets.add(sizes)
    for parts in range(4, min(6, width) + 1):
        base = width // parts
        rem = width % parts
        balanced = tuple(base + (1 if i < rem else 0) for i in range(parts))
        size_sets.add(balanced)
        size_sets.add(tuple(reversed(balanced)))

    for sizes in sorted(size_sets, key=lambda item: (len(item), item)):
        ranges = ranges_from_sizes(sizes)
        out_by_in_counts = {}
        output_conflicts = 0
        count_by_in_counts = {}
        count_conflicts = 0
        total = len(outputs)
        for x, y in enumerate(outputs):
            key = block_counts(x, ranges)
            y_counts = block_counts(y, ranges)
            old = count_by_in_counts.setdefault(key, y_counts)
            if old != y_counts:
                count_conflicts += 1
            old_out = out_by_in_counts.setdefault(key, y)
            if old_out != y:
                output_conflicts += 1
        rows.append(
            (
                count_conflicts,
                output_conflicts,
                len(count_by_in_counts),
                case,
                "block_counts",
                ":".join(str(s) for s in sizes),
                total,
            )
        )
    rows.sort(key=lambda row: (row[0], row[1], row[2]))
    return rows


def layer_image_rows(case, outputs, width):
    rows = []
    for weight in range(width + 1):
        total = 0
        unique_outputs = set()
        fixed_by_layer = [None] * width
        varying = [0] * width
        for x, y in enumerate(outputs):
            if popcount(x) != weight:
                continue
            total += 1
            unique_outputs.add(y)
            for bit in range(width):
                val = (y >> bit) & 1
                if fixed_by_layer[bit] is None:
                    fixed_by_layer[bit] = val
                elif fixed_by_layer[bit] != val:
                    varying[bit] = 1
        fixed = []
        for bit, var in enumerate(varying):
            if not var and fixed_by_layer[bit] is not None:
                fixed.append("{0}={1}".format(bit, fixed_by_layer[bit]))
        rows.append((case, "layer_image", "w{0}".format(weight), len(unique_outputs), "rows={0};fixed={1}".format(total, ",".join(fixed))))
    return rows


def load_outputs(case):
    table = TruthTable(os.path.join(ROOT, "benchmarks", "{0}.truth".format(case)))
    return list(table.iter_outputs()), table.input_width, table.output_width


def main(argv):
    parser = argparse.ArgumentParser()
    parser.add_argument("--cases", nargs="+", default=["ex286", "ex287", "ex288", "ex289"])
    parser.add_argument("--run-id", required=True)
    parser.add_argument("--skip-blocks", action="store_true")
    parser.add_argument("--tiny", action="store_true")
    parser.add_argument("--sample-only", action="store_true")
    args = parser.parse_args(argv)

    run_dir = os.path.join(ROOT, "student", "runs", "unknown", args.run_id)
    results_dir = os.path.join(run_dir, "results")
    os.makedirs(results_dir, exist_ok=True)
    out_csv = os.path.join(results_dir, "topk_layer_diagnostics.csv")

    with open(out_csv, "w", newline="") as handle:
        writer = csv.writer(handle)
        writer.writerow(["case", "metric", "key", "value", "detail"])
        for case in args.cases:
            outputs, in_width, out_width = load_outputs(case)
            if in_width != out_width:
                writer.writerow([case, "skip", "width", "", "input/output width mismatch"])
                continue
            score_rows = tiny_score_family_rows(case, outputs, in_width, args.sample_only) if args.tiny else score_family_rows(case, outputs, in_width)
            for exact, bits, _, family, transform, params, total_bits, first in score_rows[:25]:
                key = "{0}:{1}:{2}".format(family, transform, ",".join("{0}={1}".format(k, params[k]) for k in sorted(params)))
                detail = "bit_matches={0}/{1};first={2}".format(bits, total_bits, first)
                row_total = total_bits // in_width
                writer.writerow([case, "topk_score_family", key, "{0}/{1}".format(exact, row_total), detail])
            if not args.skip_blocks:
                for count_conflicts, output_conflicts, keys, _, metric, sizes, total in block_diag_rows(case, outputs, in_width)[:25]:
                    detail = "output_conflicts={0};keys={1};rows={2}".format(output_conflicts, keys, total)
                    writer.writerow([case, metric, sizes, count_conflicts, detail])
            for row in layer_image_rows(case, outputs, in_width):
                writer.writerow(row)

    for name in ["candidates.csv", "best.csv", "summary.csv", "evaluate_check.csv"]:
        path = os.path.join(results_dir, name)
        with open(path, "w", newline="") as handle:
            if name == "summary.csv":
                handle.write("case,candidate_id,hypothesis,variant,verilog_path,aig_path,verified_truth,equivalent,area,delay,adp,notes\n")
            elif name == "evaluate_check.csv":
                handle.write("case,candidate_id,equivalent,area,delay,adp,notes\n")
            else:
                handle.write("case,candidate_id,hypothesis,variant,verilog_path,aig_path,area,delay,adp,items,notes\n")

    manifest = os.path.join(run_dir, "MANIFEST.md")
    with open(manifest, "w") as handle:
        handle.write("# {0}\n\n".format(args.run_id))
        handle.write("Diagnostic-only top-k score and layer/block probe for ex286-ex289.\n\n")
        handle.write("Artifacts:\n")
        handle.write("- `results/topk_layer_diagnostics.csv`\n\n")
        handle.write("No Verilog/AIG candidates generated. `student/seeds` and `output/` are intentionally untouched.\n")


if __name__ == "__main__":
    main(sys.argv[1:])
