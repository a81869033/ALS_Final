#!/usr/bin/env python3
"""Pair-count multi-valued decision diagrams for popcount-preserving unknowns."""

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
from student.generators.unknown_symmetry_bdd import parse_pairs, verify_pair_symmetry
from student.generators.unknown_verilog_search import (
    ALL_FIELDNAMES,
    BEST_FIELDNAMES,
    parse_cases,
    range_decl,
    text_hash,
    write_csv,
    write_text,
)


def parse_list(text):
    return [item.strip() for item in text.split(",") if item.strip()]


def pair_count_key(index, width, pairs):
    paired = set()
    values = []
    for a, b in pairs:
        values.append(((index >> a) & 1) + ((index >> b) & 1))
        paired.add(a)
        paired.add(b)
    for bit in range(width):
        if bit not in paired:
            values.append((index >> bit) & 1)
    return tuple(values)


def domains(width, pairs):
    paired = set(bit for pair in pairs for bit in pair)
    out = [3 for _pair in pairs]
    out.extend(2 for bit in range(width) if bit not in paired)
    return out


def order_for_style(width, pairs, style):
    pair_vars = list(range(len(pairs)))
    single_vars = list(range(len(pairs), len(domains(width, pairs))))
    if style == "pairs_first":
        return pair_vars + single_vars
    if style == "singles_first":
        return single_vars + pair_vars
    if style == "interleave":
        out = []
        max_len = max(len(pair_vars), len(single_vars))
        for i in range(max_len):
            if i < len(single_vars):
                out.append(single_vars[i])
            if i < len(pair_vars):
                out.append(pair_vars[i])
        return out
    if style == "reverse":
        return list(reversed(pair_vars + single_vars))
    raise RuntimeError("unknown order style: {0}".format(style))


class MddBuilder:
    def __init__(self, domains, order):
        self.domains = domains
        self.order = order
        self.unique = {}
        self.nodes = []

    def make_node(self, depth, children):
        first = children[0]
        if all(child == first for child in children):
            return first
        key = (depth, tuple(children))
        old = self.unique.get(key)
        if old is not None:
            return old
        node_id = len(self.nodes) + 2
        self.unique[key] = node_id
        self.nodes.append({"id": node_id, "depth": depth, "var": self.order[depth], "children": tuple(children)})
        return node_id

    def build(self, table, depth=0):
        values = set(table.values())
        if len(values) == 1:
            return next(iter(values))
        if depth >= len(self.order):
            raise RuntimeError("conflicting leaf after all variables")
        var = self.order[depth]
        children = []
        for val in range(self.domains[var]):
            child_table = {key: out for key, out in table.items() if key[var] == val}
            if not child_table:
                child_table = {(): 0}
            children.append(self.build(child_table, depth + 1))
        return self.make_node(depth, children)


def edge_expr(edge):
    if edge == 0:
        return "1'b0"
    if edge == 1:
        return "1'b1"
    return "mdd_n_{0}".format(edge)


def emit_verilog(module, input_width, output_width, pairs, order_style, builder, roots):
    lines = [
        "module {0}(in, out);".format(module),
        "  input {0}in;".format(range_decl(input_width)),
        "  output {0}out;".format(range_decl(output_width)),
    ]
    paired = set()
    for idx, (a, b) in enumerate(pairs):
        lines.append("  wire [1:0] pc_{0} = {{1'b0, in[{1}]}} + {{1'b0, in[{2}]}};".format(idx, a, b))
        paired.add(a)
        paired.add(b)
    single_index = 0
    for bit in range(input_width):
        if bit not in paired:
            lines.append("  wire s_{0} = in[{1}];".format(single_index, bit))
            single_index += 1

    def var_expr(var):
        if var < len(pairs):
            return "pc_{0}".format(var)
        return "s_{0}".format(var - len(pairs))

    for node in builder.nodes:
        var = node["var"]
        children = node["children"]
        if builder.domains[var] == 2:
            expr = "({0} ? {1} : {2})".format(var_expr(var), edge_expr(children[1]), edge_expr(children[0]))
        else:
            expr = "({0} == 2'd2 ? {1} : ({0} == 2'd1 ? {2} : {3}))".format(
                var_expr(var),
                edge_expr(children[2]),
                edge_expr(children[1]),
                edge_expr(children[0]),
            )
        lines.append("  wire mdd_n_{0} = {1};".format(node["id"], expr))
    for bit, root in sorted(roots.items()):
        lines.append("  assign out[{0}] = {1};".format(bit, edge_expr(root)))
    lines.append("endmodule")
    lines.append("")
    items = "pairs={0}; order_style={1}; mdd_nodes={2}; order={3}; hash_pending=1".format(
        ",".join("{0}:{1}".format(a, b) for a, b in pairs),
        order_style,
        len(builder.nodes),
        ":".join(str(item) for item in builder.order),
    )
    return "\n".join(lines), items


