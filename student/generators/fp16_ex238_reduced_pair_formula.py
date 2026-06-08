#!/usr/bin/env python3
"""Reduced-pair ex238 reciprocal-cube source.

The current best overlays a b10/b9 formula on top of the old 32-bit pair table.
This generator removes those overwritten bits from the table entirely and keeps
only the remaining output bits in a 28-bit positive/negative pair.
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
from student.frontends.yosys_synth import SynthError, run_command
from student.generators.fp16_semantic_search import (
    BEST_FIELDNAMES,
    RESULT_FIELDNAMES,
    add_reference_columns,
    const_word,
    load_reference,
    rel_path,
    write_csv,
)
from student.scripts.yosys_synthflow_variants import script_abc_gate, script_synth_preset


REST_BITS = [15, 14, 13, 12, 11, 8, 7, 6, 5, 4, 3, 2, 1, 0]


def write_text(path, text):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(text)


def pack_rest(value):
    packed = 0
    for bit in REST_BITS:
        packed = (packed << 1) | ((value >> bit) & 1)
    return packed


def render_formula_lines():
    return [
        "  wire m_zero = (mant == 10'h000);",
        "  wire le_067 = (mant <= 10'h067);",
        "  wire le_10a = (mant <= 10'h10a);",
        "  wire le_18c = (mant <= 10'h18c);",
        "  wire le_259 = (mant <= 10'h259);",
        "  wire le_2fd = (mant <= 10'h2fd);",
        "  wire [1:0] even_core = m_zero ? 2'h0 :",
        "                         le_067 ? 2'h3 :",
        "                         le_10a ? 2'h2 :",
        "                         le_18c ? 2'h1 :",
        "                         le_259 ? 2'h0 :",
        "                         le_2fd ? 2'h3 : 2'h2;",
        "  wire [1:0] core_bits = even_core ^ {exp[0], 1'b0};",
        "  wire [1:0] exp09_bits = le_259 ? 2'h2 : (le_2fd ? 2'h1 : 2'h0);",
        "  wire [1:0] exp19_bits = m_zero ? 2'h2 :",
        "                         le_067 ? 2'h1 :",
        "                         le_10a ? 2'h0 :",
        "                         le_18c ? 2'h3 :",
        "                         le_259 ? 2'h2 : 2'h0;",
        "  wire [1:0] exp31_bits = m_zero ? 2'h0 : 2'h3;",
        "  wire core_exp = (exp >= 5'h0a) && (exp <= 5'h12);",
        "  wire [1:0] mag_bits = (exp <= 5'h08) ? 2'h2 :",
        "                        (exp == 5'h09) ? exp09_bits :",
        "                        core_exp ? core_bits :",
        "                        (exp == 5'h13) ? exp19_bits :",
        "                        (exp == 5'h1f) ? exp31_bits : 2'h0;",
    ]


def render_candidate(table, module):
    lines = [
        "module {0}(in, out);".format(module),
        "  input [15:0] in;",
        "  output [15:0] out;",
        "  wire sign = in[15];",
        "  wire [4:0] exp = in[14:10];",
        "  wire [9:0] mant = in[9:0];",
        "  reg [27:0] rest_pair;",
        "  wire [13:0] rest = sign ? rest_pair[27:14] : rest_pair[13:0];",
    ]
    lines.extend(render_formula_lines())
    lines.extend(["  always @* begin", "    case (exp)"])
    table_items = 0
    full_groups = 0
    const_groups = 0
    for exp in range(32):
        pairs = []
        for mant in range(1024):
            pos = table.get_output((exp << 10) | mant)
            neg = table.get_output((1 << 15) | (exp << 10) | mant)
            pairs.append((pack_rest(neg) << 14) | pack_rest(pos))
        unique = set(pairs)
        if len(unique) == 1:
            const_groups += 1
            table_items += 1
            lines.append("      5'h{0:02x}: rest_pair = {1};".format(exp, const_word(28, pairs[0])))
        else:
            full_groups += 1
            lines.append("      5'h{0:02x}: begin".format(exp))
            lines.append("        case (mant)")
            for mant, pair in enumerate(pairs):
                table_items += 1
                lines.append("          {0}: rest_pair = {1};".format(const_word(10, mant), const_word(28, pair)))
            lines.extend(["          default: rest_pair = 28'h0000000;", "        endcase", "      end"])
    lines.extend(["      default: rest_pair = 28'h0000000;", "    endcase", "  end"])
    # rest order: 15,14,13,12,11,8,7,6,5,4,3,2,1,0
    mapping = {bit: index for index, bit in enumerate(reversed(REST_BITS))}
    for bit in range(16):
        if bit == 9:
            lines.append("  assign out[9] = mag_bits[0];")
        elif bit == 10:
            lines.append("  assign out[10] = mag_bits[1];")
        else:
            lines.append("  assign out[{0}] = rest[{1}];".format(bit, mapping[bit]))
    lines.extend(["endmodule", ""])
    note = "reduced 28-bit sign pair excluding output bits 10/9; const_groups={0}; full_groups={1}; table_items={2}".format(
        const_groups, full_groups, table_items
    )
    return "\n".join(lines), note


def synthesize_with_script(script, yosys, timeout, log_path):
    log_path.parent.mkdir(parents=True, exist_ok=True)
    script_path = log_path.with_suffix(".ys")
    write_text(script_path, script)
    code, log = run_command([str(yosys), "-s", str(script_path)], timeout=timeout)
    write_text(log_path, log)
    if code != 0:
        raise SynthError("Yosys failed with exit code {0}".format(code))


def row_template(candidate_id, variant, verilog_path, aig_path, note):
    return {
        "case": "ex238",
        "candidate_id": candidate_id,
        "hypothesis/function_guess": "fp16_reciprocal_cube",
        "variant": variant,
        "verilog_path": rel_path(verilog_path),
        "aig_path": rel_path(aig_path),
        "verified_truth": "1",
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
        "items": note,
        "classification": "semantic_reduced_pair_formula",
        "notes": "",
    }


def run_one(args, refs, flow_name, script_func, text, note):
    module = "ex238_reduced_pair_b10_9_formula"
    verilog_path = args.work_dir / "ex238/verilog/{0}.v".format(module)
    write_text(verilog_path, text)
    variant = "reduced_pair_b10_9_{0}".format(flow_name)
    candidate_id = "ex238_{0}".format(variant)
    aig_path = args.work_dir / "ex238/aigs/{0}.aig".format(candidate_id)
    log_path = args.work_dir / "ex238/logs/{0}.log".format(candidate_id)
    row = row_template(candidate_id, variant, verilog_path, aig_path, note)
    start = time.time()
    try:
        aig_path.parent.mkdir(parents=True, exist_ok=True)
        script = script_func(verilog_path, module, aig_path)
        synthesize_with_script(script, args.yosys, args.timeout, log_path)
        row["synthesized"] = "1"
        ev = evaluate_aig(
            case="ex238",
            candidate_id=candidate_id,
            parent_id=variant,
            source="fp16_ex238_reduced_pair_formula",
            tool_chain="yosys_{0}".format(flow_name),
            aig_path=aig_path,
            truth=args.benchmarks / "ex238.truth",
            abc=args.abc,
            notes=note,
            timeout=args.timeout,
        )
        row["equivalent"] = "1" if ev.equivalent else "0"
        row["area"] = "" if ev.area is None else str(ev.area)
        row["delay"] = "" if ev.delay is None else str(ev.delay)
        row["adp"] = "" if ev.adp is None else str(ev.adp)
        row["notes"] = ev.notes
    except (RuntimeError, SynthError, OSError, subprocess.TimeoutExpired) as exc:
        row["notes"] = "{0}: {1}".format(type(exc).__name__, exc)[:1000]
    row["runtime_sec"] = "{0:.3f}".format(time.time() - start)
    add_reference_columns(row, refs)
    print("ex238 {0} eq={1} area={2} delay={3} adp={4}".format(flow_name, row["equivalent"], row["area"], row["delay"], row["adp"]))
    sys.stdout.flush()
    return row


def parse_args():
    parser = argparse.ArgumentParser(description="Reduced-pair ex238 formula candidate.")
    parser.add_argument("--flows", default="abc_g_aig,synth_preset")
    parser.add_argument("--work-dir", type=Path, required=True)
    parser.add_argument("--results", type=Path, required=True)
    parser.add_argument("--best-results", type=Path, required=True)
    parser.add_argument("--summary", type=Path, required=True)
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--reference", type=Path, default=ROOT / "reference_result.csv")
    parser.add_argument("--yosys", type=Path, default=ROOT / "student/tools/conda-env/bin/yosys")
    parser.add_argument("--abc", type=Path, default=ROOT / "student/abc")
    parser.add_argument("--timeout", type=int, default=900)
    return parser.parse_args()


def main():
    args = parse_args()
    refs = load_reference(args.reference)
    table = TruthTable(args.benchmarks / "ex238.truth")
    text, note = render_candidate(table, "ex238_reduced_pair_b10_9_formula")
    flow_map = {
        "abc_g_aig": ("abc_g_aig", lambda v, m, o: script_abc_gate(v, m, o, "aig")),
        "synth_preset": ("synth_preset", script_synth_preset),
    }
    rows = []
    for name in [item.strip() for item in args.flows.split(",") if item.strip()]:
        flow_name, script_func = flow_map[name]
        rows.append(run_one(args, refs, flow_name, script_func, text, note))
    write_csv(args.results, RESULT_FIELDNAMES, rows)
    valid = [row for row in rows if row["equivalent"] == "1" and row["adp"]]
    best = []
    if valid:
        item = min(valid, key=lambda row: (int(row["adp"]), int(row["delay"]), int(row["area"])))
        best.append({name: item.get(name, "") for name in BEST_FIELDNAMES})
    write_csv(args.best_results, BEST_FIELDNAMES, best)
    args.summary.parent.mkdir(parents=True, exist_ok=True)
    with args.summary.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=["case", "variant", "notes"])
        writer.writeheader()
        writer.writerow({"case": "ex238", "variant": "reduced_pair_b10_9_formula", "notes": note})
    write_text(args.work_dir / "manifest.json", json.dumps(rows, indent=2) + "\n")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
