#!/usr/bin/env python3
"""Generate aggressive case-by-case semantic BF16 RTL candidates for ex200-ex219."""

import argparse
import csv
import hashlib
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

CASE_LABELS = {
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

CASE_OPS = {
    "ex211": "recip",
    "ex212": "square",
    "ex213": "sqrt",
    "ex214": "recip_square",
    "ex215": "recip_sqrt",
    "ex216": "cube",
    "ex217": "cbrt",
    "ex218": "recip_cube",
    "ex219": "recip_cbrt",
}

VARIANTS = [
    "semantic_field_reassembly",
    "semantic_sign_exp_field_defaults",
    "semantic_positive_symmetry_fields",
    "semantic_positive_field_defaults",
    "semantic_exp_delta_fields",
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


def parse_variant_list(value):
    variants = []
    seen = set()
    valid = set(VARIANTS)
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


def output_fields(value):
    return ((value >> 15) & 1, (value >> 7) & 0xFF, value & 0x7F)


def field_assign(prefix, value):
    sign, exp, mant = output_fields(value)
    return "{0}_sign = 1'b{1}; {0}_exp = {2}; {0}_mant = {3};".format(
        prefix,
        sign,
        const_word(8, exp),
        const_word(7, mant),
    )


def output_is_normal(value):
    exp = (value >> 7) & 0xFF
    return exp != 0 and exp != 0xFF


def write_text(path, text):
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w") as handle:
        handle.write(text)


def write_csv(path, fieldnames, rows):
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(rows)


def normalize_verilog(text):
    text = re.sub(r"\bmodule\s+[A-Za-z_][A-Za-z0-9_$]*\s*\(", "module MODULE(", text)
    return text.strip()


def text_hash(text):
    return hashlib.sha256(normalize_verilog(text).encode("utf-8")).hexdigest()


def load_dedupe(path):
    ids = set()
    hashes = set()
    if path is None or not path.is_file():
        return ids, hashes
    with path.open() as handle:
        for row in csv.DictReader(handle):
            candidate_id = row.get("candidate_id", "")
            if candidate_id:
                ids.add(candidate_id)
            verilog_path = row.get("verilog_path", "")
            if verilog_path:
                full = ROOT / verilog_path
                if full.is_file():
                    hashes.add(text_hash(full.read_text()))
    return ids, hashes


def choose_mode(values):
    counts = {}
    first_index = {}
    for index, value in enumerate(values):
        counts[value] = counts.get(value, 0) + 1
        first_index.setdefault(value, index)
    return min(counts, key=lambda value: (-counts[value], first_index[value], value))


def choose_relation(outputs):
    def rel_value(name, mag, pos):
        index = mag | 0x8000
        if name == "same_pos":
            return pos
        if name == "sign_flip_pos":
            return pos ^ 0x8000
        if name == "nan":
            return 0x7FC0
        if name == "zero":
            return 0x0000
        if name == "neg_zero":
            return 0x8000
        if name == "pos_inf":
            return 0x7F80
        if name == "neg_inf":
            return 0xFF80
        if name == "one":
            return 0x3F80
        if name == "input":
            return index
        if name == "abs_input":
            return mag
        if name == "sign_flip_input":
            return index ^ 0x8000
        raise RuntimeError("unknown relation: {0}".format(name))

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
        for mag in range(1 << 15):
            if rel_value(name, mag, outputs[mag]) == outputs[mag | 0x8000]:
                matches += 1
        scored.append((matches, name))
    scored.sort(key=lambda item: (-item[0], item[1]))
    relation = scored[0][1]
    exceptions = {
        mag: outputs[mag | 0x8000]
        for mag in range(1 << 15)
        if rel_value(relation, mag, outputs[mag]) != outputs[mag | 0x8000]
    }
    return relation, exceptions


def relation_expr(name):
    if name == "same_pos":
        return "pos_out"
    if name == "sign_flip_pos":
        return "pos_out ^ 16'h8000"
    if name == "nan":
        return "16'h7fc0"
    if name == "zero":
        return "16'h0000"
    if name == "neg_zero":
        return "16'h8000"
    if name == "pos_inf":
        return "16'h7f80"
    if name == "neg_inf":
        return "16'hff80"
    if name == "one":
        return "16'h3f80"
    if name == "input":
        return "in"
    if name == "abs_input":
        return "{1'b0, mag}"
    if name == "sign_flip_input":
        return "in ^ 16'h8000"
    raise RuntimeError("unknown relation: {0}".format(name))


def render_negative_exceptions(lines, exceptions, target):
    if not exceptions:
        return 0
    lines.append("    case (mag)")
    for mag, value in sorted(exceptions.items()):
        lines.append("      {0}: {1} = {2};".format(const_word(15, mag), target, const_word(16, value)))
    lines.extend(["      default: begin end", "    endcase"])
    return len(exceptions)


def verify_outputs(outputs, model):
    for index, expected in enumerate(outputs):
        actual = model(index)
        if actual != expected:
            return False, "first mismatch index={0} expected=0x{1:04x} actual=0x{2:04x}".format(
                index,
                expected,
                actual,
            )
    return True, "semantic RTL model exact over {0} inputs".format(len(outputs))


def module_header(module):
    return [
        "module {0}(in, out);".format(module),
        "  input {0}in;".format(range_decl(16)),
        "  output {0}out;".format(range_decl(16)),
        "  wire sign = in[15];",
        "  wire [7:0] exp = in[14:7];",
        "  wire [6:0] mant = in[6:0];",
        "  wire [8:0] sign_exp = in[15:7];",
        "  wire [14:0] mag = in[14:0];",
    ]


def render_field_reassembly(outputs, module):
    lines = module_header(module)
    lines.extend(
        [
            "  reg out_sign;",
            "  reg [7:0] out_exp;",
            "  reg [6:0] out_mant;",
            "  always @* begin",
            "    out_sign = 1'b0;",
            "    out_exp = 8'h00;",
            "    out_mant = 7'h00;",
            "    case (sign_exp)",
        ]
    )
    items = 0
    for sign_exp in range(512):
        base = sign_exp << 7
        lines.append("      {0}: begin".format(const_word(9, sign_exp)))
        lines.append("        case (mant)")
        for mant in range(128):
            value = outputs[base | mant]
            lines.append("          {0}: begin {1} end".format(const_word(7, mant), field_assign("out", value)))
            items += 1
        lines.extend(["          default: begin end", "        endcase", "      end"])
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
    return "\n".join(lines), str(items), lambda index: outputs[index]


def render_sign_exp_field_defaults(outputs, module):
    lines = module_header(module)
    lines.extend(
        [
            "  reg out_sign;",
            "  reg [7:0] out_exp;",
            "  reg [6:0] out_mant;",
            "  always @* begin",
            "    out_sign = 1'b0;",
            "    out_exp = 8'h00;",
            "    out_mant = 7'h00;",
            "    case (sign_exp)",
        ]
    )
    exceptions = 0
    full_default_groups = 0
    for sign_exp in range(512):
        base = sign_exp << 7
        values = [outputs[base | mant] for mant in range(128)]
        default = choose_mode(values)
        lines.append("      {0}: begin".format(const_word(9, sign_exp)))
        lines.append("        {0}".format(field_assign("out", default)))
        differing = [(mant, value) for mant, value in enumerate(values) if value != default]
        if not differing:
            full_default_groups += 1
        else:
            lines.append("        case (mant)")
            for mant, value in differing:
                lines.append("          {0}: begin {1} end".format(const_word(7, mant), field_assign("out", value)))
                exceptions += 1
            lines.extend(["          default: begin end", "        endcase"])
        lines.append("      end")
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
    items = "groups=512; full_default_groups={0}; exceptions={1}".format(full_default_groups, exceptions)
    return "\n".join(lines), items, lambda index: outputs[index]


def render_positive_symmetry_fields(outputs, module):
    relation, exceptions = choose_relation(outputs)
    lines = module_header(module)
    lines.extend(
        [
            "  reg pos_sign;",
            "  reg [7:0] pos_exp;",
            "  reg [6:0] pos_mant;",
            "  wire [15:0] pos_out = {pos_sign, pos_exp, pos_mant};",
            "  always @* begin",
            "    pos_sign = 1'b0;",
            "    pos_exp = 8'h00;",
            "    pos_mant = 7'h00;",
            "    case (mag)",
        ]
    )
    for mag in range(1 << 15):
        lines.append("      {0}: begin {1} end".format(const_word(15, mag), field_assign("pos", outputs[mag])))
    lines.extend(
        [
            "      default: begin end",
            "    endcase",
            "  end",
            "  reg [15:0] neg_out;",
            "  always @* begin",
            "    neg_out = {0};".format(relation_expr(relation)),
        ]
    )
    render_negative_exceptions(lines, exceptions, "neg_out")
    lines.extend(
        [
            "  end",
            "  assign out = sign ? neg_out : pos_out;",
            "endmodule",
            "",
        ]
    )

    def model(index):
        mag = index & 0x7FFF
        if index & 0x8000:
            return exceptions.get(mag, relation_value_for_model(relation, mag, outputs[mag], index))
        return outputs[mag]

    items = "positive_entries=32768; relation={0}; negative_exceptions={1}".format(relation, len(exceptions))
    return "\n".join(lines), items, model


def relation_value_for_model(name, mag, pos, index):
    if name == "same_pos":
        return pos
    if name == "sign_flip_pos":
        return pos ^ 0x8000
    if name == "nan":
        return 0x7FC0
    if name == "zero":
        return 0x0000
    if name == "neg_zero":
        return 0x8000
    if name == "pos_inf":
        return 0x7F80
    if name == "neg_inf":
        return 0xFF80
    if name == "one":
        return 0x3F80
    if name == "input":
        return index
    if name == "abs_input":
        return mag
    if name == "sign_flip_input":
        return index ^ 0x8000
    raise RuntimeError("unknown relation: {0}".format(name))


def render_positive_field_defaults(outputs, module):
    relation, exceptions = choose_relation(outputs)
    lines = module_header(module)
    lines.extend(
        [
            "  reg pos_sign;",
            "  reg [7:0] pos_exp;",
            "  reg [6:0] pos_mant;",
            "  wire [15:0] pos_out = {pos_sign, pos_exp, pos_mant};",
            "  always @* begin",
            "    pos_sign = 1'b0;",
            "    pos_exp = 8'h00;",
            "    pos_mant = 7'h00;",
            "    case (exp)",
        ]
    )
    pos_exceptions = 0
    full_default_groups = 0
    for exp in range(256):
        values = [outputs[(exp << 7) | mant] for mant in range(128)]
        default = choose_mode(values)
        lines.append("      {0}: begin".format(const_word(8, exp)))
        lines.append("        {0}".format(field_assign("pos", default)))
        differing = [(mant, value) for mant, value in enumerate(values) if value != default]
        if not differing:
            full_default_groups += 1
        else:
            lines.append("        case (mant)")
            for mant, value in differing:
                lines.append("          {0}: begin {1} end".format(const_word(7, mant), field_assign("pos", value)))
                pos_exceptions += 1
            lines.extend(["          default: begin end", "        endcase"])
        lines.append("      end")
    lines.extend(
        [
            "      default: begin end",
            "    endcase",
            "  end",
            "  reg [15:0] neg_out;",
            "  always @* begin",
            "    neg_out = {0};".format(relation_expr(relation)),
        ]
    )
    render_negative_exceptions(lines, exceptions, "neg_out")
    lines.extend(
        [
            "  end",
            "  assign out = sign ? neg_out : pos_out;",
            "endmodule",
            "",
        ]
    )

    def model(index):
        mag = index & 0x7FFF
        if index & 0x8000:
            return exceptions.get(mag, relation_value_for_model(relation, mag, outputs[mag], index))
        return outputs[mag]

    items = (
        "positive_exp_groups=256; full_default_groups={0}; positive_exceptions={1}; "
        "relation={2}; negative_exceptions={3}"
    ).format(full_default_groups, pos_exceptions, relation, len(exceptions))
    return "\n".join(lines), items, model


def arithmetic_base(op, exp):
    if op == "recip":
        return 254 - exp
    if op == "square":
        return 2 * exp - 127
    if op == "sqrt":
        return (exp + 127) // 2
    if op == "recip_square":
        return 381 - 2 * exp
    if op == "recip_sqrt":
        return (381 - exp) // 2
    if op == "cube":
        return 3 * exp - 254
    if op == "cbrt":
        return (exp + 254) // 3
    if op == "recip_cube":
        return 508 - 3 * exp
    if op == "recip_cbrt":
        return (508 - exp) // 3
    raise RuntimeError("unknown op: {0}".format(op))


def infer_base_table(case, outputs):
    op = CASE_OPS.get(case)
    if op is not None:
        return [arithmetic_base(op, exp) for exp in range(256)], "arith_{0}".format(op)
    table = []
    for exp in range(256):
        out_exps = []
        for mant in range(128):
            value = outputs[(exp << 7) | mant]
            if output_is_normal(value):
                out_exps.append((value >> 7) & 0xFF)
        table.append(choose_mode(out_exps) if out_exps else 0)
    return table, "lookup_by_input_exp"


def render_base_table(lines, base_table):
    lines.extend(
        [
            "  always @* begin",
            "    base_exp = 11'sd0;",
            "    case (exp)",
        ]
    )
    for exp, base in enumerate(base_table):
        lines.append("      {0}: base_exp = {1};".format(const_word(8, exp), signed_const(11, base)))
    lines.extend(["      default: begin end", "    endcase", "  end"])


def render_exp_delta_fields(case, outputs, module):
    base_table, base_kind = infer_base_table(case, outputs)
    relation, exceptions = choose_relation(outputs)
    pos_info = {}
    for mag in range(1 << 15):
        exp = (mag >> 7) & 0xFF
        value = outputs[mag]
        if output_is_normal(value):
            out_sign, out_exp, out_mant = output_fields(value)
            pos_info[mag] = ("normal", out_sign, out_exp - base_table[exp], out_mant, value)
        else:
            pos_info[mag] = ("special", 0, 0, 0, value)

    lines = module_header(module)
    lines.extend(
        [
            "  reg signed [10:0] base_exp;",
            "  reg pos_kind;",
            "  reg pos_sign;",
            "  reg signed [10:0] exp_delta;",
            "  reg [6:0] norm_mant;",
            "  reg [15:0] pos_special;",
        ]
    )
    render_base_table(lines, base_table)
    lines.extend(
        [
            "  always @* begin",
            "    pos_kind = 1'b0;",
            "    pos_sign = 1'b0;",
            "    exp_delta = 11'sd0;",
            "    norm_mant = 7'h00;",
            "    pos_special = 16'h0000;",
            "    case (mag)",
        ]
    )
    normal_entries = 0
    special_entries = 0
    for mag in range(1 << 15):
        kind, out_sign, delta, out_mant, value = pos_info[mag]
        if kind == "normal":
            normal_entries += 1
            lines.append(
                "      {0}: begin pos_kind = 1'b0; pos_sign = 1'b{1}; exp_delta = {2}; norm_mant = {3}; end".format(
                    const_word(15, mag),
                    out_sign,
                    signed_const(11, delta),
                    const_word(7, out_mant),
                )
            )
        else:
            special_entries += 1
            lines.append(
                "      {0}: begin pos_kind = 1'b1; pos_special = {1}; end".format(
                    const_word(15, mag),
                    const_word(16, value),
                )
            )
    lines.extend(
        [
            "      default: begin end",
            "    endcase",
            "  end",
            "  wire signed [10:0] normal_exp_s = base_exp + exp_delta;",
            "  wire [15:0] normal_pos = {pos_sign, normal_exp_s[7:0], norm_mant};",
            "  wire [15:0] pos_out = pos_kind ? pos_special : normal_pos;",
            "  reg [15:0] neg_out;",
            "  always @* begin",
            "    neg_out = {0};".format(relation_expr(relation)),
        ]
    )
    render_negative_exceptions(lines, exceptions, "neg_out")
    lines.extend(
        [
            "  end",
            "  assign out = sign ? neg_out : pos_out;",
            "endmodule",
            "",
        ]
    )

    def model(index):
        mag = index & 0x7FFF
        if index & 0x8000:
            return exceptions.get(mag, relation_value_for_model(relation, mag, outputs[mag], index))
        return outputs[mag]

    items = (
        "base={0}; positive_entries=32768; normal_entries={1}; special_entries={2}; "
        "relation={3}; negative_exceptions={4}"
    ).format(base_kind, normal_entries, special_entries, relation, len(exceptions))
    return "\n".join(lines), items, model


def render_variant(case, outputs, module, variant):
    if variant == "semantic_field_reassembly":
        return render_field_reassembly(outputs, module)
    if variant == "semantic_sign_exp_field_defaults":
        return render_sign_exp_field_defaults(outputs, module)
    if variant == "semantic_positive_symmetry_fields":
        return render_positive_symmetry_fields(outputs, module)
    if variant == "semantic_positive_field_defaults":
        return render_positive_field_defaults(outputs, module)
    if variant == "semantic_exp_delta_fields":
        return render_exp_delta_fields(case, outputs, module)
    raise RuntimeError("unknown variant: {0}".format(variant))


def case_output_paths(args, case):
    case_dir = args.work_dir / case
    return {
        "verilog_dir": case_dir / "verilog",
        "aig_dir": case_dir / "aigs",
        "log_dir": case_dir / "logs",
        "manifest": case_dir / "manifest.json",
    }


def run_case(args, case, dedupe_ids, dedupe_hashes, new_hashes):
    truth_path = args.benchmarks / "{0}.truth".format(case)
    table = TruthTable(truth_path)
    if table.input_width != 16 or table.output_width != 16:
        raise RuntimeError("{0} is not 16x16 BF16-shaped truth table".format(case))
    outputs = list(table.iter_outputs())
    label = CASE_LABELS.get(case, "bf16_unknown")
    paths = case_output_paths(args, case)
    rows = []
    manifest = {
        "case": case,
        "truth": str(truth_path),
        "hypothesis": label,
        "variants": [],
    }

    for variant in args.variants:
        candidate_id = "{0}_{1}_{2}".format(case, label, variant)
        if candidate_id in dedupe_ids:
            continue
        module = candidate_id
        verilog_path = paths["verilog_dir"] / "{0}.v".format(candidate_id)
        aig_path = paths["aig_dir"] / "{0}.aig".format(candidate_id)
        script_path = paths["log_dir"] / "{0}.ys".format(candidate_id)
        log_path = paths["log_dir"] / "{0}.yosys.log".format(candidate_id)
        start = time.time()
        row = {
            "case": case,
            "candidate_id": candidate_id,
            "hypothesis": label,
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
            verilog, items, model = render_variant(case, outputs, module, variant)
            digest = text_hash(verilog)
            if digest in dedupe_hashes or digest in new_hashes:
                continue
            new_hashes.add(digest)
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
                    tool_chain="yosys_bf16_aggressive_semantic_{0}".format(variant),
                    aig_path=aig_path,
                    truth=truth_path,
                    abc=args.abc,
                    notes="aggressive semantic BF16 field RTL",
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
    parser = argparse.ArgumentParser(description="Generate aggressive semantic BF16 RTL candidates.")
    parser.add_argument("--cases", type=parse_cases, default=parse_cases("ex200-ex219"))
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--work-dir", type=Path, default=ROOT / "student" / "work" / "reverse_bf16_aggressive_semantic")
    parser.add_argument("--results", type=Path, default=ROOT / "student" / "results" / "bf16_aggressive_semantic.csv")
    parser.add_argument("--best-results", type=Path, default=ROOT / "student" / "results" / "bf16_aggressive_semantic_best.csv")
    parser.add_argument("--abc", type=Path, default=ROOT / "student" / "abc")
    parser.add_argument("--yosys", type=Path, default=ROOT / "student" / "tools" / "conda-env" / "bin" / "yosys")
    parser.add_argument("--timeout", type=int, default=900)
    parser.add_argument("--no-yosys-abc", action="store_true")
    parser.add_argument("--emit-only", action="store_true")
    parser.add_argument("--dedupe-current", type=Path, default=ROOT / "student" / "results" / "bf16_candidates_current.csv")
    parser.add_argument("--variants", type=parse_variant_list, default=VARIANTS)
    return parser.parse_args(argv)


def main(argv=None):
    args = parse_args(argv)
    dedupe_ids, dedupe_hashes = load_dedupe(args.dedupe_current)
    new_hashes = set()
    rows = []
    for case in args.cases:
        case_rows = run_case(args, case, dedupe_ids, dedupe_hashes, new_hashes)
        rows.extend(case_rows)
        generated = len(case_rows)
        verified = sum(row["verified_truth"] == "1" for row in case_rows)
        print("{0}: generated={1} verified_truth={2}".format(case, generated, verified))

    write_csv(args.results, ALL_FIELDNAMES, rows)
    best = best_rows(rows)
    write_csv(args.best_results, BEST_FIELDNAMES, best)
    print("Results: {0}".format(args.results))
    print("Best: {0}".format(args.best_results))
    print("Rows: {0}".format(len(rows)))
    print("Best cases: {0}/{1}".format(len(best), len(args.cases)))
    if args.emit_only:
        print("Emit-only candidates: {0}".format(len(rows)))
        return 0
    return 0 if len(best) == len(args.cases) else 1


if __name__ == "__main__":
    raise SystemExit(main())
