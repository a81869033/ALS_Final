#!/usr/bin/env python3
"""Balanced range-tree candidates for FP16 log/log2 cases."""

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
from student.generators.fp16_semantic_search import (
    BEST_FIELDNAMES,
    CASE_LABELS,
    MANT_BITS,
    MANT_SIZE,
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


EXP_BITS = 5
EXP_MAX = 31
THRESHOLDS = [128, 160, 256, 400, 700]


def compress_runs(values):
    runs = []
    start = 0
    current = values[0]
    for index, value in enumerate(values[1:], 1):
        if value != current:
            runs.append((start, index - 1, current))
            start = index
            current = value
    runs.append((start, len(values) - 1, current))
    return runs


def emit_range_tree(lines, runs, indent, target):
    if len(runs) == 1:
        lines.append("{0}{1} = {2};".format(indent, target, const_word(16, runs[0][2])))
        return
    mid = len(runs) // 2
    left = runs[:mid]
    right = runs[mid:]
    boundary = left[-1][1]
    lines.append("{0}if (mant <= {1}) begin".format(indent, const_word(MANT_BITS, boundary)))
    emit_range_tree(lines, left, indent + "  ", target)
    lines.append("{0}end else begin".format(indent))
    emit_range_tree(lines, right, indent + "  ", target)
    lines.append("{0}end".format(indent))


def render_balanced_ranges(outputs, module, threshold):
    lines = module_header(module)
    lines.extend(["  reg [15:0] out_r;", "  always @* begin"])
    lines.append("    if (exp == 5'h00) out_r = 16'hfc00;")
    lines.append("    else if (sign) out_r = 16'h7e00;")
    lines.append("    else if (exp == 5'h1f) out_r = (mant == 10'h000) ? 16'h7c00 : 16'h7e00;")
    lines.append("    else begin")
    lines.append("      case (exp)")
    range_groups = 0
    table_groups = 0
    range_items = 0
    table_items = 0
    for exp in range(1, EXP_MAX):
        values = [outputs[(exp << MANT_BITS) | mant] for mant in range(MANT_SIZE)]
        runs = compress_runs(values)
        lines.append("        {0}: begin".format(const_word(EXP_BITS, exp)))
        if len(runs) <= threshold:
            range_groups += 1
            range_items += len(runs)
            emit_range_tree(lines, runs, "          ", "out_r")
        else:
            table_groups += 1
            lines.append("          case (mant)")
            for mant, value in enumerate(values):
                lines.append("            {0}: out_r = {1};".format(const_word(MANT_BITS, mant), const_word(16, value)))
                table_items += 1
            lines.extend(["            default: out_r = 16'h0000;", "          endcase"])
        lines.append("        end")
    lines.extend(["        default: out_r = 16'h0000;", "      endcase", "    end", "  end", "  assign out = out_r;"])
    lines.extend(footer())
    meta = "threshold={0}; range_groups={1}; table_groups={2}; range_items={3}; table_items={4}".format(
        threshold,
        range_groups,
        table_groups,
        range_items,
        table_items,
    )
    return "\n".join(lines), meta, lambda index: outputs[index]


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
        "classification": "structural_exact",
        "notes": "",
    }


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
    for threshold in THRESHOLDS:
        variant = "balanced_ranges_t{0}".format(threshold)
        candidate_id = "{0}_{1}_{2}".format(case, label, variant)
        module = candidate_id
        verilog_path = case_dir / "verilog" / "{0}.v".format(candidate_id)
        aig_path = case_dir / "aigs" / "{0}.aig".format(candidate_id)
        script_path = case_dir / "logs" / "{0}.ys".format(candidate_id)
        log_path = case_dir / "logs" / "{0}.yosys.log".format(candidate_id)
        row = empty_row(case, candidate_id, label, variant, verilog_path, aig_path)
        start = time.time()
        try:
            verilog, items, model = render_balanced_ranges(outputs, module, threshold)
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
                    tool_chain="yosys_fp16_log_balanced_ranges_t{0}".format(threshold),
                    aig_path=aig_path,
                    truth=truth_path,
                    abc=args.abc,
                    notes="balanced range-tree FP16 log candidate; {0}".format(row["items"]),
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
    parser = argparse.ArgumentParser(description="Balanced range-tree FP16 log/log2 candidates.")
    parser.add_argument("--work-dir", type=Path, required=True)
    parser.add_argument("--results", type=Path, required=True)
    parser.add_argument("--best-results", type=Path, required=True)
    parser.add_argument("--metadata", type=Path, required=True)
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--reference", type=Path, default=ROOT / "reference_result.csv")
    parser.add_argument("--yosys", type=Path, default=ROOT / "student" / "tools" / "conda-env" / "bin" / "yosys")
    parser.add_argument("--abc", type=Path, default=ROOT / "student" / "abc")
    parser.add_argument("--timeout", type=int, default=900)
    return parser.parse_args(argv)


def main(argv=None):
    args = parse_args(argv)
    refs = load_reference(args.reference)
    rows = []
    metadata = []
    for case in ["ex223", "ex224"]:
        case_rows, case_meta = run_case(args, case, refs)
        rows.extend(case_rows)
        metadata.append(case_meta)
    write_csv(args.results, RESULT_FIELDNAMES, rows)
    write_csv(args.best_results, BEST_FIELDNAMES, best_rows(rows))
    write_csv(args.metadata, list(metadata[0].keys()), metadata)
    print("wrote {0}".format(args.results))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
