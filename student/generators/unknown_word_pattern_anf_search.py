#!/usr/bin/env python3
"""Generate masked word-pattern ANF seeds for unknown cases.

For each ANF monomial, express the input variables as offsets relative to the
output bit.  Equal offset patterns become one word-level rotated-AND feature
masked to the output bit positions where that pattern occurs.  This tests
whether the degree-4 functions are compact word-level shift/AND/XOR networks
rather than independent bit equations.
"""

import argparse
import json
import subprocess
import sys
import time
from collections import defaultdict
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from student.backends.abc_flow import evaluate_aig
from student.frontends.truth import TruthTable
from student.frontends.yosys_synth import SynthError, synthesize_verilog
from student.generators.unknown_algebraic_search import (
    anf_by_bit,
    eval_anf_word,
    key_lines_for_transform,
    transformed_outputs,
    transform_index,
)
from student.generators.unknown_key_ac_decomp_search import (
    EVALUATE_FIELDNAMES,
    SUMMARY_FIELDNAMES,
    add_summary_columns,
    load_current_best,
    load_reference,
)
from student.generators.unknown_verilog_search import (
    ALL_FIELDNAMES,
    BEST_FIELDNAMES,
    const_word,
    parse_cases,
    range_decl,
    text_hash,
    write_csv,
    write_text,
)


def parse_list(value):
    items = []
    seen = set()
    for item in value.split(","):
        item = item.strip()
        if item and item not in seen:
            items.append(item)
            seen.add(item)
    if not items:
        raise argparse.ArgumentTypeError("empty list")
    return items


def offset_rotate_expr(width, offset):
    """Word whose bit i is key[(i + offset) % width]."""
    if offset % width == 0:
        return "key"
    parts = []
    for bit in range(width - 1, -1, -1):
        parts.append("key[{0}]".format((bit + offset) % width))
    return "{" + ", ".join(parts) + "}"


