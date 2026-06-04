#!/usr/bin/env python3
"""Generate exact bit-level algebraic Verilog seeds for ex280-ex299.

This complements the structural split/table generator.  The main target is
functions whose truth table has low algebraic degree, where an XOR-of-products
representation can give Yosys/ABC a much better starting point than nested
case statements.
"""

import argparse
import csv
import hashlib
import json
import re
import subprocess
import sys
import time
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from student.backends.abc_flow import evaluate_aig
from student.frontends.truth import TruthTable
from student.frontends.yosys_synth import SynthError, synthesize_verilog
from student.generators.unknown_verilog_search import (
    ALL_FIELDNAMES,
    BEST_FIELDNAMES,
    const_word,
    load_dedupe,
    parse_cases,
    range_decl,
    text_hash,
    write_csv,
    write_text,
)


CASE_RE = re.compile(r"^ex([0-9]{3})$")

VARIANTS = [
    "anf_shared_identity",
    "anf_shared_bit_reverse",
    "anf_shared_gray",
    "anf_shared_ungray",
    "anf_shared_best_transform",
    "anf_davio_identity",
    "anf_davio_interleave",
    "anf_davio_center",
    "anf_davio_best_order",
    "anf_davio_best_transform",
    "anf_davio_best_transform_order",
    "support_lut12_anf",
]


def parse_variant_list(value):
    valid = set(VARIANTS)
    variants = []
    seen = set()
    for item in value.split(","):
        item = item.strip()
        if not item:
            continue
        if item not in valid:
            raise argparse.ArgumentTypeError("unknown variant: {0}".format(item))
        if item not in seen:
            variants.append(item)
            seen.add(item)
    if not variants:
        raise argparse.ArgumentTypeError("empty variant list")
    return variants


def popcount(value):
    return bin(value).count("1")


def bit_reverse(value, width):
    out = 0
    for bit in range(width):
        if value & (1 << bit):
            out |= 1 << (width - 1 - bit)
    return out


def rotl(value, width, amount):
    amount %= width
    mask = (1 << width) - 1
    if amount == 0:
        return value & mask
    return ((value << amount) | (value >> (width - amount))) & mask


def gray(value):
    return value ^ (value >> 1)


def ungray(value):
    out = 0
    while value:
        out ^= value
        value >>= 1
    return out


def bit_reverse_expr(width, source):
    return "{" + ", ".join("{0}[{1}]".format(source, bit) for bit in range(width)) + "}"


def rotl_expr(width, amount, source):
    amount %= width
    if amount == 0:
        return source
    return "{{{0}[{1}:0], {0}[{2}:{3}]}}".format(
        source,
        width - amount - 1,
        width - 1,
        width - amount,
    )


def transform_index(name, value, width):
    if name == "identity":
        return value
    if name == "bit_reverse":
        return bit_reverse(value, width)
    if name == "gray":
        return gray(value)
    if name == "ungray":
        return ungray(value)
    if name.startswith("rotl"):
        return rotl(value, width, int(name[4:]))
    raise RuntimeError("unknown transform: {0}".format(name))


def candidate_transforms(width):
    transforms = ["identity", "bit_reverse", "gray", "ungray"]
    transforms.extend("rotl{0}".format(amount) for amount in range(1, width))
    return transforms


def key_lines_for_transform(transform, width):
    if transform == "identity":
        return ["  wire {0}key = in;".format(range_decl(width))]
    if transform == "bit_reverse":
        return ["  wire {0}key = {1};".format(range_decl(width), bit_reverse_expr(width, "in"))]
    if transform == "gray":
        return ["  wire {0}key = in ^ (in >> 1);".format(range_decl(width))]
    if transform == "ungray":
        lines = ["  wire {0}key;".format(range_decl(width))]
        for bit in range(width):
            terms = ["in[{0}]".format(index) for index in range(width - 1, bit - 1, -1)]
            lines.append("  assign key[{0}] = {1};".format(bit, " ^ ".join(terms)))
        return lines
    if transform.startswith("rotl"):
        amount = int(transform[4:])
        return ["  wire {0}key = {1};".format(range_decl(width), rotl_expr(width, amount, "in"))]
    raise RuntimeError("unknown transform: {0}".format(transform))


