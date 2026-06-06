#!/usr/bin/env python3
"""Frontend-only BF16 semantic/structural search for ex205-ex209.

The generated Verilog is derived from the official truth tables using the
project truth convention (`read_truth -xf`).  This script only runs Yosys AIG
synthesis plus ABC CEC/ADP measurement; it does not run backend portfolios.
"""

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
from student.generators.bf16_ex201_ex204_semantic_run import (
    const_word,
    grouped_runs,
    mode_value,
    range_casez_patterns,
    rel_path,
    write_csv,
    write_text,
)
from student.generators.bf16_ex201_ex204_continue import (
    active_sign_exps,
    emit_bit_cmp_runs,
    emit_bit_hi_lo,
    emit_bit_pla,
    emit_bit_runs,
    emit_const_bit_ranges,
    emit_const_scalar_ranges,
    emit_scalar_hi_lo,
    emit_scalar_hi_lo_exp,
    bdd_order,
    build_bdd_bit,
    field_value,
    field_width,
    module_header,
    render_candidate as render_structural_candidate,
    render_hi_lo,
    render_sep_fields,
)
from student.generators.bf16_verilog_search import render_variant as render_legacy_variant
from student.generators.bf16_verilog_search import (
    choose_default_expr_for_indices,
    default_expr_value,
    default_expr_verilog,
)


DEFAULT_RUN_ID = "ex205_ex209_frontend_bf16_semantic_20260606_0946"
DEFAULT_ABC = ROOT / "student" / "tools" / "abc" / "src" / "abc"

CASE_INFO = {
    "ex205": {"hypothesis": "bf16_log10", "function_guess": "log10"},
    "ex206": {"hypothesis": "bf16_sin", "function_guess": "sin"},
    "ex207": {"hypothesis": "bf16_tan", "function_guess": "tan"},
    "ex208": {"hypothesis": "bf16_sinh", "function_guess": "sinh"},
    "ex209": {"hypothesis": "bf16_tanh", "function_guess": "tanh"},
}

RESULT_FIELDS = [
    "case",
    "candidate_id",
    "hypothesis",
    "function_guess",
    "variant",
    "verilog_path",
    "aig_path",
    "verified_truth",
    "equivalent",
    "area",
    "delay",
    "adp",
    "runtime_sec",
    "notes",
]

BEST_FIELDS = [
    "case",
    "candidate_id",
    "hypothesis",
    "function_guess",
    "variant",
    "verilog_path",
    "aig_path",
    "verified_truth",
    "equivalent",
    "area",
    "delay",
    "adp",
    "reference_adp",
    "ratio_to_reference",
    "within_1p5_reference",
    "beats_reference",
    "notes",
]

SUMMARY_FIELDS = [
    "case",
    "best_candidate_id",
    "best_area",
    "best_delay",
    "best_adp",
    "reference_adp",
    "ratio_to_reference",
    "within_1p5_reference",
    "beats_reference",
    "notes",
]


def read_reference_adp(path):
    refs = {}
    with Path(path).open() as handle:
        reader = csv.DictReader(handle)
        for row in reader:
            refs[row["case"]] = int(row.get("ADP", row.get("adp")))
    return refs


def emit_exp_word_table(lines, outputs, input_sign, exp, target, hi_bits, default_mode="mode"):
    hi_count = 1 << hi_bits
    lo_bits = 7 - hi_bits
    hi_name = "mant_hi{0}".format(hi_bits)
    lo_name = "mant_lo{0}".format(lo_bits)
    base_sign = input_sign << 15
    lines.append("        {0}: begin".format(const_word(8, exp)))
    lines.append("          case ({0})".format(hi_name))
    items = 0
    for hi in range(hi_count):
        values = [
            outputs[base_sign | (exp << 7) | (hi << lo_bits) | lo]
            for lo in range(1 << lo_bits)
        ]
        base = values[0] if default_mode == "first" else mode_value(values)
        differing = [(lo, value) for lo, value in enumerate(values) if value != base]
        lines.append("            {0}: begin".format(const_word(hi_bits, hi)))
        lines.append("              {0} = {1};".format(target, const_word(16, base)))
        if differing:
            lines.append("              case ({0})".format(lo_name))
            for lo, value in differing:
                lines.append(
                    "                {0}: {1} = {2};".format(
                        const_word(lo_bits, lo),
                        target,
                        const_word(16, value),
                    )
                )
                items += 1
            lines.append("                default: begin end")
            lines.append("              endcase")
        lines.append("            end")
        items += 1
    lines.append("            default: begin end")
    lines.append("          endcase")
    lines.append("        end")
    return items


def render_split_sign_word(outputs, module, hi_bits, default_mode="mode"):
    default = mode_value(outputs)
    lines = module_header(module)
    lines.extend(
        [
            "  wire sign = in[15];",
            "  wire [7:0] exp = in[14:7];",
            "  reg [15:0] out_r;",
            "  always @* begin",
            "    out_r = {0};".format(const_word(16, default)),
            "    if (sign) begin",
            "      casez (exp)",
        ]
    )
    items = 0
    for input_sign in (1, 0):
        by_value = {}
        variable = []
        base_sign = input_sign << 15
        for exp in range(256):
            values = [outputs[base_sign | (exp << 7) | mant] for mant in range(128)]
            if len(set(values)) == 1:
                value = values[0]
                if value != default:
                    by_value.setdefault(value, []).append(exp)
            else:
                variable.append(exp)
        for value in sorted(by_value):
            for start, end in grouped_runs(by_value[value]):
                for pattern in range_casez_patterns(8, start, end):
                    lines.append("        {0}: out_r = {1};".format(pattern, const_word(16, value)))
                    items += 1
        for exp in variable:
            items += emit_exp_word_table(lines, outputs, input_sign, exp, "out_r", hi_bits, default_mode)
        if input_sign == 1:
            lines.extend(
                [
                    "        default: begin end",
                    "      endcase",
                    "    end else begin",
                    "      casez (exp)",
                ]
            )
        else:
            lines.extend(
                [
                    "        default: begin end",
                    "      endcase",
                    "    end",
                    "  end",
                    "  assign out = out_r;",
                    "endmodule",
                    "",
                ]
            )
    note = "split-sign word hi_bits={0} default_mode={1} items={2}".format(hi_bits, default_mode, items)
    return "\n".join(lines), note


