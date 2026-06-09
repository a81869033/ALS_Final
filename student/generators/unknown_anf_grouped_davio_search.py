#!/usr/bin/env python3
"""Generate prefix-key ANF/Davio sources with output-group-specific orders."""

import argparse
import csv
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
from student.generators.unknown_algebraic_search import (
    anf_by_bit,
    candidate_orders,
    eval_anf_word,
    key_lines_for_transform,
    render_product_helpers,
    signal_for_mask,
    transformed_outputs,
    transform_index,
    xor_tree_signal,
)
from student.generators.unknown_key_ac_decomp_search import (
    EVALUATE_FIELDNAMES,
    SUMMARY_FIELDNAMES,
    add_summary_columns,
    load_current_best,
    load_reference,
)
from student.generators.unknown_verilog_search import (
    ALL_FIELDNAMES,
    BEST_FIELDNAMES,
    parse_cases,
    range_decl,
    text_hash,
    write_csv,
    write_text,
)


def parse_list(value):
    out = []
    seen = set()
    for item in value.split(","):
        item = item.strip()
        if item and item not in seen:
            out.append(item)
            seen.add(item)
    if not out:
        raise argparse.ArgumentTypeError("empty list")
    return out


def parse_thresholds(value):
    out = []
    for item in parse_list(value):
        threshold = int(item)
        if threshold < 0 or threshold > 3:
            raise argparse.ArgumentTypeError("threshold must be 0..3: {0}".format(item))
        out.append(threshold)
    return out


def popcount(value):
    return bin(value).count("1")


def xor_expr(parts):
    parts = [part for part in parts if part != "1'b0"]
    if not parts:
        return "1'b0"
    if len(parts) == 1:
        return parts[0]
    return "(" + " ^ ".join(parts) + ")"


def endpoint_order(width, reverse=False):
    order = []
    for offset in range(width):
        lo = offset
        hi = width - 1 - offset
        pair = (hi, lo) if reverse else (lo, hi)
        for bit in pair:
            if bit not in order:
                order.append(bit)
    return order


def all_orders(width):
    rows = list(candidate_orders(width))
    rows.append(("endpoint", endpoint_order(width, reverse=False)))
    rows.append(("endpoint_rev", endpoint_order(width, reverse=True)))
    return rows


def estimate_group(terms_by_bit, order):
    memo = {}
    nodes = set()

    def emit(terms):
        terms = frozenset(terms)
        if not terms:
            return ("Z", 0)
        if terms == frozenset([0]):
            return ("O", 0)
        if terms in memo:
            return memo[terms]
        if len(terms) == 1:
            mask = next(iter(terms))
            if mask != 0 and (mask & (mask - 1)) == 0:
                result = ("K{0}".format(mask.bit_length() - 1), 0)
                memo[terms] = result
                return result

        bit = None
        for candidate in order:
            bit_mask = 1 << candidate
            if any(mask & bit_mask for mask in terms):
                bit = candidate
                break
        if bit is None:
            result = ("O" if 0 in terms else "Z", 0)
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
        if high[0] == "Z":
            result = low
        elif low[0] == "Z" and high[0] == "O":
            result = ("K{0}".format(bit), 0)
        elif low[0] == "Z":
            result = ("N", high[1] + 1)
            nodes.add((bit, low[0], high[0], high[1]))
        elif high[0] == "O":
            result = ("N", max(low[1], 1))
            nodes.add((bit, low[0], low[1], high[0]))
        else:
            result = ("N", max(low[1], high[1] + 1) + 1)
            nodes.add((bit, low[0], low[1], high[0], high[1]))
        memo[terms] = result
        return result

    depths = []
    for terms in terms_by_bit:
        depths.append(emit(terms)[1])
    return len(nodes), max(depths) if depths else 0


def choose_order(terms_by_bit, width, metric):
    best = None
    for name, order in all_orders(width):
        nodes, depth = estimate_group(terms_by_bit, order)
        if metric == "depth":
            score = (depth, nodes, name)
        elif metric == "node":
            score = (nodes, depth, name)
        else:
            raise RuntimeError("unknown order metric: {0}".format(metric))
        if best is None or score < best[0]:
            best = (score, name, order, nodes, depth)
    return best[1], best[2], best[3], best[4]


def groups_for_mode(output_width, mode):
    bits = list(range(output_width))
    if mode == "all":
        return [bits]
    if mode == "perbit":
        return [[bit] for bit in bits]
    if mode.startswith("split"):
        size = int(mode[5:])
        if size <= 0:
            raise RuntimeError("split size must be positive: {0}".format(mode))
        return [bits[start : start + size] for start in range(0, output_width, size)]
    if mode.startswith("high"):
        size = int(mode[4:])
        if size <= 0:
            raise RuntimeError("high size must be positive: {0}".format(mode))
        split = max(0, output_width - size)
        return [bits[:split], bits[split:]]
    if mode.startswith("low"):
        size = int(mode[3:])
        if size <= 0:
            raise RuntimeError("low size must be positive: {0}".format(mode))
        split = min(output_width, size)
        return [bits[:split], bits[split:]]
    raise RuntimeError("unknown group mode: {0}".format(mode))


