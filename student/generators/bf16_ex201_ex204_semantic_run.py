#!/usr/bin/env python3
"""Case-by-case semantic BF16 reconstruction run for ex201-ex204.

The run first verifies the floating-point meaning of each truth table, then
emits a small set of targeted RTL shapes for that case.  These are frontend
seeds only: no ABC portfolio or backend optimization is applied.
"""

import argparse
import csv
import json
import math
import struct
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
from student.generators.bf16_aggressive_semantic_search import render_variant as render_aggressive_variant
from student.generators.bf16_verilog_search import render_variant as render_structural_variant
from student.generators.bf16_verilog_search import verify_variant as verify_structural_variant


WIDTH = 16
MANT_BITS = 7
MANT_SIZE = 1 << MANT_BITS
EXP_MAX = 255
CANONICAL_NAN = 0x7FC0

DEFAULT_RUN_ID = "ex201_ex204_frontend_bf16_semantic_20260605_0924"
DEFAULT_ABC = ROOT / "student" / "tools" / "abc" / "src" / "abc"

CASE_INFO = {
    "ex201": {
        "hypothesis": "bf16_exp2",
        "function_guess": "DAZ + 2^x + BF16 RNE + FTZ + canonical NaN",
        "kind": "exp2",
    },
    "ex202": {
        "hypothesis": "bf16_exp10",
        "function_guess": "DAZ + 10^x + BF16 RNE + FTZ + canonical NaN",
        "kind": "exp10",
    },
    "ex203": {
        "hypothesis": "bf16_log",
        "function_guess": "DAZ + ln(x) + BF16 RNE + FTZ + canonical NaN",
        "kind": "log",
    },
    "ex204": {
        "hypothesis": "bf16_log2",
        "function_guess": "DAZ + log2(x) + BF16 RNE + FTZ + canonical NaN",
        "kind": "log2",
    },
}

CASE_VARIANTS = {
    "ex201": [
        "semantic_exp_pair_casez_full",
        "semantic_exp_pair_casez_runs",
        "semantic_exp_sign_exp_casez_full",
        "structural_exp_mant_pair_case",
    ],
    "ex202": [
        "semantic_exp_pair_casez_full",
        "semantic_exp_pair_casez_runs",
        "semantic_exp_sign_exp_casez_full",
        "semantic_sign_exp_field_defaults",
        "semantic_sign_exp_word_mode_defaults",
        "structural_exp_mant_pair_case",
        "structural_sign_exp_default_expr_case",
    ],
    "ex203": [
        "semantic_log_positive_full",
        "semantic_log_positive_runs",
        "semantic_log_pair_runs",
        "semantic_sign_exp_word_mode_defaults",
        "structural_sign_exp_mant_case",
        "structural_split_sign_exp_mant_case",
    ],
    "ex204": [
        "semantic_log2_grouped_subdelta_base_case_full",
        "semantic_log2_grouped_subdelta_base_case_runs",
        "semantic_log2_grouped_subdelta_base_arith_full",
        "semantic_log2_grouped_xordelta_pair_full",
        "semantic_log2_grouped_xordelta_pair_runs",
        "semantic_log2_positive_runs",
        "structural_exp_mant_delta_pair",
    ],
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
    "previous_best_adp",
    "ratio_to_previous_best",
    "notes",
]

SUMMARY_FIELDS = [
    "case",
    "function_guess",
    "best_candidate_id",
    "best_variant",
    "best_area",
    "best_delay",
    "best_adp",
    "reference_adp",
    "ratio_to_reference",
    "within_1p5_reference",
    "beats_reference",
    "previous_best_adp",
    "ratio_to_previous_best",
    "semantic_status",
    "notes",
]


def rel_path(path):
    return str(Path(path).resolve().relative_to(ROOT))


