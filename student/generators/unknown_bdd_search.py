#!/usr/bin/env python3
"""Generate exact shared-BDD Verilog seeds for unknown functions."""

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
from student.generators.unknown_verilog_search import (
    ALL_FIELDNAMES,
    BEST_FIELDNAMES,
    load_dedupe,
    parse_cases,
    range_decl,
    text_hash,
    write_csv,
    write_text,
)


ORDER_PRESETS = {
    "natural": list(range(12)),
    "reverse": list(reversed(range(12))),
    "ex280_sift_449": [11, 0, 1, 10, 2, 9, 3, 8, 4, 6, 7, 5],
    "ex280_sift_alt": [0, 11, 1, 10, 2, 9, 3, 8, 4, 6, 7, 5],
    "nibble_interleave": [0, 4, 8, 1, 5, 9, 2, 6, 10, 3, 7, 11],
    "half_interleave": [0, 6, 1, 7, 2, 8, 3, 9, 4, 10, 5, 11],
}


def parse_order_list(value):
    orders = []
    seen = set()
    for item in value.split(","):
        item = item.strip()
        if not item:
            continue
        if item in ORDER_PRESETS:
            name = item
            order = ORDER_PRESETS[item]
        else:
            parts = [int(part) for part in item.split(":") if part.strip()]
            if sorted(parts) != list(range(len(parts))):
                raise argparse.ArgumentTypeError("invalid order: {0}".format(item))
            name = "order_" + "_".join(str(part) for part in parts)
            order = parts
        if name not in seen:
            orders.append((name, list(order)))
            seen.add(name)
    if not orders:
        raise argparse.ArgumentTypeError("empty order list")
    return orders


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


def edge_expr(edge):
    node_id, inv = edge
    if node_id == 0:
        return "1'b1" if inv else "1'b0"
    name = "n_{0}".format(node_id)
    return "~{0}".format(name) if inv else name


class SharedBddBuilder(object):
    def __init__(self, order):
        self.order = list(order)
        self.memo = {}
        self.nodes = []

    def build(self, vec, level):
        zero_count = vec.count(0)
        if zero_count == len(vec):
            return (0, 0)
        if zero_count == 0:
            return (0, 1)

        inv = 0
        comp = invert_bytes(vec)
        if comp < vec:
            vec = comp
            inv = 1

        key = (level, vec)
        if key in self.memo:
            return (self.memo[key], inv)

        half = len(vec) // 2
        low = self.build(vec[:half], level + 1)
        high = self.build(vec[half:], level + 1)
        if low == high:
            return (low[0], low[1] ^ inv)

        node_id = len(self.nodes) + 1
        self.memo[key] = node_id
        self.nodes.append(
            {
                "id": node_id,
                "var": self.order[level],
                "low": low,
                "high": high,
            }
        )
        return (node_id, inv)

    def eval_edge(self, edge, index, memo):
        node_id, inv = edge
        if node_id == 0:
            value = inv
        elif node_id in memo:
            value = memo[node_id]
        else:
            node = self.nodes[node_id - 1]
            child = node["high"] if ((index >> node["var"]) & 1) else node["low"]
            value = self.eval_edge(child, index, memo)
            memo[node_id] = value
        return value ^ inv if node_id != 0 else value


def build_bdd(outputs, input_width, output_width, order):
    if len(order) != input_width or sorted(order) != list(range(input_width)):
        raise RuntimeError("order does not match input width: {0}".format(order))
    builder = SharedBddBuilder(order)
    roots = []
    for bit in range(output_width):
        plane = plane_for_outputs(outputs, bit)
        roots.append(builder.build(permute_plane(plane, order), 0))
    return builder, roots


def render_bdd_verilog(outputs, module, input_width, output_width, order_name, order):
    builder, roots = build_bdd(outputs, input_width, output_width, order)
    lines = [
        "module {0}(in, out);".format(module),
        "  input {0}in;".format(range_decl(input_width)),
        "  output {0}out;".format(range_decl(output_width)),
    ]
    for node in builder.nodes:
        lines.append(
            "  wire n_{0} = in[{1}] ? {2} : {3};".format(
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
        value = 0
        memo = {}
        for bit, root in enumerate(roots):
            if builder.eval_edge(root, index, memo):
                value |= 1 << bit
        return value

    items = "order_name={0}; order={1}; bdd_nodes={2}".format(
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
    return True, "exact shared-BDD model over {0} inputs".format(len(outputs))


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
    outputs = list(table.iter_outputs())
    paths = case_output_paths(args, case)
    label = "unknown_shared_bdd_{0}x{1}".format(table.input_width, table.output_width)
    rows = []
    manifest = {
        "case": case,
        "truth": str(truth_path),
        "input_width": table.input_width,
        "output_width": table.output_width,
        "hypothesis": label,
        "orders": [],
    }

    for order_name, order in args.orders:
        if len(order) != table.input_width:
            continue
        print("{0}: start {1}".format(case, order_name), flush=True)
        candidate_id = "{0}_{1}_{2}".format(case, label, order_name)
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
            verilog, items, model = render_bdd_verilog(
                outputs,
                module,
                table.input_width,
                table.output_width,
                order_name,
                order,
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
                    tool_chain="yosys_unknown_shared_bdd_{0}".format(order_name),
                    aig_path=aig_path,
                    truth=truth_path,
                    abc=args.abc,
                    notes="unknown function shared-BDD Verilog seed",
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
    parser = argparse.ArgumentParser(description="Generate exact shared-BDD Verilog candidates.")
    parser.add_argument("--cases", type=parse_cases, default=parse_cases("ex280"))
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--work-dir", type=Path, default=ROOT / "student" / "work" / "reverse_unknown_bdd")
    parser.add_argument("--results", type=Path, default=ROOT / "student" / "results" / "unknown_bdd.csv")
    parser.add_argument("--best-results", type=Path, default=ROOT / "student" / "results" / "unknown_bdd_best.csv")
    parser.add_argument("--abc", type=Path, default=ROOT / "student" / "abc")
    parser.add_argument("--yosys", type=Path, default=ROOT / "student" / "tools" / "conda-env" / "bin" / "yosys")
    parser.add_argument("--timeout", type=int, default=900)
    parser.add_argument("--no-yosys-abc", action="store_true")
    parser.add_argument("--emit-only", action="store_true")
    parser.add_argument("--dedupe-current", type=Path, action="append", default=[])
    parser.add_argument("--orders", type=parse_order_list, default=parse_order_list("ex280_sift_449,ex280_sift_alt,natural"))
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
            "{0}: generated={1} verified_truth={2} equivalent={3}".format(
                case,
                len(case_rows),
                sum(row["verified_truth"] == "1" for row in case_rows),
                sum(row["equivalent"] == "1" for row in case_rows),
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
