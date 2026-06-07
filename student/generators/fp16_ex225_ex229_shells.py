#!/usr/bin/env python3
"""Curated FP16 ex225-ex229 semantic shell candidates."""

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
    MANT_BITS,
    MANT_SIZE,
    RESULT_FIELDNAMES,
    add_reference_columns,
    const_word,
    footer,
    load_reference,
    module_header,
    rel_path,
    verify_outputs,
    write_csv,
    write_text,
)


SPECS = {
    "ex225": ("log10_special_shell", "log10 positive-normal table with negative/special shell"),
    "ex226": ("odd_positive_table", "sin positive-domain table with NaN-aware sign flip"),
    "ex227": ("odd_positive_table", "tan positive-domain table with NaN-aware sign flip"),
    "ex228": ("odd_sinh_saturation_shell", "sinh positive table only below exp>=19 saturation"),
    "ex229": ("odd_tanh_saturation_shell", "tanh positive table only below exp>=18 saturation"),
}


def parse_cases(text):
    out = []
    for item in text.split(","):
        item = item.strip()
        if not item:
            continue
        if "-" in item:
            start, end = item.split("-", 1)
            for number in range(int(start[2:]), int(end[2:]) + 1):
                out.append("ex{0:03d}".format(number))
        else:
            out.append(item)
    return out


def positive_table_case(lines, outputs, exps, default_value):
    items = 0
    lines.append("      case (exp)")
    for exp in exps:
        base = exp << MANT_BITS
        values = [outputs[base | mant] for mant in range(MANT_SIZE)]
        if len(set(values)) == 1:
            lines.append("        {0}: pos_out = {1};".format(const_word(EXP_BITS, exp), const_word(16, values[0])))
            items += 1
            continue
        lines.append("        {0}: begin".format(const_word(EXP_BITS, exp)))
        lines.append("          case (mant)")
        for mant, value in enumerate(values):
            lines.append("            {0}: pos_out = {1};".format(const_word(MANT_BITS, mant), const_word(16, value)))
            items += 1
        lines.extend(["            default: pos_out = {0};".format(const_word(16, default_value)), "          endcase", "        end"])
    lines.extend(["        default: pos_out = {0};".format(const_word(16, default_value)), "      endcase"])
    return items