def const_word(width, value):
    digits = max(1, (width + 3) // 4)
    return "{0}'h{1:0{2}x}".format(width, value & ((1 << width) - 1), digits)


def write_text(path, text):
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(text)


def write_csv(path, fieldnames, rows):
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(rows)


def read_reference_adp(path):
    refs = {}
    with Path(path).open() as handle:
        reader = csv.DictReader(handle)
        for row in reader:
            adp_value = row.get("ADP", row.get("adp"))
            refs[row["case"]] = int(adp_value)
    return refs


def read_previous_best(path):
    best = {}
    path = Path(path)
    if not path.is_file():
        return best
    with path.open() as handle:
        reader = csv.DictReader(handle)
        for row in reader:
            if row.get("adp"):
                best[row["case"]] = int(row["adp"])
    return best


def bf16_to_float(bits):
    sign = (bits >> 15) & 1
    exp = (bits >> MANT_BITS) & 0xFF
    mant = bits & 0x7F
    if exp == 0:
        return -0.0 if sign else 0.0
    if exp == 0xFF:
        if mant:
            return float("nan")
        return float("-inf") if sign else float("inf")
    scale = 2.0 ** (exp - 127)
    return (-1.0 if sign else 1.0) * (1.0 + mant / 128.0) * scale


def float32_bits(value):
    return struct.unpack(">I", struct.pack(">f", value))[0]


def float_to_bf16_rne(value):
    if math.isnan(value):
        return CANONICAL_NAN
    if math.isinf(value):
        return 0x7F80 if value > 0 else 0xFF80
    if value == 0.0:
        return 0x8000 if math.copysign(1.0, value) < 0 else 0x0000
    try:
        bits = float32_bits(value)
    except OverflowError:
        return 0x7F80 if value > 0 else 0xFF80
    lsb = (bits >> 16) & 1
    rounded = bits + 0x7FFF + lsb
    bf16 = (rounded >> 16) & 0xFFFF
    exp = (bf16 >> MANT_BITS) & 0xFF
    mant = bf16 & 0x7F
    if exp == 0:
        return bf16 & 0x8000
    if exp == 0xFF and mant != 0:
        return CANONICAL_NAN
    return bf16


def semantic_model(kind, bits):
    value = bf16_to_float(bits)
    if math.isnan(value):
        return CANONICAL_NAN
    if kind == "exp2":
        if value == float("inf"):
            return 0x7F80
        if value == float("-inf"):
            return 0x0000
        try:
            result = 2.0 ** value
        except OverflowError:
            return 0x7F80
    elif kind == "exp10":
        if value == float("inf"):
            return 0x7F80
        if value == float("-inf"):
            return 0x0000
        try:
            result = 10.0 ** value
        except OverflowError:
            return 0x7F80
    elif kind == "log":
        if value == float("inf"):
            return 0x7F80
        if value <= 0.0:
            if value == 0.0:
                return 0xFF80
            return CANONICAL_NAN
        result = math.log(value)
    elif kind == "log2":
        if value == float("inf"):
            return 0x7F80
        if value <= 0.0:
            if value == 0.0:
                return 0xFF80
            return CANONICAL_NAN
        result = math.log2(value)
    else:
        raise RuntimeError("unknown semantic kind: {0}".format(kind))
    bf16 = float_to_bf16_rne(result)
    if ((bf16 >> MANT_BITS) & 0xFF) == 0:
        return bf16 & 0x8000
    return bf16


def verify_semantic(case, outputs):
    kind = CASE_INFO[case]["kind"]
    mismatches = []
    for index, expected in enumerate(outputs):
        actual = semantic_model(kind, index)
        if actual != expected:
            mismatches.append((index, expected, actual))
            if len(mismatches) == 5:
                break
    if mismatches:
        return False, "semantic mismatches: {0}".format(mismatches)
    return True, "exact over 65536 inputs"


def runs_for_values(values):
    runs = []
    start = 0
    prev = values[0]
    for index, value in enumerate(values[1:], 1):
        if value == prev:
            continue
        runs.append((start, index - 1, prev))
        start = index
        prev = value
    runs.append((start, len(values) - 1, prev))
    return runs


def mode_value(values):
    counts = {}
    first = {}
    for index, value in enumerate(values):
        counts[value] = counts.get(value, 0) + 1
        first.setdefault(value, index)
    return min(counts, key=lambda value: (-counts[value], first[value], value))


def casez_pattern(width, start, size):
    floating = size.bit_length() - 1
    bits = []
    for bit in range(width - 1, -1, -1):
        if bit < floating:
            bits.append("?")
        else:
            bits.append("1" if (start >> bit) & 1 else "0")
    return "{0}'b{1}".format(width, "".join(bits))


def range_casez_patterns(width, start, end):
    patterns = []
    value = start
    while value <= end:
        lowbit = value & -value
        size = lowbit if lowbit else 1 << width
        while value + size - 1 > end:
            size >>= 1
        patterns.append(casez_pattern(width, value, size))
        value += size
    return patterns


def grouped_runs(items):
    if not items:
        return []
    items = sorted(items)
    grouped = []
    start = prev = items[0]
    for item in items[1:]:
        if item == prev + 1:
            prev = item
            continue
        grouped.append((start, prev))
        start = prev = item
    grouped.append((start, prev))
    return grouped


def module_header(module):
    return [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [15:0] out;",
        "  wire sign = in[15];",
        "  wire [7:0] exp = in[14:7];",
        "  wire [6:0] mant = in[6:0];",
    ]


def emit_full_mant_case(lines, indent, values, target, value_width, parallel=False):
    prefix = "(* parallel_case, full_case *) " if parallel else ""
    lines.append("{0}{1}case (mant)".format(indent, prefix))
    for mant, value in enumerate(values):
        lines.append(
            "{0}  {1}: {2} = {3};".format(
                indent,
                const_word(7, mant),
                target,
                const_word(value_width, value),
            )
        )
    lines.append("{0}  default: {1} = {2};".format(indent, target, const_word(value_width, values[0])))
    lines.append("{0}endcase".format(indent))
    return len(values)


def emit_mant_casez_runs(lines, indent, values, target, value_width):
    default = mode_value(values)
    lines.append("{0}{1} = {2};".format(indent, target, const_word(value_width, default)))
    lines.append("{0}casez (mant)".format(indent))
    items = 1
    for start, end, value in runs_for_values(values):
        if value == default:
            continue
        for pattern in range_casez_patterns(7, start, end):
            lines.append(
                "{0}  {1}: {2} = {3};".format(
                    indent,
                    pattern,
                    target,
                    const_word(value_width, value),
                )
            )
            items += 1
    lines.append("{0}  default: begin end".format(indent))
    lines.append("{0}endcase".format(indent))
    return items


def pair_word(outputs, exp, mant):
    positive = outputs[(exp << MANT_BITS) | mant]
    negative = outputs[0x8000 | (exp << MANT_BITS) | mant]
    return (negative << 16) | positive


def const_exp_groups_by_pair(outputs):
    active = []
    const = {}
    for exp in range(256):
        if exp == 255:
            const[exp] = pair_word(outputs, exp, 0)
            continue
        values = [pair_word(outputs, exp, mant) for mant in range(MANT_SIZE)]
        unique = set(values)
        if len(unique) == 1:
            const[exp] = values[0]
        else:
            active.append(exp)
    return const, active


def emit_const_casez_by_value(lines, width, value_to_ranges, target, value_width, skip_value=None, indent="      "):
    items = 0
    for value in sorted(value_to_ranges):
        if skip_value is not None and value == skip_value:
            continue
        for start, end in value_to_ranges[value]:
            for pattern in range_casez_patterns(width, start, end):
                lines.append(
                    "{0}{1}: {2} = {3};".format(
                        indent,
                        pattern,
                        target,
                        const_word(value_width, value),
                    )
                )
                items += 1
    return items


def render_exp_pair_semantic(outputs, module, use_runs=False, parallel=False):
    default_pair = pair_word(outputs, 0, 0)
    const_by_exp, active_exps = const_exp_groups_by_pair(outputs)
    by_value = {}
    for exp, value in const_by_exp.items():
        if value == default_pair:
            continue
        by_value.setdefault(value, []).append(exp)
    by_value = {value: grouped_runs(exps) for value, exps in by_value.items()}

    lines = module_header(module)
    lines.extend(
        [
            "  reg [31:0] pair;",
            "  reg [15:0] out_r;",
            "  always @* begin",
            "    pair = {0};".format(const_word(32, default_pair)),
            "    if (exp == 8'hff && mant != 7'h00) begin",
            "      out_r = 16'h7fc0;",
            "    end else begin",
            "      casez (exp)",
        ]
    )
    items = emit_const_casez_by_value(lines, 8, by_value, "pair", 32)
    for exp in active_exps:
        values = [pair_word(outputs, exp, mant) for mant in range(MANT_SIZE)]
        lines.append("        {0}: begin".format(const_word(8, exp)))
        if use_runs:
            items += emit_mant_casez_runs(lines, "          ", values, "pair", 32)
        else:
            items += emit_full_mant_case(lines, "          ", values, "pair", 32, parallel=parallel)
        lines.append("        end")
    lines.extend(
        [
            "        default: begin end",
            "      endcase",
            "      out_r = sign ? pair[31:16] : pair[15:0];",
            "    end",
            "  end",
            "  assign out = out_r;",
            "endmodule",
            "",
        ]
    )
    note = "semantic exp pair; active_exps={0}; const_patterns={1}; mant_style={2}".format(
        len(active_exps),
        items,
        "casez_runs" if use_runs else "full_case",
    )
    return "\n".join(lines), note


def const_sign_exp_groups(outputs):
    active = []
    const = {}
    for sign_exp in range(512):
        exp = sign_exp & 0xFF
        if exp == 255:
            const[sign_exp] = outputs[sign_exp << MANT_BITS]
            continue
        values = [outputs[(sign_exp << MANT_BITS) | mant] for mant in range(MANT_SIZE)]
        unique = set(values)
        if len(unique) == 1:
            const[sign_exp] = values[0]
        else:
            active.append(sign_exp)
    return const, active


def render_exp_sign_exp_semantic(outputs, module):
    default_out = outputs[0]
    const_by_sign_exp, active = const_sign_exp_groups(outputs)
    by_value = {}
    for sign_exp, value in const_by_sign_exp.items():
        if value == default_out:
            continue
        by_value.setdefault(value, []).append(sign_exp)
    by_value = {value: grouped_runs(sign_exps) for value, sign_exps in by_value.items()}

    lines = module_header(module)
    lines.extend(
        [
            "  wire [8:0] sign_exp = in[15:7];",
            "  reg [15:0] out_r;",
            "  always @* begin",
            "    out_r = {0};".format(const_word(16, default_out)),
            "    if (exp == 8'hff && mant != 7'h00) begin",
            "      out_r = 16'h7fc0;",
            "    end else begin",
            "      casez (sign_exp)",
        ]
    )
    items = emit_const_casez_by_value(lines, 9, by_value, "out_r", 16)
    for sign_exp in active:
        values = [outputs[(sign_exp << MANT_BITS) | mant] for mant in range(MANT_SIZE)]
        lines.append("        {0}: begin".format(const_word(9, sign_exp)))
        items += emit_full_mant_case(lines, "          ", values, "out_r", 16, parallel=True)
        lines.append("        end")
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
    note = "semantic exp sign_exp defaults; active_sign_exp={0}; items={1}".format(len(active), items)
    return "\n".join(lines), note


def render_log_positive_semantic(outputs, module, use_runs=False, parallel=False):
    lines = module_header(module)
    lines.extend(
        [
            "  reg [15:0] out_r;",
            "  always @* begin",
            "    out_r = 16'h7fc0;",
            "    if (exp == 8'h00) begin",
            "      out_r = 16'hff80;",
            "    end else if (sign) begin",
            "      out_r = 16'h7fc0;",
            "    end else if (exp == 8'hff) begin",
            "      out_r = (mant == 7'h00) ? 16'h7f80 : 16'h7fc0;",
            "    end else begin",
            "      case (exp)",
        ]
    )
    items = 0
    for exp in range(1, 255):
        values = [outputs[(exp << MANT_BITS) | mant] for mant in range(MANT_SIZE)]
        lines.append("        {0}: begin".format(const_word(8, exp)))
        if use_runs:
            items += emit_mant_casez_runs(lines, "          ", values, "out_r", 16)
        else:
            items += emit_full_mant_case(lines, "          ", values, "out_r", 16, parallel=parallel)
        lines.append("        end")
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
    note = "semantic positive-domain log table; mant_style={0}; items={1}".format(
        "casez_runs" if use_runs else "full_case",
        items,
    )
    return "\n".join(lines), note


def render_log_pair_semantic(outputs, module, use_runs=True):
    lines = module_header(module)
    lines.extend(
        [
            "  reg [31:0] pair;",
            "  reg [15:0] out_r;",
            "  always @* begin",
            "    pair = 32'h7fc07fc0;",
            "    if (exp == 8'h00) begin",
            "      out_r = 16'hff80;",
            "    end else if (exp == 8'hff && mant != 7'h00) begin",
            "      out_r = 16'h7fc0;",
            "    end else begin",
            "      case (exp)",
            "        8'hff: pair = 32'h7fc07f80;",
        ]
    )
    items = 1
    for exp in range(1, 255):
        values = [pair_word(outputs, exp, mant) for mant in range(MANT_SIZE)]
        lines.append("        {0}: begin".format(const_word(8, exp)))
        if use_runs:
            items += emit_mant_casez_runs(lines, "          ", values, "pair", 32)
        else:
            items += emit_full_mant_case(lines, "          ", values, "pair", 32)
        lines.append("        end")
    lines.extend(
        [
            "        default: begin end",
            "      endcase",
            "      out_r = sign ? pair[31:16] : pair[15:0];",
            "    end",
            "  end",
            "  assign out = out_r;",
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines), "semantic log pair table; mant_style=casez_runs; items={0}".format(items)


def render_sign_exp_word_mode_defaults(outputs, module):
    lines = module_header(module)
    lines.extend(
        [
            "  wire [8:0] sign_exp = in[15:7];",
            "  reg [15:0] out_r;",
            "  always @* begin",
            "    out_r = 16'h0000;",
            "    case (sign_exp)",
        ]
    )
    exceptions = 0
    full_default_groups = 0
    for sign_exp in range(512):
        base = sign_exp << MANT_BITS
        values = [outputs[base | mant] for mant in range(MANT_SIZE)]
        default = mode_value(values)
        differing = [(mant, value) for mant, value in enumerate(values) if value != default]
        lines.append("      {0}: begin".format(const_word(9, sign_exp)))
        lines.append("        out_r = {0};".format(const_word(16, default)))
        if not differing:
            full_default_groups += 1
        else:
            lines.append("        case (mant)")
            for mant, value in differing:
                lines.append("          {0}: out_r = {1};".format(const_word(7, mant), const_word(16, value)))
                exceptions += 1
            lines.extend(["          default: begin end", "        endcase"])
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
    note = "semantic sign_exp word mode defaults; full_default_groups={0}; exceptions={1}".format(
        full_default_groups,
        exceptions,
    )
    return "\n".join(lines), note


def bf16_integer_word(value):
    if value == 0:
        return 0
    sign = 1 if value < 0 else 0
    mag = abs(value)
    shift = mag.bit_length() - 1
    exp = 127 + shift
    mant = (mag << (7 - shift)) - 128
    return (sign << 15) | (exp << 7) | mant


def log2_subdelta_patterns(outputs):
    patterns = []
    pattern_to_index = {}
    exp_to_class = {}
    for exp in range(1, 255):
        base = outputs[exp << MANT_BITS]
        deltas = tuple(((outputs[(exp << MANT_BITS) | mant] - base) & 0xFFFF) for mant in range(MANT_SIZE))
        if deltas not in pattern_to_index:
            pattern_to_index[deltas] = len(patterns)
            patterns.append(deltas)
        exp_to_class[exp] = pattern_to_index[deltas]
    return patterns, exp_to_class


def render_log2_grouped_subdelta(outputs, module, base_mode, use_runs=False):
    for exp in range(1, 255):
        expected = outputs[exp << MANT_BITS]
        actual = bf16_integer_word(exp - 127)
        if actual != expected:
            raise RuntimeError("log2 base mismatch exp={0} expected={1:04x} actual={2:04x}".format(exp, expected, actual))

    patterns, exp_to_class = log2_subdelta_patterns(outputs)
    class_to_exps = {}
    for exp, cls in exp_to_class.items():
        class_to_exps.setdefault(cls, []).append(exp)

    lines = module_header(module)
    if base_mode == "case":
        lines.extend(
            [
                "  reg [15:0] base_word;",
                "  always @* begin",
                "    case (exp)",
            ]
        )
        for exp in range(1, 255):
            lines.append("      {0}: base_word = {1};".format(const_word(8, exp), const_word(16, outputs[exp << MANT_BITS])))
        lines.extend(
            [
                "      default: base_word = 16'h0000;",
                "    endcase",
                "  end",
            ]
        )
        base_note = "base_case"
    elif base_mode == "arith":
        lines.extend(
            [
                "  wire neg_k = exp < 8'd127;",
                "  wire [7:0] abs_k = neg_k ? (8'd127 - exp) : (exp - 8'd127);",
                "  reg [15:0] base_word;",
                "  always @* begin",
                "    base_word = 16'h0000;",
                "    if (abs_k[6])",
                "      base_word = {neg_k, 8'd133, abs_k[5:0], 1'b0};",
                "    else if (abs_k[5])",
                "      base_word = {neg_k, 8'd132, abs_k[4:0], 2'b00};",
                "    else if (abs_k[4])",
                "      base_word = {neg_k, 8'd131, abs_k[3:0], 3'b000};",
                "    else if (abs_k[3])",
                "      base_word = {neg_k, 8'd130, abs_k[2:0], 4'b0000};",
                "    else if (abs_k[2])",
                "      base_word = {neg_k, 8'd129, abs_k[1:0], 5'b00000};",
                "    else if (abs_k[1])",
                "      base_word = {neg_k, 8'd128, abs_k[0], 6'b000000};",
                "    else if (abs_k[0])",
                "      base_word = {neg_k, 8'd127, 7'b0000000};",
                "  end",
            ]
        )
        base_note = "base_arith_integer_bf16"
    else:
        raise RuntimeError("unknown base mode: {0}".format(base_mode))

    lines.extend(
        [
            "  reg [3:0] delta_class;",
            "  always @* begin",
            "    delta_class = 4'd0;",
            "    casez (exp)",
        ]
    )
    for cls in range(len(patterns)):
        for start, end in grouped_runs(class_to_exps[cls]):
            for pattern in range_casez_patterns(8, start, end):
                lines.append("      {0}: delta_class = 4'd{1};".format(pattern, cls))
    lines.extend(
        [
            "      default: begin end",
            "    endcase",
            "  end",
            "  reg [15:0] delta_word;",
            "  always @* begin",
            "    delta_word = 16'h0000;",
            "    case (delta_class)",
        ]
    )
    items = 0
    for cls, deltas in enumerate(patterns):
        lines.append("      4'd{0}: begin".format(cls))
        if use_runs:
            items += emit_mant_casez_runs(lines, "        ", list(deltas), "delta_word", 16)
        else:
            items += emit_full_mant_case(lines, "        ", list(deltas), "delta_word", 16, parallel=True)
        lines.append("      end")
    lines.extend(
        [
            "      default: begin end",
            "    endcase",
            "  end",
            "  wire [15:0] positive_word = base_word + delta_word;",
            "  reg [15:0] out_r;",
            "  always @* begin",
            "    if (exp == 8'h00)",
            "      out_r = 16'hff80;",
            "    else if (sign)",
            "      out_r = 16'h7fc0;",
            "    else if (exp == 8'hff)",
            "      out_r = (mant == 7'h00) ? 16'h7f80 : 16'h7fc0;",
            "    else",
            "      out_r = positive_word;",
            "  end",
            "  assign out = out_r;",
            "endmodule",
            "",
        ]
    )
    note = "semantic log2 integer-base plus grouped subdelta; {0}; delta_patterns={1}; mant_style={2}; items={3}".format(
        base_note,
        len(patterns),
        "casez_runs" if use_runs else "full_case",
        items,
    )
    return "\n".join(lines), note


def log2_xordelta_patterns(outputs):
    patterns = []
    pattern_to_index = {}
    exp_to_class = {}
    for exp in range(1, 255):
        base = (CANONICAL_NAN << 16) | outputs[exp << MANT_BITS]
        deltas = tuple((pair_word(outputs, exp, mant) ^ base) for mant in range(MANT_SIZE))
        if deltas not in pattern_to_index:
            pattern_to_index[deltas] = len(patterns)
            patterns.append(deltas)
        exp_to_class[exp] = pattern_to_index[deltas]
    return patterns, exp_to_class


def render_log2_grouped_xordelta_pair(outputs, module, use_runs=False):
    patterns, exp_to_class = log2_xordelta_patterns(outputs)
    class_to_exps = {}
    for exp, cls in exp_to_class.items():
        class_to_exps.setdefault(cls, []).append(exp)

    lines = module_header(module)
    lines.extend(
        [
            "  reg [31:0] base_pair;",
            "  always @* begin",
            "    case (exp)",
        ]
    )
    for exp in range(1, 255):
        base = (CANONICAL_NAN << 16) | outputs[exp << MANT_BITS]
        lines.append("      {0}: base_pair = {1};".format(const_word(8, exp), const_word(32, base)))
    lines.extend(
        [
            "      8'hff: base_pair = 32'h7fc07f80;",
            "      default: base_pair = 32'hff80ff80;",
            "    endcase",
            "  end",
            "  reg [5:0] delta_class;",
            "  always @* begin",
            "    delta_class = 6'd0;",
            "    casez (exp)",
        ]
    )
    for cls in range(len(patterns)):
        for start, end in grouped_runs(class_to_exps[cls]):
            for pattern in range_casez_patterns(8, start, end):
                lines.append("      {0}: delta_class = 6'd{1};".format(pattern, cls))
    lines.extend(
        [
            "      default: begin end",
            "    endcase",
            "  end",
            "  reg [31:0] delta_pair;",
            "  always @* begin",
            "    delta_pair = 32'h00000000;",
            "    case (delta_class)",
        ]
    )
    items = 0
    for cls, deltas in enumerate(patterns):
        lines.append("      6'd{0}: begin".format(cls))
        if use_runs:
            items += emit_mant_casez_runs(lines, "        ", list(deltas), "delta_pair", 32)
        else:
            items += emit_full_mant_case(lines, "        ", list(deltas), "delta_pair", 32, parallel=True)
        lines.append("      end")
    lines.extend(
        [
            "      default: begin end",
            "    endcase",
            "  end",
            "  wire [31:0] pair = base_pair ^ delta_pair;",
            "  reg [15:0] out_r;",
            "  always @* begin",
            "    if (exp == 8'h00)",
            "      out_r = 16'hff80;",
            "    else if (exp == 8'hff && mant != 7'h00)",
            "      out_r = 16'h7fc0;",
            "    else",
            "      out_r = sign ? pair[31:16] : pair[15:0];",
            "  end",
            "  assign out = out_r;",
            "endmodule",
            "",
        ]
    )
    note = "semantic log2 base pair plus grouped xor-delta; delta_patterns={0}; mant_style={1}; items={2}".format(
        len(patterns),
        "casez_runs" if use_runs else "full_case",
        items,
    )
    return "\n".join(lines), note


def render_custom(case, outputs, module, variant):
    if variant == "semantic_exp_pair_casez_full":
        return render_exp_pair_semantic(outputs, module, use_runs=False, parallel=True)
    if variant == "semantic_exp_pair_casez_runs":
        return render_exp_pair_semantic(outputs, module, use_runs=True)
    if variant == "semantic_exp_sign_exp_casez_full":
        return render_exp_sign_exp_semantic(outputs, module)
    if variant == "semantic_log_positive_full":
        return render_log_positive_semantic(outputs, module, use_runs=False, parallel=True)
    if variant == "semantic_log_positive_runs":
        return render_log_positive_semantic(outputs, module, use_runs=True)
    if variant == "semantic_log2_positive_runs":
        return render_log_positive_semantic(outputs, module, use_runs=True)
    if variant == "semantic_log_pair_runs":
        return render_log_pair_semantic(outputs, module, use_runs=True)
    if variant == "semantic_sign_exp_word_mode_defaults":
        return render_sign_exp_word_mode_defaults(outputs, module)
    if variant == "semantic_log2_grouped_subdelta_base_case_full":
        return render_log2_grouped_subdelta(outputs, module, base_mode="case", use_runs=False)
    if variant == "semantic_log2_grouped_subdelta_base_case_runs":
        return render_log2_grouped_subdelta(outputs, module, base_mode="case", use_runs=True)
    if variant == "semantic_log2_grouped_subdelta_base_arith_full":
        return render_log2_grouped_subdelta(outputs, module, base_mode="arith", use_runs=False)
    if variant == "semantic_log2_grouped_xordelta_pair_full":
        return render_log2_grouped_xordelta_pair(outputs, module, use_runs=False)
    if variant == "semantic_log2_grouped_xordelta_pair_runs":
        return render_log2_grouped_xordelta_pair(outputs, module, use_runs=True)
    raise RuntimeError("unknown custom variant for {0}: {1}".format(case, variant))


def render_candidate(case, outputs, module, variant):
    if variant == "semantic_sign_exp_field_defaults":
        text, items, model = render_aggressive_variant(case, outputs, module, variant)
        for index, expected in enumerate(outputs):
            actual = model(index)
            if actual != expected:
                raise RuntimeError(
                    "aggressive semantic renderer mismatch index={0:04x} expected={1:04x} actual={2:04x}".format(
                        index,
                        expected,
                        actual,
                    )
                )
        return text, "semantic sign_exp field defaults; {0}".format(items)
    if variant.startswith("structural_"):
        structural = variant[len("structural_") :]
        ok, note = verify_structural_variant(outputs, structural)
        if not ok:
            raise RuntimeError(note)
        text, items = render_structural_variant(outputs, module, structural)
        return text, "structural comparison candidate; {0}; items={1}".format(note, items)
    return render_custom(case, outputs, module, variant)


def run_candidate(case, outputs, variant, args, truth_path):
    info = CASE_INFO[case]
    module = "{0}_{1}_{2}".format(case, info["hypothesis"], variant)
    candidate_id = module
    case_work = ROOT / "student" / "work" / args.run_id / case
    verilog_path = case_work / "verilog" / "{0}.v".format(candidate_id)
    aig_path = case_work / "aigs" / "{0}.aig".format(candidate_id)
    log_path = case_work / "logs" / "{0}.yosys.log".format(candidate_id)
    script_path = case_work / "logs" / "{0}.ys".format(candidate_id)

    start = time.time()
    row = {
        "case": case,
        "candidate_id": candidate_id,
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
        candidate = evaluate_aig(
            case=case,
            candidate_id=candidate_id,
            parent_id="",
            source="verilog",
            tool_chain="yosys_aigmap",
            aig_path=aig_path,
            truth=truth_path,
            abc=args.abc,
            notes=note,
            timeout=args.abc_timeout,
        )
        row["equivalent"] = "1" if candidate.equivalent else "0"
        if candidate.equivalent:
            row["area"] = str(candidate.area)
            row["delay"] = str(candidate.delay)
            row["adp"] = str(candidate.adp)
        row["notes"] = candidate.notes
    except (SynthError, RuntimeError, subprocess.TimeoutExpired) as error:
        row["notes"] = "failed: {0}".format(error)
    row["runtime_sec"] = "{0:.3f}".format(time.time() - start)
    return row


def best_rows(rows):
    valid = [row for row in rows if row.get("equivalent") == "1" and row.get("adp")]
    valid.sort(key=lambda row: (int(row["adp"]), int(row["delay"]), int(row["area"]), row["candidate_id"]))
    seen = set()
    best = []
    for row in valid:
        if row["case"] in seen:
            continue
        best.append(row)
        seen.add(row["case"])
    return best


def enrich_best(best, refs, previous):
    enriched = []
    for row in best:
        out = {field: row.get(field, "") for field in BEST_FIELDS}
        ref = refs.get(row["case"])
        prev = previous.get(row["case"])
        adp = int(row["adp"])
        out["reference_adp"] = str(ref) if ref else ""
        out["ratio_to_reference"] = "{0:.6f}".format(adp / ref) if ref else ""
        out["within_1p5_reference"] = "1" if ref and adp <= 1.5 * ref else "0"
        out["beats_reference"] = "1" if ref and adp < ref else "0"
        out["previous_best_adp"] = str(prev) if prev else ""
        out["ratio_to_previous_best"] = "{0:.6f}".format(adp / prev) if prev else ""
        enriched.append(out)
    return enriched


def summary_rows(cases, best, refs, previous):
    by_case = {row["case"]: row for row in best}
    rows = []
    for case in cases:
        info = CASE_INFO[case]
        row = by_case.get(case)
        if not row:
            rows.append(
                {
                    "case": case,
                    "function_guess": info["function_guess"],
                    "best_candidate_id": "",
                    "best_variant": "",
                    "best_area": "",
                    "best_delay": "",
                    "best_adp": "",
                    "reference_adp": str(refs.get(case, "")),
                    "ratio_to_reference": "",
                    "within_1p5_reference": "0",
                    "beats_reference": "0",
                    "previous_best_adp": str(previous.get(case, "")),
                    "ratio_to_previous_best": "",
                    "semantic_status": "semantic model verified; no equivalent candidate synthesized",
                    "notes": "",
                }
            )
            continue
        adp = int(row["adp"])
        ref = refs.get(case)
        prev = previous.get(case)
        rows.append(
            {
                "case": case,
                "function_guess": info["function_guess"],
                "best_candidate_id": row["candidate_id"],
                "best_variant": row["variant"],
                "best_area": row["area"],
                "best_delay": row["delay"],
                "best_adp": row["adp"],
                "reference_adp": str(ref) if ref else "",
                "ratio_to_reference": "{0:.6f}".format(adp / ref) if ref else "",
                "within_1p5_reference": "1" if ref and adp <= 1.5 * ref else "0",
                "beats_reference": "1" if ref and adp < ref else "0",
                "previous_best_adp": str(prev) if prev else "",
                "ratio_to_previous_best": "{0:.6f}".format(adp / prev) if prev else "",
                "semantic_status": "true semantic function identified and exact RTL candidates verified",
                "notes": row["notes"],
            }
        )
    return rows


def write_case_manifest(case, rows, args):
    manifest = {
        "run_id": args.run_id,
        "case": case,
        "domain": "bf16",
        "stage": "frontend semantic reconstruction",
        "truth_convention": "ABC read_truth -xf via student.frontends.truth.TruthTable",
        "function_guess": CASE_INFO[case]["function_guess"],
        "candidates": [
            {
                "candidate_id": row["candidate_id"],
                "variant": row["variant"],
                "verilog_path": row["verilog_path"],
                "aig_path": row["aig_path"],
                "equivalent": row["equivalent"],
                "area": row["area"],
                "delay": row["delay"],
                "adp": row["adp"],
                "notes": row["notes"],
            }
            for row in rows
        ],
    }
    path = ROOT / "student" / "work" / args.run_id / case / "manifest.json"
    write_text(path, json.dumps(manifest, indent=2, sort_keys=True) + "\n")


def write_run_manifest(args, cases, rows, best):
    best_by_case = {row["case"]: row for row in best}
    lines = [
        "# {0}".format(args.run_id),
        "",
        "- Domain: BF16 ex201-ex204",
        "- Stage: frontend semantic reconstruction only",
        "- Truth convention: `student.frontends.truth.TruthTable` / ABC `read_truth -xf`",
        "- Backend portfolios: not run",
        "- Work directory: `student/work/{0}/`".format(args.run_id),
        "- Results: `student/runs/bf16/{0}/results/`".format(args.run_id),
        "",
        "## Semantic Findings",
        "",
        "| Case | Function Guess | Best Variant | Area | Delay | ADP |",
        "| --- | --- | --- | ---: | ---: | ---: |",
    ]
    for case in cases:
        info = CASE_INFO[case]
        row = best_by_case.get(case, {})
        lines.append(
            "| {0} | {1} | {2} | {3} | {4} | {5} |".format(
                case,
                info["function_guess"],
                row.get("variant", ""),
                row.get("area", ""),
                row.get("delay", ""),
                row.get("adp", ""),
            )
        )
    lines.extend(
        [
            "",
            "## Notes",
            "",
            "- Candidates were generated case-by-case from the verified semantic model and the local truth table.",
            "- Yosys synthesis to AIG and ABC CEC/ADP measurement were run for each candidate.",
            "- Official `evaluate.py` recheck is stored separately after `student/scripts/verify_variant_csv.py` is run.",
            "",
        ]
    )
    path = ROOT / "student" / "runs" / "bf16" / args.run_id / "MANIFEST.md"
    write_text(path, "\n".join(lines))


def run_case(case, args):
    truth_path = ROOT / "benchmarks" / "{0}.truth".format(case)
    outputs = list(TruthTable(truth_path).iter_outputs())
    semantic_ok, semantic_note = verify_semantic(case, outputs)
    if not semantic_ok:
        raise RuntimeError("{0}: {1}".format(case, semantic_note))
    print("{0}: semantic verified ({1})".format(case, CASE_INFO[case]["function_guess"]))
    rows = []
    for variant in CASE_VARIANTS[case]:
        row = run_candidate(case, outputs, variant, args, truth_path)
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
    write_case_manifest(case, rows, args)
    return rows


def parse_args(argv=None):
    parser = argparse.ArgumentParser(description="Generate semantic BF16 RTL candidates for ex201-ex204.")
    parser.add_argument("--run-id", default=DEFAULT_RUN_ID)
    parser.add_argument("--cases", nargs="+", default=["ex201", "ex202", "ex203", "ex204"])
    parser.add_argument("--results", type=Path)
    parser.add_argument("--best-results", type=Path)
    parser.add_argument("--summary", type=Path)
    parser.add_argument("--reference", type=Path, default=ROOT / "reference_result.csv")
    parser.add_argument(
        "--previous-best",
        type=Path,
        default=ROOT / "student" / "runs" / "bf16" / "ex200_ex219_current" / "results" / "best.csv",
    )
    parser.add_argument("--abc", type=Path, default=DEFAULT_ABC)
    parser.add_argument("--yosys-timeout", type=int, default=180)
    parser.add_argument("--abc-timeout", type=int, default=180)
    return parser.parse_args(argv)


def main(argv=None):
    args = parse_args(argv)
    invalid = [case for case in args.cases if case not in CASE_INFO]
    if invalid:
        raise RuntimeError("unsupported cases: {0}".format(", ".join(invalid)))
    if args.results is None:
        args.results = ROOT / "student" / "runs" / "bf16" / args.run_id / "results" / "candidates.csv"
    if args.best_results is None:
        args.best_results = ROOT / "student" / "runs" / "bf16" / args.run_id / "results" / "best.csv"
    if args.summary is None:
        args.summary = ROOT / "student" / "runs" / "bf16" / args.run_id / "results" / "summary.csv"

    all_rows = []
    for case in args.cases:
        all_rows.extend(run_case(case, args))

    refs = read_reference_adp(args.reference)
    previous = read_previous_best(args.previous_best)
    best = enrich_best(best_rows(all_rows), refs, previous)
    summaries = summary_rows(args.cases, best, refs, previous)
    write_csv(args.results, RESULT_FIELDS, all_rows)
    write_csv(args.best_results, BEST_FIELDS, best)
    write_csv(args.summary, SUMMARY_FIELDS, summaries)
    write_run_manifest(args, args.cases, all_rows, best)

    print("Results: {0}".format(args.results))
    print("Best: {0}".format(args.best_results))
    print("Summary: {0}".format(args.summary))
    return 0 if len(best) == len(args.cases) else 1


if __name__ == "__main__":
    raise SystemExit(main())
