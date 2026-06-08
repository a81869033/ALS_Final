#!/usr/bin/env python3
"""Semantic special/default shells around current ex235-ex239 seeds.

The current seeds are exact, but several still carry structural tables for
zero/subnormal/inf/NaN and saturation/default regions.  This wrapper lets the
base seed handle only the complex active normal range, while simple semantic
guards directly emit constants for the rest.
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


SEED_ROOT = ROOT / "student/seeds/fp16/ex235_ex239_frontend_fp16_current_20260608_1055"


CASE_CONFIG = {
    "ex235": ("fp16_reciprocal_sqrt", SEED_ROOT / "ex235/verilog/ex235_open_low8_hi6.v", "ex235_open_low8_hi6"),
    "ex236": ("fp16_cube", SEED_ROOT / "ex236/verilog/ex236_sign_only.v", "ex236_sign_only"),
    "ex237": ("fp16_cbrt", SEED_ROOT / "ex237/verilog/ex237_open_low10_hi6.v", "ex237_open_low10_hi6"),
    "ex238": ("fp16_reciprocal_cube", SEED_ROOT / "ex238/verilog/ex238_b10_9_formula_expr.v", "ex238_b10_9_formula_expr"),
    "ex239": ("fp16_reciprocal_cbrt", SEED_ROOT / "ex239/verilog/ex239_open_low8_hi6.v", "ex239_open_low8_hi6"),
}


def write_text(path, text):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(text)


def shell_lines(case):
    if case == "ex235":
        note = "reciprocal_sqrt shell: base only positive normal; signed zero->signed inf; +inf->+0; NaN/negative normal->canonical NaN"
        return [
            "  wire use_base = !sign && exp >= 5'd1 && exp <= 5'd30;",
            "  wire [15:0] special_out = (exp == 5'd0) ? {sign, 5'h1f, 10'h000} :",
            "                           ((!sign && exp == 5'h1f && mant == 10'h000) ? 16'h0000 : 16'h7e00);",
        ], note
    if case == "ex236":
        note = "cube shell: base only exp10..20 normal; low magnitudes signed zero; high magnitudes signed inf; NaN canonical"
        return [
            "  wire use_base = exp >= 5'd10 && exp <= 5'd20;",
            "  wire [15:0] signed_zero = {sign, 15'h0000};",
            "  wire [15:0] signed_inf = {sign, 5'h1f, 10'h000};",
            "  wire [15:0] special_out = (exp == 5'h1f && mant != 10'h000) ? 16'h7e00 :",
            "                           ((exp <= 5'd9) ? signed_zero : signed_inf);",
        ], note
    if case == "ex237":
        note = "cbrt shell: base only normal exp1..30; signed zero/inf pass; NaN canonical"
        return [
            "  wire use_base = exp >= 5'd1 && exp <= 5'd30;",
            "  wire [15:0] special_out = (exp == 5'd0) ? {sign, 15'h0000} :",
            "                           ((mant == 10'h000) ? {sign, 5'h1f, 10'h000} : 16'h7e00);",
        ], note
    if case == "ex238":
        note = "reciprocal_cube shell: base only exp9..19; low magnitudes signed inf; high magnitudes signed zero; NaN canonical"
        return [
            "  wire use_base = exp >= 5'd9 && exp <= 5'd19;",
            "  wire [15:0] signed_zero = {sign, 15'h0000};",
            "  wire [15:0] signed_inf = {sign, 5'h1f, 10'h000};",
            "  wire [15:0] special_out = (exp == 5'h1f && mant != 10'h000) ? 16'h7e00 :",
            "                           ((exp <= 5'd8) ? signed_inf : signed_zero);",
        ], note
    if case == "ex239":
        note = "reciprocal_cbrt shell: base only normal exp1..30; signed zero->inf; signed inf->zero; NaN canonical"
        return [
            "  wire use_base = exp >= 5'd1 && exp <= 5'd30;",
            "  wire [15:0] special_out = (exp == 5'd0) ? {sign, 5'h1f, 10'h000} :",
            "                           ((mant == 10'h000) ? {sign, 15'h0000} : 16'h7e00);",
        ], note
    raise RuntimeError("unknown case {0}".format(case))


def render_candidate(case, module):
    label, base_path, base_module = CASE_CONFIG[case]
    base_source = base_path.read_text()
    guard_lines, note = shell_lines(case)
    lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [15:0] out;",
        "  wire sign = in[15];",
        "  wire [4:0] exp = in[14:10];",
        "  wire [9:0] mant = in[9:0];",
        "  wire [15:0] base_out;",
        "  {0} u_base(.in(in), .out(base_out));".format(base_module),
    ]
    lines.extend(guard_lines)
    lines.extend(["  assign out = use_base ? base_out : special_out;", "endmodule", "", base_source, ""])
    return "\n".join(lines), note


def synthesize_with_script(script, yosys, timeout, log_path):
    log_path.parent.mkdir(parents=True, exist_ok=True)
    script_path = log_path.with_suffix(".ys")
    write_text(script_path, script)
    code, log = run_command([str(yosys), "-s", str(script_path)], timeout=timeout)
    write_text(log_path, log)
    if code != 0:
        raise SynthError("Yosys failed with exit code {0}".format(code))


def row_template(case, candidate_id, variant, verilog_path, aig_path, note):
    label, _, _ = CASE_CONFIG[case]
    return {
        "case": case,
        "candidate_id": candidate_id,
        "hypothesis/function_guess": label,
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
        "classification": "semantic_special_shell",
        "notes": "",
    }


def run_one(args, refs, case, flow_name, script_func):
    module = "{0}_semantic_shell".format(case)
    text, note = render_candidate(case, module)
    verilog_path = args.work_dir / case / "verilog" / "{0}.v".format(module)
    write_text(verilog_path, text)
    variant = "semantic_shell_{0}".format(flow_name)
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
            source="fp16_ex235_ex239_semantic_shell",
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
    parser = argparse.ArgumentParser(description="Semantic special shells for ex235-ex239.")
    parser.add_argument("--cases", default="ex235,ex236,ex237,ex238,ex239")
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
        _, note = render_candidate(case, "{0}_semantic_shell".format(case))
        summary.append({"case": case, "variant": "semantic_shell", "notes": note})
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