def xor_tree(lines, signals, prefix, width):
    if not signals:
        return "1'b0"
    if len(signals) == 1:
        return signals[0]
    level = 0
    current = list(signals)
    while len(current) > 1:
        nxt = []
        for index in range(0, len(current), 2):
            if index + 1 >= len(current):
                nxt.append(current[index])
                continue
            name = "{0}_l{1}_{2}".format(prefix, level, index // 2)
            lines.append(
                "  wire {0}{1} = {2} ^ {3};".format(
                    range_decl(width),
                    name,
                    current[index],
                    current[index + 1],
                )
            )
            nxt.append(name)
        current = nxt
        level += 1
    return current[0]


def render(outputs, module, input_width, output_width, transform):
    values = transformed_outputs(outputs, input_width, transform)
    terms_by_bit = anf_by_bit(values, input_width, output_width)
    patterns = defaultdict(int)
    for out_bit, terms in enumerate(terms_by_bit):
        for mask in terms:
            rel = tuple(sorted((bit - out_bit) % input_width for bit in range(input_width) if (mask >> bit) & 1))
            patterns[rel] ^= 1 << out_bit
    patterns = {rel: mask for rel, mask in patterns.items() if mask}

    used_offsets = sorted({offset for rel in patterns for offset in rel})
    lines = [
        "module {0}(in, out);".format(module),
        "  input {0}in;".format(range_decl(input_width)),
        "  output {0}out;".format(range_decl(output_width)),
    ]
    lines.extend(key_lines_for_transform(transform, input_width))
    for offset in used_offsets:
        lines.append(
            "  wire {0}rot_{1} = {2};".format(
                range_decl(output_width),
                offset,
                offset_rotate_expr(output_width, offset),
            )
        )

    feature_signals = []
    for index, rel in enumerate(sorted(patterns, key=lambda item: (len(item), item))):
        mask = patterns[rel]
        if not rel:
            expr = const_word(output_width, mask)
        else:
            terms = ["rot_{0}".format(offset) for offset in rel]
            if len(terms) == 1:
                expr = terms[0]
            else:
                expr = "(" + " & ".join(terms) + ")"
            if mask != (1 << output_width) - 1:
                expr = "({0} & {1})".format(expr, const_word(output_width, mask))
        signal = "wp_{0}".format(index)
        lines.append("  wire {0}{1} = {2};".format(range_decl(output_width), signal, expr))
        feature_signals.append(signal)
    out_signal = xor_tree(lines, feature_signals, "out_x", output_width)
    lines.append("  assign out = {0};".format(out_signal))
    lines.append("endmodule")
    lines.append("")

    items = (
        "transform={0}; anf_terms={1}; word_patterns={2}; used_offsets={3}; "
        "max_pattern_degree={4}"
    ).format(
        transform,
        sum(len(terms) for terms in terms_by_bit),
        len(patterns),
        ":".join(str(offset) for offset in used_offsets),
        max((len(rel) for rel in patterns), default=0),
    )

    def model(index):
        key = transform_index(transform, index, input_width)
        return eval_anf_word(terms_by_bit, key)

    return "\n".join(lines), items, model


def verify_outputs(outputs, model):
    for index, expected in enumerate(outputs):
        actual = model(index)
        if actual != expected:
            return False, "first mismatch index={0} expected=0x{1:x} actual=0x{2:x}".format(
                index,
                expected,
                actual,
            )
    return True, "exact masked word-pattern ANF model over {0} inputs".format(len(outputs))


def best_rows(rows):
    best = []
    for case in sorted(set(row["case"] for row in rows)):
        valid = [
            row
            for row in rows
            if row["case"] == case and row["equivalent"] == "1" and row["adp"]
        ]
        if valid:
            item = min(valid, key=lambda row: int(row["adp"]))
            best.append({name: item.get(name, "") for name in BEST_FIELDNAMES})
    return best


def run_case(args, case):
    truth_path = args.benchmarks / "{0}.truth".format(case)
    table = TruthTable(truth_path)
    outputs = list(table.iter_outputs())
    rows = []
    manifest = {
        "case": case,
        "truth": str(truth_path),
        "input_width": table.input_width,
        "output_width": table.output_width,
        "hypothesis": "unknown_word_pattern_anf",
        "variants": [],
    }
    for transform in args.transforms:
        candidate_id = "{0}_unknown_word_pattern_anf_{1}".format(case, transform)
        module = candidate_id
        verilog_path = args.work_dir / case / "verilog" / "{0}.v".format(candidate_id)
        aig_path = args.work_dir / case / "aigs" / "{0}.aig".format(candidate_id)
        script_path = args.work_dir / case / "logs" / "{0}.ys".format(candidate_id)
        log_path = args.work_dir / case / "logs" / "{0}.yosys.log".format(candidate_id)
        start = time.time()
        row = {
            "case": case,
            "candidate_id": candidate_id,
            "hypothesis": "unknown_word_pattern_anf",
            "variant": transform,
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
            verilog, items, model = render(outputs, module, table.input_width, table.output_width, transform)
            row["items"] = "{0}; hash={1}".format(items, text_hash(verilog)[:12])
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
                    use_abc=not args.no_yosys_abc,
                    script_out=script_path,
                )
                write_text(log_path, yosys_log)
                row["synthesized"] = "1"
                evaluated = evaluate_aig(
                    case=case,
                    candidate_id=candidate_id,
                    parent_id="unknown_word_pattern_anf",
                    source="ai_verilog",
                    tool_chain="yosys_unknown_word_pattern_anf",
                    aig_path=aig_path,
                    truth=truth_path,
                    abc=args.abc,
                    notes="unknown masked word-pattern ANF Verilog seed",
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
        print(
            "{0} {1} eq={2} area={3} delay={4} adp={5}".format(
                case,
                transform,
                row["equivalent"],
                row["area"],
                row["delay"],
                row["adp"],
            ),
            flush=True,
        )
    write_text(args.work_dir / case / "manifest.json", json.dumps(manifest, indent=2, sort_keys=True) + "\n")
    return rows


def parse_args(argv=None):
    parser = argparse.ArgumentParser(description="Generate masked word-pattern ANF candidates.")
    parser.add_argument("--cases", type=parse_cases, required=True)
    parser.add_argument("--transforms", type=parse_list, default=parse_list("prefix_parity_reduce"))
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--work-dir", type=Path, required=True)
    parser.add_argument("--results", type=Path, required=True)
    parser.add_argument("--best-results", type=Path, required=True)
    parser.add_argument("--summary-results", type=Path)
    parser.add_argument("--evaluate-check", type=Path)
    parser.add_argument("--reference", type=Path, default=ROOT / "reference_result.csv")
    parser.add_argument("--current-best", type=Path, default=ROOT / "student" / "results" / "current_best_by_case.csv")
    parser.add_argument("--abc", type=Path, default=ROOT / "student" / "abc")
    parser.add_argument("--yosys", type=Path, default=ROOT / "student" / "tools" / "conda-env" / "bin" / "yosys")
    parser.add_argument("--timeout", type=int, default=900)
    parser.add_argument("--no-yosys-abc", action="store_true")
    return parser.parse_args(argv)


def main(argv=None):
    args = parse_args(argv)
    rows = []
    for case in args.cases:
        rows.extend(run_case(args, case))
    write_csv(args.results, ALL_FIELDNAMES, rows)
    best = best_rows(rows)
    write_csv(args.best_results, BEST_FIELDNAMES, best)
    if args.summary_results:
        refs = load_reference(args.reference)
        current = load_current_best(args.current_best)
        write_csv(args.summary_results, SUMMARY_FIELDNAMES, [add_summary_columns(row, refs, current) for row in best])
    if args.evaluate_check:
        write_csv(
            args.evaluate_check,
            EVALUATE_FIELDNAMES,
            [{name: row.get(name, "") for name in EVALUATE_FIELDNAMES} for row in rows],
        )
    write_text(args.work_dir / "manifest.json", json.dumps(rows, indent=2, sort_keys=True) + "\n")
    print("Results: {0}".format(args.results))
    print("Best: {0}".format(args.best_results))
    print("Rows: {0}".format(len(rows)))
    print("Best cases: {0}/{1}".format(len(best), len(args.cases)))
    return 0 if len(best) == len(args.cases) else 1


if __name__ == "__main__":
    raise SystemExit(main())
