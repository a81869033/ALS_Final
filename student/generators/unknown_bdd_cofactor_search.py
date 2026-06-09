#!/usr/bin/env python3
"""Generate exact cofactor-BDD Verilog seeds for unknown functions."""

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
    permute_plane,
    plane_for_outputs,
)
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


VARIANTS = (
    "low1",
    "high1",
    "center1",
    "low2",
    "high2",
    "center2",
)


def parse_variant_list(value):
    variants = []
    seen = set()
    valid = set(VARIANTS)
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


def interleave_order(width):
    order = []
    for index in range((width + 1) // 2):
        other = width - 1 - index
        order.append(index)
        if other != index:
            order.append(other)
    return order


def outer_bits_for_variant(width, variant):
    count = int(variant[-1])
    if variant.startswith("low"):
        return list(range(count))
    if variant.startswith("high"):
        return list(range(width - count, width))
    if variant.startswith("center"):
        start = (width - count) // 2
        return list(range(start, start + count))
    raise RuntimeError("unknown variant: {0}".format(variant))


def compact_inner_values(outputs, width, outer_bits, outer_value):
    inner_bits = [bit for bit in range(width) if bit not in outer_bits]
    values = []
    for inner_value in range(1 << len(inner_bits)):
        index = 0
        for pos, bit in enumerate(inner_bits):
            if (inner_value >> pos) & 1:
                index |= 1 << bit
        for pos, bit in enumerate(outer_bits):
            if (outer_value >> pos) & 1:
                index |= 1 << bit
        values.append(outputs[index])
    return values, inner_bits


def build_group_bdd(values, input_width, output_width, order):
    builder = SharedBddBuilder(order)
    roots = []
    for bit in range(output_width):
        roots.append(builder.build(permute_plane(plane_for_outputs(values, bit), order), 0))
    return builder, roots


def prefixed_edge_expr(edge, prefix):
    node_id, inv = edge
    if node_id == 0:
        return "1'b1" if inv else "1'b0"
    name = "{0}n_{1}".format(prefix, node_id)
    return "~{0}".format(name) if inv else name


def emit_group(lines, outputs, input_width, output_width, outer_bits, outer_value, group_name):
    values, inner_bits = compact_inner_values(outputs, input_width, outer_bits, outer_value)
    order = [inner_bits.index(bit) for bit in interleave_order(input_width) if bit in inner_bits]
    builder, roots = build_group_bdd(values, len(inner_bits), output_width, order)
    prefix = "{0}_".format(group_name)
    lines.append("  wire {0}{1};".format(range_decl(output_width), group_name))
    for node in builder.nodes:
        lines.append(
            "  wire {0}n_{1} = inner_key[{2}] ? {3} : {4};".format(
                prefix,
                node["id"],
                node["var"],
                prefixed_edge_expr(node["high"], prefix),
                prefixed_edge_expr(node["low"], prefix),
            )
        )
    for bit, root in enumerate(roots):
        lines.append("  assign {0}[{1}] = {2};".format(group_name, bit, prefixed_edge_expr(root, prefix)))
    return len(builder.nodes), builder, roots


def outer_key_expr(outer_bits):
    if len(outer_bits) == 1:
        return "in[{0}]".format(outer_bits[0])
    return "{" + ", ".join("in[{0}]".format(bit) for bit in reversed(outer_bits)) + "}"


def render(outputs, module, input_width, output_width, variant):
    outer_bits = outer_bits_for_variant(input_width, variant)
    inner_bits = [bit for bit in range(input_width) if bit not in outer_bits]
    lines = [
        "module {0}(in, out);".format(module),
        "  input {0}in;".format(range_decl(input_width)),
        "  output {0}out;".format(range_decl(output_width)),
        "  wire {0}inner_key;".format(range_decl(len(inner_bits))),
    ]
    for pos, bit in enumerate(inner_bits):
        lines.append("  assign inner_key[{0}] = in[{1}];".format(pos, bit))
    if len(outer_bits) == 1:
        lines.append("  wire outer_key = {0};".format(outer_key_expr(outer_bits)))
    else:
        lines.append("  wire {0}outer_key = {1};".format(range_decl(len(outer_bits)), outer_key_expr(outer_bits)))

    group_nodes = []
    group_models = []
    for outer_value in range(1 << len(outer_bits)):
        group_name = "g_{0}".format(outer_value)
        nodes, builder, roots = emit_group(
            lines,
            outputs,
            input_width,
            output_width,
            outer_bits,
            outer_value,
            group_name,
        )
        group_nodes.append(nodes)
        group_models.append((builder, roots))

    expr = "g_0"
    for outer_value in range(1, 1 << len(outer_bits)):
        compare = "outer_key" if len(outer_bits) == 1 else "outer_key == {0}'d{1}".format(len(outer_bits), outer_value)
        expr = "({0}) ? g_{1} : {2}".format(compare, outer_value, expr)
    lines.append("  assign out = {0};".format(expr))
    lines.append("endmodule")
    lines.append("")

    def model(index):
        outer_value = 0
        for pos, bit in enumerate(outer_bits):
            if (index >> bit) & 1:
                outer_value |= 1 << pos
        inner_value = 0
        for pos, bit in enumerate(inner_bits):
            if (index >> bit) & 1:
                inner_value |= 1 << pos
        builder, roots = group_models[outer_value]
        value = 0
        memo = {}
        for bit, root in enumerate(roots):
            if builder.eval_edge(root, inner_value, memo):
                value |= 1 << bit
        return value

    items = "outer_bits={0}; inner_bits={1}; group_bdd_nodes={2}; total_group_bdd_nodes={3}".format(
        ":".join(str(bit) for bit in outer_bits),
        ":".join(str(bit) for bit in inner_bits),
        ":".join(str(count) for count in group_nodes),
        sum(group_nodes),
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
    return True, "exact cofactor-BDD model over {0} inputs".format(len(outputs))


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
    rows = []
    manifest = {
        "case": case,
        "truth": str(truth_path),
        "input_width": table.input_width,
        "output_width": table.output_width,
        "hypothesis": "unknown_cofactor_bdd",
        "variants": [],
    }
    for variant in args.variants:
        candidate_id = "{0}_unknown_cofactor_bdd_{1}".format(case, variant)
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
            "hypothesis": "unknown_cofactor_bdd",
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
            verilog, items, model = render(outputs, module, table.input_width, table.output_width, variant)
            digest = text_hash(verilog)
            if digest in dedupe_hashes or digest in new_hashes:
                continue
            new_hashes.add(digest)
            row["items"] = "{0}; hash={1}".format(items, digest[:12])
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
                    parent_id="unknown_cofactor_bdd",
                    source="ai_verilog",
                    tool_chain="yosys_unknown_cofactor_bdd_{0}".format(variant),
                    aig_path=aig_path,
                    truth=truth_path,
                    abc=args.abc,
                    notes="unknown function cofactor-BDD Verilog seed",
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
    parser = argparse.ArgumentParser(description="Generate exact cofactor-BDD Verilog candidates.")
    parser.add_argument("--cases", type=parse_cases, default=parse_cases("ex281-ex284"))
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--work-dir", type=Path, default=ROOT / "student" / "work" / "unknown_bdd_cofactor")
    parser.add_argument("--results", type=Path, default=ROOT / "student" / "results" / "unknown_bdd_cofactor.csv")
    parser.add_argument("--best-results", type=Path, default=ROOT / "student" / "results" / "unknown_bdd_cofactor_best.csv")
    parser.add_argument("--abc", type=Path, default=ROOT / "student" / "abc")
    parser.add_argument("--yosys", type=Path, default=ROOT / "student" / "tools" / "conda-env" / "bin" / "yosys")
    parser.add_argument("--timeout", type=int, default=900)
    parser.add_argument("--no-yosys-abc", action="store_true")
    parser.add_argument("--dedupe-current", type=Path, action="append", default=[])
    parser.add_argument("--variants", type=parse_variant_list, default=parse_variant_list("low1,high1,center1"))
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
            ),
            flush=True,
        )

    write_csv(args.results, ALL_FIELDNAMES, rows)
    best = best_rows(rows)
    write_csv(args.best_results, BEST_FIELDNAMES, best)
    print("Results: {0}".format(args.results))
    print("Best: {0}".format(args.best_results))
    print("Rows: {0}".format(len(rows)))
    print("Best cases: {0}/{1}".format(len(best), len(args.cases)))
    return 0 if len(best) == len(args.cases) else 1


if __name__ == "__main__":
    raise SystemExit(main())
