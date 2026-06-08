#!/usr/bin/env python3
"""Apply the ex232 nested-mantissa lesson to FP16 cases before ex235."""

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
from student.generators.fp16_ex232_square_deep import (
    MANT_BITS,
    MANT_SIZE,
    bit_runs,
    const_word,
    emit_tree,
    render_mant_lut_nested,
)
from student.generators.fp16_semantic_search import (
    BEST_FIELDNAMES,
    RESULT_FIELDNAMES,
    add_reference_columns,
    load_reference,
    rel_path,
    write_csv,
)
from student.scripts.yosys_synthflow_variants import script_abc_gate, script_default


CASE_CONFIG = {
    "ex231": {
        "label": "fp16_reciprocal",
        "active": list(range(1, 29)),
        "classes": [0],
        "class_expr": "1'b0",
        "sample_exp": {0: 1},
    },
    "ex233": {
        "label": "fp16_sqrt",
        "active": list(range(1, 31)),
        "classes": [0, 1],
        "class_expr": "exp[0]",
        "sample_exp": {0: 2, 1: 1},
    },
    "ex234": {
        "label": "fp16_reciprocal_square",
        "active": list(range(8, 22)),
        "classes": [0],
        "class_expr": "1'b0",
        "sample_exp": {0: 8},
    },
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


def exp_formula_lines(case):
    if case == "ex231":
        return [
            "  wire active_normal = (exp >= 5'd1) && (exp <= 5'd28);",
            "  wire mant_nonzero = |mant;",
            "  wire [5:0] out_exp_wide = 6'd30 - {1'b0, exp} - {5'b00000, mant_nonzero};",
            "  wire [4:0] out_exp = out_exp_wide[4:0];",
        ]
    if case == "ex233":
        return [
            "  wire active_normal = (exp >= 5'd1) && (exp <= 5'd30);",
            "  wire [5:0] out_exp_wide = ({1'b0, exp} + 6'd15) >> 1;",
            "  wire [4:0] out_exp = out_exp_wide[4:0];",
        ]
    if case == "ex234":
        return [
            "  wire active_normal = (exp >= 5'd8) && (exp <= 5'd21);",
            "  wire mant_nonzero = |mant;",
            "  wire mant_hi = mant >= 10'd425;",
            "  wire [6:0] out_exp_wide = 7'd45 - ({2'b00, exp} << 1) - {6'b000000, mant_nonzero} - {6'b000000, mant_hi};",
            "  wire [4:0] out_exp = out_exp_wide[4:0];",
        ]
    raise RuntimeError("unsupported case {0}".format(case))


def relation_lines(case):
    if case == "ex231":
        return [
            "  wire [15:0] pos_out = active_normal ? {1'b0, out_exp, out_mant} : special_out;",
            "  wire [15:0] neg_out = (pos_out == 16'h7e00) ? 16'h7e00 : (pos_out | 16'h8000);",
            "  assign out = sign ? neg_out : pos_out;",
        ]
    if case == "ex233":
        return [
            "  wire [15:0] pos_out = active_normal ? {1'b0, out_exp, out_mant} : special_out;",
            "  assign out = sign ? ((exp == 5'd0) ? 16'h8000 : 16'h7e00) : pos_out;",
        ]
    if case == "ex234":
        return [
            "  wire [15:0] pos_out = active_normal ? {1'b0, out_exp, out_mant} : special_out;",
            "  assign out = pos_out;",
        ]
    raise RuntimeError("unsupported case {0}".format(case))


def render_special_table(lines, table, case, active):
    active = set(active)
    lines.extend(
        [
            "  reg [15:0] special_out;",
            "  always @* begin",
            "    special_out = 16'h0000;",
            "    case (exp)",
        ]
    )
    for exp in range(32):
        if exp in active:
            continue
        values = [table.get_output((exp << MANT_BITS) | mant) for mant in range(MANT_SIZE)]
        if len(set(values)) == 1:
            lines.append("      {0}: special_out = {1};".format(const_word(5, exp), const_word(16, values[0])))
        else:
            lines.append("      {0}: begin".format(const_word(5, exp)))
            lines.append("        case (mant)")
            for mant, value in enumerate(values):
                lines.append("          {0}: special_out = {1};".format(const_word(MANT_BITS, mant), const_word(16, value)))
            lines.extend(["          default: special_out = 16'h0000;", "        endcase", "      end"])
    lines.extend(["      default: special_out = 16'h0000;", "    endcase", "  end"])


def render_class_lut_nested(lines, class_values, low_width, high_width):
    low_name = "mant_low"
    lines.append("  reg [{0}:0] {1};".format(low_width - 1, low_name))
    lines.append("  always @* begin")
    if len(class_values) == 1:
        render_mant_lut_nested_body(lines, class_values[0], low_width, low_name, high_width, "    ")
    else:
        lines.append("    case (cls)")
        for cls, values in sorted(class_values.items()):
            lines.append("      {0}: begin".format(const_word(1, cls)))
            render_mant_lut_nested_body(lines, values, low_width, low_name, high_width, "        ")
            lines.append("      end")
        lines.extend(["      default: {0} = {1};".format(low_name, const_word(low_width, 0)), "    endcase"])
    lines.append("  end")
    return low_name


def render_mant_lut_nested_body(lines, mant_values, width, name, high_width, indent):
    low_width = MANT_BITS - high_width
    lines.append("{0}case (mant[9:{1}])".format(indent, low_width))
    for high in range(1 << high_width):
        lines.append("{0}  {1}: begin".format(indent, const_word(high_width, high)))
        lines.append("{0}    case (mant[{1}:0])".format(indent, low_width - 1))
        for low in range(1 << low_width):
            mant = (high << low_width) | low
            value = mant_values[mant] & ((1 << width) - 1)
            lines.append("{0}      {1}: {2} = {3};".format(indent, const_word(low_width, low), name, const_word(width, value)))
        lines.extend(
            [
                "{0}      default: {1} = {2};".format(indent, name, const_word(width, 0)),
                "{0}    endcase".format(indent),
                "{0}  end".format(indent),
            ]
        )
    lines.extend(
        [
            "{0}  default: {1} = {2};".format(indent, name, const_word(width, 0)),
            "{0}endcase".format(indent),
        ]
    )


def render_bit_tree_for_class(lines, class_values, bit, target):
    lines.append("  reg {0};".format(target))
    lines.append("  always @* begin")
    if len(class_values) == 1:
        runs = bit_runs([str((value >> bit) & 1) for value in class_values[0]])
        emit_tree(lines, runs, "    ", target)
        meta = ["b{0}:{1}runs".format(bit, len(runs))]
    else:
        meta = []
        lines.append("    case (cls)")
        for cls, values in sorted(class_values.items()):
            runs = bit_runs([str((value >> bit) & 1) for value in values])
            meta.append("b{0}c{1}:{2}runs".format(bit, cls, len(runs)))
            lines.append("      {0}: begin".format(const_word(1, cls)))
            emit_tree(lines, runs, "        ", target)
            lines.append("      end")
        lines.extend(["      default: {0} = 1'b0;".format(target), "    endcase"])
    lines.append("  end")
    return meta


def mantissa_values(table, case):
    cfg = CASE_CONFIG[case]
    out = {}
    for cls, exp in cfg["sample_exp"].items():
        out[cls] = [table.get_output((exp << MANT_BITS) | mant) & 0x03FF for mant in range(MANT_SIZE)]
    return out


def render_candidate(case, table, module, high_bits, nested_hi):
    cfg = CASE_CONFIG[case]
    class_values = mantissa_values(table, case)
    low_width = min(high_bits)
    lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [15:0] out;",
        "  wire sign = in[15];",
        "  wire [4:0] exp = in[14:10];",
        "  wire [9:0] mant = in[9:0];",
        "  wire cls = {0};".format(cfg["class_expr"]),
    ]
    lines.extend(exp_formula_lines(case))
    render_special_table(lines, table, case, cfg["active"])
    low_name = render_class_lut_nested(lines, class_values, low_width, nested_hi)
    metas = []
    for bit in sorted(high_bits, reverse=True):
        target = "mant_b{0}".format(bit)
        metas.extend(render_bit_tree_for_class(lines, class_values, bit, target))
    pieces = ["mant_b{0}".format(bit) for bit in sorted(high_bits, reverse=True)]
    pieces.append(low_name)
    lines.append("  wire [9:0] out_mant = {" + ", ".join(pieces) + "};")
    lines.extend(relation_lines(case))
    lines.extend(["endmodule", ""])
    note = "ex232-style exponent formula plus mantissa high run trees {0}; low{1} nested_hi{2}".format(
        ";".join(metas),
        low_width,
        nested_hi,
    )
    return "\n".join(lines), note


