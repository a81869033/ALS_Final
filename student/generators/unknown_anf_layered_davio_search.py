#!/usr/bin/env python3
"""Generate layered ANF/Davio seeds for unknown cases.

The existing ANF generators either emit all monomials directly or put the whole
polynomial into one Davio expansion.  This source form keeps low-degree terms as
explicit shared product/XOR logic and emits only the high-degree residual through
a shared Davio DAG.  It targets degree-4 functions with a visible linear or
quadratic skeleton plus nonlinear correction.
"""

import argparse
import json
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
    DavioEmitter,
    anf_by_bit,
    candidate_orders,
    eval_anf_word,
    estimate_davio_nodes,
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
    items = []
    seen = set()
    for item in value.split(","):
        item = item.strip()
        if item and item not in seen:
            items.append(item)
            seen.add(item)
    if not items:
        raise argparse.ArgumentTypeError("empty list")
    return items


def parse_thresholds(value):
    thresholds = []
    for item in parse_list(value):
        threshold = int(item)
        if threshold < 0 or threshold > 3:
            raise argparse.ArgumentTypeError("threshold must be 0..3: {0}".format(item))
        thresholds.append(threshold)
    return thresholds


def popcount(value):
    return bin(value).count("1")


def xor_expr(parts):
    parts = [part for part in parts if part != "1'b0"]
    if not parts:
        return "1'b0"
    if len(parts) == 1:
        return parts[0]
    return "(" + " ^ ".join(parts) + ")"


def choose_order(terms_by_bit, width, order_style):
    if order_style == "best_residual":
        best = None
        for name, order in candidate_orders(width):
            nodes = estimate_davio_nodes(terms_by_bit, order)
            score = (nodes, name)
            if best is None or score < best[0]:
                best = (score, name, order)
        return best[1], best[2], best[0][0]
    orders = dict(candidate_orders(width))
    if order_style == "endpoint_rev":
        order = []
        for offset in range(width):
            hi = width - 1 - offset
            lo = offset
            if hi not in order:
                order.append(hi)
            if lo not in order:
                order.append(lo)
        return order_style, order, estimate_davio_nodes(terms_by_bit, order)
    if order_style == "endpoint":
        order = []
        for offset in range(width):
            lo = offset
            hi = width - 1 - offset
            if lo not in order:
                order.append(lo)
            if hi not in order:
                order.append(hi)
        return order_style, order, estimate_davio_nodes(terms_by_bit, order)
    if order_style not in orders:
        raise RuntimeError("unknown order style: {0}".format(order_style))
    order = orders[order_style]
    return order_style, order, estimate_davio_nodes(terms_by_bit, order)


