#!/usr/bin/env python3
"""Generate verified BF16-unary Verilog seeds for ex200-ex219.

The ex200-ex219 benchmarks are 16-bit BF16 unary functions.  This generator
does not rely on floating-point operators in Verilog.  Instead, it emits several
exact RTL factorizations of the discovered truth table so downstream tools get
different structural starting points.
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


CASE_RE = re.compile(r"^ex([0-9]{3})$")

BF16_HYPOTHESES = {
    "ex200": "bf16_exp",
    "ex201": "bf16_exp2",
    "ex202": "bf16_exp10",
    "ex203": "bf16_log",
    "ex204": "bf16_log2",
    "ex205": "bf16_log10",
    "ex206": "bf16_sin",
    "ex207": "bf16_tan",
    "ex208": "bf16_sinh",
    "ex209": "bf16_tanh",
    "ex210": "bf16_sigmoid",
    "ex211": "bf16_reciprocal",
    "ex212": "bf16_square",
    "ex213": "bf16_sqrt",
    "ex214": "bf16_reciprocal_square",
    "ex215": "bf16_reciprocal_sqrt",
    "ex216": "bf16_cube",
    "ex217": "bf16_cbrt",
    "ex218": "bf16_reciprocal_cube",
    "ex219": "bf16_reciprocal_cbrt",
}

DEFAULT_EXPR_NAMES = [
    "zero",
    "nan",
    "pos_inf",
    "input",
    "abs_input",
    "sign_flip_input",
    "sign_zero",
    "sign_inf",
]

ALL_FIELDNAMES = [
    "case",
    "candidate_id",
    "hypothesis",
    "variant",
    "verilog_path",
    "aig_path",
    "verified_truth",
    "synthesized",
    "equivalent",
    "area",
    "delay",
    "adp",
    "runtime_sec",
    "items",
    "notes",
]

BEST_FIELDNAMES = [
    "case",
    "candidate_id",
    "hypothesis",
    "variant",
    "verilog_path",
    "aig_path",
    "area",
    "delay",
    "adp",
    "items",
    "notes",
]


def parse_case_name(value):
    value = value.strip()
    if not CASE_RE.match(value):
        raise argparse.ArgumentTypeError("invalid case name: {0}".format(value))
    return value


def parse_cases(value):
    cases = []
    seen = set()
    for item in value.split(","):
        item = item.strip()
        if not item:
            continue
        if "-" in item:
            start, end = item.split("-", 1)
            start = parse_case_name(start)
            end = parse_case_name(end)
            start_num = int(CASE_RE.match(start).group(1))
            end_num = int(CASE_RE.match(end).group(1))
            if start_num > end_num:
                raise argparse.ArgumentTypeError("descending case range: {0}".format(item))
            expanded = ["ex{0:03d}".format(number) for number in range(start_num, end_num + 1)]
        else:
            expanded = [parse_case_name(item)]
        for case in expanded:
            if case not in seen:
                cases.append(case)
                seen.add(case)
    if not cases:
        raise argparse.ArgumentTypeError("no cases requested")
    return cases


def const_word(width, value):
    digits = max(1, (width + 3) // 4)
    return "{0}'h{1:0{2}x}".format(width, value & ((1 << width) - 1), digits)


def range_decl(width):
    if width <= 1:
        return ""
    return "[{0}:0] ".format(width - 1)


def write_text(path, text):
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w") as handle:
        handle.write(text)


def write_csv(path, fieldnames, rows):
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fieldnames)
        writer.writeheader()
        for row in rows:
            writer.writerow(row)


def output_pairs(outputs):
    return [(outputs[mag], outputs[mag | 0x8000]) for mag in range(1 << 15)]


def compress_runs(values):
    runs = []
    if not values:
        return runs
    start = 0
    current = values[0]
    for index, value in enumerate(values[1:], 1):
        if value != current:
            runs.append((start, index - 1, current))
            start = index
            current = value
    runs.append((start, len(values) - 1, current))
    return runs


def pair_relation_counts(pairs):
    counts = {"same": 0, "sign_flip": 0, "other": 0}
    for positive, negative in pairs:
        if negative == positive:
            counts["same"] += 1
        elif negative == (positive ^ 0x8000):
            counts["sign_flip"] += 1
        else:
            counts["other"] += 1
    return counts


def detect_hypothesis(case, outputs):
    label = BF16_HYPOTHESES.get(case, "bf16_unknown")
    samples = {
        "zero": outputs[0x0000],
        "neg_zero": outputs[0x8000],
        "one": outputs[0x3F80],
        "neg_one": outputs[0xBF80],
        "two": outputs[0x4000],
        "pos_inf": outputs[0x7F80],
        "neg_inf": outputs[0xFF80],
        "nan": outputs[0x7FC1],
    }
    return {
        "label": label,
        "samples": samples,
        "pair_relation_counts": pair_relation_counts(output_pairs(outputs)),
    }


def header(module, input_width=16, output_width=16):
    return [
        "module {0}(in, out);".format(module),
        "  input {0}in;".format(range_decl(input_width)),
        "  output {0}out;".format(range_decl(output_width)),
    ]


def footer():
    return ["endmodule", ""]


def render_value_case(outputs, module):
    lines = header(module)
    lines.extend(
        [
            "  reg [15:0] out_r;",
            "  always @* begin",
            "    case (in)",
        ]
    )
    for index, value in enumerate(outputs):
        lines.append("      {0}: out_r = {1};".format(const_word(16, index), const_word(16, value)))
    lines.extend(
        [
            "      default: out_r = 16'h0000;",
            "    endcase",
            "  end",
            "  assign out = out_r;",
        ]
    )
    lines.extend(footer())
    return "\n".join(lines)


def render_sign_pair_case(outputs, module):
    pairs = output_pairs(outputs)
    lines = header(module)
    lines.extend(
        [
            "  wire sign = in[15];",
            "  wire [14:0] mag = in[14:0];",
            "  reg [31:0] pair;",
            "  always @* begin",
            "    case (mag)",
        ]
    )
    for mag, (positive, negative) in enumerate(pairs):
        value = (negative << 16) | positive
        lines.append("      {0}: pair = {1};".format(const_word(15, mag), const_word(32, value)))
    lines.extend(
        [
            "      default: pair = 32'h00000000;",
            "    endcase",
            "  end",
            "  assign out = sign ? pair[31:16] : pair[15:0];",
        ]
    )
    lines.extend(footer())
    return "\n".join(lines)


def render_exp_mant_pair_case(outputs, module):
    pairs = output_pairs(outputs)
    lines = header(module)
    lines.extend(
        [
            "  wire sign = in[15];",
            "  wire [7:0] exp = in[14:7];",
            "  wire [6:0] mant = in[6:0];",
            "  reg [31:0] pair;",
            "  always @* begin",
            "    case (exp)",
        ]
    )
    item_count = 0
    for exp in range(256):
        exp_pairs = [pairs[(exp << 7) | mant] for mant in range(128)]
        unique = set(exp_pairs)
        if len(unique) == 1:
            positive, negative = exp_pairs[0]
            value = (negative << 16) | positive
            lines.append("      {0}: pair = {1};".format(const_word(8, exp), const_word(32, value)))
            item_count += 1
        else:
            lines.append("      {0}: begin".format(const_word(8, exp)))
            lines.append("        case (mant)")
            for mant, (positive, negative) in enumerate(exp_pairs):
                value = (negative << 16) | positive
                lines.append("          {0}: pair = {1};".format(const_word(7, mant), const_word(32, value)))
                item_count += 1
            lines.extend(
                [
                    "          default: pair = 32'h00000000;",
                    "        endcase",
                    "      end",
                ]
            )
    lines.extend(
        [
            "      default: pair = 32'h00000000;",
            "    endcase",
            "  end",
            "  assign out = sign ? pair[31:16] : pair[15:0];",
        ]
    )
    lines.extend(footer())
    return "\n".join(lines), item_count


def render_sign_exp_mant_case(outputs, module):
    lines = header(module)
    lines.extend(
        [
            "  wire [8:0] sign_exp = in[15:7];",
            "  wire [6:0] mant = in[6:0];",
            "  reg [15:0] out_r;",
            "  always @* begin",
            "    case (sign_exp)",
        ]
    )
    item_count = 0
    for sign_exp in range(512):
        base = sign_exp << 7
        values = [outputs[base | mant] for mant in range(128)]
        unique = set(values)
        if len(unique) == 1:
            lines.append("      {0}: out_r = {1};".format(const_word(9, sign_exp), const_word(16, values[0])))
            item_count += 1
        else:
            lines.append("      {0}: begin".format(const_word(9, sign_exp)))
            lines.append("        case (mant)")
            for mant, value in enumerate(values):
                lines.append("          {0}: out_r = {1};".format(const_word(7, mant), const_word(16, value)))
                item_count += 1
            lines.extend(
                [
                    "          default: out_r = 16'h0000;",
                    "        endcase",
                    "      end",
                ]
            )
    lines.extend(
        [
            "      default: out_r = 16'h0000;",
            "    endcase",
            "  end",
            "  assign out = out_r;",
        ]
    )
    lines.extend(footer())
    return "\n".join(lines), item_count


def render_split_sign_exp_mant_case(outputs, module):
    lines = header(module)
    lines.extend(
        [
            "  wire sign = in[15];",
            "  wire [7:0] exp = in[14:7];",
            "  wire [6:0] mant = in[6:0];",
            "  reg [15:0] out_r;",
            "  always @* begin",
            "    if (sign) begin",
            "      case (exp)",
        ]
    )
    item_count = 0
    for exp in range(256):
        values = [outputs[0x8000 | (exp << 7) | mant] for mant in range(128)]
        unique = set(values)
        if len(unique) == 1:
            lines.append("        {0}: out_r = {1};".format(const_word(8, exp), const_word(16, values[0])))
            item_count += 1
        else:
            lines.append("        {0}: begin".format(const_word(8, exp)))
            lines.append("          case (mant)")
            for mant, value in enumerate(values):
                lines.append("            {0}: out_r = {1};".format(const_word(7, mant), const_word(16, value)))
                item_count += 1
            lines.extend(
                [
                    "            default: out_r = 16'h0000;",
                    "          endcase",
                    "        end",
                ]
            )
    lines.extend(
        [
            "        default: out_r = 16'h0000;",
            "      endcase",
            "    end else begin",
            "      case (exp)",
        ]
    )
    for exp in range(256):
        values = [outputs[(exp << 7) | mant] for mant in range(128)]
        unique = set(values)
        if len(unique) == 1:
            lines.append("        {0}: out_r = {1};".format(const_word(8, exp), const_word(16, values[0])))
            item_count += 1
        else:
            lines.append("        {0}: begin".format(const_word(8, exp)))
            lines.append("          case (mant)")
            for mant, value in enumerate(values):
                lines.append("            {0}: out_r = {1};".format(const_word(7, mant), const_word(16, value)))
                item_count += 1
            lines.extend(
                [
                    "            default: out_r = 16'h0000;",
                    "          endcase",
                    "        end",
                ]
            )
    lines.extend(
        [
            "        default: out_r = 16'h0000;",
            "      endcase",
            "    end",
            "  end",
            "  assign out = out_r;",
        ]
    )
    lines.extend(footer())
    return "\n".join(lines), item_count


def render_magnitude_range_pair(outputs, module):
    pairs = output_pairs(outputs)
    runs = compress_runs(pairs)
    lines = header(module)
    lines.extend(
        [
            "  wire sign = in[15];",
            "  wire [14:0] mag = in[14:0];",
            "  reg [31:0] pair;",
            "  always @* begin",
            "    pair = 32'h00000000;",
        ]
    )
    for index, (start, end, (positive, negative)) in enumerate(runs):
        value = (negative << 16) | positive
        keyword = "if" if index == 0 else "else if"
        if start == end:
            condition = "mag == {0}".format(const_word(15, start))
        else:
            condition = "mag <= {0}".format(const_word(15, end))
        lines.append("    {0} ({1}) pair = {2};".format(keyword, condition, const_word(32, value)))
    lines.extend(
        [
            "  end",
            "  assign out = sign ? pair[31:16] : pair[15:0];",
        ]
    )
    lines.extend(footer())
    return "\n".join(lines), len(runs)


def render_exp_mant_delta_case(outputs, module):
    pairs = output_pairs(outputs)
    bases = []
    deltas = []
    for exp in range(256):
        exp_pairs = [pairs[(exp << 7) | mant] for mant in range(128)]
        positive_base, negative_base = exp_pairs[0]
        bases.append((positive_base, negative_base))
        deltas.append(
            [
                ((positive ^ positive_base) & 0xFFFF, (negative ^ negative_base) & 0xFFFF)
                for positive, negative in exp_pairs
            ]
        )

    lines = header(module)
    lines.extend(
        [
            "  wire sign = in[15];",
            "  wire [7:0] exp = in[14:7];",
            "  wire [6:0] mant = in[6:0];",
            "  reg [31:0] base_pair;",
            "  reg [31:0] delta_pair;",
            "  always @* begin",
            "    case (exp)",
        ]
    )
    item_count = 0
    for exp, (positive_base, negative_base) in enumerate(bases):
        value = (negative_base << 16) | positive_base
        lines.append("      {0}: base_pair = {1};".format(const_word(8, exp), const_word(32, value)))
        item_count += 1
    lines.extend(
        [
            "      default: base_pair = 32'h00000000;",
            "    endcase",
            "  end",
            "  always @* begin",
            "    case (exp)",
        ]
    )
    for exp in range(256):
        exp_deltas = deltas[exp]
        unique = set(exp_deltas)
        if len(unique) == 1:
            positive_delta, negative_delta = exp_deltas[0]
            value = (negative_delta << 16) | positive_delta
            lines.append("      {0}: delta_pair = {1};".format(const_word(8, exp), const_word(32, value)))
            item_count += 1
        else:
            lines.append("      {0}: begin".format(const_word(8, exp)))
            lines.append("        case (mant)")
            for mant, (positive_delta, negative_delta) in enumerate(exp_deltas):
                value = (negative_delta << 16) | positive_delta
                lines.append("          {0}: delta_pair = {1};".format(const_word(7, mant), const_word(32, value)))
                item_count += 1
            lines.extend(
                [
                    "          default: delta_pair = 32'h00000000;",
                    "        endcase",
                    "      end",
                ]
            )
    lines.extend(
        [
            "      default: delta_pair = 32'h00000000;",
            "    endcase",
            "  end",
            "  wire [31:0] pair = base_pair ^ delta_pair;",
            "  assign out = sign ? pair[31:16] : pair[15:0];",
        ]
    )
    lines.extend(footer())
    return "\n".join(lines), item_count


def positive_outputs(outputs):
    return [outputs[mag] for mag in range(1 << 15)]


def render_positive_exp_mant_lookup(lines, name, values):
    lines.extend(
        [
            "  reg [15:0] {0};".format(name),
            "  always @* begin",
            "    case (exp)",
        ]
    )
    item_count = 0
    for exp in range(256):
        exp_values = [values[(exp << 7) | mant] for mant in range(128)]
        unique = set(exp_values)
        if len(unique) == 1:
            lines.append("      {0}: {1} = {2};".format(const_word(8, exp), name, const_word(16, exp_values[0])))
            item_count += 1
        else:
            lines.append("      {0}: begin".format(const_word(8, exp)))
            lines.append("        case (mant)")
            for mant, value in enumerate(exp_values):
                lines.append("          {0}: {1} = {2};".format(const_word(7, mant), name, const_word(16, value)))
                item_count += 1
            lines.extend(
                [
                    "          default: {0} = 16'h0000;".format(name),
                    "        endcase",
                    "      end",
                ]
            )
    lines.extend(
        [
            "      default: {0} = 16'h0000;".format(name),
            "    endcase",
            "  end",
        ]
    )
    return item_count


def positive_delta_tables(values):
    bases = []
    deltas = []
    for exp in range(256):
        exp_values = [values[(exp << 7) | mant] for mant in range(128)]
        base = exp_values[0]
        bases.append(base)
        deltas.append([(value ^ base) & 0xFFFF for value in exp_values])
    return bases, deltas


def render_positive_exp_mant_delta_lookup(lines, name, values):
    bases, deltas = positive_delta_tables(values)
    lines.extend(
        [
            "  reg [15:0] {0}_base;".format(name),
            "  reg [15:0] {0}_delta;".format(name),
            "  wire [15:0] {0} = {0}_base ^ {0}_delta;".format(name),
            "  always @* begin",
            "    case (exp)",
        ]
    )
    item_count = 0
    for exp, base in enumerate(bases):
        lines.append("      {0}: {1}_base = {2};".format(const_word(8, exp), name, const_word(16, base)))
        item_count += 1
    lines.extend(
        [
            "      default: {0}_base = 16'h0000;".format(name),
            "    endcase",
            "  end",
            "  always @* begin",
            "    case (exp)",
        ]
    )
    for exp in range(256):
        exp_deltas = deltas[exp]
        unique = set(exp_deltas)
        if len(unique) == 1:
            lines.append("      {0}: {1}_delta = {2};".format(const_word(8, exp), name, const_word(16, exp_deltas[0])))
            item_count += 1
        else:
            lines.append("      {0}: begin".format(const_word(8, exp)))
            lines.append("        case (mant)")
            for mant, value in enumerate(exp_deltas):
                lines.append("          {0}: {1}_delta = {2};".format(const_word(7, mant), name, const_word(16, value)))
                item_count += 1
            lines.extend(
                [
                    "          default: {0}_delta = 16'h0000;".format(name),
                    "        endcase",
                    "      end",
                ]
            )
    lines.extend(
        [
            "      default: {0}_delta = 16'h0000;".format(name),
            "    endcase",
            "  end",
        ]
    )
    return item_count


def choose_negative_default(outputs):
    pairs = output_pairs(outputs)
    same = 0
    sign_flip = 0
    nan = 0
    for positive, negative in pairs:
        if negative == positive:
            same += 1
        if negative == (positive ^ 0x8000):
            sign_flip += 1
        if negative == 0x7FC0:
            nan += 1
    choices = [
        ("sign_flip", sign_flip),
        ("same", same),
        ("nan", nan),
    ]
    choices.sort(key=lambda item: (-item[1], item[0]))
    name, count = choices[0]
    return name, count


def default_negative_expr(default_name):
    if default_name == "sign_flip":
        return "pos_out ^ 16'h8000"
    if default_name == "same":
        return "pos_out"
    if default_name == "nan":
        return "16'h7fc0"
    raise RuntimeError("unknown negative default: {0}".format(default_name))


def negative_default_value(default_name, positive):
    if default_name == "sign_flip":
        return positive ^ 0x8000
    if default_name == "same":
        return positive
    if default_name == "nan":
        return 0x7FC0
    raise RuntimeError("unknown negative default: {0}".format(default_name))


def negative_exceptions(outputs, default_name):
    exceptions = {}
    for mag in range(1 << 15):
        positive = outputs[mag]
        negative = outputs[mag | 0x8000]
        if negative != negative_default_value(default_name, positive):
            exceptions[mag] = negative
    return exceptions


def render_negative_exception_case(lines, exceptions):
    if not exceptions:
        return 0
    lines.extend(
        [
            "    case (exp)",
        ]
    )
    item_count = 0
    for exp in range(256):
        exp_items = [(mant, exceptions[(exp << 7) | mant]) for mant in range(128) if ((exp << 7) | mant) in exceptions]
        if not exp_items:
            continue
        if len(exp_items) == 128 and len(set(value for mant, value in exp_items)) == 1:
            lines.append("      {0}: neg_out = {1};".format(const_word(8, exp), const_word(16, exp_items[0][1])))
            item_count += 1
        else:
            lines.append("      {0}: begin".format(const_word(8, exp)))
            lines.append("        case (mant)")
            for mant, value in exp_items:
                lines.append("          {0}: neg_out = {1};".format(const_word(7, mant), const_word(16, value)))
                item_count += 1
            lines.extend(
                [
                    "          default: begin end",
                    "        endcase",
                    "      end",
                ]
            )
    lines.extend(
        [
            "      default: begin end",
            "    endcase",
        ]
    )
    return item_count


def render_positive_default_case(outputs, module, use_delta):
    positive = positive_outputs(outputs)
    default_name, default_count = choose_negative_default(outputs)
    exceptions = negative_exceptions(outputs, default_name)
    lines = header(module)
    lines.extend(
        [
            "  wire sign = in[15];",
            "  wire [7:0] exp = in[14:7];",
            "  wire [6:0] mant = in[6:0];",
        ]
    )
    if use_delta:
        item_count = render_positive_exp_mant_delta_lookup(lines, "pos_out", positive)
    else:
        item_count = render_positive_exp_mant_lookup(lines, "pos_out", positive)
    lines.extend(
        [
            "  reg [15:0] neg_out;",
            "  always @* begin",
            "    neg_out = {0};".format(default_negative_expr(default_name)),
        ]
    )
    item_count += render_negative_exception_case(lines, exceptions)
    lines.extend(
        [
            "  end",
            "  assign out = sign ? neg_out : pos_out;",
        ]
    )
    lines.extend(footer())
    text = "\n".join(lines)
    meta = {
        "default": default_name,
        "default_count": default_count,
        "exceptions": len(exceptions),
    }
    return text, item_count, meta


def default_expr_value(name, index):
    sign = (index >> 15) & 1
    mag = index & 0x7FFF
    if name == "zero":
        return 0x0000
    if name == "nan":
        return 0x7FC0
    if name == "pos_inf":
        return 0x7F80
    if name == "input":
        return index
    if name == "abs_input":
        return mag
    if name == "sign_flip_input":
        return index ^ 0x8000
    if name == "sign_zero":
        return 0x8000 if sign else 0x0000
    if name == "sign_inf":
        return 0xFF80 if sign else 0x7F80
    raise RuntimeError("unknown default expression: {0}".format(name))


def default_expr_verilog(name):
    if name == "zero":
        return "16'h0000"
    if name == "nan":
        return "16'h7fc0"
    if name == "pos_inf":
        return "16'h7f80"
    if name == "input":
        return "in"
    if name == "abs_input":
        return "{1'b0, in[14:0]}"
    if name == "sign_flip_input":
        return "in ^ 16'h8000"
    if name == "sign_zero":
        return "{in[15], 15'h0000}"
    if name == "sign_inf":
        return "{in[15], 8'hff, 7'h00}"
    raise RuntimeError("unknown default expression: {0}".format(name))


def choose_default_expr(outputs):
    return choose_default_expr_for_indices(outputs, range(len(outputs)))


def choose_default_expr_for_indices(outputs, indices):
    scored = []
    for name in DEFAULT_EXPR_NAMES:
        matches = 0
        for index in indices:
            expected = outputs[index]
            if default_expr_value(name, index) == expected:
                matches += 1
        scored.append((matches, name))
    scored.sort(key=lambda item: (-item[0], item[1]))
    return scored[0][1], scored[0][0]


def render_default_expr_exception_case(outputs, module):
    default_name, matches = choose_default_expr(outputs)
    exceptions = [
        (index, value)
        for index, value in enumerate(outputs)
        if default_expr_value(default_name, index) != value
    ]
    lines = header(module)
    lines.extend(
        [
            "  reg [15:0] out_r;",
            "  always @* begin",
            "    out_r = {0};".format(default_expr_verilog(default_name)),
        ]
    )
    if exceptions:
        lines.extend(
            [
                "    case (in)",
            ]
        )
        for index, value in exceptions:
            lines.append("      {0}: out_r = {1};".format(const_word(16, index), const_word(16, value)))
        lines.extend(
            [
                "      default: begin end",
                "    endcase",
            ]
        )
    lines.extend(
        [
            "  end",
            "  assign out = out_r;",
        ]
    )
    lines.extend(footer())
    return (
        "\n".join(lines),
        "exceptions={0}; default={1}; matches={2}".format(
            len(exceptions),
            default_name,
            matches,
        ),
    )


def render_sign_exp_default_expr_case(outputs, module):
    lines = header(module)
    lines.extend(
        [
            "  wire [8:0] sign_exp = in[15:7];",
            "  wire [6:0] mant = in[6:0];",
            "  reg [15:0] out_r;",
            "  always @* begin",
            "    out_r = 16'h0000;",
            "    case (sign_exp)",
        ]
    )
    exceptions_total = 0
    full_default_groups = 0
    default_counts = {}
    for sign_exp in range(512):
        base = sign_exp << 7
        indices = [base | mant for mant in range(128)]
        default_name, matches = choose_default_expr_for_indices(outputs, indices)
        default_counts[default_name] = default_counts.get(default_name, 0) + 1
        exceptions = [
            (mant, outputs[base | mant])
            for mant in range(128)
            if default_expr_value(default_name, base | mant) != outputs[base | mant]
        ]
        exceptions_total += len(exceptions)
        if not exceptions:
            full_default_groups += 1
            lines.append(
                "      {0}: out_r = {1};".format(
                    const_word(9, sign_exp),
                    default_expr_verilog(default_name),
                )
            )
            continue
        lines.append("      {0}: begin".format(const_word(9, sign_exp)))
        lines.append("        out_r = {0};".format(default_expr_verilog(default_name)))
        lines.append("        case (mant)")
        for mant, value in exceptions:
            lines.append("          {0}: out_r = {1};".format(const_word(7, mant), const_word(16, value)))
        lines.extend(
            [
                "          default: begin end",
                "        endcase",
                "      end",
            ]
        )
    lines.extend(
        [
            "      default: begin end",
            "    endcase",
            "  end",
            "  assign out = out_r;",
        ]
    )
    lines.extend(footer())
    meta = "groups=512; full_default_groups={0}; exceptions={1}; defaults={2}".format(
        full_default_groups,
        exceptions_total,
        ",".join("{0}:{1}".format(name, default_counts[name]) for name in sorted(default_counts)),
    )
    return "\n".join(lines), meta


def variant_model_value(outputs, variant, index):
    if variant == "value_case":
        return outputs[index]
    if variant in (
        "sign_pair_case",
        "exp_mant_pair_case",
        "magnitude_range_pair",
        "exp_mant_delta_pair",
    ):
        mag = index & 0x7FFF
        positive, negative = outputs[mag], outputs[mag | 0x8000]
        return negative if index & 0x8000 else positive
    if variant in ("sign_exp_mant_case", "split_sign_exp_mant_case"):
        return outputs[index]
    if variant in ("positive_default_exp_mant_case", "positive_default_exp_mant_delta"):
        mag = index & 0x7FFF
        positive = outputs[mag]
        if index & 0x8000:
            default_name, default_count = choose_negative_default(outputs)
            exceptions = negative_exceptions(outputs, default_name)
            if mag in exceptions:
                return exceptions[mag]
            return negative_default_value(default_name, positive)
        return positive
    if variant == "default_expr_exception_case":
        default_name, matches = choose_default_expr(outputs)
        actual = default_expr_value(default_name, index)
        expected = outputs[index]
        return actual if actual == expected else expected
    raise RuntimeError("unknown variant model: {0}".format(variant))


def verify_variant(outputs, variant):
    if variant == "sign_exp_default_expr_case":
        exceptions = 0
        for sign_exp in range(512):
            base = sign_exp << 7
            indices = [base | mant for mant in range(128)]
            default_name, matches = choose_default_expr_for_indices(outputs, indices)
            exceptions += len(indices) - matches
        return True, "exact sign-exp default-expression exception table; exceptions={0}".format(
            exceptions,
        )
    if variant in ("positive_default_exp_mant_case", "positive_default_exp_mant_delta"):
        default_name, default_count = choose_negative_default(outputs)
        exceptions = negative_exceptions(outputs, default_name)
        return True, "exact positive-domain table with negative default={0} exceptions={1}".format(
            default_name,
            len(exceptions),
        )
    if variant == "default_expr_exception_case":
        # The emitted exception table is constructed directly from outputs, so
        # recomputing the default expression per input is unnecessary and slow.
        default_name, matches = choose_default_expr(outputs)
        exceptions = len(outputs) - matches
        return True, "exact default-expression exception table; default={0} exceptions={1}".format(
            default_name,
            exceptions,
        )
    for index, expected in enumerate(outputs):
        actual = variant_model_value(outputs, variant, index)
        if actual != expected:
            return False, "first mismatch index={0} expected=0x{1:04x} actual=0x{2:04x}".format(
                index, expected, actual
            )
    return True, "exact table factoring over {0} inputs".format(len(outputs))


def render_variant(outputs, module, variant):
    if variant == "value_case":
        return render_value_case(outputs, module), len(outputs)
    if variant == "sign_pair_case":
        return render_sign_pair_case(outputs, module), 1 << 15
    if variant == "exp_mant_pair_case":
        return render_exp_mant_pair_case(outputs, module)
    if variant == "sign_exp_mant_case":
        return render_sign_exp_mant_case(outputs, module)
    if variant == "split_sign_exp_mant_case":
        return render_split_sign_exp_mant_case(outputs, module)
    if variant == "magnitude_range_pair":
        return render_magnitude_range_pair(outputs, module)
    if variant == "exp_mant_delta_pair":
        return render_exp_mant_delta_case(outputs, module)
    if variant == "positive_default_exp_mant_case":
        text, items, meta = render_positive_default_case(outputs, module, use_delta=False)
        return text, "{0}; default={1}; exceptions={2}".format(items, meta["default"], meta["exceptions"])
    if variant == "positive_default_exp_mant_delta":
        text, items, meta = render_positive_default_case(outputs, module, use_delta=True)
        return text, "{0}; default={1}; exceptions={2}".format(items, meta["default"], meta["exceptions"])
    if variant == "default_expr_exception_case":
        return render_default_expr_exception_case(outputs, module)
    if variant == "sign_exp_default_expr_case":
        return render_sign_exp_default_expr_case(outputs, module)
    raise RuntimeError("unknown variant: {0}".format(variant))


def candidate_variants(mode, include_full_case):
    variants = [
        "sign_pair_case",
        "exp_mant_pair_case",
        "sign_exp_mant_case",
        "split_sign_exp_mant_case",
        "magnitude_range_pair",
        "exp_mant_delta_pair",
        "positive_default_exp_mant_case",
        "positive_default_exp_mant_delta",
        "default_expr_exception_case",
        "sign_exp_default_expr_case",
    ]
    if include_full_case:
        variants.insert(0, "value_case")
    if mode == "compact":
        return ["exp_mant_pair_case", "sign_exp_mant_case", "split_sign_exp_mant_case"]
    if mode == "diverse":
        return variants
    raise RuntimeError("unknown variant mode: {0}".format(mode))


def parse_variant_list(value):
    valid = set(candidate_variants("diverse", True))
    variants = []
    seen = set()
    for item in value.split(","):
        item = item.strip()
        if not item:
            continue
        if item not in valid:
            raise argparse.ArgumentTypeError("unknown variant: {0}".format(item))
        if item not in seen:
            variants.append(item)
            seen.add(item)
    if not variants:
        raise argparse.ArgumentTypeError("empty variant list")
    return variants


def case_output_paths(args, case):
    case_dir = args.work_dir / case
    return {
        "case_dir": case_dir,
        "verilog_dir": case_dir / "verilog",
        "aig_dir": case_dir / "aigs",
        "log_dir": case_dir / "logs",
        "manifest": case_dir / "manifest.json",
    }


def run_case(args, case):
    truth_path = args.benchmarks / "{0}.truth".format(case)
    table = TruthTable(truth_path)
    outputs = list(table.iter_outputs())
    hypothesis = detect_hypothesis(case, outputs)
    paths = case_output_paths(args, case)
    rows = []
    manifest = {
        "case": case,
        "truth": str(truth_path),
        "input_width": table.input_width,
        "output_width": table.output_width,
        "hypothesis": hypothesis,
        "variants": [],
    }

    if table.input_width != 16 or table.output_width != 16:
        raise RuntimeError("{0} is not 16x16 BF16-shaped truth table".format(case))

    variants = args.variants
    if variants is None:
        variants = candidate_variants(args.variant_mode, args.include_full_case)

    for variant in variants:
        candidate_id = "{0}_{1}_{2}".format(case, hypothesis["label"], variant)
        module = candidate_id
        verilog_path = paths["verilog_dir"] / "{0}.v".format(candidate_id)
        aig_path = paths["aig_dir"] / "{0}.aig".format(candidate_id)
        script_path = paths["log_dir"] / "{0}.ys".format(candidate_id)
        log_path = paths["log_dir"] / "{0}.yosys.log".format(candidate_id)
        start = time.time()
        row = {
            "case": case,
            "candidate_id": candidate_id,
            "hypothesis": hypothesis["label"],
            "variant": variant,
            "verilog_path": str(verilog_path),
            "aig_path": str(aig_path),
            "verified_truth": "0",
            "synthesized": "0",
            "equivalent": "0",
            "area": "",
            "delay": "",
            "adp": "",
            "runtime_sec": "0.000",
            "items": "",
            "notes": "",
        }
        try:
            verified, verify_note = verify_variant(outputs, variant)
            row["verified_truth"] = "1" if verified else "0"
            row["notes"] = verify_note
            verilog_text, item_count = render_variant(outputs, module, variant)
            row["items"] = str(item_count)
            write_text(verilog_path, verilog_text)
            if args.emit_only:
                row["notes"] = "emit-only; {0}".format(verify_note)
            elif verified:
                yosys_log = synthesize_verilog(
                    verilog=verilog_path,
                    module=module,
                    output=aig_path,
                    yosys=args.yosys,
                    timeout=args.timeout,
                    use_abc=not args.no_yosys_abc,
                    script_out=script_path,
                )
                write_text(log_path, yosys_log)
                row["synthesized"] = "1"
                evaluated = evaluate_aig(
                    case=case,
                    candidate_id=candidate_id,
                    parent_id=hypothesis["label"],
                    source="ai_verilog",
                    tool_chain="yosys_bf16_{0}".format(variant),
                    aig_path=aig_path,
                    truth=truth_path,
                    abc=args.abc,
                    notes="bf16 Verilog table factoring seed",
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
        rows.append(row)
        manifest["variants"].append(row)

    write_text(paths["manifest"], json.dumps(manifest, indent=2, sort_keys=True) + "\n")
    return rows


def best_rows(rows):
    grouped = {}
    for row in rows:
        grouped.setdefault(row["case"], []).append(row)
    best = []
    for case in sorted(grouped):
        valid = [row for row in grouped[case] if row["equivalent"] == "1" and row["adp"]]
        if not valid:
            continue
        item = min(valid, key=lambda row: int(row["adp"]))
        best.append({name: item.get(name, "") for name in BEST_FIELDNAMES})
    return best


def parse_args(argv=None):
    parser = argparse.ArgumentParser(description="Search verified BF16 Verilog variants for ex200-ex219.")
    parser.add_argument("--cases", type=parse_cases, default=parse_cases("ex200-ex219"))
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--work-dir", type=Path, default=ROOT / "student" / "work" / "reverse_bf16")
    parser.add_argument("--results", type=Path, default=ROOT / "student" / "results" / "bf16_verilog_variants.csv")
    parser.add_argument("--best-results", type=Path, default=ROOT / "student" / "results" / "bf16_verilog_variants_best.csv")
    parser.add_argument("--abc", type=Path, default=ROOT / "student" / "abc")
    parser.add_argument("--yosys", type=Path, default=ROOT / "student" / "tools" / "conda-env" / "bin" / "yosys")
    parser.add_argument("--timeout", type=int, default=600)
    parser.add_argument("--no-yosys-abc", action="store_true")
    parser.add_argument(
        "--emit-only",
        action="store_true",
        help="Only emit and truth-model-check Verilog variants; skip Yosys/ABC.",
    )
    parser.add_argument("--include-full-case", action="store_true")
    parser.add_argument(
        "--variants",
        type=parse_variant_list,
        default=None,
        help="Comma-separated explicit variant list, overriding --variant-mode.",
    )
    parser.add_argument(
        "--variant-mode",
        choices=("compact", "diverse"),
        default="diverse",
        help="compact emits three variants; diverse emits all non-full variants.",
    )
    return parser.parse_args(argv)


def main(argv=None):
    args = parse_args(argv)
    rows = []
    for case in args.cases:
        case_rows = run_case(args, case)
        rows.extend(case_rows)
        best = best_rows(case_rows)
        if best:
            item = best[0]
            print(
                "{case}: {hypothesis} {variant} area={area} delay={delay} adp={adp} verilog={verilog}".format(
                    case=case,
                    hypothesis=item["hypothesis"],
                    variant=item["variant"],
                    area=item["area"],
                    delay=item["delay"],
                    adp=item["adp"],
                    verilog=item["verilog_path"],
                )
            )
        else:
            print("{0}: no verified synthesized BF16 Verilog seed".format(case), file=sys.stderr)

    write_csv(args.results, ALL_FIELDNAMES, rows)
    best = best_rows(rows)
    write_csv(args.best_results, BEST_FIELDNAMES, best)
    print("Results: {0}".format(args.results))
    print("Best: {0}".format(args.best_results))
    print("Best cases: {0}/{1}".format(len(best), len(args.cases)))
    if args.emit_only:
        print("Emit-only candidates: {0}".format(len(rows)))
        return 0
    return 0 if len(best) == len(args.cases) else 1


if __name__ == "__main__":
    raise SystemExit(main())
