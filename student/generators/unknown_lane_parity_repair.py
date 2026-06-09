#!/usr/bin/env python3
"""Wrap current unknown seeds with mod-4 output lane parity repairs."""

import argparse
import csv
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
from student.scripts.unknown_output_linear_anf_diag import mobius_word, parity
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


def parse_module_name(verilog_text):
    match = re.search(r"\bmodule\s+([A-Za-z_][A-Za-z0-9_$]*)\s*\(", verilog_text)
    if not match:
        raise RuntimeError("could not find base module name")
    return match.group(1)


def current_sources(path, cases):
    rows = list(csv.DictReader(path.open()))
    out = {}
    for row in rows:
        case = row.get("case")
        if case in cases:
            out[case] = row
    missing = [case for case in cases if case not in out]
    if missing:
        raise RuntimeError("missing current best rows for {0}".format(",".join(missing)))
    return out


def lane_masks(width):
    out = []
    for residue in range(4):
        mask = 0
        for bit in range(width):
            if bit % 4 == residue:
                mask |= 1 << bit
        out.append(mask)
    return out


def choose_skip_bits(width, style):
    skips = []
    for residue in range(4):
        bits = [bit for bit in range(width) if bit % 4 == residue]
        if style == "low":
            skips.append(bits[0])
        elif style == "high":
            skips.append(bits[-1])
        elif style == "middle":
            skips.append(bits[len(bits) // 2])
        else:
            raise RuntimeError("unknown skip style {0}".format(style))
    return skips


def parity_terms(coeffs, output_mask):
    return [mono for mono, coeff in enumerate(coeffs) if parity(coeff & output_mask)]


def term_signal(lines, cache, mono, width):
    if mono == 0:
        return "1'b1"
    old = cache.get(mono)
    if old is not None:
        return old
    name = "lp_m_{0:x}".format(mono)
    pieces = ["in[{0}]".format(bit) for bit in range(width) if (mono >> bit) & 1]
    lines.append("  wire {0} = {1};".format(name, and_expr(pieces)))
    cache[mono] = name
    return name


def render_wrapper(case, module, base_text, base_module, width, coeffs, skip_style):
    skips = choose_skip_bits(width, skip_style)
    skip_set = set(skips)
    masks = lane_masks(width)
    lane_terms = [parity_terms(coeffs, mask) for mask in masks]
    lines = []
    lines.append(base_text.rstrip())
    lines.append("")
    lines.append("module {0}(in, out);".format(module))
    lines.append("  input {0}in;".format(range_decl(width)))
    lines.append("  output {0}out;".format(range_decl(width)))
    lines.append("  wire {0}base_out;".format(range_decl(width)))
    lines.append("  {0} u_base(.in(in), .out(base_out));".format(base_module))
    cache = {}
    for terms in lane_terms:
        for mono in terms:
            term_signal(lines, cache, mono, width)
    for residue, terms in enumerate(lane_terms):
        signals = [term_signal(lines, cache, mono, width) for mono in terms]
        lines.append("  wire lane_parity_{0} = {1};".format(residue, xor_expr(signals)))
    for bit in range(width):
        if bit not in skip_set:
            lines.append("  assign out[{0}] = base_out[{0}];".format(bit))
            continue
        residue = bit % 4
        others = [
            "base_out[{0}]".format(other)
            for other in range(width)
            if other % 4 == residue and other != bit
        ]
        lines.append("  assign out[{0}] = {1};".format(bit, xor_expr(["lane_parity_{0}".format(residue)] + others)))
    lines.append("endmodule")
    lines.append("")
    items = "skip_style={0}; skipped_bits={1}; lane_masks={2}; lane_terms={3}; unique_monomials={4}".format(
        skip_style,
        ":".join(str(bit) for bit in skips),
        ":".join("0x{0:x}".format(mask) for mask in masks),
        ":".join(str(len(terms)) for terms in lane_terms),
        len(cache),
    )
    return "\n".join(lines), items, skips, lane_terms


def eval_terms(terms, value):
    out = 0
    for mono in terms:
        if mono == 0 or (value & mono) == mono:
            out ^= 1
    return out


def verify_repair(outputs, width, skips, lane_terms):
    skip_set = set(skips)
    for index, expected in enumerate(outputs):
        actual = expected
        for bit in skips:
            residue = bit % 4
            value = eval_terms(lane_terms[residue], index)
            for other in range(width):
                if other % 4 == residue and other != bit:
                    value ^= (expected >> other) & 1
            if value:
                actual |= 1 << bit
            else:
                actual &= ~(1 << bit)
        if actual != expected:
            return False, "first mismatch index={0} expected=0x{1:x} actual=0x{2:x}".format(index, expected, actual)
    return True, "exact lane parity repair model"


def best_rows(rows):
    out = []
    for case in sorted(set(row["case"] for row in rows)):
        valid = [row for row in rows if row.get("equivalent") == "1" and row.get("adp")]
        if valid:
            best = min(valid, key=lambda row: int(row["adp"]))
            out.append({name: best.get(name, "") for name in BEST_FIELDNAMES})
    return out


def run_case(args, case, source_row):
    truth_path = args.benchmarks / "{0}.truth".format(case)
    table = TruthTable(truth_path)
    outputs = list(table.iter_outputs())
    coeffs = mobius_word(outputs, table.input_width)
    base_path = ROOT / source_row["verilog_path"] if not Path(source_row["verilog_path"]).is_absolute() else Path(source_row["verilog_path"])
    base_text = base_path.read_text()
    base_module = parse_module_name(base_text)
    rows = []
    for skip_style in args.skip_styles:
        candidate_id = "{0}_unknown_lane_parity_repair_{1}".format(case, skip_style)
        verilog_path = args.work_dir / case / "verilog" / "{0}.v".format(candidate_id)
        aig_path = args.work_dir / case / "aigs" / "{0}.aig".format(candidate_id)
        script_path = args.work_dir / case / "logs" / "{0}.ys".format(candidate_id)
        log_path = args.work_dir / case / "logs" / "{0}.yosys.log".format(candidate_id)
        start = time.time()
        row = {
            "case": case,
            "candidate_id": candidate_id,
            "hypothesis": "unknown_lane_parity_repair",
            "variant": skip_style,
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
            verilog, items, skips, lane_terms = render_wrapper(
                case,
                candidate_id,
                base_text,
                base_module,
                table.input_width,
                coeffs,
                skip_style,
            )
            row["items"] = "{0}; base={1}; hash={2}".format(items, source_row["candidate_id"], text_hash(verilog)[:12])
            verified, note = verify_repair(outputs, table.input_width, skips, lane_terms)
            row["verified_truth"] = "1" if verified else "0"
            row["notes"] = note
            write_text(verilog_path, verilog)
            if verified:
                yosys_log = synthesize_verilog(
                    verilog=verilog_path,
                    module=candidate_id,
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
                    parent_id=source_row["candidate_id"],
                    source="ai_verilog",
                    tool_chain="yosys_lane_parity_repair",
                    aig_path=aig_path,
                    truth=truth_path,
                    abc=args.abc,
                    notes="lane parity degree<=4 repair wrapper over current best",
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
        print(
            "{0} {1} verified={2} eq={3} area={4} delay={5} adp={6}".format(
                case,
                skip_style,
                row["verified_truth"],
                row["equivalent"],
                row["area"],
                row["delay"],
                row["adp"],
            ),
            flush=True,
        )
    return rows


def write_manifest(path, args):
    text = """# {0}

Run ID: `{0}`

Purpose: Test whether the newly discovered mod-4 output lane parity coordinates
can reduce ADP by skipping one current-source output bit per lane and repairing
it from a degree<=4 lane parity ANF.

Inputs:
- Cases: `{1}`
- Current source CSV: `{2}`
- Script: `student/generators/unknown_lane_parity_repair.py`

Artifacts:
- Work directory: `{3}`
- Results directory: `{4}`

Methods tried:
- Skip styles: `{5}`
- Base sources are read from current best rows; no seed directories are updated.

Notes:
- `student/seeds` and `output/` are intentionally untouched.
""".format(
        args.run_id,
        ",".join(args.cases),
        args.current_best,
        args.work_dir,
        args.results.parent,
        ",".join(args.skip_styles),
    )
    path.write_text(text)


def parse_args(argv=None):
    parser = argparse.ArgumentParser()
    parser.add_argument("--cases", type=parse_cases, required=True)
    parser.add_argument("--run-id", required=True)
    parser.add_argument("--current-best", type=Path, default=ROOT / "student" / "results" / "current_best_by_case.csv")
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--work-dir", type=Path, required=True)
    parser.add_argument("--results", type=Path, required=True)
    parser.add_argument("--best-results", type=Path, required=True)
    parser.add_argument("--summary-results", type=Path, required=True)
    parser.add_argument("--evaluate-check", type=Path, required=True)
    parser.add_argument("--skip-styles", default="low,high,middle")
    parser.add_argument("--yosys", type=Path, default=ROOT / "student" / "tools" / "conda-env" / "bin" / "yosys")
    parser.add_argument("--abc", type=Path, default=ROOT / "student" / "abc")
    parser.add_argument("--timeout", type=int, default=900)
    parser.add_argument("--no-yosys-abc", action="store_true")
    args = parser.parse_args(argv)
    args.skip_styles = [item.strip() for item in args.skip_styles.split(",") if item.strip()]
    return args


def main(argv=None):
    args = parse_args(argv)
    sources = current_sources(args.current_best, set(args.cases))
    rows = []
    for case in args.cases:
        rows.extend(run_case(args, case, sources[case]))
    write_csv(args.results, ALL_FIELDNAMES, rows)
    write_csv(args.best_results, BEST_FIELDNAMES, best_rows(rows))
    summary_rows = []
    for case in sorted(set(row["case"] for row in rows)):
        cr = [row for row in rows if row["case"] == case]
        eq = [row for row in cr if row.get("equivalent") == "1" and row.get("adp")]
        summary_rows.append(
            {
                "case": case,
                "rows": str(len(cr)),
                "verified": str(sum(row.get("verified_truth") == "1" for row in cr)),
                "equivalent": str(len(eq)),
                "best_adp": "" if not eq else str(min(int(row["adp"]) for row in eq)),
            }
        )
    write_csv(args.summary_results, ["case", "rows", "verified", "equivalent", "best_adp"], summary_rows)
    eval_fields = ["case", "candidate_id", "equivalent", "area", "delay", "adp", "notes"]
    write_csv(args.evaluate_check, eval_fields, [{name: row.get(name, "") for name in eval_fields} for row in rows])
    write_manifest(args.results.parent.parent / "MANIFEST.md", args)
    print("Results: {0}".format(args.results))
    print("Rows: {0}".format(len(rows)))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