def render_log10_shell(outputs, module):
    lines = module_header(module)
    lines.extend(["  reg [15:0] pos_out;", "  reg [15:0] out_r;", "  always @* begin"])
    lines.append("    pos_out = 16'h0000;")
    items = positive_table_case(lines, outputs, range(1, 31), 0)
    lines.extend(
        [
            "  end",
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

    def model(index):
        sign = (index >> 15) & 1
        exp = (index >> 10) & 0x1F
        mant = index & 0x3FF
        if exp == 0:
            return 0xFC00
        if sign:
            return 0x7E00
        if exp == 0x1F:
            return 0x7C00 if mant == 0 else 0x7E00
        return outputs[index]

    return "\n".join(lines), "positive_normal_items={0}; log10 special shell".format(items), model


def render_odd_positive_table(outputs, module, active_exps, saturation_value=None, nan_for_inf=False):
    lines = module_header(module)
    lines.extend(["  reg [15:0] pos_out;", "  reg [15:0] out_r;", "  always @* begin"])
    lines.append("    pos_out = 16'h0000;")
    if saturation_value is None:
        items = positive_table_case(lines, outputs, active_exps, 0)
    else:
        lines.append("    if (exp >= {0} && exp != 5'h1f) begin".format(const_word(EXP_BITS, active_exps[-1] + 1)))
        lines.append("      pos_out = {0};".format(const_word(16, saturation_value)))
        lines.append("    end else begin")
        items = positive_table_case(lines, outputs, active_exps, 0)
        lines.append("    end")
    lines.extend(
        [
            "  end",
            "  always @* begin",
        ]
    )
    if nan_for_inf:
        lines.append("    if (exp == 5'h1f) out_r = 16'h7e00;")
    elif saturation_value is not None:
        lines.append("    if (exp == 5'h1f && mant != 10'h000) out_r = 16'h7e00;")
        lines.append(
            "    else if (exp == 5'h1f) out_r = sign ? {0} : {1};".format(
                const_word(16, saturation_value ^ 0x8000),
                const_word(16, saturation_value),
            )
        )
    else:
        lines.append("    if (exp == 5'h1f && mant != 10'h000) out_r = 16'h7e00;")
    lines.extend(
        [
            "    else if (sign) out_r = pos_out ^ 16'h8000;",
            "    else out_r = pos_out;",
            "  end",
            "  assign out = out_r;",
        ]
    )
    lines.extend(footer())

    def model(index):
        sign = (index >> 15) & 1
        mag = index & 0x7FFF
        exp = (index >> 10) & 0x1F
        mant = index & 0x3FF
        if nan_for_inf and exp == 0x1F:
            return 0x7E00
        if exp == 0x1F and mant != 0:
            return 0x7E00
        if sign:
            return outputs[mag] ^ 0x8000
        return outputs[mag]

    return "\n".join(lines), "odd_positive_table_items={0}; active_exps={1}".format(items, list(active_exps)), model


def render_case(case, outputs, module):
    if case == "ex225":
        return render_log10_shell(outputs, module)
    if case == "ex226":
        return render_odd_positive_table(outputs, module, range(0, 31), nan_for_inf=True)
    if case == "ex227":
        return render_odd_positive_table(outputs, module, range(0, 31), nan_for_inf=True)
    if case == "ex228":
        return render_odd_positive_table(outputs, module, range(0, 19), saturation_value=0x7C00)
    if case == "ex229":
        return render_odd_positive_table(outputs, module, range(0, 18), saturation_value=0x3C00)
    raise RuntimeError("unsupported case: {0}".format(case))


def empty_row(case, candidate_id, variant, verilog_path, aig_path):
    return {
        "case": case,
        "candidate_id": candidate_id,
        "hypothesis/function_guess": CASE_LABELS.get(case, "fp16_unknown"),
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
        "classification": "semantic_shell",
        "notes": "",
    }


def run_case(args, case, refs):
    variant, note = SPECS[case]
    truth_path = args.benchmarks / "{0}.truth".format(case)
    outputs = list(TruthTable(truth_path).iter_outputs())
    candidate_id = "{0}_{1}_{2}".format(case, CASE_LABELS[case], variant)
    module = candidate_id
    case_dir = args.work_dir / case
    verilog_path = case_dir / "verilog" / "{0}.v".format(candidate_id)
    aig_path = case_dir / "aigs" / "{0}.aig".format(candidate_id)
    script_path = case_dir / "logs" / "{0}.ys".format(candidate_id)
    log_path = case_dir / "logs" / "{0}.yosys.log".format(candidate_id)
    row = empty_row(case, candidate_id, variant, verilog_path, aig_path)
    start = time.time()
    try:
        verilog, items, model = render_case(case, outputs, module)
        row["items"] = items
        verified, verify_note = verify_outputs(outputs, model)
        row["verified_truth"] = "1" if verified else "0"
        row["notes"] = note + "; " + verify_note
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
                parent_id=CASE_LABELS[case],
                source="ai_verilog",
                tool_chain="yosys_fp16_semantic_shell",
                aig_path=aig_path,
                truth=truth_path,
                abc=args.abc,
                notes=note,
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
    print("{0} {1} eq={2} area={3} delay={4} adp={5}".format(case, variant, row["equivalent"], row["area"], row["delay"], row["adp"]))
    return row


def best_rows(rows):
    best = []
    for case in sorted(set(row["case"] for row in rows)):
        valid = [row for row in rows if row["case"] == case and row["equivalent"] == "1" and row["adp"]]
        if valid:
            item = min(valid, key=lambda row: int(row["adp"]))
            best.append({name: item.get(name, "") for name in BEST_FIELDNAMES})
    return best


def parse_args():
    parser = argparse.ArgumentParser(description="Generate curated FP16 ex225-ex229 shell candidates.")
    parser.add_argument("--cases", default="ex225-ex229")
    parser.add_argument("--work-dir", type=Path, required=True)
    parser.add_argument("--results", type=Path, required=True)
    parser.add_argument("--best-results", type=Path, required=True)
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--reference", type=Path, default=ROOT / "reference_result.csv")
    parser.add_argument("--abc", type=Path, default=ROOT / "student" / "abc")
    parser.add_argument("--yosys", type=Path, default=ROOT / "student" / "tools" / "conda-env" / "bin" / "yosys")
    parser.add_argument("--timeout", type=int, default=900)
    return parser.parse_args()


def main():
    args = parse_args()
    refs = load_reference(args.reference)
    rows = [run_case(args, case, refs) for case in parse_cases(args.cases)]
    write_csv(args.results, RESULT_FIELDNAMES, rows)
    write_csv(args.best_results, BEST_FIELDNAMES, best_rows(rows))
    write_text(args.work_dir / "manifest.json", json.dumps(rows, indent=2) + "\n")
    print("Results: {0}".format(args.results))
    print("Best: {0}".format(args.best_results))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
