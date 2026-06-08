#!/usr/bin/env python3
"""Packed high-vector open structures for ex235/ex237/ex239.

The earlier open-structure generator emitted one run tree per high output bit.
For reciprocal-sqrt/cbrt/reciprocal-cbrt the high bits change at strongly
shared mantissa boundaries, so a packed vector run tree can reuse the same
comparators and emit all high bits together.
"""

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
from student.frontends.yosys_synth import SynthError, run_command
from student.generators.fp16_ex235_ex239_open_structures import (
    CASE_CONFIG,
    active_condition,
    render_class_logic,
    render_low_nested,
    render_special_table,
)
from student.generators.fp16_semantic_search import (
    BEST_FIELDNAMES,
    RESULT_FIELDNAMES,
    add_reference_columns,
    const_word,
    load_reference,
    rel_path,
    write_csv,
)
from student.scripts.yosys_synthflow_variants import script_abc_gate, script_synth_preset


MANT_BITS = 10


BEST_SPECS = {
    "ex235": (8, 6),
    "ex237": (10, 6),
    "ex239": (8, 6),
}


def write_text(path, text):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(text)


def bit_runs(values):
    runs = []
    start = 0
    current = values[0]
    for index, value in enumerate(values[1:], 1):
        if value != current:
            runs.append((start, index - 1, current))
            start = index
            current = value
    runs.append((start, len(values) - 1, current))
    return runs


def emit_vec_tree(lines, runs, indent, target, width):
    if len(runs) == 1:
        lines.append("{0}{1} = {2};".format(indent, target, const_word(width, runs[0][2])))
        return
    mid = len(runs) // 2
    left = runs[:mid]
    right = runs[mid:]
    boundary = left[-1][1]
    lines.append("{0}if (mant <= {1}) begin".format(indent, const_word(MANT_BITS, boundary)))
    emit_vec_tree(lines, left, indent + "  ", target, width)
    lines.append("{0}end else begin".format(indent))
    emit_vec_tree(lines, right, indent + "  ", target, width)
    lines.append("{0}end".format(indent))


def table_output(table, exp, mant):
    return table.get_output((exp << MANT_BITS) | mant)


def positive_mag(table, exp, mant):
    return table_output(table, exp, mant) & 0x7FFF


def render_high_vector(lines, table, cfg, low_width):
    high_bits = list(range(14, low_width - 1, -1))
    width = len(high_bits)
    lines.append("  reg [{0}:0] high_vec;".format(width - 1))
    lines.append("  always @* begin")
    lines.append("    case (exp)")
    total_runs = 0
    max_runs = 0
    const_groups = 0
    for exp in cfg["active_exps"]:
        values = []
        for mant in range(1 << MANT_BITS):
            value = positive_mag(table, exp, mant)
            packed = 0
            for bit in high_bits:
                packed = (packed << 1) | ((value >> bit) & 1)
            values.append(packed)
        runs = bit_runs(values)
        total_runs += len(runs)
        max_runs = max(max_runs, len(runs))
        const_groups += int(len(runs) == 1)
        lines.append("      {0}: begin".format(const_word(5, exp)))
        emit_vec_tree(lines, runs, "        ", "high_vec", width)
        lines.append("      end")
    lines.extend(["      default: high_vec = {0};".format(const_word(width, 0)), "    endcase", "  end"])
    return "high_vector_bits={0}; width={1}; total_runs={2}; max_runs={3}; const_groups={4}".format(
        ",".join(str(bit) for bit in high_bits), width, total_runs, max_runs, const_groups
    )


def render_candidate(case, table, module, low_width, nested_hi):
    cfg = CASE_CONFIG[case]
    lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [15:0] out;",
        "  wire sign = in[15];",
        "  wire [4:0] exp = in[14:10];",
        "  wire [5:0] sign_exp = in[15:10];",
        "  wire [9:0] mant = in[9:0];",
        "  wire active = {0};".format(active_condition(case)),
    ]
    metas = [render_special_table(lines, table, case)]
    render_class_logic(lines, cfg)
    metas.append(render_low_nested(lines, table, cfg, low_width, nested_hi))
    metas.append(render_high_vector(lines, table, cfg, low_width))
    lines.append("  wire [14:0] active_mag = {high_vec, out_low};")
    if cfg["sign_mode"] == "pass":
        lines.append("  wire [15:0] active_out = {sign, active_mag};")
    else:
        lines.append("  wire [15:0] active_out = {1'b0, active_mag};")
    lines.append("  assign out = active ? active_out : special_out;")
    lines.extend(["endmodule", ""])
    return "\n".join(lines), "; ".join(metas)


def synthesize_with_script(script, yosys, timeout, log_path):
    log_path.parent.mkdir(parents=True, exist_ok=True)
    script_path = log_path.with_suffix(".ys")
    write_text(script_path, script)
    code, log = run_command([str(yosys), "-s", str(script_path)], timeout=timeout)
    write_text(log_path, log)
    if code != 0:
        raise SynthError("Yosys failed with exit code {0}".format(code))