def transformed_outputs(outputs, width, transform):
    values = [0] * len(outputs)
    seen = [False] * len(outputs)
    for index, value in enumerate(outputs):
        key = transform_index(transform, index, width)
        if seen[key]:
            raise RuntimeError("non-bijective transform {0}".format(transform))
        seen[key] = True
        values[key] = value
    return values


def anf_terms_for_bit(outputs, width, bit):
    coeffs = [(value >> bit) & 1 for value in outputs]
    count = 1 << width
    for var in range(width):
        step = 1 << var
        for mask in range(count):
            if mask & step:
                coeffs[mask] ^= coeffs[mask ^ step]
    return [mask for mask, value in enumerate(coeffs) if value]


def anf_by_bit(outputs, width, output_width):
    return [anf_terms_for_bit(outputs, width, bit) for bit in range(output_width)]


def anf_stats(terms_by_bit):
    unique = set()
    total = 0
    max_degree = 0
    max_bit_terms = 0
    for terms in terms_by_bit:
        total += len(terms)
        if len(terms) > max_bit_terms:
            max_bit_terms = len(terms)
        for mask in terms:
            unique.add(mask)
            degree = popcount(mask)
            if degree > max_degree:
                max_degree = degree
    return {
        "total_terms": total,
        "unique_terms": len(unique),
        "max_degree": max_degree,
        "max_bit_terms": max_bit_terms,
    }


def choose_best_transform(outputs, width, output_width):
    best = None
    best_terms = None
    for transform in candidate_transforms(width):
        values = transformed_outputs(outputs, width, transform)
        terms_by_bit = anf_by_bit(values, width, output_width)
        stats = anf_stats(terms_by_bit)
        score = (
            stats["unique_terms"],
            stats["total_terms"],
            stats["max_degree"],
            stats["max_bit_terms"],
            transform,
        )
        if best is None or score < best[0]:
            best = (score, transform, stats)
            best_terms = terms_by_bit
    return best[1], best_terms, best[2]


