#!/usr/bin/env python3
"""Find verified integer-arithmetic Verilog seeds for ex255-ex279."""

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
from student.frontends.analyze_truth import build_integer_candidates, score_candidates
from student.frontends.truth import TruthTable
from student.frontends.yosys_synth import SynthError, synthesize_verilog


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
    "notes",
]


CASE_RE = re.compile(r"^ex([0-9]{3})$")
SPLIT_RE = re.compile(r"^(low|high)([0-9]+)_(low|high)([0-9]+):(.+)$")


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


def mask(width):
    return (1 << width) - 1


def to_signed(value, width):
    sign = 1 << (width - 1)
    return value - (1 << width) if value & sign else value


def trunc_div(numerator, denominator):
    if denominator == 0:
        raise ZeroDivisionError("division by zero")
    sign = -1 if (numerator < 0) ^ (denominator < 0) else 1
    quotient = abs(numerator) // abs(denominator)
    return sign * quotient


def integer_sqrt(value):
    result = 0
    bit = 1 << ((value.bit_length() + 1) // 2)
    while bit:
        candidate = result | bit
        if candidate * candidate <= value:
            result = candidate
        bit >>= 1
    return result


def split_operands(index, part_width, order):
    part_mask = mask(part_width)
    low = index & part_mask
    high = (index >> part_width) & part_mask
    if order == "low_high":
        return low, high
    return high, low


def choose_exact_hypothesis(case, table, outputs):
    candidates = build_integer_candidates(table.input_width, table.output_width)
    results = score_candidates(outputs, table.output_width, candidates)
    exact = [name for mismatches, name, first in results if mismatches == 0]
    if not exact:
        best = results[0]
        return None, exact, "no exact integer hypothesis; best={0} mismatches={1}".format(best[1], best[0])

    preferences = [
        "x*x",
        "isqrt(x)",
        "low{0}_high{0}:a/b dbz=max".format(table.output_width),
        "low{0}_high{0}:a/b dbz=part_max".format(table.output_width),
        "low{0}_high{0}:signed_a*signed_b".format(table.input_width // 2),
        "high{0}_low{0}:signed_a*signed_b".format(table.input_width // 2),
        "low{0}_high{0}:a*b".format(table.input_width // 2),
        "high{0}_low{0}:a*b".format(table.input_width // 2),
    ]
    for preferred in preferences:
        if preferred in exact:
            return parse_hypothesis(case, table, preferred), exact, ""
    return parse_hypothesis(case, table, exact[0]), exact, ""


def parse_hypothesis(case, table, name):
    if name == "x*x":
        return {
            "case": case,
            "name": "square",
            "source_name": name,
            "input_width": table.input_width,
            "output_width": table.output_width,
        }
    if name == "isqrt(x)":
        return {
            "case": case,
            "name": "isqrt",
            "source_name": name,
            "input_width": table.input_width,
            "output_width": table.output_width,
        }

    match = SPLIT_RE.match(name)
    if not match:
        raise RuntimeError("cannot parse integer hypothesis: {0}".format(name))
    first, first_width, second, second_width, op = match.groups()
    if first_width != second_width:
        raise RuntimeError("unsupported asymmetric split: {0}".format(name))
    if first == "low" and second == "high":
        order = "low_high"
    elif first == "high" and second == "low":
        order = "high_low"
    else:
        raise RuntimeError("unsupported split order: {0}".format(name))

    part_width = int(first_width)
    if op == "a*b":
        kind = "umul"
    elif op == "signed_a*signed_b":
        kind = "smul"
    elif op.startswith("a/b "):
        kind = "udiv"
    else:
        raise RuntimeError("unsupported integer operation: {0}".format(name))

    dbz = None
    if "dbz=" in op:
        dbz = op.split("dbz=", 1)[1]

    return {
        "case": case,
        "name": kind,
        "source_name": name,
        "input_width": table.input_width,
        "output_width": table.output_width,
        "part_width": part_width,
        "order": order,
        "dbz": dbz,
    }


def model_value(spec, index):
    output_mask = mask(spec["output_width"])
    name = spec["name"]
    if name == "square":
        return (index * index) & output_mask
    if name == "isqrt":
        return integer_sqrt(index) & output_mask

    a, b = split_operands(index, spec["part_width"], spec["order"])
    if name == "umul":
        return (a * b) & output_mask
    if name == "smul":
        return (to_signed(a, spec["part_width"]) * to_signed(b, spec["part_width"])) & output_mask
    if name == "udiv":
        if b == 0:
            return output_mask
        return (a // b) & output_mask
    raise RuntimeError("unknown hypothesis kind: {0}".format(name))


def verify_model(spec, outputs):
    for index, expected in enumerate(outputs):
        actual = model_value(spec, index)
        if actual != expected:
            return False, "first mismatch index={0} expected=0x{1:x} actual=0x{2:x}".format(
                index,
                expected,
                actual,
            )
    return True, "model exact over {0} inputs".format(len(outputs))


def range_decl(width):
    if width <= 1:
        return ""
    return "[{0}:0] ".format(width - 1)


def zero_extend(expr, from_width, to_width):
    if to_width <= from_width:
        return expr
    return "{{{0}'b0, {1}}}".format(to_width - from_width, expr)


def sign_extend(expr, from_width, to_width):
    if to_width <= from_width:
        return expr
    return "{{{{{0}{{{1}[{2}]}}}}, {1}}}".format(to_width - from_width, expr, from_width - 1)


def const_word(width, value):
    return "{0}'h{1:x}".format(width, value & mask(width))


def render_verilog(spec, module, variant):
    input_width = spec["input_width"]
    output_width = spec["output_width"]
    lines = [
        "module {0}(in, out);".format(module),
        "  input {0}in;".format(range_decl(input_width)),
        "  output {0}out;".format(range_decl(output_width)),
    ]

    if spec["name"] in ("umul", "smul", "udiv"):
        part = spec["part_width"]
        if spec["order"] == "low_high":
            a_expr = "in[{0}:0]".format(part - 1)
            b_expr = "in[{0}:{1}]".format(input_width - 1, part)
        else:
            a_expr = "in[{0}:{1}]".format(input_width - 1, part)
            b_expr = "in[{0}:0]".format(part - 1)
        lines.extend(
            [
                "  wire [{0}:0] a = {1};".format(part - 1, a_expr),
                "  wire [{0}:0] b = {1};".format(part - 1, b_expr),
            ]
        )

    if spec["name"] == "umul":
        lines.extend(render_umul_body(spec, variant))
    elif spec["name"] == "smul":
        lines.extend(render_smul_body(spec, variant))
    elif spec["name"] == "udiv":
        lines.extend(render_udiv_body(spec, variant))
    elif spec["name"] == "square":
        lines.extend(render_square_body(spec, variant))
    elif spec["name"] == "isqrt":
        lines.extend(render_isqrt_body(input_width, output_width, variant))
    else:
        raise RuntimeError("unknown Verilog kind: {0}".format(spec["name"]))

    lines.append("endmodule")
    lines.append("")
    return "\n".join(lines)


def render_umul_body(spec, variant):
    part = spec["part_width"]
    output_width = spec["output_width"]
    if variant == "direct":
        return [
            "  wire [{0}:0] a_ext = {1};".format(output_width - 1, zero_extend("a", part, output_width)),
            "  wire [{0}:0] b_ext = {1};".format(output_width - 1, zero_extend("b", part, output_width)),
            "  assign out = a_ext * b_ext;",
        ]
    if variant == "shift_add":
        return [
            "  reg [{0}:0] acc;".format(output_width - 1),
            "  reg [{0}:0] a_ext;".format(output_width - 1),
            "  integer i;",
            "  always @* begin",
            "    acc = {0}'b0;".format(output_width),
            "    a_ext = {0};".format(zero_extend("a", part, output_width)),
            "    for (i = 0; i < {0}; i = i + 1) begin".format(part),
            "      if (b[i])",
            "        acc = acc + (a_ext << i);",
            "    end",
            "  end",
            "  assign out = acc;",
        ]
    if variant == "partial_products":
        lines = [
            "  wire [{0}:0] a_ext = {1};".format(output_width - 1, zero_extend("a", part, output_width)),
        ]
        terms = []
        for bit in range(part):
            name = "pp{0}".format(bit)
            terms.append(name)
            lines.append(
                "  wire [{0}:0] {1} = b[{2}] ? (a_ext << {2}) : {3};".format(
                    output_width - 1,
                    name,
                    bit,
                    const_word(output_width, 0),
                )
            )
        lines.append("  assign out = {0};".format(" + ".join(terms)))
        return lines
    raise RuntimeError("unknown umul variant: {0}".format(variant))


def render_smul_body(spec, variant):
    part = spec["part_width"]
    output_width = spec["output_width"]
    if variant == "direct":
        return [
            "  wire signed [{0}:0] a_ext = {1};".format(output_width - 1, sign_extend("a", part, output_width)),
            "  wire signed [{0}:0] b_ext = {1};".format(output_width - 1, sign_extend("b", part, output_width)),
            "  assign out = a_ext * b_ext;",
        ]
    if variant == "abs_sign":
        return [
            "  wire sign = a[{0}] ^ b[{0}];".format(part - 1),
            "  wire [{0}:0] abs_a = a[{0}] ? ((~a) + {1}'b1) : a;".format(part - 1, part),
            "  wire [{0}:0] abs_b = b[{0}] ? ((~b) + {1}'b1) : b;".format(part - 1, part),
            "  wire [{0}:0] abs_a_ext = {1};".format(output_width - 1, zero_extend("abs_a", part, output_width)),
            "  wire [{0}:0] abs_b_ext = {1};".format(output_width - 1, zero_extend("abs_b", part, output_width)),
            "  wire [{0}:0] unsigned_product = abs_a_ext * abs_b_ext;".format(output_width - 1),
            "  assign out = sign ? ((~unsigned_product) + {0}'b1) : unsigned_product;".format(output_width),
        ]
    if variant == "sign_correction":
        return [
            "  wire [{0}:0] a_unsigned = {1};".format(output_width - 1, zero_extend("a", part, output_width)),
            "  wire [{0}:0] b_unsigned = {1};".format(output_width - 1, zero_extend("b", part, output_width)),
            "  wire [{0}:0] raw_product = a_unsigned * b_unsigned;".format(output_width - 1),
            "  wire [{0}:0] corr_a = a[{1}] ? (b_unsigned << {2}) : {3};".format(
                output_width - 1,
                part - 1,
                part,
                const_word(output_width, 0),
            ),
            "  wire [{0}:0] corr_b = b[{1}] ? (a_unsigned << {2}) : {3};".format(
                output_width - 1,
                part - 1,
                part,
                const_word(output_width, 0),
            ),
            "  assign out = raw_product - corr_a - corr_b;",
        ]
    raise RuntimeError("unknown smul variant: {0}".format(variant))


def render_udiv_body(spec, variant):
    part = spec["part_width"]
    output_width = spec["output_width"]
    if variant == "direct":
        return [
            "  assign out = (b == {0}'b0) ? {1} : (a / b);".format(
                part,
                const_word(output_width, mask(output_width)),
            )
        ]
    if variant == "restoring":
        return [
            "  reg [{0}:0] quotient;".format(output_width - 1),
            "  reg [{0}:0] rem;".format(part),
            "  integer i;",
            "  always @* begin",
            "    quotient = {0}'b0;".format(output_width),
            "    rem = {0}'b0;".format(part + 1),
            "    if (b == {0}'b0) begin".format(part),
            "      quotient = {0};".format(const_word(output_width, mask(output_width))),
            "    end else begin",
            "      for (i = {0}; i >= 0; i = i - 1) begin".format(part - 1),
            "        rem = {{rem[{0}:0], a[i]}};".format(part - 1),
            "        if (rem >= {1'b0, b}) begin",
            "          rem = rem - {1'b0, b};",
            "          quotient[i] = 1'b1;",
            "        end",
            "      end",
            "    end",
            "  end",
            "  assign out = quotient;",
        ]
    if variant == "case_denominator":
        lines = [
            "  reg [{0}:0] quotient;".format(output_width - 1),
            "  always @* begin",
            "    case (b)",
            "      {0}'d0: quotient = {1};".format(part, const_word(output_width, mask(output_width))),
        ]
        for divisor in range(1, 1 << part):
            lines.append(
                "      {0}'d{1}: quotient = a / {0}'d{1};".format(part, divisor)
            )
        lines.extend(
            [
                "      default: quotient = {0};".format(const_word(output_width, 0)),
                "    endcase",
                "  end",
                "  assign out = quotient;",
            ]
        )
        return lines
    raise RuntimeError("unknown udiv variant: {0}".format(variant))


def render_square_body(spec, variant):
    input_width = spec["input_width"]
    output_width = spec["output_width"]
    if variant == "direct":
        return [
            "  wire [{0}:0] x_ext = {1};".format(output_width - 1, zero_extend("in", input_width, output_width)),
            "  assign out = x_ext * x_ext;",
        ]
    if variant == "shift_add":
        return [
            "  reg [{0}:0] acc;".format(output_width - 1),
            "  reg [{0}:0] x_ext;".format(output_width - 1),
            "  integer i;",
            "  always @* begin",
            "    acc = {0}'b0;".format(output_width),
            "    x_ext = {0};".format(zero_extend("in", input_width, output_width)),
            "    for (i = 0; i < {0}; i = i + 1) begin".format(input_width),
            "      if (in[i])",
            "        acc = acc + (x_ext << i);",
            "    end",
            "  end",
            "  assign out = acc;",
        ]
    if variant == "symmetric_terms":
        return [
            "  reg [{0}:0] acc;".format(output_width - 1),
            "  integer i;",
            "  integer j;",
            "  always @* begin",
            "    acc = {0}'b0;".format(output_width),
            "    for (i = 0; i < {0}; i = i + 1) begin".format(input_width),
            "      if (in[i])",
            "        acc = acc + ({0}'b1 << (i + i));".format(output_width),
            "      for (j = i + 1; j < {0}; j = j + 1) begin".format(input_width),
            "        if (in[i] & in[j])",
            "          acc = acc + ({0}'b1 << (i + j + 1));".format(output_width),
            "      end",
            "    end",
            "  end",
            "  assign out = acc;",
        ]
    raise RuntimeError("unknown square variant: {0}".format(variant))


def render_isqrt_body(input_width, output_width, variant):
    if variant == "threshold_chain":
        lines = [
            "  reg [{0}:0] out_r;".format(output_width - 1),
            "  always @* begin",
            "    out_r = {0}'b0;".format(output_width),
        ]
        for value in range(1, 1 << output_width):
            lines.append(
                "    if (in >= {0}'d{1}) out_r = {2}'d{3};".format(
                    input_width,
                    value * value,
                    output_width,
                    value,
                )
            )
        lines.extend(["  end", "  assign out = out_r;"])
        return lines

    if variant != "direct":
        raise RuntimeError("unknown isqrt variant: {0}".format(variant))

    return [
        "  reg [{0}:0] out_r;".format(output_width - 1),
        "  reg [{0}:0] cand;".format(output_width - 1),
        "  reg [{0}:0] cand_ext;".format(input_width - 1),
        "  reg [{0}:0] square;".format(input_width - 1),
        "  integer i;",
        "  always @* begin",
        "    out_r = {0}'b0;".format(output_width),
        "    cand = {0}'b0;".format(output_width),
        "    cand_ext = {0}'b0;".format(input_width),
        "    square = {0}'b0;".format(input_width),
        "    for (i = {0}; i >= 0; i = i - 1) begin".format(output_width - 1),
        "      cand = out_r | ({0}'b1 << i);".format(output_width),
        "      cand_ext = {{ {0}'b0, cand }};".format(input_width - output_width),
        "      square = cand_ext * cand_ext;",
        "      if (square <= in)",
        "        out_r = cand;",
        "    end",
        "  end",
        "  assign out = out_r;",
    ]


def candidate_variants(spec, mode):
    if mode == "direct":
        return ["direct"]
    if mode != "diverse":
        raise RuntimeError("unknown variant mode: {0}".format(mode))

    name = spec["name"]
    if name == "umul":
        return ["direct", "shift_add", "partial_products"]
    if name == "smul":
        return ["direct", "abs_sign", "sign_correction"]
    if name == "udiv":
        return ["direct", "restoring", "case_denominator"]
    if name == "square":
        return ["direct", "shift_add", "symmetric_terms"]
    if name == "isqrt":
        return ["direct", "threshold_chain"]
    return ["direct"]


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
    spec, exact, note = choose_exact_hypothesis(case, table, outputs)
    paths = case_output_paths(args, case)
    manifest = {
        "case": case,
        "truth": str(truth_path),
        "input_width": table.input_width,
        "output_width": table.output_width,
        "exact_hypotheses": exact,
        "chosen_hypothesis": spec,
        "candidates": [],
    }

    if spec is None:
        write_text(paths["manifest"], json.dumps(manifest, indent=2, sort_keys=True) + "\n")
        return [
            {
                "case": case,
                "candidate_id": "",
                "hypothesis": "",
                "variant": "",
                "verilog_path": "",
                "aig_path": "",
                "verified_truth": "0",
                "synthesized": "0",
                "equivalent": "0",
                "area": "",
                "delay": "",
                "adp": "",
                "runtime_sec": "0.000",
                "notes": note,
            }
        ]

    verified, verify_note = verify_model(spec, outputs)
    rows = []
    for variant in candidate_variants(spec, args.variant_mode):
        candidate_id = "{0}_{1}_{2}".format(case, spec["name"], variant)
        module = candidate_id
        verilog_path = paths["verilog_dir"] / "{0}.v".format(candidate_id)
        aig_path = paths["aig_dir"] / "{0}.aig".format(candidate_id)
        script_path = paths["log_dir"] / "{0}.ys".format(candidate_id)
        log_path = paths["log_dir"] / "{0}.yosys.log".format(candidate_id)

        start = time.time()
        row = {
            "case": case,
            "candidate_id": candidate_id,
            "hypothesis": spec["source_name"],
            "variant": variant,
            "verilog_path": str(verilog_path),
            "aig_path": str(aig_path),
            "verified_truth": "1" if verified else "0",
            "synthesized": "0",
            "equivalent": "0",
            "area": "",
            "delay": "",
            "adp": "",
            "runtime_sec": "0.000",
            "notes": verify_note,
        }

        write_text(verilog_path, render_verilog(spec, module, variant))
        if verified:
            try:
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
                    parent_id=spec["source_name"],
                    source="ai_verilog",
                    tool_chain="yosys_integer_{0}".format(spec["name"]),
                    aig_path=aig_path,
                    truth=truth_path,
                    abc=args.abc,
                    notes="integer Verilog seed",
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
        manifest["candidates"].append(row)

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
    parser = argparse.ArgumentParser(description="Search verified integer Verilog seeds for ex255-ex279.")
    parser.add_argument("--cases", type=parse_cases, default=parse_cases("ex255-ex279"))
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--work-dir", type=Path, default=ROOT / "student" / "work" / "reverse_integer")
    parser.add_argument("--results", type=Path, default=ROOT / "student" / "results" / "integer_verilog_search.csv")
    parser.add_argument("--best-results", type=Path, default=ROOT / "student" / "results" / "integer_verilog_best.csv")
    parser.add_argument("--abc", type=Path, default=ROOT / "student" / "abc")
    parser.add_argument("--yosys", type=Path, default=ROOT / "student" / "tools" / "conda-env" / "bin" / "yosys")
    parser.add_argument("--timeout", type=int, default=300)
    parser.add_argument("--no-yosys-abc", action="store_true")
    parser.add_argument(
        "--variant-mode",
        choices=("direct", "diverse"),
        default="direct",
        help="direct preserves the canonical single seed; diverse emits multiple equivalent RTL encodings.",
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
                "{case}: {hypothesis} area={area} delay={delay} adp={adp} verilog={verilog}".format(
                    case=case,
                    hypothesis=item["hypothesis"],
                    area=item["area"],
                    delay=item["delay"],
                    adp=item["adp"],
                    verilog=item["verilog_path"],
                )
            )
        else:
            print("{0}: no verified synthesized Verilog seed".format(case), file=sys.stderr)

    write_csv(args.results, ALL_FIELDNAMES, rows)
    best = best_rows(rows)
    write_csv(args.best_results, BEST_FIELDNAMES, best)
    print("Results: {0}".format(args.results))
    print("Best: {0}".format(args.best_results))
    print("Best cases: {0}/{1}".format(len(best), len(args.cases)))
    return 0 if len(best) == len(args.cases) else 1


if __name__ == "__main__":
    raise SystemExit(main())
