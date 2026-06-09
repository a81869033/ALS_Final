#!/usr/bin/env python3
"""Generate BDD seeds that exploit complement/reverse duality."""

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
    edge_expr,
    plane_for_outputs,
    permute_plane,
)
from student.generators.unknown_verilog_search import (
    ALL_FIELDNAMES,
    BEST_FIELDNAMES,
    range_decl,
    write_csv,
    write_text,
)


def parse_cases(text):
    return [item.strip() for item in text.split(",") if item.strip()]


def parse_orders(text):
    out = []
    for item in text.split(","):
        item = item.strip()
        if not item:
            continue
        parts = [int(part) for part in item.split(":") if part.strip()]
        if sorted(parts) != list(range(len(parts))):
            raise argparse.ArgumentTypeError("invalid order: {0}".format(item))
        out.append(("order_" + "_".join(str(part) for part in parts), parts))
    return out


def reverse_bits(value, width):
    out = 0
    for bit in range(width):
        if (value >> bit) & 1:
            out |= 1 << (width - 1 - bit)
    return out


def verify_duality(outputs, width):
    full = (1 << width) - 1
    for x, y in enumerate(outputs):
        expected = full ^ reverse_bits(y, width)
        if outputs[full ^ x] != expected:
            return False, "first mismatch x=0x{0:x}".format(x)
    return True, "exact f(~x)=~reverse(f(x))"


def build_half_outputs(outputs, width):
    half_width = width - 1
    half_outputs = []
    for low in range(1 << half_width):
        half_outputs.append(outputs[low])
    return half_outputs


def build_bdd(outputs, input_width, output_width, order):
    builder = SharedBddBuilder(order)
    roots = []
    for bit in range(output_width):
        plane = plane_for_outputs(outputs, bit)
        roots.append(builder.build(permute_plane(plane, order), 0))
    return builder, roots


def render_dual_bdd_verilog(case, module, half_outputs, width, order_name, order):
    half_width = width - 1
    builder, roots = build_bdd(half_outputs, half_width, width, order)
    lines = [
        "module {0}(in, out);".format(module),
        "  input {0}in;".format(range_decl(width)),
        "  output {0}out;".format(range_decl(width)),
        "  wire dual = in[{0}];".format(width - 1),
        "  wire {0}rep;".format(range_decl(half_width)),
    ]
    for bit in range(half_width):
        lines.append("  assign rep[{0}] = dual ? ~in[{0}] : in[{0}];".format(bit))
    for node in builder.nodes:
        lines.append(
            "  wire n_{0} = rep[{1}] ? {2} : {3};".format(
                node["id"],
                node["var"],
                edge_expr(node["high"]),
                edge_expr(node["low"]),
            )
        )
    lines.append("  wire {0}base_out;".format(range_decl(width)))
    for bit, root in enumerate(roots):
        lines.append("  assign base_out[{0}] = {1};".format(bit, edge_expr(root)))
    for bit in range(width):
        lines.append(
            "  assign out[{0}] = dual ? ~base_out[{1}] : base_out[{0}];".format(
                bit, width - 1 - bit
            )
        )
    lines.append("endmodule")
    lines.append("")

    def model(index):
        low_mask = (1 << half_width) - 1
        if (index >> (width - 1)) & 1:
            rep = (~index) & low_mask
            memo = {}
            base = 0
            for bit, root in enumerate(roots):
                if builder.eval_edge(root, rep, memo):
                    base |= 1 << bit
            return ((1 << width) - 1) ^ reverse_bits(base, width)
        memo = {}
        out = 0
        for bit, root in enumerate(roots):
            if builder.eval_edge(root, index & low_mask, memo):
                out |= 1 << bit
        return out

    items = "duality=f(~x)=~reverse(f(x)); half_width={0}; order={1}; bdd_nodes={2}".format(
        half_width,
        ":".join(str(item) for item in order),
        len(builder.nodes),
    )
    return "\n".join(lines), items, model


def verify_model(outputs, model):
    for index, expected in enumerate(outputs):
        actual = model(index)
        if actual != expected:
            return False, "first mismatch index=0x{0:x} expected=0x{1:x} actual=0x{2:x}".format(
                index, expected, actual
            )
    return True, "exact duality half-BDD model over {0} inputs".format(len(outputs))


