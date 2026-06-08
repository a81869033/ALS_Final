#!/usr/bin/env python3
"""Deep frontend-only structural search for FP16 square ex232."""

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


CASE = "ex232"
LABEL = "fp16_square"
MANT_BITS = 10
MANT_SIZE = 1 << MANT_BITS
EXP_BITS = 5
ACTIVE_EXP_MIN = 8
ACTIVE_EXP_MAX = 22
EXP_CARRY_THRESHOLD = 424


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


def emit_tree(lines, runs, indent, target):
    if len(runs) == 1:
        lines.append("{0}{1} = {2};".format(indent, target, runs[0][2]))
        return
    mid = len(runs) // 2
    left = runs[:mid]
    right = runs[mid:]
    boundary = left[-1][1]
    lines.append("{0}if (mant <= {1}) begin".format(indent, const_word(MANT_BITS, boundary)))
    emit_tree(lines, left, indent + "  ", target)
    lines.append("{0}end else begin".format(indent))
    emit_tree(lines, right, indent + "  ", target)
    lines.append("{0}end".format(indent))


def module_prelude(module):
    return [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [15:0] out;",
        "  wire [4:0] exp = in[14:10];",
        "  wire [9:0] mant = in[9:0];",
        "  wire active_normal = (exp >= 5'd8) && (exp <= 5'd22);",
        "  wire out_exp_carry = mant >= 10'd424;",
        "  wire [5:0] out_exp_wide = {1'b0, exp} + {1'b0, exp} - 6'd15 + {5'b00000, out_exp_carry};",
        "  wire [4:0] out_exp = out_exp_wide[4:0];",
        "  wire [15:0] special_out =",
        "    (exp <= 5'd7) ? 16'h0000 :",
        "    (exp <= 5'd30) ? 16'h7c00 :",
        "    (mant == 10'h000) ? 16'h7c00 : 16'h7e00;",
    ]


def module_prelude_exp_case(module):
    lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [15:0] out;",
        "  wire [4:0] exp = in[14:10];",
        "  wire [9:0] mant = in[9:0];",
        "  wire active_normal = (exp >= 5'd8) && (exp <= 5'd22);",
        "  wire out_exp_carry = mant >= 10'd424;",
        "  reg [4:0] out_exp;",
        "  always @* begin",
        "    case ({exp, out_exp_carry})",
    ]
    for exp in range(ACTIVE_EXP_MIN, ACTIVE_EXP_MAX + 1):
        for carry in (0, 1):
            value = (2 * exp - 15 + carry) & 0x1F
            key = (exp << 1) | carry
            lines.append("      {0}: out_exp = {1};".format(const_word(6, key), const_word(5, value)))
    lines.extend(
        [
            "      default: out_exp = 5'h00;",
            "    endcase",
            "  end",
            "  wire [15:0] special_out =",
            "    (exp <= 5'd7) ? 16'h0000 :",
            "    (exp <= 5'd30) ? 16'h7c00 :",
            "    (mant == 10'h000) ? 16'h7c00 : 16'h7e00;",
        ]
    )
    return lines


def module_prelude_exp_kformula(module):
    return [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [15:0] out;",
        "  wire [4:0] exp = in[14:10];",
        "  wire [9:0] mant = in[9:0];",
        "  wire active_normal = (exp >= 5'd8) && (exp <= 5'd22);",
        "  wire out_exp_carry = mant >= 10'd424;",
        "  wire [3:0] exp_k = {exp[4], exp[2:0]};",
        "  wire [4:0] exp_upper_wide = {1'b0, exp_k} + {4'b0000, out_exp_carry};",
        "  wire [4:0] out_exp = {exp_upper_wide[3:0], ~out_exp_carry};",
        "  wire [15:0] special_out =",
        "    (exp <= 5'd7) ? 16'h0000 :",
        "    (exp <= 5'd30) ? 16'h7c00 :",
        "    (mant == 10'h000) ? 16'h7c00 : 16'h7e00;",
    ]


