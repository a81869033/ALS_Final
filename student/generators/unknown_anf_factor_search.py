#!/usr/bin/env python3
"""Generate split-factorized ANF Verilog for unknown cases."""

import argparse
import csv
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
    parse_cases,
    range_decl,
    text_hash,
    write_csv,
    write_text,
)


def xor_expr(items):
    if not items:
        return "1'b0"
    if len(items) == 1:
        return items[0]
    return "(" + " ^ ".join(items) + ")"


def and_expr(items):
    if not items:
        return "1'b1"
    if len(items) == 1:
        return items[0]
    return "(" + " & ".join(items) + ")"


def split_width(input_width, split):
    if split == "floor":
        return input_width // 2
    if split == "ceil":
        return (input_width + 1) // 2
    if split.startswith("low"):
        width = int(split[3:])
        if width < 1 or width >= input_width:
            raise RuntimeError("bad low split {0} for width {1}".format(split, input_width))
        return width
    raise RuntimeError("unknown split: {0}".format(split))


def product_signal(lines, prefix, mask, offset, width):
    if mask == 0:
        return "1'b1"
    name = "{0}_{1:x}".format(prefix, mask)
    terms = []
    for bit in range(width):
        if (mask >> bit) & 1:
            terms.append("key[{0}]".format(offset + bit))
    lines.append("  wire {0} = {1};".format(name, and_expr(terms)))
    return name


def render(outputs, module, input_width, output_width, transform, split):
    values = transformed_outputs(outputs, input_width, transform)
    terms_by_bit = anf_by_bit(values, input_width, output_width)
    low_width = split_width(input_width, split)
    high_width = input_width - low_width
    low_mask_all = (1 << low_width) - 1

    groups = defaultdict(lambda: defaultdict(list))
    used_low = set()
    used_high = set()
    for bit, terms in enumerate(terms_by_bit):
        for mask in terms:
            low_mask = mask & low_mask_all
            high_mask = mask >> low_width
            groups[high_mask][bit].append(low_mask)
            used_low.add(low_mask)
            used_high.add(high_mask)

    lines = [
        "module {0}(in, out);".format(module),
        "  input {0}in;".format(range_decl(input_width)),
        "  output {0}out;".format(range_decl(output_width)),
    ]
    lines.extend(key_lines_for_transform(transform, input_width))

    low_signals = {}
    for mask in sorted(used_low):
        low_signals[mask] = product_signal(lines, "lo", mask, 0, low_width)
    high_signals = {}
    for mask in sorted(used_high):
        high_signals[mask] = product_signal(lines, "hi", mask, low_width, high_width)

    term_count = 0
    coeff_count = 0
    for bit in range(output_width):
        bit_terms = []
        for high_mask in sorted(groups):
            low_masks = groups[high_mask].get(bit, [])
            if not low_masks:
                continue
            coeff = xor_expr([low_signals[mask] for mask in sorted(low_masks)])
            high = high_signals[high_mask]
            if high == "1'b1":
                bit_terms.append(coeff)
            else:
                bit_terms.append("({0} & {1})".format(high, coeff))
            coeff_count += 1
            term_count += len(low_masks)
        lines.append("  assign out[{0}] = {1};".format(bit, xor_expr(bit_terms)))
    lines.append("endmodule")
    lines.append("")

    items = (
        "transform={0}; split={1}; low_width={2}; high_width={3}; "
        "high_groups={4}; low_monomials={5}; coeff_terms={6}; anf_terms={7}"
    ).format(
        transform,
        split,
        low_width,
        high_width,
        len(used_high),
        len(used_low),
        coeff_count,
        term_count,
    )

    def model(index):
        key = index
        if transform != "identity":
            # values is indexed by transformed key, so direct ANF eval expects the key-domain index.
            # The caller passes raw input index; transformed_outputs already re-indexed terms.
            from student.generators.unknown_algebraic_search import transform_index

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
    return True, "exact factorized ANF model over {0} inputs".format(len(outputs))


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
        "hypothesis": "unknown_factorized_anf",
        "variants": [],
    }
    for transform in args.transforms:
        for split in args.splits:
            variant = "{0}_{1}".format(transform, split)
            candidate_id = "{0}_unknown_factorized_anf_{1}".format(case, variant)
            module = candidate_id
            verilog_path = args.work_dir / case / "verilog" / "{0}.v".format(candidate_id)
            aig_path = args.work_dir / case / "aigs" / "{0}.aig".format(candidate_id)
            script_path = args.work_dir / case / "logs" / "{0}.ys".format(candidate_id)
            log_path = args.work_dir / case / "logs" / "{0}.yosys.log".format(candidate_id)
            start = time.time()
            row = {
                "case": case,
                "candidate_id": candidate_id,
                "hypothesis": "unknown_factorized_anf",
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
                verilog, items, model = render(
                    outputs,
                    module,
                    table.input_width,
                    table.output_width,
                    transform,
                    split,
                )
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
                        parent_id="unknown_factorized_anf",
                        source="ai_verilog",
                        tool_chain="yosys_unknown_factorized_anf",
                        aig_path=aig_path,
                        truth=truth_path,
                        abc=args.abc,
                        notes="unknown split-factorized ANF Verilog seed",
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
                    variant,
                    row["equivalent"],
                    row["area"],
                    row["delay"],
                    row["adp"],
                ),
                flush=True,
            )
    write_text(args.work_dir / case / "manifest.json", json.dumps(manifest, indent=2, sort_keys=True) + "\n")
    return rows


def parse_list(text):
    return [item.strip() for item in text.split(",") if item.strip()]


def parse_args(argv=None):
    parser = argparse.ArgumentParser(description="Generate split-factorized ANF candidates.")
    parser.add_argument("--cases", type=parse_cases, required=True)
    parser.add_argument("--transforms", type=parse_list, default=parse_list("prefix_parity_reduce"))
    parser.add_argument("--splits", type=parse_list, default=parse_list("floor,ceil"))
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
