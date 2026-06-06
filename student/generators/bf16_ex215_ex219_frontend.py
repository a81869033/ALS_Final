#!/usr/bin/env python3
"""Frontend-only BF16 semantic/structural search for ex215-ex219."""

import argparse
import csv
import json
import re
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
from student.generators.bf16_ex201_ex204_semantic_run import mode_value, rel_path, write_csv, write_text
from student.generators.bf16_ex201_ex204_continue import (
    emit_bit_cmp_runs,
    emit_bit_hi_lo,
    emit_bit_pla,
    emit_bit_runs,
    emit_const_bit_ranges,
)
from student.generators.bf16_ex210_ex214_frontend import (
    BEST_FIELDS,
    RESULT_FIELDS,
    SUMMARY_FIELDS,
    best_rows,
    read_reference_adp,
    render_candidate as render_generic_candidate,
    render_word_text_bit_overrides,
)
from student.generators.bf16_aggressive_semantic_search import render_variant as render_aggressive_variant
from student.generators.bf16_semantic_search import (
    CASE_OPS as ARITH_CASE_OPS,
    OP_LABELS,
    base_exp,
    build_table,
    const_word,
    render_semantic_verilog,
    semantic_model,
    signed_const,
    verify_outputs,
)


DEFAULT_RUN_ID = "ex215_ex219_frontend_bf16_semantic_20260606_1447"
DEFAULT_ABC = ROOT / "student" / "tools" / "abc" / "src" / "abc"

CASE_INFO = {
    "ex215": {"hypothesis": "bf16_reciprocal_sqrt", "function_guess": "reciprocal_sqrt"},
    "ex216": {"hypothesis": "bf16_cube", "function_guess": "cube"},
    "ex217": {"hypothesis": "bf16_cbrt", "function_guess": "cbrt"},
    "ex218": {"hypothesis": "bf16_reciprocal_cube", "function_guess": "reciprocal_cube"},
    "ex219": {"hypothesis": "bf16_reciprocal_cbrt", "function_guess": "reciprocal_cbrt"},
}


def read_old_best_adp(path):
    best = {}
    if path is None or not Path(path).is_file():
        return best
    with Path(path).open() as handle:
        for row in csv.DictReader(handle):
            if row.get("case") in CASE_INFO and row.get("adp"):
                best[row["case"]] = int(row["adp"])
    return best