def row_template(case, candidate_id, variant, verilog_path, aig_path, note):
    return {
        "case": case,
        "candidate_id": candidate_id,
        "hypothesis/function_guess": CASE_CONFIG[case]["label"],
        "variant": variant,
        "verilog_path": rel_path(verilog_path),
        "aig_path": rel_path(aig_path),
        "verified_truth": "1",
        "synthesized": "0",
        "equivalent": "0",
        "area": "",
        "delay": "",
        "adp": "",
        "reference_adp": "",
        "adp_ratio_to_reference": "",
        "within_1p5_reference": "",
        "beats_reference": "",
        "runtime_sec": "0.000",
        "items": note,
        "classification": "semantic_packed_high_vector",
        "notes": "",
    }


def run_one(args, refs, case, flow_name, script_func):
    table = TruthTable(args.benchmarks / "{0}.truth".format(case))
    low_width, nested_hi = BEST_SPECS[case]
    variant_base = "vec_high_low{0}_hi{1}".format(low_width, nested_hi)
    module = "{0}_{1}".format(case, variant_base)
    text, note = render_candidate(case, table, module, low_width, nested_hi)
    verilog_path = args.work_dir / case / "verilog" / "{0}.v".format(module)
    write_text(verilog_path, text)
    variant = "{0}_{1}".format(variant_base, flow_name)
    candidate_id = "{0}_{1}".format(case, variant)
    aig_path = args.work_dir / case / "aigs" / "{0}.aig".format(candidate_id)
    log_path = args.work_dir / case / "logs" / "{0}.log".format(candidate_id)
    row = row_template(case, candidate_id, variant, verilog_path, aig_path, note)
    start = time.time()
    try:
        aig_path.parent.mkdir(parents=True, exist_ok=True)
        script = script_func(verilog_path, module, aig_path)
        synthesize_with_script(script, args.yosys, args.timeout, log_path)
        row["synthesized"] = "1"
        ev = evaluate_aig(
            case=case,
            candidate_id=candidate_id,
            parent_id=variant,
            source="fp16_ex235_ex237_ex239_vector_high",
            tool_chain="yosys_{0}".format(flow_name),
            aig_path=aig_path,
            truth=args.benchmarks / "{0}.truth".format(case),
            abc=args.abc,
            notes=note,
            timeout=args.timeout,
        )
        row["equivalent"] = "1" if ev.equivalent else "0"
        row["area"] = "" if ev.area is None else str(ev.area)
        row["delay"] = "" if ev.delay is None else str(ev.delay)
        row["adp"] = "" if ev.adp is None else str(ev.adp)
        row["notes"] = ev.notes
    except (RuntimeError, SynthError, OSError, subprocess.TimeoutExpired) as exc:
        row["notes"] = "{0}: {1}".format(type(exc).__name__, exc)[:1000]
    row["runtime_sec"] = "{0:.3f}".format(time.time() - start)
    add_reference_columns(row, refs)
    print("{0} {1} eq={2} area={3} delay={4} adp={5}".format(case, flow_name, row["equivalent"], row["area"], row["delay"], row["adp"]))
    sys.stdout.flush()
    return row


def best_rows(rows):
    best = []
    for case in sorted(set(row["case"] for row in rows)):
        valid = [row for row in rows if row["case"] == case and row["equivalent"] == "1" and row["adp"]]
        if valid:
            item = min(valid, key=lambda row: (int(row["adp"]), int(row["delay"]), int(row["area"])))
            best.append({name: item.get(name, "") for name in BEST_FIELDNAMES})
    return best


def parse_args():
    parser = argparse.ArgumentParser(description="Packed high-vector structures for ex235/ex237/ex239.")
    parser.add_argument("--cases", default="ex235,ex237,ex239")
    parser.add_argument("--flows", default="abc_g_aig,synth_preset")
    parser.add_argument("--work-dir", type=Path, required=True)
    parser.add_argument("--results", type=Path, required=True)
    parser.add_argument("--best-results", type=Path, required=True)
    parser.add_argument("--summary", type=Path, required=True)
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--reference", type=Path, default=ROOT / "reference_result.csv")
    parser.add_argument("--yosys", type=Path, default=ROOT / "student/tools/conda-env/bin/yosys")
    parser.add_argument("--abc", type=Path, default=ROOT / "student/abc")
    parser.add_argument("--timeout", type=int, default=900)
    return parser.parse_args()


def main():
    args = parse_args()
    refs = load_reference(args.reference)
    flow_map = {
        "abc_g_aig": ("abc_g_aig", lambda v, m, o: script_abc_gate(v, m, o, "aig")),
        "synth_preset": ("synth_preset", script_synth_preset),
    }
    flows = [flow_map[item.strip()] for item in args.flows.split(",") if item.strip()]
    rows = []
    summary = []
    for case in [item.strip() for item in args.cases.split(",") if item.strip()]:
        for flow_name, script_func in flows:
            rows.append(run_one(args, refs, case, flow_name, script_func))
        table = TruthTable(args.benchmarks / "{0}.truth".format(case))
        low_width, nested_hi = BEST_SPECS[case]
        _, note = render_candidate(case, table, "{0}_summary".format(case), low_width, nested_hi)
        summary.append({"case": case, "variant": "packed_high_vector", "notes": note})
    write_csv(args.results, RESULT_FIELDNAMES, rows)
    write_csv(args.best_results, BEST_FIELDNAMES, best_rows(rows))
    args.summary.parent.mkdir(parents=True, exist_ok=True)
    with args.summary.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=["case", "variant", "notes"])
        writer.writeheader()
        writer.writerows(summary)
    write_text(args.work_dir / "manifest.json", json.dumps(rows, indent=2) + "\n")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
