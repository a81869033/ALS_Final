#!/usr/bin/env python3
"""Selected-bit hybrids for FP16 log/log2.

Each candidate combines the current sign-exp-mant table with the calibrated
fixed-point semantic model from `fp16_log_deep_semantic.py`.  Only selected
output bits are taken from the semantic model; the remaining bits are taken from
the table.  Yosys flattening can then prune unused logic on both sides.
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
from student.generators.fp16_log_deep_semantic import render_fixed_candidate
from student.generators.fp16_semantic_search import (
    BEST_FIELDNAMES,
    CASE_LABELS,
    RESULT_FIELDNAMES,
    add_reference_columns,
    load_reference,
    metadata_row,
    rel_path,
    render_sign_exp_mant_case,
    verify_outputs,
    write_csv,
    write_text,
)


SEMANTIC_CONFIG = {
    "ex223": ("fixed_q20_calibrated_exc", 20, "round", True),
    "ex224": ("fixed_q18_calibrated_exc", 18, "round", True),
}

MASKS = [
    ("bit15", [15]),
    ("bit14", [14]),
    ("bit13", [13]),
    ("bit12", [12]),
    ("bit11", [11]),
    ("bit10", [10]),
    ("bit9", [9]),
    ("bit8", [8]),
    ("bit7", [7]),
    ("bit6", [6]),
    ("bit5", [5]),
    ("bit4", [4]),
    ("bit3", [3]),
    ("bit2", [2]),
    ("bit1", [1]),
    ("bit0", [0]),
    ("sign_exp", [15, 14, 13, 12, 11, 10]),
    ("exp_only", [14, 13, 12, 11, 10]),
    ("mant_hi", [9, 8, 7, 6, 5]),
    ("mant_lo", [4, 3, 2, 1, 0]),
    ("mant_all", [9, 8, 7, 6, 5, 4, 3, 2, 1, 0]),
    ("high8", [15, 14, 13, 12, 11, 10, 9, 8]),
    ("low8", [7, 6, 5, 4, 3, 2, 1, 0]),
]


def classification(_variant):
    return "semantic_hybrid"


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


def render_hybrid(case, outputs, module, mask_name, bits):
    table_module = module + "_table"
    semantic_module = module + "_semantic"
    table_v, table_items, _table_model = render_sign_exp_mant_case(outputs, table_module)
    semantic_variant, frac_bits, mode, allow_exceptions = SEMANTIC_CONFIG[case]
    semantic_v, semantic_items, semantic_model = render_fixed_candidate(
        case,
        outputs,
        semantic_module,
        semantic_variant,
        frac_bits,
        mode,
        allow_exceptions,
    )
    selected = set(bits)
    lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [15:0] out;",
        "  wire [15:0] table_out;",
        "  wire [15:0] sem_out;",
        "  {0} u_table(.in(in), .out(table_out));".format(table_module),
        "  {0} u_sem(.in(in), .out(sem_out));".format(semantic_module),
    ]
    for bit in range(16):
        source = "sem_out" if bit in selected else "table_out"
        lines.append("  assign out[{0}] = {1}[{0}];".format(bit, source))
    lines.extend(["endmodule", "", table_v, semantic_v])

    def model(index):
        sem = semantic_model(index)
        expected = outputs[index]
        value = 0
        for bit in range(16):
            source = sem if bit in selected else expected
            if (source >> bit) & 1:
                value |= 1 << bit
        return value

    items = "semantic_bits={0}; table_items={1}; semantic_items={2}".format(
        ",".join(str(bit) for bit in sorted(selected, reverse=True)),
        table_items,
        semantic_items,
    )
    return "\n".join(lines), items, model


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
    for mask_name, bits in MASKS:
        variant = "hybrid_semantic_{0}".format(mask_name)
        candidate_id = "{0}_{1}_{2}".format(case, label, variant)
        module = candidate_id
        verilog_path = case_dir / "verilog" / "{0}.v".format(candidate_id)
        aig_path = case_dir / "aigs" / "{0}.aig".format(candidate_id)
        script_path = case_dir / "logs" / "{0}.ys".format(candidate_id)
        log_path = case_dir / "logs" / "{0}.yosys.log".format(candidate_id)
        row = empty_row(case, candidate_id, label, variant, verilog_path, aig_path)
        start = time.time()
        try:
            verilog, items, model = render_hybrid(case, outputs, module, mask_name, bits)
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
                    tool_chain="yosys_fp16_log_selected_hybrid_{0}".format(mask_name),
                    aig_path=aig_path,
                    truth=truth_path,
                    abc=args.abc,
                    notes="semantic_hybrid FP16 selected-bit candidate; {0}".format(row["items"]),
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
    parser = argparse.ArgumentParser(description="Selected-bit hybrids for FP16 log/log2.")
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
