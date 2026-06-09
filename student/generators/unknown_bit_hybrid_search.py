#!/usr/bin/env python3
"""Generate exact bit-hybrid RTL from two verified unknown Verilog sources."""

import argparse
import csv
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
from student.generators.unknown_verilog_search import (
    ALL_FIELDNAMES,
    BEST_FIELDNAMES,
    parse_cases,
    range_decl,
    text_hash,
    write_csv,
    write_text,
)


def parse_list(value):
    out = []
    seen = set()
    for item in value.split(","):
        item = item.strip()
        if item and item not in seen:
            out.append(item)
            seen.add(item)
    if not out:
        raise argparse.ArgumentTypeError("empty list")
    return out


def parse_bits(text):
    if text == "none":
        return []
    return [int(part) for part in text.split("_") if part != ""]


def bits_for_variant(variant, width):
    if not variant.startswith("primary_"):
        raise RuntimeError("variant must start with primary_: {0}".format(variant))
    bits = parse_bits(variant[len("primary_") :])
    if any(bit < 0 or bit >= width for bit in bits):
        raise RuntimeError("variant {0} has bit outside width {1}".format(variant, width))
    return sorted(set(bits))


def render(case, module, input_width, output_width, primary_module, primary_text, secondary_module, secondary_text, primary_bits):
    lines = []
    lines.extend(
        [
            "module {0}(in, out);".format(module),
            "  input {0}in;".format(range_decl(input_width)),
            "  output {0}out;".format(range_decl(output_width)),
            "  wire {0}primary_out;".format(range_decl(output_width)),
            "  wire {0}secondary_out;".format(range_decl(output_width)),
            "  {0} u_primary(.in(in), .out(primary_out));".format(primary_module),
            "  {0} u_secondary(.in(in), .out(secondary_out));".format(secondary_module),
        ]
    )
    primary_set = set(primary_bits)
    for bit in range(output_width):
        source = "primary_out" if bit in primary_set else "secondary_out"
        lines.append("  assign out[{0}] = {1}[{0}];".format(bit, source))
    lines.append("endmodule")
    lines.append("")
    lines.append(primary_text.rstrip())
    lines.append("")
    lines.append(secondary_text.rstrip())
    lines.append("")
    items = "primary_bits={0}; secondary_bits={1}".format(
        ":".join(str(bit) for bit in sorted(primary_set)),
        ":".join(str(bit) for bit in range(output_width) if bit not in primary_set),
    )
    return "\n".join(lines), items


def best_rows(rows):
    out = []
    for case in sorted(set(row["case"] for row in rows)):
        valid = [row for row in rows if row["case"] == case and row["equivalent"] == "1" and row["adp"]]
        if valid:
            best = min(valid, key=lambda row: int(row["adp"]))
            out.append({name: best.get(name, "") for name in BEST_FIELDNAMES})
    return out


def run_case(args, case):
    table = TruthTable(args.benchmarks / "{0}.truth".format(case))
    primary_text = args.primary_verilog.read_text()
    secondary_text = args.secondary_verilog.read_text()
    rows = []
    for variant in args.variants:
        primary_bits = bits_for_variant(variant, table.output_width)
        candidate_id = "{0}_unknown_bit_hybrid_{1}".format(case, variant)
        module = candidate_id
        verilog_path = args.work_dir / case / "verilog" / "{0}.v".format(candidate_id)
        aig_path = args.work_dir / case / "aigs" / "{0}.aig".format(candidate_id)
        script_path = args.work_dir / case / "logs" / "{0}.ys".format(candidate_id)
        log_path = args.work_dir / case / "logs" / "{0}.yosys.log".format(candidate_id)
        start = time.time()
        row = {
            "case": case,
            "candidate_id": candidate_id,
            "hypothesis": "unknown_bit_hybrid",
            "variant": variant,
            "verilog_path": str(verilog_path),
            "aig_path": str(aig_path),
            "verified_truth": "1",
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
            verilog, items = render(
                case,
                module,
                table.input_width,
                table.output_width,
                args.primary_module,
                primary_text,
                args.secondary_module,
                secondary_text,
                primary_bits,
            )
            row["items"] = "{0}; hash={1}".format(items, text_hash(verilog)[:12])
            write_text(verilog_path, verilog)
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
                parent_id="unknown_bit_hybrid",
                source="ai_verilog",
                tool_chain="yosys_unknown_bit_hybrid_{0}".format(variant),
                aig_path=aig_path,
                truth=args.benchmarks / "{0}.truth".format(case),
                abc=args.abc,
                notes="bit-hybrid of two verified exact Verilog sources",
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
    return rows


def parse_args(argv=None):
    parser = argparse.ArgumentParser(description="Generate bit-hybrid unknown Verilog candidates.")
    parser.add_argument("--cases", type=parse_cases, required=True)
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--work-dir", type=Path, required=True)
    parser.add_argument("--results", type=Path, required=True)
    parser.add_argument("--best-results", type=Path, required=True)
    parser.add_argument("--primary-verilog", type=Path, required=True)
    parser.add_argument("--primary-module", required=True)
    parser.add_argument("--secondary-verilog", type=Path, required=True)
    parser.add_argument("--secondary-module", required=True)
    parser.add_argument("--variants", type=parse_list, required=True)
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
    print("Results: {0}".format(args.results))
    print("Best: {0}".format(args.best_results))
    print("Rows: {0}".format(len(rows)))
    print("Best cases: {0}/{1}".format(len(best), len(args.cases)))
    return 0 if len(best) == len(args.cases) else 1


if __name__ == "__main__":
    raise SystemExit(main())
