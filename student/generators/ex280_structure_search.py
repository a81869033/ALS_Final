#!/usr/bin/env python3
"""Targeted front-end-only structure search for ex280.

This script keeps the current ex280 work separate from the broader unknown
generators.  It searches for exact structural seeds without running backend
optimization flows such as ABC portfolios, MockTurtle, CULS, or E-Syn.
"""

import argparse
import csv
import json
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
from student.generators.unknown_algebraic_search import (
    anf_by_bit,
    anf_stats,
    render_anf_davio,
)
from student.generators.unknown_bdd_search import render_bdd_verilog
from student.generators.unknown_verilog_search import (
    ALL_FIELDNAMES,
    BEST_FIELDNAMES,
    const_word,
    range_decl,
    text_hash,
    write_csv,
    write_text,
)


DEFAULT_DAVIO_ORDERS = [
    ("davio_pair_399a", [0, 11, 1, 10, 2, 9, 3, 8, 4, 7, 5, 6]),
    ("davio_pair_399b", [0, 11, 1, 10, 2, 9, 3, 8, 4, 6, 7, 5]),
    ("davio_pair_402", [0, 1, 10, 11, 2, 9, 3, 8, 4, 6, 5, 7]),
    ("davio_reverse", list(reversed(range(12)))),
]

DEFAULT_BDD_ORDERS = [
    ("bdd_sift_449", [11, 0, 1, 10, 2, 9, 3, 8, 4, 6, 7, 5]),
    ("bdd_sift_alt", [0, 11, 1, 10, 2, 9, 3, 8, 4, 6, 7, 5]),
    ("bdd_pair_399a", [0, 11, 1, 10, 2, 9, 3, 8, 4, 7, 5, 6]),
]


def bit_reverse(value, width):
    out = 0
    for bit in range(width):
        if value & (1 << bit):
            out |= 1 << (width - 1 - bit)
    return out


def complement(value, width):
    return value ^ ((1 << width) - 1)


def transform_value(name, value, width):
    if name == "id":
        return value
    if name == "rev":
        return bit_reverse(value, width)
    if name == "not":
        return complement(value, width)
    if name == "notrev":
        return bit_reverse(complement(value, width), width)
    raise RuntimeError("unknown transform: {0}".format(name))


def eca_step(value, width, rule, boundary):
    out = 0
    for bit in range(width):
        if boundary == "cyclic":
            left = (value >> ((bit + 1) % width)) & 1
            right = (value >> ((bit - 1) % width)) & 1
        elif boundary == "zero":
            left = (value >> (bit + 1)) & 1 if bit + 1 < width else 0
            right = (value >> (bit - 1)) & 1 if bit > 0 else 0
        elif boundary == "one":
            left = (value >> (bit + 1)) & 1 if bit + 1 < width else 1
            right = (value >> (bit - 1)) & 1 if bit > 0 else 1
        else:
            raise RuntimeError("unknown boundary: {0}".format(boundary))
        center = (value >> bit) & 1
        table_index = (left << 2) | (center << 1) | right
        if (rule >> table_index) & 1:
            out |= 1 << bit
    return out


def eca_model(index, width, rule, boundary, rounds, input_transform, output_transform):
    value = transform_value(input_transform, index, width)
    for _ in range(rounds):
        value = eca_step(value, width, rule, boundary)
    return transform_value(output_transform, value, width)


