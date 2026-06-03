#!/usr/bin/env python3
"""Generate semantic BF16 exponent/mantissa RTL seeds for ex211-ex219."""

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

OP_LABELS = {
    "recip": "bf16_reciprocal",
    "square": "bf16_square",
    "sqrt": "bf16_sqrt",
    "recip_square": "bf16_reciprocal_square",
    "recip_sqrt": "bf16_reciprocal_sqrt",
    "cube": "bf16_cube",
    "cbrt": "bf16_cbrt",
    "recip_cube": "bf16_reciprocal_cube",
    "recip_cbrt": "bf16_reciprocal_cbrt",
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


def signed_const(width, value):
    if value < 0:
        return "-{0}'sd{1}".format(width, -value)
    return "{0}'sd{1}".format(width, value)


def range_decl(width):
    return "" if width <= 1 else "[{0}:0] ".format(width - 1)


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


def base_exp(op, exp):
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


def output_category(value):
    exp = (value >> 7) & 0xFF
    mant = value & 0x7F
    if value == 0 or exp == 0:
        return "zero"
    if exp == 0xFF and mant == 0:
        return "inf"
    if exp == 0xFF:
        return "nan"
    return "normal"


def detect_sign_mode(outputs):
    same = True
    sign_flip = True
    nan = True
    for exp in range(1, 255):
        for mant in range(128):
            mag = (exp << 7) | mant
            positive = outputs[mag]
            negative = outputs[mag | 0x8000]
            if negative != positive:
                same = False
            if negative != (positive ^ 0x8000):
                sign_flip = False
            if negative != 0x7FC0:
                nan = False
    if sign_flip:
        return "sign_flip"
    if same:
        return "same"
    if nan:
        return "nan"
    return "mixed"


def build_table(op, outputs):
    mod = OP_MOD[op]
    table = {}
    for cls in range(mod):
        for mant in range(128):
            table[(cls, mant)] = (0, 0)

    for exp in range(1, 255):
        cls = exp % mod
        for mant in range(128):
            value = outputs[(exp << 7) | mant]
            if output_category(value) != "normal":
                continue
            delta = ((value >> 7) & 0xFF) - base_exp(op, exp)
            out_mant = value & 0x7F
            key = (cls, mant)
            old = table.get(key)
            if old != (0, 0) and old != (delta, out_mant):
                raise RuntimeError("inconsistent table entry for {0} key={1}".format(op, key))
            table[key] = (delta, out_mant)
    return mod, table


def compact_conditions(outputs, category):
    full = []
    partial = []
    for exp in range(1, 255):
        cats = [output_category(outputs[(exp << 7) | mant]) for mant in range(128)]
        if all(cat == category for cat in cats):
            full.append(exp)
            continue
        start = None
        for mant, cat in enumerate(cats):
            if cat == category and start is None:
                start = mant
            elif cat != category and start is not None:
                partial.append((exp, start, mant - 1))
                start = None
        if start is not None:
            partial.append((exp, start, 127))

    ranges = []
    if full:
        start = full[0]
        prev = full[0]
        for exp in full[1:]:
            if exp == prev + 1:
                prev = exp
            else:
                ranges.append((start, prev))
                start = exp
                prev = exp
        ranges.append((start, prev))
    return ranges, partial


def exp_condition(start, end):
    if start == end:
        return "exp == 8'd{0}".format(start)
    return "(exp >= 8'd{0} && exp <= 8'd{1})".format(start, end)


def mant_condition(start, end):
    if start == end:
        return "mant == 7'd{0}".format(start)
    return "(mant >= 7'd{0} && mant <= 7'd{1})".format(start, end)


def condition_expr(outputs, category):
    parts = []
    ranges, partial = compact_conditions(outputs, category)
    for start, end in ranges:
        parts.append(exp_condition(start, end))
    for exp, start, end in partial:
        parts.append("(exp == 8'd{0} && {1})".format(exp, mant_condition(start, end)))
    if not parts:
        return "1'b0"
    return " || ".join(parts)


def base_exp_lines(op):
    if op == "recip":
        return ["    base_exp = 11'sd254 - exp_s;"]
    if op == "square":
        return ["    base_exp = (exp_s <<< 1) - 11'sd127;"]
    if op == "sqrt":
        return ["    base_exp = (exp_s + 11'sd127) >>> 1;", "    exp_class = {1'b0, exp[0]};"]
    if op == "recip_square":
        return ["    base_exp = 11'sd381 - (exp_s <<< 1);"]
    if op == "recip_sqrt":
        return ["    base_exp = (11'sd381 - exp_s) >>> 1;", "    exp_class = {1'b0, exp[0]};"]
    if op == "cube":
        return ["    base_exp = (exp_s <<< 1) + exp_s - 11'sd254;"]
    if op == "recip_cube":
        return ["    base_exp = 11'sd508 - ((exp_s <<< 1) + exp_s);"]

    if op in ("cbrt", "recip_cbrt"):
        lines = ["    case (exp)"]
        for exp in range(256):
            lines.append(
                "      8'd{0}: begin base_exp = {1}; exp_class = 2'd{2}; end".format(
                    exp,
                    signed_const(11, base_exp(op, exp)),
                    exp % 3,
                )
            )
        lines.extend(["      default: begin base_exp = 11'sd0; exp_class = 2'd0; end", "    endcase"])
        return lines
    raise RuntimeError("unknown op: {0}".format(op))


def render_table_case(mod, table):
    key_width = 7 if mod == 1 else 9
    key_expr = "mant" if mod == 1 else "{exp_class, mant}"
    lines = [
        "  always @* begin",
        "    exp_delta = 4'sd0;",
        "    norm_mant = 7'h00;",
        "    case ({0})".format(key_expr),
    ]
    for cls in range(mod):
        for mant in range(128):
            delta, out_mant = table[(cls, mant)]
            if delta == 0 and out_mant == 0:
                continue
            key = mant if mod == 1 else (cls << 7) | mant
            lines.append(
                "      {0}: begin exp_delta = {1}; norm_mant = {2}; end".format(
                    const_word(key_width, key),
                    signed_const(4, delta),
                    const_word(7, out_mant),
                )
            )
    lines.extend(["      default: begin end", "    endcase", "  end"])
    return lines


def render_semantic_verilog(case, op, outputs, module):
    mod, table = build_table(op, outputs)
    sign_mode = detect_sign_mode(outputs)
    if sign_mode == "mixed":
        raise RuntimeError("{0} has mixed negative normal behavior".format(case))

    zero_expr = condition_expr(outputs, "zero")
    inf_expr = condition_expr(outputs, "inf")
    pos_zero = outputs[0x0000]
    neg_zero = outputs[0x8000]
    pos_inf = outputs[0x7F80]
    neg_inf = outputs[0xFF80]
    nan_out = outputs[0x7FC1]

    if sign_mode == "sign_flip":
        neg_expr = "pos_out ^ 16'h8000"
    elif sign_mode == "same":
        neg_expr = "pos_out"
    elif sign_mode == "nan":
        neg_expr = const_word(16, 0x7FC0)
    else:
        raise RuntimeError("unsupported sign mode: {0}".format(sign_mode))

    lines = [
        "module {0}(in, out);".format(module),
        "  input {0}in;".format(range_decl(16)),
        "  output {0}out;".format(range_decl(16)),
        "  wire sign = in[15];",
        "  wire [7:0] exp = in[14:7];",
        "  wire [6:0] mant = in[6:0];",
        "  wire signed [10:0] exp_s = $signed({3'b000, exp});",
        "  reg signed [10:0] base_exp;",
        "  reg [1:0] exp_class;",
        "  reg signed [3:0] exp_delta;",
        "  reg [6:0] norm_mant;",
        "  always @* begin",
        "    base_exp = 11'sd0;",
        "    exp_class = 2'd0;",
    ]
    lines.extend(base_exp_lines(op))
    lines.append("  end")
    lines.extend(render_table_case(mod, table))
    lines.extend(
        [
            "  wire signed [10:0] norm_exp_s = base_exp + exp_delta;",
            "  wire [15:0] normal_pos = {1'b0, norm_exp_s[7:0], norm_mant};",
            "  reg [15:0] pos_out;",
            "  always @* begin",
            "    if ({0})".format(zero_expr),
            "      pos_out = 16'h0000;",
            "    else if ({0})".format(inf_expr),
            "      pos_out = 16'h7f80;",
            "    else",
            "      pos_out = normal_pos;",
            "  end",
            "  reg [15:0] out_r;",
            "  always @* begin",
            "    if (exp == 8'h00)",
            "      out_r = sign ? {0} : {1};".format(const_word(16, neg_zero), const_word(16, pos_zero)),
            "    else if (exp == 8'hff && mant != 7'h00)",
            "      out_r = {0};".format(const_word(16, nan_out)),
            "    else if (exp == 8'hff)",
            "      out_r = sign ? {0} : {1};".format(const_word(16, neg_inf), const_word(16, pos_inf)),
            "    else",
            "      out_r = sign ? ({0}) : pos_out;".format(neg_expr),
            "  end",
            "  assign out = out_r;",
            "endmodule",
            "",
        ]
    )
    items = "{0}; sign_mode={1}; normal_table_entries={2}".format(
        mod * 128,
        sign_mode,
        sum(1 for value in table.values() if value != (0, 0)),
    )
    return "\n".join(lines), items


def verify_outputs(outputs, rendered_model):
    for index, expected in enumerate(outputs):
        actual = rendered_model(index)
        if actual != expected:
            return False, "first mismatch index={0} expected=0x{1:04x} actual=0x{2:04x}".format(
                index,
                expected,
                actual,
            )
    return True, "semantic model exact over {0} inputs".format(len(outputs))


def semantic_model(op, outputs):
    mod, table = build_table(op, outputs)
    sign_mode = detect_sign_mode(outputs)
    zero_ranges, zero_partials = compact_conditions(outputs, "zero")
    inf_ranges, inf_partials = compact_conditions(outputs, "inf")

    def in_conditions(exp, mant, ranges, partials):
        for start, end in ranges:
            if start <= exp <= end:
                return True
        for cond_exp, start, end in partials:
            if exp == cond_exp and start <= mant <= end:
                return True
        return False

    def model(index):
        sign = (index >> 15) & 1
        exp = (index >> 7) & 0xFF
        mant = index & 0x7F
        if exp == 0:
            return outputs[0x8000 if sign else 0]
        if exp == 0xFF:
            if mant != 0:
                return outputs[0x7FC1]
            return outputs[0xFF80 if sign else 0x7F80]

        cls = exp % mod
        delta, out_mant = table[(cls, mant)]
        out_exp = (base_exp(op, exp) + delta) & 0xFF
        pos_out = (out_exp << 7) | out_mant
        if in_conditions(exp, mant, zero_ranges, zero_partials):
            pos_out = 0
        elif in_conditions(exp, mant, inf_ranges, inf_partials):
            pos_out = 0x7F80

        if sign:
            if sign_mode == "sign_flip":
                return pos_out ^ 0x8000
            if sign_mode == "same":
                return pos_out
            if sign_mode == "nan":
                return 0x7FC0
        return pos_out

    return model


def case_output_paths(args, case):
    case_dir = args.work_dir / case
    return {
        "verilog_dir": case_dir / "verilog",
        "aig_dir": case_dir / "aigs",
        "log_dir": case_dir / "logs",
        "manifest": case_dir / "manifest.json",
    }


def run_case(args, case):
    if case not in CASE_OPS:
        return []
    op = CASE_OPS[case]
    label = OP_LABELS[op]
    truth_path = args.benchmarks / "{0}.truth".format(case)
    table = TruthTable(truth_path)
    outputs = list(table.iter_outputs())
    paths = case_output_paths(args, case)
    candidate_id = "{0}_{1}_semantic_arith_fields".format(case, label)
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
        "variant": "semantic_arith_fields",
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
        verilog, items = render_semantic_verilog(case, op, outputs, module)
        row["items"] = items
        verified, note = verify_outputs(outputs, semantic_model(op, outputs))
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
                tool_chain="yosys_bf16_semantic",
                aig_path=aig_path,
                truth=truth_path,
                abc=args.abc,
                notes="semantic BF16 exponent/mantissa RTL",
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
    write_text(paths["manifest"], json.dumps({"case": case, "op": op, "candidate": row}, indent=2, sort_keys=True) + "\n")
    return [row]


def best_rows(rows):
    best = []
    grouped = {}
    for row in rows:
        grouped.setdefault(row["case"], []).append(row)
    for case in sorted(grouped):
        valid = [row for row in grouped[case] if row["equivalent"] == "1" and row["adp"]]
        if valid:
            item = min(valid, key=lambda row: int(row["adp"]))
            best.append({name: item.get(name, "") for name in BEST_FIELDNAMES})
    return best


def parse_args(argv=None):
    parser = argparse.ArgumentParser(description="Search semantic BF16 RTL seeds for ex211-ex219.")
    parser.add_argument("--cases", type=parse_cases, default=parse_cases("ex211-ex219"))
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--work-dir", type=Path, default=ROOT / "student" / "work" / "reverse_bf16_semantic")
    parser.add_argument("--results", type=Path, default=ROOT / "student" / "results" / "bf16_semantic_variants.csv")
    parser.add_argument("--best-results", type=Path, default=ROOT / "student" / "results" / "bf16_semantic_variants_best.csv")
    parser.add_argument("--abc", type=Path, default=ROOT / "student" / "abc")
    parser.add_argument("--yosys", type=Path, default=ROOT / "student" / "tools" / "conda-env" / "bin" / "yosys")
    parser.add_argument("--timeout", type=int, default=900)
    parser.add_argument("--no-yosys-abc", action="store_true")
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
            print("{0}: no verified semantic BF16 seed".format(case), file=sys.stderr)
    write_csv(args.results, ALL_FIELDNAMES, rows)
    best = best_rows(rows)
    write_csv(args.best_results, BEST_FIELDNAMES, best)
    print("Results: {0}".format(args.results))
    print("Best: {0}".format(args.best_results))
    print("Best cases: {0}/{1}".format(len(best), len(args.cases)))
    return 0 if len(best) == len(args.cases) else 1


if __name__ == "__main__":
    raise SystemExit(main())
