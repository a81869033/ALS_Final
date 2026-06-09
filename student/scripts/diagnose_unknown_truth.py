#!/usr/bin/env python3
"""Diagnose ex280-ex299 truth tables before frontend seed generation."""

import argparse
import csv
import json
import math
import re
import sys
import time
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from student.frontends.truth import TruthTable
from student.generators.unknown_verilog_search import parse_cases


CASE_RE = re.compile(r"^ex([0-9]{3})$")

SUMMARY_FIELDS = [
    "case",
    "input_width",
    "output_width",
    "num_inputs",
    "unique_outputs",
    "constant_bits",
    "support_min",
    "support_max",
    "support_avg",
    "support_masks",
    "run_count_min",
    "run_count_max",
    "run_count_avg",
    "anf_degree_max",
    "anf_terms_total",
    "anf_terms_max_bit",
    "word_best_pattern",
    "word_best_matches",
    "word_best_fraction",
    "equiv_best_pattern",
    "equiv_best_matches",
    "equiv_best_fraction",
    "symmetry_best",
    "symmetry_best_matches",
    "symmetry_best_fraction",
    "split_best_variant",
    "split_best_exceptions",
    "split_best_fraction",
    "split_best_full_default_groups",
    "bdd_best_order",
    "bdd_best_nodes",
    "bdd_status",
    "current_frontend_adp",
    "current_frontend_ratio",
    "current_frontend_candidate",
    "current_project_best_adp",
    "current_project_ratio",
    "current_project_candidate",
    "reference_adp",
    "reference_area",
    "reference_delay",
    "hypothesis",
    "next_action",
]

BIT_FIELDS = [
    "case",
    "bit",
    "one_count",
    "one_fraction",
    "entropy",
    "run_count",
    "support_size",
    "support_bits",
    "anf_degree",
    "anf_terms",
    "constant",
]

COFACTOR_FIELDS = [
    "case",
    "input_bit",
    "word_change_pairs",
    "word_change_fraction",
    "changed_output_bits",
]

PATTERN_FIELDS = [
    "case",
    "kind",
    "pattern",
    "matches",
    "fraction",
]

SPLIT_FIELDS = [
    "case",
    "rank",
    "variant",
    "rotate",
    "outer",
    "outer_bits",
    "inner_bits",
    "exceptions",
    "exception_fraction",
    "full_default_groups",
]

HYPOTHESIS_FIELDS = [
    "case",
    "priority",
    "hypothesis",
    "evidence",
    "next_experiment",
    "excluded_or_deprioritized",
]

