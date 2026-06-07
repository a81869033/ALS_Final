#!/usr/bin/env python3
"""Explicit masked-table current-best candidates for ex223/ex224."""

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
from student.frontends.yosys_synth import SynthError, synthesize_verilog
from student.generators.fp16_log_bitrun_hybrid import render_bit_cover
from student.generators.fp16_semantic_search import (
    BEST_FIELDNAMES,
    RESULT_FIELDNAMES,
    add_reference_columns,
    load_reference,
    rel_path,
    verify_outputs,
    write_csv,
    write_text,
)


MANT_SIZE = 1024


def const_word(width, value):
    return "{0}'h{1:0{2}x}".format(width, value & ((1 << width) - 1), (width + 3) // 4)


def render_casez_sign(lines):
    lines.extend(
        [
            "  always @* begin",
            "    casez (sign_exp)",
            "      6'b?00000: sign_out = 1'b1;",
            "      6'b000001: sign_out = 1'b1;",
            "      6'b00001?: sign_out = 1'b1;",
            "      6'b0001??: sign_out = 1'b1;",
            "      6'b0010??: sign_out = 1'b1;",
            "      6'b00110?: sign_out = 1'b1;",
            "      6'b001110: sign_out = 1'b1;",
            "      default: sign_out = 1'b0;",
            "    endcase",
            "  end",
        ]
    )


def pack_bits(value, bits):
    packed = 0
    for bit in sorted(bits, reverse=True):
        packed = (packed << 1) | ((value >> bit) & 1)
    return packed


def render_masked_table(outputs, module, bits):
    ordered = sorted(bits, reverse=True)
    width = len(ordered)
    lines = [
        "module {0}(in, out_bits);".format(module),
        "  input [15:0] in;",
        "  output [{0}:0] out_bits;".format(width - 1),
        "  wire [5:0] sign_exp = in[15:10];",
        "  wire [9:0] mant = in[9:0];",
        "  reg [{0}:0] out_r;".format(width - 1),
        "  always @* begin",
        "    case (sign_exp)",
    ]
    items = 0
    for sign_exp in range(64):
        values = [pack_bits(outputs[(sign_exp << 10) | mant], ordered) for mant in range(MANT_SIZE)]
        if len(set(values)) == 1:
            lines.append("      {0}: out_r = {1};".format(const_word(6, sign_exp), const_word(width, values[0])))
            items += 1
        else:
            lines.append("      {0}: begin".format(const_word(6, sign_exp)))
            lines.append("        case (mant)")
            for mant, value in enumerate(values):
                lines.append("          {0}: out_r = {1};".format(const_word(10, mant), const_word(width, value)))
                items += 1
            lines.extend(["          default: out_r = {0};".format(const_word(width, 0)), "        endcase", "      end"])
    lines.extend(["      default: out_r = {0};".format(const_word(width, 0)), "    endcase", "  end", "  assign out_bits = out_r;", "endmodule", ""])
    return "\n".join(lines), ordered, items


def runs(values):
    out = []
    start = 0
    current = values[0]
    for index, value in enumerate(values[1:], 1):
        if value != current:
            out.append((start, index - 1, current))
            start = index
            current = value
    out.append((start, len(values) - 1, current))
    return out


def emit_tree(lines, items, indent, target, width):
    if len(items) == 1:
        lines.append("{0}{1} = {2};".format(indent, target, const_word(width, items[0][2])))
        return
    mid = len(items) // 2
    left = items[:mid]
    right = items[mid:]
    boundary = left[-1][1]
    lines.append("{0}if (mant <= {1}) begin".format(indent, const_word(10, boundary)))
    emit_tree(lines, left, indent + "  ", target, width)
    lines.append("{0}end else begin".format(indent))
    emit_tree(lines, right, indent + "  ", target, width)
    lines.append("{0}end".format(indent))


def render_masked_run_table(outputs, module, bits):
    ordered = sorted(bits, reverse=True)
    width = len(ordered)
    lines = [
        "module {0}(in, out_bits);".format(module),
        "  input [15:0] in;",
        "  output [{0}:0] out_bits;".format(width - 1),
        "  wire [5:0] sign_exp = in[15:10];",
        "  wire [9:0] mant = in[9:0];",
        "  reg [{0}:0] out_r;".format(width - 1),
        "  always @* begin",
        "    case (sign_exp)",
    ]
    item_count = 0
    for sign_exp in range(64):
        values = [pack_bits(outputs[(sign_exp << 10) | mant], ordered) for mant in range(MANT_SIZE)]
        group_runs = runs(values)
        item_count += len(group_runs)
        lines.append("      {0}: begin".format(const_word(6, sign_exp)))
        emit_tree(lines, group_runs, "        ", "out_r", width)
        lines.append("      end")
    lines.extend(["      default: out_r = {0};".format(const_word(width, 0)), "    endcase", "  end", "  assign out_bits = out_r;", "endmodule", ""])
    return "\n".join(lines), ordered, item_count


def render_candidate(case, outputs, module, use_runs):
    if case == "ex223":
        table_bits = list(range(15))
        if use_runs:
            table_v, ordered, items = render_masked_run_table(outputs, module + "_table", table_bits)
        else:
            table_v, ordered, items = render_masked_table(outputs, module + "_table", table_bits)
        lines = [
            "module {0}(in, out);".format(module),
            "  input [15:0] in;",
            "  output [15:0] out;",
            "  wire [5:0] sign_exp = in[15:10];",
            "  reg sign_out;",
            "  wire [{0}:0] table_bits;".format(len(ordered) - 1),
            "  {0}_table u_table(.in(in), .out_bits(table_bits));".format(module),
        ]
        render_casez_sign(lines)
        lines.append("  assign out[15] = sign_out;")
        for index, bit in enumerate(reversed(ordered)):
            lines.append("  assign out[{0}] = table_bits[{1}];".format(bit, index))
        lines.extend(["endmodule", "", table_v])
        variant = "masked_run_casez_sign" if use_runs else "masked_table_casez_sign"
        items_text = "masked {0} bits=0..14; table_items={1}".format("run_tree" if use_runs else "case", items)
    else:
        table_bits = [bit for bit in range(16) if bit not in (15, 12, 11)]
        if use_runs:
            table_v, ordered, items = render_masked_run_table(outputs, module + "_table", table_bits)
        else:
            table_v, ordered, items = render_masked_table(outputs, module + "_table", table_bits)
        bit12_v, bit12_meta = render_bit_cover(outputs, module + "_bit12", 12, 8)
        bit11_v, bit11_meta = render_bit_cover(outputs, module + "_bit11", 11, 8)
        lines = [
            "module {0}(in, out);".format(module),
            "  input [15:0] in;",
            "  output [15:0] out;",
            "  wire [5:0] sign_exp = in[15:10];",
            "  reg sign_out;",
            "  wire bit12_out;",
            "  wire bit11_out;",
            "  wire [{0}:0] table_bits;".format(len(ordered) - 1),
            "  {0}_table u_table(.in(in), .out_bits(table_bits));".format(module),
            "  {0}_bit12 u_bit12(.in(in), .out_bit(bit12_out));".format(module),
            "  {0}_bit11 u_bit11(.in(in), .out_bit(bit11_out));".format(module),
        ]
        render_casez_sign(lines)
        table_index = {bit: index for index, bit in enumerate(reversed(ordered))}
        for bit in range(16):
            if bit == 15:
                lines.append("  assign out[15] = sign_out;")
            elif bit == 12:
                lines.append("  assign out[12] = bit12_out;")
            elif bit == 11:
                lines.append("  assign out[11] = bit11_out;")
            else:
                lines.append("  assign out[{0}] = table_bits[{1}];".format(bit, table_index[bit]))
        lines.extend(["endmodule", "", table_v, bit12_v, bit11_v])
        variant = "masked_run_casez_sign_bits11_12" if use_runs else "masked_table_casez_sign_bits11_12"
        items_text = "masked {0} bits=0..10,13,14; table_items={1}; {2}; {3}".format("run_tree" if use_runs else "case", items, bit12_meta, bit11_meta)

    def model(index):
        return outputs[index]

    return "\n".join(lines), variant, items_text, model


def empty_row(case, candidate_id, label, variant, verilog_path, aig_path):
    return {
        "case": case,
        "candidate_id": candidate_id,
        "hypothesis/function_guess": label,
        "variant": variant,
        "verilog_path": rel_path(verilog_path),
        "aig_path": rel_path(aig_path),
        "verified_truth": "0",
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
        "items": "",
        "classification": "structural_exact",
        "notes": "",
    }


def run_case(args, case, refs, use_runs):
    label = "fp16_log" if case == "ex223" else "fp16_log2"
    truth_path = args.benchmarks / (case + ".truth")
    outputs = list(TruthTable(truth_path).iter_outputs())
    candidate_id = case + "_" + label + ("_masked_run_current" if use_runs else "_masked_current")
    module = candidate_id
    case_dir = args.work_dir / case
    verilog_path = case_dir / "verilog" / (candidate_id + ".v")
    aig_path = case_dir / "aigs" / (candidate_id + ".aig")
    script_path = case_dir / "logs" / (candidate_id + ".ys")
    log_path = case_dir / "logs" / (candidate_id + ".yosys.log")
    verilog, variant, items, model = render_candidate(case, outputs, module, use_runs)
    row = empty_row(case, candidate_id, label, variant, verilog_path, aig_path)
    start = time.time()
    try:
        row["items"] = items
        verified, note = verify_outputs(outputs, model)
        row["verified_truth"] = "1" if verified else "0"
        row["notes"] = note
        write_text(verilog_path, verilog)
        if verified:
            yosys_log = synthesize_verilog(verilog_path, module, aig_path, yosys=args.yosys, timeout=args.timeout, script_out=script_path)
            write_text(log_path, yosys_log)
            row["synthesized"] = "1"
            evaluated = evaluate_aig(case, candidate_id, label, "ai_verilog", "yosys_fp16_masked_current", aig_path, truth_path, args.abc, items, args.timeout)
            row["equivalent"] = "1" if evaluated.equivalent else "0"
            row["area"] = "" if evaluated.area is None else str(evaluated.area)
            row["delay"] = "" if evaluated.delay is None else str(evaluated.delay)
            row["adp"] = "" if evaluated.adp is None else str(evaluated.adp)
            row["notes"] = evaluated.notes
    except (RuntimeError, SynthError, OSError, subprocess.TimeoutExpired) as exc:
        row["notes"] = "{0}: {1}".format(type(exc).__name__, exc)[:1000]
    row["runtime_sec"] = "{0:.3f}".format(time.time() - start)
    add_reference_columns(row, refs)
    print(case, variant, "eq=" + row["equivalent"], "area=" + row["area"], "delay=" + row["delay"], "adp=" + row["adp"])
    return row


def parse_args(argv=None):
    parser = argparse.ArgumentParser(description="Generate explicit masked-table current-best candidates.")
    parser.add_argument("--work-dir", type=Path, required=True)
    parser.add_argument("--results", type=Path, required=True)
    parser.add_argument("--best-results", type=Path, required=True)
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--reference", type=Path, default=ROOT / "reference_result.csv")
    parser.add_argument("--yosys", type=Path, default=ROOT / "student" / "tools" / "conda-env" / "bin" / "yosys")
    parser.add_argument("--abc", type=Path, default=ROOT / "student" / "abc")
    parser.add_argument("--timeout", type=int, default=900)
    return parser.parse_args(argv)


def main(argv=None):
    args = parse_args(argv)
    refs = load_reference(args.reference)
    rows = []
    for use_runs in (False, True):
        for case in ("ex223", "ex224"):
            rows.append(run_case(args, case, refs, use_runs))
    write_csv(args.results, RESULT_FIELDNAMES, rows)
    best_rows = []
    for case in ("ex223", "ex224"):
        valid = [row for row in rows if row["case"] == case and row["equivalent"] == "1" and row["adp"]]
        if valid:
            row = min(valid, key=lambda item: int(item["adp"]))
            best_rows.append({name: row.get(name, "") for name in BEST_FIELDNAMES})
    write_csv(args.best_results, BEST_FIELDNAMES, best_rows)
    write_text(args.work_dir / "manifest.json", json.dumps({"variants": rows}, indent=2) + "\n")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
