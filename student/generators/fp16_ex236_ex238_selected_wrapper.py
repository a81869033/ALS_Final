#!/usr/bin/env python3
"""Selected-bit wrappers for FP16 cube / reciprocal-cube current best seeds.

The current ex236/ex238 seeds are already compact base/delta or pair encodings.
This script keeps those seeds as a base module, assigns the sign bit directly,
and optionally replaces a few high magnitude bits with shallow exp/mant run
covers.  The goal is to let Yosys trim the unused base output bits without
rebuilding the whole function as a large table.
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
from student.scripts.yosys_synthflow_variants import script_abc_gate


MANT_BITS = 10
MANT_SIZE = 1 << MANT_BITS


CASE_CONFIG = {
    "ex236": {
        "label": "fp16_cube",
        "base_path": ROOT / "student/work/reverse_fp16_semantic_20260604_1522_extra/ex236/verilog/ex236_fp16_cube_positive_default_exp_mant_delta.v",
        "base_module": "ex236_fp16_cube_positive_default_exp_mant_delta",
        "variants": [
            ("sign_only", [], 0),
            ("mag_b10_t4", [10], 4),
            ("mag_b10_t8", [10], 8),
            ("mag_b9_t8", [9], 8),
            ("mag_b10_9_t8", [10, 9], 8),
            ("mag_b10_9_8_t16", [10, 9, 8], 16),
            ("mag_b11_10_t8", [11, 10], 8),
            ("mag_b12_11_10_t8", [12, 11, 10], 8),
            ("mag_b10_9_8_7_t32", [10, 9, 8, 7], 32),
        ],
    },
    "ex238": {
        "label": "fp16_reciprocal_cube",
        "base_path": ROOT / "student/work/reverse_fp16_semantic_20260604_1522_arith/ex238/verilog/ex238_fp16_reciprocal_cube_exp_mant_pair_case.v",
        "base_module": "ex238_fp16_reciprocal_cube_exp_mant_pair_case",
        "variants": [
            ("sign_only", [], 0),
            ("mag_b11_t4", [11], 4),
            ("mag_b11_t8", [11], 8),
            ("mag_b10_t4", [10], 4),
            ("mag_b10_t8", [10], 8),
            ("mag_b9_t8", [9], 8),
            ("mag_b9_t16", [9], 16),
            ("mag_b11_10_t8", [11, 10], 8),
            ("mag_b11_10_9_t8", [11, 10, 9], 8),
            ("mag_b11_10_9_t16", [11, 10, 9], 16),
            ("manual_b10_9_shared_if", "manual_b10_9_shared_if", 0),
            ("manual_b10_9_seg_phase", "manual_b10_9_seg_phase", 0),
            ("manual_b10_9_grouped_patterns", "manual_b10_9_grouped_patterns", 0),
            ("separate_b10_9_t4_t8", "separate_b10_9_t4_t8", 0),
            ("separate_b10_9_t8_t8", "separate_b10_9_t8_t8", 0),
            ("separate_b10_9_t8_t16", "separate_b10_9_t8_t16", 0),
            ("mag_b10_9_t16", [10, 9], 16),
            ("mag_b9_8_t16", [9, 8], 16),
            ("mag_b10_8_t16", [10, 8], 16),
            ("mag_b10_9_8_t8", [10, 9, 8], 8),
            ("mag_b10_9_8_t12", [10, 9, 8], 12),
            ("mag_b10_9_8_t16", [10, 9, 8], 16),
            ("mag_b10_9_8_t24", [10, 9, 8], 24),
            ("mag_b10_9_8_t32", [10, 9, 8], 32),
            ("mag_b10_9_8_7_t16", [10, 9, 8, 7], 16),
            ("mag_b10_9_8_7_t24", [10, 9, 8, 7], 24),
            ("mag_b10_9_8_7_t32", [10, 9, 8, 7], 32),
            ("mag_b12_10_9_8_t16", [12, 10, 9, 8], 16),
            ("mag_b14_13_12_10_9_8_t16", [14, 13, 12, 10, 9, 8], 16),
            ("mag_b11_10_9_8_t16", [11, 10, 9, 8], 16),
        ],
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


def emit_vec_tree(lines, runs, indent, target, width):
    if len(runs) == 1:
        lines.append("{0}{1} = {2};".format(indent, target, const_word(width, runs[0][2])))
        return
    mid = len(runs) // 2
    left = runs[:mid]
    right = runs[mid:]
    boundary = left[-1][1]
    lines.append("{0}if (mant <= {1}) begin".format(indent, const_word(MANT_BITS, boundary)))
    emit_vec_tree(lines, left, indent + "  ", target, width)
    lines.append("{0}end else begin".format(indent))
    emit_vec_tree(lines, right, indent + "  ", target, width)
    lines.append("{0}end".format(indent))


def render_exp_bitvec_cover(outputs, module, bits, threshold):
    ordered_bits = sorted(bits, reverse=True)
    width = len(ordered_bits)

    def pack(value):
        packed = 0
        for bit in ordered_bits:
            packed = (packed << 1) | ((value >> bit) & 1)
        return packed

    lines = [
        "module {0}(in, out_bits);".format(module),
        "  input [15:0] in;",
        "  output [{0}:0] out_bits;".format(width - 1),
        "  wire [4:0] exp = in[14:10];",
        "  wire [9:0] mant = in[9:0];",
        "  reg [{0}:0] bits_r;".format(width - 1),
        "  always @* begin",
        "    case (exp)",
    ]
    const_groups = 0
    range_groups = 0
    table_groups = 0
    range_items = 0
    table_items = 0
    max_runs = 0
    for exp in range(32):
        values = [pack(outputs[(exp << MANT_BITS) | mant]) for mant in range(MANT_SIZE)]
        runs = bit_runs(values)
        max_runs = max(max_runs, len(runs))
        lines.append("      {0}: begin".format(const_word(5, exp)))
        if len(runs) == 1:
            const_groups += 1
            lines.append("        bits_r = {0};".format(const_word(width, runs[0][2])))
        elif len(runs) <= threshold:
            range_groups += 1
            range_items += len(runs)
            emit_vec_tree(lines, runs, "        ", "bits_r", width)
        else:
            table_groups += 1
            lines.append("        case (mant)")
            for mant, value in enumerate(values):
                table_items += 1
                lines.append("          {0}: bits_r = {1};".format(const_word(MANT_BITS, mant), const_word(width, value)))
            lines.extend(["          default: bits_r = {0};".format(const_word(width, 0)), "        endcase"])
        lines.append("      end")
    lines.extend(["      default: bits_r = {0};".format(const_word(width, 0)), "    endcase", "  end"])
    lines.extend(["  assign out_bits = bits_r;", "endmodule", ""])
    meta = "bits={0}; threshold={1}; const_groups={2}; range_groups={3}; table_groups={4}; range_items={5}; table_items={6}; max_runs={7}".format(
        ",".join(str(bit) for bit in ordered_bits),
        threshold,
        const_groups,
        range_groups,
        table_groups,
        range_items,
        table_items,
        max_runs,
    )
    return "\n".join(lines), meta, ordered_bits


def render_wrapper(case, outputs, module, bits, threshold):
    cfg = CASE_CONFIG[case]
    base_source = cfg["base_path"].read_text()
    base_module = cfg["base_module"]
    selected = set(bits)
    lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [15:0] out;",
        "  wire [15:0] base_out;",
        "  {0} u_base(.in(in), .out(base_out));".format(base_module),
        "  assign out[15] = base_out[15];",
    ]
    metas = ["sign_bit=base_exact"]
    bitvec_source = ""
    ordered_bits = []
    if selected:
        bitvec_module = module + "_magbits"
        bitvec_source, meta, ordered_bits = render_exp_bitvec_cover(outputs, bitvec_module, selected, threshold)
        metas.append(meta)
        lines.append("  wire [{0}:0] mag_bits;".format(len(ordered_bits) - 1))
        lines.append("  {0} u_magbits(.in(in), .out_bits(mag_bits));".format(bitvec_module))
    bit_to_index = {bit: index for index, bit in enumerate(reversed(ordered_bits))}
    for bit in range(15):
        if bit in selected:
            lines.append("  assign out[{0}] = mag_bits[{1}];".format(bit, bit_to_index[bit]))
        else:
            lines.append("  assign out[{0}] = base_out[{0}];".format(bit))
    lines.extend(["endmodule", "", base_source, ""])
    if bitvec_source:
        lines.append(bitvec_source)
    return "\n".join(lines), "; ".join(metas)


def render_ex238_manual_wrapper(module, variant):
    cfg = CASE_CONFIG["ex238"]
    base_source = cfg["base_path"].read_text()
    base_module = cfg["base_module"]
    lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [15:0] out;",
        "  wire [15:0] base_out;",
        "  wire [1:0] mag_bits;",
        "  {0} u_base(.in(in), .out(base_out));".format(base_module),
        "  {0}_magbits u_magbits(.in(in), .out_bits(mag_bits));".format(module),
        "  assign out[15] = base_out[15];",
    ]
    for bit in range(15):
        if bit == 9:
            lines.append("  assign out[9] = mag_bits[0];")
        elif bit == 10:
            lines.append("  assign out[10] = mag_bits[1];")
        else:
            lines.append("  assign out[{0}] = base_out[{0}];".format(bit))
    lines.extend(["endmodule", "", base_source, ""])
    if variant == "manual_b10_9_shared_if":
        lines.extend(
            [
                "module {0}_magbits(in, out_bits);".format(module),
                "  input [15:0] in;",
                "  output [1:0] out_bits;",
                "  wire [4:0] exp = in[14:10];",
                "  wire [9:0] mant = in[9:0];",
                "  reg [1:0] base_bits;",
                "  reg [1:0] bits_r;",
                "  always @* begin",
                "    if (mant == 10'h000) base_bits = 2'h0;",
                "    else if (mant <= 10'h067) base_bits = 2'h3;",
                "    else if (mant <= 10'h10a) base_bits = 2'h2;",
                "    else if (mant <= 10'h18c) base_bits = 2'h1;",
                "    else if (mant <= 10'h259) base_bits = 2'h0;",
                "    else if (mant <= 10'h2fd) base_bits = 2'h3;",
                "    else base_bits = 2'h2;",
                "    if (exp <= 5'h08) bits_r = 2'h2;",
                "    else if (exp == 5'h09) begin",
                "      if (mant <= 10'h259) bits_r = 2'h2;",
                "      else if (mant <= 10'h2fd) bits_r = 2'h1;",
                "      else bits_r = 2'h0;",
                "    end else if (exp <= 5'h12) begin",
                "      bits_r = base_bits ^ {exp[0], 1'b0};",
                "    end else if (exp == 5'h13) begin",
                "      if (mant == 10'h000) bits_r = 2'h2;",
                "      else if (mant <= 10'h067) bits_r = 2'h1;",
                "      else if (mant <= 10'h10a) bits_r = 2'h0;",
                "      else if (mant <= 10'h18c) bits_r = 2'h3;",
                "      else if (mant <= 10'h259) bits_r = 2'h2;",
                "      else bits_r = 2'h0;",
                "    end else if (exp <= 5'h1e) bits_r = 2'h0;",
                "    else bits_r = (mant == 10'h000) ? 2'h0 : 2'h3;",
                "  end",
                "  assign out_bits = bits_r;",
                "endmodule",
                "",
            ]
        )
    elif variant == "manual_b10_9_seg_phase":
        lines.extend(
            [
                "module {0}_magbits(in, out_bits);".format(module),
                "  input [15:0] in;",
                "  output [1:0] out_bits;",
                "  wire [4:0] exp = in[14:10];",
                "  wire [9:0] mant = in[9:0];",
                "  reg [2:0] seg;",
                "  reg [1:0] bits_r;",
                "  wire [1:0] base_bits = -seg[1:0];",
                "  wire [1:0] phase_bits = base_bits ^ {exp[0], 1'b0};",
                "  always @* begin",
                "    if (mant == 10'h000) seg = 3'd0;",
                "    else if (mant <= 10'h067) seg = 3'd1;",
                "    else if (mant <= 10'h10a) seg = 3'd2;",
                "    else if (mant <= 10'h18c) seg = 3'd3;",
                "    else if (mant <= 10'h259) seg = 3'd4;",
                "    else if (mant <= 10'h2fd) seg = 3'd5;",
                "    else seg = 3'd6;",
                "    if (exp <= 5'h08) bits_r = 2'h2;",
                "    else if (exp == 5'h09) bits_r = (seg <= 3'd4) ? 2'h2 : ((seg == 3'd5) ? 2'h1 : 2'h0);",
                "    else if (exp <= 5'h12) bits_r = phase_bits;",
                "    else if (exp == 5'h13) begin",
                "      if (seg <= 3'd4) bits_r = phase_bits;",
                "      else bits_r = 2'h0;",
                "    end else if (exp <= 5'h1e) bits_r = 2'h0;",
                "    else bits_r = (mant == 10'h000) ? 2'h0 : 2'h3;",
                "  end",
                "  assign out_bits = bits_r;",
                "endmodule",
                "",
            ]
        )
    elif variant == "manual_b10_9_grouped_patterns":
        lines.extend(
            [
                "module {0}_magbits(in, out_bits);".format(module),
                "  input [15:0] in;",
                "  output [1:0] out_bits;",
                "  wire [4:0] exp = in[14:10];",
                "  wire [9:0] mant = in[9:0];",
                "  reg [1:0] bits_r;",
                "  always @* begin",
                "    case (exp)",
                "      5'h00, 5'h01, 5'h02, 5'h03, 5'h04, 5'h05, 5'h06, 5'h07, 5'h08: bits_r = 2'h2;",
                "      5'h09: begin",
                "        if (mant <= 10'h259) bits_r = 2'h2;",
                "        else if (mant <= 10'h2fd) bits_r = 2'h1;",
                "        else bits_r = 2'h0;",
                "      end",
                "      5'h0a, 5'h0c, 5'h0e, 5'h10, 5'h12: begin",
                "        if (mant <= 10'h10a) begin",
                "          if (mant <= 10'h000) bits_r = 2'h0;",
                "          else if (mant <= 10'h067) bits_r = 2'h3;",
                "          else bits_r = 2'h2;",
                "        end else begin",
                "          if (mant <= 10'h259) begin",
                "            if (mant <= 10'h18c) bits_r = 2'h1;",
                "            else bits_r = 2'h0;",
                "          end else begin",
                "            if (mant <= 10'h2fd) bits_r = 2'h3;",
                "            else bits_r = 2'h2;",
                "          end",
                "        end",
                "      end",
                "      5'h0b, 5'h0d, 5'h0f, 5'h11: begin",
                "        if (mant <= 10'h10a) begin",
                "          if (mant <= 10'h000) bits_r = 2'h2;",
                "          else if (mant <= 10'h067) bits_r = 2'h1;",
                "          else bits_r = 2'h0;",
                "        end else begin",
                "          if (mant <= 10'h259) begin",
                "            if (mant <= 10'h18c) bits_r = 2'h3;",
                "            else bits_r = 2'h2;",
                "          end else begin",
                "            if (mant <= 10'h2fd) bits_r = 2'h1;",
                "            else bits_r = 2'h0;",
                "          end",
                "        end",
                "      end",
                "      5'h13: begin",
                "        if (mant <= 10'h10a) begin",
                "          if (mant <= 10'h000) bits_r = 2'h2;",
                "          else if (mant <= 10'h067) bits_r = 2'h1;",
                "          else bits_r = 2'h0;",
                "        end else begin",
                "          if (mant <= 10'h18c) bits_r = 2'h3;",
                "          else if (mant <= 10'h259) bits_r = 2'h2;",
                "          else bits_r = 2'h0;",
                "        end",
                "      end",
                "      5'h14, 5'h15, 5'h16, 5'h17, 5'h18, 5'h19, 5'h1a, 5'h1b, 5'h1c, 5'h1d, 5'h1e: bits_r = 2'h0;",
                "      5'h1f: bits_r = (mant == 10'h000) ? 2'h0 : 2'h3;",
                "      default: bits_r = 2'h0;",
                "    endcase",
                "  end",
                "  assign out_bits = bits_r;",
                "endmodule",
                "",
            ]
        )
    else:
        raise RuntimeError("unknown manual variant {0}".format(variant))
    note = "{0}; shared mantissa segment boundaries for ex238 bits 10,9; core exp10-exp18 uses exp parity phase".format(variant)
    return "\n".join(lines), note


def render_ex238_separate_wrapper(outputs, module, variant):
    cfg = CASE_CONFIG["ex238"]
    base_source = cfg["base_path"].read_text()
    base_module = cfg["base_module"]
    thresholds = {
        "separate_b10_9_t4_t8": (4, 8),
        "separate_b10_9_t8_t8": (8, 8),
        "separate_b10_9_t8_t16": (8, 16),
    }[variant]
    bit10_source, bit10_meta, _ = render_exp_bitvec_cover(outputs, module + "_bit10", [10], thresholds[0])
    bit9_source, bit9_meta, _ = render_exp_bitvec_cover(outputs, module + "_bit9", [9], thresholds[1])
    lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [15:0] out;",
        "  wire [15:0] base_out;",
        "  wire bit10_out;",
        "  wire bit9_out;",
        "  {0} u_base(.in(in), .out(base_out));".format(base_module),
        "  {0}_bit10 u_bit10(.in(in), .out_bits(bit10_out));".format(module),
        "  {0}_bit9 u_bit9(.in(in), .out_bits(bit9_out));".format(module),
        "  assign out[15] = base_out[15];",
    ]
    for bit in range(15):
        if bit == 9:
            lines.append("  assign out[9] = bit9_out;")
        elif bit == 10:
            lines.append("  assign out[10] = bit10_out;")
        else:
            lines.append("  assign out[{0}] = base_out[{0}];".format(bit))
    lines.extend(["endmodule", "", base_source, "", bit10_source, bit9_source])
    note = "{0}; separate bit covers; {1}; {2}".format(variant, bit10_meta, bit9_meta)
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
        "classification": "semantic_selected_bit_wrapper",
        "notes": "",
    }


def run_one(args, refs, case, variant, module, text, note):
    verilog_path = args.work_dir / case / "verilog" / "{0}.v".format(module)
    write_text(verilog_path, text)
    candidate_id = "{0}_{1}_abc_g_aig".format(case, variant)
    aig_path = args.work_dir / case / "aigs" / "{0}.aig".format(candidate_id)
    log_path = args.work_dir / case / "logs" / "{0}.log".format(candidate_id)
    row = row_template(case, candidate_id, variant, verilog_path, aig_path, note)
    start = time.time()
    try:
        aig_path.parent.mkdir(parents=True, exist_ok=True)
        script = script_abc_gate(verilog_path, module, aig_path, "aig")
        synthesize_with_script(script, args.yosys, args.timeout, log_path)
        row["synthesized"] = "1"
        ev = evaluate_aig(
            case=case,
            candidate_id=candidate_id,
            parent_id=variant,
            source="fp16_ex236_ex238_selected_wrapper",
            tool_chain="yosys_abc_g_aig",
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
    parser = argparse.ArgumentParser(description="Selected-bit wrappers for FP16 ex236/ex238.")
    parser.add_argument("--cases", default="ex236,ex238")
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
    rows = []
    summary = []
    for case in [item.strip() for item in args.cases.split(",") if item.strip()]:
        table = TruthTable(args.benchmarks / "{0}.truth".format(case))
        outputs = [table.get_output(index) for index in range(1 << 16)]
        for variant, bits, threshold in CASE_CONFIG[case]["variants"]:
            module = "{0}_{1}".format(case, variant)
            if case == "ex238" and isinstance(bits, str) and variant.startswith("manual_"):
                text, note = render_ex238_manual_wrapper(module, variant)
            elif case == "ex238" and isinstance(bits, str) and variant.startswith("separate_"):
                text, note = render_ex238_separate_wrapper(outputs, module, variant)
            else:
                text, note = render_wrapper(case, outputs, module, bits, threshold)
            summary.append({"case": case, "variant": variant, "notes": note})
            rows.append(run_one(args, refs, case, variant, module, text, note))
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
