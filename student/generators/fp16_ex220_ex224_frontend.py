#!/usr/bin/env python3
"""Curated frontend seeds for FP16 ex220-ex224.

This driver is intentionally narrow.  It reuses the exact truth convention and
measurement helpers from the generic FP16 search, but emits only a small set of
semantic/structural candidates for exp/log style functions.
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
from student.generators.fp16_semantic_search import (
    BEST_FIELDNAMES,
    CASE_LABELS,
    EXP_BITS,
    EXP_MAX,
    MANT_BITS,
    MANT_SIZE,
    RESULT_FIELDNAMES,
    add_reference_columns,
    choose_mode,
    const_word,
    field_assign,
    footer,
    header,
    load_reference,
    metadata_row,
    module_header,
    output_fields,
    rel_path,
    render_exp_mant_delta_pair,
    render_exp_mant_pair_case,
    render_positive_default_exp_mant,
    render_semantic_exp_delta_fields,
    render_sign_exp_mant_case,
    render_split_sign_exp_mant_case,
    verify_outputs,
    write_csv,
    write_text,
)


LOG_CASES = {"ex223", "ex224"}


def render_log_special_shell(outputs, module):
    lines = module_header(module)
    lines.extend(["  reg [15:0] out_r;", "  always @* begin"])
    lines.append("    if (exp == 5'h00) begin")
    lines.append("      out_r = 16'hfc00;")
    lines.append("    end else if (sign) begin")
    lines.append("      out_r = 16'h7e00;")
    lines.append("    end else if (exp == 5'h1f) begin")
    lines.append("      out_r = (mant == 10'h000) ? 16'h7c00 : 16'h7e00;")
    lines.append("    end else begin")
    lines.append("      case (exp)")
    items = 0
    for exp in range(1, EXP_MAX):
        base = exp << MANT_BITS
        values = [outputs[base | mant] for mant in range(MANT_SIZE)]
        lines.append("        {0}: begin".format(const_word(EXP_BITS, exp)))
        lines.append("          case (mant)")
        for mant, value in enumerate(values):
            lines.append("            {0}: out_r = {1};".format(const_word(MANT_BITS, mant), const_word(16, value)))
            items += 1
        lines.extend(["            default: out_r = 16'h0000;", "          endcase", "        end"])
    lines.extend(
        [
            "        default: out_r = 16'h0000;",
            "      endcase",
            "    end",
            "  end",
            "  assign out = out_r;",
        ]
    )
    lines.extend(footer())
    return "\n".join(lines), "positive_normal_entries={0}; special_shell=log".format(items), lambda index: outputs[index]


def render_log_positive_field_split(outputs, module):
    lines = module_header(module)
    lines.extend(
        [
            "  reg out_sign;",
            "  reg [4:0] out_exp;",
            "  reg [9:0] out_mant;",
            "  reg [15:0] special_out;",
            "  reg use_special;",
            "  always @* begin",
            "    use_special = 1'b1;",
            "    special_out = 16'h0000;",
            "    out_sign = 1'b0;",
            "    out_exp = 5'h00;",
            "    out_mant = 10'h000;",
            "    if (exp == 5'h00) begin",
            "      special_out = 16'hfc00;",
            "    end else if (sign) begin",
            "      special_out = 16'h7e00;",
            "    end else if (exp == 5'h1f) begin",
            "      special_out = (mant == 10'h000) ? 16'h7c00 : 16'h7e00;",
            "    end else begin",
            "      use_special = 1'b0;",
            "      case (exp)",
        ]
    )
    items = 0
    full_default = 0
    for exp in range(1, EXP_MAX):
        base = exp << MANT_BITS
        values = [outputs[base | mant] for mant in range(MANT_SIZE)]
        default = choose_mode(values)
        exceptions = [(mant, value) for mant, value in enumerate(values) if value != default]
        lines.append("        {0}: begin".format(const_word(EXP_BITS, exp)))
        lines.append("          {0}".format(field_assign("out", default)))
        if exceptions:
            lines.append("          case (mant)")
            for mant, value in exceptions:
                lines.append("            {0}: begin {1} end".format(const_word(MANT_BITS, mant), field_assign("out", value)))
                items += 1
            lines.extend(["            default: begin end", "          endcase"])
        else:
            full_default += 1
            items += 1
        lines.append("        end")
    lines.extend(
        [
            "        default: begin end",
            "      endcase",
            "    end",
            "  end",
            "  assign out = use_special ? special_out : {out_sign, out_exp, out_mant};",
        ]
    )
    lines.extend(footer())
    return "\n".join(lines), "positive_field_split_entries={0}; full_default_exp={1}".format(items, full_default), lambda index: outputs[index]


def render_log_positive_base_delta(outputs, module):
    lines = module_header(module)
    lines.extend(
        [
            "  reg [15:0] base_out;",
            "  reg [15:0] delta_out;",
            "  wire [15:0] pos_out = base_out ^ delta_out;",
            "  always @* begin",
            "    case (exp)",
        ]
    )
    items = 0
    for exp in range(1, EXP_MAX):
        base = outputs[exp << MANT_BITS]
        lines.append("      {0}: base_out = {1};".format(const_word(EXP_BITS, exp), const_word(16, base)))
        items += 1
    lines.extend(["      default: base_out = 16'h0000;", "    endcase", "  end"])
    lines.extend(["  always @* begin", "    case (exp)"])
    for exp in range(1, EXP_MAX):
        base_index = exp << MANT_BITS
        base_value = outputs[base_index]
        deltas = [outputs[base_index | mant] ^ base_value for mant in range(MANT_SIZE)]
        if len(set(deltas)) == 1:
            lines.append("      {0}: delta_out = {1};".format(const_word(EXP_BITS, exp), const_word(16, deltas[0])))
            items += 1
            continue
        lines.append("      {0}: begin".format(const_word(EXP_BITS, exp)))
        lines.append("        case (mant)")
        for mant, delta in enumerate(deltas):
            lines.append("          {0}: delta_out = {1};".format(const_word(MANT_BITS, mant), const_word(16, delta)))
            items += 1
        lines.extend(["          default: delta_out = 16'h0000;", "        endcase", "      end"])
    lines.extend(
        [
            "      default: delta_out = 16'h0000;",
            "    endcase",
            "  end",
            "  reg [15:0] out_r;",
            "  always @* begin",
            "    if (exp == 5'h00) out_r = 16'hfc00;",
            "    else if (sign) out_r = 16'h7e00;",
            "    else if (exp == 5'h1f) out_r = (mant == 10'h000) ? 16'h7c00 : 16'h7e00;",
            "    else out_r = pos_out;",
            "  end",
            "  assign out = out_r;",
        ]
    )
    lines.extend(footer())
    return "\n".join(lines), "positive_base_delta_items={0}".format(items), lambda index: outputs[index]


def render_log_mant0_fastpath(outputs, module):
    lines = module_header(module)
    lines.extend(["  reg [15:0] out_r;", "  always @* begin"])
    lines.append("    if (exp == 5'h00) out_r = 16'hfc00;")
    lines.append("    else if (sign) out_r = 16'h7e00;")
    lines.append("    else if (exp == 5'h1f) out_r = (mant == 10'h000) ? 16'h7c00 : 16'h7e00;")
    lines.append("    else if (mant == 10'h000) begin")
    lines.append("      case (exp)")
    items = 0
    for exp in range(1, EXP_MAX):
        value = outputs[exp << MANT_BITS]
        lines.append("        {0}: out_r = {1};".format(const_word(EXP_BITS, exp), const_word(16, value)))
        items += 1
    lines.extend(["        default: out_r = 16'h0000;", "      endcase", "    end else begin", "      case (exp)"])
    for exp in range(1, EXP_MAX):
        base = exp << MANT_BITS
        lines.append("        {0}: begin".format(const_word(EXP_BITS, exp)))
        lines.append("          case (mant)")
        for mant in range(1, MANT_SIZE):
            value = outputs[base | mant]
            lines.append("            {0}: out_r = {1};".format(const_word(MANT_BITS, mant), const_word(16, value)))
            items += 1
        lines.extend(["            default: out_r = 16'h0000;", "          endcase", "        end"])
    lines.extend(["        default: out_r = 16'h0000;", "      endcase", "    end", "  end", "  assign out = out_r;"])
    lines.extend(footer())
    return "\n".join(lines), "mant0_fastpath_items={0}".format(items), lambda index: outputs[index]


def render_log_limited_run_range(outputs, module):
    lines = module_header(module)
    lines.extend(["  reg [15:0] out_r;", "  always @* begin"])
    lines.append("    if (exp == 5'h00) out_r = 16'hfc00;")
    lines.append("    else if (sign) out_r = 16'h7e00;")
    lines.append("    else if (exp == 5'h1f) out_r = (mant == 10'h000) ? 16'h7c00 : 16'h7e00;")
    lines.append("    else begin")
    lines.append("      case (exp)")
    items = 0
    ranged_groups = 0
    for exp in range(1, EXP_MAX):
        base = exp << MANT_BITS
        values = [outputs[base | mant] for mant in range(MANT_SIZE)]
        runs = []
        start = 0
        current = values[0]
        for mant, value in enumerate(values[1:], 1):
            if value != current:
                runs.append((start, mant - 1, current))
                start = mant
                current = value
        runs.append((start, MANT_SIZE - 1, current))
        lines.append("        {0}: begin".format(const_word(EXP_BITS, exp)))
        if len(runs) <= 160:
            ranged_groups += 1
            for idx, (lo, hi, value) in enumerate(runs):
                prefix = "if" if idx == 0 else "else if"
                if hi == MANT_SIZE - 1:
                    lines.append("          else out_r = {0};".format(const_word(16, value)))
                else:
                    lines.append("          {0} (mant <= {1}) out_r = {2};".format(prefix, const_word(MANT_BITS, hi), const_word(16, value)))
                items += 1
        else:
            lines.append("          case (mant)")
            for mant, value in enumerate(values):
                lines.append("            {0}: out_r = {1};".format(const_word(MANT_BITS, mant), const_word(16, value)))
                items += 1
            lines.extend(["            default: out_r = 16'h0000;", "          endcase"])
        lines.append("        end")
    lines.extend(["        default: out_r = 16'h0000;", "      endcase", "    end", "  end", "  assign out = out_r;"])
    lines.extend(footer())
    return "\n".join(lines), "limited_run_range_items={0}; ranged_exp_groups={1}".format(items, ranged_groups), lambda index: outputs[index]


COMMON_VARIANTS = {
    "sign_exp_mant_case": render_sign_exp_mant_case,
    "split_sign_exp_mant_case": render_split_sign_exp_mant_case,
    "exp_mant_pair_case": render_exp_mant_pair_case,
    "exp_mant_delta_pair": render_exp_mant_delta_pair,
    "positive_default_exp_mant_case": lambda outputs, module: render_positive_default_exp_mant(outputs, module, False),
    "semantic_exp_delta_fields": render_semantic_exp_delta_fields,
}

LOG_VARIANTS = {
    "log_special_shell": render_log_special_shell,
    "log_positive_field_split": render_log_positive_field_split,
    "log_positive_base_delta": render_log_positive_base_delta,
    "log_mant0_fastpath": render_log_mant0_fastpath,
    "log_limited_run_range": render_log_limited_run_range,
}


def variants_for_case(case):
    if case in ("ex220", "ex221", "ex222"):
        return [
            "exp_mant_pair_case",
            "positive_default_exp_mant_case",
            "sign_exp_mant_case",
            "semantic_exp_delta_fields",
        ]
    return [
        "sign_exp_mant_case",
        "split_sign_exp_mant_case",
        "exp_mant_pair_case",
        "positive_default_exp_mant_case",
        "semantic_exp_delta_fields",
        "log_special_shell",
        "log_positive_field_split",
        "log_positive_base_delta",
        "log_mant0_fastpath",
        "log_limited_run_range",
    ]


def render_variant(case, variant, outputs, module):
    if variant in LOG_VARIANTS:
        if case not in LOG_CASES:
            raise RuntimeError("{0} is only valid for log cases".format(variant))
        return LOG_VARIANTS[variant](outputs, module)
    return COMMON_VARIANTS[variant](outputs, module)


def classification(variant):
    if variant.startswith("log_") or variant.startswith("semantic_"):
        return "semantic_hybrid"
    return "structural_exact"


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
    for variant in variants_for_case(case):
        candidate_id = "{0}_{1}_{2}".format(case, label, variant)
        module = candidate_id
        verilog_path = case_dir / "verilog" / "{0}.v".format(candidate_id)
        aig_path = case_dir / "aigs" / "{0}.aig".format(candidate_id)
        script_path = case_dir / "logs" / "{0}.ys".format(candidate_id)
        log_path = case_dir / "logs" / "{0}.yosys.log".format(candidate_id)
        row = empty_row(case, candidate_id, label, variant, verilog_path, aig_path)
        start = time.time()
        try:
            verilog, items, model = render_variant(case, variant, outputs, module)
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
                    tool_chain="yosys_fp16_frontend_curated_{0}".format(variant),
                    aig_path=aig_path,
                    truth=truth_path,
                    abc=args.abc,
                    notes="{0} FP16 curated frontend candidate".format(row["classification"]),
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
        print("{0} {1} eq={2} adp={3} notes={4}".format(case, variant, row["equivalent"], row["adp"], row["notes"][:80]))
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
    parser = argparse.ArgumentParser(description="Curated FP16 ex220-ex224 frontend candidates.")
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
    for case in ["ex220", "ex221", "ex222", "ex223", "ex224"]:
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
