#!/usr/bin/env python3
"""Generate GF(2) bilinear-rank ANF decompositions for unknown cases."""

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
from student.generators.unknown_algebraic_search import (
    anf_by_bit,
    eval_anf_word,
    key_lines_for_transform,
    transformed_outputs,
)
from student.generators.unknown_key_ac_decomp_search import (
    EVALUATE_FIELDNAMES,
    SUMMARY_FIELDNAMES,
    add_summary_columns,
    interleave_order,
    load_current_best,
    load_reference,
)
from student.generators.unknown_verilog_search import (
    ALL_FIELDNAMES,
    BEST_FIELDNAMES,
    parse_cases,
    range_decl,
    text_hash,
    write_csv,
    write_text,
)


def popcount(value):
    return bin(value).count("1")


def xor_expr(items):
    items = [item for item in items if item != "1'b0"]
    if not items:
        return "1'b0"
    if len(items) == 1:
        return items[0]
    return "(" + " ^ ".join(items) + ")"


def and_expr(items):
    items = [item for item in items if item != "1'b1"]
    if not items:
        return "1'b1"
    if len(items) == 1:
        return items[0]
    return "(" + " & ".join(items) + ")"


def parse_list(text):
    return [item.strip() for item in text.split(",") if item.strip()]


def split_bits(width, split):
    if split == "mid3":
        size = 3
        start = (width - size) // 2
        return tuple(range(start, start + size))
    if split == "mid4":
        size = 4
        start = (width - size) // 2
        return tuple(range(start, start + size))
    if split == "mid5":
        size = 5
        start = (width - size) // 2
        return tuple(range(start, start + size))
    if split == "inter4":
        return tuple(interleave_order(width)[:4])
    if split == "inter6":
        return tuple(interleave_order(width)[:6])
    if split == "inter8":
        return tuple(interleave_order(width)[:8])
    if split.startswith("bits_"):
        bits = tuple(int(part) for part in split[5:].split("_") if part != "")
        if not bits or len(set(bits)) != len(bits):
            raise RuntimeError("bad split bits: {0}".format(split))
        if any(bit < 0 or bit >= width for bit in bits):
            raise RuntimeError("split bit outside width {0}: {1}".format(width, split))
        return bits
    raise RuntimeError("unknown split: {0}".format(split))


def bitset_items(poly):
    index = 0
    while poly:
        if poly & 1:
            yield index
        poly >>= 1
        index += 1


def local_masks_for_terms(terms, width, a_bits):
    a_bits = tuple(a_bits)
    a_set = set(a_bits)
    b_bits = tuple(bit for bit in range(width) if bit not in a_set)
    a_index = {bit: pos for pos, bit in enumerate(a_bits)}
    b_index = {bit: pos for pos, bit in enumerate(b_bits)}
    rows = [0] * (1 << len(a_bits))
    for mask in terms:
        a_mask = 0
        b_mask = 0
        for bit in range(width):
            if (mask >> bit) & 1:
                if bit in a_set:
                    a_mask |= 1 << a_index[bit]
                else:
                    b_mask |= 1 << b_index[bit]
        rows[a_mask] ^= 1 << b_mask
    return rows, b_bits


def row_basis(rows):
    basis = []
    for row in rows:
        value = row
        for pivot, basis_row in basis:
            if (value >> pivot) & 1:
                value ^= basis_row
        if not value:
            continue
        pivot = value.bit_length() - 1
        reduced = []
        for old_pivot, basis_row in basis:
            if (basis_row >> pivot) & 1:
                basis_row ^= value
            reduced.append((old_pivot, basis_row))
        reduced.append((pivot, value))
        reduced.sort(reverse=True)
        basis = reduced
    return basis


def decompose_terms(terms, width, a_bits):
    rows, b_bits = local_masks_for_terms(terms, width, a_bits)
    basis = row_basis(rows)
    coeffs = [0] * len(basis)
    for row_index, row in enumerate(rows):
        value = row
        used = 0
        for basis_index, (pivot, basis_row) in enumerate(basis):
            if (value >> pivot) & 1:
                value ^= basis_row
                used ^= 1 << basis_index
        if value:
            raise RuntimeError("rank decomposition failed")
        for basis_index in range(len(basis)):
            if (used >> basis_index) & 1:
                coeffs[basis_index] ^= 1 << row_index
    return [(coeffs[index], basis[index][1]) for index in range(len(basis))], b_bits


def compose_full_mask(a_mask, b_mask, a_bits, b_bits):
    full = 0
    for pos, bit in enumerate(a_bits):
        if (a_mask >> pos) & 1:
            full |= 1 << bit
    for pos, bit in enumerate(b_bits):
        if (b_mask >> pos) & 1:
            full |= 1 << bit
    return full


