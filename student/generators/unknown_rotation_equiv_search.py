#!/usr/bin/env python3
"""Generate exact rotation-equivariant frontend seeds for unknown cases."""

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


VARIANTS = ["rot2_canonical_case"]


def parse_variant_list(value):
    variants = []
    valid = set(VARIANTS)
    for item in value.split(","):
        item = item.strip()
        if not item:
            continue
        if item not in valid:
            raise argparse.ArgumentTypeError("unknown variant: {0}".format(item))
        variants.append(item)
    if not variants:
        raise argparse.ArgumentTypeError("empty variant list")
    return variants


def rotl(value, width, amount):
    amount %= width
    mask = (1 << width) - 1
    if amount == 0:
        return value & mask
    return ((value << amount) | (value >> (width - amount))) & mask


def rotr(value, width, amount):
    amount %= width
    mask = (1 << width) - 1
    if amount == 0:
        return value & mask
    return ((value >> amount) | (value << (width - amount))) & mask


def rotl_expr(source, width, amount):
    amount %= width
    if amount == 0:
        return source
    return "{{{0}[{1}:0], {0}[{2}:{3}]}}".format(
        source,
        width - amount - 1,
        width - 1,
        width - amount,
    )


def rotr_expr(source, width, amount):
    amount %= width
    if amount == 0:
        return source
    return "{{{0}[{1}:0], {0}[{2}:{3}]}}".format(
        source,
        amount - 1,
        width - 1,
        amount,
    )


def canonical_rot2(value, width):
    steps = width // 2
    best = value
    best_shift = 0
    for shift in range(1, steps):
        rotated = rotl(value, width, 2 * shift)
        if rotated < best:
            best = rotated
            best_shift = shift
    return best, best_shift


def verify_rot2_equivariance(outputs, width):
    steps = width // 2
    for shift in range(1, steps):
        amount = 2 * shift
        for index, value in enumerate(outputs):
            if outputs[rotl(index, width, amount)] != rotl(value, width, amount):
                return False, "rot2 equivariance fails shift={0} index={1}".format(shift, index)
    return True, "exact rot2 equivariance over {0} inputs".format(len(outputs))


def canonical_table(outputs, width):
    table = {}
    for index, value in enumerate(outputs):
        key, shift = canonical_rot2(index, width)
        canon_value = rotl(value, width, 2 * shift)
        old = table.get(key)
        if old is not None and old != canon_value:
            raise RuntimeError("inconsistent canonical output for key 0x{0:x}".format(key))
        table[key] = canon_value
    return table


def shift_bits_for_steps(steps):
    bits = 1
    while (1 << bits) < steps:
        bits += 1
    return bits


