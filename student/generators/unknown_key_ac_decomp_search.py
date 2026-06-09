#!/usr/bin/env python3
"""Generate prefix-key Ashenhurst/Curtis-style decomposition seeds."""

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
    key_lines_for_transform,
    transform_index,
)
from student.generators.unknown_bdd_search import (
    SharedBddBuilder,
    permute_plane,
    plane_for_outputs,
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


SUMMARY_FIELDNAMES = [
    "case",
    "candidate_id",
    "area",
    "delay",
    "adp",
    "reference_adp",
    "adp_ratio_to_reference",
    "current_best_adp",
    "delta_vs_current",
    "beats_current",
    "variant",
    "items",
    "notes",
]


EVALUATE_FIELDNAMES = [
    "case",
    "candidate_id",
    "verified_truth",
    "equivalent",
    "area",
    "delay",
    "adp",
    "verilog_path",
    "aig_path",
    "notes",
]


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


def parse_variants(value):
    variants = []
    for item in parse_list(value):
        if item.startswith("top"):
            try:
                count = int(item[3:])
            except ValueError:
                raise argparse.ArgumentTypeError("variant must be topN or bits_A_B: {0}".format(item))
            if count < 1 or count > 10:
                raise argparse.ArgumentTypeError("topN must be 1..10: {0}".format(item))
        elif item.startswith("bits_"):
            bits = [part for part in item[5:].split("_") if part != ""]
            if not bits:
                raise argparse.ArgumentTypeError("empty bits variant: {0}".format(item))
            try:
                [int(part) for part in bits]
            except ValueError:
                raise argparse.ArgumentTypeError("bits variant must use integers: {0}".format(item))
        else:
            raise argparse.ArgumentTypeError("variant must be topN or bits_A_B: {0}".format(item))
        variants.append(item)
    return variants


def vector_decl(width):
    if width < 1:
        raise RuntimeError("vector width must be positive")
    return "[{0}:0] ".format(width - 1)


def interleave_order(width):
    order = []
    for index in range((width + 1) // 2):
        other = width - 1 - index
        order.append(index)
        if other != index:
            order.append(other)
    return order


def transformed_outputs(outputs, width, transform):
    values = [0] * len(outputs)
    seen = [False] * len(outputs)
    for index, value in enumerate(outputs):
        key = transform_index(transform, index, width)
        if seen[key]:
            raise RuntimeError("non-bijective transform {0}".format(transform))
        seen[key] = True
        values[key] = value
    return values


def variant_bits(width, variant):
    full_order = interleave_order(width)
    if variant.startswith("top"):
        count = int(variant[3:])
        if count > width:
            raise RuntimeError("top count outside width {0}: {1}".format(width, variant))
        return full_order[:count]
    bits = [int(part) for part in variant[5:].split("_") if part != ""]
    if len(set(bits)) != len(bits):
        raise RuntimeError("duplicate bound bits in {0}".format(variant))
    if any(bit < 0 or bit >= width for bit in bits):
        raise RuntimeError("bound bit outside width {0}: {1}".format(width, variant))
    return bits


def compact_index(bits, value):
    out = 0
    for pos, bit in enumerate(bits):
        if (value >> bit) & 1:
            out |= 1 << pos
    return out


def compose_index(free_bits, free_value, bound_bits, bound_value):
    key = 0
    for pos, bit in enumerate(free_bits):
        if (free_value >> pos) & 1:
            key |= 1 << bit
    for pos, bit in enumerate(bound_bits):
        if (bound_value >> pos) & 1:
            key |= 1 << bit
    return key


def inherited_order(full_order, bits):
    return [bits.index(bit) for bit in full_order if bit in bits]


def build_multi_bdd(values, output_width, order):
    builder = SharedBddBuilder(order)
    roots = []
    for bit in range(output_width):
        roots.append(builder.build(permute_plane(plane_for_outputs(values, bit), order), 0))
    return builder, roots


def signatures_for_partition(outputs_by_key, width, output_width, bound_bits):
    free_bits = [bit for bit in range(width) if bit not in bound_bits]
    signatures = []
    group_nodes = []
    full_order = interleave_order(width)
    free_order = inherited_order(full_order, free_bits)
    for bound_value in range(1 << len(bound_bits)):
        values = []
        for free_value in range(1 << len(free_bits)):
            key = compose_index(free_bits, free_value, bound_bits, bound_value)
            values.append(outputs_by_key[key])
        signatures.append(tuple(values))
        builder, _roots = build_multi_bdd(values, output_width, free_order)
        group_nodes.append(len(builder.nodes))
    return free_bits, signatures, group_nodes


def assign_classes(signatures, encoding):
    if encoding == "first":
        ordered = []
        seen = set()
        for sig in signatures:
            if sig not in seen:
                ordered.append(sig)
                seen.add(sig)
    elif encoding == "signature":
        ordered = sorted(set(signatures))
    elif encoding == "freq":
        counts = {}
        first = {}
        for index, sig in enumerate(signatures):
            counts[sig] = counts.get(sig, 0) + 1
            first.setdefault(sig, index)
        ordered = sorted(counts, key=lambda sig: (-counts[sig], first[sig]))
    else:
        raise RuntimeError("unknown class encoding: {0}".format(encoding))
    mapping = {sig: index for index, sig in enumerate(ordered)}
    class_ids = [mapping[sig] for sig in signatures]
    return ordered, class_ids


def h_order_for(name, free_count, phi_width, free_order):
    phi_order = list(range(free_count, free_count + phi_width))
    if name == "free_first":
        return list(free_order) + phi_order
    if name == "phi_first":
        return phi_order + list(free_order)
    if name == "phi_after_top2":
        split = min(2, len(free_order))
        return list(free_order[:split]) + phi_order + list(free_order[split:])
    if name == "interleave":
        out = []
        free = list(free_order)
        phi = list(phi_order)
        while free or phi:
            if free:
                out.append(free.pop(0))
            if phi:
                out.append(phi.pop(0))
        return out
    raise RuntimeError("unknown h order: {0}".format(name))


def prefixed_edge_expr(edge, prefix):
    node_id, inv = edge
    if node_id == 0:
        return "1'b1" if inv else "1'b0"
    name = "{0}n_{1}".format(prefix, node_id)
    return "~{0}".format(name) if inv else name


def emit_bdd_nodes(lines, builder, signal_name, prefix):
    for node in builder.nodes:
        lines.append(
            "  wire {0}n_{1} = {2}[{3}] ? {4} : {5};".format(
                prefix,
                node["id"],
                signal_name,
                node["var"],
                prefixed_edge_expr(node["high"], prefix),
                prefixed_edge_expr(node["low"], prefix),
            )
        )


def render(outputs, module, input_width, output_width, transform, variant, encoding, h_order_name):
    full_order = interleave_order(input_width)
    bound_bits = variant_bits(input_width, variant)
    free_bits, signatures, group_nodes = signatures_for_partition(
        transformed_outputs(outputs, input_width, transform),
        input_width,
        output_width,
        bound_bits,
    )
    class_signatures, class_ids = assign_classes(signatures, encoding)
    class_count = len(class_signatures)
    phi_width = max(1, (class_count - 1).bit_length())
    bound_count = len(bound_bits)
    free_count = len(free_bits)
    bound_order = inherited_order(full_order, bound_bits)
    free_order = inherited_order(full_order, free_bits)
    h_order = h_order_for(h_order_name, free_count, phi_width, free_order)

    phi_values = class_ids
    phi_builder, phi_roots = build_multi_bdd(phi_values, phi_width, bound_order)

    h_width = free_count + phi_width
    h_values = [0] * (1 << h_width)
    for class_id, signature in enumerate(class_signatures):
        for free_value, out_value in enumerate(signature):
            h_values[free_value | (class_id << free_count)] = out_value
    h_builder, h_roots = build_multi_bdd(h_values, output_width, h_order)

    lines = [
        "module {0}(in, out);".format(module),
        "  input {0}in;".format(range_decl(input_width)),
        "  output {0}out;".format(range_decl(output_width)),
    ]
    lines.extend(key_lines_for_transform(transform, input_width))
    lines.append("  wire {0}bound_key;".format(vector_decl(bound_count)))
    for pos, bit in enumerate(bound_bits):
        lines.append("  assign bound_key[{0}] = key[{1}];".format(pos, bit))
    lines.append("  wire {0}free_key;".format(vector_decl(free_count)))
    for pos, bit in enumerate(free_bits):
        lines.append("  assign free_key[{0}] = key[{1}];".format(pos, bit))
    lines.append("  wire {0}phi;".format(vector_decl(phi_width)))
    emit_bdd_nodes(lines, phi_builder, "bound_key", "phi_")
    for bit, root in enumerate(phi_roots):
        lines.append("  assign phi[{0}] = {1};".format(bit, prefixed_edge_expr(root, "phi_")))
    lines.append("  wire {0}h_key;".format(vector_decl(h_width)))
    for pos in range(free_count):
        lines.append("  assign h_key[{0}] = free_key[{0}];".format(pos))
    for pos in range(phi_width):
        lines.append("  assign h_key[{0}] = phi[{1}];".format(free_count + pos, pos))
    emit_bdd_nodes(lines, h_builder, "h_key", "h_")
    for bit, root in enumerate(h_roots):
        lines.append("  assign out[{0}] = {1};".format(bit, prefixed_edge_expr(root, "h_")))
    lines.append("endmodule")
    lines.append("")

    def model(index):
        key = transform_index(transform, index, input_width)
        bound_value = compact_index(bound_bits, key)
        free_value = compact_index(free_bits, key)
        memo = {}
        phi_value = 0
        for bit, root in enumerate(phi_roots):
            if phi_builder.eval_edge(root, bound_value, memo):
                phi_value |= 1 << bit
        h_index = free_value | (phi_value << free_count)
        memo = {}
        out_value = 0
        for bit, root in enumerate(h_roots):
            if h_builder.eval_edge(root, h_index, memo):
                out_value |= 1 << bit
        return out_value

    total_stage_nodes = len(phi_builder.nodes) + len(h_builder.nodes)
    items = (
        "transform={0}; bound_bits={1}; free_bits={2}; class_encoding={3}; "
        "class_count={4}; phi_width={5}; group_bdd_nodes={6}; old_group_bdd_nodes={7}; "
        "phi_bdd_nodes={8}; h_order={9}; h_bdd_nodes={10}; total_stage_bdd_nodes={11}"
    ).format(
        transform,
        ":".join(str(bit) for bit in bound_bits),
        ":".join(str(bit) for bit in free_bits),
        encoding,
        class_count,
        phi_width,
        ":".join(str(count) for count in group_nodes),
        sum(group_nodes),
        len(phi_builder.nodes),
        h_order_name,
        len(h_builder.nodes),
        total_stage_nodes,
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
    return True, "exact prefix-key AC decomposition model over {0} inputs".format(len(outputs))


def load_reference(path):
    refs = {}
    if path is None or not path.is_file():
        return refs
    with path.open(newline="") as handle:
        for row in csv.DictReader(handle):
            case = row.get("case", "")
            adp = row.get("adp", "")
            if case and adp:
                refs[case] = int(float(adp))
    return refs


def load_current_best(path):
    best = {}
    if path is None or not path.is_file():
        return best
    with path.open(newline="") as handle:
        for row in csv.DictReader(handle):
            case = row.get("case", "")
            adp = row.get("best_adp", "")
            if case and adp:
                best[case] = int(float(adp))
    return best


def add_summary_columns(row, refs, current):
    out = {
        "case": row.get("case", ""),
        "candidate_id": row.get("candidate_id", ""),
        "area": row.get("area", ""),
        "delay": row.get("delay", ""),
        "adp": row.get("adp", ""),
        "reference_adp": "",
        "adp_ratio_to_reference": "",
        "current_best_adp": "",
        "delta_vs_current": "",
        "beats_current": "",
        "variant": row.get("variant", ""),
        "items": row.get("items", ""),
        "notes": row.get("notes", ""),
    }
    case = out["case"]
    if case in refs:
        out["reference_adp"] = str(refs[case])
    if case in current:
        out["current_best_adp"] = str(current[case])
    if out["adp"]:
        adp = int(float(out["adp"]))
        if case in refs and refs[case]:
            out["adp_ratio_to_reference"] = "{0:.6f}".format(adp / refs[case])
        if case in current:
            out["delta_vs_current"] = str(adp - current[case])
            out["beats_current"] = "1" if adp < current[case] else "0"
    return out


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
        "hypothesis": "unknown_prefix_key_ac_decomposition",
        "variants": [],
    }
    for transform in args.transforms:
        for variant in args.variants:
            for encoding in args.encodings:
                for h_order_name in args.h_orders:
                    variant_label = "{0}_{1}_{2}_{3}".format(transform, variant, encoding, h_order_name)
                    candidate_id = "{0}_unknown_key_ac_decomp_{1}".format(case, variant_label)
                    module = candidate_id
                    verilog_path = args.work_dir / case / "verilog" / "{0}.v".format(candidate_id)
                    aig_path = args.work_dir / case / "aigs" / "{0}.aig".format(candidate_id)
                    script_path = args.work_dir / case / "logs" / "{0}.ys".format(candidate_id)
                    log_path = args.work_dir / case / "logs" / "{0}.yosys.log".format(candidate_id)
                    start = time.time()
                    row = {
                        "case": case,
                        "candidate_id": candidate_id,
                        "hypothesis": "unknown_prefix_key_ac_decomposition",
                        "variant": variant_label,
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
                            variant,
                            encoding,
                            h_order_name,
                        )
                        row["items"] = "{0}; hash={1}".format(items, text_hash(verilog)[:12])
                        verified, note = verify_outputs(outputs, model)
                        row["verified_truth"] = "1" if verified else "0"
                        row["notes"] = note
                        write_text(verilog_path, verilog)
                        if verified and not args.no_synth:
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
                                parent_id="unknown_prefix_key_ac_decomposition",
                                source="ai_verilog",
                                tool_chain="yosys_unknown_key_ac_decomposition",
                                aig_path=aig_path,
                                truth=truth_path,
                                abc=args.abc,
                                notes="unknown prefix-key AC decomposition Verilog seed",
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
                            variant_label,
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
    parser = argparse.ArgumentParser(description="Generate prefix-key AC decomposition candidates.")
    parser.add_argument("--cases", type=parse_cases, required=True)
    parser.add_argument("--transforms", type=parse_list, default=parse_list("prefix_parity_reduce"))
    parser.add_argument("--variants", type=parse_variants, default=parse_variants("top4,top5,top6"))
    parser.add_argument("--encodings", type=parse_list, default=parse_list("first"))
    parser.add_argument("--h-orders", type=parse_list, default=parse_list("phi_first,free_first"))
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
    parser.add_argument("--timeout", type=int, default=900)
    parser.add_argument("--no-yosys-abc", action="store_true")
    parser.add_argument("--no-synth", action="store_true")
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