def verify_decomposition(terms_by_bit, width, a_bits):
    for terms in terms_by_bit:
        pairs, b_bits = decompose_terms(terms, width, a_bits)
        rebuilt = set()
        for a_poly, b_poly in pairs:
            for a_mask in bitset_items(a_poly):
                for b_mask in bitset_items(b_poly):
                    full = compose_full_mask(a_mask, b_mask, a_bits, b_bits)
                    if full in rebuilt:
                        rebuilt.remove(full)
                    else:
                        rebuilt.add(full)
        if rebuilt != set(terms):
            return False
    return True


def product_signal(lines, cache, prefix, mask, bits):
    if mask == 0:
        return "1'b1"
    key = (prefix, mask)
    if key in cache:
        return cache[key]
    name = "{0}_{1:x}".format(prefix, mask)
    terms = []
    for pos, bit in enumerate(bits):
        if (mask >> pos) & 1:
            terms.append("key[{0}]".format(bit))
    lines.append("  wire {0} = {1};".format(name, and_expr(terms)))
    cache[key] = name
    return name


def polynomial_signal(lines, cache, product_cache, prefix, poly, bits):
    if poly == 0:
        return "1'b0"
    if popcount(poly) == 1:
        mask = next(bitset_items(poly))
        return product_signal(lines, product_cache, prefix + "m", mask, bits)
    key = (prefix, poly)
    if key in cache:
        return cache[key]
    name = "{0}_{1}".format(prefix, len(cache))
    terms = [
        product_signal(lines, product_cache, prefix + "m", mask, bits)
        for mask in bitset_items(poly)
    ]
    lines.append("  wire {0} = {1};".format(name, xor_expr(terms)))
    cache[key] = name
    return name


def render(outputs, module, input_width, output_width, transform, split):
    values = transformed_outputs(outputs, input_width, transform)
    terms_by_bit = anf_by_bit(values, input_width, output_width)
    a_bits = split_bits(input_width, split)
    if not verify_decomposition(terms_by_bit, input_width, a_bits):
        raise RuntimeError("internal decomposition verification failed")
    b_bits = tuple(bit for bit in range(input_width) if bit not in set(a_bits))

    lines = [
        "module {0}(in, out);".format(module),
        "  input {0}in;".format(range_decl(input_width)),
        "  output {0}out;".format(range_decl(output_width)),
    ]
    lines.extend(key_lines_for_transform(transform, input_width))

    product_cache = {}
    poly_cache = {}
    products = 0
    unique_a = set()
    unique_b = set()
    a_term_count = 0
    b_term_count = 0
    ranks = []

    bit_terms = [[] for _ in range(output_width)]
    for bit, terms in enumerate(terms_by_bit):
        pairs, check_b_bits = decompose_terms(terms, input_width, a_bits)
        if tuple(check_b_bits) != b_bits:
            raise RuntimeError("inconsistent B split")
        ranks.append(len(pairs))
        for a_poly, b_poly in pairs:
            unique_a.add(a_poly)
            unique_b.add(b_poly)
            a_term_count += popcount(a_poly)
            b_term_count += popcount(b_poly)
            a_signal = polynomial_signal(lines, poly_cache, product_cache, "ap", a_poly, a_bits)
            b_signal = polynomial_signal(lines, poly_cache, product_cache, "bp", b_poly, b_bits)
            products += 1
            if a_signal == "1'b1":
                bit_terms[bit].append(b_signal)
            elif b_signal == "1'b1":
                bit_terms[bit].append(a_signal)
            else:
                bit_terms[bit].append("({0} & {1})".format(a_signal, b_signal))

    for bit, items in enumerate(bit_terms):
        lines.append("  assign out[{0}] = {1};".format(bit, xor_expr(items)))
    lines.append("endmodule")
    lines.append("")

    items = (
        "transform={0}; split={1}; a_bits={2}; b_width={3}; "
        "rank_sum={4}; rank_max={5}; unique_a={6}; unique_b={7}; "
        "a_terms={8}; b_terms={9}; anf_terms={10}"
    ).format(
        transform,
        split,
        ":".join(str(bit) for bit in a_bits),
        len(b_bits),
        sum(ranks),
        max(ranks) if ranks else 0,
        len(unique_a),
        len(unique_b),
        a_term_count,
        b_term_count,
        sum(len(terms) for terms in terms_by_bit),
    )

    def model(index):
        key = index
        if transform != "identity":
            from student.generators.unknown_algebraic_search import transform_index

            key = transform_index(transform, index, input_width)
        return eval_anf_word(terms_by_bit, key)

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
    return True, "exact bilinear-rank ANF model over {0} inputs".format(len(outputs))