def render_positive_word_with_sign(outputs, module, hi_bits):
    """Positive-domain LUT plus output sign reuse for odd BF16 functions."""
    lines = module_header(module)
    lines.extend(
        [
            "  wire sign = in[15];",
            "  wire [7:0] exp = in[14:7];",
            "  reg [14:0] mag;",
            "  reg is_nan;",
            "  always @* begin",
            "    mag = 15'h0000;",
            "    is_nan = 1'b0;",
            "    casez (exp)",
        ]
    )
    items = 0
    positive_outputs = [outputs[(exp << 7) | mant] for exp in range(256) for mant in range(128)]
    default_mag = mode_value([value & 0x7FFF for value in positive_outputs])
    default_nan = mode_value([1 if value == 0x7FC0 else 0 for value in positive_outputs])
    lines[lines.index("    mag = 15'h0000;")] = "    mag = {0};".format(const_word(15, default_mag))
    lines[lines.index("    is_nan = 1'b0;")] = "    is_nan = 1'b{0};".format(default_nan)
    by_pair = {}
    variable = []
    for exp in range(256):
        pairs = [
            ((outputs[(exp << 7) | mant] & 0x7FFF), 1 if outputs[(exp << 7) | mant] == 0x7FC0 else 0)
            for mant in range(128)
        ]
        unique = set(pairs)
        if len(unique) == 1:
            pair = pairs[0]
            if pair != (default_mag, default_nan):
                by_pair.setdefault(pair, []).append(exp)
        else:
            variable.append(exp)
    for (mag, nan), exps in sorted(by_pair.items()):
        for start, end in grouped_runs(exps):
            for pattern in range_casez_patterns(8, start, end):
                lines.append(
                    "      {0}: begin mag = {1}; is_nan = 1'b{2}; end".format(
                        pattern,
                        const_word(15, mag),
                        nan,
                    )
                )
                items += 1
    for exp in variable:
        values = [
            ((outputs[(exp << 7) | mant] & 0x7FFF), 1 if outputs[(exp << 7) | mant] == 0x7FC0 else 0)
            for mant in range(128)
        ]
        hi_count = 1 << hi_bits
        lo_bits = 7 - hi_bits
        hi_name = "mant_hi{0}".format(hi_bits)
        lo_name = "mant_lo{0}".format(lo_bits)
        lines.append("      {0}: begin".format(const_word(8, exp)))
        lines.append("        case ({0})".format(hi_name))
        for hi in range(hi_count):
            local = [values[(hi << lo_bits) | lo] for lo in range(1 << lo_bits)]
            base = mode_value(local)
            differing = [(lo, pair) for lo, pair in enumerate(local) if pair != base]
            lines.append("          {0}: begin".format(const_word(hi_bits, hi)))
            lines.append(
                "            mag = {0}; is_nan = 1'b{1};".format(
                    const_word(15, base[0]),
                    base[1],
                )
            )
            if differing:
                lines.append("            case ({0})".format(lo_name))
                for lo, (mag, nan) in differing:
                    lines.append(
                        "              {0}: begin mag = {1}; is_nan = 1'b{2}; end".format(
                            const_word(lo_bits, lo),
                            const_word(15, mag),
                            nan,
                        )
                    )
                    items += 1
                lines.append("              default: begin end")
                lines.append("            endcase")
            lines.append("          end")
            items += 1
        lines.append("          default: begin end")
        lines.append("        endcase")
        lines.append("      end")
    lines.extend(
        [
            "      default: begin end",
            "    endcase",
            "  end",
            "  assign out = is_nan ? 16'h7fc0 : {sign, mag};",
            "endmodule",
            "",
        ]
    )
    note = "positive-domain odd symmetry word hi_bits={0} items={1}".format(hi_bits, items)
    return "\n".join(lines), note


def render_positive_fullword_flip(outputs, module, hi_bits, default_mode="mode"):
    lines = module_header(module)
    lines.extend(
        [
            "  wire sign = in[15];",
            "  wire [7:0] exp = in[14:7];",
            "  reg [15:0] pos_word;",
            "  always @* begin",
            "    pos_word = {0};".format(
                const_word(16, mode_value([outputs[(exp << 7) | mant] for exp in range(256) for mant in range(128)]))
            ),
            "    casez (exp)",
        ]
    )
    items = 0
    positive_outputs = [outputs[(exp << 7) | mant] for exp in range(256) for mant in range(128)]
    default = mode_value(positive_outputs)
    by_value = {}
    variable = []
    for exp in range(256):
        values = [outputs[(exp << 7) | mant] for mant in range(128)]
        unique = set(values)
        if len(unique) == 1:
            value = values[0]
            if value != default:
                by_value.setdefault(value, []).append(exp)
        else:
            variable.append(exp)
    for value in sorted(by_value):
        for start, end in grouped_runs(by_value[value]):
            for pattern in range_casez_patterns(8, start, end):
                lines.append("      {0}: pos_word = {1};".format(pattern, const_word(16, value)))
                items += 1
    for exp in variable:
        values = [outputs[(exp << 7) | mant] for mant in range(128)]
        hi_count = 1 << hi_bits
        lo_bits = 7 - hi_bits
        hi_name = "mant_hi{0}".format(hi_bits)
        lo_name = "mant_lo{0}".format(lo_bits)
        lines.append("      {0}: begin".format(const_word(8, exp)))
        lines.append("        case ({0})".format(hi_name))
        for hi in range(hi_count):
            local = [values[(hi << lo_bits) | lo] for lo in range(1 << lo_bits)]
            base = local[0] if default_mode == "first" else mode_value(local)
            differing = [(lo, value) for lo, value in enumerate(local) if value != base]
            lines.append("          {0}: begin".format(const_word(hi_bits, hi)))
            lines.append("            pos_word = {0};".format(const_word(16, base)))
            if differing:
                lines.append("            case ({0})".format(lo_name))
                for lo, value in differing:
                    lines.append(
                        "              {0}: pos_word = {1};".format(
                            const_word(lo_bits, lo),
                            const_word(16, value),
                        )
                    )
                    items += 1
                lines.append("              default: begin end")
                lines.append("            endcase")
            lines.append("          end")
            items += 1
        lines.append("          default: begin end")
        lines.append("        endcase")
        lines.append("      end")
    lines.extend(
        [
            "      default: begin end",
            "    endcase",
            "  end",
            "  wire flip_sign = sign & (pos_word != 16'h7fc0);",
            "  assign out = pos_word ^ {flip_sign, 15'h0000};",
            "endmodule",
            "",
        ]
    )
    note = "positive-domain full word with odd sign flip hi_bits={0} default_mode={1} items={2}".format(
        hi_bits,
        default_mode,
        items,
    )
    return "\n".join(lines), note


