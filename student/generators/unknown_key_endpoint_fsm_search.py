#!/usr/bin/env python3
"""Generate endpoint-pair DFA-style RTL in the prefix-key domain."""

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
from student.generators.unknown_algebraic_search import key_lines_for_transform, transform_index
from student.generators.unknown_bdd_key_cofactor_search import parse_list, transformed_outputs
from student.generators.unknown_key_ac_decomp_search import (
    EVALUATE_FIELDNAMES,
    SUMMARY_FIELDNAMES,
    add_summary_columns,
    compose_index,
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


def vector_decl(width):
    return "[{0}:0] ".format(width - 1) if width > 0 else ""


def state_width(count):
    return max(1, (count - 1).bit_length())


def endpoint_steps(width):
    steps = []
    used = set()
    for index in range((width + 1) // 2):
        bits = []
        for bit in (index, width - 1 - index):
            if bit not in used:
                bits.append(bit)
                used.add(bit)
        steps.append(bits)
    return steps


def flatten_steps(steps):
    bits = []
    for step in steps:
        bits.extend(step)
    return bits


def class_map(outputs_by_key, width, steps):
    outer_bits = flatten_steps(steps)
    free_bits = [bit for bit in range(width) if bit not in outer_bits]
    sig_to_id = {}
    prefix_to_id = {}
    signatures = []
    for outer_value in range(1 << len(outer_bits)):
        signature = tuple(
            outputs_by_key[compose_index(free_bits, free_value, outer_bits, outer_value)]
            for free_value in range(1 << len(free_bits))
        )
        if signature not in sig_to_id:
            sig_to_id[signature] = len(sig_to_id)
            signatures.append(signature)
        prefix_to_id[outer_value] = sig_to_id[signature]
    return outer_bits, prefix_to_id, signatures


def build_endpoint_fsm(outputs_by_key, width):
    steps = endpoint_steps(width)
    levels = []
    for count in range(1, len(steps) + 1):
        levels.append(class_map(outputs_by_key, width, steps[:count]))

    transitions = []
    for level in range(1, len(steps)):
        prev_outer, prev_map, prev_sigs = levels[level - 1]
        _outer, current_map, current_sigs = levels[level]
        symbol_bits = steps[level]
        symbol_width = len(symbol_bits)
        table = {}
        for prefix_value, class_id in prev_map.items():
            for symbol in range(1 << symbol_width):
                full_value = prefix_value | (symbol << len(prev_outer))
                key = (class_id, symbol)
                target = current_map[full_value]
                if key in table and table[key] != target:
                    raise RuntimeError("non-deterministic endpoint transition at level {0}".format(level + 1))
                table[key] = target
        transitions.append(
            {
                "level": level + 1,
                "prev_classes": len(prev_sigs),
                "classes": len(current_sigs),
                "symbol_bits": symbol_bits,
                "symbol_width": symbol_width,
                "table": table,
            }
        )
    return steps, levels, transitions


def symbol_expr(bits):
    if len(bits) == 1:
        return "key[{0}]".format(bits[0])
    return "{" + ", ".join("key[{0}]".format(bit) for bit in reversed(bits)) + "}"


def render(outputs, module, input_width, output_width, transform):
    outputs_by_key = transformed_outputs(outputs, input_width, transform)
    steps, levels, transitions = build_endpoint_fsm(outputs_by_key, input_width)
    first_outer, first_map, first_sigs = levels[0]
    final_sigs = levels[-1][2]
    lines = [
        "module {0}(in, out);".format(module),
        "  input {0}in;".format(range_decl(input_width)),
        "  output {0}out;".format(range_decl(output_width)),
    ]
    lines.extend(key_lines_for_transform(transform, input_width))
    first_width = state_width(len(first_sigs))
    lines.append("  reg {0}st_1;".format(vector_decl(first_width)))
    lines.append("  always @* begin")
    lines.append("    case ({0})".format(symbol_expr(steps[0])))
    for symbol, class_id in sorted(first_map.items()):
        lines.append("      {0}: st_1 = {1};".format(const_word(len(steps[0]), symbol), const_word(first_width, class_id)))
    lines.append("      default: st_1 = {0};".format(const_word(first_width, 0)))
    lines.append("    endcase")
    lines.append("  end")

    for transition in transitions:
        level = transition["level"]
        prev_width = state_width(transition["prev_classes"])
        current_width = state_width(transition["classes"])
        symbol_width = transition["symbol_width"]
        key_width = prev_width + symbol_width
        lines.append("  reg {0}st_{1};".format(vector_decl(current_width), level))
        lines.append("  always @* begin")
        lines.append("    case ({st_%d, %s})" % (level - 1, symbol_expr(transition["symbol_bits"])))
        for (class_id, symbol), target in sorted(transition["table"].items()):
            case_value = (class_id << symbol_width) | symbol
            lines.append("      {0}: st_{1} = {2};".format(const_word(key_width, case_value), level, const_word(current_width, target)))
        lines.append("      default: st_{0} = {1};".format(level, const_word(current_width, 0)))
        lines.append("    endcase")
        lines.append("  end")

    final_width = state_width(len(final_sigs))
    final_state = "st_{0}".format(len(steps))
    lines.append("  reg {0}out_r;".format(range_decl(output_width)))
    lines.append("  always @* begin")
    lines.append("    case ({0})".format(final_state))
    for class_id, signature in enumerate(final_sigs):
        if len(signature) != 1:
            raise RuntimeError("final signature should contain one output")
        lines.append("      {0}: out_r = {1};".format(const_word(final_width, class_id), const_word(output_width, signature[0])))
    lines.append("      default: out_r = {0};".format(const_word(output_width, 0)))
    lines.append("    endcase")
    lines.append("  end")
    lines.append("  assign out = out_r;")
    lines.append("endmodule")
    lines.append("")

    def model(index):
        key = transform_index(transform, index, input_width)
        prefix_value = 0
        offset = 0
        for level, step in enumerate(steps, start=1):
            symbol = 0
            for pos, bit in enumerate(step):
                if (key >> bit) & 1:
                    symbol |= 1 << pos
            prefix_value |= symbol << offset
            offset += len(step)
        class_id = levels[-1][1][prefix_value]
        return final_sigs[class_id][0]

    class_counts = [len(item[2]) for item in levels]
    transition_counts = [len(item["table"]) for item in transitions]
    items = "transform={0}; steps={1}; class_counts={2}; transition_counts={3}; hash_inputs={4}".format(
        transform,
        "/".join(":".join(str(bit) for bit in step) for step in steps),
        ":".join(str(count) for count in class_counts),
        ":".join(str(count) for count in transition_counts),
        len(outputs),
    )
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
    return True, "exact endpoint FSM model over {0} inputs".format(len(outputs))


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
        "hypothesis": "unknown_key_endpoint_fsm",
        "variants": [],
    }
    for transform in args.transforms:
        candidate_id = "{0}_unknown_key_endpoint_fsm_{1}".format(case, transform)
        module = candidate_id
        verilog_path = args.work_dir / case / "verilog" / "{0}.v".format(candidate_id)
        aig_path = args.work_dir / case / "aigs" / "{0}.aig".format(candidate_id)
        script_path = args.work_dir / case / "logs" / "{0}.ys".format(candidate_id)
        log_path = args.work_dir / case / "logs" / "{0}.yosys.log".format(candidate_id)
        start = time.time()
        row = {
            "case": case,
            "candidate_id": candidate_id,
            "hypothesis": "unknown_key_endpoint_fsm",
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
            verilog, items, model = render(
                outputs,
                module,
                table.input_width,
                table.output_width,
                transform,
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
                    parent_id="unknown_key_endpoint_fsm",
                    source="ai_verilog",
                    tool_chain="yosys_unknown_key_endpoint_fsm",
                    aig_path=aig_path,
                    truth=truth_path,
                    abc=args.abc,
                    notes="unknown endpoint-pair FSM Verilog seed",
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
    parser = argparse.ArgumentParser(description="Generate endpoint-pair FSM candidates.")
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