def best_rows(rows):
    best = []
    for case in sorted(set(row["case"] for row in rows)):
        valid = [row for row in rows if row["equivalent"] == "1" and row["adp"]]
        if valid:
            item = min(valid, key=lambda row: int(row["adp"]))
            best.append({name: item.get(name, "") for name in BEST_FIELDNAMES})
    return best


def run_case(args, case):
    truth_path = args.benchmarks / "{0}.truth".format(case)
    table = TruthTable(truth_path)
    outputs = list(table.iter_outputs())
    ok, note = verify_duality(outputs, table.input_width)
    rows = []
    manifest = {
        "case": case,
        "duality": note,
        "input_width": table.input_width,
        "output_width": table.output_width,
        "orders": [],
    }
    if not ok or table.input_width != table.output_width:
        return rows, manifest
    half_outputs = build_half_outputs(outputs, table.input_width)
    label = "unknown_duality_half_bdd"
    case_dir = args.work_dir / case
    for order_name, order in args.orders:
        if len(order) != table.input_width - 1:
            continue
        candidate_id = "{0}_{1}_{2}".format(case, label, order_name)
        verilog_path = case_dir / "verilog" / "{0}.v".format(candidate_id)
        aig_path = case_dir / "aigs" / "{0}.aig".format(candidate_id)
        script_path = case_dir / "logs" / "{0}.ys".format(candidate_id)
        log_path = case_dir / "logs" / "{0}.yosys.log".format(candidate_id)
        row = {
            "case": case,
            "candidate_id": candidate_id,
            "hypothesis": label,
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
        start = time.time()
        try:
            verilog, items, model = render_dual_bdd_verilog(
                case, candidate_id, half_outputs, table.input_width, order_name, order
            )
            row["items"] = items
            verified, verify_note = verify_model(outputs, model)
            row["verified_truth"] = "1" if verified else "0"
            row["notes"] = verify_note
            write_text(verilog_path, verilog)
            if verified:
                yosys_log = synthesize_verilog(
                    verilog=verilog_path,
                    module=candidate_id,
                    output=aig_path,
                    yosys=args.yosys,
                    timeout=args.timeout,
                    use_abc=True,
                    script_out=script_path,
                )
                write_text(log_path, yosys_log)
                row["synthesized"] = "1"
                evaluated = evaluate_aig(
                    case=case,
                    candidate_id=candidate_id,
                    parent_id=label,
                    source="ai_verilog",
                    tool_chain="yosys_duality_half_bdd",
                    aig_path=aig_path,
                    truth=truth_path,
                    abc=args.abc,
                    notes="unknown duality half-BDD Verilog seed",
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
        manifest["orders"].append(row)
        print("{0} {1} eq={2} area={3} delay={4} adp={5}".format(
            case, order_name, row["equivalent"], row["area"], row["delay"], row["adp"]
        ))
    return rows, manifest


def parse_args(argv):
    parser = argparse.ArgumentParser()
    parser.add_argument("--cases", type=parse_cases, default=parse_cases("ex289"))
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--work-dir", type=Path, required=True)
    parser.add_argument("--results", type=Path, required=True)
    parser.add_argument("--best-results", type=Path, required=True)
    parser.add_argument("--abc", type=Path, default=ROOT / "student" / "abc")
    parser.add_argument("--yosys", type=Path, default=ROOT / "student" / "tools" / "conda-env" / "bin" / "yosys")
    parser.add_argument("--timeout", type=int, default=900)
    parser.add_argument(
        "--orders",
        type=parse_orders,
        default=parse_orders(
            "0:1:2:3:4:5:6:7:8:9:10:11:12:13:14,"
            "14:13:12:11:10:9:8:7:6:5:4:3:2:1:0,"
            "0:14:1:13:2:12:3:11:4:10:5:9:6:8:7,"
            "0:1:12:13:2:14:3:11:4:5:6:7:8:9:10"
        ),
    )
    return parser.parse_args(argv)


def main(argv=None):
    args = parse_args(argv)
    all_rows = []
    manifests = {}
    for case in args.cases:
        rows, manifest = run_case(args, case)
        all_rows.extend(rows)
        manifests[case] = manifest
    write_csv(args.results, ALL_FIELDNAMES, all_rows)
    write_csv(args.best_results, BEST_FIELDNAMES, best_rows(all_rows))
    write_text(args.work_dir / "manifest.json", json.dumps(manifests, indent=2, sort_keys=True) + "\n")
    return 0 if best_rows(all_rows) else 1


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
