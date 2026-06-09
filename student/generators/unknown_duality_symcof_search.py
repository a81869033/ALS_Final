#!/usr/bin/env python3
"""Generate duality-wrapped symmetry-cofactor seeds."""

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
from student.generators.unknown_duality_bdd_search import reverse_bits, verify_duality
from student.generators.unknown_symmetry_bdd import parse_pairs, verify_pair_symmetry
from student.generators.unknown_symmetry_cofactor_search import parse_outer_bitsets, render
from student.generators.unknown_verilog_search import (
    ALL_FIELDNAMES,
    BEST_FIELDNAMES,
    parse_cases,
    range_decl,
    write_csv,
    write_text,
)


def inner_bits_for_split(width, split_bit):
    return [bit for bit in range(width) if bit != split_bit]


def original_to_inner(width, split_bit):
    return {bit: pos for pos, bit in enumerate(inner_bits_for_split(width, split_bit))}


def build_half_outputs_split(outputs, width, split_bit):
    bits = inner_bits_for_split(width, split_bit)
    half_outputs = []
    for rep in range(1 << (width - 1)):
        index = 0
        for pos, bit in enumerate(bits):
            if (rep >> pos) & 1:
                index |= 1 << bit
        half_outputs.append(outputs[index])
    return half_outputs


def wrap_verilog(top_module, inner_module, inner_text, width, split_bit, wrapper_style):
    half_width = width - 1
    bits = inner_bits_for_split(width, split_bit)
    lines = [
        "module {0}(in, out);".format(top_module),
        "  input {0}in;".format(range_decl(width)),
        "  output {0}out;".format(range_decl(width)),
        "  wire dual = in[{0}];".format(split_bit),
        "  wire {0}rep;".format(range_decl(half_width)),
        "  wire {0}base_out;".format(range_decl(width)),
    ]
    for pos, bit in enumerate(bits):
        if wrapper_style == "xor":
            lines.append("  assign rep[{0}] = in[{1}] ^ dual;".format(pos, bit))
        else:
            lines.append("  assign rep[{0}] = dual ? ~in[{1}] : in[{1}];".format(pos, bit))
    lines.append("  {0} inner(.in(rep), .out(base_out));".format(inner_module))
    for bit in range(width):
        rev = width - 1 - bit
        if wrapper_style == "xor":
            lines.append("  assign out[{0}] = (dual ? base_out[{1}] : base_out[{0}]) ^ dual;".format(bit, rev))
        else:
            lines.append("  assign out[{0}] = dual ? ~base_out[{1}] : base_out[{0}];".format(bit, rev))
    lines.append("endmodule")
    lines.append("")
    lines.append(inner_text)
    return "\n".join(lines)


def verify_wrapped(outputs, width, split_bit, inner_model):
    bits = inner_bits_for_split(width, split_bit)
    full = (1 << width) - 1
    for index, expected in enumerate(outputs):
        rep = 0
        for pos, bit in enumerate(bits):
            if (index >> bit) & 1:
                rep |= 1 << pos
        if (index >> split_bit) & 1:
            rep ^= (1 << (width - 1)) - 1
            actual = full ^ reverse_bits(inner_model(rep), width)
        else:
            actual = inner_model(rep)
        if actual != expected:
            return False, "first mismatch index=0x{0:x} expected=0x{1:x} actual=0x{2:x}".format(
                index, expected, actual
            )
    return True, "exact duality-wrapped symcof model over {0} inputs".format(len(outputs))


def best_rows(rows):
    best = []
    for case in sorted(set(row["case"] for row in rows)):
        valid = [row for row in rows if row["case"] == case and row["equivalent"] == "1" and row["adp"]]
        if valid:
            item = min(valid, key=lambda row: int(row["adp"]))
            best.append({name: item.get(name, "") for name in BEST_FIELDNAMES})
    return best