def best_rows(rows):
    best = []
    for case in sorted(set(row["case"] for row in rows)):
        valid = [
            row
            for row in rows
            if row["case"] == case and row["equivalent"] == "1" and row["adp"]
        ]
        if valid:
            item = min(valid, key=lambda row: int(row["adp"]))
            best.append({name: item.get(name, "") for name in BEST_FIELDNAMES})
    return best


def run_case(args, case):
    truth_path = args.benchmarks / "{0}.truth".format(case)
    table = TruthTable(truth_path)
    outputs = list(table.iter_outputs())
    rows = []
    manifest = {
        "case": case,
        "truth": str(truth_path),
        "input_width": table.input_width,
        "output_width": table.output_width,
        "hypothesis": "unknown_bilinear_rank_anf",
        "variants": [],
    }
    for transform in args.transforms:
        for split in args.splits:
            variant = "{0}_{1}".format(transform, split)
            candidate_id = "{0}_unknown_bilinear_rank_anf_{1}".format(case, variant)
            module = candidate_id
            verilog_path = args.work_dir / case / "verilog" / "{0}.v".format(candidate_id)
            aig_path = args.work_dir / case / "aigs" / "{0}.aig".format(candidate_id)
            script_path = args.work_dir / case / "logs" / "{0}.ys".format(candidate_id)
            log_path = args.work_dir / case / "logs" / "{0}.yosys.log".format(candidate_id)
            start = time.time()
            row = {
                "case": case,
                "candidate_id": candidate_id,
                "hypothesis": "unknown_bilinear_rank_anf",
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
                verilog, items, model = render(
                    outputs,
                    module,
                    table.input_width,
                    table.output_width,
                    transform,
                    split,
                )
                row["items"] = "{0}; hash={1}".format(items, text_hash(verilog)[:12])
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
                        parent_id="unknown_bilinear_rank_anf",
                        source="ai_verilog",
                        tool_chain="yosys_unknown_bilinear_rank_anf",
                        aig_path=aig_path,
                        truth=truth_path,
                        abc=args.abc,
                        notes="unknown bilinear-rank ANF Verilog seed",
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
    write_text(args.work_dir / case / "manifest.json", json.dumps(manifest, indent=2, sort_keys=True) + "\n")
    return rows


def parse_args(argv=None):
    parser = argparse.ArgumentParser(description="Generate bilinear-rank ANF candidates.")
    parser.add_argument("--cases", type=parse_cases, required=True)
    parser.add_argument("--transforms", type=parse_list, default=parse_list("prefix_parity_reduce"))
    parser.add_argument("--splits", type=parse_list, default=parse_list("mid3,mid4,inter4,inter6"))
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--work-dir", type=Path, required=True)
    parser.add_argument("--results", type=Path, required=True)
    parser.add_argument("--best-results", type=Path, required=True)
    parser.add_argument("--summary-results", type=Path)
    parser.add_argument("--evaluate-check", type=Path)
    parser.add_argument("--reference", type=Path, default=ROOT / "reference_result.csv")
    parser.add_argument("--current-best", type=Path, default=ROOT / "student" / "results" / "current_best_by_case.csv")
    parser.add_argument("--abc", type=Path, default=ROOT / "student" / "abc")
    parser.add_argument("--yosys", type=Path, default=ROOT / "student" / "tools" / "conda-env" / "bin" / "yosys")
    parser.add_argument("--timeout", type=int, default=1800)
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
    if args.summary_results:
        refs = load_reference(args.reference)
        current = load_current_best(args.current_best)
        write_csv(args.summary_results, SUMMARY_FIELDNAMES, [add_summary_columns(row, refs, current) for row in best])
    if args.evaluate_check:
        write_csv(
            args.evaluate_check,
            EVALUATE_FIELDNAMES,
            [{name: row.get(name, "") for name in EVALUATE_FIELDNAMES} for row in rows],
        )
    write_text(args.work_dir / "manifest.json", json.dumps(rows, indent=2, sort_keys=True) + "\n")
    print("Results: {0}".format(args.results))
    print("Best: {0}".format(args.best_results))
    print("Rows: {0}".format(len(rows)))
    print("Best cases: {0}/{1}".format(len(best), len(args.cases)))
    return 0 if len(best) == len(args.cases) else 1


if __name__ == "__main__":
    raise SystemExit(main())
