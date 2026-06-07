#!/usr/bin/env python3
"""Deep semantic fixed-point candidates for FP16 log/log2 cases.

The candidates here model the positive normal kernel as:

    fixed_value = exponent_base(exp) + mantissa_log_correction(mant)

Then a small fixed-point to FP16 rounding block reassembles the output.  This is
frontend-only: Verilog emission, Yosys synthesis, ABC CEC, and ADP measurement.
"""

import argparse
import csv
import json
import math
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
from student.generators.fp16_semantic_search import (
    BEST_FIELDNAMES,
    CASE_LABELS,
    RESULT_FIELDNAMES,
    add_reference_columns,
    const_word,
    footer,
    load_reference,
    metadata_row,
    module_header,
    rel_path,
    verify_outputs,
    write_csv,
    write_text,
)


WIDTH = 16
EXP_BITS = 5
MANT_BITS = 10
MANT_SIZE = 1 << MANT_BITS
EXP_MAX = 31
EXP_BIAS = 15


FIXED_VARIANTS = {
    "ex224": [
        ("fixed_q18_calibrated_exc", 18, "round", "log2", True),
        ("fixed_q19_calibrated_exc", 19, "round", "log2", True),
        ("fixed_q20_calibrated", 20, "round", "log2", False),
        ("fixed_q21_calibrated", 21, "floor", "log2", False),
    ],
    "ex223": [
        ("fixed_q20_calibrated_exc", 20, "round", "ln", True),
        ("fixed_q21_calibrated", 21, "ceil", "ln", False),
        ("fixed_q22_calibrated", 22, "round", "ln", False),
        ("fixed_q23_calibrated", 23, "round", "ln", False),
    ],
    "ex225": [
        ("fixed_q20_calibrated_exc", 20, "round", "log10", True),
        ("fixed_q21_calibrated_exc", 21, "round", "log10", True),
        ("fixed_q22_calibrated", 22, "round", "log10", False),
    ],
}

BUCKET_VARIANTS = {
    "ex224": [
        ("bucket_q18_constexp_exc", 18, "round", "log2", True),
        ("bucket_q19_constexp_exc", 19, "round", "log2", True),
        ("bucket_q20_constexp", 20, "round", "log2", False),
    ],
    "ex223": [
        ("bucket_q20_constexp_exc", 20, "round", "ln", True),
        ("bucket_q21_constexp", 21, "ceil", "ln", False),
        ("bucket_q22_constexp", 22, "round", "ln", False),
    ],
    "ex225": [
        ("bucket_q20_constexp_exc", 20, "round", "log10", True),
        ("bucket_q21_constexp_exc", 21, "round", "log10", True),
    ],
}

SIGNSPLIT_VARIANTS = {
    "ex224": [
        ("signsplit_q18_exc", 18, "round", "log2", True),
        ("signsplit_q20", 20, "round", "log2", False),
    ],
    "ex223": [
        ("signsplit_q20_exc", 20, "round", "ln", True),
        ("signsplit_q22", 22, "round", "ln", False),
    ],
    "ex225": [
        ("signsplit_q20_exc", 20, "round", "log10", True),
        ("signsplit_q21_exc", 21, "round", "log10", True),
    ],
}


def signed_const(width, value):
    if value < 0:
        return "-{0}'sd{1}".format(width, -value)
    return "{0}'sd{1}".format(width, value)


def quantize(value, scale, mode):
    scaled = value * scale
    if mode == "floor":
        return int(math.floor(scaled))
    if mode == "ceil":
        return int(math.ceil(scaled))
    return int(round(scaled))


def round_shift_even(value, shift):
    if shift <= 0:
        return value << (-shift)
    quotient = value >> shift
    remainder = value & ((1 << shift) - 1)
    half = 1 << (shift - 1)
    if remainder > half or (remainder == half and (quotient & 1)):
        quotient += 1
    return quotient


def fixed_to_fp16(qvalue, frac_bits):
    if qvalue == 0:
        return 0
    sign = 1 if qvalue < 0 else 0
    abs_q = -qvalue if qvalue < 0 else qvalue
    msb = abs_q.bit_length() - 1
    exp = msb - frac_bits + EXP_BIAS
    if exp <= 0:
        return sign << 15
    sig = round_shift_even(abs_q, msb - 10)
    if sig >= 2048:
        sig >>= 1
        exp += 1
    if exp >= EXP_MAX:
        return (sign << 15) | 0x7C00
    return (sign << 15) | (exp << 10) | ((sig - 1024) & 1023)


