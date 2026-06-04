#!/usr/bin/env python3
"""Generate aggressive exact Verilog seeds for unknown ex280-ex299 functions."""

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

VARIANTS = [
    "value_case",
    "expr_default_exception",
    "high_split_default",
    "low_split_default",
    "rotate_high_split_default",
    "rotate_low_split_default",
    "decision_tree_greedy",
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
    valid = set(VARIANTS)
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


def const_word(width, value):
    digits = max(1, (width + 3) // 4)
    return "{0}'h{1:0{2}x}".format(width, value & ((1 << width) - 1), digits)


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


def normalize_verilog(text):
    text = re.sub(r"\bmodule\s+[A-Za-z_][A-Za-z0-9_$]*\s*\(", "module MODULE(", text)
    return text.strip()


def text_hash(text):
    return hashlib.sha256(normalize_verilog(text).encode("utf-8")).hexdigest()


def load_dedupe(paths):
    ids = set()
    hashes = set()
    for path in paths:
        if path is None or not path.is_file():
            continue
        with path.open() as handle:
            reader = csv.DictReader(handle)
            for row in reader:
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


def rotl(value, width, amount):
    amount %= width
    mask = (1 << width) - 1
    if amount == 0:
        return value & mask
    return ((value << amount) | (value >> (width - amount))) & mask


def rotr(value, width, amount):
    amount %= width
    mask = (1 << width) - 1
    if amount == 0:
        return value & mask
    return ((value >> amount) | (value << (width - amount))) & mask


def bit_reverse(value, width):
    out = 0
    for bit in range(width):
        if value & (1 << bit):
            out |= 1 << (width - 1 - bit)
    return out


def rotl_expr(width, amount):
    amount %= width
    if amount == 0:
        return "in"
    return "{in[%d:0], in[%d:%d]}" % (width - amount - 1, width - 1, width - amount)


def rotr_expr(width, amount):
    amount %= width
    if amount == 0:
        return "in"
    return "{in[%d:0], in[%d:%d]}" % (amount - 1, width - 1, amount)


def bit_reverse_expr(width):
    return "{" + ", ".join("in[%d]" % bit for bit in range(width)) + "}"


def generic_exprs(width):
    mask = (1 << width) - 1
    exprs = [
        ("zero", "0", lambda index: 0),
        ("ones", const_word(width, mask), lambda index: mask),
        ("input", "in", lambda index: index),
        ("not_input", "~in", lambda index: (~index) & mask),
        ("neg_input", "(~in + %s)" % const_word(width, 1), lambda index: (-index) & mask),
        ("input_plus_one", "(in + %s)" % const_word(width, 1), lambda index: (index + 1) & mask),
        ("input_minus_one", "(in - %s)" % const_word(width, 1), lambda index: (index - 1) & mask),
        ("bit_reverse", bit_reverse_expr(width), lambda index: bit_reverse(index, width)),
    ]
    for amount in range(1, width):
        exprs.append(
            (
                "rotl_%d" % amount,
                rotl_expr(width, amount),
                lambda index, amount=amount: rotl(index, width, amount),
            )
        )
    if width % 2 == 0:
        half = width // 2
        exprs.append(
            (
                "half_swap",
                "{in[%d:0], in[%d:%d]}" % (half - 1, width - 1, half),
                lambda index, half=half: ((index & ((1 << half) - 1)) << half) | (index >> half),
            )
        )
    return exprs


def module_header(module, input_width, output_width):
    return [
        "module {0}(in, out);".format(module),
        "  input {0}in;".format(range_decl(input_width)),
        "  output {0}out;".format(range_decl(output_width)),
    ]


def module_footer():
    return ["endmodule", ""]


def render_value_case(outputs, module, input_width, output_width):
    lines = module_header(module, input_width, output_width)
    lines.extend(
        [
            "  reg {0}out_r;".format(range_decl(output_width)),
            "  always @* begin",
            "    case (in)",
        ]
    )
    for index, value in enumerate(outputs):
        lines.append("      {0}: out_r = {1};".format(const_word(input_width, index), const_word(output_width, value)))
    lines.extend(
        [
            "      default: out_r = {0};".format(const_word(output_width, 0)),
            "    endcase",
            "  end",
            "  assign out = out_r;",
        ]
    )
    lines.extend(module_footer())
    return "\n".join(lines), str(len(outputs)), lambda index: outputs[index]


def choose_best_expr(outputs, input_width, output_width):
    scored = []
    for name, expr, fn in generic_exprs(input_width):
        matches = 0
        for index, expected in enumerate(outputs):
            if (fn(index) & ((1 << output_width) - 1)) == expected:
                matches += 1
        scored.append((matches, name, expr, fn))
    scored.sort(key=lambda item: (-item[0], item[1]))
    return scored[0]


def render_expr_default_exception(outputs, module, input_width, output_width):
    matches, name, expr, fn = choose_best_expr(outputs, input_width, output_width)
    exceptions = [
        (index, value)
        for index, value in enumerate(outputs)
        if (fn(index) & ((1 << output_width) - 1)) != value
    ]
    lines = module_header(module, input_width, output_width)
    lines.extend(
        [
            "  reg {0}out_r;".format(range_decl(output_width)),
            "  always @* begin",
            "    out_r = {0};".format(expr),
        ]
    )
    if exceptions:
        lines.append("    case (in)")
        for index, value in exceptions:
            lines.append("      {0}: out_r = {1};".format(const_word(input_width, index), const_word(output_width, value)))
        lines.extend(["      default: begin end", "    endcase"])
    lines.extend(["  end", "  assign out = out_r;"])
    lines.extend(module_footer())
    items = "expr={0}; matches={1}; exceptions={2}".format(name, matches, len(exceptions))

    def model(index):
        default = fn(index) & ((1 << output_width) - 1)
        return default if default == outputs[index] else outputs[index]

    return "\n".join(lines), items, model


def build_key_values(outputs, input_width, rotate_amount):
    values = [0] * len(outputs)
    for index, value in enumerate(outputs):
        key = rotl(index, input_width, rotate_amount)
        values[key] = value
    return values


def split_stats_for_values(values, input_width, outer_low):
    low_bits = input_width // 2
    high_bits = input_width - low_bits
    if outer_low:
        outer_bits = low_bits
        inner_bits = high_bits
    else:
        outer_bits = high_bits
        inner_bits = low_bits
    exceptions = 0
    full_defaults = 0
    for outer in range(1 << outer_bits):
        group = []
        for inner in range(1 << inner_bits):
            key = (inner << outer_bits) | outer if outer_low else (outer << inner_bits) | inner
            group.append(values[key])
        default = choose_mode(group)
        diff = sum(value != default for value in group)
        if diff == 0:
            full_defaults += 1
        exceptions += diff
    return exceptions, full_defaults


def choose_rotation(outputs, input_width, outer_low):
    best = None
    for amount in range(input_width):
        values = build_key_values(outputs, input_width, amount)
        exceptions, full_defaults = split_stats_for_values(values, input_width, outer_low)
        score = (exceptions, -full_defaults, amount)
        if best is None or score < best[0]:
            best = (score, amount, exceptions, full_defaults)
    return best[1], best[2], best[3]


def render_split_default(outputs, module, input_width, output_width, outer_low, rotate_amount):
    key_values = build_key_values(outputs, input_width, rotate_amount)
    low_bits = input_width // 2
    high_bits = input_width - low_bits
    key_expr = rotl_expr(input_width, rotate_amount)
    if outer_low:
        outer_name = "key_lo"
        inner_name = "key_hi"
        outer_bits = low_bits
        inner_bits = high_bits
    else:
        outer_name = "key_hi"
        inner_name = "key_lo"
        outer_bits = high_bits
        inner_bits = low_bits

    lines = module_header(module, input_width, output_width)
    lines.extend(
        [
            "  wire {0}key = {1};".format(range_decl(input_width), key_expr),
            "  wire {0}key_hi = key[{1}:{2}];".format(range_decl(high_bits), input_width - 1, low_bits),
            "  wire {0}key_lo = key[{1}:0];".format(range_decl(low_bits), low_bits - 1),
            "  reg {0}out_r;".format(range_decl(output_width)),
            "  always @* begin",
            "    out_r = {0};".format(const_word(output_width, 0)),
            "    case ({0})".format(outer_name),
        ]
    )

    exceptions = 0
    full_defaults = 0
    for outer in range(1 << outer_bits):
        group = []
        for inner in range(1 << inner_bits):
            key = (inner << outer_bits) | outer if outer_low else (outer << inner_bits) | inner
            group.append(key_values[key])
        default = choose_mode(group)
        differing = [(inner, value) for inner, value in enumerate(group) if value != default]
        lines.append("      {0}: begin".format(const_word(outer_bits, outer)))
        lines.append("        out_r = {0};".format(const_word(output_width, default)))
        if differing:
            lines.append("        case ({0})".format(inner_name))
            for inner, value in differing:
                lines.append(
                    "          {0}: out_r = {1};".format(
                        const_word(inner_bits, inner),
                        const_word(output_width, value),
                    )
                )
                exceptions += 1
            lines.extend(["          default: begin end", "        endcase"])
        else:
            full_defaults += 1
        lines.append("      end")
    lines.extend(
        [
            "      default: begin end",
            "    endcase",
            "  end",
            "  assign out = out_r;",
        ]
    )
    lines.extend(module_footer())

    def model(index):
        key = rotl(index, input_width, rotate_amount)
        return key_values[key]

    items = "rotate={0}; outer={1}; outer_bits={2}; inner_bits={3}; full_default_groups={4}; exceptions={5}".format(
        rotate_amount,
        "low" if outer_low else "high",
        outer_bits,
        inner_bits,
        full_defaults,
        exceptions,
    )
    return "\n".join(lines), items, model


def choose_decision_bit(indices, bits, outputs):
    best = None
    for bit in bits:
        zero = []
        one = []
        for index in indices:
            if index & (1 << bit):
                one.append(index)
            else:
                zero.append(index)
        if not zero or not one:
            continue
        score = (
            len(set(outputs[index] for index in zero)) + len(set(outputs[index] for index in one)),
            max(len(zero), len(one)),
            bit,
        )
        if best is None or score < best[0]:
            best = (score, bit, zero, one)
    if best is None:
        bit = bits[0]
        zero = [index for index in indices if not (index & (1 << bit))]
        one = [index for index in indices if index & (1 << bit)]
        return bit, zero, one
    return best[1], best[2], best[3]


def emit_tree(lines, indices, bits, outputs, input_width, output_width, indent, stats):
    unique = set(outputs[index] for index in indices)
    if len(unique) == 1 or not bits:
        value = outputs[indices[0]]
        lines.append("{0}out_r = {1};".format(indent, const_word(output_width, value)))
        stats["leaves"] += 1
        return
    bit, zero, one = choose_decision_bit(indices, bits, outputs)
    remaining = [item for item in bits if item != bit]
    lines.append("{0}if (in[{1}]) begin".format(indent, bit))
    emit_tree(lines, one, remaining, outputs, input_width, output_width, indent + "  ", stats)
    lines.append("{0}end else begin".format(indent))
    emit_tree(lines, zero, remaining, outputs, input_width, output_width, indent + "  ", stats)
    lines.append("{0}end".format(indent))
    stats["nodes"] += 1


def render_decision_tree(outputs, module, input_width, output_width):
    indices = list(range(len(outputs)))
    bits = list(range(input_width))
    lines = module_header(module, input_width, output_width)
    lines.extend(
        [
            "  reg {0}out_r;".format(range_decl(output_width)),
            "  always @* begin",
            "    out_r = {0};".format(const_word(output_width, 0)),
        ]
    )
    stats = {"nodes": 0, "leaves": 0}
    emit_tree(lines, indices, bits, outputs, input_width, output_width, "    ", stats)
    lines.extend(["  end", "  assign out = out_r;"])
    lines.extend(module_footer())
    items = "nodes={0}; leaves={1}".format(stats["nodes"], stats["leaves"])
    return "\n".join(lines), items, lambda index: outputs[index]


def render_variant(outputs, module, input_width, output_width, variant):
    if variant == "value_case":
        return render_value_case(outputs, module, input_width, output_width)
    if variant == "expr_default_exception":
        return render_expr_default_exception(outputs, module, input_width, output_width)
    if variant == "high_split_default":
        return render_split_default(outputs, module, input_width, output_width, outer_low=False, rotate_amount=0)
    if variant == "low_split_default":
        return render_split_default(outputs, module, input_width, output_width, outer_low=True, rotate_amount=0)
    if variant == "rotate_high_split_default":
        amount, exceptions, full_defaults = choose_rotation(outputs, input_width, outer_low=False)
        return render_split_default(outputs, module, input_width, output_width, outer_low=False, rotate_amount=amount)
    if variant == "rotate_low_split_default":
        amount, exceptions, full_defaults = choose_rotation(outputs, input_width, outer_low=True)
        return render_split_default(outputs, module, input_width, output_width, outer_low=True, rotate_amount=amount)
    if variant == "decision_tree_greedy":
        return render_decision_tree(outputs, module, input_width, output_width)
    raise RuntimeError("unknown variant: {0}".format(variant))


def verify_outputs(outputs, model):
    for index, expected in enumerate(outputs):
        actual = model(index)
        if actual != expected:
            return False, "first mismatch index={0} expected=0x{1:x} actual=0x{2:x}".format(
                index,
                expected,
                actual,
            )
    return True, "exact unknown-function model over {0} inputs".format(len(outputs))


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
    if table.input_width != table.output_width:
        raise RuntimeError("{0} input/output widths differ: {1}/{2}".format(case, table.input_width, table.output_width))
    outputs = list(table.iter_outputs())
    paths = case_output_paths(args, case)
    label = "unknown_{0}x{0}".format(table.input_width)
    rows = []
    manifest = {
        "case": case,
        "truth": str(truth_path),
        "input_width": table.input_width,
        "output_width": table.output_width,
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
            verilog, items, model = render_variant(outputs, module, table.input_width, table.output_width, variant)
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
                    tool_chain="yosys_unknown_{0}".format(variant),
                    aig_path=aig_path,
                    truth=truth_path,
                    abc=args.abc,
                    notes="unknown function structural Verilog seed",
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
    parser = argparse.ArgumentParser(description="Generate aggressive unknown-function Verilog candidates.")
    parser.add_argument("--cases", type=parse_cases, default=parse_cases("ex280-ex299"))
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--work-dir", type=Path, default=ROOT / "student" / "work" / "reverse_unknown")
    parser.add_argument("--results", type=Path, default=ROOT / "student" / "results" / "unknown_verilog.csv")
    parser.add_argument("--best-results", type=Path, default=ROOT / "student" / "results" / "unknown_verilog_best.csv")
    parser.add_argument("--abc", type=Path, default=ROOT / "student" / "abc")
    parser.add_argument("--yosys", type=Path, default=ROOT / "student" / "tools" / "conda-env" / "bin" / "yosys")
    parser.add_argument("--timeout", type=int, default=900)
    parser.add_argument("--no-yosys-abc", action="store_true")
    parser.add_argument("--emit-only", action="store_true")
    parser.add_argument("--dedupe-current", type=Path, action="append", default=[])
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
        print(
            "{0}: generated={1} verified_truth={2}".format(
                case,
                len(case_rows),
                sum(row["verified_truth"] == "1" for row in case_rows),
            )
        )

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