def render_guarded_mod1_semantic(outputs, module, op, variant):
    _mod, table = build_table(op, outputs)
    if _mod != 1:
        raise RuntimeError("guarded mod1 renderer only supports mod1 ops")
    if op == "cube":
        base_line = "    base_exp = (exp_s <<< 1) + exp_s - 11'sd254;"
        zero_mag = "15'h0000"
        inf_mag = "15'h7f80"
        normal_condition = "((exp >= 8'd85 && exp <= 8'd168) || (exp == 8'd169 && mant <= 7'd75))"
        inf_condition = "((exp >= 8'd170 && exp <= 8'd254) || (exp == 8'd169 && mant >= 7'd76))"
        default_mag = zero_mag
        special_zero_line = "      mag_out = 15'h0000;"
        special_inf_line = "      mag_out = 15'h7f80;"
        normal_first = False
    elif op == "recip_cube":
        base_line = "    base_exp = 11'sd508 - ((exp_s <<< 1) + exp_s);"
        zero_mag = "15'h0000"
        inf_mag = "15'h7f80"
        normal_condition = "((exp >= 8'd85 && exp <= 8'd168) || (exp == 8'd84 && mant >= 7'd34) || (exp == 8'd169 && mant == 7'd0))"
        inf_condition = "((exp <= 8'd83) || (exp == 8'd84 && mant <= 7'd33))"
        zero_condition = "((exp >= 8'd170 && exp <= 8'd254) || (exp == 8'd169 && mant >= 7'd1))"
        default_mag = inf_mag
        special_zero_line = "      mag_out = 15'h7f80;"
        special_inf_line = "      mag_out = 15'h0000;"
        normal_first = variant.endswith("_normal_first")
    else:
        raise RuntimeError("unsupported guarded op: {0}".format(op))

    lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [15:0] out;",
        "  wire sign = in[15];",
        "  wire [7:0] exp = in[14:7];",
        "  wire [6:0] mant = in[6:0];",
        "  wire signed [10:0] exp_s = $signed({3'b000, exp});",
        "  reg signed [10:0] base_exp;",
        "  reg signed [3:0] exp_delta;",
        "  reg [6:0] norm_mant;",
        "  always @* begin",
        "    base_exp = 11'sd0;",
        base_line,
        "  end",
        "  always @* begin",
        "    exp_delta = 4'sd0;",
        "    norm_mant = 7'h00;",
        "    case (mant)",
    ]
    items = 0
    for mant in range(128):
        delta, out_mant = table[(0, mant)]
        if delta == 0 and out_mant == 0:
            continue
        items += 1
        lines.append(
            "      {0}: begin exp_delta = {1}; norm_mant = {2}; end".format(
                const_word(7, mant),
                signed_const(4, delta),
                const_word(7, out_mant),
            )
        )
    lines.extend(
        [
            "      default: begin end",
            "    endcase",
            "  end",
            "  wire signed [10:0] norm_exp_s = base_exp + exp_delta;",
            "  wire [14:0] normal_mag = {norm_exp_s[7:0], norm_mant};",
            "  reg [14:0] mag_out;",
            "  reg is_nan;",
            "  always @* begin",
            "    mag_out = {0};".format(default_mag),
            "    is_nan = 1'b0;",
            "    if (exp == 8'hff && mant != 7'h00) begin",
            "      is_nan = 1'b1;",
            "    end else if (exp == 8'hff) begin",
            special_inf_line,
            "    end else if (exp == 8'h00) begin",
            special_zero_line,
            "    end",
        ]
    )
    if normal_first:
        lines.extend(
            [
                "    else if ({0}) begin".format(normal_condition),
                "      mag_out = normal_mag;",
                "    end else if ({0}) begin".format(zero_condition),
                "      mag_out = 15'h0000;",
                "    end else if ({0}) begin".format(inf_condition),
                "      mag_out = 15'h7f80;",
                "    end",
            ]
        )
    elif op == "recip_cube":
        lines.extend(
            [
                "    else if ({0}) begin".format(inf_condition),
                "      mag_out = 15'h7f80;",
                "    end else if ({0}) begin".format(zero_condition),
                "      mag_out = 15'h0000;",
                "    end else if ({0}) begin".format(normal_condition),
                "      mag_out = normal_mag;",
                "    end",
            ]
        )
    else:
        lines.extend(
            [
                "    else if ({0}) begin".format(inf_condition),
                "      mag_out = 15'h7f80;",
                "    end else if ({0}) begin".format(normal_condition),
                "      mag_out = normal_mag;",
                "    end else begin",
                "      mag_out = 15'h0000;",
                "    end",
            ]
        )
    lines.extend(
        [
            "  end",
            "  assign out = is_nan ? 16'h7fc0 : {sign, mag_out};",
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines), "hand guarded {0} semantic mod1 RTL; mant_table_items={1}".format(op, items)


def render_recip_cbrt_guarded(outputs, module, variant):
    _mod, table = build_table("recip_cbrt", outputs)
    if _mod != 3:
        raise RuntimeError("unexpected recip_cbrt mod")
    use_exp_case = "expcase" in variant
    lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [15:0] out;",
        "  wire sign = in[15];",
        "  wire [7:0] exp = in[14:7];",
        "  wire [6:0] mant = in[6:0];",
        "  reg signed [10:0] base_exp;",
        "  reg [1:0] exp_class;",
        "  reg signed [3:0] exp_delta;",
        "  reg [6:0] norm_mant;",
        "  always @* begin",
        "    base_exp = 11'sd0;",
        "    exp_class = 2'd0;",
        "    case (exp)",
    ]
    for exp in range(1, 255):
        cls = exp % 3
        bexp = base_exp("recip_cbrt", exp)
        if use_exp_case:
            lines.append(
                "      {0}: begin base_exp = {1}; exp_class = 2'd{2}; end".format(
                    const_word(8, exp),
                    signed_const(11, bexp),
                    cls,
                )
            )
        else:
            lines.append(
                "      {0}: base_exp = {1};".format(const_word(8, exp), signed_const(11, bexp))
            )
    lines.extend(["      default: begin end", "    endcase"])
    if not use_exp_case:
        lines.extend(
            [
                "    case (exp % 8'd3)",
                "      8'd0: exp_class = 2'd0;",
                "      8'd1: exp_class = 2'd1;",
                "      8'd2: exp_class = 2'd2;",
                "      default: exp_class = 2'd0;",
                "    endcase",
            ]
        )
    lines.extend(
        [
            "  end",
            "  always @* begin",
            "    exp_delta = 4'sd0;",
            "    norm_mant = 7'h00;",
            "    case ({exp_class, mant})",
        ]
    )
    items = 0
    for cls in range(3):
        for mant in range(128):
            delta, out_mant = table[(cls, mant)]
            if delta == 0 and out_mant == 0:
                continue
            items += 1
            key = (cls << 7) | mant
            lines.append(
                "      {0}: begin exp_delta = {1}; norm_mant = {2}; end".format(
                    const_word(9, key),
                    signed_const(4, delta),
                    const_word(7, out_mant),
                )
            )
    lines.extend(
        [
            "      default: begin end",
            "    endcase",
            "  end",
            "  wire signed [10:0] norm_exp_s = base_exp + exp_delta;",
            "  wire [14:0] normal_mag = {norm_exp_s[7:0], norm_mant};",
            "  reg [14:0] mag_out;",
            "  reg is_nan;",
            "  always @* begin",
            "    mag_out = normal_mag;",
            "    is_nan = 1'b0;",
            "    if (exp == 8'h00) begin",
            "      mag_out = 15'h7f80;",
            "    end else if (exp == 8'hff && mant == 7'h00) begin",
            "      mag_out = 15'h0000;",
            "    end else if (exp == 8'hff) begin",
            "      is_nan = 1'b1;",
            "    end",
            "  end",
            "  assign out = is_nan ? 16'h7fc0 : {sign, mag_out};",
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines), "hand guarded recip_cbrt exp-class semantic RTL; table_items={0}".format(items)


def render_single_assign_bit_overrides(outputs, text, note, bits, bit_hi_bits):
    final = "endmodule\n"
    if not text.endswith(final):
        raise RuntimeError("unexpected module footer")
    lines = text[: -len(final)].rstrip().splitlines()
    assign_index = None
    for index in range(len(lines) - 1, -1, -1):
        stripped = lines[index].strip()
        if stripped.startswith("assign out = ") and stripped.endswith(";"):
            assign_index = index
            break
    if assign_index is None:
        raise RuntimeError("single-line assign out not found")
    expr = lines[assign_index].strip()[len("assign out = ") : -1]
    lines[assign_index] = "  wire [15:0] out_base = {0};".format(expr)
    helper_defs = [
        ("sign_exp", "  wire [8:0] sign_exp = in[15:7];"),
        ("mant =", "  wire [6:0] mant = in[6:0];"),
        ("mant_hi1", "  wire mant_hi1 = mant[6];"),
        ("mant_lo6", "  wire [5:0] mant_lo6 = mant[5:0];"),
        ("mant_hi2", "  wire [1:0] mant_hi2 = mant[6:5];"),
        ("mant_lo5", "  wire [4:0] mant_lo5 = mant[4:0];"),
        ("mant_hi3", "  wire [2:0] mant_hi3 = mant[6:4];"),
        ("mant_lo4", "  wire [3:0] mant_lo4 = mant[3:0];"),
        ("mant_hi4", "  wire [3:0] mant_hi4 = mant[6:3];"),
        ("mant_lo3", "  wire [2:0] mant_lo3 = mant[2:0];"),
        ("mant_hi5", "  wire [4:0] mant_hi5 = mant[6:2];"),
        ("mant_lo2", "  wire [1:0] mant_lo2 = mant[1:0];"),
        ("mant_hi6", "  wire [5:0] mant_hi6 = mant[6:1];"),
        ("mant_lo1", "  wire mant_lo1 = mant[0];"),
    ]
    missing = [line for token, line in helper_defs if not any(token in existing for existing in lines)]
    if missing:
        for index, line in enumerate(lines):
            if line.strip() == "output [15:0] out;":
                lines[index + 1 : index + 1] = missing
                break
    bit_set = set(bits)
    items = 0
    for bit in bits:
        target = "bit_{0}".format(bit)
        bit_default = mode_value([(value >> bit) & 1 for value in outputs])
        lines.extend(
            [
                "  reg {0};".format(target),
                "  always @* begin",
                "    {0} = 1'b{1};".format(target, bit_default),
                "    casez (sign_exp)",
            ]
        )
        const_items, variable = emit_const_bit_ranges(lines, outputs, bit, target, bit_default, "      ")
        items += const_items
        for sign_exp in variable:
            if bit_hi_bits == "runs":
                items += emit_bit_runs(lines, outputs, sign_exp, bit, target)
            elif bit_hi_bits == "cmp":
                items += emit_bit_cmp_runs(lines, outputs, sign_exp, bit, target)
            elif bit_hi_bits == "pla":
                items += emit_bit_pla(lines, outputs, sign_exp, bit, target)
            else:
                items += emit_bit_hi_lo(lines, outputs, sign_exp, bit, target, bit_hi_bits, "default_override")
        lines.extend(["      default: begin end", "    endcase", "  end"])
    pieces = ["bit_{0}".format(bit) if bit in bit_set else "out_base[{0}]".format(bit) for bit in range(15, -1, -1)]
    lines.extend(["  assign out = {{{0}}};".format(", ".join(pieces)), "endmodule", ""])
    return "\n".join(lines), "{0}; generic selected bit overrides bits={1} bit_hi_bits={2} bit_items={3}".format(
        note,
        "_".join(str(bit) for bit in bits),
        bit_hi_bits,
        items,
    )


def render_manual_sign_non_nan(text, note):
    final_word = "  assign out = out_r;\nendmodule\n"
    if text.endswith(final_word):
        lines = text[: -len(final_word)].rstrip().splitlines()
        base_expr = "out_r"
    else:
        final = "endmodule\n"
        if not text.endswith(final):
            raise RuntimeError("unexpected module footer")
        lines = text[: -len(final)].rstrip().splitlines()
        assign_index = None
        for index in range(len(lines) - 1, -1, -1):
            stripped = lines[index].strip()
            if stripped.startswith("assign out = ") and stripped.endswith(";"):
                assign_index = index
                break
        if assign_index is None:
            raise RuntimeError("single-line assign out not found")
        base_expr = "out_base"
        expr = lines[assign_index].strip()[len("assign out = ") : -1]
        lines[assign_index] = "  wire [15:0] out_base = {0};".format(expr)
    if not any("wire [7:0] exp" in line for line in lines):
        for index, line in enumerate(lines):
            if line.strip() == "output [15:0] out;":
                lines[index + 1 : index + 1] = [
                    "  wire sign = in[15];",
                    "  wire [7:0] exp = in[14:7];",
                    "  wire [6:0] mant = in[6:0];",
                ]
                break
    lines.extend(
        [
            "  wire out_sign_manual = sign && !(exp == 8'hff && mant != 7'h00);",
            "  assign out = {{out_sign_manual, {0}[14:0]}};".format(base_expr),
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines), "{0}; manual sign bit override sign && !is_nan".format(note)


def prepare_out_base(text):
    final_word = "  assign out = out_r;\nendmodule\n"
    if text.endswith(final_word):
        return text[: -len(final_word)].rstrip().splitlines(), "out_r"
    final = "endmodule\n"
    if not text.endswith(final):
        raise RuntimeError("unexpected module footer")
    lines = text[: -len(final)].rstrip().splitlines()
    assign_index = None
    for index in range(len(lines) - 1, -1, -1):
        stripped = lines[index].strip()
        if stripped.startswith("assign out = ") and stripped.endswith(";"):
            assign_index = index
            break
    if assign_index is None:
        raise RuntimeError("single-line assign out not found")
    expr = lines[assign_index].strip()[len("assign out = ") : -1]
    lines[assign_index] = "  wire [15:0] out_base = {0};".format(expr)
    return lines, "out_base"


def ensure_basic_wires(lines):
    helper_defs = [
        ("sign =", "  wire sign = in[15];"),
        ("[7:0] exp", "  wire [7:0] exp = in[14:7];"),
        ("[6:0] mant", "  wire [6:0] mant = in[6:0];"),
    ]
    missing = [line for token, line in helper_defs if not any(token in existing for existing in lines)]
    if missing:
        for index, line in enumerate(lines):
            if line.strip() == "output [15:0] out;":
                lines[index + 1 : index + 1] = missing
                break


def render_manual_sign_casez(text, note):
    lines, base_expr = prepare_out_base(text)
    ensure_basic_wires(lines)
    if not any("wire [8:0] sign_exp" in line for line in lines):
        for index, line in enumerate(lines):
            if line.strip() == "output [15:0] out;":
                lines[index + 1 : index + 1] = ["  wire [8:0] sign_exp = in[15:7];"]
                break
    lines.extend(
        [
            "  reg out_sign_casez;",
            "  always @* begin",
            "    out_sign_casez = 1'b0;",
            "    casez (sign_exp)",
            "      9'h1ff: out_sign_casez = (mant == 7'h00);",
            "      9'b1????????: out_sign_casez = 1'b1;",
            "      default: begin end",
            "    endcase",
            "  end",
            "  assign out = {out_sign_casez, " + base_expr + "[14:0]};",
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines), "{0}; manual sign bit casez override".format(note)


def render_cube_bit14_boundary(text, note):
    lines, base_expr = prepare_out_base(text)
    ensure_basic_wires(lines)
    lines.extend(
        [
            "  wire out_bit14_boundary = (exp >= 8'd128) || (exp == 8'd127 && mant >= 7'd34);",
            "  assign out = {" + base_expr + "[15], out_bit14_boundary, " + base_expr + "[13:0]};",
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines), "{0}; manual cube bit14 boundary exp>=128 or exp127 mant>=34".format(note)


def render_mod3_bit_override(outputs, text, note, bit):
    lines, base_expr = prepare_out_base(text)
    ensure_basic_wires(lines)
    lines.extend(
        [
            "  reg [1:0] exp_mod3;",
            "  always @* begin",
            "    case (exp)",
        ]
    )
    for exp in range(256):
        lines.append("      {0}: exp_mod3 = 2'd{1};".format(const_word(8, exp), exp % 3))
    lines.extend(
        [
            "      default: exp_mod3 = 2'd0;",
            "    endcase",
            "  end",
            "  reg mod3_bit;",
            "  always @* begin",
            "    mod3_bit = 1'b0;",
            "    case ({exp_mod3, mant})",
        ]
    )
    items = 0
    defaults = {}
    for cls in range(3):
        vals = []
        for mant in range(128):
            exp = cls if cls != 0 else 3
            if exp == 0:
                exp = 3
            vals.append((outputs[(exp << 7) | mant] >> bit) & 1)
        default = mode_value(vals)
        defaults[cls] = default
        lines.append("      // class {0} default {1}".format(cls, default))
    for cls in range(3):
        default = defaults[cls]
        for mant in range(128):
            exp = cls if cls != 0 else 3
            if exp == 0:
                exp = 3
            value = (outputs[(exp << 7) | mant] >> bit) & 1
            if value == default:
                continue
            items += 1
            key = (cls << 7) | mant
            lines.append("      {0}: mod3_bit = 1'b{1};".format(const_word(9, key), value))
    lines.extend(
        [
            "      default: begin",
            "        case (exp_mod3)",
        ]
    )
    for cls in range(3):
        lines.append("          2'd{0}: mod3_bit = 1'b{1};".format(cls, defaults[cls]))
    lines.extend(
        [
            "          default: mod3_bit = 1'b0;",
            "        endcase",
            "      end",
            "    endcase",
            "    if (exp == 8'h00 || exp == 8'hff) mod3_bit = " + base_expr + "[{0}];".format(bit),
            "  end",
            "  assign out = {"
            + ", ".join("mod3_bit" if index == bit else "{0}[{1}]".format(base_expr, index) for index in range(15, -1, -1))
            + "};",
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines), "{0}; mod3/mant selected bit override bit={1} items={2}".format(note, bit, items)


def render_case_attributes(text, note):
    replaced = text.replace("case (", "(* parallel_case, full_case *) case (")
    replaced = replaced.replace("casez (", "(* parallel_case, full_case *) casez (")
    return replaced, "{0}; source case attributes parallel_case full_case".format(note)


def semantic_note(case, outputs):
    op = ARITH_CASE_OPS[case]
    ok, note = verify_outputs(outputs, semantic_model(op, outputs))
    if not ok:
        raise RuntimeError(note)
    return note


def render_candidate(case, outputs, module, variant):
    if case == "ex216" and variant.startswith("hand_cube_guard_lut"):
        return render_guarded_mod1_semantic(outputs, module, "cube", variant)
    if case == "ex218" and variant.startswith("hand_recip_cube_guard_lut"):
        return render_guarded_mod1_semantic(outputs, module, "recip_cube", variant)
    if case == "ex219" and variant.startswith("hand_recip_cbrt_guard_lut"):
        return render_recip_cbrt_guarded(outputs, module, variant)
    match = re.match(r"(.+)_manual_sign_non_nan(?:_fix[0-9]*)?$", variant)
    if match:
        text, note = render_candidate(case, outputs, module, match.group(1))
        return render_manual_sign_non_nan(text, note)
    match = re.match(r"(.+)_manual_sign_casez(?:_fix[0-9]*)?$", variant)
    if match:
        text, note = render_candidate(case, outputs, module, match.group(1))
        return render_manual_sign_casez(text, note)
    match = re.match(r"(.+)_cube_bit14_boundary(?:_fix[0-9]*)?$", variant)
    if match:
        text, note = render_candidate(case, outputs, module, match.group(1))
        return render_cube_bit14_boundary(text, note)
    match = re.match(r"(.+)_mod3_bit([0-9]+)(?:_fix[0-9]*)?$", variant)
    if match:
        text, note = render_candidate(case, outputs, module, match.group(1))
        return render_mod3_bit_override(outputs, text, note, int(match.group(2)))
    match = re.match(r"(.+)_caseattrs(?:_fix[0-9]*)?$", variant)
    if match:
        text, note = render_candidate(case, outputs, module, match.group(1))
        return render_case_attributes(text, note)
    match = re.match(r"(.+)_bits_([0-9_]+)_(?:bh([1-6])|(runs|cmp|pla))(?:_fix[0-9]*)?$", variant)
    if match:
        base_variant = match.group(1)
        bits = [int(part) for part in match.group(2).split("_") if part != ""]
        bit_mode = match.group(3) if match.group(3) is not None else match.group(4)
        bit_mode = int(bit_mode) if str(bit_mode).isdigit() else bit_mode
        text, note = render_candidate(case, outputs, module, base_variant)
        try:
            return render_word_text_bit_overrides(outputs, text, note, bits, bit_mode)
        except RuntimeError as error:
            if str(error) != "unexpected word text footer":
                raise
        return render_single_assign_bit_overrides(outputs, text, note, bits, bit_mode)
    if variant == "arith_semantic_fields":
        op = ARITH_CASE_OPS[case]
        text, items = render_semantic_verilog(case, op, outputs, module)
        return text, "semantic BF16 exponent/mantissa RTL; {0}".format(items)
    if variant.startswith("aggr_"):
        aggressive_variant = variant[len("aggr_") :]
        text, items, model = render_aggressive_variant(case, outputs, module, aggressive_variant)
        ok, note = verify_outputs(outputs, model)
        if not ok:
            raise RuntimeError(note)
        return text, "aggressive semantic BF16 RTL; items={0}; {1}".format(items, note)
    return render_generic_candidate(case, outputs, module, variant)


def run_candidate(case, outputs, variant, args, semantic_notes):
    info = CASE_INFO[case]
    module = "{0}_{1}_{2}".format(case, info["hypothesis"], variant)
    case_work = ROOT / "student" / "work" / args.run_id / case
    verilog_path = case_work / "verilog" / "{0}.v".format(module)
    aig_path = case_work / "aigs" / "{0}.aig".format(module)
    log_path = case_work / "logs" / "{0}.yosys.log".format(module)
    script_path = case_work / "logs" / "{0}.ys".format(module)
    row = {
        "case": case,
        "candidate_id": module,
        "hypothesis": info["hypothesis"],
        "function_guess": info["function_guess"],
        "variant": variant,
        "verilog_path": rel_path(verilog_path),
        "aig_path": rel_path(aig_path),
        "verified_truth": "0",
        "equivalent": "0",
        "area": "",
        "delay": "",
        "adp": "",
        "runtime_sec": "",
        "notes": "",
    }
    start = time.time()
    try:
        text, note = render_candidate(case, outputs, module, variant)
        write_text(verilog_path, text)
        row["verified_truth"] = "1"
        yosys_log = synthesize_verilog(
            verilog=verilog_path,
            module=module,
            output=aig_path,
            timeout=args.yosys_timeout,
            script_out=script_path,
        )
        write_text(log_path, yosys_log)
        truth_path = ROOT / "benchmarks" / "{0}.truth".format(case)
        cand = evaluate_aig(
            case=case,
            candidate_id=module,
            parent_id="",
            source="verilog",
            tool_chain="yosys_aigmap",
            aig_path=aig_path,
            truth=truth_path,
            abc=args.abc,
            notes="{0}; {1}".format(semantic_notes[case], note),
            timeout=args.abc_timeout,
        )
        row["equivalent"] = "1" if cand.equivalent else "0"
        if cand.equivalent:
            row["area"] = str(cand.area)
            row["delay"] = str(cand.delay)
            row["adp"] = str(cand.adp)
        row["notes"] = cand.notes
    except (SynthError, RuntimeError, OSError, subprocess.TimeoutExpired) as error:
        row["notes"] = "failed: {0}".format(error)
    row["runtime_sec"] = "{0:.3f}".format(time.time() - start)
    return row


def write_manifests(args, cases, rows, semantic_notes):
    rows_by_case = {}
    for row in rows:
        rows_by_case.setdefault(row["case"], []).append(row)
    for case in cases:
        manifest = {
            "run_id": args.run_id,
            "case": case,
            "domain": "bf16",
            "stage": "frontend semantic/structural search",
            "truth_convention": "ABC read_truth -xf via student.frontends.truth.TruthTable",
            "backend_optimization": "not run",
            "semantic_note": semantic_notes.get(case, ""),
            "candidates": rows_by_case.get(case, []),
        }
        write_text(
            ROOT / "student" / "work" / args.run_id / case / "manifest.json",
            json.dumps(manifest, indent=2, sort_keys=True) + "\n",
        )
    lines = [
        "# {0}".format(args.run_id),
        "",
        "Run ID: `{0}`".format(args.run_id),
        "",
        "Purpose: frontend-only BF16 semantic/structural reverse engineering for ex215-ex219.",
        "",
        "Scope:",
        "- Cases: `{0}`.".format("`, `".join(cases)),
        "- Backend portfolios were not run.",
        "- Yosys AIG synthesis and ABC CEC/ADP measurement were used for frontend seed verification.",
        "",
        "Artifacts:",
        "- Work directory: `student/work/{0}/`".format(args.run_id),
        "- Results directory: `student/runs/bf16/{0}/results/`".format(args.run_id),
        "",
        "Semantic checks:",
    ]
    for case in cases:
        lines.append("- `{0}`: {1}".format(case, semantic_notes.get(case, "")))
    lines.extend(
        [
            "",
            "Methods:",
            "- Semantic arithmetic RTL for reciprocal-sqrt, cube, cbrt, reciprocal-cube, and reciprocal-cbrt.",
            "- Aggressive semantic field/default variants.",
            "- Sign-symmetry positive-domain structures for odd functions.",
            "- Mantissa hi/lo LUTs, separated fields, and delta/base structures.",
            "- Selected-bit override candidates where a stable base emerged.",
            "",
            "Best result:",
            "- See `results/best.csv` and `results/summary.csv`.",
            "",
        ]
    )
    write_text(ROOT / "student" / "runs" / "bf16" / args.run_id / "MANIFEST.md", "\n".join(lines))


def write_outputs(args, cases, rows, semantic_notes):
    refs = read_reference_adp(args.reference)
    old_best = read_old_best_adp(args.old_best)
    best = []
    for row in best_rows(rows):
        ref = refs.get(row["case"])
        old = old_best.get(row["case"])
        adp = int(row["adp"])
        out = {field: row.get(field, "") for field in BEST_FIELDS}
        out["old_best_adp"] = str(old) if old else ""
        out["improvement_vs_old_best"] = "{0:.6f}".format((old - adp) / old) if old else ""
        out["reference_adp"] = str(ref) if ref else ""
        out["ratio_to_reference"] = "{0:.6f}".format(adp / ref) if ref else ""
        out["within_1p5_reference"] = "1" if ref and adp <= int(ref * 1.5) else "0"
        out["beats_reference"] = "1" if ref and adp < ref else "0"
        best.append(out)
    best.sort(key=lambda row: row["case"])
    best_by_case = {row["case"]: row for row in best}
    summaries = []
    for case in cases:
        row = best_by_case.get(case, {})
        ref = refs.get(case)
        old = old_best.get(case)
        adp = int(row["adp"]) if row.get("adp") else None
        summaries.append(
            {
                "case": case,
                "best_candidate_id": row.get("candidate_id", ""),
                "best_area": row.get("area", ""),
                "best_delay": row.get("delay", ""),
                "best_adp": row.get("adp", ""),
                "old_best_adp": str(old) if old else "",
                "improvement_vs_old_best": "{0:.6f}".format((old - adp) / old) if old and adp else "",
                "reference_adp": str(ref) if ref else "",
                "ratio_to_reference": "{0:.6f}".format(adp / ref) if ref and adp else "",
                "within_1p5_reference": "1" if ref and adp and adp <= int(ref * 1.5) else "0",
                "beats_reference": "1" if ref and adp and adp < ref else "0",
                "notes": row.get("notes", ""),
            }
        )
    result_dir = ROOT / "student" / "runs" / "bf16" / args.run_id / "results"
    write_csv(result_dir / "candidates.csv", RESULT_FIELDS, rows)
    write_csv(result_dir / "best.csv", BEST_FIELDS, best)
    write_csv(result_dir / "summary.csv", SUMMARY_FIELDS, summaries)
    write_csv(result_dir / "evaluate_check.csv", RESULT_FIELDS, [row for row in rows if row["equivalent"] == "1"])
    write_manifests(args, cases, rows, semantic_notes)


def merge_existing_rows(args, rows):
    if not args.append:
        return rows
    path = ROOT / "student" / "runs" / "bf16" / args.run_id / "results" / "candidates.csv"
    if not path.is_file():
        return rows
    merged = []
    seen = set()
    with path.open() as handle:
        for row in csv.DictReader(handle):
            key = row.get("candidate_id", "")
            if key:
                seen.add(key)
            merged.append(row)
    for row in rows:
        key = row.get("candidate_id", "")
        if key and key in seen:
            continue
        merged.append(row)
        if key:
            seen.add(key)
    return merged


DEFAULT_VARIANTS = {
    "ex215": [
        "arith_semantic_fields",
        "aggr_semantic_field_reassembly",
        "aggr_semantic_exp_delta_fields",
        "aggr_semantic_positive_field_defaults",
        "legacy_sign_pair_case",
        "legacy_exp_mant_delta_pair",
        "legacy_positive_default_exp_mant_case",
        "legacy_positive_default_exp_mant_delta",
        "legacy_default_expr_exception_case",
        "split_sign_word_h3",
        "split_sign_word_h4",
        "sep_fields_e3_m3_s3",
        "hilo3_word_mode",
        "delta_pair_first_hilo3",
        "delta_pair_mode_hilo3",
        "delta_pair_first_hilo4",
    ],
    "ex216": [
        "arith_semantic_fields",
        "aggr_semantic_positive_symmetry_fields",
        "aggr_semantic_exp_delta_fields",
        "legacy_exp_mant_delta_pair",
        "legacy_positive_default_exp_mant_delta",
        "legacy_default_expr_exception_case",
        "odd_pos_fullword_h3",
        "odd_pos_fullword_h4",
        "odd_pos_fullword_h5",
        "odd_pos_fields_e3_m3",
        "split_sign_word_h3",
        "split_sign_word_h4",
        "sep_fields_e3_m3_s3",
        "delta_pair_first_hilo3",
        "delta_pair_mode_hilo3",
        "delta_pair_first_hilo4",
        "delta_pair_mode_hilo4",
    ],
    "ex217": [
        "arith_semantic_fields",
        "aggr_semantic_positive_symmetry_fields",
        "aggr_semantic_positive_field_defaults",
        "aggr_semantic_exp_delta_fields",
        "legacy_exp_mant_delta_pair",
        "legacy_positive_default_exp_mant_case",
        "legacy_positive_default_exp_mant_delta",
        "legacy_default_expr_exception_case",
        "odd_pos_fullword_h3",
        "odd_pos_fullword_h4",
        "odd_pos_fields_e3_m3",
        "split_sign_word_h3",
        "sep_fields_e3_m3_s3",
        "delta_pair_first_hilo3",
        "delta_pair_mode_hilo3",
        "delta_pair_first_hilo4",
        "delta_pair_mode_hilo4",
    ],
    "ex218": [
        "arith_semantic_fields",
        "aggr_semantic_positive_symmetry_fields",
        "aggr_semantic_exp_delta_fields",
        "legacy_value_case",
        "legacy_sign_pair_case",
        "legacy_exp_mant_delta_pair",
        "legacy_positive_default_exp_mant_delta",
        "legacy_default_expr_exception_case",
        "odd_pos_fullword_h3",
        "odd_pos_fullword_h4",
        "odd_pos_fullword_h5",
        "odd_pos_fields_e3_m3",
        "split_sign_word_h3",
        "sep_fields_e3_m3_s3",
        "delta_pair_first_hilo3",
        "delta_pair_mode_hilo3",
        "delta_pair_first_hilo4",
        "delta_pair_mode_hilo4",
    ],
    "ex219": [
        "arith_semantic_fields",
        "aggr_semantic_positive_symmetry_fields",
        "aggr_semantic_positive_field_defaults",
        "aggr_semantic_exp_delta_fields",
        "legacy_exp_mant_delta_pair",
        "legacy_positive_default_exp_mant_case",
        "legacy_positive_default_exp_mant_delta",
        "legacy_default_expr_exception_case",
        "odd_pos_fullword_h3",
        "odd_pos_fullword_h4",
        "odd_pos_fields_e3_m3",
        "split_sign_word_h3",
        "sep_fields_e3_m3_s3",
        "delta_pair_first_hilo3",
        "delta_pair_mode_hilo3",
        "delta_pair_first_hilo4",
        "delta_pair_mode_hilo4",
    ],
}


def parse_args(argv=None):
    parser = argparse.ArgumentParser(description="BF16 ex215-ex219 frontend-only semantic search.")
    parser.add_argument("--run-id", default=DEFAULT_RUN_ID)
    parser.add_argument("--cases", nargs="+", default=["ex215", "ex216", "ex217", "ex218", "ex219"])
    parser.add_argument("--variants", nargs="+", default=None)
    parser.add_argument("--reference", type=Path, default=ROOT / "reference_result.csv")
    parser.add_argument(
        "--old-best",
        type=Path,
        default=ROOT / "student" / "runs" / "bf16" / "ex200_ex219_current" / "results" / "best.csv",
    )
    parser.add_argument("--abc", type=Path, default=DEFAULT_ABC)
    parser.add_argument("--yosys-timeout", type=int, default=180)
    parser.add_argument("--abc-timeout", type=int, default=180)
    parser.add_argument("--append", action="store_true")
    parser.add_argument("--rewrite-only", action="store_true")
    return parser.parse_args(argv)


def main(argv=None):
    args = parse_args(argv)
    if args.rewrite_only:
        path = ROOT / "student" / "runs" / "bf16" / args.run_id / "results" / "candidates.csv"
        with path.open() as handle:
            rows = list(csv.DictReader(handle))
        semantic_notes = {}
        for case in args.cases:
            outputs = list(TruthTable(ROOT / "benchmarks" / "{0}.truth".format(case)).iter_outputs())
            semantic_notes[case] = semantic_note(case, outputs)
        write_outputs(args, args.cases, rows, semantic_notes)
        print("Rewrote summaries from {0}".format(path))
        return 0

    rows = []
    semantic_notes = {}
    for case in args.cases:
        if case not in CASE_INFO:
            raise RuntimeError("unsupported case: {0}".format(case))
        outputs = list(TruthTable(ROOT / "benchmarks" / "{0}.truth".format(case)).iter_outputs())
        semantic_notes[case] = semantic_note(case, outputs)
        variants = args.variants if args.variants is not None else DEFAULT_VARIANTS[case]
        for variant in variants:
            row = run_candidate(case, outputs, variant, args, semantic_notes)
            rows.append(row)
            print(
                "{0} {1}: equiv={2} area={3} delay={4} adp={5}".format(
                    case,
                    variant,
                    row["equivalent"],
                    row["area"],
                    row["delay"],
                    row["adp"],
                )
            )
    rows = merge_existing_rows(args, rows)
    write_outputs(args, args.cases, rows, semantic_notes)
    print("Results: student/runs/bf16/{0}/results/candidates.csv".format(args.run_id))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