def nominal_q(case, mant, frac_bits, mode):
    x = 1.0 + mant / 1024.0
    if case == "ex224":
        func = math.log2
    elif case == "ex225":
        func = math.log10
    else:
        func = math.log
    return quantize(func(x), 1 << frac_bits, mode)


def base_q(case, exp, frac_bits):
    if case == "ex224":
        return (exp - EXP_BIAS) * (1 << frac_bits)
    if case == "ex225":
        log10_2_q = int(round(math.log10(2.0) * (1 << frac_bits)))
        return (exp - EXP_BIAS) * log10_2_q
    ln2_q = int(round(math.log(2.0) * (1 << frac_bits)))
    return (exp - EXP_BIAS) * ln2_q


def choose_q_table(case, outputs, frac_bits, mode, search_span=256):
    q_table = []
    adjusted = []
    failed = []
    for mant in range(MANT_SIZE):
        nominal = nominal_q(case, mant, frac_bits, mode)
        choices = []
        for qvalue in range(nominal - search_span, nominal + search_span + 1):
            good = True
            for exp in range(1, EXP_MAX):
                expected = outputs[(exp << MANT_BITS) | mant]
                actual = fixed_to_fp16(base_q(case, exp, frac_bits) + qvalue, frac_bits)
                if actual != expected:
                    good = False
                    break
            if good:
                choices.append(qvalue)
        if choices:
            chosen = min(choices, key=lambda item: abs(item - nominal))
            q_table.append(chosen)
            if chosen != nominal:
                adjusted.append((mant, nominal, chosen))
        else:
            q_table.append(nominal)
            failed.append(mant)
    return q_table, adjusted, failed


def build_model(case, outputs, frac_bits, q_table, allow_exceptions):
    exceptions = {}
    for exp in range(1, EXP_MAX):
        for mant in range(MANT_SIZE):
            index = (exp << MANT_BITS) | mant
            actual = fixed_to_fp16(base_q(case, exp, frac_bits) + q_table[mant], frac_bits)
            expected = outputs[index]
            if actual != expected:
                exceptions[(exp, mant)] = expected
    if exceptions and not allow_exceptions:
        raise RuntimeError("semantic fixed-point model has {0} mismatches".format(len(exceptions)))

    def model(index):
        sign = (index >> 15) & 1
        exp = (index >> MANT_BITS) & EXP_MAX
        mant = index & (MANT_SIZE - 1)
        if exp == 0:
            return 0xFC00
        if sign:
            return 0x7E00
        if exp == EXP_MAX:
            return 0x7C00 if mant == 0 else 0x7E00
        if (exp, mant) in exceptions:
            return exceptions[(exp, mant)]
        return fixed_to_fp16(base_q(case, exp, frac_bits) + q_table[mant], frac_bits)

    return model, exceptions


def verilog_round_sig(abs_name, shift, width):
    if shift <= 0:
        expr = "({0} << {1})".format(abs_name, -shift)
        return expr
    base = "({0} >> {1})".format(abs_name, shift)
    guard = "{0}[{1}]".format(abs_name, shift - 1)
    if shift == 1:
        sticky = "1'b0"
    else:
        sticky = "|{0}[{1}:0]".format(abs_name, shift - 2)
    lsb = "{0}[{1}]".format(abs_name, shift)
    return "({0} + ({1} & ({2} | {3})))".format(base, guard, sticky, lsb)


