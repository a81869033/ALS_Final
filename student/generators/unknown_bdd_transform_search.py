#!/usr/bin/env python3
"""Generate shared-BDD RTL over transformed input keys for unknown functions."""

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
from student.generators.unknown_algebraic_search import (
    key_lines_for_transform,
    transform_index,
)
from student.generators.unknown_bdd_search import (
    SharedBddBuilder,
    edge_expr,
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


def parse_transform_list(value):
    transforms = []
    seen = set()
    for item in value.split(","):
        item = item.strip()
        if item and item not in seen:
            transforms.append(item)
            seen.add(item)
    if not transforms:
        raise argparse.ArgumentTypeError("empty transform list")
    return transforms


def parse_order_names(value):
    names = []
    seen = set()
    for item in value.split(","):
        item = item.strip()
        if item and item not in seen:
            names.append(item)
            seen.add(item)
    if not names:
        raise argparse.ArgumentTypeError("empty order list")
    return names


def order_for(width, name):
    if name == "natural":
        return list(range(width))
    if name == "reverse":
        return list(reversed(range(width)))
    if name == "interleave":
        order = []
        for index in range((width + 1) // 2):
            other = width - 1 - index
            order.append(index)
            if other != index:
                order.append(other)
        return order
    if name == "center":
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
    raise argparse.ArgumentTypeError("unknown order: {0}".format(name))


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


def build_bdd(outputs, input_width, output_width, order):
    builder = SharedBddBuilder(order)
    roots = []
    for bit in range(output_width):
        roots.append(builder.build(permute_plane(plane_for_outputs(outputs, bit), order), 0))
    return builder, roots


def render(outputs, module, input_width, output_width, transform, order_name, order):
    values = transformed_outputs(outputs, input_width, transform)
    builder, roots = build_bdd(values, input_width, output_width, order)
    lines = [
        "module {0}(in, out);".format(module),
        "  input {0}in;".format(range_decl(input_width)),
        "  output {0}out;".format(range_decl(output_width)),
    ]
    lines.extend(key_lines_for_transform(transform, input_width))
    for node in builder.nodes:
        lines.append(
            "  wire n_{0} = key[{1}] ? {2} : {3};".format(
                node["id"],
                node["var"],
                edge_expr(node["high"]),
                edge_expr(node["low"]),
            )
        )
    for bit, root in enumerate(roots):
        lines.append("  assign out[{0}] = {1};".format(bit, edge_expr(root)))
    lines.append("endmodule")
    lines.append("")

    def model(index):
        key = transform_index(transform, index, input_width)
        value = 0
        memo = {}
        for bit, root in enumerate(roots):
            if builder.eval_edge(root, key, memo):
                value |= 1 << bit
        return value

    items = "transform={0}; order_name={1}; order={2}; bdd_nodes={3}".format(
        transform,
        order_name,
        ":".join(str(item) for item in order),
        len(builder.nodes),
    )
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
    return True, "exact transformed-key BDD model over {0} inputs".format(len(outputs))


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
    outputs = list(table.iter_outputs())
    rows = []
    for transform in args.transforms:
        for order_name in args.orders:
            order = order_for(table.input_width, order_name)
            candidate_id = "{0}_unknown_bdd_key_{1}_{2}".format(case, transform, order_name)
            module = candidate_id
            verilog_path = args.work_dir / case / "verilog" / "{0}.v".format(candidate_id)
            aig_path = args.work_dir / case / "aigs" / "{0}.aig".format(candidate_id)
            script_path = args.work_dir / case / "logs" / "{0}.ys".format(candidate_id)
            log_path = args.work_dir / case / "logs" / "{0}.yosys.log".format(candidate_id)
            start = time.time()
            row = {
                "case": case,
                "candidate_id": candidate_id,
                "hypothesis": "unknown_transformed_key_bdd",
                "variant": "{0}_{1}".format(transform, order_name),
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
                    order_name,
                    order,
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
                        parent_id="unknown_transformed_key_bdd",
                        source="ai_verilog",
                        tool_chain="yosys_unknown_transformed_key_bdd",
                        aig_path=aig_path,
                        truth=truth_path,
                        abc=args.abc,
                        notes="unknown transformed-key shared-BDD Verilog seed",
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
                "{0} {1}_{2} eq={3} area={4} delay={5} adp={6}".format(
                    case,
                    transform,
                    order_name,
                    row["equivalent"],
                    row["area"],
                    row["delay"],
                    row["adp"],
                ),
                flush=True,
            )
    return rows


def parse_args(argv=None):
    parser = argparse.ArgumentParser(description="Generate transformed-key BDD candidates.")
    parser.add_argument("--cases", type=parse_cases, required=True)
    parser.add_argument("--transforms", type=parse_transform_list, default=parse_transform_list("gray,ungray,bit_reverse"))
    parser.add_argument("--orders", type=parse_order_names, default=parse_order_names("interleave,natural"))
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
    for case in args.cases:
        rows.extend(run_case(args, case))
    write_csv(args.results, ALL_FIELDNAMES, rows)
    write_csv(args.best_results, BEST_FIELDNAMES, best_rows(rows))
    write_text(args.work_dir / "manifest.json", json.dumps(rows, indent=2) + "\n")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