CANDIDATE_FIELDS = [
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


def rel_path(path):
    try:
        return str(Path(path).resolve().relative_to(ROOT))
    except ValueError:
        return str(path)


def write_csv(path, fieldnames, rows):
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(rows)


def read_csv_by_case(path):
    rows = {}
    if not path.is_file():
        return rows
    with path.open() as handle:
        for row in csv.DictReader(handle):
            case = row.get("case", "")
            if case:
                rows[case] = row
    return rows


def parse_int_cell(row, key):
    value = row.get(key, "")
    if value is None or value == "":
        return None
    try:
        return int(float(value))
    except ValueError:
        return None


def popcount(value):
    return bin(value).count("1")


def rotl(value, width, amount):
    amount %= width
    mask = (1 << width) - 1
    if amount == 0:
        return value & mask
    return ((value << amount) | (value >> (width - amount))) & mask


def rotr(value, width, amount):
    amount %= width
    mask = (1 << width) - 1
    if amount == 0:
        return value & mask
    return ((value >> amount) | (value << (width - amount))) & mask


def bit_reverse(value, width):
    out = 0
    for bit in range(width):
        if value & (1 << bit):
            out |= 1 << (width - 1 - bit)
    return out


def gray(value):
    return value ^ (value >> 1)


def ungray(value):
    out = 0
    while value:
        out ^= value
        value >>= 1
    return out


def swap_bits(value, bit_a, bit_b):
    a = (value >> bit_a) & 1
    b = (value >> bit_b) & 1
    if a == b:
        return value
    return value ^ (1 << bit_a) ^ (1 << bit_b)


def entropy_from_count(one_count, total):
    if one_count == 0 or one_count == total:
        return 0.0
    p = float(one_count) / float(total)
    return -p * math.log(p, 2.0) - (1.0 - p) * math.log(1.0 - p, 2.0)


def support_and_cofactor(outputs, input_width, output_width):
    bit_diff_counts = [[0 for _ in range(output_width)] for _ in range(input_width)]
    word_change_pairs = [0 for _ in range(input_width)]
    count = len(outputs)
    for input_bit in range(input_width):
        mask = 1 << input_bit
        for index in range(count):
            if index & mask:
                continue
            diff = outputs[index] ^ outputs[index | mask]
            if diff:
                word_change_pairs[input_bit] += 1
            while diff:
                low = diff & -diff
                bit = low.bit_length() - 1
                if bit < output_width:
                    bit_diff_counts[input_bit][bit] += 1
                diff ^= low
    supports = []
    for bit in range(output_width):
        supports.append([var for var in range(input_width) if bit_diff_counts[var][bit] > 0])
    return supports, word_change_pairs, bit_diff_counts


def run_counts(outputs, output_width):
    counts = []
    for bit in range(output_width):
        if not outputs:
            counts.append(0)
            continue
        prev = (outputs[0] >> bit) & 1
        runs = 1
        for value in outputs[1:]:
            current = (value >> bit) & 1
            if current != prev:
                runs += 1
                prev = current
        counts.append(runs)
    return counts


def anf_bit_stats(outputs, input_width, output_width):
    count = len(outputs)
    degrees = []
    term_counts = []
    popcounts = [popcount(mask) for mask in range(count)]
    for bit in range(output_width):
        coeffs = bytearray((value >> bit) & 1 for value in outputs)
        for var in range(input_width):
            step = 1 << var
            jump = step << 1
            for base in range(0, count, jump):
                end = base + step
                for offset in range(base, end):
                    coeffs[offset + step] ^= coeffs[offset]
        terms = [mask for mask, value in enumerate(coeffs) if value]
        term_counts.append(len(terms))
        degrees.append(max((popcounts[mask] for mask in terms), default=0))
    return degrees, term_counts


def word_patterns(outputs, width):
    mask = (1 << width) - 1
    funcs = [
        ("zero", lambda x: 0),
        ("ones", lambda x: mask),
        ("input", lambda x: x),
        ("not_input", lambda x: (~x) & mask),
        ("neg_input", lambda x: (-x) & mask),
        ("input_plus_one", lambda x: (x + 1) & mask),
        ("input_minus_one", lambda x: (x - 1) & mask),
        ("bit_reverse", lambda x: bit_reverse(x, width)),
        ("gray", lambda x: gray(x) & mask),
        ("ungray", lambda x: ungray(x) & mask),
    ]
    for amount in range(1, width):
        funcs.append(("rotl_{0}".format(amount), lambda x, amount=amount: rotl(x, width, amount)))
        funcs.append(("rotr_{0}".format(amount), lambda x, amount=amount: rotr(x, width, amount)))
    rows = []
    for name, func in funcs:
        matches = sum(1 for index, value in enumerate(outputs) if value == func(index))
        rows.append((matches, name))
    rows.sort(key=lambda item: (-item[0], item[1]))
    return rows


def equivariance_patterns(outputs, width):
    mask = (1 << width) - 1
    count = len(outputs)
    patterns = []
    for amount in range(1, width):
        matches = 0
        for index, value in enumerate(outputs):
            if outputs[rotl(index, width, amount)] == rotl(value, width, amount):
                matches += 1
        patterns.append((matches, "rotl_equiv_{0}".format(amount)))
    for amount in range(1, width):
        matches = 0
        for index, value in enumerate(outputs):
            if outputs[rotl(index, width, amount)] == value:
                matches += 1
        patterns.append((matches, "rotl_input_invariant_{0}".format(amount)))
    reverse_matches = sum(
        1
        for index, value in enumerate(outputs)
        if outputs[bit_reverse(index, width)] == bit_reverse(value, width)
    )
    patterns.append((reverse_matches, "bit_reverse_equiv"))
    comp_equiv = sum(
        1 for index, value in enumerate(outputs) if outputs[mask ^ index] == ((~value) & mask)
    )
    patterns.append((comp_equiv, "complement_equiv"))
    comp_inv = sum(1 for index, value in enumerate(outputs) if outputs[mask ^ index] == value)
    patterns.append((comp_inv, "complement_input_invariant"))
    patterns.sort(key=lambda item: (-item[0], item[1]))
    return patterns[: max(1, min(len(patterns), count))]


def symmetry_patterns(outputs, width):
    rows = []
    count = len(outputs)
    for bit_a in range(width):
        for bit_b in range(bit_a + 1, width):
            matches = sum(
                1
                for index, value in enumerate(outputs)
                if outputs[swap_bits(index, bit_a, bit_b)] == value
            )
            rows.append((matches, "swap_in_{0}_{1}".format(bit_a, bit_b)))
    rows.sort(key=lambda item: (-item[0], item[1]))
    if not rows:
        return [(count, "none")]
    return rows


def split_default_stats(outputs, width, outer_low, outer_bits, rotate_amount):
    outer_count = 1 << outer_bits
    inner_bits = width - outer_bits
    counts = [dict() for _ in range(outer_count)]
    for index, value in enumerate(outputs):
        key = rotl(index, width, rotate_amount)
        if outer_low:
            outer = key & (outer_count - 1)
        else:
            outer = key >> inner_bits
        bucket = counts[outer]
        bucket[value] = bucket.get(value, 0) + 1

    kept = 0
    full_defaults = 0
    group_size = 1 << inner_bits
    for bucket in counts:
        if not bucket:
            continue
        best = max(bucket.values())
        kept += best
        if best == group_size:
            full_defaults += 1
    exceptions = len(outputs) - kept
    return exceptions, full_defaults, inner_bits


def best_split_stats(outputs, width, top_n):
    rows = []
    for rotate_amount in range(width):
        for outer_low in (False, True):
            for outer_bits in range(1, width):
                exceptions, full_defaults, inner_bits = split_default_stats(
                    outputs,
                    width,
                    outer_low=outer_low,
                    outer_bits=outer_bits,
                    rotate_amount=rotate_amount,
                )
                variant = "rotate{0}_{1}{2}".format(
                    rotate_amount,
                    "low" if outer_low else "high",
                    outer_bits,
                )
                rows.append(
                    {
                        "variant": variant,
                        "rotate": rotate_amount,
                        "outer": "low" if outer_low else "high",
                        "outer_bits": outer_bits,
                        "inner_bits": inner_bits,
                        "exceptions": exceptions,
                        "exception_fraction": float(exceptions) / float(len(outputs)),
                        "full_default_groups": full_defaults,
                    }
                )
    rows.sort(
        key=lambda row: (
            row["exceptions"],
            -row["full_default_groups"],
            abs(row["outer_bits"] - row["inner_bits"]),
            row["rotate"],
            row["outer"],
        )
    )
    return rows[:top_n]


class BddLimit(Exception):
    pass


def invert_bytes(vec):
    return bytes(1 - item for item in vec)


def plane_for_outputs(outputs, bit):
    return bytes(((value >> bit) & 1) for value in outputs)


def permute_plane(plane, order):
    width = len(order)
    count = 1 << width
    result = bytearray(count)
    for ordered_index in range(count):
        original_index = 0
        for level, var in enumerate(order):
            if (ordered_index >> (width - 1 - level)) & 1:
                original_index |= 1 << var
        result[ordered_index] = plane[original_index]
    return bytes(result)


class LimitedSharedBddCounter(object):
    def __init__(self, order, max_nodes):
        self.order = list(order)
        self.max_nodes = max_nodes
        self.memo = {}
        self.nodes = 0

    def build(self, vec, level):
        zero_count = vec.count(0)
        if zero_count == len(vec) or zero_count == 0:
            return (0, zero_count == 0)

        inv = 0
        comp = invert_bytes(vec)
        if comp < vec:
            vec = comp
            inv = 1

        key = (level, vec)
        if key in self.memo:
            return (self.memo[key], inv)

        if self.nodes >= self.max_nodes:
            raise BddLimit("bdd node limit {0} reached".format(self.max_nodes))

        half = len(vec) // 2
        low = self.build(vec[:half], level + 1)
        high = self.build(vec[half:], level + 1)
        if low == high:
            return (low[0], low[1] ^ inv)

        self.nodes += 1
        node_id = self.nodes
        self.memo[key] = node_id
        return (node_id, inv)


def candidate_bdd_orders(width, split_rows):
    orders = [
        ("natural", list(range(width))),
        ("reverse", list(reversed(range(width)))),
        ("interleave", interleave_order(width)),
        ("center", center_order(width)),
    ]
    seen = set(name for name, _ in orders)
    for row in split_rows[:4]:
        amount = int(row["rotate"])
        name = "split_rot{0}".format(amount)
        if name not in seen:
            orders.append((name, [(bit + amount) % width for bit in range(width)]))
            seen.add(name)
    return orders


def interleave_order(width):
    order = []
    for index in range((width + 1) // 2):
        other = width - 1 - index
        order.append(index)
        if other != index:
            order.append(other)
    return order


def center_order(width):
    order = []
    left = (width - 1) // 2
    right = left + 1
    while left >= 0 or right < width:
        if left >= 0:
            order.append(left)
            left -= 1
        if right < width:
            order.append(right)
            right += 1
    return order


def bdd_counts(outputs, width, output_width, split_rows, max_nodes):
    rows = []
    for name, order in candidate_bdd_orders(width, split_rows):
        counter = LimitedSharedBddCounter(order, max_nodes=max_nodes)
        status = "ok"
        try:
            for bit in range(output_width):
                plane = plane_for_outputs(outputs, bit)
                counter.build(permute_plane(plane, order), 0)
        except BddLimit as error:
            status = str(error)
        rows.append((counter.nodes, name, status))
    rows.sort(key=lambda item: (item[0] if item[2] == "ok" else max_nodes + item[0], item[1]))
    return rows


def join_ints(values):
    return ":".join(str(value) for value in values)


def format_fraction(value):
    return "{0:.6f}".format(value)


def row_ratio(adp, reference_adp):
    if adp is None or reference_adp is None or reference_adp == 0:
        return ""
    return "{0:.6f}".format(float(adp) / float(reference_adp))


def build_hypotheses(case, summary, bit_rows, top_patterns, top_splits):
    hypotheses = []
    current_ratio = summary.get("current_frontend_ratio", "")
    try:
        ratio = float(current_ratio) if current_ratio != "" else None
    except ValueError:
        ratio = None

    low_support_bits = [row for row in bit_rows if int(row["support_size"]) <= 8]
    top_word = top_patterns["word"][0]
    top_equiv = top_patterns["equiv"][0]
    split_best = top_splits[0]
    excluded = "generic half split/rotation/value-case/tree already covered in previous runs"

    if low_support_bits:
        hypotheses.append(
            {
                "case": case,
                "priority": "1",
                "hypothesis": "selected-bit or support-limited LUT decomposition",
                "evidence": "{0}/{1} output bits have support <= 8".format(
                    len(low_support_bits),
                    len(bit_rows),
                ),
                "next_experiment": "emit exact selected-bit overrides for low-support bits and keep current structural base for the rest",
                "excluded_or_deprioritized": excluded,
            }
        )

    if float(top_equiv[3]) >= 0.90:
        hypotheses.append(
            {
                "case": case,
                "priority": "1",
                "hypothesis": "rotation/reversal equivariant classifier",
                "evidence": "{0} matches {1}/{2}".format(top_equiv[2], top_equiv[0], summary["num_inputs"]),
                "next_experiment": "write shared canonical class predicate plus rotated output reconstruction",
                "excluded_or_deprioritized": excluded,
            }
        )

    if float(top_word[3]) >= 0.25:
        hypotheses.append(
            {
                "case": case,
                "priority": "2",
                "hypothesis": "word-level default plus localized correction",
                "evidence": "{0} matches {1}/{2}".format(top_word[2], top_word[0], summary["num_inputs"]),
                "next_experiment": "try base word expression with compact correction cubes instead of full exceptions",
                "excluded_or_deprioritized": excluded,
            }
        )

    if float(split_best["exception_fraction"]) < 0.70:
        hypotheses.append(
            {
                "case": case,
                "priority": "2",
                "hypothesis": "non-half split/default structure",
                "evidence": "{0} exceptions={1} fraction={2}".format(
                    split_best["variant"],
                    split_best["exceptions"],
                    format_fraction(split_best["exception_fraction"]),
                ),
                "next_experiment": "generate arbitrary-width split/default RTL around this cut and compare against old half split",
                "excluded_or_deprioritized": "old generator only used half-width splits and fixed generic variants",
            }
        )

    if summary.get("bdd_status") == "ok":
        try:
            bdd_nodes = int(summary.get("bdd_best_nodes", "0"))
        except ValueError:
            bdd_nodes = 0
        if bdd_nodes and (ratio is None or bdd_nodes * 20 < int(summary.get("current_frontend_adp") or 0)):
            hypotheses.append(
                {
                    "case": case,
                    "priority": "2",
                    "hypothesis": "shared BDD order still worth source-level rewrite",
                    "evidence": "best limited BDD order {0} nodes={1}".format(
                        summary.get("bdd_best_order", ""),
                        bdd_nodes,
                    ),
                    "next_experiment": "emit BDD with local mux/source rewrite and Yosys abc -g aig synthflow",
                    "excluded_or_deprioritized": excluded,
                }
            )

    if not hypotheses:
        hypotheses.append(
            {
                "case": case,
                "priority": "3",
                "hypothesis": "unknown-hybrid structural search",
                "evidence": "no strong word/equivariance/support signal; current frontend ratio={0}".format(current_ratio),
                "next_experiment": "inspect bit-level supports and split rows manually, then try hand-written shared predecode or selected output-bit replacement",
                "excluded_or_deprioritized": excluded,
            }
        )

    return hypotheses


def diagnose_case(case, args, refs, project_best, frontend_best):
    truth_path = args.benchmarks / "{0}.truth".format(case)
    table = TruthTable(truth_path)
    outputs = list(table.iter_outputs())
    width = table.input_width
    output_width = table.output_width
    count = table.num_inputs

    supports, word_change_pairs, bit_diff_counts = support_and_cofactor(outputs, width, output_width)
    run_count_by_bit = run_counts(outputs, output_width)
    anf_degree_by_bit, anf_terms_by_bit = anf_bit_stats(outputs, width, output_width)
    bit_count_by_bit = table.bit_counts()

    bit_rows = []
    for bit in range(output_width):
        support = supports[bit]
        one_count = bit_count_by_bit[bit]
        bit_rows.append(
            {
                "case": case,
                "bit": bit,
                "one_count": one_count,
                "one_fraction": format_fraction(float(one_count) / float(count)),
                "entropy": "{0:.6f}".format(entropy_from_count(one_count, count)),
                "run_count": run_count_by_bit[bit],
                "support_size": len(support),
                "support_bits": join_ints(support),
                "anf_degree": anf_degree_by_bit[bit],
                "anf_terms": anf_terms_by_bit[bit],
                "constant": "1" if one_count == 0 or one_count == count else "0",
            }
        )

    cofactor_rows = []
    for input_bit in range(width):
        changed_bits = [bit for bit in range(output_width) if bit_diff_counts[input_bit][bit] > 0]
        cofactor_rows.append(
            {
                "case": case,
                "input_bit": input_bit,
                "word_change_pairs": word_change_pairs[input_bit],
                "word_change_fraction": format_fraction(float(word_change_pairs[input_bit]) / float(count // 2)),
                "changed_output_bits": join_ints(changed_bits),
            }
        )

    word = word_patterns(outputs, width)
    equiv = equivariance_patterns(outputs, width)
    sym = symmetry_patterns(outputs, width)
    pattern_rows = []
    for kind, rows in (("word", word[:10]), ("equivariance", equiv[:10]), ("symmetry", sym[:10])):
        for matches, name in rows:
            pattern_rows.append(
                {
                    "case": case,
                    "kind": kind,
                    "pattern": name,
                    "matches": matches,
                    "fraction": format_fraction(float(matches) / float(count)),
                }
            )

    split_rows_raw = best_split_stats(outputs, width, args.split_top)
    split_rows = []
    for rank, row in enumerate(split_rows_raw, 1):
        out = dict(row)
        out.update({"case": case, "rank": rank, "exception_fraction": format_fraction(row["exception_fraction"])})
        split_rows.append(out)

    bdds = bdd_counts(outputs, width, output_width, split_rows_raw, args.bdd_max_nodes)
    bdd_nodes, bdd_order, bdd_status = bdds[0]

    reference = refs.get(case, {})
    frontend = frontend_best.get(case, {})
    project = project_best.get(case, {})
    reference_adp = parse_int_cell(reference, "adp")
    frontend_adp = parse_int_cell(frontend, "adp")
    project_adp = parse_int_cell(project, "best_adp")

    support_sizes = [len(item) for item in supports]
    constants = ["out[{0}]={1}".format(bit, 1 if bit_count_by_bit[bit] == count else 0) for bit in range(output_width) if bit_count_by_bit[bit] == 0 or bit_count_by_bit[bit] == count]
    summary = {
        "case": case,
        "input_width": width,
        "output_width": output_width,
        "num_inputs": count,
        "unique_outputs": len(set(outputs)),
        "constant_bits": ";".join(constants),
        "support_min": min(support_sizes) if support_sizes else 0,
        "support_max": max(support_sizes) if support_sizes else 0,
        "support_avg": "{0:.3f}".format(float(sum(support_sizes)) / float(len(support_sizes) or 1)),
        "support_masks": ";".join(join_ints(support) for support in supports),
        "run_count_min": min(run_count_by_bit) if run_count_by_bit else 0,
        "run_count_max": max(run_count_by_bit) if run_count_by_bit else 0,
        "run_count_avg": "{0:.3f}".format(float(sum(run_count_by_bit)) / float(len(run_count_by_bit) or 1)),
        "anf_degree_max": max(anf_degree_by_bit) if anf_degree_by_bit else 0,
        "anf_terms_total": sum(anf_terms_by_bit),
        "anf_terms_max_bit": max(anf_terms_by_bit) if anf_terms_by_bit else 0,
        "word_best_pattern": word[0][1],
        "word_best_matches": word[0][0],
        "word_best_fraction": format_fraction(float(word[0][0]) / float(count)),
        "equiv_best_pattern": equiv[0][1],
        "equiv_best_matches": equiv[0][0],
        "equiv_best_fraction": format_fraction(float(equiv[0][0]) / float(count)),
        "symmetry_best": sym[0][1],
        "symmetry_best_matches": sym[0][0],
        "symmetry_best_fraction": format_fraction(float(sym[0][0]) / float(count)),
        "split_best_variant": split_rows_raw[0]["variant"],
        "split_best_exceptions": split_rows_raw[0]["exceptions"],
        "split_best_fraction": format_fraction(split_rows_raw[0]["exception_fraction"]),
        "split_best_full_default_groups": split_rows_raw[0]["full_default_groups"],
        "bdd_best_order": bdd_order,
        "bdd_best_nodes": bdd_nodes,
        "bdd_status": bdd_status,
        "current_frontend_adp": "" if frontend_adp is None else frontend_adp,
        "current_frontend_ratio": row_ratio(frontend_adp, reference_adp),
        "current_frontend_candidate": frontend.get("candidate_id", ""),
        "current_project_best_adp": "" if project_adp is None else project_adp,
        "current_project_ratio": row_ratio(project_adp, reference_adp),
        "current_project_candidate": project.get("candidate_id", ""),
        "reference_adp": "" if reference_adp is None else reference_adp,
        "reference_area": reference.get("area", ""),
        "reference_delay": reference.get("delay", ""),
        "hypothesis": "",
        "next_action": "",
    }

    top_patterns = {
        "word": [(word[0][0], "word", word[0][1], format_fraction(float(word[0][0]) / float(count)))],
        "equiv": [(equiv[0][0], "equivariance", equiv[0][1], format_fraction(float(equiv[0][0]) / float(count)))],
    }
    hypotheses = build_hypotheses(case, summary, bit_rows, top_patterns, split_rows_raw)
    summary["hypothesis"] = hypotheses[0]["hypothesis"]
    summary["next_action"] = hypotheses[0]["next_experiment"]
    return summary, bit_rows, cofactor_rows, pattern_rows, split_rows, hypotheses


def manifest_text(args, elapsed_sec, case_count):
    return "\n".join(
        [
            "# {0}".format(args.run_id),
            "",
            "Run ID: `{0}`".format(args.run_id),
            "",
            "Purpose: metadata/truth diagnostics for ex280-ex299 unknown frontend reverse engineering.",
            "",
            "Inputs:",
            "- Truth files: `benchmarks/ex280.truth` through `benchmarks/ex299.truth`",
            "- Reference ADP: `{0}`".format(rel_path(args.reference)),
            "- Current project best: `{0}`".format(rel_path(args.current_best)),
            "- Current unknown frontend best: `{0}`".format(rel_path(args.frontend_best)),
            "- Script: `student/scripts/diagnose_unknown_truth.py`",
            "",
            "Artifacts:",
            "- Work directory: `{0}`".format(rel_path(args.work_dir)),
            "- Results directory: `{0}`".format(rel_path(args.results_dir)),
            "- Summary CSV: `{0}`".format(rel_path(args.results_dir / "summary.csv")),
            "- Bit stats CSV: `{0}`".format(rel_path(args.results_dir / "bit_stats.csv")),
            "- Cofactor CSV: `{0}`".format(rel_path(args.results_dir / "cofactor_stats.csv")),
            "- Pattern CSV: `{0}`".format(rel_path(args.results_dir / "pattern_stats.csv")),
            "- Split CSV: `{0}`".format(rel_path(args.results_dir / "split_stats.csv")),
            "- Hypotheses CSV: `{0}`".format(rel_path(args.results_dir / "hypotheses.csv")),
            "",
            "Methods tried:",
            "- Width, support, constant-bit, entropy, run-count, ANF-degree diagnostics.",
            "- Input cofactor sensitivity and selected symmetry/equivariance checks.",
            "- Arbitrary contiguous split/default statistics across rotations.",
            "- Limited shared BDD node counts for diagnostic ordering only.",
            "",
            "Best result:",
            "- No new Verilog/AIG seeds in this diagnostic-only run.",
            "",
            "Notes:",
            "- `candidates.csv`, `best.csv`, and `evaluate_check.csv` are intentionally header-only placeholders.",
            "- Runtime: {0:.1f}s over {1} cases.".format(elapsed_sec, case_count),
            "- No files were written to `output/`.",
            "",
        ]
    )


def parse_args(argv=None):
    parser = argparse.ArgumentParser(description="Diagnose unknown ex280-ex299 truth tables.")
    parser.add_argument("--cases", type=parse_cases, default=parse_cases("ex280-ex299"))
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--reference", type=Path, default=ROOT / "reference_result.csv")
    parser.add_argument("--current-best", type=Path, default=ROOT / "student/results/current_best_by_case.csv")
    parser.add_argument("--frontend-best", type=Path, default=ROOT / "student/results/unknown_candidates_current_best.csv")
    parser.add_argument("--run-id", required=True)
    parser.add_argument("--work-dir", type=Path)
    parser.add_argument("--results-dir", type=Path)
    parser.add_argument("--split-top", type=int, default=12)
    parser.add_argument("--bdd-max-nodes", type=int, default=120000)
    return parser.parse_args(argv)


def main(argv=None):
    args = parse_args(argv)
    if args.work_dir is None:
        args.work_dir = ROOT / "student" / "work" / args.run_id
    if args.results_dir is None:
        args.results_dir = ROOT / "student" / "runs" / "unknown" / args.run_id / "results"

    refs = read_csv_by_case(args.reference)
    project_best = read_csv_by_case(args.current_best)
    frontend_best = read_csv_by_case(args.frontend_best)

    start = time.time()
    summaries = []
    bit_rows = []
    cofactor_rows = []
    pattern_rows = []
    split_rows = []
    hypotheses = []

    args.work_dir.mkdir(parents=True, exist_ok=True)
    args.results_dir.mkdir(parents=True, exist_ok=True)

    for case in args.cases:
        print("{0}: diagnose".format(case), flush=True)
        summary, bits, cofactors, patterns, splits, case_hypotheses = diagnose_case(
            case,
            args,
            refs,
            project_best,
            frontend_best,
        )
        summaries.append(summary)
        bit_rows.extend(bits)
        cofactor_rows.extend(cofactors)
        pattern_rows.extend(patterns)
        split_rows.extend(splits)
        hypotheses.extend(case_hypotheses)

    write_csv(args.results_dir / "summary.csv", SUMMARY_FIELDS, summaries)
    write_csv(args.results_dir / "bit_stats.csv", BIT_FIELDS, bit_rows)
    write_csv(args.results_dir / "cofactor_stats.csv", COFACTOR_FIELDS, cofactor_rows)
    write_csv(args.results_dir / "pattern_stats.csv", PATTERN_FIELDS, pattern_rows)
    write_csv(args.results_dir / "split_stats.csv", SPLIT_FIELDS, split_rows)
    write_csv(args.results_dir / "hypotheses.csv", HYPOTHESIS_FIELDS, hypotheses)
    write_csv(args.results_dir / "candidates.csv", CANDIDATE_FIELDS, [])
    write_csv(args.results_dir / "best.csv", CANDIDATE_FIELDS, [])
    write_csv(args.results_dir / "evaluate_check.csv", CANDIDATE_FIELDS + ["evaluate_py_ok", "evaluate_py_adp"], [])

    manifest = {
        "run_id": args.run_id,
        "cases": args.cases,
        "work_dir": rel_path(args.work_dir),
        "results_dir": rel_path(args.results_dir),
        "elapsed_sec": time.time() - start,
        "artifacts": [
            "summary.csv",
            "bit_stats.csv",
            "cofactor_stats.csv",
            "pattern_stats.csv",
            "split_stats.csv",
            "hypotheses.csv",
            "candidates.csv",
            "best.csv",
            "evaluate_check.csv",
        ],
    }
    with (args.work_dir / "manifest.json").open("w") as handle:
        json.dump(manifest, handle, indent=2, sort_keys=True)
        handle.write("\n")

    elapsed = time.time() - start
    run_dir = args.results_dir.parent
    run_dir.mkdir(parents=True, exist_ok=True)
    with (run_dir / "MANIFEST.md").open("w") as handle:
        handle.write(manifest_text(args, elapsed, len(args.cases)))

    print("Summary: {0}".format(args.results_dir / "summary.csv"))
    print("Hypotheses: {0}".format(args.results_dir / "hypotheses.csv"))
    print("Manifest: {0}".format(run_dir / "MANIFEST.md"))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