def render_fixed_candidate(case, outputs, module, variant_name, frac_bits, mode, allow_exceptions):
    q_table, adjusted, failed = choose_q_table(case, outputs, frac_bits, mode)
    model, exceptions = build_model(case, outputs, frac_bits, q_table, allow_exceptions)
    q_width = frac_bits + 1
    total_width = frac_bits + 7
    lines = module_header(module)
    lines.extend(
        [
            "  reg signed [{0}:0] base_q;".format(total_width - 1),
            "  reg [{0}:0] frac_q;".format(q_width - 1),
            "  always @* begin",
            "    case (exp)",
        ]
    )
    for exp in range(1, EXP_MAX):
        lines.append(
            "      {0}: base_q = {1};".format(
                const_word(EXP_BITS, exp),
                signed_const(total_width, base_q(case, exp, frac_bits)),
            )
        )
    lines.extend(["      default: base_q = {0};".format(signed_const(total_width, 0)), "    endcase", "  end"])
    lines.extend(["  always @* begin", "    case (mant)"])
    for mant, qvalue in enumerate(q_table):
        lines.append("      {0}: frac_q = {1};".format(const_word(MANT_BITS, mant), const_word(q_width, qvalue)))
    lines.extend(["      default: frac_q = {0};".format(const_word(q_width, 0)), "    endcase", "  end"])
    extend_width = total_width - q_width
    lines.extend(
        [
            "  wire signed [{0}:0] q_total = base_q + $signed({{{1}'b0, frac_q}});".format(total_width - 1, extend_width),
            "  wire q_neg = q_total[{0}];".format(total_width - 1),
            "  wire [{0}:0] q_abs = q_neg ? (~q_total + {1}) : q_total;".format(
                total_width - 1,
                const_word(total_width, 1),
            ),
            "  reg [5:0] msb;",
            "  always @* begin",
        ]
    )
    for bit in range(total_width - 1, -1, -1):
        prefix = "if" if bit == total_width - 1 else "else if"
        lines.append("    {0} (q_abs[{1}]) msb = 6'd{1};".format(prefix, bit))
    lines.extend(["    else msb = 6'd0;", "  end"])
    lines.extend(
        [
            "  reg [11:0] sig;",
            "  reg [4:0] norm_exp;",
            "  reg [9:0] norm_mant;",
            "  always @* begin",
            "    sig = 12'h000;",
            "    norm_exp = 5'h00;",
            "    norm_mant = 10'h000;",
            "    case (msb)",
        ]
    )
    for bit in range(total_width):
        exp_value = bit - frac_bits + EXP_BIAS
        if exp_value <= 0 or exp_value >= EXP_MAX:
            continue
        expr = verilog_round_sig("q_abs", bit - 10, total_width)
        lines.append("      6'd{0}: begin".format(bit))
        lines.append("        norm_exp = {0};".format(const_word(EXP_BITS, exp_value)))
        lines.append("        sig = {0};".format(expr))
        lines.append("      end")
    lines.extend(
        [
            "      default: begin end",
            "    endcase",
            "    if (sig[11]) begin",
            "      norm_exp = norm_exp + 5'h01;",
            "      norm_mant = sig[10:1];",
            "    end else begin",
            "      norm_mant = sig[9:0];",
            "    end",
            "  end",
            "  wire [15:0] semantic_out = (q_total == {0}) ? 16'h0000 : {{q_neg, norm_exp, norm_mant}};".format(signed_const(total_width, 0)),
            "  reg [15:0] out_r;",
            "  always @* begin",
            "    if (exp == 5'h00) out_r = 16'hfc00;",
            "    else if (sign) out_r = 16'h7e00;",
            "    else if (exp == 5'h1f) out_r = (mant == 10'h000) ? 16'h7c00 : 16'h7e00;",
            "    else begin",
            "      out_r = semantic_out;",
        ]
    )
    if exceptions:
        lines.append("      case ({exp, mant})")
        for (exp, mant), value in sorted(exceptions.items()):
            key = (exp << MANT_BITS) | mant
            lines.append("        {0}: out_r = {1};".format(const_word(EXP_BITS + MANT_BITS, key), const_word(16, value)))
        lines.extend(["        default: begin end", "      endcase"])
    lines.extend(["    end", "  end", "  assign out = out_r;"])
    lines.extend(footer())
    meta = "frac_bits={0}; mode={1}; adjusted_q={2}; failed_q={3}; exceptions={4}".format(
        frac_bits,
        mode,
        len(adjusted),
        len(failed),
        len(exceptions),
    )
    return "\n".join(lines), meta, model


def output_exp_groups(outputs):
    const_groups = {}
    table_groups = []
    for exp in range(1, EXP_MAX):
        values = [outputs[(exp << MANT_BITS) | mant] for mant in range(MANT_SIZE)]
        signs = {(value >> 15) & 1 for value in values}
        exps = {(value >> MANT_BITS) & EXP_MAX for value in values}
        if len(signs) == 1 and len(exps) == 1 and 0 not in exps and EXP_MAX not in exps:
            const_groups[exp] = (next(iter(signs)), next(iter(exps)))
        else:
            table_groups.append(exp)
    return const_groups, table_groups


