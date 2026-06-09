#!/usr/bin/env python3
"""Generate arbitrary-width split/default RTL from diagnostic split rows."""

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


def rotl(value, width, amount):
    amount %= width
    mask = (1 << width) - 1
    if amount == 0:
        return value & mask
    return ((value << amount) | (value >> (width - amount))) & mask


def rotl_expr(width, amount):
    amount %= width
    if amount == 0:
        return "in"
    return "{in[%d:0], in[%d:%d]}" % (width - amount - 1, width - 1, width - amount)


def choose_mode(values):
    counts = {}
    first_index = {}
    for index, value in enumerate(values):
        counts[value] = counts.get(value, 0) + 1
        first_index.setdefault(value, index)
    return min(counts, key=lambda value: (-counts[value], first_index[value], value))


def load_split_configs(path, cases, top_per_case):
    wanted = set(cases)
    grouped = {case: [] for case in cases}
    with Path(path).open(newline="") as handle:
        for row in csv.DictReader(handle):
            case = row.get("case", "")
            if case not in wanted:
                continue
            grouped[case].append(row)
    configs = {}
    for case in cases:
        rows = sorted(grouped.get(case, []), key=lambda row: int(row["rank"]))[:top_per_case]
        configs[case] = [
            {
                "variant": row["variant"],
                "rotate": int(row["rotate"]),
                "outer_low": row["outer"] == "low",
                "outer_bits": int(row["outer_bits"]),
                "inner_bits": int(row["inner_bits"]),
            }
            for row in rows
        ]
    return configs