def verify_outputs(outputs, width, pairs, roots, builder):
    node_by_id = {node["id"]: node for node in builder.nodes}

    def eval_edge(edge, key):
        if edge < 2:
            return edge
        node = node_by_id[edge]
        return eval_edge(node["children"][key[node["var"]]], key)

    for index, expected in enumerate(outputs):
        key = pair_count_key(index, width, pairs)
        actual = 0
        for bit, root in roots.items():
            if eval_edge(root, key):
                actual |= 1 << bit
        if actual != expected:
            return False, "first mismatch index={0} expected=0x{1:x} actual=0x{2:x}".format(index, expected, actual)
    return True, "exact pair-count MDD model"


def best_rows(rows):
    best = []
    for case in sorted(set(row["case"] for row in rows)):
        valid = [row for row in rows if row["case"] == case and row.get("equivalent") == "1" and row.get("adp")]
        if valid:
            item = min(valid, key=lambda row: int(row["adp"]))
            best.append({name: item.get(name, "") for name in BEST_FIELDNAMES})
    return best


def run_case(args, case):
    truth_path = args.benchmarks / "{0}.truth".format(case)
    table = TruthTable(truth_path)
    outputs = list(table.iter_outputs())
    ok, note = verify_pair_symmetry(outputs, table.input_width, args.pairs)
    if not ok:
        raise RuntimeError("{0}: {1}".format(case, note))
    rows = []
    manifest = {"case": case, "variants": []}
    key_to_output = {}
    for index, output in enumerate(outputs):
        key = pair_count_key(index, table.input_width, args.pairs)
        old = key_to_output.get(key)
        if old is None:
            key_to_output[key] = output
        elif old != output:
            raise RuntimeError("{0}: pair-count key conflict".format(case))
    doms = domains(table.input_width, args.pairs)
    for order_style in args.orders:
        start = time.time()
        candidate_id = "{0}_unknown_paircount_mdd_{1}".format(case, order_style)
        verilog_path = args.work_dir / case / "verilog" / "{0}.v".format(candidate_id)
        aig_path = args.work_dir / case / "aigs" / "{0}.aig".format(candidate_id)
        script_path = args.work_dir / case / "logs" / "{0}.ys".format(candidate_id)
        log_path = args.work_dir / case / "logs" / "{0}.yosys.log".format(candidate_id)
        row = {
            "case": case,
            "candidate_id": candidate_id,
            "hypothesis": "unknown_paircount_mdd",
            "variant": order_style,
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
            "notes": note,
        }
        try:
            order = order_for_style(table.input_width, args.pairs, order_style)
            builder = MddBuilder(doms, order)
            roots = {}
            for bit in range(table.output_width):
                bit_table = {key: (value >> bit) & 1 for key, value in key_to_output.items()}
                roots[bit] = builder.build(bit_table)
            verified, verify_note = verify_outputs(outputs, table.input_width, args.pairs, roots, builder)
            row["verified_truth"] = "1" if verified else "0"
            row["notes"] = verify_note
            verilog, items = emit_verilog(candidate_id, table.input_width, table.output_width, args.pairs, order_style, builder, roots)
            row["items"] = "{0}; hash={1}".format(items, text_hash(verilog)[:12])
            write_text(verilog_path, verilog)
            if verified:
                yosys_log = synthesize_verilog(
                    verilog=verilog_path,
                    module=candidate_id,
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
                    parent_id="unknown_paircount_mdd",
                    source="ai_verilog",
                    tool_chain="yosys_paircount_mdd",
                    aig_path=aig_path,
                    truth=truth_path,
                    abc=args.abc,
                    notes="pair-count multi-valued decision diagram",
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
        print("{0} {1} verified={2} eq={3} area={4} delay={5} adp={6}".format(
            case, order_style, row["verified_truth"], row["equivalent"], row["area"], row["delay"], row["adp"]
        ), flush=True)
    write_text(args.work_dir / case / "manifest.json", json.dumps(manifest, indent=2, sort_keys=True) + "\n")
    return rows


def write_manifest(path, args, rows):
    best = best_rows(rows)
    text = """# {0}

Run ID: `{0}`

Purpose: Test pair-count multi-valued decision diagrams for symmetry-pair
unknown cases. This treats each exact input symmetry pair as a 0/1/2 variable
instead of encoding it as binary OR/AND key bits.

Inputs:
- Truth files: {1}
- Generator: `student/generators/unknown_paircount_mdd_search.py`
- Pairs: `{2}`

Artifacts:
- Work directory: `{3}`
- Results directory: `{4}`

Methods tried:
- Orders: `{5}`

Best result:
- See `results/best.csv`.

Notes:
- `student/seeds` and `output/` are intentionally untouched.
""".format(
        args.run_id,
        ", ".join("benchmarks/{0}.truth".format(case) for case in args.cases),
        ",".join("{0}:{1}".format(a, b) for a, b in args.pairs),
        args.work_dir,
        path.parent / "results",
        ",".join(args.orders),
    )
    path.write_text(text)


def parse_args(argv=None):
    parser = argparse.ArgumentParser()
    parser.add_argument("--cases", type=parse_cases, required=True)
    parser.add_argument("--pairs", type=parse_pairs, required=True)
    parser.add_argument("--orders", type=parse_list, default=parse_list("pairs_first,interleave,singles_first,reverse"))
    parser.add_argument("--run-id", required=True)
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--work-dir", type=Path, required=True)
    parser.add_argument("--results", type=Path, required=True)
    parser.add_argument("--best-results", type=Path, required=True)
    parser.add_argument("--summary-results", type=Path, required=True)
    parser.add_argument("--evaluate-check", type=Path, required=True)
    parser.add_argument("--yosys", type=Path, default=ROOT / "student" / "tools" / "conda-env" / "bin" / "yosys")
    parser.add_argument("--abc", type=Path, default=ROOT / "student" / "abc")
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
    summary_rows = []
    for case in sorted(set(row["case"] for row in rows)):
        cr = [row for row in rows if row["case"] == case]
        eq = [row for row in cr if row.get("equivalent") == "1" and row.get("adp")]
        summary_rows.append({
            "case": case,
            "rows": str(len(cr)),
            "verified": str(sum(row.get("verified_truth") == "1" for row in cr)),
            "equivalent": str(len(eq)),
            "best_adp": "" if not eq else str(min(int(row["adp"]) for row in eq)),
        })
    write_csv(args.summary_results, ["case", "rows", "verified", "equivalent", "best_adp"], summary_rows)
    eval_fields = ["case", "candidate_id", "equivalent", "area", "delay", "adp", "notes"]
    write_csv(args.evaluate_check, eval_fields, [{name: row.get(name, "") for name in eval_fields} for row in rows])
    write_manifest(args.results.parent.parent / "MANIFEST.md", args, rows)
    print("Results: {0}".format(args.results))
    print("Rows: {0}".format(len(rows)))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