def verilog_round_sig_from_abs(abs_name, shift):
    return verilog_round_sig(abs_name, shift, 0)


def render_bucket_candidate(case, outputs, module, variant_name, frac_bits, mode, allow_exceptions):
    q_table, adjusted, failed = choose_q_table(case, outputs, frac_bits, mode)
    model, fixed_exceptions = build_model(case, outputs, frac_bits, q_table, True)
    const_groups, table_groups = output_exp_groups(outputs)
    q_width = frac_bits + 1
    total_width = frac_bits + 7

    bucket_exceptions = {}
    for exp, (out_sign, out_exp) in const_groups.items():
        unbiased = out_exp - EXP_BIAS
        shift = unbiased + frac_bits - 10
        for mant in range(MANT_SIZE):
            if exp < EXP_BIAS:
                abs_q = -base_q(case, exp, frac_bits) - q_table[mant]
            else:
                abs_q = base_q(case, exp, frac_bits) + q_table[mant]
            sig = round_shift_even(abs_q, shift)
            if sig >= 2048:
                actual = (out_sign << 15) | ((out_exp + 1) << 10)
            else:
                actual = (out_sign << 15) | (out_exp << 10) | (sig & 1023)
            expected = outputs[(exp << MANT_BITS) | mant]
            if actual != expected:
                bucket_exceptions[(exp, mant)] = expected
    if bucket_exceptions and not allow_exceptions:
        raise RuntimeError("bucket model has {0} mismatches".format(len(bucket_exceptions)))

    def bucket_model(index):
        sign = (index >> 15) & 1
        exp = (index >> MANT_BITS) & EXP_MAX
        mant = index & (MANT_SIZE - 1)
        if exp == 0:
            return 0xFC00
        if sign:
            return 0x7E00
        if exp == EXP_MAX:
            return 0x7C00 if mant == 0 else 0x7E00
        if exp in table_groups:
            return outputs[index]
        if (exp, mant) in bucket_exceptions:
            return bucket_exceptions[(exp, mant)]
        out_sign, out_exp = const_groups[exp]
        unbiased = out_exp - EXP_BIAS
        shift = unbiased + frac_bits - 10
        if exp < EXP_BIAS:
            abs_q = -base_q(case, exp, frac_bits) - q_table[mant]
        else:
            abs_q = base_q(case, exp, frac_bits) + q_table[mant]
        sig = round_shift_even(abs_q, shift)
        if sig >= 2048:
            return (out_sign << 15) | ((out_exp + 1) << 10)
        return (out_sign << 15) | (out_exp << 10) | (sig & 1023)

    lines = module_header(module)
    lines.extend(["  reg [{0}:0] frac_q;".format(q_width - 1), "  always @* begin", "    case (mant)"])
    for mant, qvalue in enumerate(q_table):
        lines.append("      {0}: frac_q = {1};".format(const_word(MANT_BITS, mant), const_word(q_width, qvalue)))
    lines.extend(["      default: frac_q = {0};".format(const_word(q_width, 0)), "    endcase", "  end"])
    lines.extend(
        [
            "  reg [15:0] table_out;",
            "  reg table_sel;",
            "  reg out_sign_r;",
            "  reg [4:0] out_exp_r;",
            "  reg [{0}:0] abs_q_r;".format(total_width - 1),
            "  always @* begin",
            "    table_out = 16'h0000;",
            "    table_sel = 1'b0;",
            "    out_sign_r = 1'b0;",
            "    out_exp_r = 5'h00;",
            "    abs_q_r = {0};".format(const_word(total_width, 0)),
            "    case (exp)",
        ]
    )
    for exp in range(1, EXP_MAX):
        lines.append("      {0}: begin".format(const_word(EXP_BITS, exp)))
        if exp in table_groups:
            lines.append("        table_sel = 1'b1;")
            lines.append("        case (mant)")
            for mant in range(MANT_SIZE):
                value = outputs[(exp << MANT_BITS) | mant]
                lines.append("          {0}: table_out = {1};".format(const_word(MANT_BITS, mant), const_word(16, value)))
            lines.extend(["          default: table_out = 16'h0000;", "        endcase"])
        else:
            out_sign, out_exp = const_groups[exp]
            lines.append("        out_sign_r = 1'b{0};".format(out_sign))
            lines.append("        out_exp_r = {0};".format(const_word(EXP_BITS, out_exp)))
            if exp < EXP_BIAS:
                magnitude = -base_q(case, exp, frac_bits)
                lines.append("        abs_q_r = {0} - frac_q;".format(const_word(total_width, magnitude)))
            else:
                magnitude = base_q(case, exp, frac_bits)
                lines.append("        abs_q_r = {0} + frac_q;".format(const_word(total_width, magnitude)))
        lines.append("      end")
    lines.extend(["      default: begin end", "    endcase", "  end"])
    lines.extend(
        [
            "  reg [11:0] sig;",
            "  reg [9:0] mant_r;",
            "  always @* begin",
            "    sig = 12'h000;",
            "    case (out_exp_r)",
        ]
    )
    for out_exp in sorted({value[1] for value in const_groups.values()}):
        unbiased = out_exp - EXP_BIAS
        shift = unbiased + frac_bits - 10
        lines.append("      {0}: sig = {1};".format(const_word(EXP_BITS, out_exp), verilog_round_sig_from_abs("abs_q_r", shift)))
    lines.extend(
        [
            "      default: sig = 12'h000;",
            "    endcase",
            "    mant_r = sig[9:0];",
            "  end",
            "  reg [15:0] out_r;",
            "  always @* begin",
            "    if (exp == 5'h00) out_r = 16'hfc00;",
            "    else if (sign) out_r = 16'h7e00;",
            "    else if (exp == 5'h1f) out_r = (mant == 10'h000) ? 16'h7c00 : 16'h7e00;",
            "    else if (table_sel) out_r = table_out;",
            "    else begin",
            "      out_r = {out_sign_r, out_exp_r, mant_r};",
        ]
    )
    if bucket_exceptions:
        lines.append("      case ({exp, mant})")
        for (exp, mant), value in sorted(bucket_exceptions.items()):
            key = (exp << MANT_BITS) | mant
            lines.append("        {0}: out_r = {1};".format(const_word(EXP_BITS + MANT_BITS, key), const_word(16, value)))
        lines.extend(["        default: begin end", "      endcase"])
    lines.extend(["    end", "  end", "  assign out = out_r;"])
    lines.extend(footer())

    meta = "frac_bits={0}; mode={1}; adjusted_q={2}; failed_q={3}; table_exp_groups={4}; const_exp_groups={5}; exceptions={6}".format(
        frac_bits,
        mode,
        len(adjusted),
        len(failed),
        len(table_groups),
        len(const_groups),
        len(bucket_exceptions),
    )
    return "\n".join(lines), meta, bucket_model


