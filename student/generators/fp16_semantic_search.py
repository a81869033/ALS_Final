#!/usr/bin/env python3
"""Generate verified FP16 unary Verilog seed candidates for ex220-ex239.

This is a frontend-only reverse-engineering driver: truth-table exact model
check, Yosys RTL-to-AIG synthesis, and ABC CEC/ADP measurement.  It deliberately
does not run ABC/ABC9/MockTurtle/CULS/E-Syn optimization portfolios.
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

WIDTH = 16
EXP_BITS = 5
MANT_BITS = 10
EXP_BIAS = 15
EXP_MAX = (1 << EXP_BITS) - 1
MANT_SIZE = 1 << MANT_BITS
MAG_SIZE = 1 << (WIDTH - 1)
CANONICAL_NAN = 0x7E00

CASE_LABELS = {
    "ex220": "fp16_exp",
    "ex221": "fp16_exp2",
    "ex222": "fp16_exp10",
    "ex223": "fp16_log",
    "ex224": "fp16_log2",
    "ex225": "fp16_log10",
    "ex226": "fp16_sin",
    "ex227": "fp16_tan",
    "ex228": "fp16_sinh",
    "ex229": "fp16_tanh",
    "ex230": "fp16_sigmoid",
    "ex231": "fp16_reciprocal",
    "ex232": "fp16_square",
    "ex233": "fp16_sqrt",
    "ex234": "fp16_reciprocal_square",
    "ex235": "fp16_reciprocal_sqrt",
    "ex236": "fp16_cube",
    "ex237": "fp16_cbrt",
    "ex238": "fp16_reciprocal_cube",
    "ex239": "fp16_reciprocal_cbrt",
}

CASE_OPS = {
    "ex231": "recip",
    "ex232": "square",
    "ex233": "sqrt",
    "ex234": "recip_square",
    "ex235": "recip_sqrt",
    "ex236": "cube",
    "ex237": "cbrt",
    "ex238": "recip_cube",
    "ex239": "recip_cbrt",
}

OP_MOD = {
    "recip": 1,
    "square": 1,
    "sqrt": 2,
    "recip_square": 1,
    "recip_sqrt": 2,
    "cube": 1,
    "cbrt": 3,
    "recip_cube": 1,
    "recip_cbrt": 3,
}

DEFAULT_EXPR_NAMES = [
    "zero",
    "neg_zero",
    "nan",
    "pos_inf",
    "neg_inf",
    "one",
    "input",
    "abs_input",
    "sign_flip_input",
    "sign_zero",
    "sign_inf",
]

STRUCTURAL_VARIANTS = [
    "sign_exp_mant_case",
    "split_sign_exp_mant_case",
    "exp_mant_pair_case",
    "exp_mant_delta_pair",
    "positive_default_exp_mant_case",
    "positive_default_exp_mant_delta",
    "sign_exp_default_expr_case",
    "semantic_sign_exp_field_defaults",
    "semantic_positive_field_defaults",
    "semantic_exp_delta_fields",
    "default_expr_exception_case",
]

COMPACT_VARIANTS = [
    "exp_mant_pair_case",
    "sign_exp_mant_case",
    "positive_default_exp_mant_case",
    "sign_exp_default_expr_case",
    "semantic_sign_exp_field_defaults",
]

ALL_VARIANTS = STRUCTURAL_VARIANTS + [
    "semantic_arith_fields",
    "semantic_arith_fields_with_exceptions",
    "value_case",
    "sign_pair_case",
]

RESULT_FIELDNAMES = [
    "case",
    "candidate_id",
    "hypothesis/function_guess",
    "variant",
    "verilog_path",
    "aig_path",
    "verified_truth",
    "synthesized",
    "equivalent",
    "area",
    "delay",
    "adp",
    "reference_adp",
    "adp_ratio_to_reference",
    "within_1p5_reference",
    "beats_reference",
    "runtime_sec",
    "items",
    "classification",
    "notes",
]

BEST_FIELDNAMES = [
    "case",
    "candidate_id",
    "hypothesis/function_guess",
    "variant",
    "verilog_path",
    "aig_path",
    "verified_truth",
    "equivalent",
    "area",
    "delay",
    "adp",
    "reference_adp",
    "adp_ratio_to_reference",
    "within_1p5_reference",
    "beats_reference",
    "classification",
    "notes",
]

META_FIELDNAMES = [
    "case",
    "hypothesis/function_guess",
    "input_width",
    "output_width",
    "constant_bits",
    "support_bits",
    "output_zero",
    "output_subnormal",
    "output_normal",
    "output_inf",
    "output_nan",
    "sign_relation_best",
    "sign_relation_matches",
    "identity_matches",
    "abs_matches",
    "sign_flip_input_matches",
    "global_default",
    "global_default_matches",
    "sign_exp_full_default_groups",
    "positive_exp_full_default_groups",
    "sample_zero",
    "sample_neg_zero",
    "sample_one",
    "sample_neg_one",
    "sample_two",
    "sample_pos_inf",
    "sample_neg_inf",
    "sample_nan",
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


def parse_variant_list(value):
    variants = []
    seen = set()
    valid = set(ALL_VARIANTS)
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


def const_word(width, value):
    digits = max(1, (width + 3) // 4)
    return "{0}'h{1:0{2}x}".format(width, value & ((1 << width) - 1), digits)


def signed_const(width, value):
    if value < 0:
        return "-{0}'sd{1}".format(width, -value)
    return "{0}'sd{1}".format(width, value)


def range_decl(width):
    return "" if width <= 1 else "[{0}:0] ".format(width - 1)


def rel_path(path):
    path = Path(path)
    try:
        return str(path.relative_to(ROOT))
    except ValueError:
        return str(path)


def write_text(path, text):
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w") as handle:
        handle.write(text)


def write_csv(path, fieldnames, rows):
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(rows)


def load_reference(path):
    refs = {}
    if path is None or not Path(path).is_file():
        return refs
    with Path(path).open() as handle:
        for row in csv.DictReader(handle):
            if row.get("case") and row.get("adp"):
                refs[row["case"]] = int(row["adp"])
    return refs


def add_reference_columns(row, refs):
    ref = refs.get(row["case"])
    row["reference_adp"] = "" if ref is None else str(ref)
    row["adp_ratio_to_reference"] = ""
    row["within_1p5_reference"] = ""
    row["beats_reference"] = ""
    if ref is None or not row.get("adp"):
        return
    adp = int(row["adp"])
    row["adp_ratio_to_reference"] = "{0:.6f}".format(float(adp) / float(ref))
    row["within_1p5_reference"] = "1" if adp <= int(ref * 1.5) else "0"
    row["beats_reference"] = "1" if adp < ref else "0"


def output_fields(value):
    sign = (value >> 15) & 1
    exp = (value >> MANT_BITS) & EXP_MAX
    mant = value & (MANT_SIZE - 1)
    return sign, exp, mant


def field_assign(prefix, value):
    sign, exp, mant = output_fields(value)
    return "{0}_sign = 1'b{1}; {0}_exp = {2}; {0}_mant = {3};".format(
        prefix,
        sign,
        const_word(EXP_BITS, exp),
        const_word(MANT_BITS, mant),
    )


def output_category(value):
    sign, exp, mant = output_fields(value)
    if exp == 0:
        return "zero" if mant == 0 else "subnormal"
    if exp == EXP_MAX:
        return "inf" if mant == 0 else "nan"
    return "normal"


def output_is_normal(value):
    return output_category(value) == "normal"


def output_pairs(outputs):
    return [(outputs[mag], outputs[mag | 0x8000]) for mag in range(MAG_SIZE)]


def header(module):
    return [
        "module {0}(in, out);".format(module),
        "  input {0}in;".format(range_decl(WIDTH)),
        "  output {0}out;".format(range_decl(WIDTH)),
    ]


def footer():
    return ["endmodule", ""]


def module_header(module):
    return [
        "module {0}(in, out);".format(module),
        "  input {0}in;".format(range_decl(WIDTH)),
        "  output {0}out;".format(range_decl(WIDTH)),
        "  wire sign = in[15];",
        "  wire [{0}:0] exp = in[14:{1}];".format(EXP_BITS - 1, MANT_BITS),
        "  wire [{0}:0] mant = in[{0}:0];".format(MANT_BITS - 1),
        "  wire [{0}:0] sign_exp = in[15:{1}];".format(EXP_BITS, MANT_BITS),
        "  wire [14:0] mag = in[14:0];",
    ]


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


def relation_value_for_model(name, mag, pos, index):
    if name == "same_pos":
        return pos
    if name == "sign_flip_pos":
        return pos ^ 0x8000
    if name == "nan":
        return CANONICAL_NAN
    if name == "zero":
        return 0x0000
    if name == "neg_zero":
        return 0x8000
    if name == "pos_inf":
        return 0x7C00
    if name == "neg_inf":
        return 0xFC00
    if name == "one":
        return 0x3C00
    if name == "input":
        return index
    if name == "abs_input":
        return mag
    if name == "sign_flip_input":
        return index ^ 0x8000
    raise RuntimeError("unknown relation: {0}".format(name))


def relation_expr(name):
    if name == "same_pos":
        return "pos_out"
    if name == "sign_flip_pos":
        return "pos_out ^ 16'h8000"
    if name == "nan":
        return const_word(16, CANONICAL_NAN)
    if name == "zero":
        return "16'h0000"
    if name == "neg_zero":
        return "16'h8000"
    if name == "pos_inf":
        return "16'h7c00"
    if name == "neg_inf":
        return "16'hfc00"
    if name == "one":
        return "16'h3c00"
    if name == "input":
        return "in"
    if name == "abs_input":
        return "{1'b0, mag}"
    if name == "sign_flip_input":
        return "in ^ 16'h8000"
    raise RuntimeError("unknown relation: {0}".format(name))


def choose_relation(outputs):
    names = [
        "same_pos",
        "sign_flip_pos",
        "nan",
        "zero",
        "neg_zero",
        "pos_inf",
        "neg_inf",
        "one",
        "input",
        "abs_input",
        "sign_flip_input",
    ]
    scored = []
    for name in names:
        matches = 0
        for mag in range(MAG_SIZE):
            if relation_value_for_model(name, mag, outputs[mag], mag | 0x8000) == outputs[mag | 0x8000]:
                matches += 1
        scored.append((matches, name))
    scored.sort(key=lambda item: (-item[0], item[1]))
    relation = scored[0][1]
    exceptions = {
        mag: outputs[mag | 0x8000]
        for mag in range(MAG_SIZE)
        if relation_value_for_model(relation, mag, outputs[mag], mag | 0x8000) != outputs[mag | 0x8000]
    }
    return relation, exceptions, scored[0][0]


def default_expr_value(name, index):
    sign = (index >> 15) & 1
    mag = index & 0x7FFF
    if name == "zero":
        return 0x0000
    if name == "neg_zero":
        return 0x8000
    if name == "nan":
        return CANONICAL_NAN
    if name == "pos_inf":
        return 0x7C00
    if name == "neg_inf":
        return 0xFC00
    if name == "one":
        return 0x3C00
    if name == "input":
        return index
    if name == "abs_input":
        return mag
    if name == "sign_flip_input":
        return index ^ 0x8000
    if name == "sign_zero":
        return 0x8000 if sign else 0x0000
    if name == "sign_inf":
        return 0xFC00 if sign else 0x7C00
    raise RuntimeError("unknown default expression: {0}".format(name))


def default_expr_verilog(name):
    if name == "zero":
        return "16'h0000"
    if name == "neg_zero":
        return "16'h8000"
    if name == "nan":
        return const_word(16, CANONICAL_NAN)
    if name == "pos_inf":
        return "16'h7c00"
    if name == "neg_inf":
        return "16'hfc00"
    if name == "one":
        return "16'h3c00"
    if name == "input":
        return "in"
    if name == "abs_input":
        return "{1'b0, in[14:0]}"
    if name == "sign_flip_input":
        return "in ^ 16'h8000"
    if name == "sign_zero":
        return "{in[15], 15'h0000}"
    if name == "sign_inf":
        return "{in[15], 5'h1f, 10'h000}"
    raise RuntimeError("unknown default expression: {0}".format(name))


def choose_default_expr_for_indices(outputs, indices):
    scored = []
    for name in DEFAULT_EXPR_NAMES:
        matches = 0
        for index in indices:
            if default_expr_value(name, index) == outputs[index]:
                matches += 1
        scored.append((matches, name))
    scored.sort(key=lambda item: (-item[0], item[1]))
    return scored[0][1], scored[0][0]


def choose_mode(values):
    counts = {}
    first_index = {}
    for index, value in enumerate(values):
        counts[value] = counts.get(value, 0) + 1
        first_index.setdefault(value, index)
    return min(counts, key=lambda value: (-counts[value], first_index[value], value))


def render_value_case(outputs, module):
    lines = header(module)
    lines.extend(["  reg [15:0] out_r;", "  always @* begin", "    case (in)"])
    for index, value in enumerate(outputs):
        lines.append("      {0}: out_r = {1};".format(const_word(16, index), const_word(16, value)))
    lines.extend(["      default: out_r = 16'h0000;", "    endcase", "  end", "  assign out = out_r;"])
    lines.extend(footer())
    return "\n".join(lines), str(len(outputs)), lambda index: outputs[index]


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
        lines.append(
            "      {0}: pair = {1};".format(
                const_word(15, mag),
                const_word(32, (negative << 16) | positive),
            )
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

    def model(index):
        positive, negative = pairs[index & 0x7FFF]
        return negative if index & 0x8000 else positive

    return "\n".join(lines), str(MAG_SIZE), model


def render_exp_mant_pair_case(outputs, module):
    pairs = output_pairs(outputs)
    lines = module_header(module)
    lines.extend(["  reg [31:0] pair;", "  always @* begin", "    case (exp)"])
    items = 0
    for exp in range(1 << EXP_BITS):
        exp_pairs = [pairs[(exp << MANT_BITS) | mant] for mant in range(MANT_SIZE)]
        if len(set(exp_pairs)) == 1:
            positive, negative = exp_pairs[0]
            lines.append(
                "      {0}: pair = {1};".format(
                    const_word(EXP_BITS, exp),
                    const_word(32, (negative << 16) | positive),
                )
            )
            items += 1
            continue
        lines.append("      {0}: begin".format(const_word(EXP_BITS, exp)))
        lines.append("        case (mant)")
        for mant, (positive, negative) in enumerate(exp_pairs):
            lines.append(
                "          {0}: pair = {1};".format(
                    const_word(MANT_BITS, mant),
                    const_word(32, (negative << 16) | positive),
                )
            )
            items += 1
        lines.extend(["          default: pair = 32'h00000000;", "        endcase", "      end"])
    lines.extend(["      default: pair = 32'h00000000;", "    endcase", "  end"])
    lines.append("  assign out = sign ? pair[31:16] : pair[15:0];")
    lines.extend(footer())

    def model(index):
        positive, negative = pairs[index & 0x7FFF]
        return negative if index & 0x8000 else positive

    return "\n".join(lines), str(items), model


def render_sign_exp_mant_case(outputs, module):
    lines = module_header(module)
    lines.extend(["  reg [15:0] out_r;", "  always @* begin", "    case (sign_exp)"])
    items = 0
    for sign_exp in range(1 << (EXP_BITS + 1)):
        base = sign_exp << MANT_BITS
        values = [outputs[base | mant] for mant in range(MANT_SIZE)]
        if len(set(values)) == 1:
            lines.append("      {0}: out_r = {1};".format(const_word(EXP_BITS + 1, sign_exp), const_word(16, values[0])))
            items += 1
            continue
        lines.append("      {0}: begin".format(const_word(EXP_BITS + 1, sign_exp)))
        lines.append("        case (mant)")
        for mant, value in enumerate(values):
            lines.append("          {0}: out_r = {1};".format(const_word(MANT_BITS, mant), const_word(16, value)))
            items += 1
        lines.extend(["          default: out_r = 16'h0000;", "        endcase", "      end"])
    lines.extend(["      default: out_r = 16'h0000;", "    endcase", "  end", "  assign out = out_r;"])
    lines.extend(footer())
    return "\n".join(lines), str(items), lambda index: outputs[index]


def render_split_sign_exp_mant_case(outputs, module):
    lines = module_header(module)
    lines.extend(["  reg [15:0] out_r;", "  always @* begin", "    if (sign) begin", "      case (exp)"])
    items = 0
    for sign_value in (1, 0):
        if sign_value == 0:
            lines.extend(["        default: out_r = 16'h0000;", "      endcase", "    end else begin", "      case (exp)"])
        for exp in range(1 << EXP_BITS):
            base = (sign_value << 15) | (exp << MANT_BITS)
            values = [outputs[base | mant] for mant in range(MANT_SIZE)]
            indent = "        "
            if len(set(values)) == 1:
                lines.append("{0}{1}: out_r = {2};".format(indent, const_word(EXP_BITS, exp), const_word(16, values[0])))
                items += 1
                continue
            lines.append("{0}{1}: begin".format(indent, const_word(EXP_BITS, exp)))
            lines.append("{0}  case (mant)".format(indent))
            for mant, value in enumerate(values):
                lines.append("{0}    {1}: out_r = {2};".format(indent, const_word(MANT_BITS, mant), const_word(16, value)))
                items += 1
            lines.extend(["{0}    default: out_r = 16'h0000;".format(indent), "{0}  endcase".format(indent), "{0}end".format(indent)])
    lines.extend(["        default: out_r = 16'h0000;", "      endcase", "    end", "  end", "  assign out = out_r;"])
    lines.extend(footer())
    return "\n".join(lines), str(items), lambda index: outputs[index]


def render_exp_mant_delta_pair(outputs, module):
    pairs = output_pairs(outputs)
    bases = []
    deltas = []
    for exp in range(1 << EXP_BITS):
        exp_pairs = [pairs[(exp << MANT_BITS) | mant] for mant in range(MANT_SIZE)]
        base_pair = exp_pairs[0]
        bases.append(base_pair)
        deltas.append(
            [
                ((positive ^ base_pair[0]) & 0xFFFF, (negative ^ base_pair[1]) & 0xFFFF)
                for positive, negative in exp_pairs
            ]
        )

    lines = module_header(module)
    lines.extend(["  reg [31:0] base_pair;", "  reg [31:0] delta_pair;", "  always @* begin", "    case (exp)"])
    items = 0
    for exp, (positive, negative) in enumerate(bases):
        lines.append(
            "      {0}: base_pair = {1};".format(
                const_word(EXP_BITS, exp),
                const_word(32, (negative << 16) | positive),
            )
        )
        items += 1
    lines.extend(["      default: base_pair = 32'h00000000;", "    endcase", "  end", "  always @* begin", "    case (exp)"])
    for exp in range(1 << EXP_BITS):
        exp_deltas = deltas[exp]
        if len(set(exp_deltas)) == 1:
            positive, negative = exp_deltas[0]
            lines.append(
                "      {0}: delta_pair = {1};".format(
                    const_word(EXP_BITS, exp),
                    const_word(32, (negative << 16) | positive),
                )
            )
            items += 1
            continue
        lines.append("      {0}: begin".format(const_word(EXP_BITS, exp)))
        lines.append("        case (mant)")
        for mant, (positive, negative) in enumerate(exp_deltas):
            lines.append(
                "          {0}: delta_pair = {1};".format(
                    const_word(MANT_BITS, mant),
                    const_word(32, (negative << 16) | positive),
                )
            )
            items += 1
        lines.extend(["          default: delta_pair = 32'h00000000;", "        endcase", "      end"])
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

    def model(index):
        positive, negative = pairs[index & 0x7FFF]
        return negative if index & 0x8000 else positive

    return "\n".join(lines), str(items), model


def render_negative_exceptions(lines, exceptions, target):
    if not exceptions:
        return 0
    items = 0
    lines.append("    case (exp)")
    for exp in range(1 << EXP_BITS):
        exp_items = [(mant, exceptions[(exp << MANT_BITS) | mant]) for mant in range(MANT_SIZE) if ((exp << MANT_BITS) | mant) in exceptions]
        if not exp_items:
            continue
        if len(exp_items) == MANT_SIZE and len(set(value for mant, value in exp_items)) == 1:
            lines.append("      {0}: {1} = {2};".format(const_word(EXP_BITS, exp), target, const_word(16, exp_items[0][1])))
            items += 1
            continue
        lines.append("      {0}: begin".format(const_word(EXP_BITS, exp)))
        lines.append("        case (mant)")
        for mant, value in exp_items:
            lines.append("          {0}: {1} = {2};".format(const_word(MANT_BITS, mant), target, const_word(16, value)))
            items += 1
        lines.extend(["          default: begin end", "        endcase", "      end"])
    lines.extend(["      default: begin end", "    endcase"])
    return items


def render_positive_lookup(lines, name, values, use_delta):
    items = 0
    if use_delta:
        bases = []
        deltas = []
        for exp in range(1 << EXP_BITS):
            exp_values = [values[(exp << MANT_BITS) | mant] for mant in range(MANT_SIZE)]
            base = exp_values[0]
            bases.append(base)
            deltas.append([(value ^ base) & 0xFFFF for value in exp_values])
        lines.extend(
            [
                "  reg [15:0] {0}_base;".format(name),
                "  reg [15:0] {0}_delta;".format(name),
                "  wire [15:0] {0} = {0}_base ^ {0}_delta;".format(name),
                "  always @* begin",
                "    case (exp)",
            ]
        )
        for exp, base in enumerate(bases):
            lines.append("      {0}: {1}_base = {2};".format(const_word(EXP_BITS, exp), name, const_word(16, base)))
            items += 1
        lines.extend(["      default: {0}_base = 16'h0000;".format(name), "    endcase", "  end", "  always @* begin", "    case (exp)"])
        table = deltas
        target = "{0}_delta".format(name)
    else:
        lines.extend(["  reg [15:0] {0};".format(name), "  always @* begin", "    case (exp)"])
        table = []
        for exp in range(1 << EXP_BITS):
            table.append([values[(exp << MANT_BITS) | mant] for mant in range(MANT_SIZE)])
        target = name

    for exp in range(1 << EXP_BITS):
        exp_values = table[exp]
        if len(set(exp_values)) == 1:
            lines.append("      {0}: {1} = {2};".format(const_word(EXP_BITS, exp), target, const_word(16, exp_values[0])))
            items += 1
            continue
        lines.append("      {0}: begin".format(const_word(EXP_BITS, exp)))
        lines.append("        case (mant)")
        for mant, value in enumerate(exp_values):
            lines.append("          {0}: {1} = {2};".format(const_word(MANT_BITS, mant), target, const_word(16, value)))
            items += 1
        lines.extend(["          default: {0} = 16'h0000;".format(target), "        endcase", "      end"])
    lines.extend(["      default: {0} = 16'h0000;".format(target), "    endcase", "  end"])
    return items


def render_positive_default_exp_mant(outputs, module, use_delta):
    positive = [outputs[mag] for mag in range(MAG_SIZE)]
    relation, exceptions, matches = choose_relation(outputs)
    lines = module_header(module)
    items = render_positive_lookup(lines, "pos_out", positive, use_delta)
    lines.extend(["  reg [15:0] neg_out;", "  always @* begin", "    neg_out = {0};".format(relation_expr(relation))])
    items += render_negative_exceptions(lines, exceptions, "neg_out")
    lines.extend(["  end", "  assign out = sign ? neg_out : pos_out;"])
    lines.extend(footer())

    def model(index):
        mag = index & 0x7FFF
        if index & 0x8000:
            return exceptions.get(mag, relation_value_for_model(relation, mag, outputs[mag], index))
        return outputs[mag]

    meta = "positive_entries={0}; relation={1}; relation_matches={2}; negative_exceptions={3}".format(
        items,
        relation,
        matches,
        len(exceptions),
    )
    return "\n".join(lines), meta, model


def render_default_expr_exception_case(outputs, module):
    default_name, matches = choose_default_expr_for_indices(outputs, range(len(outputs)))
    exceptions = [
        (index, value)
        for index, value in enumerate(outputs)
        if default_expr_value(default_name, index) != value
    ]
    lines = header(module)
    lines.extend(["  reg [15:0] out_r;", "  always @* begin", "    out_r = {0};".format(default_expr_verilog(default_name))])
    if exceptions:
        lines.append("    case (in)")
        for index, value in exceptions:
            lines.append("      {0}: out_r = {1};".format(const_word(16, index), const_word(16, value)))
        lines.extend(["      default: begin end", "    endcase"])
    lines.extend(["  end", "  assign out = out_r;"])
    lines.extend(footer())

    return (
        "\n".join(lines),
        "exceptions={0}; default={1}; matches={2}".format(len(exceptions), default_name, matches),
        lambda index: outputs[index],
    )


def render_sign_exp_default_expr_case(outputs, module):
    lines = module_header(module)
    lines.extend(["  reg [15:0] out_r;", "  always @* begin", "    out_r = 16'h0000;", "    case (sign_exp)"])
    exceptions_total = 0
    full_default_groups = 0
    default_counts = {}
    for sign_exp in range(1 << (EXP_BITS + 1)):
        base = sign_exp << MANT_BITS
        indices = [base | mant for mant in range(MANT_SIZE)]
        default_name, matches = choose_default_expr_for_indices(outputs, indices)
        default_counts[default_name] = default_counts.get(default_name, 0) + 1
        exceptions = [(mant, outputs[base | mant]) for mant in range(MANT_SIZE) if default_expr_value(default_name, base | mant) != outputs[base | mant]]
        exceptions_total += len(exceptions)
        if not exceptions:
            full_default_groups += 1
            lines.append("      {0}: out_r = {1};".format(const_word(EXP_BITS + 1, sign_exp), default_expr_verilog(default_name)))
            continue
        lines.append("      {0}: begin".format(const_word(EXP_BITS + 1, sign_exp)))
        lines.append("        out_r = {0};".format(default_expr_verilog(default_name)))
        lines.append("        case (mant)")
        for mant, value in exceptions:
            lines.append("          {0}: out_r = {1};".format(const_word(MANT_BITS, mant), const_word(16, value)))
        lines.extend(["          default: begin end", "        endcase", "      end"])
    lines.extend(["      default: begin end", "    endcase", "  end", "  assign out = out_r;"])
    lines.extend(footer())
    meta = "groups=64; full_default_groups={0}; exceptions={1}; defaults={2}".format(
        full_default_groups,
        exceptions_total,
        ",".join("{0}:{1}".format(name, default_counts[name]) for name in sorted(default_counts)),
    )
    return "\n".join(lines), meta, lambda index: outputs[index]


def render_sign_exp_field_defaults(outputs, module):
    lines = module_header(module)
    lines.extend(
        [
            "  reg out_sign;",
            "  reg [{0}:0] out_exp;".format(EXP_BITS - 1),
            "  reg [{0}:0] out_mant;".format(MANT_BITS - 1),
            "  always @* begin",
            "    out_sign = 1'b0;",
            "    out_exp = {0};".format(const_word(EXP_BITS, 0)),
            "    out_mant = {0};".format(const_word(MANT_BITS, 0)),
            "    case (sign_exp)",
        ]
    )
    exceptions_total = 0
    full_default_groups = 0
    for sign_exp in range(1 << (EXP_BITS + 1)):
        base = sign_exp << MANT_BITS
        values = [outputs[base | mant] for mant in range(MANT_SIZE)]
        default = choose_mode(values)
        exceptions = [(mant, value) for mant, value in enumerate(values) if value != default]
        lines.append("      {0}: begin".format(const_word(EXP_BITS + 1, sign_exp)))
        lines.append("        {0}".format(field_assign("out", default)))
        if not exceptions:
            full_default_groups += 1
        else:
            lines.append("        case (mant)")
            for mant, value in exceptions:
                lines.append("          {0}: begin {1} end".format(const_word(MANT_BITS, mant), field_assign("out", value)))
            lines.extend(["          default: begin end", "        endcase"])
        lines.append("      end")
        exceptions_total += len(exceptions)
    lines.extend(["      default: begin end", "    endcase", "  end", "  assign out = {out_sign, out_exp, out_mant};"])
    lines.extend(footer())
    meta = "groups=64; full_default_groups={0}; exceptions={1}".format(full_default_groups, exceptions_total)
    return "\n".join(lines), meta, lambda index: outputs[index]


def render_positive_field_defaults(outputs, module):
    relation, exceptions, matches = choose_relation(outputs)
    lines = module_header(module)
    lines.extend(
        [
            "  reg pos_sign;",
            "  reg [{0}:0] pos_exp;".format(EXP_BITS - 1),
            "  reg [{0}:0] pos_mant;".format(MANT_BITS - 1),
            "  wire [15:0] pos_out = {pos_sign, pos_exp, pos_mant};",
            "  always @* begin",
            "    pos_sign = 1'b0;",
            "    pos_exp = {0};".format(const_word(EXP_BITS, 0)),
            "    pos_mant = {0};".format(const_word(MANT_BITS, 0)),
            "    case (exp)",
        ]
    )
    positive_exceptions = 0
    full_default_groups = 0
    for exp in range(1 << EXP_BITS):
        base = exp << MANT_BITS
        values = [outputs[base | mant] for mant in range(MANT_SIZE)]
        default = choose_mode(values)
        differing = [(mant, value) for mant, value in enumerate(values) if value != default]
        lines.append("      {0}: begin".format(const_word(EXP_BITS, exp)))
        lines.append("        {0}".format(field_assign("pos", default)))
        if not differing:
            full_default_groups += 1
        else:
            lines.append("        case (mant)")
            for mant, value in differing:
                lines.append("          {0}: begin {1} end".format(const_word(MANT_BITS, mant), field_assign("pos", value)))
            lines.extend(["          default: begin end", "        endcase"])
        lines.append("      end")
        positive_exceptions += len(differing)
    lines.extend(["      default: begin end", "    endcase", "  end", "  reg [15:0] neg_out;", "  always @* begin", "    neg_out = {0};".format(relation_expr(relation))])
    render_negative_exceptions(lines, exceptions, "neg_out")
    lines.extend(["  end", "  assign out = sign ? neg_out : pos_out;"])
    lines.extend(footer())

    def model(index):
        mag = index & 0x7FFF
        if index & 0x8000:
            return exceptions.get(mag, relation_value_for_model(relation, mag, outputs[mag], index))
        return outputs[mag]

    meta = "positive_exp_groups=32; full_default_groups={0}; positive_exceptions={1}; relation={2}; negative_exceptions={3}".format(
        full_default_groups,
        positive_exceptions,
        relation,
        len(exceptions),
    )
    return "\n".join(lines), meta, model


def infer_base_table(outputs):
    table = []
    for exp in range(1 << EXP_BITS):
        out_exps = []
        for mant in range(MANT_SIZE):
            value = outputs[(exp << MANT_BITS) | mant]
            if output_is_normal(value):
                out_exps.append(output_fields(value)[1])
        table.append(choose_mode(out_exps) if out_exps else 0)
    return table


def render_base_table(lines, base_table):
    lines.extend(["  always @* begin", "    base_exp = 8'sd0;", "    case (exp)"])
    for exp, base in enumerate(base_table):
        lines.append("      {0}: base_exp = {1};".format(const_word(EXP_BITS, exp), signed_const(8, base)))
    lines.extend(["      default: begin end", "    endcase", "  end"])


def render_semantic_exp_delta_fields(outputs, module):
    base_table = infer_base_table(outputs)
    relation, exceptions, matches = choose_relation(outputs)
    pos_info = {}
    for mag in range(MAG_SIZE):
        exp = (mag >> MANT_BITS) & EXP_MAX
        value = outputs[mag]
        if output_is_normal(value):
            out_sign, out_exp, out_mant = output_fields(value)
            pos_info[mag] = ("normal", out_sign, out_exp - base_table[exp], out_mant, value)
        else:
            pos_info[mag] = ("special", 0, 0, 0, value)

    lines = module_header(module)
    lines.extend(
        [
            "  reg signed [7:0] base_exp;",
            "  reg pos_kind;",
            "  reg pos_sign;",
            "  reg signed [7:0] exp_delta;",
            "  reg [{0}:0] norm_mant;".format(MANT_BITS - 1),
            "  reg [15:0] pos_special;",
        ]
    )
    render_base_table(lines, base_table)
    lines.extend(
        [
            "  always @* begin",
            "    pos_kind = 1'b0;",
            "    pos_sign = 1'b0;",
            "    exp_delta = 8'sd0;",
            "    norm_mant = {0};".format(const_word(MANT_BITS, 0)),
            "    pos_special = 16'h0000;",
            "    case (mag)",
        ]
    )
    normal_entries = 0
    special_entries = 0
    for mag in range(MAG_SIZE):
        kind, out_sign, delta, out_mant, value = pos_info[mag]
        if kind == "normal":
            normal_entries += 1
            lines.append(
                "      {0}: begin pos_kind = 1'b0; pos_sign = 1'b{1}; exp_delta = {2}; norm_mant = {3}; end".format(
                    const_word(15, mag),
                    out_sign,
                    signed_const(8, delta),
                    const_word(MANT_BITS, out_mant),
                )
            )
        else:
            special_entries += 1
            lines.append("      {0}: begin pos_kind = 1'b1; pos_special = {1}; end".format(const_word(15, mag), const_word(16, value)))
    lines.extend(
        [
            "      default: begin end",
            "    endcase",
            "  end",
            "  wire signed [7:0] normal_exp_s = base_exp + exp_delta;",
            "  wire [15:0] normal_pos = {{pos_sign, normal_exp_s[{0}:0], norm_mant}};".format(EXP_BITS - 1),
            "  wire [15:0] pos_out = pos_kind ? pos_special : normal_pos;",
            "  reg [15:0] neg_out;",
            "  always @* begin",
            "    neg_out = {0};".format(relation_expr(relation)),
        ]
    )
    render_negative_exceptions(lines, exceptions, "neg_out")
    lines.extend(["  end", "  assign out = sign ? neg_out : pos_out;"])
    lines.extend(footer())

    def model(index):
        mag = index & 0x7FFF
        if index & 0x8000:
            return exceptions.get(mag, relation_value_for_model(relation, mag, outputs[mag], index))
        return outputs[mag]

    meta = "base=lookup_by_input_exp; positive_entries=32768; normal_entries={0}; special_entries={1}; relation={2}; negative_exceptions={3}".format(
        normal_entries,
        special_entries,
        relation,
        len(exceptions),
    )
    return "\n".join(lines), meta, model


def arith_base_exp(op, exp):
    if op == "recip":
        return 2 * EXP_BIAS - exp
    if op == "square":
        return 2 * exp - EXP_BIAS
    if op == "sqrt":
        return (exp + EXP_BIAS) // 2
    if op == "recip_square":
        return 3 * EXP_BIAS - 2 * exp
    if op == "recip_sqrt":
        return (3 * EXP_BIAS - exp) // 2
    if op == "cube":
        return 3 * exp - 2 * EXP_BIAS
    if op == "cbrt":
        return (exp + 2 * EXP_BIAS) // 3
    if op == "recip_cube":
        return 4 * EXP_BIAS - 3 * exp
    if op == "recip_cbrt":
        return (4 * EXP_BIAS - exp) // 3
    raise RuntimeError("unknown op: {0}".format(op))


def build_arith_table(op, outputs):
    mod = OP_MOD[op]
    table = {}
    for cls in range(mod):
        for mant in range(MANT_SIZE):
            table[(cls, mant)] = (0, 0)
    for exp in range(1, EXP_MAX):
        cls = exp % mod
        for mant in range(MANT_SIZE):
            value = outputs[(exp << MANT_BITS) | mant]
            if not output_is_normal(value):
                continue
            delta = output_fields(value)[1] - arith_base_exp(op, exp)
            out_mant = value & (MANT_SIZE - 1)
            key = (cls, mant)
            old = table.get(key)
            if old != (0, 0) and old != (delta, out_mant):
                raise RuntimeError("inconsistent arith mantissa table op={0} key={1}".format(op, key))
            table[key] = (delta, out_mant)
    return mod, table


def choose_mode(values):
    counts = {}
    first_seen = {}
    for index, value in enumerate(values):
        counts[value] = counts.get(value, 0) + 1
        first_seen.setdefault(value, index)
    return min(counts, key=lambda value: (-counts[value], first_seen[value], value))


def build_arith_table_with_exceptions(op, outputs):
    mod = OP_MOD[op]
    values_by_key = {}
    values_by_mag = {}
    for exp in range(1, EXP_MAX):
        cls = exp % mod
        for mant in range(MANT_SIZE):
            mag = (exp << MANT_BITS) | mant
            value = outputs[mag]
            if not output_is_normal(value):
                continue
            delta = output_fields(value)[1] - arith_base_exp(op, exp)
            out_mant = value & (MANT_SIZE - 1)
            key = (cls, mant)
            table_value = (delta, out_mant)
            values_by_key.setdefault(key, []).append(table_value)
            values_by_mag[mag] = (key, table_value, value)

    table = {}
    for cls in range(mod):
        for mant in range(MANT_SIZE):
            key = (cls, mant)
            table[key] = choose_mode(values_by_key.get(key, [(0, 0)]))

    normal_exceptions = {}
    for mag, (key, table_value, output_value) in values_by_mag.items():
        if table[key] != table_value:
            normal_exceptions[mag] = output_value
    return mod, table, normal_exceptions


def render_arith_base(lines, op):
    lines.extend(["  always @* begin", "    base_exp = 8'sd0;", "    exp_class = 2'd0;"])
    if op == "recip":
        lines.append("    base_exp = 8'sd30 - exp_s;")
    elif op == "square":
        lines.append("    base_exp = (exp_s <<< 1) - 8'sd15;")
    elif op == "sqrt":
        lines.append("    base_exp = (exp_s + 8'sd15) >>> 1;")
        lines.append("    exp_class = {1'b0, exp[0]};")
    elif op == "recip_square":
        lines.append("    base_exp = 8'sd45 - (exp_s <<< 1);")
    elif op == "recip_sqrt":
        lines.append("    base_exp = (8'sd45 - exp_s) >>> 1;")
        lines.append("    exp_class = {1'b0, exp[0]};")
    elif op == "cube":
        lines.append("    base_exp = (exp_s <<< 1) + exp_s - 8'sd30;")
    elif op == "recip_cube":
        lines.append("    base_exp = 8'sd60 - ((exp_s <<< 1) + exp_s);")
    elif op in ("cbrt", "recip_cbrt"):
        lines.append("    case (exp)")
        for exp in range(1 << EXP_BITS):
            lines.append(
                "      {0}: begin base_exp = {1}; exp_class = 2'd{2}; end".format(
                    const_word(EXP_BITS, exp),
                    signed_const(8, arith_base_exp(op, exp)),
                    exp % 3,
                )
            )
        lines.append("      default: begin end")
        lines.append("    endcase")
    else:
        raise RuntimeError("unknown op: {0}".format(op))
    lines.append("  end")


def render_arith_mant_table(lines, mod, table):
    key_width = MANT_BITS if mod == 1 else MANT_BITS + 2
    key_expr = "mant" if mod == 1 else "{exp_class, mant}"
    lines.extend(
        [
            "  always @* begin",
            "    exp_delta = 8'sd0;",
            "    norm_mant = {0};".format(const_word(MANT_BITS, 0)),
            "    case ({0})".format(key_expr),
        ]
    )
    entries = 0
    for cls in range(mod):
        for mant in range(MANT_SIZE):
            delta, out_mant = table[(cls, mant)]
            if delta == 0 and out_mant == 0:
                continue
            key = mant if mod == 1 else (cls << MANT_BITS) | mant
            lines.append(
                "      {0}: begin exp_delta = {1}; norm_mant = {2}; end".format(
                    const_word(key_width, key),
                    signed_const(8, delta),
                    const_word(MANT_BITS, out_mant),
                )
            )
            entries += 1
    lines.extend(["      default: begin end", "    endcase", "  end"])
    return entries


def render_positive_special_table(lines, outputs, extra_overrides=None):
    special = {}
    for mag in range(MAG_SIZE):
        value = outputs[mag]
        exp = (mag >> MANT_BITS) & EXP_MAX
        if exp == 0 or exp == EXP_MAX or not output_is_normal(value):
            special[mag] = value
    if extra_overrides:
        special.update(extra_overrides)
    lines.extend(
        [
            "  reg pos_is_special;",
            "  reg [15:0] pos_special;",
            "  always @* begin",
            "    pos_is_special = 1'b0;",
            "    pos_special = 16'h0000;",
            "    case (exp)",
        ]
    )
    items = 0
    for exp in range(1 << EXP_BITS):
        exp_items = [(mant, special[(exp << MANT_BITS) | mant]) for mant in range(MANT_SIZE) if ((exp << MANT_BITS) | mant) in special]
        if not exp_items:
            continue
        if len(exp_items) == MANT_SIZE and len(set(value for mant, value in exp_items)) == 1:
            lines.append("      {0}: begin pos_is_special = 1'b1; pos_special = {1}; end".format(const_word(EXP_BITS, exp), const_word(16, exp_items[0][1])))
            items += 1
            continue
        lines.append("      {0}: begin".format(const_word(EXP_BITS, exp)))
        lines.append("        case (mant)")
        for mant, value in exp_items:
            lines.append("          {0}: begin pos_is_special = 1'b1; pos_special = {1}; end".format(const_word(MANT_BITS, mant), const_word(16, value)))
            items += 1
        lines.extend(["          default: begin end", "        endcase", "      end"])
    lines.extend(["      default: begin end", "    endcase", "  end"])
    return items, special


def render_semantic_arith_fields(case, outputs, module, allow_normal_exceptions=False):
    op = CASE_OPS.get(case)
    if op is None:
        raise RuntimeError("{0} has no arithmetic semantic op".format(case))
    normal_exceptions = {}
    if allow_normal_exceptions:
        mod, table, normal_exceptions = build_arith_table_with_exceptions(op, outputs)
    else:
        mod, table = build_arith_table(op, outputs)
    relation, exceptions, matches = choose_relation(outputs)
    lines = module_header(module)
    lines.extend(
        [
            "  wire signed [7:0] exp_s = $signed({3'b000, exp});",
            "  reg signed [7:0] base_exp;",
            "  reg [1:0] exp_class;",
            "  reg signed [7:0] exp_delta;",
            "  reg [{0}:0] norm_mant;".format(MANT_BITS - 1),
        ]
    )
    render_arith_base(lines, op)
    entries = render_arith_mant_table(lines, mod, table)
    special_entries, special = render_positive_special_table(lines, outputs, normal_exceptions)
    lines.extend(
        [
            "  wire signed [7:0] norm_exp_s = base_exp + exp_delta;",
            "  wire [15:0] normal_pos = {{1'b0, norm_exp_s[{0}:0], norm_mant}};".format(EXP_BITS - 1),
            "  wire [15:0] pos_out = pos_is_special ? pos_special : normal_pos;",
            "  reg [15:0] neg_out;",
            "  always @* begin",
            "    neg_out = {0};".format(relation_expr(relation)),
        ]
    )
    render_negative_exceptions(lines, exceptions, "neg_out")
    lines.extend(["  end", "  assign out = sign ? neg_out : pos_out;"])
    lines.extend(footer())

    def model(index):
        sign = (index >> 15) & 1
        mag = index & 0x7FFF
        if sign:
            return exceptions.get(mag, relation_value_for_model(relation, mag, outputs[mag], index))
        if mag in special:
            return special[mag]
        exp = (mag >> MANT_BITS) & EXP_MAX
        mant = mag & (MANT_SIZE - 1)
        delta, out_mant = table[(exp % mod, mant)]
        out_exp = (arith_base_exp(op, exp) + delta) & EXP_MAX
        return (out_exp << MANT_BITS) | out_mant

    meta = "op={0}; table_keys={1}; normal_table_entries={2}; positive_normal_exceptions={3}; special_entries={4}; relation={5}; negative_exceptions={6}".format(
        op,
        mod * MANT_SIZE,
        entries,
        len(normal_exceptions),
        special_entries,
        relation,
        len(exceptions),
    )
    return "\n".join(lines), meta, model


def render_variant(case, outputs, module, variant):
    if variant == "value_case":
        return render_value_case(outputs, module)
    if variant == "sign_pair_case":
        return render_sign_pair_case(outputs, module)
    if variant == "exp_mant_pair_case":
        return render_exp_mant_pair_case(outputs, module)
    if variant == "sign_exp_mant_case":
        return render_sign_exp_mant_case(outputs, module)
    if variant == "split_sign_exp_mant_case":
        return render_split_sign_exp_mant_case(outputs, module)
    if variant == "exp_mant_delta_pair":
        return render_exp_mant_delta_pair(outputs, module)
    if variant == "positive_default_exp_mant_case":
        return render_positive_default_exp_mant(outputs, module, use_delta=False)
    if variant == "positive_default_exp_mant_delta":
        return render_positive_default_exp_mant(outputs, module, use_delta=True)
    if variant == "default_expr_exception_case":
        return render_default_expr_exception_case(outputs, module)
    if variant == "sign_exp_default_expr_case":
        return render_sign_exp_default_expr_case(outputs, module)
    if variant == "semantic_sign_exp_field_defaults":
        return render_sign_exp_field_defaults(outputs, module)
    if variant == "semantic_positive_field_defaults":
        return render_positive_field_defaults(outputs, module)
    if variant == "semantic_exp_delta_fields":
        return render_semantic_exp_delta_fields(outputs, module)
    if variant == "semantic_arith_fields":
        return render_semantic_arith_fields(case, outputs, module)
    if variant == "semantic_arith_fields_with_exceptions":
        return render_semantic_arith_fields(case, outputs, module, allow_normal_exceptions=True)
    raise RuntimeError("unknown variant: {0}".format(variant))


def variant_classification(variant):
    if variant in ("semantic_arith_fields", "semantic_arith_fields_with_exceptions"):
        return "semantic_exact"
    if variant.startswith("semantic_") or variant.endswith("_default_expr_case"):
        return "semantic_hybrid"
    return "structural_exact"


def verify_outputs(outputs, model):
    for index, expected in enumerate(outputs):
        actual = model(index)
        if actual != expected:
            return False, "first mismatch index={0} expected=0x{1:04x} actual=0x{2:04x}".format(index, expected, actual)
    return True, "exact Python model over {0} inputs".format(len(outputs))


def support_bits(outputs, input_width):
    support = []
    for bit in range(input_width):
        step = 1 << bit
        used = False
        for index in range(len(outputs)):
            other = index ^ step
            if other > index and outputs[index] != outputs[other]:
                used = True
                break
        if used:
            support.append(bit)
    return support


def metadata_row(case, table, outputs):
    counts = {"zero": 0, "subnormal": 0, "normal": 0, "inf": 0, "nan": 0}
    for value in outputs:
        counts[output_category(value)] += 1
    relation, exceptions, relation_matches = choose_relation(outputs)
    default_name, default_matches = choose_default_expr_for_indices(outputs, range(len(outputs)))
    identity_matches = sum(1 for index, value in enumerate(outputs) if value == index)
    abs_matches = sum(1 for index, value in enumerate(outputs) if value == (index & 0x7FFF))
    flip_matches = sum(1 for index, value in enumerate(outputs) if value == (index ^ 0x8000))
    sign_exp_full = 0
    for sign_exp in range(1 << (EXP_BITS + 1)):
        base = sign_exp << MANT_BITS
        if len(set(outputs[base | mant] for mant in range(MANT_SIZE))) == 1:
            sign_exp_full += 1
    positive_full = 0
    for exp in range(1 << EXP_BITS):
        base = exp << MANT_BITS
        if len(set(outputs[base | mant] for mant in range(MANT_SIZE))) == 1:
            positive_full += 1
    constants = ["out[{0}]={1}".format(bit, value) for bit, value in table.constant_bits()]
    samples = {
        "sample_zero": outputs[0x0000],
        "sample_neg_zero": outputs[0x8000],
        "sample_one": outputs[0x3C00],
        "sample_neg_one": outputs[0xBC00],
        "sample_two": outputs[0x4000],
        "sample_pos_inf": outputs[0x7C00],
        "sample_neg_inf": outputs[0xFC00],
        "sample_nan": outputs[0x7E01],
    }
    row = {
        "case": case,
        "hypothesis/function_guess": CASE_LABELS.get(case, "fp16_unknown"),
        "input_width": str(table.input_width),
        "output_width": str(table.output_width),
        "constant_bits": ";".join(constants),
        "support_bits": ",".join(str(bit) for bit in support_bits(outputs, table.input_width)),
        "output_zero": str(counts["zero"]),
        "output_subnormal": str(counts["subnormal"]),
        "output_normal": str(counts["normal"]),
        "output_inf": str(counts["inf"]),
        "output_nan": str(counts["nan"]),
        "sign_relation_best": relation,
        "sign_relation_matches": str(relation_matches),
        "identity_matches": str(identity_matches),
        "abs_matches": str(abs_matches),
        "sign_flip_input_matches": str(flip_matches),
        "global_default": default_name,
        "global_default_matches": str(default_matches),
        "sign_exp_full_default_groups": str(sign_exp_full),
        "positive_exp_full_default_groups": str(positive_full),
        "notes": "hypothesis inferred by ex220-ex239 order and FP16 shape",
    }
    for key, value in samples.items():
        row[key] = "0x{0:04x}".format(value)
    return row


def selected_variants(args, case):
    if args.variants is not None:
        variants = list(args.variants)
    elif args.variant_mode == "compact":
        variants = list(COMPACT_VARIANTS)
    else:
        variants = list(STRUCTURAL_VARIANTS)
    arith_variants = {"semantic_arith_fields", "semantic_arith_fields_with_exceptions"}
    if case in CASE_OPS and not arith_variants.intersection(variants):
        variants.insert(0, "semantic_arith_fields")
    if args.include_full_case and "value_case" not in variants:
        variants.append("value_case")
    if args.include_sign_pair and "sign_pair_case" not in variants:
        variants.append("sign_pair_case")
    return variants


def case_output_paths(args, case):
    case_dir = args.work_dir / case
    return {
        "verilog_dir": case_dir / "verilog",
        "aig_dir": case_dir / "aigs",
        "log_dir": case_dir / "logs",
        "manifest": case_dir / "manifest.json",
    }


def empty_row(case, candidate_id, label, variant, verilog_path, aig_path):
    return {
        "case": case,
        "candidate_id": candidate_id,
        "hypothesis/function_guess": label,
        "variant": variant,
        "verilog_path": rel_path(verilog_path) if verilog_path else "",
        "aig_path": rel_path(aig_path) if aig_path else "",
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
        "classification": variant_classification(variant),
        "notes": "",
    }


def run_case(args, case, refs):
    truth_path = args.benchmarks / "{0}.truth".format(case)
    table = TruthTable(truth_path)
    if table.input_width != WIDTH or table.output_width != WIDTH:
        raise RuntimeError("{0} is not a 16x16 FP16-shaped truth table".format(case))
    outputs = list(table.iter_outputs())
    label = CASE_LABELS.get(case, "fp16_unknown")
    paths = case_output_paths(args, case)
    rows = []
    manifest = {
        "case": case,
        "truth": rel_path(truth_path),
        "hypothesis/function_guess": label,
        "metadata": metadata_row(case, table, outputs),
        "attempted_hypotheses": [
            {
                "hypothesis": label,
                "result": "used as case-label semantic prior; exactness verified per emitted candidate",
            }
        ],
        "variants": [],
    }

    for variant in selected_variants(args, case):
        candidate_id = "{0}_{1}_{2}".format(case, label, variant)
        module = candidate_id
        verilog_path = paths["verilog_dir"] / "{0}.v".format(candidate_id)
        aig_path = paths["aig_dir"] / "{0}.aig".format(candidate_id)
        script_path = paths["log_dir"] / "{0}.ys".format(candidate_id)
        log_path = paths["log_dir"] / "{0}.yosys.log".format(candidate_id)
        row = empty_row(case, candidate_id, label, variant, verilog_path, aig_path)
        start = time.time()
        try:
            verilog, items, model = render_variant(case, outputs, module, variant)
            row["items"] = items
            verified, note = verify_outputs(outputs, model)
            row["verified_truth"] = "1" if verified else "0"
            row["notes"] = note
            write_text(verilog_path, verilog)
            if args.emit_only:
                row["notes"] = "emit-only; {0}".format(note)
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
                    parent_id=label,
                    source="ai_verilog",
                    tool_chain="yosys_fp16_frontend_{0}".format(variant),
                    aig_path=aig_path,
                    truth=truth_path,
                    abc=args.abc,
                    notes="{0} FP16 frontend candidate".format(row["classification"]),
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
        manifest["variants"].append(row)

    write_text(paths["manifest"], json.dumps(manifest, indent=2, sort_keys=True) + "\n")
    return rows, manifest["metadata"]


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
    parser = argparse.ArgumentParser(description="Generate verified FP16 unary RTL candidates.")
    parser.add_argument("--cases", type=parse_cases, default=parse_cases("ex220-ex239"))
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--work-dir", type=Path, default=ROOT / "student" / "work" / "reverse_fp16_semantic")
    parser.add_argument("--results", type=Path, default=ROOT / "student" / "results" / "fp16_semantic_candidates.csv")
    parser.add_argument("--best-results", type=Path, default=ROOT / "student" / "results" / "fp16_semantic_candidates_best.csv")
    parser.add_argument("--metadata", type=Path, default=ROOT / "student" / "results" / "fp16_semantic_metadata.csv")
    parser.add_argument("--reference", type=Path, default=ROOT / "reference_result.csv")
    parser.add_argument("--abc", type=Path, default=ROOT / "student" / "abc")
    parser.add_argument("--yosys", type=Path, default=ROOT / "student" / "tools" / "conda-env" / "bin" / "yosys")
    parser.add_argument("--timeout", type=int, default=900)
    parser.add_argument("--no-yosys-abc", action="store_true")
    parser.add_argument("--emit-only", action="store_true")
    parser.add_argument("--include-full-case", action="store_true")
    parser.add_argument("--include-sign-pair", action="store_true")
    parser.add_argument("--variants", type=parse_variant_list, default=None)
    parser.add_argument("--variant-mode", choices=("compact", "diverse"), default="diverse")
    return parser.parse_args(argv)


def main(argv=None):
    args = parse_args(argv)
    refs = load_reference(args.reference)
    rows = []
    metadata = []
    for case in args.cases:
        case_rows, meta = run_case(args, case, refs)
        rows.extend(case_rows)
        metadata.append(meta)
        best = best_rows(case_rows)
        if best:
            item = best[0]
            print(
                "{case}: best {variant} area={area} delay={delay} adp={adp} ref={ref} ratio={ratio}".format(
                    case=case,
                    variant=item["variant"],
                    area=item["area"],
                    delay=item["delay"],
                    adp=item["adp"],
                    ref=item["reference_adp"],
                    ratio=item["adp_ratio_to_reference"],
                )
            )
        else:
            failures = [row["variant"] + ":" + row["notes"][:80] for row in case_rows if row["notes"]]
            print("{0}: no verified equivalent candidate; tried {1}".format(case, "; ".join(failures[:3])), file=sys.stderr)

    best = best_rows(rows)
    write_csv(args.results, RESULT_FIELDNAMES, rows)
    write_csv(args.best_results, BEST_FIELDNAMES, best)
    write_csv(args.metadata, META_FIELDNAMES, metadata)
    print("Results: {0}".format(args.results))
    print("Best: {0}".format(args.best_results))
    print("Metadata: {0}".format(args.metadata))
    print("Rows: {0}".format(len(rows)))
    print("Best cases: {0}/{1}".format(len(best), len(args.cases)))
    return 0 if len(best) == len(args.cases) else 1


if __name__ == "__main__":
    raise SystemExit(main())
