#!/usr/bin/env python3
"""Core-formula plus exact boundary clamps for FP16 cube / reciprocal-cube.

Follow-up to the core-boundary table source.  Truth inspection showed the two
irregular boundary exponent groups are almost exactly the middle core formula
with a single underflow/overflow threshold.  This source replaces boundary
tables with those shallow clamps.
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
from student.generators.fp16_ex236_ex238_cube_formula import render_exp_delta, render_mantissa
from student.generators.fp16_semantic_search import (
    BEST_FIELDNAMES,
    RESULT_FIELDNAMES,
    add_reference_columns,
    load_reference,
    rel_path,
    write_csv,
)
from student.scripts.yosys_synthflow_variants import (
    script_abc_d,
    script_abc_gate,
    script_default,
    script_extra_opt,
    script_late_flatten,
    script_no_internal_abc,
    script_synth_preset,
)


CASE_CONFIG = {
    "ex236": {"label": "fp16_cube", "mode": "cube"},
    "ex238": {"label": "fp16_reciprocal_cube", "mode": "recip_cube"},
}


def write_text(path, text):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(text)


def synthesize_with_script(script, yosys, timeout, log_path):
    log_path.parent.mkdir(parents=True, exist_ok=True)
    script_path = log_path.with_suffix(".ys")
    write_text(script_path, script)
    code, log = run_command([str(yosys), "-s", str(script_path)], timeout=timeout)
    write_text(log_path, log)
    if code != 0:
        raise SynthError("Yosys failed with exit code {0}".format(code))


def render_candidate(case, table, module, nested_hi):
    cfg = CASE_CONFIG[case]
    lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [15:0] out;",
        "  wire sign = in[15];",
        "  wire [4:0] exp = in[14:10];",
        "  wire [9:0] mant = in[9:0];",
        "  wire [5:0] exp3 = {1'b0, exp} + ({1'b0, exp} << 1);",
    ]
    metas = []
    delta_meta, delta_width = render_exp_delta(lines, table, case)
    metas.append(delta_meta)
    if cfg["mode"] == "cube":
        lines.append("  wire [5:0] core_exp_wide = exp3 - 6'd30 + {0};".format("{%d'b0, exp_delta}" % (6 - delta_width)))
    else:
        lines.append("  wire [5:0] core_exp_wide = 6'd60 - exp3 - {0};".format("{%d'b0, exp_delta}" % (6 - delta_width)))
    lines.append("  wire [4:0] core_exp = core_exp_wide[4:0];")
    metas.append(render_mantissa(lines, table, case, [], nested_hi))
    lines.append("  wire [14:0] core_mag = {core_exp, out_mant};")
    lines.append("  wire [15:0] signed_zero = {sign, 15'h0000};")
    lines.append("  wire [15:0] signed_inf = {sign, 5'h1f, 10'h000};")
    if case == "ex236":
        lines.extend(
            [
                "  wire active_core = (exp >= 5'd11) && (exp <= 5'd19);",
                "  wire exp10 = (exp == 5'd10);",
                "  wire exp20 = (exp == 5'd20);",
                "  wire underflow_exp10 = exp10 && (mant >= 10'h001) && (mant <= 10'h109);",
                "  wire min_normal_exp10 = exp10 && (mant == 10'h10a);",
                "  wire overflow_exp20 = exp20 && (mant >= 10'h10b);",
                "  wire [15:0] formula_out = {sign, core_mag};",
                "  wire [15:0] boundary_out = underflow_exp10 ? signed_zero :",
                "                              min_normal_exp10 ? {sign, 15'h0400} :",
                "                              overflow_exp20 ? signed_inf : formula_out;",
                "  wire [15:0] special_out = (exp == 5'h1f && mant != 10'h000) ? 16'h7e00 :",
                "                           ((exp <= 5'd9) ? signed_zero : signed_inf);",
                "  assign out = (active_core || exp10 || exp20) ? boundary_out : special_out;",
            ]
        )
        metas.append("boundary_clamp=exp10 mant1..0x109 zero, mant0x10a min-normal, exp20 mant>=0x10b inf")
    elif case == "ex238":
        lines.extend(
            [
                "  wire active_core = (exp >= 5'd10) && (exp <= 5'd18);",
                "  wire exp9 = (exp == 5'd9);",
                "  wire exp19 = (exp == 5'd19);",
                "  wire overflow_exp9 = exp9 && (mant <= 10'h259);",
                "  wire underflow_exp19 = exp19 && (mant >= 10'h25a);",
                "  wire [15:0] formula_out = {sign, core_mag};",
                "  wire [15:0] boundary_out = overflow_exp9 ? signed_inf :",
                "                              underflow_exp19 ? signed_zero : formula_out;",
                "  wire [15:0] special_out = (exp == 5'h1f && mant != 10'h000) ? 16'h7e00 :",
                "                           ((exp <= 5'd8) ? signed_inf : signed_zero);",
                "  assign out = (active_core || exp9 || exp19) ? boundary_out : special_out;",
            ]
        )
        metas.append("boundary_clamp=exp9 mant<=0x259 inf, exp19 mant>=0x25a zero")
    else:
        raise RuntimeError("unsupported case {0}".format(case))
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
        "classification": "semantic_core_clamp",
        "notes": "",
    }


def run_one(args, refs, case, nested_hi, flow_name, script_func):
    table = TruthTable(args.benchmarks / "{0}.truth".format(case))
    variant_base = "core_clamp_hi{0}".format(nested_hi)
    module = "{0}_{1}".format(case, variant_base)
    text, note = render_candidate(case, table, module, nested_hi)
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
            source="fp16_ex236_ex238_core_clamp",
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
    print("{0} {1} eq={2} area={3} delay={4} adp={5}".format(case, variant, row["equivalent"], row["area"], row["delay"], row["adp"]))
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
    parser = argparse.ArgumentParser(description="Core formula plus boundary clamps for ex236/ex238.")
    parser.add_argument("--cases", default="ex236,ex238")
    parser.add_argument("--nested-his", default="5,6,7")
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
        "default": ("default", script_default),
        "no_internal_abc": ("no_internal_abc", script_no_internal_abc),
        "abc_fast": ("abc_fast", lambda v, m, o: script_default(v, m, o).replace("abc -g AND", "abc -fast -g AND")),
        "abc_d20": ("abc_d20", lambda v, m, o: script_abc_d(v, m, o, 20)),
        "abc_d21": ("abc_d21", lambda v, m, o: script_abc_d(v, m, o, 21)),
        "abc_d22": ("abc_d22", lambda v, m, o: script_abc_d(v, m, o, 22)),
        "abc_d24": ("abc_d24", lambda v, m, o: script_abc_d(v, m, o, 24)),
        "abc_g_simple": ("abc_g_simple", lambda v, m, o: script_abc_gate(v, m, o, "simple")),
        "abc_g_and_mux": ("abc_g_and_mux", lambda v, m, o: script_abc_gate(v, m, o, "AND,MUX")),
        "extra_opt_share": ("extra_opt_share", script_extra_opt),
        "late_flatten": ("late_flatten", script_late_flatten),
        "synth_preset": ("synth_preset", script_synth_preset),
        "synth_preset_noabc": ("synth_preset_noabc", lambda v, m, o: script_synth_preset(v, m, o, noabc=True)),
        "abc_g_aig_d18": ("abc_g_aig_d18", lambda v, m, o: script_default(v, m, o).replace("abc -g AND", "abc -g aig -D 18")),
        "abc_g_aig_d19": ("abc_g_aig_d19", lambda v, m, o: script_default(v, m, o).replace("abc -g AND", "abc -g aig -D 19")),
        "abc_g_aig_d20": ("abc_g_aig_d20", lambda v, m, o: script_default(v, m, o).replace("abc -g AND", "abc -g aig -D 20")),
        "abc_g_aig_d21": ("abc_g_aig_d21", lambda v, m, o: script_default(v, m, o).replace("abc -g AND", "abc -g aig -D 21")),
        "abc_g_gates": ("abc_g_gates", lambda v, m, o: script_abc_gate(v, m, o, "gates")),
        "abc_g_cmos2": ("abc_g_cmos2", lambda v, m, o: script_abc_gate(v, m, o, "cmos2")),
    }
    flows = [flow_map[item.strip()] for item in args.flows.split(",") if item.strip()]
    rows = []
    summary = []
    for case in [item.strip() for item in args.cases.split(",") if item.strip()]:
        table = TruthTable(args.benchmarks / "{0}.truth".format(case))
        for nested_hi in [int(item) for item in args.nested_his.split(",") if item.strip()]:
            for flow_name, script_func in flows:
                rows.append(run_one(args, refs, case, nested_hi, flow_name, script_func))
            _, note = render_candidate(case, table, "{0}_summary".format(case), nested_hi)
            summary.append({"case": case, "variant": "core_clamp_hi{0}".format(nested_hi), "notes": note})
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
