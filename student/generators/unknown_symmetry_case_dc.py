#!/usr/bin/env python3
"""Canonical pair-symmetry case tables with invalid-key don't-cares."""

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
from student.generators.unknown_symmetry_bdd import parse_pairs, verify_pair_symmetry
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


def parse_list(text):
    return [item.strip() for item in text.split(",") if item.strip()]


def x_word(width):
    return "{0}'b{1}".format(width, "x" * width)


def canonicalize_index(index, pairs):
    key = index
    for left, right in pairs:
        lb = (index >> left) & 1
        rb = (index >> right) & 1
        if lb | rb:
            key |= 1 << left
        else:
            key &= ~(1 << left)
        if lb & rb:
            key |= 1 << right
        else:
            key &= ~(1 << right)
    return key


def valid_key(key, pairs):
    for left, right in pairs:
        if ((key >> left) & 1) == 0 and ((key >> right) & 1):
            return False
    return True


def emit_key(lines, width, pairs):
    assigned = set()
    lines.append("  wire {0}key;".format(range_decl(width)))
    for left, right in pairs:
        lines.append("  assign key[{0}] = in[{0}] | in[{1}];".format(left, right))
        lines.append("  assign key[{0}] = in[{1}] & in[{0}];".format(right, left))
        assigned.add(left)
        assigned.add(right)
    for bit in range(width):
        if bit not in assigned:
            lines.append("  assign key[{0}] = in[{0}];".format(bit))


def render(outputs, module, input_width, output_width, pairs, style):
    lines = [
        "module {0}(in, out);".format(module),
        "  input {0}in;".format(range_decl(input_width)),
        "  output {0}out;".format(range_decl(output_width)),
    ]
    emit_key(lines, input_width, pairs)
    lines.extend(
        [
            "  reg {0}out_r;".format(range_decl(output_width)),
            "  always @* begin",
            "    out_r = {0};".format(x_word(output_width) if style == "default_x" else const_word(output_width, 0)),
            "    case (key)",
        ]
    )
    entries = 0
    for key in range(1 << input_width):
        if not valid_key(key, pairs):
            continue
        lines.append("      {0}: out_r = {1};".format(const_word(input_width, key), const_word(output_width, outputs[key])))
        entries += 1
    lines.extend(
        [
            "      default: begin end",
            "    endcase",
            "  end",
            "  assign out = out_r;",
            "endmodule",
            "",
        ]
    )

    def model(index):
        return outputs[canonicalize_index(index, pairs)]

    items = "pairs={0}; style={1}; valid_entries={2}; invalid_entries={3}".format(
        ",".join("{0}:{1}".format(a, b) for a, b in pairs),
        style,
        entries,
        (1 << input_width) - entries,
    )
    return "\n".join(lines), items, model


def verify_outputs(outputs, model):
    for index, expected in enumerate(outputs):
        actual = model(index)
        if actual != expected:
            return False, "first mismatch index={0} expected=0x{1:x} actual=0x{2:x}".format(index, expected, actual)
    return True, "exact symmetry canonical case-dc model over {0} inputs".format(len(outputs))


def best_rows(rows):
    best = []
    for case in sorted(set(row["case"] for row in rows)):
        valid = [row for row in rows if row["equivalent"] == "1" and row["adp"]]
        if valid:
            item = min(valid, key=lambda row: int(row["adp"]))
            best.append({name: item.get(name, "") for name in BEST_FIELDNAMES})
    return best


