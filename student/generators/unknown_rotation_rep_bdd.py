#!/usr/bin/env python3
"""Generate rotation-equivariant RTL from representative output-bit BDDs."""

import argparse
import csv
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
from student.generators.unknown_bdd_search import (
    SharedBddBuilder,
    permute_plane,
    plane_for_outputs,
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


def parse_order_names(text):
    return [item.strip() for item in text.split(",") if item.strip()]


def order_for(width, name):
    if name == "natural":
        return list(range(width))
    if name == "reverse":
        return list(reversed(range(width)))
    if name == "interleave":
        out = []
        for index in range((width + 1) // 2):
            other = width - 1 - index
            out.append(index)
            if other != index:
                out.append(other)
        return out
    if name == "center":
        out = []
        left = (width - 1) // 2
        right = left + 1
        while left >= 0 or right < width:
            if left >= 0:
                out.append(left)
                left -= 1
            if right < width:
                out.append(right)
                right += 1
        return out
    raise argparse.ArgumentTypeError("unknown order: {0}".format(name))


def rotl(value, width, amount):
    amount %= width
    mask = (1 << width) - 1
    if amount == 0:
        return value & mask
    return ((value << amount) | (value >> (width - amount))) & mask


def rotated_input_bit(var, width, amount):
    return (var - amount) % width


def edge_expr(edge, prefix):
    node_id, inv = edge
    if node_id == 0:
        return "1'b1" if inv else "1'b0"
    name = "{0}_n_{1}".format(prefix, node_id)
    return "~{0}".format(name) if inv else name


def build_rep(outputs, width, bit, order):
    builder = SharedBddBuilder(order)
    root = builder.build(permute_plane(plane_for_outputs(outputs, bit), order), 0)
    return builder, root


def render_rep_nodes(lines, builder, root, prefix, width, amount):
    for node in builder.nodes:
        lines.append(
            "  wire {0}_n_{1} = in[{2}] ? {3} : {4};".format(
                prefix,
                node["id"],
                rotated_input_bit(node["var"], width, amount),
                edge_expr(node["high"], prefix),
                edge_expr(node["low"], prefix),
            )
        )
    return edge_expr(root, prefix)


def render(outputs, module, width, order_name, order):
    reps = {
        0: build_rep(outputs, width, 0, order),
        1: build_rep(outputs, width, 1, order),
    }
    lines = [
        "module {0}(in, out);".format(module),
        "  input {0}in;".format(range_decl(width)),
        "  output {0}out;".format(range_decl(width)),
    ]
    assigns = {}
    node_total = 0
    for bit in range(width):
        rep = bit & 1
        amount = (rep - bit) % width
        builder, root = reps[rep]
        prefix = "b{0}".format(bit)
        assigns[bit] = render_rep_nodes(lines, builder, root, prefix, width, amount)
        node_total += len(builder.nodes)
    for bit in range(width):
        lines.append("  assign out[{0}] = {1};".format(bit, assigns[bit]))
    lines.append("endmodule")
    lines.append("")

    def model(index):
        value = 0
        for bit in range(width):
            rep = bit & 1
            amount = (rep - bit) % width
            rotated = rotl(index, width, amount)
            rep_value = (outputs[rotated] >> rep) & 1
            if rep_value:
                value |= 1 << bit
        return value

    items = "order_name={0}; order={1}; rep0_nodes={2}; rep1_nodes={3}; emitted_nodes={4}".format(
        order_name,
        ":".join(str(item) for item in order),
        len(reps[0][0].nodes),
        len(reps[1][0].nodes),
        node_total,
    )
    return "\n".join(lines), items, model


def verify_outputs(outputs, model):
    for index, expected in enumerate(outputs):
        actual = model(index)
        if actual != expected:
            return False, "first mismatch index={0} expected=0x{1:x} actual=0x{2:x}".format(index, expected, actual)
    return True, "exact rotation representative BDD model over {0} inputs".format(len(outputs))


def best_rows(rows):
    best = []
    for case in sorted(set(row["case"] for row in rows)):
        valid = [row for row in rows if row["case"] == case and row["equivalent"] == "1" and row["adp"]]
        if valid:
            item = min(valid, key=lambda row: int(row["adp"]))
            best.append({name: item.get(name, "") for name in BEST_FIELDNAMES})
    return best


def run_case(args, case):
    truth_path = args.benchmarks / "{0}.truth".format(case)
    table = TruthTable(truth_path)
    if table.input_width != table.output_width:
        raise RuntimeError("{0} is not a square word function".format(case))
    outputs = list(table.iter_outputs())
    rows = []
    for order_name in args.orders:
        order = order_for(table.input_width, order_name)
        candidate_id = "{0}_unknown_rot_rep_bdd_{1}".format(case, order_name)
        module = candidate_id
        verilog_path = args.work_dir / case / "verilog" / "{0}.v".format(candidate_id)
        aig_path = args.work_dir / case / "aigs" / "{0}.aig".format(candidate_id)
        script_path = args.work_dir / case / "logs" / "{0}.ys".format(candidate_id)
        log_path = args.work_dir / case / "logs" / "{0}.yosys.log".format(candidate_id)
        start = time.time()
        row = {
            "case": case,
            "candidate_id": candidate_id,
            "hypothesis": "rotation_representative_bdd",
            "variant": order_name,
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
            verilog, items, model = render(outputs, module, table.input_width, order_name, order)
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
                    parent_id="rotation_representative_bdd",
                    source="ai_verilog",
                    tool_chain="yosys_unknown_rotation_representative_bdd",
                    aig_path=aig_path,
                    truth=truth_path,
                    abc=args.abc,
                    notes="unknown rotation representative-bit BDD Verilog seed",
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
        print("{0} {1} eq={2} area={3} delay={4} adp={5}".format(case, order_name, row["equivalent"], row["area"], row["delay"], row["adp"]), flush=True)
    return rows


def parse_args(argv=None):
    parser = argparse.ArgumentParser(description="Generate rotation representative-bit BDD candidates.")
    parser.add_argument("--cases", type=parse_cases, default=parse_cases("ex295,ex297,ex299"))
    parser.add_argument("--orders", type=parse_order_names, default=parse_order_names("natural"))
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--work-dir", type=Path, required=True)
    parser.add_argument("--results", type=Path, required=True)
    parser.add_argument("--best-results", type=Path, required=True)
    parser.add_argument("--abc", type=Path, default=ROOT / "student" / "abc")
    parser.add_argument("--yosys", type=Path, default=ROOT / "student" / "tools" / "conda-env" / "bin" / "yosys")
    parser.add_argument("--timeout", type=int, default=900)
    parser.add_argument("--no-yosys-abc", action="store_true")
    return parser.parse_args(argv)


def main(argv=None):
    args = parse_args(argv)
    rows = []
    manifest = {"cases": args.cases, "orders": args.orders, "rows": []}
    for case in args.cases:
        case_rows = run_case(args, case)
        rows.extend(case_rows)
        manifest["rows"].extend(case_rows)
    write_csv(args.results, ALL_FIELDNAMES, rows)
    write_csv(args.best_results, BEST_FIELDNAMES, best_rows(rows))
    write_text(args.work_dir / "manifest.json", json.dumps(manifest, indent=2, sort_keys=True) + "\n")
    print("Results: {0}".format(args.results))
    print("Best: {0}".format(args.best_results))
    print("Rows: {0}".format(len(rows)))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