def render_signsplit_candidate(case, outputs, module, variant_name, frac_bits, mode, allow_exceptions):
    q_table, adjusted, failed = choose_q_table(case, outputs, frac_bits, mode)
    model, exceptions = build_model(case, outputs, frac_bits, q_table, allow_exceptions)
    q_width = frac_bits + 1
    total_width = frac_bits + 7
    lines = module_header(module)
    lines.extend(["  reg [{0}:0] frac_q;".format(q_width - 1), "  always @* begin", "    case (mant)"])
    for mant, qvalue in enumerate(q_table):
        lines.append("      {0}: frac_q = {1};".format(const_word(MANT_BITS, mant), const_word(q_width, qvalue)))
    lines.extend(["      default: frac_q = {0};".format(const_word(q_width, 0)), "    endcase", "  end"])
    lines.extend(
        [
            "  reg q_neg;",
            "  reg [{0}:0] q_abs;".format(total_width - 1),
            "  always @* begin",
            "    q_neg = 1'b0;",
            "    q_abs = {0};".format(const_word(total_width, 0)),
            "    case (exp)",
        ]
    )
    for exp in range(1, EXP_MAX):
        bq = base_q(case, exp, frac_bits)
        lines.append("      {0}: begin".format(const_word(EXP_BITS, exp)))
        if exp < EXP_BIAS:
            lines.append("        q_neg = 1'b1;")
            lines.append("        q_abs = {0} - frac_q;".format(const_word(total_width, -bq)))
        else:
            lines.append("        q_neg = 1'b0;")
            lines.append("        q_abs = {0} + frac_q;".format(const_word(total_width, bq)))
        lines.append("      end")
    lines.extend(["      default: begin end", "    endcase", "  end"])
    lines.extend(
        [
            "  reg [5:0] msb;",
            "  always @* begin",
        ]
    )
    for bit in range(total_width - 1, -1, -1):
        prefix = "if" if bit == total_width - 1 else "else if"
        lines.append("    {0} (q_abs[{1}]) msb = 6'd{1};".format(prefix, bit))
    lines.extend(["    else msb = 6'd0;", "  end"])
    lines.extend(
        [
            "  reg [11:0] sig;",
            "  reg [4:0] norm_exp;",
            "  reg [9:0] norm_mant;",
            "  always @* begin",
            "    sig = 12'h000;",
            "    norm_exp = 5'h00;",
            "    norm_mant = 10'h000;",
            "    case (msb)",
        ]
    )
    for bit in range(total_width):
        exp_value = bit - frac_bits + EXP_BIAS
        if exp_value <= 0 or exp_value >= EXP_MAX:
            continue
        lines.append("      6'd{0}: begin".format(bit))
        lines.append("        norm_exp = {0};".format(const_word(EXP_BITS, exp_value)))
        lines.append("        sig = {0};".format(verilog_round_sig("q_abs", bit - 10, total_width)))
        lines.append("      end")
    lines.extend(
        [
            "      default: begin end",
            "    endcase",
            "    if (sig[11]) begin",
            "      norm_exp = norm_exp + 5'h01;",
            "      norm_mant = sig[10:1];",
            "    end else begin",
            "      norm_mant = sig[9:0];",
            "    end",
            "  end",
            "  wire [15:0] semantic_out = (q_abs == {0}) ? 16'h0000 : {{q_neg, norm_exp, norm_mant}};".format(const_word(total_width, 0)),
            "  reg [15:0] out_r;",
            "  always @* begin",
            "    if (exp == 5'h00) out_r = 16'hfc00;",
            "    else if (sign) out_r = 16'h7e00;",
            "    else if (exp == 5'h1f) out_r = (mant == 10'h000) ? 16'h7c00 : 16'h7e00;",
            "    else begin",
            "      out_r = semantic_out;",
        ]
    )
    if exceptions:
        lines.append("      case ({exp, mant})")
        for (exp, mant), value in sorted(exceptions.items()):
            key = (exp << MANT_BITS) | mant
            lines.append("        {0}: out_r = {1};".format(const_word(EXP_BITS + MANT_BITS, key), const_word(16, value)))
        lines.extend(["        default: begin end", "      endcase"])
    lines.extend(["    end", "  end", "  assign out = out_r;"])
    lines.extend(footer())
    meta = "frac_bits={0}; mode={1}; adjusted_q={2}; failed_q={3}; exceptions={4}; signsplit_abs=1".format(
        frac_bits,
        mode,
        len(adjusted),
        len(failed),
        len(exceptions),
    )
    return "\n".join(lines), meta, model


