#!/usr/bin/env python3
"""Hand-derived ex238 b10/b9 correction formulas.

The selected-bit wrapper found that replacing output bits 10 and 9 reduces
delay.  Inspecting the generated cover shows the normal exponent groups share
one mantissa segmentation; odd exponents only toggle bit 10.  This script tests
that formula directly instead of repeating one tree per exponent.
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
from student.frontends.yosys_synth import SynthError, run_command
from student.generators.fp16_semantic_search import (
    BEST_FIELDNAMES,
    RESULT_FIELDNAMES,
    add_reference_columns,
    load_reference,
    rel_path,
    write_csv,
)
from student.scripts.yosys_synthflow_variants import script_abc_gate, script_synth_preset


BASE_PATH = ROOT / "student/work/reverse_fp16_semantic_20260604_1522_arith/ex238/verilog/ex238_fp16_reciprocal_cube_exp_mant_pair_case.v"
BASE_MODULE = "ex238_fp16_reciprocal_cube_exp_mant_pair_case"


def write_text(path, text):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(text)


def render_case_formula(module):
    base = BASE_PATH.read_text()
    lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [15:0] out;",
        "  wire [15:0] base_out;",
        "  wire [4:0] exp = in[14:10];",
        "  wire [9:0] mant = in[9:0];",
        "  reg [1:0] mag_bits;",
        "  {0} u_base(.in(in), .out(base_out));".format(BASE_MODULE),
        "  always @* begin",
        "    case (exp)",
        "      5'h00, 5'h01, 5'h02, 5'h03, 5'h04, 5'h05, 5'h06, 5'h07, 5'h08: mag_bits = 2'h2;",
        "      5'h09: begin",
        "        if (mant <= 10'h259) mag_bits = 2'h2;",
        "        else if (mant <= 10'h2fd) mag_bits = 2'h1;",
        "        else mag_bits = 2'h0;",
        "      end",
        "      5'h0a, 5'h0c, 5'h0e, 5'h10, 5'h12: begin",
        "        if (mant <= 10'h000) mag_bits = 2'h0;",
        "        else if (mant <= 10'h067) mag_bits = 2'h3;",
        "        else if (mant <= 10'h10a) mag_bits = 2'h2;",
        "        else if (mant <= 10'h18c) mag_bits = 2'h1;",
        "        else if (mant <= 10'h259) mag_bits = 2'h0;",
        "        else if (mant <= 10'h2fd) mag_bits = 2'h3;",
        "        else mag_bits = 2'h2;",
        "      end",
        "      5'h0b, 5'h0d, 5'h0f, 5'h11: begin",
        "        if (mant <= 10'h000) mag_bits = 2'h2;",
        "        else if (mant <= 10'h067) mag_bits = 2'h1;",
        "        else if (mant <= 10'h10a) mag_bits = 2'h0;",
        "        else if (mant <= 10'h18c) mag_bits = 2'h3;",
        "        else if (mant <= 10'h259) mag_bits = 2'h2;",
        "        else if (mant <= 10'h2fd) mag_bits = 2'h1;",
        "        else mag_bits = 2'h0;",
        "      end",
        "      5'h13: begin",
        "        if (mant <= 10'h000) mag_bits = 2'h2;",
        "        else if (mant <= 10'h067) mag_bits = 2'h1;",
        "        else if (mant <= 10'h10a) mag_bits = 2'h0;",
        "        else if (mant <= 10'h18c) mag_bits = 2'h3;",
        "        else if (mant <= 10'h259) mag_bits = 2'h2;",
        "        else mag_bits = 2'h0;",
        "      end",
        "      5'h1f: mag_bits = (mant == 10'h000) ? 2'h0 : 2'h3;",
        "      default: mag_bits = 2'h0;",
        "    endcase",
        "  end",
    ]
    lines.extend(render_output_assigns())
    lines.extend(["endmodule", "", base, ""])
    return "\n".join(lines), "hand formula case: shared core mantissa segmentation, odd exp toggled explicitly"


def render_expr_formula(module):
    base = BASE_PATH.read_text()
    lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [15:0] out;",
        "  wire [15:0] base_out;",
        "  wire [4:0] exp = in[14:10];",
        "  wire [9:0] mant = in[9:0];",
        "  wire m_zero = (mant == 10'h000);",
        "  wire le_067 = (mant <= 10'h067);",
        "  wire le_10a = (mant <= 10'h10a);",
        "  wire le_18c = (mant <= 10'h18c);",
        "  wire le_259 = (mant <= 10'h259);",
        "  wire le_2fd = (mant <= 10'h2fd);",
        "  wire [1:0] even_core = m_zero ? 2'h0 :",
        "                         le_067 ? 2'h3 :",
        "                         le_10a ? 2'h2 :",
        "                         le_18c ? 2'h1 :",
        "                         le_259 ? 2'h0 :",
        "                         le_2fd ? 2'h3 : 2'h2;",
        "  wire [1:0] core_bits = even_core ^ {exp[0], 1'b0};",
        "  wire [1:0] exp09_bits = le_259 ? 2'h2 : (le_2fd ? 2'h1 : 2'h0);",
        "  wire [1:0] exp19_bits = m_zero ? 2'h2 :",
        "                         le_067 ? 2'h1 :",
        "                         le_10a ? 2'h0 :",
        "                         le_18c ? 2'h3 :",
        "                         le_259 ? 2'h2 : 2'h0;",
        "  wire [1:0] exp31_bits = m_zero ? 2'h0 : 2'h3;",
        "  wire core_exp = (exp >= 5'h0a) && (exp <= 5'h12);",
        "  wire [1:0] mag_bits = (exp <= 5'h08) ? 2'h2 :",
        "                        (exp == 5'h09) ? exp09_bits :",
        "                        core_exp ? core_bits :",
        "                        (exp == 5'h13) ? exp19_bits :",
        "                        (exp == 5'h1f) ? exp31_bits : 2'h0;",
        "  {0} u_base(.in(in), .out(base_out));".format(BASE_MODULE),
    ]
    lines.extend(render_output_assigns())
    lines.extend(["endmodule", "", base, ""])
    return "\n".join(lines), "hand formula expr: factored mantissa thresholds and odd-exp xor"


def render_expr_ordered_formula(module, active_only=False):
    base = BASE_PATH.read_text()
    note_mode = "active-only to base" if active_only else "ordered exponent cascade"
    lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [15:0] out;",
        "  wire [15:0] base_out;",
        "  wire [4:0] exp = in[14:10];",
        "  wire [9:0] mant = in[9:0];",
        "  wire m_zero = (mant == 10'h000);",
        "  wire le_067 = (mant <= 10'h067);",
        "  wire le_10a = (mant <= 10'h10a);",
        "  wire le_18c = (mant <= 10'h18c);",
        "  wire le_259 = (mant <= 10'h259);",
        "  wire le_2fd = (mant <= 10'h2fd);",
        "  wire [1:0] even_core = m_zero ? 2'h0 :",
        "                         le_067 ? 2'h3 :",
        "                         le_10a ? 2'h2 :",
        "                         le_18c ? 2'h1 :",
        "                         le_259 ? 2'h0 :",
        "                         le_2fd ? 2'h3 : 2'h2;",
        "  wire [1:0] core_bits = even_core ^ {exp[0], 1'b0};",
        "  wire [1:0] exp09_bits = le_259 ? 2'h2 : (le_2fd ? 2'h1 : 2'h0);",
        "  wire [1:0] exp19_bits = m_zero ? 2'h2 :",
        "                         le_067 ? 2'h1 :",
        "                         le_10a ? 2'h0 :",
        "                         le_18c ? 2'h3 :",
        "                         le_259 ? 2'h2 : 2'h0;",
        "  wire [1:0] exp31_bits = m_zero ? 2'h0 : 2'h3;",
        "  wire [1:0] formula_bits = (exp <= 5'h08) ? 2'h2 :",
        "                            (exp == 5'h09) ? exp09_bits :",
        "                            (exp <= 5'h12) ? core_bits :",
        "                            (exp == 5'h13) ? exp19_bits :",
        "                            (exp == 5'h1f) ? exp31_bits : 2'h0;",
        "  wire use_formula = (exp == 5'h09) || ((exp >= 5'h0a) && (exp <= 5'h12)) || (exp == 5'h13);",
        "  wire [1:0] mag_bits = {0};".format("(use_formula ? formula_bits : {base_out[10], base_out[9]})" if active_only else "formula_bits"),
        "  {0} u_base(.in(in), .out(base_out));".format(BASE_MODULE),
    ]
    lines.extend(render_output_assigns())
    lines.extend(["endmodule", "", base, ""])
    return "\n".join(lines), "hand formula ordered expr: {0}; removes explicit lower-bound core comparator in full mode".format(note_mode)


def render_bitlogic_formula(module, active_only=False):
    base = BASE_PATH.read_text()
    use_note = "active-only mux to base" if active_only else "full exponent formula"
    lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [15:0] out;",
        "  wire [15:0] base_out;",
        "  wire [4:0] exp = in[14:10];",
        "  wire [9:0] mant = in[9:0];",
        "  wire m_zero = (mant == 10'h000);",
        "  wire gt_000 = !m_zero;",
        "  wire le_067 = (mant <= 10'h067);",
        "  wire le_10a = (mant <= 10'h10a);",
        "  wire le_18c = (mant <= 10'h18c);",
        "  wire le_259 = (mant <= 10'h259);",
        "  wire le_2fd = (mant <= 10'h2fd);",
        "  wire core_exp = (exp >= 5'h0a) && (exp <= 5'h12);",
        "  wire exp09 = (exp == 5'h09);",
        "  wire exp19 = (exp == 5'h13);",
        "  wire exp31 = (exp == 5'h1f);",
        "  wire core_b9 = (gt_000 && le_067) || ((!le_10a) && le_18c) || ((!le_259) && le_2fd);",
        "  wire core_b10_even = (gt_000 && le_10a) || (!le_259);",
        "  wire core_b10 = core_b10_even ^ exp[0];",
        "  wire exp09_b10 = le_259;",
        "  wire exp09_b9 = (!le_259) && le_2fd;",
        "  wire exp19_b10 = m_zero || ((!le_10a) && le_259);",
        "  wire exp19_b9 = (gt_000 && le_067) || ((!le_10a) && le_18c);",
        "  wire exp31_b = gt_000;",
        "  wire formula_b10 = exp09 ? exp09_b10 :",
        "                     core_exp ? core_b10 :",
        "                     exp19 ? exp19_b10 :",
        "                     exp31 ? exp31_b :",
        "                     (exp <= 5'h08);",
        "  wire formula_b9 = exp09 ? exp09_b9 :",
        "                    core_exp ? core_b9 :",
        "                    exp19 ? exp19_b9 :",
        "                    exp31 ? exp31_b : 1'b0;",
        "  wire use_formula = exp09 || core_exp || exp19;",
        "  {0} u_base(.in(in), .out(base_out));".format(BASE_MODULE),
        "  assign out[15] = base_out[15];",
    ]
    for bit in range(15):
        if bit == 9:
            source = "(use_formula ? formula_b9 : base_out[9])" if active_only else "formula_b9"
            lines.append("  assign out[9] = {0};".format(source))
        elif bit == 10:
            source = "(use_formula ? formula_b10 : base_out[10])" if active_only else "formula_b10"
            lines.append("  assign out[10] = {0};".format(source))
        else:
            lines.append("  assign out[{0}] = base_out[{0}];".format(bit))
    lines.extend(["endmodule", "", base, ""])
    return "\n".join(lines), "hand formula bitlogic: {0}; shared threshold predicates".format(use_note)


def render_output_assigns():
    lines = ["  assign out[15] = base_out[15];"]
    for bit in range(15):
        if bit == 9:
            lines.append("  assign out[9] = mag_bits[0];")
        elif bit == 10:
            lines.append("  assign out[10] = mag_bits[1];")
        else:
            lines.append("  assign out[{0}] = base_out[{0}];".format(bit))
    return lines


def synthesize_with_script(script, yosys, timeout, log_path):
    log_path.parent.mkdir(parents=True, exist_ok=True)
    script_path = log_path.with_suffix(".ys")
    write_text(script_path, script)
    code, log = run_command([str(yosys), "-s", str(script_path)], timeout=timeout)
    write_text(log_path, log)
    if code != 0:
        raise SynthError("Yosys failed with exit code {0}".format(code))


def row_template(candidate_id, variant, verilog_path, aig_path, note):
    return {
        "case": "ex238",
        "candidate_id": candidate_id,
        "hypothesis/function_guess": "fp16_reciprocal_cube",
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
        "classification": "semantic_selected_bit_formula",
        "notes": "",
    }


def run_one(args, refs, variant, module, text, note, flow_name, script):
    verilog_path = args.work_dir / "ex238" / "verilog" / "{0}.v".format(module)
    write_text(verilog_path, text)
    candidate_id = "ex238_{0}_{1}".format(variant, flow_name)
    aig_path = args.work_dir / "ex238" / "aigs" / "{0}.aig".format(candidate_id)
    log_path = args.work_dir / "ex238" / "logs" / "{0}.log".format(candidate_id)
    row = row_template(candidate_id, variant, verilog_path, aig_path, note)
    start = time.time()
    try:
        aig_path.parent.mkdir(parents=True, exist_ok=True)
        synthesize_with_script(script(verilog_path, module, aig_path), args.yosys, args.timeout, log_path)
        row["synthesized"] = "1"
        ev = evaluate_aig(
            case="ex238",
            candidate_id=candidate_id,
            parent_id=variant,
            source="fp16_ex238_b10b9_formula",
            tool_chain="yosys_{0}".format(flow_name),
            aig_path=aig_path,
            truth=args.benchmarks / "ex238.truth",
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
    print("ex238 {0} {1} eq={2} area={3} delay={4} adp={5}".format(variant, flow_name, row["equivalent"], row["area"], row["delay"], row["adp"]))
    sys.stdout.flush()
    return row


def best_rows(rows):
    valid = [row for row in rows if row["equivalent"] == "1" and row["adp"]]
    if not valid:
        return []
    item = min(valid, key=lambda row: (int(row["adp"]), int(row["delay"]), int(row["area"])))
    return [{name: item.get(name, "") for name in BEST_FIELDNAMES}]


def parse_args():
    parser = argparse.ArgumentParser(description="Hand-derived ex238 b10/b9 formulas.")
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


def main():
    args = parse_args()
    refs = load_reference(args.reference)
    variants = [
        ("b10_9_formula_case", render_case_formula),
        ("b10_9_formula_expr", render_expr_formula),
        ("b10_9_formula_expr_ordered", lambda module: render_expr_ordered_formula(module, active_only=False)),
        ("b10_9_formula_expr_active", lambda module: render_expr_ordered_formula(module, active_only=True)),
        ("b10_9_formula_bitlogic", lambda module: render_bitlogic_formula(module, active_only=False)),
        ("b10_9_formula_bitlogic_active", lambda module: render_bitlogic_formula(module, active_only=True)),
    ]
    flows = [
        ("abc_g_aig", lambda v, m, o: script_abc_gate(v, m, o, "aig")),
        ("synth_preset", lambda v, m, o: script_synth_preset(v, m, o, noabc=False)),
    ]
    rows = []
    summary = []
    for variant, renderer in variants:
        module = "ex238_{0}".format(variant)
        text, note = renderer(module)
        summary.append({"case": "ex238", "variant": variant, "notes": note})
        for flow_name, script in flows:
            rows.append(run_one(args, refs, variant, module, text, note, flow_name, script))
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