class PrefixedDavioEmitter(object):
    def __init__(self, lines, max_nodes, order, prefix):
        self.lines = lines
        self.max_nodes = max_nodes
        self.order = order
        self.prefix = prefix
        self.memo = {}
        self.node_index = 0

    def new_wire(self, expr):
        if self.node_index >= self.max_nodes:
            raise RuntimeError("Davio node limit exceeded: {0}".format(self.max_nodes))
        name = "{0}d_{1}".format(self.prefix, self.node_index)
        self.node_index += 1
        self.lines.append("  wire {0} = {1};".format(name, expr))
        return name

    def choose_var(self, terms):
        for bit in self.order:
            bit_mask = 1 << bit
            if any(mask & bit_mask for mask in terms):
                return bit
        return None

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


def render(outputs, module, input_width, output_width, transform, threshold, group_mode, order_metric, max_nodes):
    values = transformed_outputs(outputs, input_width, transform)
    terms_by_bit = anf_by_bit(values, input_width, output_width)
    direct_by_bit = []
    residual_by_bit = []
    direct_masks = set()
    for terms in terms_by_bit:
        direct = set()
        residual = set()
        for mask in terms:
            if popcount(mask) <= threshold:
                direct.add(mask)
                direct_masks.add(mask)
            else:
                residual.add(mask)
        direct_by_bit.append(direct)
        residual_by_bit.append(residual)

    lines = [
        "module {0}(in, out);".format(module),
        "  input {0}in;".format(range_decl(input_width)),
        "  output {0}out;".format(range_decl(output_width)),
    ]
    lines.extend(key_lines_for_transform(transform, input_width))
    if direct_masks:
        render_product_helpers(lines, direct_masks, input_width)

    out_bits = ["1'b0"] * output_width
    order_notes = []
    node_total = 0
    depth_max = 0
    groups = groups_for_mode(output_width, group_mode)
    for group_index, group_bits in enumerate(groups):
        if not group_bits:
            continue
        group_terms = [residual_by_bit[bit] for bit in group_bits]
        order_name, order, nodes_est, depth_est = choose_order(group_terms, input_width, order_metric)
        emitter = PrefixedDavioEmitter(lines, max_nodes, order, "g{0}_".format(group_index))
        for bit in group_bits:
            parts = []
            if direct_by_bit[bit]:
                parts.append(xor_tree_signal(lines, direct_by_bit[bit], input_width, "lo_{0}".format(bit)))
            if residual_by_bit[bit]:
                parts.append(emitter.emit(residual_by_bit[bit]))
            out_bits[bit] = xor_expr(parts)
        node_total += emitter.node_index
        depth_max = max(depth_max, depth_est)
        order_notes.append(
            "{0}:{1}:bits={2}:nodes={3}:depth={4}:emit={5}".format(
                group_index,
                order_name,
                ".".join(str(bit) for bit in group_bits),
                nodes_est,
                depth_est,
                emitter.node_index,
            )
        )

    for bit, signal in enumerate(out_bits):
        lines.append("  assign out[{0}] = {1};".format(bit, signal))
    lines.append("endmodule")
    lines.append("")
    items = (
        "transform={0}; threshold={1}; group_mode={2}; order_metric={3}; "
        "groups={4}; direct_terms={5}; residual_terms={6}; direct_unique={7}; "
        "davio_nodes={8}; max_est_depth={9}; orders={10}"
    ).format(
        transform,
        threshold,
        group_mode,
        order_metric,
        len(groups),
        sum(len(terms) for terms in direct_by_bit),
        sum(len(terms) for terms in residual_by_bit),
        len(direct_masks),
        node_total,
        depth_max,
        "|".join(order_notes),
    )

    def model(index):
        key = transform_index(transform, index, input_width)
        return eval_anf_word(terms_by_bit, key)

    return "\n".join(lines), items, model


def verify_outputs(outputs, model):
    for index, expected in enumerate(outputs):
        actual = model(index)
        if actual != expected:
            return False, "first mismatch index={0} expected=0x{1:x} actual=0x{2:x}".format(
                index,
                expected,
                actual,
            )
    return True, "exact grouped ANF/Davio model over {0} inputs".format(len(outputs))