def run_case(args, case):
    truth_path = args.benchmarks / "{0}.truth".format(case)
    table = TruthTable(truth_path)
    outputs = list(table.iter_outputs())
    ok, note = verify_pair_symmetry(outputs, table.input_width, args.pairs)
    if not ok:
        raise RuntimeError("{0}: {1}".format(case, note))
    rows = []
    manifest = {
        "case": case,
        "truth": str(truth_path),
        "input_width": table.input_width,
        "output_width": table.output_width,
        "hypothesis": "unknown_symmetry_case_dc",
        "variants": [],
    }
    for style in args.styles:
        candidate_id = "{0}_unknown_symcase_{1}".format(case, style)
        verilog_path = args.work_dir / case / "verilog" / "{0}.v".format(candidate_id)
        aig_path = args.work_dir / case / "aigs" / "{0}.aig".format(candidate_id)
        script_path = args.work_dir / case / "logs" / "{0}.ys".format(candidate_id)
        log_path = args.work_dir / case / "logs" / "{0}.yosys.log".format(candidate_id)
        start = time.time()
        row = {
            "case": case,
            "candidate_id": candidate_id,
            "hypothesis": "unknown_symmetry_case_dc",
            "variant": style,
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
            "notes": note,
        }
        try:
            verilog, items, model = render(outputs, candidate_id, table.input_width, table.output_width, args.pairs, style)
            row["items"] = "{0}; hash={1}".format(items, text_hash(verilog)[:12])
            verified, verify_note = verify_outputs(outputs, model)
            row["verified_truth"] = "1" if verified else "0"
            row["notes"] = verify_note
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
                    parent_id="unknown_symmetry_case_dc",
                    source="ai_verilog",
                    tool_chain="yosys_unknown_symmetry_case_dc",
                    aig_path=aig_path,
                    truth=truth_path,
                    abc=args.abc,
                    notes="unknown canonical pair-symmetry case table with invalid-key don't-cares",
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
            "{0} {1} verified={2} eq={3} area={4} delay={5} adp={6}".format(
                case,
                style,
                row["verified_truth"],
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
    parser = argparse.ArgumentParser(description="Generate canonical pair-symmetry case table candidates.")
    parser.add_argument("--cases", type=parse_cases, required=True)
    parser.add_argument("--pairs", type=parse_pairs, required=True)
    parser.add_argument("--styles", type=parse_list, default=parse_list("default_x,default_zero"))
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--work-dir", type=Path, required=True)
    parser.add_argument("--results", type=Path, required=True)
    parser.add_argument("--best-results", type=Path, required=True)
    parser.add_argument("--summary-results", type=Path, required=True)
    parser.add_argument("--evaluate-check", type=Path, required=True)
    parser.add_argument("--yosys", type=Path, default=ROOT / "student" / "tools" / "conda-env" / "bin" / "yosys")
    parser.add_argument("--abc", type=Path, default=ROOT / "student" / "abc")
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
    summary = []
    for case in args.cases:
        case_rows = [row for row in rows if row["case"] == case]
        valid = [row for row in case_rows if row["equivalent"] == "1" and row["adp"]]
        best_adp = min((int(row["adp"]) for row in valid), default=None)
        summary.append(
            {
                "case": case,
                "rows": len(case_rows),
                "verified": sum(1 for row in case_rows if row["verified_truth"] == "1"),
                "equivalent": sum(1 for row in case_rows if row["equivalent"] == "1"),
                "best_adp": "" if best_adp is None else str(best_adp),
            }
        )
    write_csv(args.summary_results, ["case", "rows", "verified", "equivalent", "best_adp"], summary)
    write_csv(
        args.evaluate_check,
        ["case", "candidate_id", "equivalent", "area", "delay", "adp", "notes"],
        [
            {
                "case": row["case"],
                "candidate_id": row["candidate_id"],
                "equivalent": row["equivalent"],
                "area": row["area"],
                "delay": row["delay"],
                "adp": row["adp"],
                "notes": row["notes"],
            }
            for row in rows
        ],
    )
    print("Results: {0}".format(args.results))
    print("Best: {0}".format(args.best_results))
    print("Rows: {0}".format(len(rows)))
    print("Best cases: {0}/{1}".format(len(best), len(args.cases)))
    return 0 if best else 1


if __name__ == "__main__":
    raise SystemExit(main())