def verify_truth(table, case, text_model):
    for index in range(1 << 16):
        if table.get_output(index) != text_model(index):
            return False, index, table.get_output(index), text_model(index)
    return True, None, None, None


def model_from_truth(table):
    return lambda index: table.get_output(index)


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
        "classification": "semantic_exact",
        "notes": "",
    }


def run_one(args, refs, case, variant, module, verilog_text, note, flow_name, script_func):
    verilog_path = args.work_dir / case / "verilog" / "{0}.v".format(module)
    write_text(verilog_path, verilog_text)
    candidate_id = "{0}_{1}_{2}".format(case, variant, flow_name)
    aig_path = args.work_dir / case / "aigs" / "{0}.aig".format(candidate_id)
    log_path = args.work_dir / case / "logs" / "{0}.log".format(candidate_id)
    row = row_template(case, candidate_id, flow_name, verilog_path, aig_path, note)
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
            source="fp16_pre235_power_nested",
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
    parser = argparse.ArgumentParser(description="Apply ex232-style nested mantissa structures before ex235.")
    parser.add_argument("--cases", default="ex231,ex233,ex234")
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
    cases = [item.strip() for item in args.cases.split(",") if item.strip()]
    specs = [
        ([9, 8], 5),
        ([9, 8], 6),
        ([9, 8], 4),
        ([9], 6),
        ([9, 8, 7], 6),
    ]
    flows = [
        ("abc_g_aig", lambda v, m, o: script_abc_gate(v, m, o, "aig")),
        ("default", lambda v, m, o: script_default(v, m, o)),
    ]
    rows = []
    summary = []
    for case in cases:
        table = TruthTable(args.benchmarks / "{0}.truth".format(case))
        cfg = CASE_CONFIG[case]
        summary.append(
            {
                "case": case,
                "active": " ".join(str(exp) for exp in cfg["active"]),
                "classes": " ".join(str(cls) for cls in cfg["classes"]),
                "notes": "candidate suitable for ex232-style exponent/mantissa nested structure",
            }
        )
        for high_bits, nested_hi in specs:
            variant = "nested_bits{0}_hi{1}".format("_".join(str(bit) for bit in high_bits), nested_hi)
            module = "{0}_{1}".format(case, variant)
            text, note = render_candidate(case, table, module, high_bits, nested_hi)
            for flow_name, script_func in flows:
                rows.append(run_one(args, refs, case, variant, module, text, note, flow_name, script_func))
    write_csv(args.results, RESULT_FIELDNAMES, rows)
    write_csv(args.best_results, BEST_FIELDNAMES, best_rows(rows))
    args.summary.parent.mkdir(parents=True, exist_ok=True)
    with args.summary.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=["case", "active", "classes", "notes"])
        writer.writeheader()
        writer.writerows(summary)
    write_text(args.work_dir / "manifest.json", json.dumps(rows, indent=2) + "\n")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