def best_rows(rows):
    best = []
    for case in sorted({row["case"] for row in rows}):
        valid = [row for row in rows if row["case"] == case and row["equivalent"] == "1" and row["adp"]]
        if valid:
            item = min(valid, key=lambda row: int(row["adp"]))
            best.append({name: item.get(name, "") for name in BEST_FIELDNAMES})
    return best


def run_case(args, case):
    truth_path = args.benchmarks / "{0}.truth".format(case)
    table = TruthTable(truth_path)
    outputs = list(table.iter_outputs())
    rows = []
    for transform in args.transforms:
        for threshold in args.thresholds:
            for group_mode in args.group_modes:
                for order_metric in args.order_metrics:
                    variant = "{0}_deg{1}_{2}_{3}".format(transform, threshold, group_mode, order_metric)
                    candidate_id = "{0}_unknown_grouped_anf_davio_{1}".format(case, variant)
                    module = candidate_id
                    verilog_path = args.work_dir / case / "verilog" / "{0}.v".format(candidate_id)
                    aig_path = args.work_dir / case / "aigs" / "{0}.aig".format(candidate_id)
                    script_path = args.work_dir / case / "logs" / "{0}.ys".format(candidate_id)
                    log_path = args.work_dir / case / "logs" / "{0}.yosys.log".format(candidate_id)
                    start = time.time()
                    row = {
                        "case": case,
                        "candidate_id": candidate_id,
                        "hypothesis": "unknown_grouped_anf_davio",
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
                        verilog, items, model = render(
                            outputs,
                            module,
                            table.input_width,
                            table.output_width,
                            transform,
                            threshold,
                            group_mode,
                            order_metric,
                            args.max_nodes,
                        )
                        row["items"] = "{0}; hash={1}".format(items, text_hash(verilog)[:12])
                        verified, note = verify_outputs(outputs, model)
                        row["verified_truth"] = "1" if verified else "0"
                        row["notes"] = note
                        write_text(verilog_path, verilog)
                        if verified:
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
                                parent_id="unknown_grouped_anf_davio",
                                source="ai_verilog",
                                tool_chain="yosys_unknown_grouped_anf_davio",
                                aig_path=aig_path,
                                truth=truth_path,
                                abc=args.abc,
                                notes="unknown grouped ANF/Davio Verilog seed",
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
                    print(
                        "{0} {1} eq={2} area={3} delay={4} adp={5}".format(
                            case,
                            variant,
                            row["equivalent"],
                            row["area"],
                            row["delay"],
                            row["adp"],
                        ),
                        flush=True,
                    )
    return rows


def parse_args(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--cases", type=parse_cases, required=True)
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--transforms", type=parse_list, default=["prefix_parity_reduce"])
    parser.add_argument("--thresholds", type=parse_thresholds, default=[0])
    parser.add_argument("--group-modes", type=parse_list, default=["all", "split4", "high4", "perbit"])
    parser.add_argument("--order-metrics", type=parse_list, default=["depth"])
    parser.add_argument("--work-dir", type=Path, required=True)
    parser.add_argument("--results", type=Path, required=True)
    parser.add_argument("--best-results", type=Path, required=True)
    parser.add_argument("--summary-results", type=Path, required=True)
    parser.add_argument("--evaluate-check", type=Path, required=True)
    parser.add_argument("--reference", type=Path, default=ROOT / "reference_result.csv")
    parser.add_argument("--current-best", type=Path, default=ROOT / "student/results/current_best_by_case.csv")
    parser.add_argument("--abc", type=Path, default=ROOT / "student/abc")
    parser.add_argument("--yosys", type=Path, default=ROOT / "student/tools/conda-env/bin/yosys")
    parser.add_argument("--timeout", type=int, default=900)
    parser.add_argument("--max-nodes", type=int, default=200000)
    parser.add_argument("--no-yosys-abc", action="store_true")
    return parser.parse_args(argv)


def main(argv=None):
    args = parse_args(argv)
    rows = []
    for case in args.cases:
        rows.extend(run_case(args, case))
    write_csv(args.results, ALL_FIELDNAMES, rows)
    best = best_rows(rows)
    write_csv(args.best_results, BEST_FIELDNAMES, best)
    refs = load_reference(args.reference)
    current = load_current_best(args.current_best)
    write_csv(args.summary_results, SUMMARY_FIELDNAMES, [add_summary_columns(row, refs, current) for row in best])
    write_csv(
        args.evaluate_check,
        EVALUATE_FIELDNAMES,
        [{name: row.get(name, "") for name in EVALUATE_FIELDNAMES} for row in rows],
    )
    print("Results: {0}".format(args.results))
    print("Best: {0}".format(args.best_results))
    print("Rows: {0}".format(len(rows)))
    print("Best cases: {0}/{1}".format(len(best), len(args.cases)))
    return 0 if len(best) == len(args.cases) else 1


if __name__ == "__main__":
    raise SystemExit(main())
