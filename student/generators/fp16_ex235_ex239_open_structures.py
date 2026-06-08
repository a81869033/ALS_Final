#!/usr/bin/env python3
"""Open structural candidates for FP16 ex235-ex239.

The first pass is intentionally diagnosis-driven:
- keep exact special/boundary regions,
- use the observed exponent parity/mod-class when it is exact,
- encode high output bits as shallow run trees,
- encode noisy low bits as a nested mantissa hi/lo LUT.

This is not a fixed template for the group.  It is one source family to test
against the measured truth-table structure before trying other rewrites.
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
    "ex235": {
        "label": "fp16_reciprocal_sqrt",
        "active_exps": list(range(1, 31)),
        "sign_mode": "positive_only",
        "class_mode": "parity",
        "class_samples": {0: 2, 1: 1},
    },
    "ex236": {
        "label": "fp16_cube",
        "active_exps": list(range(11, 20)),
        "sign_mode": "pass",
        "class_mode": "single",
        "class_samples": {0: 11},
    },
    "ex237": {
        "label": "fp16_cbrt",
        "active_exps": list(range(1, 31)),
        "sign_mode": "pass",
        "class_mode": "mod3",
        "class_samples": {0: 3, 1: 1, 2: 2},
    },
    "ex238": {
        "label": "fp16_reciprocal_cube",
        "active_exps": list(range(10, 19)),
        "sign_mode": "pass",
        "class_mode": "single",
        "class_samples": {0: 10},
    },
    "ex239": {
        "label": "fp16_reciprocal_cbrt",
        "active_exps": list(range(1, 31)),
        "sign_mode": "pass",
        "class_mode": "mod3",
        "class_samples": {0: 3, 1: 1, 2: 2},
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


def active_condition(case):
    cfg = CASE_CONFIG[case]
    checks = ["(exp >= 5'd{0}) && (exp <= 5'd{1})".format(min(cfg["active_exps"]), max(cfg["active_exps"]))]
    if cfg["sign_mode"] == "positive_only":
        checks.append("!sign")
    return " && ".join(checks)


def render_class_logic(lines, cfg):
    mode = cfg["class_mode"]
    if mode == "single":
        lines.append("  wire [1:0] cls = 2'd0;")
        return
    if mode == "parity":
        lines.append("  wire [1:0] cls = {1'b0, exp[0]};")
        return
    if mode == "mod3":
        lines.extend(
            [
                "  reg [1:0] cls;",
                "  always @* begin",
                "    case (exp)",
            ]
        )
        for exp in range(1, 31):
            cls = exp % 3
            lines.append("      {0}: cls = {1};".format(const_word(5, exp), const_word(2, cls)))
        lines.extend(["      default: cls = 2'd0;", "    endcase", "  end"])
        return
    raise RuntimeError("unsupported class mode {0}".format(mode))


def table_output(table, exp, mant):
    return table.get_output((exp << MANT_BITS) | mant)


def positive_mag(table, exp, mant):
    return table_output(table, exp, mant) & 0x7FFF


def class_low_values(table, cfg, low_width):
    values = {}
    mask = (1 << low_width) - 1
    for cls, exp in cfg["class_samples"].items():
        values[cls] = [positive_mag(table, exp, mant) & mask for mant in range(MANT_SIZE)]
    return values


def render_low_nested(lines, table, cfg, low_width, nested_hi):
    lo_bits = MANT_BITS - nested_hi
    low_values = class_low_values(table, cfg, low_width)
    classes = sorted(low_values)
    lines.extend(
        [
            "  reg [{0}:0] out_low;".format(low_width - 1),
            "  always @* begin",
        ]
    )
    if len(classes) > 1:
        lines.append("    case (cls)")
    for cls in classes:
        indent = "      " if len(classes) > 1 else "    "
        if len(classes) > 1:
            lines.append("      {0}: begin".format(const_word(2, cls)))
        lines.append("{0}case (mant[9:{1}])".format(indent, lo_bits))
        for hi in range(1 << nested_hi):
            bucket = [low_values[cls][(hi << lo_bits) | lo] for lo in range(1 << lo_bits)]
            if len(set(bucket)) == 1:
                lines.append("{0}  {1}: out_low = {2};".format(indent, const_word(nested_hi, hi), const_word(low_width, bucket[0])))
            else:
                lines.append("{0}  {1}: begin".format(indent, const_word(nested_hi, hi)))
                lines.append("{0}    case (mant[{1}:0])".format(indent, lo_bits - 1))
                for lo, value in enumerate(bucket):
                    lines.append("{0}      {1}: out_low = {2};".format(indent, const_word(lo_bits, lo), const_word(low_width, value)))
                lines.extend(
                    [
                        "{0}      default: out_low = {1};".format(indent, const_word(low_width, 0)),
                        "{0}    endcase".format(indent),
                        "{0}  end".format(indent),
                    ]
                )
        lines.extend(["{0}  default: out_low = {1};".format(indent, const_word(low_width, 0)), "{0}endcase".format(indent)])
        if len(classes) > 1:
            lines.append("      end")
    if len(classes) > 1:
        lines.extend(["      default: out_low = {0};".format(const_word(low_width, 0)), "    endcase"])
    lines.append("  end")
    return "low_width={0}; nested_hi={1}; classes={2}".format(low_width, nested_hi, ",".join(str(item) for item in classes))


def render_high_bit(lines, table, cfg, bit, low_width):
    name = "mag_b{0}".format(bit)
    lines.append("  reg {0};".format(name))
    lines.append("  always @* begin")
    lines.append("    case (exp)")
    total_runs = 0
    max_runs = 0
    const_groups = 0
    for exp in cfg["active_exps"]:
        values = [str((positive_mag(table, exp, mant) >> bit) & 1) for mant in range(MANT_SIZE)]
        runs = bit_runs(values)
        total_runs += len(runs)
        max_runs = max(max_runs, len(runs))
        const_groups += int(len(runs) == 1)
        lines.append("      {0}: begin".format(const_word(5, exp)))
        emit_tree(lines, runs, "        ", name)
        lines.append("      end")
    lines.extend(["      default: {0} = 1'b0;".format(name), "    endcase", "  end"])
    return "b{0}:runs={1},max={2},const={3}".format(bit, total_runs, max_runs, const_groups)


def render_special_table(lines, table, case):
    cfg = CASE_CONFIG[case]
    active = set(cfg["active_exps"])
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
        sign = sign_exp >> 5
        exp = sign_exp & 31
        if exp in active and (cfg["sign_mode"] == "pass" or sign == 0):
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


def render_candidate(case, table, module, low_width, nested_hi):
    cfg = CASE_CONFIG[case]
    high_bits = list(range(14, low_width - 1, -1))
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
            source="fp16_ex235_ex239_open_structures",
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
    parser = argparse.ArgumentParser(description="Open structural candidates for FP16 ex235-ex239.")
    parser.add_argument("--cases", default="ex235,ex236,ex237,ex238,ex239")
    parser.add_argument("--specs", default="8:5,9:5,10:5,11:5,12:5,10:6,12:6")
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


def main():
    args = parse_args()
    refs = load_reference(args.reference)
    cases = [case.strip() for case in args.cases.split(",") if case.strip()]
    specs = []
    for item in args.specs.split(","):
        low_width, nested_hi = item.split(":", 1)
        specs.append((int(low_width), int(nested_hi)))
    flow_map = {
        "abc_g_aig": ("abc_g_aig", lambda v, m, o: script_abc_gate(v, m, o, "aig")),
        "default": ("default", lambda v, m, o: script_default(v, m, o)),
    }
    flows = [flow_map[name.strip()] for name in args.flows.split(",") if name.strip()]
    rows = []
    summary = []
    for case in cases:
        table = TruthTable(args.benchmarks / "{0}.truth".format(case))
        cfg = CASE_CONFIG[case]
        for low_width, nested_hi in specs:
            variant = "open_low{0}_hi{1}".format(low_width, nested_hi)
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
