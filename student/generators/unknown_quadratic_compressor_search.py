#!/usr/bin/env python3
"""Quadratic shared-compressor seeds for ex280-ex284.

The active mux-coordinate model proves these cases are exact degree-2 Boolean
maps over a small derived coordinate vector.  This generator keeps that
coordinate system, but replaces the one-output-at-a-time grouped ANF emitter
with shared products of linear forms: (xor of mc bits) & (xor of mc bits).
"""

import argparse
import csv
import json
import math
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
    key_lines_for_transform,
    transformed_outputs,
)
from student.generators.unknown_key_ac_decomp_search import (
    EVALUATE_FIELDNAMES,
    SUMMARY_FIELDNAMES,
    add_summary_columns,
    load_current_best,
    load_reference,
)
from student.generators.unknown_muxcoord_anf_search import (
    bitset_items,
    coord_signal_lines,
    feature_masks,
    mux_coords_value,
    row_for_coords,
    solve_partial,
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


def parse_list(text):
    return [item.strip() for item in text.split(",") if item.strip()]


def xor_expr(items):
    items = [item for item in items if item != "1'b0"]
    if not items:
        return "1'b0"
    if len(items) == 1:
        return items[0]
    return "(" + " ^ ".join(items) + ")"


def bits_of(mask):
    return list(bitset_items(mask))


def pair_index_map(width):
    pair_to_index = {}
    index_to_pair = []
    for high in range(width):
        for low in range(high):
            pair_to_index[(low, high)] = len(index_to_pair)
            index_to_pair.append((low, high))
    return pair_to_index, index_to_pair


def pair_mask_from_terms(solution, masks, pair_to_index):
    result = 0
    linear = 0
    const = 0
    for index in bitset_items(solution):
        term_bits = bits_of(masks[index])
        if len(term_bits) == 0:
            const ^= 1
        elif len(term_bits) == 1:
            linear ^= 1 << term_bits[0]
        elif len(term_bits) == 2:
            low, high = term_bits
            if high < low:
                low, high = high, low
            result ^= 1 << pair_to_index[(low, high)]
        else:
            raise RuntimeError("unexpected term degree > 2")
    if const or linear:
        raise RuntimeError("quadratic compressor expects no const/linear terms")
    return result


def product_pair_mask(left_mask, right_mask, pair_to_index):
    if left_mask & right_mask:
        return None
    result = 0
    for left in bitset_items(left_mask):
        for right in bitset_items(right_mask):
            low, high = (left, right) if left < right else (right, left)
            result ^= 1 << pair_to_index[(low, high)]
    return result


def pair_mask_to_rows(pair_mask, coord_width, index_to_pair):
    rows = [0] * coord_width
    for pair_index, (low, high) in enumerate(index_to_pair):
        if (pair_mask >> pair_index) & 1:
            rows[low] |= 1 << high
            rows[high] |= 1 << low
    return rows


def product_offdiag_rows(left_mask, right_mask, coord_width):
    rows = [0] * coord_width
    for left in bitset_items(left_mask):
        for right in bitset_items(right_mask):
            if left == right:
                continue
            rows[left] ^= 1 << right
            rows[right] ^= 1 << left
    return rows


def rank_decompose_pair_mask(pair_mask, coord_width, index_to_pair):
    rows = pair_mask_to_rows(pair_mask, coord_width, index_to_pair)
    products = []
    linear_correction = 0
    while any(rows):
        pivot = next(index for index, row in enumerate(rows) if row)
        mate = next(bitset_items(rows[pivot]))
        left_mask = rows[mate]
        right_mask = rows[pivot]
        if left_mask > right_mask:
            left_mask, right_mask = right_mask, left_mask
        products.append(
            {
                "left": {"mask": left_mask, "name": "rank_l"},
                "right": {"mask": right_mask, "name": "rank_r"},
                "mask": pair_mask,
                "kind": "rank_product",
                "size": popcount(left_mask) * popcount(right_mask),
                "form_cost": max(0, popcount(left_mask) - 1) + max(0, popcount(right_mask) - 1),
            }
        )
        linear_correction ^= left_mask & right_mask
        delta = product_offdiag_rows(left_mask, right_mask, coord_width)
        rows = [row ^ delta[index] for index, row in enumerate(rows)]
        rows[pivot] = 0
        rows[mate] = 0
        for index in range(coord_width):
            rows[index] &= ~(1 << pivot)
            rows[index] &= ~(1 << mate)
    return products, linear_correction


def mask_from_range(low, high):
    mask = 0
    for bit in range(low, high + 1):
        mask |= 1 << bit
    return mask


def neighbor_mask(pair_mask, vertex, index_to_pair):
    result = 0
    for pair_index, (low, high) in enumerate(index_to_pair):
        if ((pair_mask >> pair_index) & 1) == 0:
            continue
        if low == vertex:
            result |= 1 << high
        elif high == vertex:
            result |= 1 << low
    return result


def add_form(forms, seen, mask, name):
    if mask == 0 or mask in seen:
        return
    seen.add(mask)
    forms.append({"mask": mask, "name": name})


def form_library(coord_width, targets, index_to_pair, style):
    forms = []
    seen = set()
    for bit in range(coord_width):
        add_form(forms, seen, 1 << bit, "u{0}".format(bit))
    for high in range(coord_width):
        add_form(forms, seen, mask_from_range(0, high), "px{0}".format(high))
    for low in range(coord_width):
        for high in range(low + 1, coord_width):
            add_form(forms, seen, mask_from_range(low, high), "rg{0}_{1}".format(low, high))
    for left in range(coord_width):
        for right in range(left + 1, coord_width):
            add_form(forms, seen, (1 << left) | (1 << right), "duo{0}_{1}".format(left, right))

    boundary = set(range(max(0, coord_width - 8), coord_width))
    boundary.update([0, 1, 2, 3])
    boundary = sorted(bit for bit in boundary if bit < coord_width)
    if style in ("boundary", "wide"):
        for a_index, a in enumerate(boundary):
            for b in boundary[a_index + 1 :]:
                for c in boundary:
                    if c <= b:
                        continue
                    add_form(forms, seen, (1 << a) | (1 << b) | (1 << c), "tri{0}_{1}_{2}".format(a, b, c))

    for out_bit, target in enumerate(targets):
        neighbors = []
        for vertex in range(coord_width):
            mask = neighbor_mask(target, vertex, index_to_pair)
            add_form(forms, seen, mask, "n{0}_{1}".format(out_bit, vertex))
            if mask:
                neighbors.append(mask)
        if style == "wide":
            for i, first in enumerate(neighbors):
                for second in neighbors[i + 1 :]:
                    merged = first ^ second
                    if popcount(merged) <= max(2, coord_width // 2):
                        add_form(forms, seen, merged, "nx{0}_{1}".format(out_bit, len(forms)))
    return forms


def candidate_library(coord_width, targets, pair_to_index, index_to_pair, style, max_candidates):
    forms = form_library(coord_width, targets, index_to_pair, style)
    candidates = {}

    def add_candidate(left, right, pair_mask, kind):
        if not pair_mask:
            return
        key = pair_mask
        left_mask = left["mask"]
        right_mask = right["mask"]
        if left_mask > right_mask:
            left_mask, right_mask = right_mask, left_mask
            left, right = right, left
        old = candidates.get((left_mask, right_mask))
        size = popcount(pair_mask)
        form_cost = max(0, popcount(left_mask) - 1) + max(0, popcount(right_mask) - 1)
        item = {
            "left": left,
            "right": right,
            "mask": key,
            "size": size,
            "kind": kind,
            "form_cost": form_cost,
        }
        if old is None or (form_cost, size) < (old["form_cost"], old["size"]):
            candidates[(left_mask, right_mask)] = item

    unit_forms = [{"mask": 1 << bit, "name": "u{0}".format(bit)} for bit in range(coord_width)]
    for high in range(coord_width):
        for low in range(high):
            left = unit_forms[low]
            right = unit_forms[high]
            pair_mask = product_pair_mask(left["mask"], right["mask"], pair_to_index)
            add_candidate(left, right, pair_mask, "pair")

    for i, left in enumerate(forms):
        for right in forms[i:]:
            if left["mask"] & right["mask"]:
                continue
            pair_mask = product_pair_mask(left["mask"], right["mask"], pair_to_index)
            if pair_mask is None:
                continue
            size = popcount(pair_mask)
            if size <= 1:
                continue
            best_improvement = max(2 * popcount(pair_mask & target) - size for target in targets)
            if best_improvement <= 1:
                continue
            add_candidate(left, right, pair_mask, "linear_product")

    items = list(candidates.values())

    def candidate_rank(item):
        best = max(2 * popcount(item["mask"] & target) - item["size"] for target in targets)
        cost = 1.0 + math.log(max(1, item["size"]), 2.0) + 0.2 * item["form_cost"]
        return (best / cost, best, item["size"], -item["form_cost"])

    items.sort(key=candidate_rank, reverse=True)
    if max_candidates and len(items) > max_candidates:
        pair_items = [item for item in items if item["kind"] == "pair"]
        non_pair = [item for item in items if item["kind"] != "pair"][:max_candidates]
        items = non_pair + pair_items
    return items


def decompose_target(target, candidates):
    residual = target
    selected = []
    used = set()
    while residual:
        best = None
        best_key = None
        current_size = popcount(residual)
        for index, candidate in enumerate(candidates):
            if index in used and candidate["kind"] != "pair":
                continue
            new_size = popcount(residual ^ candidate["mask"])
            improvement = current_size - new_size
            if candidate["kind"] == "pair":
                if improvement <= 0:
                    continue
            elif improvement <= 1:
                continue
            cost = 1.0 + math.log(max(1, candidate["size"]), 2.0) + 0.25 * candidate["form_cost"]
            key = (improvement / cost, improvement, candidate["size"], -candidate["form_cost"])
            if best is None or key > best_key:
                best = (index, candidate, new_size)
                best_key = key
        if best is None:
            raise RuntimeError("failed to decompose residual with {0} edges".format(current_size))
        index, candidate, _new_size = best
        residual ^= candidate["mask"]
        selected.append(candidate)
        if candidate["kind"] != "pair":
            used.add(index)
    return selected


def form_expr(mask, coord_width, lines, cache, form_style="prefix"):
    bits = bits_of(mask)
    if not bits:
        return "1'b0"
    if len(bits) == 1:
        return "mc[{0}]".format(bits[0])
    if mask in cache:
        return cache[mask]
    name = "lf_{0}".format(len(cache))
    contiguous = bits == list(range(bits[0], bits[-1] + 1))
    if form_style == "direct":
        expr = xor_expr(["mc[{0}]".format(bit) for bit in bits])
    elif contiguous and bits[0] == 0:
        expr = "px_{0}".format(bits[-1])
    elif contiguous:
        expr = "px_{0} ^ px_{1}".format(bits[-1], bits[0] - 1)
    else:
        expr = xor_expr(["mc[{0}]".format(bit) for bit in bits])
    lines.append("  wire {0} = {1};".format(name, expr))
    cache[mask] = name
    return name


def render_compressor(
    outputs,
    module,
    input_width,
    output_width,
    transform,
    coord_mode,
    style,
    max_candidates,
):
    values = transformed_outputs(outputs, input_width, transform)
    coord_width = input_width + 3 if coord_mode == "orig" else input_width + 5
    masks = feature_masks(coord_width, 2)
    rows = []
    rhs_words = []
    for key, value in enumerate(values):
        coord_value = mux_coords_value(key, input_width, coord_mode)
        rows.append(row_for_coords(coord_value, masks))
        rhs_words.append(value)
    ok_bits, solutions, inconsistent = solve_partial(rows, rhs_words, len(masks), output_width)
    if len(ok_bits) != output_width or inconsistent:
        raise RuntimeError("degree-2 coordinate solve failed")

    pair_to_index, index_to_pair = pair_index_map(coord_width)
    targets = [pair_mask_from_terms(solutions[bit], masks, pair_to_index) for bit in range(output_width)]
    linear_corrections = [0] * output_width
    library_style = "basic" if style == "direct" else style
    form_style = "direct" if style == "direct" else "prefix"
    if style == "rank":
        candidates = []
        selected_by_output = []
        for bit, target in enumerate(targets):
            selected, linear = rank_decompose_pair_mask(target, coord_width, index_to_pair)
            selected_by_output.append(selected)
            linear_corrections[bit] = linear
    else:
        candidates = candidate_library(coord_width, targets, pair_to_index, index_to_pair, library_style, max_candidates)
        selected_by_output = [decompose_target(target, candidates) for target in targets]
    unique_products = {}
    for selected in selected_by_output:
        for candidate in selected:
            key = (candidate["left"]["mask"], candidate["right"]["mask"])
            if key not in unique_products:
                unique_products[key] = candidate

    lines = [
        "module {0}(in, out);".format(module),
        "  input {0}in;".format(range_decl(input_width)),
        "  output {0}out;".format(range_decl(output_width)),
    ]
    lines.extend(key_lines_for_transform(transform, input_width))
    lines.extend(coord_signal_lines(input_width, coord_mode))
    for bit in range(coord_width):
        expr = "mc[0]" if bit == 0 else "px_{0} ^ mc[{1}]".format(bit - 1, bit)
        lines.append("  wire px_{0} = {1};".format(bit, expr))

    form_cache = {}
    product_names = {}
    product_items = sorted(unique_products.items(), key=lambda item: (popcount(item[0][0]) + popcount(item[0][1]), item[0]))
    for index, (key, candidate) in enumerate(product_items):
        left_mask, right_mask = key
        left_expr = form_expr(left_mask, coord_width, lines, form_cache, form_style=form_style)
        right_expr = form_expr(right_mask, coord_width, lines, form_cache, form_style=form_style)
        name = "cp_{0}".format(index)
        lines.append("  wire {0} = {1} & {2};".format(name, left_expr, right_expr))
        product_names[key] = name

    for bit, selected in enumerate(selected_by_output):
        terms = [product_names[(item["left"]["mask"], item["right"]["mask"])] for item in selected]
        terms.extend("mc[{0}]".format(index) for index in bitset_items(linear_corrections[bit]))
        lines.append("  assign out[{0}] = {1};".format(bit, xor_expr(terms)))
    lines.append("endmodule")
    lines.append("")

    product_count = len(unique_products)
    compound_count = sum(1 for item in unique_products.values() if item["kind"] != "pair")
    raw_pair_terms = sum(popcount(target) for target in targets)
    selected_terms = sum(len(items) for items in selected_by_output)
    items = (
        "transform={0}; coord_mode={1}; style={2}; coord_width={3}; "
        "candidate_basis={4}; raw_pair_terms={5}; selected_terms={6}; "
        "unique_products={7}; compound_products={8}; linear_forms={9}; correction_bits={10}; terms_by_bit={11}"
    ).format(
        transform,
        coord_mode,
        style,
        coord_width,
        len(candidates),
        raw_pair_terms,
        selected_terms,
        product_count,
        compound_count,
        len(form_cache),
        sum(popcount(item) for item in linear_corrections),
        ":".join(str(len(items)) for items in selected_by_output),
    )

    def eval_product(coord, left_mask, right_mask):
        left = popcount(coord & left_mask) & 1
        right = popcount(coord & right_mask) & 1
        return left & right

    def model(index):
        from student.generators.unknown_algebraic_search import transform_index

        key = transform_index(transform, index, input_width) if transform != "identity" else index
        coord = mux_coords_value(key, input_width, coord_mode)
        word = 0
        for bit, selected in enumerate(selected_by_output):
            value = 0
            for candidate in selected:
                value ^= eval_product(coord, candidate["left"]["mask"], candidate["right"]["mask"])
            value ^= popcount(coord & linear_corrections[bit]) & 1
            if value:
                word |= 1 << bit
        return word

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
    return True, "exact quadratic compressor model over {0} inputs".format(len(outputs))


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
    rows = []
    manifest = {
        "case": case,
        "truth": str(truth_path),
        "input_width": table.input_width,
        "output_width": table.output_width,
        "hypothesis": "unknown_quadratic_compressor",
        "variants": [],
    }
    for transform in args.transforms:
        for coord_mode in args.coord_modes:
            for style in args.styles:
                variant = "{0}_{1}_{2}".format(transform, coord_mode, style)
                candidate_id = "{0}_unknown_quadratic_compressor_{1}".format(case, variant)
                module = candidate_id
                verilog_path = args.work_dir / case / "verilog" / "{0}.v".format(candidate_id)
                aig_path = args.work_dir / case / "aigs" / "{0}.aig".format(candidate_id)
                script_path = args.work_dir / case / "logs" / "{0}.ys".format(candidate_id)
                log_path = args.work_dir / case / "logs" / "{0}.yosys.log".format(candidate_id)
                start = time.time()
                row = {
                    "case": case,
                    "candidate_id": candidate_id,
                    "hypothesis": "unknown_quadratic_compressor",
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
                    verilog, items, model = render_compressor(
                        outputs,
                        module,
                        table.input_width,
                        table.output_width,
                        transform,
                        coord_mode,
                        style,
                        args.max_candidates,
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
                            parent_id="unknown_quadratic_compressor",
                            source="ai_verilog",
                            tool_chain="yosys_unknown_quadratic_compressor",
                            aig_path=aig_path,
                            truth=truth_path,
                            abc=args.abc,
                            notes="unknown quadratic shared-compressor Verilog seed",
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
                        variant,
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
    parser = argparse.ArgumentParser(description="Generate quadratic shared-compressor candidates.")
    parser.add_argument("--cases", type=parse_cases, required=True)
    parser.add_argument("--transforms", type=parse_list, default=parse_list("prefix_parity_reduce"))
    parser.add_argument("--coord-modes", type=parse_list, default=parse_list("full_clamp"))
    parser.add_argument("--styles", type=parse_list, default=parse_list("basic"))
    parser.add_argument("--max-candidates", type=int, default=25000)
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
