#!/usr/bin/env python3
"""Semantic exponent-formula wrappers for FP16 ex235-ex239.

The current best seeds for these power/root cases still emit some output
exponent bits through structural run trees or pair tables.  This script keeps
the proven current seed as the mantissa/special-value base, but replaces the
active-normal output exponent with a hand-derived semantic formula:

- reciprocal_sqrt: exponent half-down with one mantissa-zero correction
- cube / reciprocal_cube: 3*exp plus mantissa normalization delta
- cbrt / reciprocal_cbrt: divide-by-three exponent class with endpoint bump

Each candidate is exact-checked through the project ABC/evaluate flow.
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
    "ex235": {
        "label": "fp16_reciprocal_sqrt",
        "base_path": SEED_ROOT / "ex235/verilog/ex235_open_low8_hi6.v",
        "base_module": "ex235_open_low8_hi6",
    },
    "ex236": {
        "label": "fp16_cube",
        "base_path": SEED_ROOT / "ex236/verilog/ex236_sign_only.v",
        "base_module": "ex236_sign_only",
    },
    "ex237": {
        "label": "fp16_cbrt",
        "base_path": SEED_ROOT / "ex237/verilog/ex237_open_low10_hi6.v",
        "base_module": "ex237_open_low10_hi6",
    },
    "ex238": {
        "label": "fp16_reciprocal_cube",
        "base_path": SEED_ROOT / "ex238/verilog/ex238_b10_9_formula_expr.v",
        "base_module": "ex238_b10_9_formula_expr",
    },
    "ex239": {
        "label": "fp16_reciprocal_cbrt",
        "base_path": SEED_ROOT / "ex239/verilog/ex239_open_low8_hi6.v",
        "base_module": "ex239_open_low8_hi6",
    },
}


def write_text(path, text):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(text)


def cbrt_base_exp(exp):
    return (exp - 15) // 3 + 15


def recip_cbrt_base_exp(exp):
    return 19 - (exp // 3)


def render_div3_case(values_name, fn):
    lines = ["  reg [4:0] {0};".format(values_name), "  always @* begin", "    case (exp)"]
    for exp in range(32):
        lines.append("      5'h{0:02x}: {1} = 5'd{2};".format(exp, values_name, fn(exp)))
    lines.extend(["      default: {0} = 5'd0;".format(values_name), "    endcase", "  end"])
    return lines


def render_formula(case):
    prelude = [
        "  wire sign = in[15];",
        "  wire [4:0] exp = in[14:10];",
        "  wire [9:0] mant = in[9:0];",
        "  wire mant_zero = (mant == 10'h000);",
        "  wire mant_last = (mant == 10'h3ff);",
        "  reg [4:0] formula_exp;",
        "  reg use_formula;",
    ]
    note = ""
    if case == "ex235":
        lines = prelude + [
            "  always @* begin",
            "    use_formula = 1'b0;",
            "    formula_exp = base_out[14:10];",
        ]
        lines.extend(
            [
                "    if (!sign && exp >= 5'd1 && exp <= 5'd30) begin",
                "      use_formula = 1'b1;",
                "      formula_exp = (5'd22 - ((exp + 5'd1) >> 1)) + ((exp[0] && mant_zero) ? 5'd1 : 5'd0);",
                "    end",
                "  end",
            ]
        )
        note = "active positive reciprocal_sqrt exponent formula; base=22-((exp+1)>>1), odd mant0 bump"
    elif case == "ex236":
        lines = prelude + [
            "  reg [1:0] delta;",
            "  reg [6:0] wide_exp;",
            "  always @* begin",
            "    use_formula = 1'b0;",
            "    formula_exp = base_out[14:10];",
            "    delta = 2'd0;",
            "    wide_exp = 7'd0;",
        ]
        lines.extend(
            [
                "    if (exp >= 5'd10 && exp <= 5'd20) begin",
                "      use_formula = 1'b1;",
                "      if (mant >= 10'd602) delta = 2'd2;",
                "      else if ((exp == 5'd10 && mant >= 10'd266) || (exp != 5'd10 && mant >= 10'd267)) delta = 2'd1;",
                "      else delta = 2'd0;",
                "      wide_exp = ({2'b0, exp} + ({2'b0, exp} << 1)) - 7'd30 + {5'd0, delta};",
                "      formula_exp = (wide_exp >= 7'd31) ? 5'd31 : wide_exp[4:0];",
                "    end",
                "  end",
            ]
        )
        note = "cube exponent formula; 3*exp-30 plus mantissa normalization delta and saturation"
    elif case == "ex237":
        lines = prelude
        lines.extend(render_div3_case("base_cbrt_exp", cbrt_base_exp))
        lines.extend(
            [
                "  always @* begin",
                "    use_formula = 1'b0;",
                "    formula_exp = base_out[14:10];",
                "    if (exp >= 5'd1 && exp <= 5'd30) begin",
                "      use_formula = 1'b1;",
                "      formula_exp = base_cbrt_exp + (((exp == 5'd2 || exp == 5'd5 || exp == 5'd8 || exp == 5'd11 || exp == 5'd14 || exp == 5'd17 || exp == 5'd20 || exp == 5'd23 || exp == 5'd26 || exp == 5'd29) && mant_last) ? 5'd1 : 5'd0);",
                "    end",
                "  end",
            ]
        )
        note = "cbrt exponent formula; floor((exp-15)/3)+15 plus exp%3==2 mantissa endpoint bump"
        return lines, note
    elif case == "ex238":
        lines = prelude + [
            "  reg [1:0] delta;",
            "  reg [7:0] wide_exp;",
            "  always @* begin",
            "    use_formula = 1'b0;",
            "    formula_exp = base_out[14:10];",
            "    delta = 2'd0;",
            "    wide_exp = 8'd0;",
        ]
        lines.extend(
            [
                "    if (exp >= 5'd9 && exp <= 5'd19) begin",
                "      use_formula = 1'b1;",
                "      if (mant >= 10'd602) delta = 2'd3;",
                "      else if (mant >= 10'd267) delta = 2'd2;",
                "      else if (mant >= 10'd1) delta = 2'd1;",
                "      else delta = 2'd0;",
                "      wide_exp = 8'd60 - ({3'b0, exp} + ({3'b0, exp} << 1)) - {6'd0, delta};",
                "      if (wide_exp >= 8'd31) formula_exp = 5'd31;",
                "      else formula_exp = wide_exp[4:0];",
                "    end",
                "  end",
            ]
        )
        note = "reciprocal_cube exponent formula; 60-3*exp-delta with high/low saturation"
    elif case == "ex239":
        lines = prelude
        lines.extend(render_div3_case("base_rcbrt_exp", recip_cbrt_base_exp))
        lines.extend(
            [
                "  always @* begin",
                "    use_formula = 1'b0;",
                "    formula_exp = base_out[14:10];",
                "    if (exp >= 5'd1 && exp <= 5'd30) begin",
                "      use_formula = 1'b1;",
                "      formula_exp = base_rcbrt_exp + (((exp == 5'd3 || exp == 5'd6 || exp == 5'd9 || exp == 5'd12 || exp == 5'd15 || exp == 5'd18 || exp == 5'd21 || exp == 5'd24 || exp == 5'd27 || exp == 5'd30) && mant_zero) ? 5'd1 : 5'd0);",
                "    end",
                "  end",
            ]
        )
        note = "reciprocal_cbrt exponent formula; 19-floor(exp/3) plus exp%3==0 mantissa-zero bump"
        return lines, note
    else:
        raise RuntimeError("unknown case {0}".format(case))
    return lines, note


def render_candidate(case, module):
    cfg = CASE_CONFIG[case]
    base_source = cfg["base_path"].read_text()
    lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [15:0] out;",
        "  wire [15:0] base_out;",
        "  {0} u_base(.in(in), .out(base_out));".format(cfg["base_module"]),
    ]
    formula_lines, note = render_formula(case)
    lines.extend(formula_lines)
    lines.append("  assign out[15] = base_out[15];")
    for bit in range(15):
        if 10 <= bit <= 14:
            lines.append("  assign out[{0}] = use_formula ? formula_exp[{1}] : base_out[{0}];".format(bit, bit - 10))
        else:
            lines.append("  assign out[{0}] = base_out[{0}];".format(bit))
    lines.extend(["endmodule", "", base_source, ""])
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
        "classification": "semantic_exponent_formula_wrapper",
        "notes": "",
    }


def run_one(args, refs, case, flow_name, script_func):
    module = "{0}_exp_formula_wrapper".format(case)
    text, note = render_candidate(case, module)
    verilog_path = args.work_dir / case / "verilog" / "{0}.v".format(module)
    write_text(verilog_path, text)
    variant = "exp_formula_{0}".format(flow_name)
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
            source="fp16_ex235_ex239_exp_formula_wrapper",
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
    parser = argparse.ArgumentParser(description="Semantic exponent formula wrappers for ex235-ex239.")
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
        _, note = render_candidate(case, "{0}_exp_formula_wrapper".format(case))
        summary.append({"case": case, "variant": "exp_formula_wrapper", "notes": note})
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