def render_positive_fullword_expnan(outputs, module, hi_bits, default_mode="mode"):
    text, note = render_positive_fullword_flip(outputs, module, hi_bits, default_mode)
    old = [
        "  wire flip_sign = sign & (pos_word != 16'h7fc0);",
        "  assign out = pos_word ^ {flip_sign, 15'h0000};",
    ]
    new = [
        "  assign out = (exp == 8'hff) ? 16'h7fc0 : (pos_word ^ {sign, 15'h0000});",
    ]
    for line in old:
        if line not in text:
            raise RuntimeError("unexpected odd fullword footer")
    text = text.replace("\n".join(old), "\n".join(new))
    return text, "{0}; NaN special simplified to exp==255".format(note)


def render_positive_fullword_expflip(outputs, module, hi_bits, default_mode="mode"):
    text, note = render_positive_fullword_flip(outputs, module, hi_bits, default_mode)
    old = "  wire flip_sign = sign & (pos_word != 16'h7fc0);"
    new = "  wire flip_sign = sign & (exp != 8'hff);"
    if old not in text:
        raise RuntimeError("unexpected odd fullword flip line")
    text = text.replace(old, new)
    return text, "{0}; sign flip simplified to exp!=255".format(note)


def render_positive_fields_with_sign(outputs, module, exp_hi_bits, mant_hi_bits):
    """Odd-function positive-domain LUT split into exponent and mantissa fields."""
    lines = module_header(module)
    lines.extend(
        [
            "  wire sign = in[15];",
            "  wire [7:0] exp = in[14:7];",
            "  reg [7:0] out_exp;",
            "  reg [6:0] out_mant;",
            "  reg is_nan;",
        ]
    )
    items = 0
    settings = [
        ("exp", "out_exp", exp_hi_bits),
        ("mant", "out_mant", mant_hi_bits),
    ]
    positive_outputs = [outputs[(exp << 7) | mant] for exp in range(256) for mant in range(128)]
    defaults = {
        "exp": mode_value([(value >> 7) & 0xFF for value in positive_outputs]),
        "mant": mode_value([value & 0x7F for value in positive_outputs]),
        "nan": mode_value([1 if value == 0x7FC0 else 0 for value in positive_outputs]),
    }
    for field, target, hi_bits in settings:
        lines.extend(
            [
                "  always @* begin",
                "    {0} = {1};".format(target, const_word(field_width(field), defaults[field])),
                "    casez (exp)",
            ]
        )
        by_value = {}
        variable = []
        for exp in range(256):
            values = [
                field_value(outputs[(exp << 7) | mant], field)
                for mant in range(128)
            ]
            unique = set(values)
            if len(unique) == 1:
                value = values[0]
                if value != defaults[field]:
                    by_value.setdefault(value, []).append(exp)
            else:
                variable.append(exp)
        for value in sorted(by_value):
            for start, end in grouped_runs(by_value[value]):
                for pattern in range_casez_patterns(8, start, end):
                    lines.append(
                        "      {0}: {1} = {2};".format(
                            pattern,
                            target,
                            const_word(field_width(field), value),
                        )
                    )
                    items += 1
        for exp in variable:
            items += emit_scalar_hi_lo_exp(lines, outputs, 0, exp, field, target, hi_bits)
        lines.extend(["      default: begin end", "    endcase", "  end"])
    lines.extend(
        [
            "  always @* begin",
            "    is_nan = 1'b{0};".format(defaults["nan"]),
            "    casez (exp)",
        ]
    )
    by_value = {}
    variable = []
    for exp in range(256):
        values = [1 if outputs[(exp << 7) | mant] == 0x7FC0 else 0 for mant in range(128)]
        unique = set(values)
        if len(unique) == 1:
            value = values[0]
            if value != defaults["nan"]:
                by_value.setdefault(value, []).append(exp)
        else:
            variable.append(exp)
    for value in sorted(by_value):
        for start, end in grouped_runs(by_value[value]):
            for pattern in range_casez_patterns(8, start, end):
                lines.append("      {0}: is_nan = 1'b{1};".format(pattern, value))
                items += 1
    for exp in variable:
        values = [1 if outputs[(exp << 7) | mant] == 0x7FC0 else 0 for mant in range(128)]
        default = mode_value(values)
        lines.append("      {0}: begin".format(const_word(8, exp)))
        lines.append("        is_nan = 1'b{0};".format(default))
        differing = [(mant, value) for mant, value in enumerate(values) if value != default]
        if differing:
            lines.append("        casez (mant)")
            for mant, value in differing:
                lines.append("          {0}: is_nan = 1'b{1};".format(const_word(7, mant), value))
                items += 1
            lines.append("          default: begin end")
            lines.append("        endcase")
        lines.append("      end")
        items += 1
    lines.extend(
        [
            "      default: begin end",
            "    endcase",
            "  end",
            "  assign out = is_nan ? 16'h7fc0 : {sign, out_exp, out_mant};",
            "endmodule",
            "",
        ]
    )
    note = "positive-domain odd symmetry separate fields exp_hi={0} mant_hi={1} items={2}".format(
        exp_hi_bits,
        mant_hi_bits,
        items,
    )
    return "\n".join(lines), note


def render_default_expr_with_exceptions(outputs, module, default_expr, exception_hi_bits):
    lines = module_header(module)
    lines.extend(
        [
            "  wire sign = in[15];",
            "  wire [7:0] exp = in[14:7];",
            "  reg [15:0] out_r;",
            "  always @* begin",
            "    out_r = {0};".format(default_expr),
            "    casez (sign_exp)",
        ]
    )
    items = 0
    for sign_exp in range(512):
        expected = [outputs[(sign_exp << 7) | mant] for mant in range(128)]
        if default_expr == "in":
            base = [(sign_exp << 7) | mant for mant in range(128)]
        elif default_expr == "{sign, 15'h3f80}":
            base = [((sign_exp >> 8) << 15) | 0x3F80 for _ in range(128)]
        elif default_expr == "{sign, 15'h7f80}":
            base = [((sign_exp >> 8) << 15) | 0x7F80 for _ in range(128)]
        elif default_expr == "16'h7fc0":
            base = [0x7FC0 for _ in range(128)]
        else:
            raise RuntimeError("unknown default expr: {0}".format(default_expr))
        if expected == base:
            continue
        if len(set(expected)) == 1:
            lines.append("      {0}: out_r = {1};".format(const_word(9, sign_exp), const_word(16, expected[0])))
            items += 1
            continue
        hi_count = 1 << exception_hi_bits
        lo_bits = 7 - exception_hi_bits
        hi_name = "mant_hi{0}".format(exception_hi_bits)
        lo_name = "mant_lo{0}".format(lo_bits)
        lines.append("      {0}: begin".format(const_word(9, sign_exp)))
        lines.append("        case ({0})".format(hi_name))
        for hi in range(hi_count):
            local_expected = [
                expected[(hi << lo_bits) | lo]
                for lo in range(1 << lo_bits)
            ]
            local_base = [
                base[(hi << lo_bits) | lo]
                for lo in range(1 << lo_bits)
            ]
            values = [
                expected_value if expected_value != base_value else None
                for expected_value, base_value in zip(local_expected, local_base)
            ]
            non_base = [value for value in values if value is not None]
            if not non_base:
                continue
            override_default = mode_value(non_base)
            lines.append("          {0}: begin".format(const_word(exception_hi_bits, hi)))
            lines.append("            out_r = {0};".format(const_word(16, override_default)))
            differing = [
                (lo, expected_value, base_value)
                for lo, (expected_value, base_value) in enumerate(zip(local_expected, local_base))
                if expected_value != override_default
            ]
            if differing:
                lines.append("            case ({0})".format(lo_name))
                for lo, expected_value, base_value in differing:
                    value = expected_value if expected_value != base_value else None
                    if value is None:
                        lines.append("              {0}: out_r = {1};".format(const_word(lo_bits, lo), default_expr))
                    else:
                        lines.append("              {0}: out_r = {1};".format(const_word(lo_bits, lo), const_word(16, value)))
                    items += 1
                lines.append("              default: begin end")
                lines.append("            endcase")
            lines.append("          end")
            items += 1
        lines.append("          default: begin end")
        lines.append("        endcase")
        lines.append("      end")
    lines.extend(
        [
            "      default: begin end",
            "    endcase",
            "  end",
            "  assign out = out_r;",
            "endmodule",
            "",
        ]
    )
    note = "default expr {0} with exception hi_bits={1} items={2}".format(
        default_expr,
        exception_hi_bits,
        items,
    )
    return "\n".join(lines), note