def search_eca(outputs, width, max_rounds, deadline):
    transforms = ["id", "rev", "not", "notrev"]
    boundaries = ["cyclic", "zero", "one"]
    count = 1 << width
    seeds = {}
    for input_transform in transforms:
        seeds[input_transform] = [
            transform_value(input_transform, index, width) for index in range(count)
        ]

    best = []
    for input_transform in transforms:
        for output_transform in transforms:
            for boundary in boundaries:
                for rule in range(256):
                    if time.time() > deadline:
                        return [], best, "timeout"
                    values = list(seeds[input_transform])
                    for rounds in range(1, max_rounds + 1):
                        values = [
                            eca_step(value, width, rule, boundary) for value in values
                        ]
                        mapped = [
                            transform_value(output_transform, value, width)
                            for value in values
                        ]
                        hamming_words = 0
                        hamming_bits = 0
                        for actual, expected in zip(mapped, outputs):
                            diff = actual ^ expected
                            if diff:
                                hamming_words += 1
                                hamming_bits += bin(diff).count("1")
                        item = (
                            hamming_bits,
                            hamming_words,
                            input_transform,
                            output_transform,
                            boundary,
                            rule,
                            rounds,
                        )
                        if hamming_words == 0:
                            return [item], best, "exact"
                        if len(best) < 20 or item < best[-1]:
                            best.append(item)
                            best.sort()
                            best = best[:20]
    return [], best, "exhausted"


def render_eca_verilog(module, width, rule, boundary, rounds, input_transform, output_transform):
    lines = [
        "module {0}(in, out);".format(module),
        "  input {0}in;".format(range_decl(width)),
        "  output {0}out;".format(range_decl(width)),
    ]
    if input_transform == "id":
        lines.append("  wire {0}s_0 = in;".format(range_decl(width)))
    elif input_transform == "rev":
        lines.append(
            "  wire {0}s_0 = {{{1}}};".format(
                range_decl(width),
                ", ".join("in[{0}]".format(bit) for bit in range(width)),
            )
        )
    elif input_transform == "not":
        lines.append("  wire {0}s_0 = ~in;".format(range_decl(width)))
    elif input_transform == "notrev":
        lines.append(
            "  wire {0}s_0 = ~{{{1}}};".format(
                range_decl(width),
                ", ".join("in[{0}]".format(bit) for bit in range(width)),
            )
        )
    else:
        raise RuntimeError("unknown input transform")

    for round_index in range(rounds):
        src = "s_{0}".format(round_index)
        dst = "s_{0}".format(round_index + 1)
        lines.append("  wire {0}{1};".format(range_decl(width), dst))
        for bit in range(width):
            terms = []
            for table_index in range(8):
                if not ((rule >> table_index) & 1):
                    continue
                left_bit = (table_index >> 2) & 1
                center_bit = (table_index >> 1) & 1
                right_bit = table_index & 1
                factors = []
                if boundary == "cyclic":
                    left_expr = "{0}[{1}]".format(src, (bit + 1) % width)
                    right_expr = "{0}[{1}]".format(src, (bit - 1) % width)
                elif boundary == "zero":
                    left_expr = "{0}[{1}]".format(src, bit + 1) if bit + 1 < width else "1'b0"
                    right_expr = "{0}[{1}]".format(src, bit - 1) if bit > 0 else "1'b0"
                elif boundary == "one":
                    left_expr = "{0}[{1}]".format(src, bit + 1) if bit + 1 < width else "1'b1"
                    right_expr = "{0}[{1}]".format(src, bit - 1) if bit > 0 else "1'b1"
                else:
                    raise RuntimeError("unknown boundary")
                center_expr = "{0}[{1}]".format(src, bit)
                for expr, expected in (
                    (left_expr, left_bit),
                    (center_expr, center_bit),
                    (right_expr, right_bit),
                ):
                    factors.append(expr if expected else "~({0})".format(expr))
                terms.append("(" + " & ".join(factors) + ")")
            if terms:
                lines.append("  assign {0}[{1}] = {2};".format(dst, bit, " | ".join(terms)))
            else:
                lines.append("  assign {0}[{1}] = 1'b0;".format(dst, bit))

    final = "s_{0}".format(rounds)
    if output_transform == "id":
        lines.append("  assign out = {0};".format(final))
    elif output_transform == "rev":
        lines.append(
            "  assign out = {{{0}}};".format(
                ", ".join("{0}[{1}]".format(final, bit) for bit in range(width))
            )
        )
    elif output_transform == "not":
        lines.append("  assign out = ~{0};".format(final))
    elif output_transform == "notrev":
        lines.append(
            "  assign out = ~{{{0}}};".format(
                ", ".join("{0}[{1}]".format(final, bit) for bit in range(width))
            )
        )
    else:
        raise RuntimeError("unknown output transform")
    lines.append("endmodule")
    lines.append("")

    def model(index):
        return eca_model(index, width, rule, boundary, rounds, input_transform, output_transform)

    items = "eca_rule={0}; boundary={1}; rounds={2}; input_transform={3}; output_transform={4}".format(
        rule,
        boundary,
        rounds,
        input_transform,
        output_transform,
    )
    return "\n".join(lines), items, model