def run_case(args, case):
    truth_path = args.benchmarks / "{0}.truth".format(case)
    table = TruthTable(truth_path)
    outputs = list(table.iter_outputs())
    dual_ok, dual_note = verify_duality(outputs, table.input_width)
    rows = []
    manifest = {"case": case, "duality": dual_note, "rows": []}
    if not dual_ok or table.input_width != table.output_width:
        return rows, manifest
    half_width = table.input_width - 1
    split_bits = args.split_bits
    label = "unknown_duality_symcof"
    case_dir = args.work_dir / case
    for split_bit in split_bits:
        remap = original_to_inner(table.input_width, split_bit)
        half_outputs = build_half_outputs_split(outputs, table.input_width, split_bit)
        pairs = []
        for a, b in args.pairs:
            if a == split_bit or b == split_bit:
                continue
            pairs.append((remap[a], remap[b]))
        sym_ok, sym_note = verify_pair_symmetry(half_outputs, half_width, pairs)
        manifest.setdefault("splits", {})[str(split_bit)] = {"half_pair_symmetry": sym_note}
        if not sym_ok:
            continue
        for order_name in args.orders:
            for policy in args.invalid_policies:
                for outer_bits_original in args.outer_bitsets:
                    if split_bit in outer_bits_original:
                        continue
                    outer_bits = tuple(remap[bit] for bit in outer_bits_original)
                    for mux_style in args.mux_styles:
                        for share_style in args.bdd_share_styles:
                            for wrapper_style in args.wrapper_styles:
                                order_label = "" if order_name == "interleave" else "{0}_".format(order_name)
                                variant = "{0}_bits_{1}_{2}_{3}".format(
                                    policy,
                                    "_".join(str(bit) for bit in outer_bits_original),
                                    mux_style,
                                    share_style,
                                )
                                variant = order_label + variant
                                if split_bit != table.input_width - 1:
                                    variant = "split{0}_{1}".format(split_bit, variant)
                                if wrapper_style != "mux":
                                    variant = "{0}_{1}".format(variant, wrapper_style)
                                candidate_id = "{0}_{1}_{2}".format(case, label, variant)
                                inner_module = candidate_id + "_inner"
                                verilog_path = case_dir / "verilog" / "{0}.v".format(candidate_id)
                                aig_path = case_dir / "aigs" / "{0}.aig".format(candidate_id)
                                script_path = case_dir / "logs" / "{0}.ys".format(candidate_id)
                                log_path = case_dir / "logs" / "{0}.yosys.log".format(candidate_id)
                                row = {
                                    "case": case,
                                    "candidate_id": candidate_id,
                                    "hypothesis": label,
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
                                start = time.time()
                                try:
                                    inner_text, items, inner_model = render(
                                        half_outputs,
                                        inner_module,
                                        half_width,
                                        table.output_width,
                                        pairs,
                                        order_name,
                                        policy,
                                        len(outer_bits),
                                        explicit_outer_bits=outer_bits,
                                        mux_style=mux_style,
                                        bdd_share_style=share_style,
                                    )
                                    verilog = wrap_verilog(
                                        candidate_id,
                                        inner_module,
                                        inner_text,
                                        table.input_width,
                                        split_bit,
                                        wrapper_style,
                                    )
                                    row["items"] = "duality_wrapper=split{0}; original_pairs={1}; ".format(
                                        split_bit,
                                        ",".join("{0}:{1}".format(a, b) for a, b in args.pairs),
                                    ) + items
                                    verified, note = verify_wrapped(outputs, table.input_width, split_bit, inner_model)
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
                                            use_abc=True,
                                            script_out=script_path,
                                        )
                                        write_text(log_path, yosys_log)
                                        row["synthesized"] = "1"
                                        evaluated = evaluate_aig(
                                            case=case,
                                            candidate_id=candidate_id,
                                            parent_id=label,
                                            source="ai_verilog",
                                            tool_chain="yosys_duality_symcof",
                                            aig_path=aig_path,
                                            truth=truth_path,
                                            abc=args.abc,
                                            notes="unknown duality-wrapped symmetry cofactor seed",
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
                                manifest["rows"].append(row)
                                print("{0} {1} eq={2} area={3} delay={4} adp={5}".format(
                                    case, variant, row["equivalent"], row["area"], row["delay"], row["adp"]
                                ))
                                sys.stdout.flush()
    return rows, manifest


def parse_args(argv):
    parser = argparse.ArgumentParser()
    parser.add_argument("--cases", type=parse_cases, required=True)
    parser.add_argument("--pairs", type=parse_pairs, default=parse_pairs("4:5,6:7,8:9,10:11"))
    parser.add_argument("--split-bits", default="15")
    parser.add_argument("--orders", default="interleave")
    parser.add_argument("--invalid-policies", default="f00")
    parser.add_argument("--outer-bitsets", type=parse_outer_bitsets, default=parse_outer_bitsets("0:1:12:13"))
    parser.add_argument("--mux-styles", default="case,onehot")
    parser.add_argument("--bdd-share-styles", default="group")
    parser.add_argument("--wrapper-styles", default="mux")
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--work-dir", type=Path, required=True)
    parser.add_argument("--results", type=Path, required=True)
    parser.add_argument("--best-results", type=Path, required=True)
    parser.add_argument("--abc", type=Path, default=ROOT / "student" / "abc")
    parser.add_argument("--yosys", type=Path, default=ROOT / "student" / "tools" / "conda-env" / "bin" / "yosys")
    parser.add_argument("--timeout", type=int, default=900)
    args = parser.parse_args(argv)
    args.invalid_policies = [item.strip() for item in args.invalid_policies.split(",") if item.strip()]
    args.split_bits = [int(item.strip()) for item in args.split_bits.split(",") if item.strip()]
    args.orders = [item.strip() for item in args.orders.split(",") if item.strip()]
    args.mux_styles = [item.strip() for item in args.mux_styles.split(",") if item.strip()]
    args.bdd_share_styles = [item.strip() for item in args.bdd_share_styles.split(",") if item.strip()]
    args.wrapper_styles = [item.strip() for item in args.wrapper_styles.split(",") if item.strip()]
    return args


def main(argv=None):
    args = parse_args(argv)
    all_rows = []
    manifests = {}
    for case in args.cases:
        rows, manifest = run_case(args, case)
        all_rows.extend(rows)
        manifests[case] = manifest
    write_csv(args.results, ALL_FIELDNAMES, all_rows)
    write_csv(args.best_results, BEST_FIELDNAMES, best_rows(all_rows))
    write_text(args.work_dir / "manifest.json", json.dumps(manifests, indent=2, sort_keys=True) + "\n")
    return 0 if best_rows(all_rows) else 1


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