def render_hilo_word_bit_overrides(outputs, module, base_hi_bits, bits, bit_hi_bits):
    text, note = render_hi_lo(outputs, module, False, base_hi_bits, "default_override")
    final = "  assign out = out_r;\nendmodule\n"
    if not text.endswith(final):
        raise RuntimeError("unexpected hilo word footer")
    lines = text[: -len(final)].rstrip().splitlines()
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
        bit_items, variable = emit_const_bit_ranges(lines, outputs, bit, target, bit_default, "      ")
        items += bit_items
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
    pieces = ["bit_{0}".format(bit) if bit in bit_set else "out_r[{0}]".format(bit) for bit in range(15, -1, -1)]
    lines.extend(["  assign out = {{{0}}};".format(", ".join(pieces)), "endmodule", ""])
    note = "{0}; generic hilo word bit overrides bits={1} bit_hi_bits={2} bit_items={3}".format(
        note,
        "_".join(str(bit) for bit in bits),
        bit_hi_bits,
        items,
    )
    return "\n".join(lines), note


def render_sign_exp_default_expr_casez(outputs, module):
    lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [15:0] out;",
        "  wire [8:0] sign_exp = in[15:7];",
        "  wire [6:0] mant = in[6:0];",
        "  reg [15:0] out_r;",
        "  always @* begin",
        "    out_r = 16'h0000;",
        "    casez (sign_exp)",
    ]
    full_by_default = {}
    exception_groups = []
    exceptions_total = 0
    for sign_exp in range(512):
        base = sign_exp << 7
        indices = [base | mant for mant in range(128)]
        default_name, _matches = choose_default_expr_for_indices(outputs, indices)
        exceptions = [
            (mant, outputs[base | mant])
            for mant in range(128)
            if default_expr_value(default_name, base | mant) != outputs[base | mant]
        ]
        exceptions_total += len(exceptions)
        if not exceptions:
            full_by_default.setdefault(default_name, []).append(sign_exp)
        else:
            exception_groups.append((sign_exp, default_name, exceptions))
    items = 0
    for default_name in sorted(full_by_default):
        for start, end in grouped_runs(full_by_default[default_name]):
            for pattern in range_casez_patterns(9, start, end):
                lines.append("      {0}: out_r = {1};".format(pattern, default_expr_verilog(default_name)))
                items += 1
    for sign_exp, default_name, exceptions in exception_groups:
        lines.append("      {0}: begin".format(const_word(9, sign_exp)))
        lines.append("        out_r = {0};".format(default_expr_verilog(default_name)))
        lines.append("        case (mant)")
        for mant, value in exceptions:
            lines.append("          {0}: out_r = {1};".format(const_word(7, mant), const_word(16, value)))
            items += 1
        lines.extend(["          default: begin end", "        endcase", "      end"])
        items += 1
    lines.extend(
        [
            "      default: begin end",
            "    endcase",
            "  end",
            "  assign out = out_r;",
            "endmodule",
            "",
        ]
    )
    note = "range-compressed sign-exp default expression groups={0} exceptions={1} items={2}".format(
        len(full_by_default),
        exceptions_total,
        items,
    )
    return "\n".join(lines), note


def manual_bit_expr(case, bit):
    if case == "ex205" and bit == 15:
        return "(in[14:7] == 8'h00) | ((~in[15]) & (in[14:7] < 8'd127))"
    if case in ("ex208", "ex209") and bit == 15:
        return "in[15] & ~((in[14:7] == 8'hff) & (in[6:0] != 7'h00))"
    raise RuntimeError("no manual bit formula for {0} bit {1}".format(case, bit))


def render_sep_fields_manual_bits(case, outputs, module, exp_hi_bits, mant_hi_bits, sign_hi_bits, bits):
    text, note = render_sep_fields(outputs, module, exp_hi_bits, mant_hi_bits, sign_hi_bits)
    final = "  assign out = {out_sign, out_exp, out_mant};\nendmodule\n"
    if not text.endswith(final):
        raise RuntimeError("unexpected sep fields footer")
    lines = text[: -len(final)].rstrip().splitlines()
    for bit in bits:
        lines.append("  wire bit_{0} = {1};".format(bit, manual_bit_expr(case, bit)))
    bit_set = set(bits)
    pieces = []
    for bit in range(15, -1, -1):
        if bit in bit_set:
            pieces.append("bit_{0}".format(bit))
        elif bit == 15:
            pieces.append("out_sign")
        elif bit >= 7:
            pieces.append("out_exp[{0}]".format(bit - 7))
        else:
            pieces.append("out_mant[{0}]".format(bit))
    lines.extend(["  assign out = {{{0}}};".format(", ".join(pieces)), "endmodule", ""])
    return "\n".join(lines), "{0}; manual formula bits={1}".format(
        note,
        "_".join(str(bit) for bit in bits),
    )