def render(outputs, module, input_width, output_width, transform, threshold, order_style, max_nodes):
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

    order_name, order, residual_nodes_est = choose_order(residual_by_bit, input_width, order_style)
    lines = [
        "module {0}(in, out);".format(module),
        "  input {0}in;".format(range_decl(input_width)),
        "  output {0}out;".format(range_decl(output_width)),
    ]
    lines.extend(key_lines_for_transform(transform, input_width))

    if direct_masks:
        render_product_helpers(lines, direct_masks, input_width)

    emitter = DavioEmitter(lines, input_width, max_nodes, order=order)
    out_bits = []
    for bit in range(output_width):
        parts = []
        if direct_by_bit[bit]:
            parts.append(xor_tree_signal(lines, direct_by_bit[bit], input_width, "lo_{0}".format(bit)))
        if residual_by_bit[bit]:
            parts.append(emitter.emit(residual_by_bit[bit]))
        out_bits.append(xor_expr(parts))

    for bit, signal in enumerate(out_bits):
        lines.append("  assign out[{0}] = {1};".format(bit, signal))
    lines.append("endmodule")
    lines.append("")

    items = (
        "transform={0}; threshold={1}; order={2}; direct_terms={3}; "
        "residual_terms={4}; direct_unique={5}; residual_nodes_est={6}; davio_nodes={7}"
    ).format(
        transform,
        threshold,
        order_name,
        sum(len(terms) for terms in direct_by_bit),
        sum(len(terms) for terms in residual_by_bit),
        len(direct_masks),
        residual_nodes_est,
        emitter.node_index,
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
    return True, "exact layered ANF/Davio model over {0} inputs".format(len(outputs))


def best_rows(rows):
    best = []
    for case in sorted(set(row["case"] for row in rows)):
        valid = [
            row
            for row in rows
            if row["case"] == case and row["equivalent"] == "1" and row["adp"]
        ]
        if valid:
            item = min(valid, key=lambda row: int(row["adp"]))
            best.append({name: item.get(name, "") for name in BEST_FIELDNAMES})
    return best


def run_case(args, case):
    truth_path = args.benchmarks / "{0}.truth".format(case)
    table = TruthTable(truth_path)
    outputs = list(table.iter_outputs())
    rows = []
    manifest = {
        "case": case,
        "truth": str(truth_path),
        "input_width": table.input_width,
        "output_width": table.output_width,
        "hypothesis": "unknown_layered_anf_davio",
        "variants": [],
    }
    for transform in args.transforms:
        for threshold in args.thresholds:
            for order_style in args.orders:
                variant = "{0}_deg{1}_{2}".format(transform, threshold, order_style)
                candidate_id = "{0}_unknown_layered_anf_davio_{1}".format(case, variant)
                module = candidate_id
                verilog_path = args.work_dir / case / "verilog" / "{0}.v".format(candidate_id)
                aig_path = args.work_dir / case / "aigs" / "{0}.aig".format(candidate_id)
                script_path = args.work_dir / case / "logs" / "{0}.ys".format(candidate_id)
                log_path = args.work_dir / case / "logs" / "{0}.yosys.log".format(candidate_id)
                start = time.time()
                row = {
                    "case": case,
                    "candidate_id": candidate_id,
                    "hypothesis": "unknown_layered_anf_davio",
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
                        order_style,
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
                            parent_id="unknown_layered_anf_davio",
                            source="ai_verilog",
                            tool_chain="yosys_unknown_layered_anf_davio",
                            aig_path=aig_path,
                            truth=truth_path,
                            abc=args.abc,
                            notes="unknown layered ANF/Davio Verilog seed",
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
    write_text(args.work_dir / case / "manifest.json", json.dumps(manifest, indent=2, sort_keys=True) + "\n")
    return rows


def parse_args(argv=None):
    parser = argparse.ArgumentParser(description="Generate layered ANF/Davio candidates.")
    parser.add_argument("--cases", type=parse_cases, required=True)
    parser.add_argument("--transforms", type=parse_list, default=parse_list("identity"))
    parser.add_argument("--thresholds", type=parse_thresholds, default=parse_thresholds("1,2,3"))
    parser.add_argument("--orders", type=parse_list, default=parse_list("best_residual,endpoint,endpoint_rev"))
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--work-dir", type=Path, required=True)
    parser.add_argument("--results", type=Path, required=True)
    parser.add_argument("--best-results", type=Path, required=True)
    parser.add_argument("--summary-results", type=Path)
    parser.add_argument("--evaluate-check", type=Path)
    parser.add_argument("--reference", type=Path, default=ROOT / "reference_result.csv")
    parser.add_argument("--current-best", type=Path, default=ROOT / "student" / "results" / "current_best_by_case.csv")
    parser.add_argument("--abc", type=Path, default=ROOT / "student" / "abc")
    parser.add_argument("--yosys", type=Path, default=ROOT / "student" / "tools" / "conda-env" / "bin" / "yosys")
    parser.add_argument("--timeout", type=int, default=900)
    parser.add_argument("--max-nodes", type=int, default=20000)
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
    if args.summary_results:
        refs = load_reference(args.reference)
        current = load_current_best(args.current_best)
        write_csv(args.summary_results, SUMMARY_FIELDNAMES, [add_summary_columns(row, refs, current) for row in best])
    if args.evaluate_check:
        write_csv(
            args.evaluate_check,
            EVALUATE_FIELDNAMES,
            [{name: row.get(name, "") for name in EVALUATE_FIELDNAMES} for row in rows],
        )
    write_text(args.work_dir / "manifest.json", json.dumps(rows, indent=2, sort_keys=True) + "\n")
    print("Results: {0}".format(args.results))
    print("Best: {0}".format(args.best_results))
    print("Rows: {0}".format(len(rows)))
    print("Best cases: {0}/{1}".format(len(best), len(args.cases)))
    return 0 if len(best) == len(args.cases) else 1


if __name__ == "__main__":
    raise SystemExit(main())
