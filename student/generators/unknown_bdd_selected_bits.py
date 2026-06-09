#!/usr/bin/env python3
"""Generate shared-BDD RTL with low-support output bits replaced by small LUTs."""

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
    const_word,
    parse_cases,
    range_decl,
    text_hash,
    write_csv,
    write_text,
)


def interleave_order(width):
    order = []
    for index in range((width + 1) // 2):
        other = width - 1 - index
        order.append(index)
        if other != index:
            order.append(other)
    return order


def support_for_bit(outputs, bit, width):
    support = []
    for var in range(width):
        mask = 1 << var
        depends = False
        for index in range(1 << width):
            if ((outputs[index] >> bit) ^ (outputs[index ^ mask] >> bit)) & 1:
                depends = True
                break
        if depends:
            support.append(var)
    return support


def selected_bits(outputs, output_width, input_width, limit):
    out = []
    for bit in range(output_width):
        support = support_for_bit(outputs, bit, input_width)
        if 0 < len(support) <= limit:
            out.append((bit, support))
    return out


def key_value(index, support):
    value = 0
    for pos, var in enumerate(support):
        if (index >> var) & 1:
            value |= 1 << pos
    return value


def lut_expr_lines(outputs, bit, support, signal):
    counts = {0: 0, 1: 0}
    table = {}
    for key in range(1 << len(support)):
        value = 0
        for index, expected in enumerate(outputs):
            if key_value(index, support) == key:
                value = (expected >> bit) & 1
                break
        table[key] = value
        counts[value] += 1
    default = 1 if counts[1] > counts[0] else 0
    exceptions = [key for key, value in table.items() if value != default]
    key_width = len(support)
    key_expr = "{" + ", ".join("in[{0}]".format(var) for var in reversed(support)) + "}"
    lines = [
        "  reg {0};".format(signal),
        "  always @* begin",
        "    {0} = 1'b{1};".format(signal, default),
        "    case ({0})".format(key_expr),
    ]
    for key in exceptions:
        lines.append("      {0}: {1} = 1'b{2};".format(const_word(key_width, key), signal, 1 - default))
    lines.extend(["      default: begin end", "    endcase", "  end"])
    return lines, default, len(exceptions), table


def render(outputs, module, input_width, output_width, support_limit):
    order = interleave_order(input_width)
    selected = selected_bits(outputs, output_width, input_width, support_limit)
    selected_by_bit = {bit: support for bit, support in selected}
    builder = SharedBddBuilder(order)
    roots = {}
    for bit in range(output_width):
        if bit in selected_by_bit:
            continue
        roots[bit] = builder.build(permute_plane(plane_for_outputs(outputs, bit), order), 0)

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
    lut_items = []
    lut_tables = {}
    for bit, support in selected:
        signal = "sel_bit_{0}".format(bit)
        lut_lines, default, exceptions, table = lut_expr_lines(outputs, bit, support, signal)
        lines.extend(lut_lines)
        lut_tables[bit] = table
        lut_items.append(
            "bit{0}:support={1}:default={2}:exceptions={3}".format(
                bit,
                ":".join(str(item) for item in support),
                default,
                exceptions,
            )
        )
    for bit in range(output_width):
        if bit in selected_by_bit:
            lines.append("  assign out[{0}] = sel_bit_{0};".format(bit))
        else:
            lines.append("  assign out[{0}] = {1};".format(bit, edge_expr(roots[bit])))
    lines.append("endmodule")
    lines.append("")

    def model(index):
        value = 0
        memo = {}
        for bit in range(output_width):
            if bit in selected_by_bit:
                support = selected_by_bit[bit]
                key = key_value(index, support)
                bit_value = lut_tables[bit][key]
            else:
                bit_value = builder.eval_edge(roots[bit], index, memo)
            if bit_value:
                value |= 1 << bit
        return value

    items = "support_limit={0}; selected_bits={1}; bdd_nodes={2}; {3}".format(
        support_limit,
        ":".join(str(bit) for bit, _ in selected),
        len(builder.nodes),
        "; ".join(lut_items),
    )
    return "\n".join(lines), items, model


def verify_outputs(outputs, model):
    for index, expected in enumerate(outputs):
        actual = model(index)
        if actual != expected:
            return False, "first mismatch index={0} expected=0x{1:x} actual=0x{2:x}".format(index, expected, actual)
    return True, "exact selected-bit BDD model over {0} inputs".format(len(outputs))


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
    for support_limit in args.support_limits:
        candidate_id = "{0}_unknown_bdd_selected_support{1}".format(case, support_limit)
        module = candidate_id
        verilog_path = args.work_dir / case / "verilog" / "{0}.v".format(candidate_id)
        aig_path = args.work_dir / case / "aigs" / "{0}.aig".format(candidate_id)
        script_path = args.work_dir / case / "logs" / "{0}.ys".format(candidate_id)
        log_path = args.work_dir / case / "logs" / "{0}.yosys.log".format(candidate_id)
        start = time.time()
        row = {
            "case": case,
            "candidate_id": candidate_id,
            "hypothesis": "unknown_bdd_selected_bits",
            "variant": "support{0}".format(support_limit),
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
            verilog, items, model = render(outputs, module, table.input_width, table.output_width, support_limit)
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
                    parent_id="unknown_bdd_selected_bits",
                    source="ai_verilog",
                    tool_chain="yosys_unknown_bdd_selected_bits",
                    aig_path=aig_path,
                    truth=truth_path,
                    abc=args.abc,
                    notes="unknown shared-BDD with selected low-support LUT bits",
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
        print("{0} support{1} eq={2} area={3} delay={4} adp={5}".format(case, support_limit, row["equivalent"], row["area"], row["delay"], row["adp"]), flush=True)
    return rows


def parse_limits(text):
    return [int(item.strip()) for item in text.split(",") if item.strip()]


def parse_args(argv=None):
    parser = argparse.ArgumentParser(description="Generate selected-bit shared-BDD candidates.")
    parser.add_argument("--cases", type=parse_cases, default=parse_cases("ex280-ex284"))
    parser.add_argument("--support-limits", type=parse_limits, default=parse_limits("8,10"))
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
    manifest = {"cases": args.cases, "support_limits": args.support_limits, "rows": []}
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