def render_rot2_canonical_case(outputs, module, width):
    ok, note = verify_rot2_equivariance(outputs, width)
    if not ok:
        raise RuntimeError(note)
    steps = width // 2
    shift_bits = shift_bits_for_steps(steps)
    table = canonical_table(outputs, width)

    lines = [
        "module {0}(in, out);".format(module),
        "  input {0}in;".format(range_decl(width)),
        "  output {0}out;".format(range_decl(width)),
    ]
    for shift in range(steps):
        lines.append("  wire {0}r{1} = {2};".format(range_decl(width), shift, rotl_expr("in", width, 2 * shift)))
    lines.extend(
        [
            "  reg {0}key;".format(range_decl(width)),
            "  reg [{0}:0] sh;".format(shift_bits - 1),
            "  reg {0}canon_out;".format(range_decl(width)),
            "  reg {0}out_r;".format(range_decl(width)),
            "  always @* begin",
            "    key = r0;",
            "    sh = {0}'d0;".format(shift_bits),
        ]
    )
    for shift in range(1, steps):
        lines.extend(
            [
                "    if (r{0} < key) begin".format(shift),
                "      key = r{0};".format(shift),
                "      sh = {0}'d{1};".format(shift_bits, shift),
                "    end",
            ]
        )
    lines.extend(
        [
            "    canon_out = {0};".format(const_word(width, 0)),
            "    case (key)",
        ]
    )
    for key in sorted(table):
        lines.append("      {0}: canon_out = {1};".format(const_word(width, key), const_word(width, table[key])))
    lines.extend(
        [
            "      default: begin end",
            "    endcase",
            "    case (sh)",
        ]
    )
    for shift in range(steps):
        lines.append(
            "      {0}'d{1}: out_r = {2};".format(
                shift_bits,
                shift,
                rotr_expr("canon_out", width, 2 * shift),
            )
        )
    lines.extend(
        [
            "      default: out_r = canon_out;",
            "    endcase",
            "  end",
            "  assign out = out_r;",
            "endmodule",
            "",
        ]
    )

    def model(index):
        key, shift = canonical_rot2(index, width)
        return rotr(table[key], width, 2 * shift)

    items = "rot_step=2; orbit_steps={0}; canonical_entries={1}; {2}".format(
        steps,
        len(table),
        note,
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
    return True, "exact rotation-equivariant model over {0} inputs".format(len(outputs))


def case_output_paths(args, case):
    case_dir = args.work_dir / case
    return {
        "verilog_dir": case_dir / "verilog",
        "aig_dir": case_dir / "aigs",
        "log_dir": case_dir / "logs",
        "manifest": case_dir / "manifest.json",
    }


def run_case(args, case):
    truth_path = args.benchmarks / "{0}.truth".format(case)
    table = TruthTable(truth_path)
    if table.input_width != table.output_width or table.input_width % 2:
        raise RuntimeError("{0} must have equal even input/output width".format(case))
    outputs = list(table.iter_outputs())
    paths = case_output_paths(args, case)
    rows = []
    manifest = {
        "case": case,
        "truth": str(truth_path),
        "input_width": table.input_width,
        "output_width": table.output_width,
        "variants": [],
    }

    for variant in args.variants:
        candidate_id = "{0}_unknown_rot2_{1}".format(case, variant)
        module = candidate_id
        verilog_path = paths["verilog_dir"] / "{0}.v".format(candidate_id)
        aig_path = paths["aig_dir"] / "{0}.aig".format(candidate_id)
        script_path = paths["log_dir"] / "{0}.ys".format(candidate_id)
        log_path = paths["log_dir"] / "{0}.yosys.log".format(candidate_id)
        start = time.time()
        row = {
            "case": case,
            "candidate_id": candidate_id,
            "hypothesis": "rot2_equivariant_canonical",
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
            if variant != "rot2_canonical_case":
                raise RuntimeError("unknown variant: {0}".format(variant))
            verilog, items, model = render_rot2_canonical_case(outputs, module, table.input_width)
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
                    use_abc=not args.no_yosys_abc,
                    script_out=script_path,
                )
                write_text(log_path, yosys_log)
                row["synthesized"] = "1"
                evaluated = evaluate_aig(
                    case=case,
                    candidate_id=candidate_id,
                    parent_id="rot2_equivariant_canonical",
                    source="ai_verilog",
                    tool_chain="yosys_unknown_rot2_{0}".format(variant),
                    aig_path=aig_path,
                    truth=truth_path,
                    abc=args.abc,
                    notes="unknown rot2-equivariant canonical Verilog seed",
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
    parser = argparse.ArgumentParser(description="Generate exact rot2-equivariant unknown candidates.")
    parser.add_argument("--cases", type=parse_cases, default=parse_cases("ex295,ex297,ex299"))
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--work-dir", type=Path, default=ROOT / "student" / "work" / "reverse_unknown_rotation")
    parser.add_argument("--results", type=Path, default=ROOT / "student" / "results" / "unknown_rotation.csv")
    parser.add_argument("--best-results", type=Path, default=ROOT / "student" / "results" / "unknown_rotation_best.csv")
    parser.add_argument("--abc", type=Path, default=ROOT / "student" / "abc")
    parser.add_argument("--yosys", type=Path, default=ROOT / "student" / "tools" / "conda-env" / "bin" / "yosys")
    parser.add_argument("--timeout", type=int, default=900)
    parser.add_argument("--no-yosys-abc", action="store_true")
    parser.add_argument("--variants", type=parse_variant_list, default=VARIANTS)
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