def render_mant_lut(lines, mant_values, width, name, bit_low=0):
    lines.extend(
        [
            "  reg [{0}:0] {1};".format(width - 1, name),
            "  always @* begin",
            "    case (mant)",
        ]
    )
    for mant, value in enumerate(mant_values):
        lines.append(
            "      {0}: {1} = {2};".format(
                const_word(MANT_BITS, mant),
                name,
                const_word(width, (value >> bit_low) & ((1 << width) - 1)),
            )
        )
    lines.extend(
        [
            "      default: {0} = {1};".format(name, const_word(width, 0)),
            "    endcase",
            "  end",
        ]
    )


def render_mant_lut_split_carry(lines, mant_values, width, name, bit_low=0):
    lines.extend(
        [
            "  reg [{0}:0] {1};".format(width - 1, name),
            "  always @* begin",
            "    if (mant < 10'd424) begin",
            "      case (mant)",
        ]
    )
    for mant, value in enumerate(mant_values[:EXP_CARRY_THRESHOLD]):
        lines.append(
            "        {0}: {1} = {2};".format(
                const_word(MANT_BITS, mant),
                name,
                const_word(width, (value >> bit_low) & ((1 << width) - 1)),
            )
        )
    lines.extend(
        [
            "        default: {0} = {1};".format(name, const_word(width, 0)),
            "      endcase",
            "    end else begin",
            "      case (mant)",
        ]
    )
    for mant in range(EXP_CARRY_THRESHOLD, MANT_SIZE):
        value = mant_values[mant]
        lines.append(
            "        {0}: {1} = {2};".format(
                const_word(MANT_BITS, mant),
                name,
                const_word(width, (value >> bit_low) & ((1 << width) - 1)),
            )
        )
    lines.extend(
        [
            "        default: {0} = {1};".format(name, const_word(width, 0)),
            "      endcase",
            "    end",
            "  end",
        ]
    )


def render_mant_lut_nested(lines, mant_values, width, name, high_width, bit_low=0):
    low_width = MANT_BITS - high_width
    low_mask = (1 << low_width) - 1
    lines.extend(
        [
            "  reg [{0}:0] {1};".format(width - 1, name),
            "  always @* begin",
            "    case (mant[9:{0}])".format(low_width),
        ]
    )
    for high in range(1 << high_width):
        lines.append("      {0}: begin".format(const_word(high_width, high)))
        lines.append("        case (mant[{0}:0])".format(low_width - 1))
        for low in range(1 << low_width):
            mant = (high << low_width) | low
            value = mant_values[mant]
            lines.append(
                "          {0}: {1} = {2};".format(
                    const_word(low_width, low),
                    name,
                    const_word(width, (value >> bit_low) & ((1 << width) - 1)),
                )
            )
        lines.extend(
            [
                "          default: {0} = {1};".format(name, const_word(width, 0)),
                "        endcase",
                "      end",
            ]
        )
    lines.extend(
        [
            "      default: {0} = {1};".format(name, const_word(width, 0)),
            "    endcase",
            "  end",
        ]
    )


def render_mant_bit_tree(lines, mant_values, bit, target):
    values = [str((value >> bit) & 1) for value in mant_values]
    runs = bit_runs(values)
    lines.extend(
        [
            "  reg {0};".format(target),
            "  always @* begin",
        ]
    )
    emit_tree(lines, runs, "    ", target)
    lines.append("  end")
    return len(runs)


def build_bdd(bit_values, order, prefix):
    unique = {}
    nodes = []
    memo = {}

    def rec(depth, indices):
        values = {bit_values[index] for index in indices}
        if len(values) == 1:
            return "1'b{0}".format(next(iter(values)))
        if depth >= len(order):
            raise RuntimeError("nonconstant terminal at full BDD depth")
        key = (depth, indices)
        if key in memo:
            return memo[key]
        var = order[depth]
        low_indices = tuple(index for index in indices if ((index >> var) & 1) == 0)
        high_indices = tuple(index for index in indices if ((index >> var) & 1) == 1)
        low = rec(depth + 1, low_indices)
        high = rec(depth + 1, high_indices)
        if low == high:
            memo[key] = low
            return low
        node_key = (var, low, high)
        if node_key not in unique:
            name = "{0}_n{1}".format(prefix, len(nodes))
            unique[node_key] = name
            nodes.append((name, var, low, high))
        memo[key] = unique[node_key]
        return memo[key]

    root = rec(0, tuple(range(MANT_SIZE)))
    return root, nodes