def render_word_text_manual_bits(case, text, note, bits):
    final = "  assign out = out_r;\nendmodule\n"
    if not text.endswith(final):
        raise RuntimeError("unexpected word text footer")
    lines = text[: -len(final)].rstrip().splitlines()
    for bit in bits:
        lines.append("  wire bit_{0} = {1};".format(bit, manual_bit_expr(case, bit)))
    bit_set = set(bits)
    pieces = ["bit_{0}".format(bit) if bit in bit_set else "out_r[{0}]".format(bit) for bit in range(15, -1, -1)]
    lines.extend(["  assign out = {{{0}}};".format(", ".join(pieces)), "endmodule", ""])
    return "\n".join(lines), "{0}; manual formula bits={1}".format(
        note,
        "_".join(str(bit) for bit in bits),
    )


def render_bdd_all_bits(outputs, module, order_name):
    lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [15:0] out;",
    ]
    exprs = {}
    total_nodes = 0

    def local_ref(bit, name):
        if name == "0":
            return "1'b0"
        if name == "1":
            return "1'b1"
        return "b{0}_{1}".format(bit, name)

    order = bdd_order(order_name)
    for bit in range(16):
        root, nodes = build_bdd_bit(outputs, bit, order, node_limit=20000)
        total_nodes += len(nodes)
        for name, var, low, high in nodes:
            lines.append(
                "  wire b{0}_{1} = in[{2}] ? {3} : {4};".format(
                    bit,
                    name,
                    var,
                    local_ref(bit, high),
                    local_ref(bit, low),
                )
            )
        exprs[bit] = local_ref(bit, root)
    lines.extend(
        [
            "  assign out = {{{0}}};".format(", ".join(exprs[bit] for bit in range(15, -1, -1))),
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines), "full-output BDD order={0} nodes={1}".format(order_name, total_nodes)


def positive_runs(outputs):
    runs = []
    start = 0
    prev = outputs[0]
    for mag in range(1, 1 << 15):
        value = outputs[mag]
        if value == prev:
            continue
        runs.append((start, mag - 1, prev))
        start = mag
        prev = value
    runs.append((start, (1 << 15) - 1, prev))
    return runs


def render_log10_positive_runs(outputs, module, mode):
    runs = positive_runs(outputs)
    lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [15:0] out;",
        "  wire sign = in[15];",
        "  wire [7:0] exp = in[14:7];",
        "  wire [14:0] mag = in[14:0];",
        "  reg [15:0] out_r;",
        "  always @* begin",
        "    out_r = 16'h7fc0;",
        "    if (sign) begin",
        "      if (exp == 8'h00) out_r = 16'hff80;",
        "      else out_r = 16'h7fc0;",
        "    end else begin",
    ]
    items = 0
    if mode == "casez":
        lines.append("      casez (mag)")
        for start, end, value in runs:
            if value == 0x7FC0:
                continue
            for pattern in range_casez_patterns(15, start, end):
                lines.append("        {0}: out_r = {1};".format(pattern, const_word(16, value)))
                items += 1
        lines.extend(["        default: begin end", "      endcase"])
    elif mode == "cmp":
        first = True
        for start, end, value in runs:
            if value == 0x7FC0 and end == (1 << 15) - 1:
                continue
            prefix = "if" if first else "else if"
            lines.append("      {0} (mag <= {1}) out_r = {2};".format(prefix, const_word(15, end), const_word(16, value)))
            first = False
            items += 1
    elif mode == "tree":
        def emit_tree(local_runs, indent):
            nonlocal items
            if len(local_runs) == 1:
                lines.append("{0}out_r = {1};".format(indent, const_word(16, local_runs[0][2])))
                items += 1
                return
            mid = len(local_runs) // 2
            threshold = local_runs[mid - 1][1]
            lines.append("{0}if (mag <= {1}) begin".format(indent, const_word(15, threshold)))
            emit_tree(local_runs[:mid], indent + "  ")
            lines.append("{0}end else begin".format(indent))
            emit_tree(local_runs[mid:], indent + "  ")
            lines.append("{0}end".format(indent))
            items += 1
        emit_tree(runs, "      ")
    else:
        raise RuntimeError("unknown positive run mode: {0}".format(mode))
    lines.extend(
        [
            "    end",
            "  end",
            "  assign out = out_r;",
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines), "log10 positive-domain monotone runs mode={0} runs={1} items={2}".format(
        mode,
        len(runs),
        items,
    )


def render_log10_exp_runs_mant_sep(outputs, module, mant_hi_bits):
    lines = module_header(module)
    lines.extend(
        [
            "  wire sign = in[15];",
            "  wire [14:0] mag = in[14:0];",
            "  reg out_sign;",
            "  reg [7:0] out_exp;",
            "  reg [6:0] out_mant;",
        ]
    )
    items = 0

    bit_default = mode_value([(value >> 15) & 1 for value in outputs])
    lines.extend(
        [
            "  always @* begin",
            "    out_sign = 1'b{0};".format(bit_default),
            "    casez (sign_exp)",
        ]
    )
    bit_items, variable = emit_const_bit_ranges(lines, outputs, 15, "out_sign", bit_default, "      ")
    items += bit_items
    for sign_exp in variable:
        items += emit_bit_hi_lo(lines, outputs, sign_exp, 15, "out_sign", 1, "default_override")
    lines.extend(["      default: begin end", "    endcase", "  end"])

    positive_exps = [field_value(outputs[mag], "exp") for mag in range(1 << 15)]
    runs = []
    start = 0
    prev = positive_exps[0]
    for mag in range(1, 1 << 15):
        value = positive_exps[mag]
        if value == prev:
            continue
        runs.append((start, mag - 1, prev))
        start = mag
        prev = value
    runs.append((start, (1 << 15) - 1, prev))
    exp_default = 0xFF
    lines.extend(
        [
            "  always @* begin",
            "    out_exp = 8'hff;",
            "    if (!sign) begin",
            "      casez (mag)",
        ]
    )
    exp_items = 0
    for start, end, value in runs:
        if value == exp_default:
            continue
        for pattern in range_casez_patterns(15, start, end):
            lines.append("        {0}: out_exp = {1};".format(pattern, const_word(8, value)))
            exp_items += 1
    items += exp_items
    lines.extend(["        default: begin end", "      endcase", "    end", "  end"])

    mant_default = mode_value([field_value(value, "mant") for value in outputs])
    lines.extend(
        [
            "  always @* begin",
            "    out_mant = {0};".format(const_word(7, mant_default)),
            "    casez (sign_exp)",
        ]
    )
    const_items, variable = emit_const_scalar_ranges(lines, outputs, "mant", "out_mant", mant_default, "      ")
    items += const_items
    for sign_exp in variable:
        items += emit_scalar_hi_lo(lines, outputs, sign_exp, "mant", "out_mant", mant_hi_bits, "default_override")
    lines.extend(
        [
            "      default: begin end",
            "    endcase",
            "  end",
            "  assign out = {out_sign, out_exp, out_mant};",
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines), "log10 positive exp range runs plus mant sep mhi={0} exp_items={1} items={2}".format(
        mant_hi_bits,
        exp_items,
        items,
    )


def render_split_sign_word_mixed(outputs, module, policy):
    default = mode_value(outputs)
    lines = module_header(module)
    lines.extend(
        [
            "  wire sign = in[15];",
            "  wire [7:0] exp = in[14:7];",
            "  reg [15:0] out_r;",
            "  always @* begin",
            "    out_r = {0};".format(const_word(16, default)),
            "    if (sign) begin",
            "      casez (exp)",
        ]
    )

    def score(input_sign, exp_value, hi_bits):
        lo_bits = 7 - hi_bits
        total = 0
        for hi in range(1 << hi_bits):
            values = [
                outputs[(input_sign << 15) | (exp_value << 7) | (hi << lo_bits) | lo]
                for lo in range(1 << lo_bits)
            ]
            base = mode_value(values)
            total += 1 + sum(value != base for value in values)
        return total

    def choose_hi(input_sign, exp_value):
        if policy == "h5_h6special":
            return 6 if exp_value == 124 else 5
        if policy == "h5_h4special":
            return 4 if exp_value in (124, 125) else 5
        if policy == "minscore_tieh5":
            choices = []
            for hi_bits in (3, 4, 5, 6):
                tie_penalty = {5: 0, 6: 1, 4: 2, 3: 3}[hi_bits]
                choices.append((score(input_sign, exp_value, hi_bits), tie_penalty, hi_bits))
            choices.sort()
            return choices[0][2]
        raise RuntimeError("unknown mixed split-sign policy: {0}".format(policy))

    items = 0
    choices = {}
    for input_sign in (1, 0):
        by_value = {}
        variable = []
        base_sign = input_sign << 15
        for exp_value in range(256):
            values = [outputs[base_sign | (exp_value << 7) | mant] for mant in range(128)]
            if len(set(values)) == 1:
                value = values[0]
                if value != default:
                    by_value.setdefault(value, []).append(exp_value)
            else:
                variable.append(exp_value)
        for value in sorted(by_value):
            for start, end in grouped_runs(by_value[value]):
                for pattern in range_casez_patterns(8, start, end):
                    lines.append("        {0}: out_r = {1};".format(pattern, const_word(16, value)))
                    items += 1
        for exp_value in variable:
            hi_bits = choose_hi(input_sign, exp_value)
            choices[(input_sign, exp_value)] = hi_bits
            items += emit_exp_word_table(lines, outputs, input_sign, exp_value, "out_r", hi_bits, "mode")
        if input_sign == 1:
            lines.extend(
                [
                    "        default: begin end",
                    "      endcase",
                    "    end else begin",
                    "      casez (exp)",
                ]
            )
        else:
            lines.extend(
                [
                    "        default: begin end",
                    "      endcase",
                    "    end",
                    "  end",
                    "  assign out = out_r;",
                    "endmodule",
                    "",
                ]
            )
    histogram = {}
    for hi_bits in choices.values():
        histogram[hi_bits] = histogram.get(hi_bits, 0) + 1
    return "\n".join(lines), "split-sign word mixed policy={0} choices={1} items={2}".format(
        policy,
        histogram,
        items,
    )


def render_log10_exp_base_delta(outputs, module, delta_mode):
    """Log10-specific base by exponent plus mantissa correction."""
    bases = []
    deltas_by_exp = []
    for exp in range(256):
        values = [outputs[(exp << 7) | mant] for mant in range(128)]
        base = values[0]
        bases.append(base)
        deltas_by_exp.append([value ^ base for value in values])
    lines = module_header(module)
    lines.extend(
        [
            "  wire [7:0] exp = in[14:7];",
            "  reg [15:0] base_word;",
            "  reg [15:0] delta_word;",
            "  always @* begin",
            "    case (exp)",
        ]
    )
    items = 0
    for exp, base in enumerate(bases):
        lines.append("      {0}: base_word = {1};".format(const_word(8, exp), const_word(16, base)))
        items += 1
    lines.extend(
        [
            "      default: base_word = 16'h0000;",
            "    endcase",
            "  end",
            "  always @* begin",
            "    delta_word = 16'h0000;",
            "    case (exp)",
        ]
    )
    match = re.match(r"hilo([1-6])$", delta_mode)
    hi_bits = int(match.group(1)) if match else None
    for exp, deltas in enumerate(deltas_by_exp):
        unique = set(deltas)
        if len(unique) == 1:
            if deltas[0] != 0:
                lines.append("      {0}: delta_word = {1};".format(const_word(8, exp), const_word(16, deltas[0])))
                items += 1
            continue
        lines.append("      {0}: begin".format(const_word(8, exp)))
        if hi_bits is None:
            lines.append("        case (mant)")
            for mant, value in enumerate(deltas):
                lines.append("          {0}: delta_word = {1};".format(const_word(7, mant), const_word(16, value)))
                items += 1
            lines.append("          default: begin end")
            lines.append("        endcase")
        else:
            lo_bits = 7 - hi_bits
            hi_name = "mant_hi{0}".format(hi_bits)
            lo_name = "mant_lo{0}".format(lo_bits)
            lines.append("        case ({0})".format(hi_name))
            for hi in range(1 << hi_bits):
                values = [deltas[(hi << lo_bits) | lo] for lo in range(1 << lo_bits)]
                default = mode_value(values)
                differing = [(lo, value) for lo, value in enumerate(values) if value != default]
                lines.append("          {0}: begin".format(const_word(hi_bits, hi)))
                lines.append("            delta_word = {0};".format(const_word(16, default)))
                if differing:
                    lines.append("            case ({0})".format(lo_name))
                    for lo, value in differing:
                        lines.append(
                            "              {0}: delta_word = {1};".format(
                                const_word(lo_bits, lo),
                                const_word(16, value),
                            )
                        )
                        items += 1
                    lines.append("              default: begin end")
                    lines.append("            endcase")
                lines.append("          end")
                items += 1
            lines.append("          default: begin end")
            lines.append("        endcase")
        lines.append("      end")
    lines.extend(
        [
            "      default: begin end",
            "    endcase",
            "  end",
            "  assign out = in[15] ? ((exp == 8'h00) ? 16'hff80 : 16'h7fc0) : (base_word ^ delta_word);",
            "endmodule",
            "",
        ]
    )
    note = "log10 positive exponent base xor mantissa delta_mode={0} items={1}".format(delta_mode, items)
    return "\n".join(lines), note


def render_candidate(case, outputs, module, variant):
    match = re.match(r"legacy_(.+)$", variant)
    if match:
        text, note = render_legacy_variant(outputs, module, match.group(1))
        return text, "legacy bf16_verilog_search {0}; {1}".format(match.group(1), note)
    if variant == "sign_exp_default_expr_casez":
        return render_sign_exp_default_expr_casez(outputs, module)
    match = re.match(r"sign_exp_default_expr_casez_manual_bits_([0-9_]+)$", variant)
    if match:
        bits = [int(part) for part in match.group(1).split("_") if part != ""]
        text, note = render_sign_exp_default_expr_casez(outputs, module)
        return render_word_text_manual_bits(case, text, note, bits)
    match = re.match(r"hilo([1-6])_word_mode_bits_([0-9_]+)_bh([1-6])$", variant)
    if match:
        bits = [int(part) for part in match.group(2).split("_") if part != ""]
        return render_hilo_word_bit_overrides(outputs, module, int(match.group(1)), bits, int(match.group(3)))
    match = re.match(r"hilo([1-6])_word_mode_bits_([0-9_]+)_(runs|cmp|pla)$", variant)
    if match:
        bits = [int(part) for part in match.group(2).split("_") if part != ""]
        return render_hilo_word_bit_overrides(outputs, module, int(match.group(1)), bits, match.group(3))
    match = re.match(r"sep_fields_e([1-6])_m([1-6])_s([0-6])_manual_bits_([0-9_]+)$", variant)
    if match:
        bits = [int(part) for part in match.group(4).split("_") if part != ""]
        return render_sep_fields_manual_bits(
            case,
            outputs,
            module,
            int(match.group(1)),
            int(match.group(2)),
            int(match.group(3)),
            bits,
        )
    match = re.match(r"bdd_all_(sem|mant|exp)$", variant)
    if match:
        return render_bdd_all_bits(outputs, module, match.group(1))
    match = re.match(r"split_sign_word_h([1-6])$", variant)
    if match:
        return render_split_sign_word(outputs, module, int(match.group(1)))
    match = re.match(r"split_sign_word_h([1-6])_first$", variant)
    if match:
        return render_split_sign_word(outputs, module, int(match.group(1)), "first")
    match = re.match(r"odd_pos_word_h([1-6])$", variant)
    if match:
        return render_positive_word_with_sign(outputs, module, int(match.group(1)))
    match = re.match(r"odd_pos_fullword_h([1-6])$", variant)
    if match:
        return render_positive_fullword_flip(outputs, module, int(match.group(1)))
    match = re.match(r"odd_pos_fullword_h([1-6])_first$", variant)
    if match:
        return render_positive_fullword_flip(outputs, module, int(match.group(1)), "first")
    match = re.match(r"odd_pos_fullword_expnan_h([1-6])$", variant)
    if match:
        return render_positive_fullword_expnan(outputs, module, int(match.group(1)))
    match = re.match(r"odd_pos_fullword_expflip_h([1-6])$", variant)
    if match:
        return render_positive_fullword_expflip(outputs, module, int(match.group(1)))
    match = re.match(r"odd_pos_fullword_expflip_h([1-6])_first$", variant)
    if match:
        return render_positive_fullword_expflip(outputs, module, int(match.group(1)), "first")
    match = re.match(r"odd_pos_fields_e([1-6])_m([1-6])$", variant)
    if match:
        return render_positive_fields_with_sign(outputs, module, int(match.group(1)), int(match.group(2)))
    match = re.match(r"default_in_excepts_h([1-6])$", variant)
    if match:
        return render_default_expr_with_exceptions(outputs, module, "in", int(match.group(1)))
    match = re.match(r"default_in_const_excepts_h([1-6])$", variant)
    if match:
        return render_default_expr_with_exceptions(outputs, module, "in", int(match.group(1)))
    match = re.match(r"default_in_const_excepts_h([1-6])_manual_bits_([0-9_]+)$", variant)
    if match:
        bits = [int(part) for part in match.group(2).split("_") if part != ""]
        text, note = render_default_expr_with_exceptions(outputs, module, "in", int(match.group(1)))
        return render_word_text_manual_bits(case, text, note, bits)
    match = re.match(r"default_signed_one_excepts_h([1-6])$", variant)
    if match:
        return render_default_expr_with_exceptions(outputs, module, "{sign, 15'h3f80}", int(match.group(1)))
    match = re.match(r"default_signed_one_const_excepts_h([1-6])$", variant)
    if match:
        return render_default_expr_with_exceptions(outputs, module, "{sign, 15'h3f80}", int(match.group(1)))
    match = re.match(r"default_signed_inf_const_excepts_h([1-6])$", variant)
    if match:
        return render_default_expr_with_exceptions(outputs, module, "{sign, 15'h7f80}", int(match.group(1)))
    match = re.match(r"default_nan_excepts_h([1-6])$", variant)
    if match:
        return render_default_expr_with_exceptions(outputs, module, "16'h7fc0", int(match.group(1)))
    match = re.match(r"log10_exp_base_delta_(full|hilo[1-6])$", variant)
    if match:
        return render_log10_exp_base_delta(outputs, module, match.group(1))
    match = re.match(r"log10_pos_runs_(casez|cmp|tree)$", variant)
    if match:
        return render_log10_positive_runs(outputs, module, match.group(1))
    match = re.match(r"log10_exp_runs_mant_sep_m([1-6])$", variant)
    if match:
        return render_log10_exp_runs_mant_sep(outputs, module, int(match.group(1)))
    match = re.match(r"split_sign_word_mixed_(h5_h6special|h5_h4special|minscore_tieh5)$", variant)
    if match:
        return render_split_sign_word_mixed(outputs, module, match.group(1))
    return render_structural_candidate(case, outputs, module, variant)


def run_candidate(case, outputs, variant, args):
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
            notes=note,
            timeout=args.abc_timeout,
        )
        row["equivalent"] = "1" if cand.equivalent else "0"
        if cand.equivalent:
            row["area"] = str(cand.area)
            row["delay"] = str(cand.delay)
            row["adp"] = str(cand.adp)
        row["notes"] = cand.notes
    except (SynthError, RuntimeError, subprocess.TimeoutExpired) as error:
        row["notes"] = "failed: {0}".format(error)
    row["runtime_sec"] = "{0:.3f}".format(time.time() - start)
    return row


def best_rows(rows):
    valid = [row for row in rows if row["equivalent"] == "1" and row["adp"]]
    valid.sort(key=lambda row: (int(row["adp"]), int(row["delay"]), int(row["area"]), row["candidate_id"]))
    seen = set()
    best = []
    for row in valid:
        if row["case"] in seen:
            continue
        best.append(row)
        seen.add(row["case"])
    return best


def write_manifests(args, cases, rows):
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
        "Purpose: frontend-only BF16 semantic/structural reverse engineering for ex205-ex209.",
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
        "Methods:",
        "- Semantic hypotheses were checked against BF16 DAZ/FTZ/RNE/canonical-NaN models.",
        "- Mantissa hi/lo LUTs, separated output fields, delta/base structures, selected-bit overrides.",
        "- Odd-symmetry positive-domain tables for sin/tan/sinh/tanh.",
        "- Passthrough or saturation default expressions with local exception LUTs.",
        "",
        "Best result:",
        "- See `results/best.csv`.",
        "",
    ]
    write_text(ROOT / "student" / "runs" / "bf16" / args.run_id / "MANIFEST.md", "\n".join(lines))