def interleave_order(width):
    order = []
    for index in range((width + 1) // 2):
        order.append(index)
        other = width - 1 - index
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


def candidate_orders(width):
    orders = [
        ("lsb", list(range(width))),
        ("msb", list(reversed(range(width)))),
        ("interleave", interleave_order(width)),
        ("center", center_order(width)),
    ]
    for amount in range(width):
        orders.append(("rot{0}".format(amount), [(bit + amount) % width for bit in range(width)]))
    return orders


def estimate_davio_nodes(terms_by_bit, order):
    memo = {}
    nodes = set()

    def emit(terms):
        terms = frozenset(terms)
        if not terms or terms == frozenset([0]):
            return ("T", tuple(sorted(terms)))
        if terms in memo:
            return memo[terms]

        bit = None
        for candidate in order:
            bit_mask = 1 << candidate
            if any(mask & bit_mask for mask in terms):
                bit = candidate
                break
        if bit is None:
            result = ("T", tuple(sorted(terms)))
            memo[terms] = result
            return result

        bit_mask = 1 << bit
        p0 = set()
        p1 = set()
        for mask in terms:
            if mask & bit_mask:
                p1.add(mask ^ bit_mask)
            else:
                p0.add(mask)
        low = emit(p0)
        high = emit(p1)
        if high == ("T", ()):
            result = low
        else:
            result = ("N", bit, low, high)
            nodes.add(result)
        memo[terms] = result
        return result

    for terms in terms_by_bit:
        emit(terms)
    return len(nodes)


def choose_best_order(terms_by_bit, width):
    best = None
    for name, order in candidate_orders(width):
        nodes = estimate_davio_nodes(terms_by_bit, order)
        score = (nodes, name)
        if best is None or score < best[0]:
            best = (score, name, order)
    return best[1], best[2], best[0][0]


def choose_best_transform_order(outputs, width, output_width):
    best = None
    best_terms = None
    for transform in candidate_transforms(width):
        values = transformed_outputs(outputs, width, transform)
        terms_by_bit = anf_by_bit(values, width, output_width)
        stats = anf_stats(terms_by_bit)
        order_name, order, nodes = choose_best_order(terms_by_bit, width)
        score = (
            nodes,
            stats["unique_terms"],
            stats["total_terms"],
            transform,
            order_name,
        )
        if best is None or score < best[0]:
            best = (score, transform, order_name, order, stats, nodes)
            best_terms = terms_by_bit
    return best[1], best_terms, best[4], best[2], best[3], best[5]


def signal_for_mask(mask, width):
    if mask == 0:
        return "1'b1"
    if mask & (mask - 1) == 0:
        return "key[{0}]".format(mask.bit_length() - 1)
    return "m_{0:0{1}x}".format(mask, max(1, (width + 3) // 4))


def product_closure(masks):
    closed = set(masks)
    pending = list(masks)
    while pending:
        mask = pending.pop()
        if popcount(mask) < 2:
            continue
        high_bit = mask.bit_length() - 1
        parent = mask ^ (1 << high_bit)
        if parent not in closed:
            closed.add(parent)
            pending.append(parent)
    return closed


def render_product_helpers(lines, masks, width):
    masks = product_closure(masks)
    helper_masks = sorted(
        [mask for mask in masks if popcount(mask) >= 2],
        key=lambda mask: (popcount(mask), mask),
    )
    for mask in helper_masks:
        high_bit = mask.bit_length() - 1
        parent = mask ^ (1 << high_bit)
        lines.append(
            "  wire {0} = {1} & key[{2}];".format(
                signal_for_mask(mask, width),
                signal_for_mask(parent, width),
                high_bit,
            )
        )


def xor_tree_signal(lines, terms, width, prefix):
    if not terms:
        return "1'b0"
    signals = [signal_for_mask(mask, width) for mask in terms]
    if len(signals) == 1:
        return signals[0]
    level = 0
    while len(signals) > 1:
        next_signals = []
        for index in range(0, len(signals), 2):
            if index + 1 >= len(signals):
                next_signals.append(signals[index])
                continue
            name = "{0}_l{1}_{2}".format(prefix, level, index // 2)
            lines.append("  wire {0} = {1} ^ {2};".format(name, signals[index], signals[index + 1]))
            next_signals.append(name)
        signals = next_signals
        level += 1
    return signals[0]


def eval_anf_terms(terms, key):
    value = 0
    for mask in terms:
        if mask == 0:
            value ^= 1
            continue
        if (key & mask) == mask:
            value ^= 1
    return value


def eval_anf_word(terms_by_bit, key):
    value = 0
    for bit, terms in enumerate(terms_by_bit):
        if eval_anf_terms(terms, key):
            value |= 1 << bit
    return value


def module_header(module, input_width, output_width):
    return [
        "module {0}(in, out);".format(module),
        "  input {0}in;".format(range_decl(input_width)),
        "  output {0}out;".format(range_decl(output_width)),
    ]


def render_anf_shared(outputs, module, input_width, output_width, transform, terms_by_bit, stats):
    unique = set()
    for terms in terms_by_bit:
        unique.update(terms)
    lines = module_header(module, input_width, output_width)
    lines.extend(key_lines_for_transform(transform, input_width))
    render_product_helpers(lines, unique, input_width)
    out_bits = []
    for bit, terms in enumerate(terms_by_bit):
        signal = xor_tree_signal(lines, terms, input_width, "x_{0}".format(bit))
        out_bits.append(signal)
    for bit, signal in enumerate(out_bits):
        lines.append("  assign out[{0}] = {1};".format(bit, signal))
    lines.append("endmodule")
    lines.append("")
    items = (
        "transform={0}; total_terms={1}; unique_terms={2}; max_degree={3}; "
        "max_bit_terms={4}".format(
            transform,
            stats["total_terms"],
            stats["unique_terms"],
            stats["max_degree"],
            stats["max_bit_terms"],
        )
    )

    def model(index):
        key = transform_index(transform, index, input_width)
        return eval_anf_word(terms_by_bit, key)

    return "\n".join(lines), items, model


class DavioEmitter(object):
    def __init__(self, lines, width, max_nodes, order=None):
        self.lines = lines
        self.width = width
        self.max_nodes = max_nodes
        self.order = order
        self.memo = {}
        self.node_index = 0

    def new_wire(self, expr):
        if self.node_index >= self.max_nodes:
            raise RuntimeError("Davio node limit exceeded: {0}".format(self.max_nodes))
        name = "d_{0}".format(self.node_index)
        self.node_index += 1
        self.lines.append("  wire {0} = {1};".format(name, expr))
        return name

    def choose_var(self, terms):
        if self.order is not None:
            for bit in self.order:
                bit_mask = 1 << bit
                if any(mask & bit_mask for mask in terms):
                    return bit
            return None
        counts = {}
        for mask in terms:
            value = mask
            while value:
                low = value & -value
                bit = low.bit_length() - 1
                counts[bit] = counts.get(bit, 0) + 1
                value ^= low
        if not counts:
            return None
        return max(counts, key=lambda bit: (counts[bit], bit))

    def emit(self, terms):
        terms = frozenset(terms)
        if not terms:
            return "1'b0"
        if terms == frozenset([0]):
            return "1'b1"
        if terms in self.memo:
            return self.memo[terms]
        if len(terms) == 1:
            mask = next(iter(terms))
            if mask != 0 and (mask & (mask - 1)) == 0:
                signal = "key[{0}]".format(mask.bit_length() - 1)
                self.memo[terms] = signal
                return signal

        bit = self.choose_var(terms)
        if bit is None:
            signal = "1'b1" if 0 in terms else "1'b0"
            self.memo[terms] = signal
            return signal

        bit_mask = 1 << bit
        p0 = set()
        p1 = set()
        for mask in terms:
            if mask & bit_mask:
                p1.add(mask ^ bit_mask)
            else:
                p0.add(mask)

        s0 = self.emit(p0)
        s1 = self.emit(p1)
        if s1 == "1'b0":
            signal = s0
        elif s0 == "1'b0" and s1 == "1'b1":
            signal = "key[{0}]".format(bit)
        elif s0 == "1'b0":
            signal = self.new_wire("key[{0}] & {1}".format(bit, s1))
        elif s1 == "1'b1":
            signal = self.new_wire("{0} ^ key[{1}]".format(s0, bit))
        else:
            and_signal = self.new_wire("key[{0}] & {1}".format(bit, s1))
            signal = self.new_wire("{0} ^ {1}".format(s0, and_signal))
        self.memo[terms] = signal
        return signal


def render_anf_davio(outputs, module, input_width, output_width, transform, terms_by_bit, stats, max_nodes, order_name, order):
    lines = module_header(module, input_width, output_width)
    lines.extend(key_lines_for_transform(transform, input_width))
    emitter = DavioEmitter(lines, input_width, max_nodes, order=order)
    out_bits = []
    for terms in terms_by_bit:
        out_bits.append(emitter.emit(terms))
    for bit, signal in enumerate(out_bits):
        lines.append("  assign out[{0}] = {1};".format(bit, signal))
    lines.append("endmodule")
    lines.append("")
    items = (
        "transform={0}; total_terms={1}; unique_terms={2}; max_degree={3}; "
        "max_bit_terms={4}; davio_order={5}; davio_nodes={6}".format(
            transform,
            stats["total_terms"],
            stats["unique_terms"],
            stats["max_degree"],
            stats["max_bit_terms"],
            order_name,
            emitter.node_index,
        )
    )

    def model(index):
        key = transform_index(transform, index, input_width)
        return eval_anf_word(terms_by_bit, key)

    return "\n".join(lines), items, model


def support_for_bit(outputs, width, bit):
    deps = []
    count = 1 << width
    for var in range(width):
        differs = False
        step = 1 << var
        for index in range(count):
            other = index ^ step
            if other <= index:
                continue
            if ((outputs[index] >> bit) & 1) != ((outputs[other] >> bit) & 1):
                differs = True
                break
        if differs:
            deps.append(var)
    return deps


def support_truth_bits(outputs, support, output_bit):
    values = []
    for subindex in range(1 << len(support)):
        index = 0
        for offset, bit in enumerate(support):
            if subindex & (1 << offset):
                index |= 1 << bit
        values.append((outputs[index] >> output_bit) & 1)
    return values


def render_support_lut12_anf(outputs, module, input_width, output_width, max_support):
    terms_by_bit = anf_by_bit(outputs, input_width, output_width)
    stats = anf_stats(terms_by_bit)
    unique = set()
    lut_bits = {}
    supports = {}
    for bit in range(output_width):
        support = support_for_bit(outputs, input_width, bit)
        supports[bit] = support
        if len(support) <= max_support:
            lut_bits[bit] = support_truth_bits(outputs, support, bit)
        else:
            unique.update(terms_by_bit[bit])

    lines = module_header(module, input_width, output_width)
    lines.append("  wire {0}key = in;".format(range_decl(input_width)))
    render_product_helpers(lines, unique, input_width)
    out_signals = {}
    for bit in range(output_width):
        if bit not in lut_bits:
            out_signals[bit] = xor_tree_signal(lines, terms_by_bit[bit], input_width, "x_{0}".format(bit))
            continue
        support = supports[bit]
        values = lut_bits[bit]
        key_name = "lut_key_{0}".format(bit)
        if support:
            parts = ["in[{0}]".format(item) for item in reversed(support)]
            lines.append("  wire [{0}:0] {1} = {{{2}}};".format(len(support) - 1, key_name, ", ".join(parts)))
        else:
            lines.append("  wire {0} = 1'b0;".format(key_name))
        reg_name = "lut_out_{0}".format(bit)
        lines.append("  reg {0};".format(reg_name))
        lines.append("  always @* begin")
        if not support:
            lines.append("    {0} = 1'b{1};".format(reg_name, values[0]))
        else:
            lines.append("    case ({0})".format(key_name))
            for subindex, value in enumerate(values):
                lines.append(
                    "      {0}: {1} = 1'b{2};".format(
                        const_word(len(support), subindex),
                        reg_name,
                        value,
                    )
                )
            lines.append("      default: {0} = 1'b0;".format(reg_name))
            lines.append("    endcase")
        lines.append("  end")
        out_signals[bit] = reg_name

    for bit in range(output_width):
        lines.append("  assign out[{0}] = {1};".format(bit, out_signals[bit]))
    lines.append("endmodule")
    lines.append("")

    lut_count = len(lut_bits)
    max_support_seen = max(len(value) for value in supports.values()) if supports else 0
    items = (
        "support_lut_bits={0}; max_support_lut={1}; max_support_seen={2}; "
        "anf_total_terms={3}; anf_unique_terms={4}; anf_max_degree={5}".format(
            lut_count,
            max_support,
            max_support_seen,
            stats["total_terms"],
            stats["unique_terms"],
            stats["max_degree"],
        )
    )

    def model(index):
        value = 0
        for bit in range(output_width):
            if bit in lut_bits:
                support = supports[bit]
                subindex = 0
                for offset, input_bit in enumerate(support):
                    if index & (1 << input_bit):
                        subindex |= 1 << offset
                bit_value = lut_bits[bit][subindex]
            else:
                bit_value = eval_anf_terms(terms_by_bit[bit], index)
            if bit_value:
                value |= 1 << bit
        return value

    return "\n".join(lines), items, model


def render_variant(outputs, module, input_width, output_width, variant, args):
    if variant == "support_lut12_anf":
        return render_support_lut12_anf(outputs, module, input_width, output_width, args.max_support_lut)

    use_davio = variant.startswith("anf_davio_")
    davio_order_name = "dynamic"
    davio_order = None
    transform = None
    terms_by_bit = None
    stats = None
    if variant == "anf_shared_identity" or variant == "anf_davio_identity":
        transform = "identity"
    elif variant == "anf_davio_interleave":
        transform = "identity"
        davio_order_name = "interleave"
        davio_order = interleave_order(input_width)
    elif variant == "anf_davio_center":
        transform = "identity"
        davio_order_name = "center"
        davio_order = center_order(input_width)
    elif variant == "anf_davio_best_order":
        transform = "identity"
    elif variant == "anf_shared_bit_reverse":
        transform = "bit_reverse"
    elif variant == "anf_shared_gray":
        transform = "gray"
    elif variant == "anf_shared_ungray":
        transform = "ungray"
    elif variant == "anf_shared_best_transform" or variant == "anf_davio_best_transform":
        transform, terms_by_bit, stats = choose_best_transform(outputs, input_width, output_width)
    elif variant == "anf_davio_best_transform_order":
        transform, terms_by_bit, stats, davio_order_name, davio_order, estimated_nodes = choose_best_transform_order(
            outputs,
            input_width,
            output_width,
        )
    else:
        raise RuntimeError("unknown variant: {0}".format(variant))

    if terms_by_bit is None:
        transformed = transformed_outputs(outputs, input_width, transform)
        terms_by_bit = anf_by_bit(transformed, input_width, output_width)
        stats = anf_stats(terms_by_bit)
    if variant == "anf_davio_best_order":
        davio_order_name, davio_order, estimated_nodes = choose_best_order(terms_by_bit, input_width)
    if stats["unique_terms"] > args.max_unique_terms:
        raise RuntimeError(
            "skip {0}: unique ANF terms {1} exceeds limit {2}".format(
                variant,
                stats["unique_terms"],
                args.max_unique_terms,
            )
        )
    if stats["total_terms"] > args.max_total_terms:
        raise RuntimeError(
            "skip {0}: total ANF terms {1} exceeds limit {2}".format(
                variant,
                stats["total_terms"],
                args.max_total_terms,
            )
        )
    if variant.startswith("anf_shared_") and stats["total_terms"] > args.max_shared_total_terms:
        raise RuntimeError(
            "skip {0}: shared ANF total terms {1} exceeds limit {2}".format(
                variant,
                stats["total_terms"],
                args.max_shared_total_terms,
            )
        )
    if use_davio:
        return render_anf_davio(
            outputs,
            module,
            input_width,
            output_width,
            transform,
            terms_by_bit,
            stats,
            args.max_davio_nodes,
            davio_order_name,
            davio_order,
        )
    return render_anf_shared(outputs, module, input_width, output_width, transform, terms_by_bit, stats)


def verify_outputs(outputs, model):
    for index, expected in enumerate(outputs):
        actual = model(index)
        if actual != expected:
            return False, "first mismatch index={0} expected=0x{1:x} actual=0x{2:x}".format(
                index,
                expected,
                actual,
            )
    return True, "exact algebraic model over {0} inputs".format(len(outputs))


def case_output_paths(args, case):
    case_dir = args.work_dir / case
    return {
        "verilog_dir": case_dir / "verilog",
        "aig_dir": case_dir / "aigs",
        "log_dir": case_dir / "logs",
        "manifest": case_dir / "manifest.json",
    }


def run_case(args, case, dedupe_ids, dedupe_hashes, new_hashes):
    truth_path = args.benchmarks / "{0}.truth".format(case)
    table = TruthTable(truth_path)
    if table.input_width != table.output_width:
        raise RuntimeError("{0} input/output widths differ: {1}/{2}".format(case, table.input_width, table.output_width))
    outputs = list(table.iter_outputs())
    paths = case_output_paths(args, case)
    label = "unknown_algebraic_{0}x{0}".format(table.input_width)
    rows = []
    manifest = {
        "case": case,
        "truth": str(truth_path),
        "input_width": table.input_width,
        "output_width": table.output_width,
        "hypothesis": label,
        "variants": [],
    }

    for variant in args.variants:
        print("{0}: start {1}".format(case, variant), flush=True)
        candidate_id = "{0}_{1}_{2}".format(case, label, variant)
        if candidate_id in dedupe_ids:
            continue
        module = candidate_id
        verilog_path = paths["verilog_dir"] / "{0}.v".format(candidate_id)
        aig_path = paths["aig_dir"] / "{0}.aig".format(candidate_id)
        script_path = paths["log_dir"] / "{0}.ys".format(candidate_id)
        log_path = paths["log_dir"] / "{0}.yosys.log".format(candidate_id)
        start = time.time()
        row = {
            "case": case,
            "candidate_id": candidate_id,
            "hypothesis": label,
            "variant": variant,
            "verilog_path": str(verilog_path),
            "aig_path": str(aig_path),
            "verified_truth": "0",
            "synthesized": "0",
            "equivalent": "0",
            "area": "",
            "delay": "",
            "adp": "",
            "runtime_sec": "0.000",
            "items": "",
            "notes": "",
        }
        try:
            verilog, items, model = render_variant(
                outputs,
                module,
                table.input_width,
                table.output_width,
                variant,
                args,
            )
            digest = text_hash(verilog)
            if digest in dedupe_hashes or digest in new_hashes:
                continue
            new_hashes.add(digest)
            row["items"] = items
            verified, note = verify_outputs(outputs, model)
            row["verified_truth"] = "1" if verified else "0"
            row["notes"] = note
            write_text(verilog_path, verilog)
            if args.emit_only:
                row["notes"] = "emit-only; {0}".format(note)
            elif verified:
                yosys_log = synthesize_verilog(
                    verilog=verilog_path,
                    module=module,
                    output=aig_path,
                    yosys=args.yosys,
                    timeout=args.timeout,
                    use_abc=not args.no_yosys_abc,
                    script_out=script_path,
                )
                write_text(log_path, yosys_log)
                row["synthesized"] = "1"
                evaluated = evaluate_aig(
                    case=case,
                    candidate_id=candidate_id,
                    parent_id=label,
                    source="ai_verilog",
                    tool_chain="yosys_unknown_algebraic_{0}".format(variant),
                    aig_path=aig_path,
                    truth=truth_path,
                    abc=args.abc,
                    notes="unknown function algebraic Verilog seed",
                    timeout=args.timeout,
                )
                row["equivalent"] = "1" if evaluated.equivalent else "0"
                row["area"] = "" if evaluated.area is None else str(evaluated.area)
                row["delay"] = "" if evaluated.delay is None else str(evaluated.delay)
                row["adp"] = "" if evaluated.adp is None else str(evaluated.adp)
                row["notes"] = evaluated.notes
        except (RuntimeError, SynthError, OSError, subprocess.TimeoutExpired) as exc:
            row["notes"] = "{0}: {1}".format(type(exc).__name__, exc)[:1000]
        row["runtime_sec"] = "{0:.3f}".format(time.time() - start)
        rows.append(row)
        manifest["variants"].append(row)

    write_text(paths["manifest"], json.dumps(manifest, indent=2, sort_keys=True) + "\n")
    return rows


def best_rows(rows):
    grouped = {}
    for row in rows:
        grouped.setdefault(row["case"], []).append(row)
    best = []
    for case in sorted(grouped):
        valid = [row for row in grouped[case] if row["equivalent"] == "1" and row["adp"]]
        if not valid:
            continue
        item = min(valid, key=lambda row: int(row["adp"]))
        best.append({name: item.get(name, "") for name in BEST_FIELDNAMES})
    return best


def parse_args(argv=None):
    parser = argparse.ArgumentParser(description="Generate exact algebraic unknown-function Verilog candidates.")
    parser.add_argument("--cases", type=parse_cases, default=parse_cases("ex280-ex299"))
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--work-dir", type=Path, default=ROOT / "student" / "work" / "reverse_unknown_algebraic")
    parser.add_argument("--results", type=Path, default=ROOT / "student" / "results" / "unknown_algebraic.csv")
    parser.add_argument("--best-results", type=Path, default=ROOT / "student" / "results" / "unknown_algebraic_best.csv")
    parser.add_argument("--abc", type=Path, default=ROOT / "student" / "abc")
    parser.add_argument("--yosys", type=Path, default=ROOT / "student" / "tools" / "conda-env" / "bin" / "yosys")
    parser.add_argument("--timeout", type=int, default=900)
    parser.add_argument("--no-yosys-abc", action="store_true")
    parser.add_argument("--emit-only", action="store_true")
    parser.add_argument("--dedupe-current", type=Path, action="append", default=[])
    parser.add_argument("--variants", type=parse_variant_list, default=VARIANTS)
    parser.add_argument("--max-unique-terms", type=int, default=70000)
    parser.add_argument("--max-total-terms", type=int, default=500000)
    parser.add_argument("--max-shared-total-terms", type=int, default=65000)
    parser.add_argument("--max-support-lut", type=int, default=12)
    parser.add_argument("--max-davio-nodes", type=int, default=250000)
    return parser.parse_args(argv)


def main(argv=None):
    args = parse_args(argv)
    dedupe_ids, dedupe_hashes = load_dedupe(args.dedupe_current)
    new_hashes = set()
    rows = []
    for case in args.cases:
        case_rows = run_case(args, case, dedupe_ids, dedupe_hashes, new_hashes)
        rows.extend(case_rows)
        print(
            "{0}: generated={1} verified_truth={2}".format(
                case,
                len(case_rows),
                sum(row["verified_truth"] == "1" for row in case_rows),
            )
        )

    write_csv(args.results, ALL_FIELDNAMES, rows)
    best = best_rows(rows)
    write_csv(args.best_results, BEST_FIELDNAMES, best)
    print("Results: {0}".format(args.results))
    print("Best: {0}".format(args.best_results))
    print("Rows: {0}".format(len(rows)))
    print("Best cases: {0}/{1}".format(len(best), len(args.cases)))
    if args.emit_only:
        print("Emit-only candidates: {0}".format(len(rows)))
        return 0
    return 0 if len(best) == len(args.cases) else 1


if __name__ == "__main__":
    raise SystemExit(main())
