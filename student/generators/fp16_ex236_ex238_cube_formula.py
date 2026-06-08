#!/usr/bin/env python3
"""Formula-oriented FP16 cube / reciprocal-cube candidates.

This targets ex236 and ex238 after diagnosis showed shared normal-domain
mantissa mappings plus a small mantissa-derived exponent delta.
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
from student.generators.fp16_semantic_search import (
    BEST_FIELDNAMES,
    RESULT_FIELDNAMES,
    add_reference_columns,
    const_word,
    load_reference,
    rel_path,
    write_csv,
)
from student.scripts.yosys_synthflow_variants import script_abc_gate, script_default


MANT_BITS = 10
MANT_SIZE = 1 << MANT_BITS


CASE_CONFIG = {
    "ex236": {
        "label": "fp16_cube",
        "active_exps": list(range(11, 20)),
        "sample_exp": 11,
        "mode": "cube",
    },
    "ex238": {
        "label": "fp16_reciprocal_cube",
        "active_exps": list(range(10, 19)),
        "sample_exp": 10,
        "mode": "recip_cube",
    },
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


def emit_tree(lines, runs, indent, target, selector="mant", width=MANT_BITS):
    if len(runs) == 1:
        lines.append("{0}{1} = {2};".format(indent, target, runs[0][2]))
        return
    mid = len(runs) // 2
    left = runs[:mid]
    right = runs[mid:]
    boundary = left[-1][1]
    lines.append("{0}if ({1} <= {2}) begin".format(indent, selector, const_word(width, boundary)))
    emit_tree(lines, left, indent + "  ", target, selector=selector, width=width)
    lines.append("{0}end else begin".format(indent))
    emit_tree(lines, right, indent + "  ", target, selector=selector, width=width)
    lines.append("{0}end".format(indent))


def synthesize_with_script(script, yosys, timeout, log_path):
    log_path.parent.mkdir(parents=True, exist_ok=True)
    script_path = log_path.with_suffix(".ys")
    write_text(script_path, script)
    code, log = run_command([str(yosys), "-s", str(script_path)], timeout=timeout)
    write_text(log_path, log)
    if code != 0:
        raise SynthError("Yosys failed with exit code {0}".format(code))


def positive_output(table, exp, mant):
    return table.get_output((exp << MANT_BITS) | mant)


def positive_mag(table, exp, mant):
    return positive_output(table, exp, mant) & 0x7FFF


def render_special_table(lines, table, case):
    active = set(CASE_CONFIG[case]["active_exps"])
    lines.extend(
        [
            "  reg [15:0] special_out;",
            "  always @* begin",
            "    special_out = 16'h0000;",
            "    case (sign_exp)",
        ]
    )
    items = 0
    const_groups = 0
    full_groups = 0
    for sign_exp in range(64):
        exp = sign_exp & 31
        if exp in active:
            continue
        values = [table.get_output((sign_exp << MANT_BITS) | mant) for mant in range(MANT_SIZE)]
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
    return "special_const={0}; special_full={1}; special_items={2}".format(const_groups, full_groups, items)


def render_exp_delta(lines, table, case):
    cfg = CASE_CONFIG[case]
    exp = cfg["sample_exp"]
    if cfg["mode"] == "cube":
        base = 3 * exp - 30
        values = [((positive_mag(table, exp, mant) >> 10) & 31) - base for mant in range(MANT_SIZE)]
    else:
        base = 60 - 3 * exp
        values = [base - ((positive_mag(table, exp, mant) >> 10) & 31) for mant in range(MANT_SIZE)]
    max_value = max(values)
    width = max(1, max_value.bit_length())
    runs = bit_runs([const_word(width, value) for value in values])
    lines.append("  reg [{0}:0] exp_delta;".format(width - 1))
    lines.append("  always @* begin")
    emit_tree(lines, runs, "    ", "exp_delta")
    lines.append("  end")
    return "exp_delta_width={0}; exp_delta_runs={1}; exp_delta_max={2}".format(width, len(runs), max_value), width


def render_mantissa(lines, table, case, high_bits, nested_hi):
    exp = CASE_CONFIG[case]["sample_exp"]
    mant_values = [positive_mag(table, exp, mant) & 0x3FF for mant in range(MANT_SIZE)]
    low_width = 10 if not high_bits else min(high_bits)
    lo_bits = MANT_BITS - nested_hi
    if high_bits:
        for bit in sorted(high_bits, reverse=True):
            values = [str((value >> bit) & 1) for value in mant_values]
            runs = bit_runs(values)
            name = "mant_b{0}".format(bit)
            lines.append("  reg {0};".format(name))
            lines.append("  always @* begin")
            emit_tree(lines, runs, "    ", name)
            lines.append("  end")
    mask = (1 << low_width) - 1
    lines.append("  reg [{0}:0] mant_low;".format(low_width - 1))
    lines.append("  always @* begin")
    lines.append("    case (mant[9:{0}])".format(lo_bits))
    for hi in range(1 << nested_hi):
        bucket = [mant_values[(hi << lo_bits) | lo] & mask for lo in range(1 << lo_bits)]
        if len(set(bucket)) == 1:
            lines.append("      {0}: mant_low = {1};".format(const_word(nested_hi, hi), const_word(low_width, bucket[0])))
            continue
        lines.append("      {0}: begin".format(const_word(nested_hi, hi)))
        lines.append("        case (mant[{0}:0])".format(lo_bits - 1))
        for lo, value in enumerate(bucket):
            lines.append("          {0}: mant_low = {1};".format(const_word(lo_bits, lo), const_word(low_width, value)))
        lines.extend(["          default: mant_low = {0};".format(const_word(low_width, 0)), "        endcase", "      end"])
    lines.extend(["      default: mant_low = {0};".format(const_word(low_width, 0)), "    endcase", "  end"])
    pieces = ["mant_b{0}".format(bit) for bit in sorted(high_bits, reverse=True)]
    pieces.append("mant_low")
    lines.append("  wire [9:0] out_mant = {" + ", ".join(pieces) + "};")
    return "mant_high={0}; low_width={1}; nested_hi={2}".format(",".join(str(bit) for bit in sorted(high_bits, reverse=True)), low_width, nested_hi)


def render_candidate(case, table, module, high_bits, nested_hi):
    cfg = CASE_CONFIG[case]
    lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [15:0] out;",
        "  wire sign = in[15];",
        "  wire [4:0] exp = in[14:10];",
        "  wire [5:0] sign_exp = in[15:10];",
        "  wire [9:0] mant = in[9:0];",
        "  wire active = (exp >= 5'd{0}) && (exp <= 5'd{1});".format(min(cfg["active_exps"]), max(cfg["active_exps"])),
        "  wire [5:0] exp3 = {1'b0, exp} + ({1'b0, exp} << 1);",
    ]
    metas = [render_special_table(lines, table, case)]
    delta_meta, delta_width = render_exp_delta(lines, table, case)
    metas.append(delta_meta)
    if cfg["mode"] == "cube":
        lines.append("  wire [5:0] out_exp_wide = exp3 - 6'd30 + {0};".format("{%d'b0, exp_delta}" % (6 - delta_width)))
    else:
        lines.append("  wire [5:0] out_exp_wide = 6'd60 - exp3 - {0};".format("{%d'b0, exp_delta}" % (6 - delta_width)))
    lines.append("  wire [4:0] out_exp = out_exp_wide[4:0];")
    metas.append(render_mantissa(lines, table, case, high_bits, nested_hi))
    lines.append("  wire [15:0] active_out = {sign, out_exp, out_mant};")
    lines.append("  assign out = active ? active_out : special_out;")
    lines.extend(["endmodule", ""])
    return "\n".join(lines), "; ".join(metas)


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
        "classification": "semantic_formula_exact",
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
            source="fp16_ex236_ex238_cube_formula",
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
    print("{0} {1} {2} eq={3} area={4} delay={5} adp={6}".format(case, variant, flow_name, row["equivalent"], row["area"], row["delay"], row["adp"]))
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
    parser = argparse.ArgumentParser(description="Formula-oriented ex236/ex238 candidates.")
    parser.add_argument("--cases", default="ex236,ex238")
    parser.add_argument("--specs", default="9_8:5,9_8:6,9:5,9:6,none:5,none:6")
    parser.add_argument("--flows", default="abc_g_aig")
    parser.add_argument("--work-dir", type=Path, required=True)
    parser.add_argument("--results", type=Path, required=True)
    parser.add_argument("--best-results", type=Path, required=True)
    parser.add_argument("--summary", type=Path, required=True)
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--reference", type=Path, default=ROOT / "reference_result.csv")
    parser.add_argument("--yosys", type=Path, default=ROOT / "student" / "tools" / "conda-env" / "bin" / "yosys")
    parser.add_argument("--abc", type=Path, default=ROOT / "student" / "abc")
    parser.add_argument("--timeout", type=int, default=900)
    return parser.parse_args()


def parse_high_bits(text):
    if text == "none":
        return []
    return [int(item) for item in text.split("_") if item]


def main():
    args = parse_args()
    refs = load_reference(args.reference)
    cases = [case.strip() for case in args.cases.split(",") if case.strip()]
    specs = []
    for item in args.specs.split(","):
        high_text, nested_hi = item.split(":", 1)
        specs.append((parse_high_bits(high_text), int(nested_hi)))
    flow_map = {
        "abc_g_aig": ("abc_g_aig", lambda v, m, o: script_abc_gate(v, m, o, "aig")),
        "default": ("default", lambda v, m, o: script_default(v, m, o)),
    }
    flows = [flow_map[name.strip()] for name in args.flows.split(",") if name.strip()]
    rows = []
    summary = []
    for case in cases:
        table = TruthTable(args.benchmarks / "{0}.truth".format(case))
        for high_bits, nested_hi in specs:
            label = "formula_high{0}_hi{1}".format("_".join(str(bit) for bit in high_bits) if high_bits else "none", nested_hi)
            module = "{0}_{1}".format(case, label)
            text, note = render_candidate(case, table, module, high_bits, nested_hi)
            summary.append({"case": case, "variant": label, "notes": note})
            for flow_name, script_func in flows:
                rows.append(run_one(args, refs, case, label, module, text, note, flow_name, script_func))
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