def write_outputs(args, cases, rows):
    refs = read_reference_adp(args.reference)
    best = []
    for row in best_rows(rows):
        ref = refs.get(row["case"])
        adp = int(row["adp"])
        out = {field: row.get(field, "") for field in BEST_FIELDS}
        out["reference_adp"] = str(ref) if ref else ""
        out["ratio_to_reference"] = "{0:.6f}".format(adp / ref) if ref else ""
        out["within_1p5_reference"] = "1" if ref and adp <= int(ref * 1.5) else "0"
        out["beats_reference"] = "1" if ref and adp < ref else "0"
        best.append(out)
    best.sort(key=lambda row: row["case"])
    summaries = []
    best_by_case = {row["case"]: row for row in best}
    summary_cases = sorted(set(cases) | {row["case"] for row in rows if row.get("case")})
    for case in summary_cases:
        row = best_by_case.get(case, {})
        ref = refs.get(case)
        adp = int(row["adp"]) if row.get("adp") else None
        summaries.append(
            {
                "case": case,
                "best_candidate_id": row.get("candidate_id", ""),
                "best_area": row.get("area", ""),
                "best_delay": row.get("delay", ""),
                "best_adp": row.get("adp", ""),
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
    write_csv(
        result_dir / "evaluate_check.csv",
        RESULT_FIELDS,
        [row for row in rows if row["equivalent"] == "1"],
    )
    write_manifests(args, cases, rows)


def merge_existing_rows(args, rows):
    if not args.append:
        return rows
    path = ROOT / "student" / "runs" / "bf16" / args.run_id / "results" / "candidates.csv"
    if not path.is_file():
        return rows
    merged = []
    seen = set()
    with path.open() as handle:
        reader = csv.DictReader(handle)
        for row in reader:
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
    "ex205": [
        "hilo3_word_mode",
        "hilo3_field_mode",
        "hilo4_word_mode",
        "hilo4_field_mode",
        "sep_fields_e3_m3_s0",
        "sep_fields_e4_m3_s0",
        "sep_fields_e3_m4_s0",
        "legacy_sign_exp_mant_case",
        "split_sign_word_h3",
        "split_sign_word_h4",
        "log10_exp_base_delta_hilo3",
        "log10_exp_base_delta_hilo4",
        "default_nan_excepts_h3",
    ],
    "ex206": [
        "hilo3_word_mode",
        "hilo3_field_mode",
        "hilo4_word_mode",
        "sep_fields_e3_m3_s3",
        "legacy_split_sign_exp_mant_case",
        "split_sign_sep_fields_e3_m3_s3",
        "split_sign_word_h3",
        "odd_pos_word_h3",
        "odd_pos_word_h4",
        "odd_pos_fullword_h3",
        "odd_pos_fullword_h4",
        "odd_pos_fields_e3_m3",
        "default_in_excepts_h3",
        "delta_pair_first_hilo3",
    ],
    "ex207": [
        "hilo3_word_mode",
        "hilo3_field_mode",
        "hilo4_word_mode",
        "sep_fields_e3_m3_s3",
        "legacy_exp_mant_pair_case",
        "split_sign_sep_fields_e3_m3_s3",
        "split_sign_word_h3",
        "odd_pos_word_h3",
        "odd_pos_word_h4",
        "odd_pos_fullword_h3",
        "odd_pos_fullword_h4",
        "odd_pos_fields_e3_m3",
        "default_in_excepts_h3",
        "delta_pair_first_hilo3",
    ],
    "ex208": [
        "hilo3_word_mode",
        "hilo3_field_mode",
        "hilo4_word_mode",
        "sep_fields_e3_m3_s3",
        "legacy_split_sign_exp_mant_case",
        "split_sign_sep_fields_e3_m3_s3",
        "split_sign_word_h3",
        "odd_pos_word_h3",
        "odd_pos_word_h4",
        "odd_pos_fullword_h3",
        "odd_pos_fullword_h4",
        "odd_pos_fields_e3_m3",
        "default_in_excepts_h3",
        "delta_pair_first_hilo3",
    ],
    "ex209": [
        "hilo3_word_mode",
        "hilo3_field_mode",
        "hilo4_word_mode",
        "sep_fields_e3_m3_s3",
        "legacy_sign_exp_default_expr_case",
        "split_sign_sep_fields_e3_m3_s3",
        "split_sign_word_h3",
        "odd_pos_word_h3",
        "odd_pos_word_h4",
        "odd_pos_fullword_h3",
        "odd_pos_fullword_h4",
        "odd_pos_fields_e3_m3",
        "default_in_excepts_h3",
        "default_signed_one_excepts_h3",
        "delta_pair_first_hilo3",
    ],
}


def parse_args(argv=None):
    parser = argparse.ArgumentParser(description="BF16 ex205-ex209 frontend-only semantic search.")
    parser.add_argument("--run-id", default=DEFAULT_RUN_ID)
    parser.add_argument("--cases", nargs="+", default=["ex205", "ex206", "ex207", "ex208", "ex209"])
    parser.add_argument("--variants", nargs="+", default=None)
    parser.add_argument("--reference", type=Path, default=ROOT / "reference_result.csv")
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
        write_outputs(args, args.cases, rows)
        print("Rewrote summaries from {0}".format(path))
        return 0
    rows = []
    for case in args.cases:
        outputs = list(TruthTable(ROOT / "benchmarks" / "{0}.truth".format(case)).iter_outputs())
        variants = args.variants if args.variants is not None else DEFAULT_VARIANTS[case]
        for variant in variants:
            row = run_candidate(case, outputs, variant, args)
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
    write_outputs(args, args.cases, rows)
    print("Results: student/runs/bf16/{0}/results/candidates.csv".format(args.run_id))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