def render_split(outputs, module, width, output_width, config):
    rotate_amount = config["rotate"]
    outer_low = config["outer_low"]
    outer_bits = config["outer_bits"]
    inner_bits = width - outer_bits
    if inner_bits != config["inner_bits"]:
        raise RuntimeError("inner_bits mismatch for {0}".format(config["variant"]))

    key_values = [0] * len(outputs)
    for index, value in enumerate(outputs):
        key_values[rotl(index, width, rotate_amount)] = value

    outer_name = "key_lo" if outer_low else "key_hi"
    inner_name = "key_hi" if outer_low else "key_lo"

    lines = [
        "module {0}(in, out);".format(module),
        "  input {0}in;".format(range_decl(width)),
        "  output {0}out;".format(range_decl(output_width)),
        "  wire {0}key = {1};".format(range_decl(width), rotl_expr(width, rotate_amount)),
        "  wire {0}key_hi = key[{1}:{2}];".format(range_decl(width - outer_bits if outer_low else outer_bits), width - 1, outer_bits if outer_low else inner_bits),
        "  wire {0}key_lo = key[{1}:0];".format(range_decl(outer_bits if outer_low else inner_bits), (outer_bits if outer_low else inner_bits) - 1),
        "  reg {0}out_r;".format(range_decl(output_width)),
        "  always @* begin",
        "    out_r = {0};".format(const_word(output_width, 0)),
        "    case ({0})".format(outer_name),
    ]

    exceptions = 0
    full_defaults = 0
    for outer in range(1 << outer_bits):
        group = []
        for inner in range(1 << inner_bits):
            key = (inner << outer_bits) | outer if outer_low else (outer << inner_bits) | inner
            group.append(key_values[key])
        default = choose_mode(group)
        differing = [(inner, value) for inner, value in enumerate(group) if value != default]
        lines.append("      {0}: begin".format(const_word(outer_bits, outer)))
        lines.append("        out_r = {0};".format(const_word(output_width, default)))
        if differing:
            lines.append("        case ({0})".format(inner_name))
            for inner, value in differing:
                lines.append(
                    "          {0}: out_r = {1};".format(
                        const_word(inner_bits, inner),
                        const_word(output_width, value),
                    )
                )
                exceptions += 1
            lines.extend(["          default: begin end", "        endcase"])
        else:
            full_defaults += 1
        lines.append("      end")
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
        key = rotl(index, width, rotate_amount)
        return key_values[key]

    items = "rotate={0}; outer={1}; outer_bits={2}; inner_bits={3}; full_default_groups={4}; exceptions={5}".format(
        rotate_amount,
        "low" if outer_low else "high",
        outer_bits,
        inner_bits,
        full_defaults,
        exceptions,
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
    return True, "exact arbitrary split model over {0} inputs".format(len(outputs))


def case_output_paths(args, case):
    case_dir = args.work_dir / case
    return {
        "verilog_dir": case_dir / "verilog",
        "aig_dir": case_dir / "aigs",
        "log_dir": case_dir / "logs",
        "manifest": case_dir / "manifest.json",
    }


def run_case(args, case, configs):
    truth_path = args.benchmarks / "{0}.truth".format(case)
    table = TruthTable(truth_path)
    outputs = list(table.iter_outputs())
    paths = case_output_paths(args, case)
    rows = []
    manifest = {
        "case": case,
        "truth": str(truth_path),
        "input_width": table.input_width,
        "output_width": table.output_width,
        "configs": [],
    }

    for config in configs:
        variant = config["variant"]
        candidate_id = "{0}_unknown_split_refine_{1}".format(case, variant)
        module = candidate_id
        verilog_path = paths["verilog_dir"] / "{0}.v".format(candidate_id)
        aig_path = paths["aig_dir"] / "{0}.aig".format(candidate_id)
        script_path = paths["log_dir"] / "{0}.ys".format(candidate_id)
        log_path = paths["log_dir"] / "{0}.yosys.log".format(candidate_id)
        start = time.time()
        row = {
            "case": case,
            "candidate_id": candidate_id,
            "hypothesis": "arbitrary_width_split_default",
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
            verilog, items, model = render_split(outputs, module, table.input_width, table.output_width, config)
            digest = text_hash(verilog)
            row["items"] = "{0}; hash={1}".format(items, digest[:12])
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
                    parent_id="arbitrary_width_split_default",
                    source="ai_verilog",
                    tool_chain="yosys_unknown_split_refine_{0}".format(variant),
                    aig_path=aig_path,
                    truth=truth_path,
                    abc=args.abc,
                    notes="unknown arbitrary split/default Verilog seed",
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
        manifest["configs"].append(row)
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

    write_text(paths["manifest"], json.dumps(manifest, indent=2, sort_keys=True) + "\n")
    return rows


def best_rows(rows):
    out = []
    for case in sorted(set(row["case"] for row in rows)):
        valid = [row for row in rows if row["case"] == case and row["equivalent"] == "1" and row["adp"]]
        if valid:
            best = min(valid, key=lambda row: int(row["adp"]))
            out.append({name: best.get(name, "") for name in BEST_FIELDNAMES})
    return out


def parse_args(argv=None):
    parser = argparse.ArgumentParser(description="Generate arbitrary split/default unknown candidates.")
    parser.add_argument("--cases", type=parse_cases, default=parse_cases("ex296,ex298"))
    parser.add_argument(
        "--split-stats",
        type=Path,
        default=ROOT / "student" / "runs" / "unknown" / "ex280_ex299_frontend_diagnostics_20260608_1105" / "results" / "split_stats.csv",
    )
    parser.add_argument("--top-per-case", type=int, default=3)
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--work-dir", type=Path, default=ROOT / "student" / "work" / "reverse_unknown_split_refine")
    parser.add_argument("--results", type=Path, default=ROOT / "student" / "results" / "unknown_split_refine.csv")
    parser.add_argument("--best-results", type=Path, default=ROOT / "student" / "results" / "unknown_split_refine_best.csv")
    parser.add_argument("--abc", type=Path, default=ROOT / "student" / "abc")
    parser.add_argument("--yosys", type=Path, default=ROOT / "student" / "tools" / "conda-env" / "bin" / "yosys")
    parser.add_argument("--timeout", type=int, default=900)
    parser.add_argument("--no-yosys-abc", action="store_true")
    return parser.parse_args(argv)


def main(argv=None):
    args = parse_args(argv)
    configs = load_split_configs(args.split_stats, args.cases, args.top_per_case)
    rows = []
    for case in args.cases:
        rows.extend(run_case(args, case, configs[case]))
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
