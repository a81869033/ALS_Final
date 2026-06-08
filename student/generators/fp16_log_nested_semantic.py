#!/usr/bin/env python3
"""Targeted nested-mantissa frontend seeds for FP16 log-family cases.

This applies the ex232 lesson to ex223/ex224/ex225: keep the semantic
sign/exp shell explicit, then encode only positive-normal mantissa behavior
with shallow output-bit run trees plus a nested hi/lo LUT for the noisy low
mantissa bits.
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
from student.generators.fp16_ex232_square_deep import bit_runs, const_word, emit_tree
from student.generators.fp16_semantic_search import (
    BEST_FIELDNAMES,
    RESULT_FIELDNAMES,
    add_reference_columns,
    load_reference,
    rel_path,
    write_csv,
)
from student.scripts.yosys_synthflow_variants import script_abc_gate, script_default


MANT_BITS = 10
MANT_SIZE = 1 << MANT_BITS
ACTIVE_SIGN_EXP = list(range(1, 31))

CASE_LABELS = {
    "ex223": "fp16_log",
    "ex224": "fp16_log2",
    "ex225": "fp16_log10",
}


def write_text(path, text):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(text)


def synthesize_with_script(script, yosys, timeout, log_path):
    log_path.parent.mkdir(parents=True, exist_ok=True)
    script_path = log_path.with_suffix(".ys")
    script_path.write_text(script)
    returncode, log = run_command([str(yosys), "-s", str(script_path)], timeout=timeout)
    log_path.write_text(log)
    if returncode != 0:
        raise SynthError("Yosys failed with exit code {0}".format(returncode))


def outputs_for_sign_exp(table, sign_exp):
    base = sign_exp << MANT_BITS
    return [table.get_output(base | mant) for mant in range(MANT_SIZE)]


def render_special_table(lines, table):
    active = set(ACTIVE_SIGN_EXP)
    lines.extend(
        [
            "  reg [15:0] special_out;",
            "  always @* begin",
            "    special_out = 16'h0000;",
            "    case (sign_exp)",
        ]
    )
    items = 0
    full_groups = 0
    const_groups = 0
    for sign_exp in range(64):
        if sign_exp in active:
            continue
        values = outputs_for_sign_exp(table, sign_exp)
        if len(set(values)) == 1:
            const_groups += 1
            items += 1
            lines.append("      {0}: special_out = {1};".format(const_word(6, sign_exp), const_word(16, values[0])))
            continue
        full_groups += 1
        lines.append("      {0}: begin".format(const_word(6, sign_exp)))
        lines.append("        case (mant)")
        for mant, value in enumerate(values):
            items += 1
            lines.append("          {0}: special_out = {1};".format(const_word(MANT_BITS, mant), const_word(16, value)))
        lines.extend(["          default: special_out = 16'h0000;", "        endcase", "      end"])
    lines.extend(["      default: special_out = 16'h0000;", "    endcase", "  end"])
    return "special_const_groups={0}; special_full_groups={1}; special_items={2}".format(
        const_groups,
        full_groups,
        items,
    )


def render_low_lut(lines, table, low_width, nested_hi):
    lo_bits = MANT_BITS - nested_hi
    low_mask = (1 << low_width) - 1
    lines.extend(
        [
            "  reg [{0}:0] out_low;".format(low_width - 1),
            "  always @* begin",
            "    case (sign_exp)",
        ]
    )
    items = 0
    for sign_exp in ACTIVE_SIGN_EXP:
        lines.append("      {0}: begin".format(const_word(6, sign_exp)))
        lines.append("        case (mant[9:{0}])".format(lo_bits))
        for hi in range(1 << nested_hi):
            values = []
            for lo in range(1 << lo_bits):
                mant = (hi << lo_bits) | lo
                values.append(table.get_output((sign_exp << MANT_BITS) | mant) & low_mask)
            if len(set(values)) == 1:
                items += 1
                lines.append("          {0}: out_low = {1};".format(const_word(nested_hi, hi), const_word(low_width, values[0])))
                continue
            lines.append("          {0}: begin".format(const_word(nested_hi, hi)))
            lines.append("            case (mant[{0}:0])".format(lo_bits - 1))
            for lo, value in enumerate(values):
                items += 1
                lines.append("              {0}: out_low = {1};".format(const_word(lo_bits, lo), const_word(low_width, value)))
            lines.extend(["              default: out_low = {0};".format(const_word(low_width, 0)), "            endcase", "          end"])
        lines.extend(["          default: out_low = {0};".format(const_word(low_width, 0)), "        endcase", "      end"])
    lines.extend(["      default: out_low = {0};".format(const_word(low_width, 0)), "    endcase", "  end"])
    return "low_width={0}; nested_hi={1}; nested_lo={2}; low_items={3}".format(
        low_width,
        nested_hi,
        lo_bits,
        items,
    )


def render_high_bit(lines, table, bit, low_width):
    name = "out_b{0}".format(bit)
    lines.append("  reg {0};".format(name))
    lines.append("  always @* begin")
    lines.append("    case (sign_exp)")
    total_runs = 0
    max_runs = 0
    const_groups = 0
    for sign_exp in ACTIVE_SIGN_EXP:
        values = [str((table.get_output((sign_exp << MANT_BITS) | mant) >> bit) & 1) for mant in range(MANT_SIZE)]
        runs = bit_runs(values)
        total_runs += len(runs)
        max_runs = max(max_runs, len(runs))
        lines.append("      {0}: begin".format(const_word(6, sign_exp)))
        if len(runs) == 1:
            const_groups += 1
        emit_tree(lines, runs, "        ", name)
        lines.append("      end")
    lines.extend(["      default: {0} = 1'b0;".format(name), "    endcase", "  end"])
    return "b{0}:runs={1},max={2},const={3}".format(bit, total_runs, max_runs, const_groups)


def render_candidate(case, table, module, low_width, nested_hi):
    high_bits = list(range(15, low_width - 1, -1))
    lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [15:0] out;",
        "  wire [5:0] sign_exp = in[15:10];",
        "  wire [9:0] mant = in[9:0];",
        "  wire active_pos_normal = (sign_exp >= 6'd1) && (sign_exp <= 6'd30);",
    ]
    metas = [render_special_table(lines, table)]
    metas.append(render_low_lut(lines, table, low_width, nested_hi))
    high_bits = list(range(15, low_width - 1, -1))
    for bit in high_bits:
        metas.append(render_high_bit(lines, table, bit, low_width))
    pieces = ["out_b{0}".format(bit) for bit in high_bits]
    pieces.append("out_low")
    lines.append("  wire [15:0] normal_out = {" + ", ".join(pieces) + "};")
    lines.append("  assign out = active_pos_normal ? normal_out : special_out;")
    lines.extend(["endmodule", ""])
    note = "positive-normal exp-group high-bit run trees plus nested low LUT; " + "; ".join(metas)
    return "\n".join(lines), note


def row_template(case, candidate_id, variant, verilog_path, aig_path, note):
    return {
        "case": case,
        "candidate_id": candidate_id,
        "hypothesis/function_guess": CASE_LABELS[case],
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
        "classification": "semantic_structural_exact",
        "notes": "",
    }


def run_one(args, refs, case, variant, module, text, note, flow_name, script_func):
    verilog_path = args.work_dir / case / "verilog" / "{0}.v".format(module)
    write_text(verilog_path, text)
    candidate_id = "{0}_{1}_{2}".format(case, variant, flow_name)
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
            source="fp16_log_nested_semantic",
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
    print("{0} {1} {2} eq={3} area={4} delay={5} adp={6}".format(
        case,
        variant,
        flow_name,
        row["equivalent"],
        row["area"],
        row["delay"],
        row["adp"],
    ))
    sys.stdout.flush()
    return row


def best_rows(rows):
    best = []
    for case in sorted(set(row["case"] for row in rows)):
        valid = [row for row in rows if row["equivalent"] == "1" and row["case"] == case and row["adp"]]
        if valid:
            item = min(valid, key=lambda row: (int(row["adp"]), int(row["delay"]), int(row["area"])))
            best.append({name: item.get(name, "") for name in BEST_FIELDNAMES})
    return best


def parse_args():
    parser = argparse.ArgumentParser(description="Targeted nested FP16 log-family seeds.")
    parser.add_argument("--cases", default="ex223,ex224,ex225")
    parser.add_argument("--work-dir", type=Path, required=True)
    parser.add_argument("--results", type=Path, required=True)
    parser.add_argument("--best-results", type=Path, required=True)
    parser.add_argument("--summary", type=Path, required=True)
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--reference", type=Path, default=ROOT / "reference_result.csv")
    parser.add_argument("--yosys", type=Path, default=ROOT / "student" / "tools" / "conda-env" / "bin" / "yosys")
    parser.add_argument("--abc", type=Path, default=ROOT / "student" / "abc")
    parser.add_argument("--timeout", type=int, default=900)
    parser.add_argument(
        "--specs",
        default="8:5,8:6,7:6,6:6",
        help="Comma-separated low_width:nested_hi specs.",
    )
    parser.add_argument(
        "--flows",
        default="abc_g_aig,default",
        help="Comma-separated synthesis flows: abc_g_aig,default.",
    )
    return parser.parse_args()


def main():
    args = parse_args()
    refs = load_reference(args.reference)
    cases = [case.strip() for case in args.cases.split(",") if case.strip()]
    specs = []
    for item in args.specs.split(","):
        if not item.strip():
            continue
        low_width_text, nested_hi_text = item.split(":", 1)
        specs.append((int(low_width_text), int(nested_hi_text)))
    flow_map = {
        "abc_g_aig": ("abc_g_aig", lambda v, m, o: script_abc_gate(v, m, o, "aig")),
        "default": ("default", lambda v, m, o: script_default(v, m, o)),
    }
    flows = [flow_map[name.strip()] for name in args.flows.split(",") if name.strip()]
    rows = []
    summary = []
    for case in cases:
        table = TruthTable(args.benchmarks / "{0}.truth".format(case))
        for low_width, nested_hi in specs:
            variant = "log_nested_low{0}_hi{1}".format(low_width, nested_hi)
            module = "{0}_{1}".format(case, variant)
            text, note = render_candidate(case, table, module, low_width, nested_hi)
            summary.append({"case": case, "variant": variant, "notes": note})
            for flow_name, script_func in flows:
                rows.append(run_one(args, refs, case, variant, module, text, note, flow_name, script_func))
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
