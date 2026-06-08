#!/usr/bin/env python3
"""Direct semantic-special open structures for FP16 ex235/ex237/ex239.

This is a focused follow-up to the semantic-shell wrapper.  The wrapper proved
that ex239 benefits when zero/inf/NaN handling is expressed semantically, but it
also adds one extra output mux around an already synthesized open seed.  This
generator emits the same open low/high structure directly with semantic special
guards, so Yosys can share or trim the special path before AIG generation.
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
    render_high_bit,
    render_low_nested,
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
from student.scripts.yosys_synthflow_variants import (
    script_abc_d,
    script_abc_gate,
    script_default,
    script_extra_opt,
    script_late_flatten,
    script_no_internal_abc,
    script_synth_preset,
)


BEST_SPECS = {
    "ex235": (8, 6),
    "ex237": (10, 6),
    "ex239": (8, 6),
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


def render_semantic_special(lines, case):
    if case == "ex235":
        lines.extend(
            [
                "  wire [15:0] special_out = (exp == 5'd0) ? {sign, 5'h1f, 10'h000} :",
                "                           ((!sign && exp == 5'h1f && mant == 10'h000) ? 16'h0000 : 16'h7e00);",
            ]
        )
        return "semantic_special=reciprocal_sqrt: exp0 signed inf, +inf zero, other inactive canonical NaN"
    if case == "ex237":
        lines.extend(
            [
                "  wire [15:0] special_out = (exp == 5'd0) ? {sign, 15'h0000} :",
                "                           ((mant == 10'h000) ? {sign, 5'h1f, 10'h000} : 16'h7e00);",
            ]
        )
        return "semantic_special=cbrt: exp0 signed zero, inf pass, NaN canonical"
    if case == "ex239":
        lines.extend(
            [
                "  wire [15:0] special_out = (exp == 5'd0) ? {sign, 5'h1f, 10'h000} :",
                "                           ((mant == 10'h000) ? {sign, 15'h0000} : 16'h7e00);",
            ]
        )
        return "semantic_special=reciprocal_cbrt: exp0 signed inf, inf signed zero, NaN canonical"
    raise RuntimeError("unsupported case {0}".format(case))


def render_candidate(case, table, module, low_width, nested_hi):
    cfg = CASE_CONFIG[case]
    high_bits = list(range(14, low_width - 1, -1))
    lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [15:0] out;",
        "  wire sign = in[15];",
        "  wire [4:0] exp = in[14:10];",
        "  wire [9:0] mant = in[9:0];",
        "  wire active = {0};".format(active_condition(case)),
    ]
    metas = [render_semantic_special(lines, case)]
    render_class_logic(lines, cfg)
    metas.append(render_low_nested(lines, table, cfg, low_width, nested_hi))
    for bit in high_bits:
        metas.append(render_high_bit(lines, table, cfg, bit, low_width))
    pieces = ["mag_b{0}".format(bit) for bit in high_bits]
    pieces.append("out_low")
    lines.append("  wire [14:0] active_mag = {" + ", ".join(pieces) + "};")
    if cfg["sign_mode"] == "pass":
        lines.append("  wire [15:0] active_out = {sign, active_mag};")
    else:
        lines.append("  wire [15:0] active_out = {1'b0, active_mag};")
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
        "classification": "semantic_direct_special_open",
        "notes": "",
    }


def run_one(args, refs, case, low_width, nested_hi, flow_name, script_func):
    table = TruthTable(args.benchmarks / "{0}.truth".format(case))
    variant_base = "direct_special_low{0}_hi{1}".format(low_width, nested_hi)
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
            source="fp16_ex235_ex237_ex239_direct_special",
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
    print(
        "{0} {1} eq={2} area={3} delay={4} adp={5}".format(
            case, flow_name, row["equivalent"], row["area"], row["delay"], row["adp"]
        )
    )
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
    parser = argparse.ArgumentParser(description="Direct semantic-special structures for ex235/ex237/ex239.")
    parser.add_argument("--cases", default="ex235,ex237,ex239")
    parser.add_argument("--specs", default="")
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
        "abc_fast": (
            "abc_fast",
            lambda v, m, o: script_default(v, m, o).replace("abc -g AND", "abc -fast -g AND"),
        ),
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
        "abc_g_aig_d18": (
            "abc_g_aig_d18",
            lambda v, m, o: script_default(v, m, o).replace("abc -g AND", "abc -g aig -D 18"),
        ),
        "abc_g_aig_d19": (
            "abc_g_aig_d19",
            lambda v, m, o: script_default(v, m, o).replace("abc -g AND", "abc -g aig -D 19"),
        ),
        "abc_g_aig_d20": (
            "abc_g_aig_d20",
            lambda v, m, o: script_default(v, m, o).replace("abc -g AND", "abc -g aig -D 20"),
        ),
        "abc_g_aig_d21": (
            "abc_g_aig_d21",
            lambda v, m, o: script_default(v, m, o).replace("abc -g AND", "abc -g aig -D 21"),
        ),
        "abc_g_gates": ("abc_g_gates", lambda v, m, o: script_abc_gate(v, m, o, "gates")),
        "abc_g_cmos2": ("abc_g_cmos2", lambda v, m, o: script_abc_gate(v, m, o, "cmos2")),
    }
    flows = [flow_map[name.strip()] for name in args.flows.split(",") if name.strip()]
    rows = []
    summary = []
    for case in [item.strip() for item in args.cases.split(",") if item.strip()]:
        if args.specs:
            specs = []
            for item in args.specs.split(","):
                low_width, nested_hi = item.split(":", 1)
                specs.append((int(low_width), int(nested_hi)))
        else:
            specs = [BEST_SPECS[case]]
        table = TruthTable(args.benchmarks / "{0}.truth".format(case))
        for low_width, nested_hi in specs:
            for flow_name, script_func in flows:
                rows.append(run_one(args, refs, case, low_width, nested_hi, flow_name, script_func))
            _, note = render_candidate(case, table, "{0}_summary".format(case), low_width, nested_hi)
            summary.append(
                {
                    "case": case,
                    "variant": "direct_special_low{0}_hi{1}".format(low_width, nested_hi),
                    "notes": note,
                }
            )
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