def classification(variant):
    return "semantic_hybrid" if variant.endswith("_exc") else "semantic_exact"


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
        "classification": classification(variant),
        "notes": "",
    }


def selected_variants(args, case):
    if args.variant_set == "fixed":
        return FIXED_VARIANTS[case]
    if args.variant_set == "bucket":
        return BUCKET_VARIANTS[case]
    if args.variant_set == "signsplit":
        return SIGNSPLIT_VARIANTS[case]
    return FIXED_VARIANTS[case] + BUCKET_VARIANTS[case] + SIGNSPLIT_VARIANTS[case]


def run_case(args, case, refs):
    truth_path = args.benchmarks / "{0}.truth".format(case)
    table = TruthTable(truth_path)
    outputs = list(table.iter_outputs())
    label = CASE_LABELS[case]
    case_dir = args.work_dir / case
    rows = []
    manifest = {
        "case": case,
        "truth": rel_path(truth_path),
        "hypothesis/function_guess": label,
        "metadata": metadata_row(case, table, outputs),
        "variants": [],
    }
    for variant, frac_bits, mode, kind, allow_exceptions in selected_variants(args, case):
        candidate_id = "{0}_{1}_{2}".format(case, label, variant)
        module = candidate_id
        verilog_path = case_dir / "verilog" / "{0}.v".format(candidate_id)
        aig_path = case_dir / "aigs" / "{0}.aig".format(candidate_id)
        script_path = case_dir / "logs" / "{0}.ys".format(candidate_id)
        log_path = case_dir / "logs" / "{0}.yosys.log".format(candidate_id)
        row = empty_row(case, candidate_id, label, variant, verilog_path, aig_path)
        start = time.time()
        try:
            if variant.startswith("bucket_"):
                verilog, items, model = render_bucket_candidate(
                    case, outputs, module, variant, frac_bits, mode, allow_exceptions
                )
            elif variant.startswith("signsplit_"):
                verilog, items, model = render_signsplit_candidate(
                    case, outputs, module, variant, frac_bits, mode, allow_exceptions
                )
            else:
                verilog, items, model = render_fixed_candidate(
                    case, outputs, module, variant, frac_bits, mode, allow_exceptions
                )
            row["items"] = items
            verified, note = verify_outputs(outputs, model)
            row["verified_truth"] = "1" if verified else "0"
            row["notes"] = note
            write_text(verilog_path, verilog)
            if verified:
                yosys_log = synthesize_verilog(
                    verilog=verilog_path,
                    module=module,
                    output=aig_path,
                    yosys=args.yosys,
                    timeout=args.timeout,
                    script_out=script_path,
                )
                write_text(log_path, yosys_log)
                row["synthesized"] = "1"
                evaluated = evaluate_aig(
                    case=case,
                    candidate_id=candidate_id,
                    parent_id=label,
                    source="ai_verilog",
                    tool_chain="yosys_fp16_log_deep_{0}".format(variant),
                    aig_path=aig_path,
                    truth=truth_path,
                    abc=args.abc,
                    notes="{0} FP16 fixed-point log semantic candidate; {1}".format(row["classification"], row["items"]),
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
        print("{0} {1} eq={2} adp={3} notes={4}".format(case, variant, row["equivalent"], row["adp"], row["notes"][:120]))
        sys.stdout.flush()
    write_text(case_dir / "manifest.json", json.dumps(manifest, indent=2, sort_keys=True) + "\n")
    return rows, manifest["metadata"]


def best_rows(rows):
    out = []
    for case in sorted({row["case"] for row in rows}):
        valid = [row for row in rows if row["case"] == case and row["equivalent"] == "1" and row["adp"]]
        if valid:
            best = min(valid, key=lambda row: int(row["adp"]))
            out.append({name: best.get(name, "") for name in BEST_FIELDNAMES})
    return out


def parse_args(argv=None):
    parser = argparse.ArgumentParser(description="Deep fixed-point FP16 log/log2 frontend candidates.")
    parser.add_argument("--work-dir", type=Path, required=True)
    parser.add_argument("--results", type=Path, required=True)
    parser.add_argument("--best-results", type=Path, required=True)
    parser.add_argument("--metadata", type=Path, required=True)
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--reference", type=Path, default=ROOT / "reference_result.csv")
    parser.add_argument("--yosys", type=Path, default=ROOT / "student" / "tools" / "conda-env" / "bin" / "yosys")
    parser.add_argument("--abc", type=Path, default=ROOT / "student" / "abc")
    parser.add_argument("--timeout", type=int, default=900)
    parser.add_argument("--variant-set", choices=["fixed", "bucket", "signsplit", "all"], default="all")
    parser.add_argument("--cases", default="ex223,ex224")
    return parser.parse_args(argv)


def main(argv=None):
    args = parse_args(argv)
    refs = load_reference(args.reference)
    rows = []
    metadata = []
    for case in [item.strip() for item in args.cases.split(",") if item.strip()]:
        case_rows, case_meta = run_case(args, case, refs)
        rows.extend(case_rows)
        metadata.append(case_meta)
    write_csv(args.results, RESULT_FIELDNAMES, rows)
    write_csv(args.best_results, BEST_FIELDNAMES, best_rows(rows))
    if metadata:
        write_csv(args.metadata, list(metadata[0].keys()), metadata)
    print("wrote {0}".format(args.results))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