def render_davio_candidate(outputs, module, width, name, order, max_nodes):
    terms_by_bit = anf_by_bit(outputs, width, width)
    stats = anf_stats(terms_by_bit)
    return render_anf_davio(
        outputs=outputs,
        module=module,
        input_width=width,
        output_width=width,
        transform="identity",
        terms_by_bit=terms_by_bit,
        stats=stats,
        max_nodes=max_nodes,
        order_name=name,
        order=order,
    )


def verify_outputs(outputs, model):
    for index, expected in enumerate(outputs):
        actual = model(index)
        if actual != expected:
            return False, "first mismatch index={0} expected=0x{1:x} actual=0x{2:x}".format(
                index,
                expected,
                actual,
            )
    return True, "exact ex280 model over {0} inputs".format(len(outputs))


def best_rows(rows):
    valid = [row for row in rows if row["equivalent"] == "1" and row["adp"]]
    if not valid:
        return []
    item = min(valid, key=lambda row: int(row["adp"]))
    return [{name: item.get(name, "") for name in BEST_FIELDNAMES}]


def add_row(args, rows, seen_hashes, case, variant, render_result, use_yosys_abc):
    module = "ex280_struct_{0}".format(variant)
    verilog, items, model = render_result
    digest = text_hash(verilog)
    if digest in seen_hashes:
        return
    seen_hashes.add(digest)

    case_dir = args.work_dir / case
    verilog_path = case_dir / "verilog" / "{0}.v".format(module)
    aig_path = case_dir / "aigs" / "{0}.aig".format(module)
    script_path = case_dir / "logs" / "{0}.ys".format(module)
    log_path = case_dir / "logs" / "{0}.yosys.log".format(module)

    row = {
        "case": case,
        "candidate_id": module,
        "hypothesis": "ex280_targeted_structure",
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
        "items": items,
        "notes": "",
    }
    start = time.time()
    try:
        verified, note = verify_outputs(args.outputs, model)
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
                use_abc=use_yosys_abc,
                script_out=script_path,
            )
            write_text(log_path, yosys_log)
            row["synthesized"] = "1"
            evaluated = evaluate_aig(
                case=case,
                candidate_id=module,
                parent_id="ex280_targeted_structure",
                source="ai_verilog",
                tool_chain="yosys_abc" if use_yosys_abc else "yosys_noabc",
                aig_path=aig_path,
                truth=args.truth_path,
                abc=args.abc,
                notes="targeted ex280 structural Verilog seed",
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


def parse_args(argv=None):
    parser = argparse.ArgumentParser(description="Targeted ex280 structural seed search.")
    parser.add_argument("--case", default="ex280")
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--work-dir", type=Path, default=ROOT / "student" / "work" / "target_ex280_structure")
    parser.add_argument("--results", type=Path, default=ROOT / "student" / "results" / "target_ex280_structure.csv")
    parser.add_argument("--best-results", type=Path, default=ROOT / "student" / "results" / "target_ex280_structure_best.csv")
    parser.add_argument("--abc", type=Path, default=ROOT / "student" / "abc")
    parser.add_argument("--yosys", type=Path, default=ROOT / "student" / "tools" / "conda-env" / "bin" / "yosys")
    parser.add_argument("--timeout", type=int, default=300)
    parser.add_argument("--max-eca-rounds", type=int, default=8)
    parser.add_argument("--max-davio-nodes", type=int, default=250000)
    parser.add_argument("--use-yosys-abc", action="store_true")
    parser.add_argument("--emit-only", action="store_true")
    return parser.parse_args(argv)


def main(argv=None):
    args = parse_args(argv)
    args.truth_path = args.benchmarks / "{0}.truth".format(args.case)
    table = TruthTable(args.truth_path)
    if args.case != "ex280" or table.input_width != 12 or table.output_width != 12:
        raise RuntimeError("this targeted script currently supports ex280 only")
    args.outputs = list(table.iter_outputs())
    rows = []
    seen_hashes = set()

    manifest = {
        "case": args.case,
        "truth": str(args.truth_path),
        "timeout_sec": args.timeout,
        "use_yosys_abc": args.use_yosys_abc,
        "diagnostics": {},
        "variants": [],
    }

    deadline = time.time() + args.timeout
    exact_eca, best_eca, eca_status = search_eca(
        args.outputs,
        table.input_width,
        args.max_eca_rounds,
        deadline,
    )
    manifest["diagnostics"]["eca_status"] = eca_status
    manifest["diagnostics"]["eca_best"] = [
        {
            "hamming_bits": item[0],
            "hamming_words": item[1],
            "input_transform": item[2],
            "output_transform": item[3],
            "boundary": item[4],
            "rule": item[5],
            "rounds": item[6],
        }
        for item in best_eca[:20]
    ]
    for item in exact_eca:
        _, _, input_transform, output_transform, boundary, rule, rounds = item
        variant = "eca_rule{0}_{1}_r{2}_{3}_{4}".format(
            rule,
            boundary,
            rounds,
            input_transform,
            output_transform,
        )
        add_row(
            args,
            rows,
            seen_hashes,
            args.case,
            variant,
            render_eca_verilog(
                module="ex280_struct_{0}".format(variant),
                width=table.input_width,
                rule=rule,
                boundary=boundary,
                rounds=rounds,
                input_transform=input_transform,
                output_transform=output_transform,
            ),
            args.use_yosys_abc,
        )

    for name, order in DEFAULT_DAVIO_ORDERS:
        add_row(
            args,
            rows,
            seen_hashes,
            args.case,
            name,
            render_davio_candidate(
                args.outputs,
                "ex280_struct_{0}".format(name),
                table.input_width,
                name,
                order,
                args.max_davio_nodes,
            ),
            args.use_yosys_abc,
        )

    for name, order in DEFAULT_BDD_ORDERS:
        add_row(
            args,
            rows,
            seen_hashes,
            args.case,
            name,
            render_bdd_verilog(
                args.outputs,
                "ex280_struct_{0}".format(name),
                table.input_width,
                table.output_width,
                name,
                order,
            ),
            args.use_yosys_abc,
        )

    manifest["variants"] = rows
    write_text(
        args.work_dir / args.case / "manifest.json",
        json.dumps(manifest, indent=2, sort_keys=True) + "\n",
    )
    write_csv(args.results, ALL_FIELDNAMES, rows)
    best = best_rows(rows)
    write_csv(args.best_results, BEST_FIELDNAMES, best)

    print("ECA status: {0}".format(eca_status))
    if best_eca:
        print("ECA nearest: {0}".format(best_eca[0]))
    print("Rows: {0}".format(len(rows)))
    print("Results: {0}".format(args.results))
    print("Best: {0}".format(args.best_results))
    if best:
        print("Best ADP: {0}".format(best[0]["adp"]))
    return 0 if rows else 1


if __name__ == "__main__":
    raise SystemExit(main())