def render_bdd_bit(lines, mant_values, bit, target, order):
    bit_values = [((value >> bit) & 1) for value in mant_values]
    root, nodes = build_bdd(bit_values, order, "bdd_b{0}".format(bit))
    for name, var, low, high in nodes:
        lines.append("  wire {0} = mant[{1}] ? {2} : {3};".format(name, var, high, low))
    lines.append("  wire {0} = {1};".format(target, root))
    return len(nodes)


def render_exp_formula_mant_lut(module, mant_values):
    lines = module_prelude(module)
    render_mant_lut(lines, mant_values, 10, "out_mant")
    lines.extend(
        [
            "  assign out = active_normal ? {1'b0, out_exp, out_mant} : special_out;",
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines), "exp formula plus 1024-entry 10-bit normalized mantissa LUT"


def render_exp_case_mant_lut(module, mant_values):
    lines = module_prelude_exp_case(module)
    render_mant_lut(lines, mant_values, 10, "out_mant")
    lines.extend(
        [
            "  assign out = active_normal ? {1'b0, out_exp, out_mant} : special_out;",
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines), "30-entry exponent case plus 1024-entry 10-bit normalized mantissa LUT"


def render_exp_formula_hi_tree_low_lut(module, mant_values, high_bits):
    high_bits = sorted(high_bits, reverse=True)
    low_width = min(high_bits)
    lines = module_prelude(module)
    low_name = "mant_low"
    render_mant_lut(lines, mant_values, low_width, low_name, bit_low=0)
    run_counts = []
    for bit in high_bits:
        target = "mant_b{0}".format(bit)
        run_counts.append((bit, render_mant_bit_tree(lines, mant_values, bit, target)))
    pieces = ["mant_b{0}".format(bit) for bit in high_bits]
    if low_width:
        pieces.append(low_name)
    lines.extend(
        [
            "  wire [9:0] out_mant = {" + ", ".join(pieces) + "};",
            "  assign out = active_normal ? {1'b0, out_exp, out_mant} : special_out;",
            "endmodule",
            "",
        ]
    )
    note = "exp formula; mant high bits as run trees {0}; low {1} bits LUT".format(
        ";".join("b{0}:{1}runs".format(bit, count) for bit, count in run_counts),
        low_width,
    )
    return "\n".join(lines), note


def render_exp_formula_hi_tree_low_lut_shaped(module, mant_values, high_bits, shape):
    high_bits = sorted(high_bits, reverse=True)
    low_width = min(high_bits)
    lines = module_prelude(module)
    low_name = "mant_low"
    if shape == "split_carry":
        render_mant_lut_split_carry(lines, mant_values, low_width, low_name, bit_low=0)
    elif shape.startswith("nested_hi"):
        render_mant_lut_nested(lines, mant_values, low_width, low_name, high_width=int(shape[len("nested_hi") :]), bit_low=0)
    else:
        raise RuntimeError("unknown low LUT shape: {0}".format(shape))
    run_counts = []
    for bit in high_bits:
        target = "mant_b{0}".format(bit)
        run_counts.append((bit, render_mant_bit_tree(lines, mant_values, bit, target)))
    pieces = ["mant_b{0}".format(bit) for bit in high_bits]
    if low_width:
        pieces.append(low_name)
    lines.extend(
        [
            "  wire [9:0] out_mant = {" + ", ".join(pieces) + "};",
            "  assign out = active_normal ? {1'b0, out_exp, out_mant} : special_out;",
            "endmodule",
            "",
        ]
    )
    note = "exp formula; mant high bits as run trees {0}; low {1} bits LUT shape={2}".format(
        ";".join("b{0}:{1}runs".format(bit, count) for bit, count in run_counts),
        low_width,
        shape,
    )
    return "\n".join(lines), note


def render_exp_kformula_hi_tree_low_lut_shaped(module, mant_values, high_bits, shape):
    high_bits = sorted(high_bits, reverse=True)
    low_width = min(high_bits)
    lines = module_prelude_exp_kformula(module)
    low_name = "mant_low"
    if shape.startswith("nested_hi"):
        render_mant_lut_nested(lines, mant_values, low_width, low_name, high_width=int(shape[len("nested_hi") :]), bit_low=0)
    else:
        raise RuntimeError("unsupported kformula low LUT shape: {0}".format(shape))
    run_counts = []
    for bit in high_bits:
        target = "mant_b{0}".format(bit)
        run_counts.append((bit, render_mant_bit_tree(lines, mant_values, bit, target)))
    pieces = ["mant_b{0}".format(bit) for bit in high_bits]
    if low_width:
        pieces.append(low_name)
    lines.extend(
        [
            "  wire [9:0] out_mant = {" + ", ".join(pieces) + "};",
            "  assign out = active_normal ? {1'b0, out_exp, out_mant} : special_out;",
            "endmodule",
            "",
        ]
    )
    note = "k-formula exponent {{exp[4],exp[2:0]}} plus carry; high run trees {0}; low {1} bits LUT shape={2}".format(
        ";".join("b{0}:{1}runs".format(bit, count) for bit, count in run_counts),
        low_width,
        shape,
    )
    return "\n".join(lines), note


def render_exp_formula_hi_tree_low_bdd(module, mant_values, high_bits, bdd_bits, order):
    high_bits = sorted(high_bits, reverse=True)
    bdd_bits = sorted(bdd_bits, reverse=True)
    lines = module_prelude(module)
    run_counts = []
    for bit in high_bits:
        target = "mant_b{0}".format(bit)
        run_counts.append((bit, render_mant_bit_tree(lines, mant_values, bit, target)))
    node_counts = []
    for bit in bdd_bits:
        target = "mant_b{0}".format(bit)
        node_counts.append((bit, render_bdd_bit(lines, mant_values, bit, target, order)))
    pieces = ["mant_b{0}".format(bit) for bit in sorted(set(high_bits + bdd_bits), reverse=True)]
    lines.extend(
        [
            "  wire [9:0] out_mant = {" + ", ".join(pieces) + "};",
            "  assign out = active_normal ? {1'b0, out_exp, out_mant} : special_out;",
            "endmodule",
            "",
        ]
    )
    note = "exp formula; mant high run trees {0}; low BDD nodes {1}; order={2}".format(
        ";".join("b{0}:{1}runs".format(bit, count) for bit, count in run_counts),
        ";".join("b{0}:{1}nodes".format(bit, count) for bit, count in node_counts),
        ",".join(str(bit) for bit in order),
    )
    return "\n".join(lines), note


def render_exp_formula_hi_tree_mid_bdd_low_lut(module, mant_values, high_bits, bdd_bits, order):
    high_bits = sorted(high_bits, reverse=True)
    bdd_bits = sorted(bdd_bits, reverse=True)
    low_width = min(bdd_bits)
    lines = module_prelude(module)
    low_name = "mant_low"
    render_mant_lut(lines, mant_values, low_width, low_name, bit_low=0)
    run_counts = []
    for bit in high_bits:
        target = "mant_b{0}".format(bit)
        run_counts.append((bit, render_mant_bit_tree(lines, mant_values, bit, target)))
    node_counts = []
    for bit in bdd_bits:
        target = "mant_b{0}".format(bit)
        node_counts.append((bit, render_bdd_bit(lines, mant_values, bit, target, order)))
    pieces = ["mant_b{0}".format(bit) for bit in sorted(set(high_bits + bdd_bits), reverse=True)]
    if low_width:
        pieces.append(low_name)
    lines.extend(
        [
            "  wire [9:0] out_mant = {" + ", ".join(pieces) + "};",
            "  assign out = active_normal ? {1'b0, out_exp, out_mant} : special_out;",
            "endmodule",
            "",
        ]
    )
    note = "exp formula; high run trees {0}; mid BDD nodes {1}; low {2} bits LUT; order={3}".format(
        ";".join("b{0}:{1}runs".format(bit, count) for bit, count in run_counts),
        ";".join("b{0}:{1}nodes".format(bit, count) for bit, count in node_counts),
        low_width,
        ",".join(str(bit) for bit in order),
    )
    return "\n".join(lines), note


def render_exp_case_hi_tree_low_lut(module, mant_values, high_bits):
    high_bits = sorted(high_bits, reverse=True)
    low_width = min(high_bits)
    lines = module_prelude_exp_case(module)
    low_name = "mant_low"
    render_mant_lut(lines, mant_values, low_width, low_name, bit_low=0)
    run_counts = []
    for bit in high_bits:
        target = "mant_b{0}".format(bit)
        run_counts.append((bit, render_mant_bit_tree(lines, mant_values, bit, target)))
    pieces = ["mant_b{0}".format(bit) for bit in high_bits]
    if low_width:
        pieces.append(low_name)
    lines.extend(
        [
            "  wire [9:0] out_mant = {" + ", ".join(pieces) + "};",
            "  assign out = active_normal ? {1'b0, out_exp, out_mant} : special_out;",
            "endmodule",
            "",
        ]
    )
    note = "30-entry exponent case; mant high bits as run trees {0}; low {1} bits LUT".format(
        ";".join("b{0}:{1}runs".format(bit, count) for bit, count in run_counts),
        low_width,
    )
    return "\n".join(lines), note


def render_product_arith(module):
    lines = module_prelude(module)
    lines.extend(
        [
            "  wire [10:0] sig = {1'b1, mant};",
            "  wire [21:0] prod = sig * sig;",
            "  wire [9:0] mant_pre_lo = prod[19:10];",
            "  wire round_lo = prod[9] & (|prod[8:0] | prod[10]);",
            "  wire [10:0] mant_round_lo = {1'b0, mant_pre_lo} + {10'b0, round_lo};",
            "  wire [9:0] mant_pre_hi = prod[20:11];",
            "  wire round_hi = prod[10] & (|prod[9:0] | prod[11]);",
            "  wire [10:0] mant_round_hi = {1'b0, mant_pre_hi} + {10'b0, round_hi};",
            "  wire [9:0] out_mant = out_exp_carry ? mant_round_hi[9:0] : mant_round_lo[9:0];",
            "  assign out = active_normal ? {1'b0, out_exp, out_mant} : special_out;",
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines), "exp formula plus exact 11x11 square product and RNE rounding"


def verify_model(table, model):
    for index in range(1 << 16):
        expected = table.get_output(index)
        actual = model(index)
        if expected != actual:
            return False, index, expected, actual
    return True, None, None, None


def model_from_table(table):
    mant_values = [table.get_output((ACTIVE_EXP_MIN << MANT_BITS) | mant) & 0x03FF for mant in range(MANT_SIZE)]

    def model(index):
        exp = (index >> MANT_BITS) & 0x1F
        mant = index & 0x03FF
        if ACTIVE_EXP_MIN <= exp <= ACTIVE_EXP_MAX:
            carry = 1 if mant >= EXP_CARRY_THRESHOLD else 0
            out_exp = ((exp << 1) - 15 + carry) & 0x1F
            return (out_exp << MANT_BITS) | mant_values[mant]
        if exp <= 7:
            return 0
        if exp <= 30:
            return 0x7C00
        return 0x7C00 if mant == 0 else 0x7E00

    return mant_values, model


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


def candidate_row(case, candidate_id, variant, verilog_path, aig_path, note):
    return {
        "case": case,
        "candidate_id": candidate_id,
        "hypothesis/function_guess": LABEL,
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


def run_candidate(args, refs, variant, module, verilog_text, note, flows):
    verilog_path = args.work_dir / CASE / "verilog" / "{0}.v".format(module)
    write_text(verilog_path, verilog_text)
    rows = []
    for flow_name, script_func in flows:
        candidate_id = "{0}_{1}_{2}".format(CASE, variant, flow_name)
        aig_path = args.work_dir / CASE / "aigs" / "{0}.aig".format(candidate_id)
        log_path = args.work_dir / CASE / "logs" / "{0}.log".format(candidate_id)
        row = candidate_row(CASE, candidate_id, flow_name, verilog_path, aig_path, note)
        start = time.time()
        try:
            aig_path.parent.mkdir(parents=True, exist_ok=True)
            script = script_func(verilog_path, module, aig_path)
            synthesize_with_script(script, args.yosys, args.timeout, log_path)
            row["synthesized"] = "1"
            evaluated = evaluate_aig(
                case=CASE,
                candidate_id=candidate_id,
                parent_id=variant,
                source="fp16_ex232_square_deep",
                tool_chain="yosys_{0}".format(flow_name),
                aig_path=aig_path,
                truth=args.benchmarks / "{0}.truth".format(CASE),
                abc=args.abc,
                notes=note,
                timeout=args.timeout,
            )
            row["equivalent"] = "1" if evaluated.equivalent else "0"
            row["area"] = "" if evaluated.area is None else str(evaluated.area)
            row["delay"] = "" if evaluated.delay is None else str(evaluated.delay)
            row["adp"] = "" if evaluated.adp is None else str(evaluated.adp)
            row["notes"] = evaluated.notes
        except (RuntimeError, SynthError, OSError, subprocess.TimeoutExpired) as exc:
            row["notes"] = "{0}: {1}".format(type(exc).__name__, exc)[:1000]
        row["runtime_sec"] = "{0:.3f}".format(time.time() - start)
        add_reference_columns(row, refs)
        rows.append(row)
        print("{0} {1} eq={2} area={3} delay={4} adp={5}".format(variant, flow_name, row["equivalent"], row["area"], row["delay"], row["adp"]))
        sys.stdout.flush()
    return rows


def best_rows(rows):
    valid = [row for row in rows if row["equivalent"] == "1" and row["adp"]]
    if not valid:
        return []
    best = min(valid, key=lambda row: (int(row["adp"]), int(row["delay"]), int(row["area"])))
    return [{name: best.get(name, "") for name in BEST_FIELDNAMES}]


def parse_args():
    parser = argparse.ArgumentParser(description="Deep ex232 square frontend search.")
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
    table = TruthTable(args.benchmarks / "{0}.truth".format(CASE))
    mant_values, semantic_model = model_from_table(table)
    ok, index, expected, actual = verify_model(table, semantic_model)
    if not ok:
        raise RuntimeError(
            "semantic exp/mant model mismatch at 0x{0:04x}: expected 0x{1:04x}, got 0x{2:04x}".format(
                index, expected, actual
            )
        )

    flows = [
        ("abc_g_aig", lambda v, m, o: script_abc_gate(v, m, o, "aig")),
        ("default", lambda v, m, o: script_default(v, m, o)),
    ]
    specs = [
        ("exp_formula_mant_lut10", render_exp_formula_mant_lut),
        ("exp_formula_hi9_8_low8", lambda module, values: render_exp_formula_hi_tree_low_lut(module, values, [9, 8])),
        ("exp_formula_hi9_low9", lambda module, values: render_exp_formula_hi_tree_low_lut(module, values, [9])),
        ("exp_formula_hi8_low8", lambda module, values: render_exp_formula_hi_tree_low_lut(module, values, [8])),
        ("exp_formula_hi9_8_7_low7", lambda module, values: render_exp_formula_hi_tree_low_lut(module, values, [9, 8, 7])),
        ("exp_formula_hi9_to5_low5", lambda module, values: render_exp_formula_hi_tree_low_lut(module, values, [9, 8, 7, 6, 5])),
        ("exp_case_mant_lut10", render_exp_case_mant_lut),
        ("exp_case_hi9_8_low8", lambda module, values: render_exp_case_hi_tree_low_lut(module, values, [9, 8])),
        ("exp_case_hi9_low9", lambda module, values: render_exp_case_hi_tree_low_lut(module, values, [9])),
        ("exp_case_hi8_low8", lambda module, values: render_exp_case_hi_tree_low_lut(module, values, [8])),
        ("exp_case_hi9_8_7_low7", lambda module, values: render_exp_case_hi_tree_low_lut(module, values, [9, 8, 7])),
        ("exp_formula_hi9_8_bdd7_low7", lambda module, values: render_exp_formula_hi_tree_mid_bdd_low_lut(module, values, [9, 8], [7], list(range(9, -1, -1)))),
        ("exp_formula_hi9_8_bdd7_6_low6", lambda module, values: render_exp_formula_hi_tree_mid_bdd_low_lut(module, values, [9, 8], [7, 6], list(range(9, -1, -1)))),
        ("exp_formula_hi9_8_bdd7_6_5_low5", lambda module, values: render_exp_formula_hi_tree_mid_bdd_low_lut(module, values, [9, 8], [7, 6, 5], list(range(9, -1, -1)))),
        ("exp_formula_hi9_8_low8_split_carry", lambda module, values: render_exp_formula_hi_tree_low_lut_shaped(module, values, [9, 8], "split_carry")),
        ("exp_formula_hi9_8_low8_nested_hi5", lambda module, values: render_exp_formula_hi_tree_low_lut_shaped(module, values, [9, 8], "nested_hi5")),
        ("exp_formula_hi9_8_low8_nested_hi4", lambda module, values: render_exp_formula_hi_tree_low_lut_shaped(module, values, [9, 8], "nested_hi4")),
        ("exp_formula_hi9_8_low8_nested_hi6", lambda module, values: render_exp_formula_hi_tree_low_lut_shaped(module, values, [9, 8], "nested_hi6")),
        ("exp_formula_hi9_8_low8_nested_hi7", lambda module, values: render_exp_formula_hi_tree_low_lut_shaped(module, values, [9, 8], "nested_hi7")),
        ("exp_formula_hi9_8_low8_nested_hi3", lambda module, values: render_exp_formula_hi_tree_low_lut_shaped(module, values, [9, 8], "nested_hi3")),
        ("exp_formula_hi9_8_7_low7_nested_hi6", lambda module, values: render_exp_formula_hi_tree_low_lut_shaped(module, values, [9, 8, 7], "nested_hi6")),
        ("exp_formula_hi9_8_7_low7_nested_hi7", lambda module, values: render_exp_formula_hi_tree_low_lut_shaped(module, values, [9, 8, 7], "nested_hi7")),
        ("exp_formula_hi9_to6_low6_nested_hi6", lambda module, values: render_exp_formula_hi_tree_low_lut_shaped(module, values, [9, 8, 7, 6], "nested_hi6")),
        ("exp_formula_hi9_to6_low6_nested_hi7", lambda module, values: render_exp_formula_hi_tree_low_lut_shaped(module, values, [9, 8, 7, 6], "nested_hi7")),
        ("exp_kformula_hi9_8_low8_nested_hi6", lambda module, values: render_exp_kformula_hi_tree_low_lut_shaped(module, values, [9, 8], "nested_hi6")),
        ("exp_kformula_hi9_8_low8_nested_hi5", lambda module, values: render_exp_kformula_hi_tree_low_lut_shaped(module, values, [9, 8], "nested_hi5")),
        ("exp_formula_hi9_8_lowbdd_hilo", lambda module, values: render_exp_formula_hi_tree_low_bdd(module, values, [9, 8], [7, 6, 5, 4, 3, 2, 1, 0], list(range(9, -1, -1)))),
        ("exp_formula_hi9_8_lowbdd_lohi", lambda module, values: render_exp_formula_hi_tree_low_bdd(module, values, [9, 8], [7, 6, 5, 4, 3, 2, 1, 0], list(range(10)))),
        ("exp_formula_product_arith", lambda module, values: render_product_arith(module)),
    ]

    rows = []
    summary = [
        {
            "case": CASE,
            "observation": "active_normal_exp_range",
            "value": "8..22",
            "notes": "exponents <=7 map to zero; exponents 23..30 map to +inf; exp31 maps inf/NaN",
        },
        {
            "case": CASE,
            "observation": "output_exp_formula",
            "value": "2*exp-15+(mant>=424)",
            "notes": "fixed threshold across all active exponent groups",
        },
        {
            "case": CASE,
            "observation": "output_mantissa",
            "value": "function_of_mant_only",
            "notes": "same 1024-entry normalized mantissa mapping for exp 8..22",
        },
    ]
    for variant, renderer in specs:
        module = "{0}_fp16_square_{1}".format(CASE, variant)
        verilog_text, note = renderer(module, mant_values)
        if variant == "exp_formula_product_arith":
            # Product arithmetic is intended to be exact; let CEC verify it.
            verified_note = note
        else:
            verified_note = note + "; semantic model precheck exact"
        rows.extend(run_candidate(args, refs, variant, module, verilog_text, verified_note, flows))

    write_csv(args.results, RESULT_FIELDNAMES, rows)
    write_csv(args.best_results, BEST_FIELDNAMES, best_rows(rows))
    args.summary.parent.mkdir(parents=True, exist_ok=True)
    with args.summary.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=["case", "observation", "value", "notes"])
        writer.writeheader()
        writer.writerows(summary)
    write_text(args.work_dir / "manifest.json", json.dumps(rows, indent=2) + "\n")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
