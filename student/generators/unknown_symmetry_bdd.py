#!/usr/bin/env python3
"""Generate BDD seeds after exact input-pair symmetry canonicalization."""

import argparse
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
from student.generators.unknown_bdd_search import (
    SharedBddBuilder,
    edge_expr,
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


def parse_pairs(value):
    pairs = []
    seen = set()
    for item in value.split(","):
        item = item.strip()
        if not item:
            continue
        left, right = [int(part) for part in item.split(":", 1)]
        if left == right:
            raise argparse.ArgumentTypeError("pair uses the same bit twice: {0}".format(item))
        pair = tuple(sorted((left, right)))
        if pair not in seen:
            pairs.append(pair)
            seen.add(pair)
    if not pairs:
        raise argparse.ArgumentTypeError("empty pair list")
    return pairs


def parse_list(value):
    return [item.strip() for item in value.split(",") if item.strip()]


def interleave_order(width):
    order = []
    for index in range((width + 1) // 2):
        order.append(index)
        other = width - 1 - index
        if other != index:
            order.append(other)
    return order


def order_by_name(name, width, pairs):
    if name.startswith("bits_"):
        order = [int(item) for item in name.split("_")[1:] if item != ""]
        if sorted(order) != list(range(width)):
            raise argparse.ArgumentTypeError("custom order must contain each bit exactly once: {0}".format(name))
        return order
    if name == "natural":
        return list(range(width))
    if name == "reverse":
        return list(reversed(range(width)))
    if name == "interleave":
        return interleave_order(width)
    if name == "sym_first":
        pair_bits = []
        for left, right in pairs:
            pair_bits.extend([left, right])
        pair_set = set(pair_bits)
        return pair_bits + [bit for bit in range(width) if bit not in pair_set]
    raise argparse.ArgumentTypeError("unknown order: {0}".format(name))


def swap_bits(index, left, right):
    lb = (index >> left) & 1
    rb = (index >> right) & 1
    if lb == rb:
        return index
    return index ^ (1 << left) ^ (1 << right)


def verify_pair_symmetry(outputs, width, pairs):
    for left, right in pairs:
        if left < 0 or right < 0 or left >= width or right >= width:
            return False, "pair {0}:{1} outside width {2}".format(left, right, width)
        for index, expected in enumerate(outputs):
            if outputs[swap_bits(index, left, right)] != expected:
                return False, "swap_in_{0}_{1} fails at index {2}".format(left, right, index)
    return True, "exact swap symmetry for " + ",".join("{0}:{1}".format(a, b) for a, b in pairs)


def canonicalize_index(index, pairs):
    key = index
    for left, right in pairs:
        lb = (index >> left) & 1
        rb = (index >> right) & 1
        any_bit = lb | rb
        both_bit = lb & rb
        if any_bit:
            key |= 1 << left
        else:
            key &= ~(1 << left)
        if both_bit:
            key |= 1 << right
        else:
            key &= ~(1 << right)
    return key


def sanitize_invalid_key(key, pairs, policy):
    if policy == "zero" or policy == "one":
        return key
    out = key
    for left, right in pairs:
        low = (out >> left) & 1
        high = (out >> right) & 1
        if not low and high:
            if policy == "f00":
                out &= ~(1 << right)
            elif policy == "f10":
                out |= 1 << left
                out &= ~(1 << right)
            elif policy == "f11":
                out |= 1 << left
            elif policy == "passthrough":
                pass
            else:
                raise RuntimeError("unknown invalid-key policy: {0}".format(policy))
    return out


def key_outputs(outputs, width, output_width, pairs, policy):
    result = []
    mask = (1 << output_width) - 1
    for key in range(1 << width):
        invalid = any(((key >> left) & 1) == 0 and ((key >> right) & 1) == 1 for left, right in pairs)
        if invalid and policy == "zero":
            result.append(0)
        elif invalid and policy == "one":
            result.append(mask)
        else:
            result.append(outputs[sanitize_invalid_key(key, pairs, policy)])
    return result


def render(outputs, module, input_width, output_width, pairs, order_name, order, policy):
    projected = key_outputs(outputs, input_width, output_width, pairs, policy)
    builder = SharedBddBuilder(order)
    roots = []
    for bit in range(output_width):
        roots.append(builder.build(permute_plane(plane_for_outputs(projected, bit), order), 0))

    assigned = set()
    lines = [
        "module {0}(in, out);".format(module),
        "  input {0}in;".format(range_decl(input_width)),
        "  output {0}out;".format(range_decl(output_width)),
        "  wire {0}key;".format(range_decl(input_width)),
    ]
    for left, right in pairs:
        lines.append("  assign key[{0}] = in[{0}] | in[{1}];".format(left, right))
        lines.append("  assign key[{0}] = in[{1}] & in[{0}];".format(right, left))
        assigned.add(left)
        assigned.add(right)
    for bit in range(input_width):
        if bit not in assigned:
            lines.append("  assign key[{0}] = in[{0}];".format(bit))
    for node in builder.nodes:
        lines.append(
            "  wire n_{0} = key[{1}] ? {2} : {3};".format(
                node["id"],
                node["var"],
                edge_expr(node["high"]),
                edge_expr(node["low"]),
            )
        )
    for bit, root in enumerate(roots):
        lines.append("  assign out[{0}] = {1};".format(bit, edge_expr(root)))
    lines.append("endmodule")
    lines.append("")

    def model(index):
        key = canonicalize_index(index, pairs)
        value = 0
        memo = {}
        for bit, root in enumerate(roots):
            if builder.eval_edge(root, key, memo):
                value |= 1 << bit
        return value

    items = "pairs={0}; order={1}; invalid_policy={2}; bdd_nodes={3}".format(
        ",".join("{0}:{1}".format(a, b) for a, b in pairs),
        order_name,
        policy,
        len(builder.nodes),
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
    return True, "exact symmetry-canonical BDD model over {0} inputs".format(len(outputs))


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
    ok, note = verify_pair_symmetry(outputs, table.input_width, args.pairs)
    if not ok and args.require_symmetry:
        raise RuntimeError("{0}: {1}".format(case, note))

    rows = []
    for order_name in args.orders:
        order = order_by_name(order_name, table.input_width, args.pairs)
        for policy in args.invalid_policies:
            candidate_id = "{0}_unknown_symbdd_{1}_{2}".format(case, order_name, policy)
            module = candidate_id
            verilog_path = args.work_dir / case / "verilog" / "{0}.v".format(candidate_id)
            aig_path = args.work_dir / case / "aigs" / "{0}.aig".format(candidate_id)
            script_path = args.work_dir / case / "logs" / "{0}.ys".format(candidate_id)
            log_path = args.work_dir / case / "logs" / "{0}.yosys.log".format(candidate_id)
            start = time.time()
            row = {
                "case": case,
                "candidate_id": candidate_id,
                "hypothesis": "unknown_symmetry_canonical_bdd",
                "variant": "{0}_{1}".format(order_name, policy),
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
                verilog, items, model = render(
                    outputs,
                    module,
                    table.input_width,
                    table.output_width,
                    args.pairs,
                    order_name,
                    order,
                    policy,
                )
                row["items"] = "{0}; hash={1}".format(items, text_hash(verilog)[:12])
                verified, verify_note = verify_outputs(outputs, model)
                row["verified_truth"] = "1" if verified else "0"
                row["notes"] = "{0}; {1}".format(note, verify_note)
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
                        parent_id="unknown_symmetry_canonical_bdd",
                        source="ai_verilog",
                        tool_chain="yosys_unknown_symmetry_bdd",
                        aig_path=aig_path,
                        truth=truth_path,
                        abc=args.abc,
                        notes="unknown symmetry-canonical shared-BDD seed",
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
                "{0} {1} {2} eq={3} area={4} delay={5} adp={6}".format(
                    case,
                    order_name,
                    policy,
                    row["equivalent"],
                    row["area"],
                    row["delay"],
                    row["adp"],
                ),
                flush=True,
            )
    return rows


def parse_args(argv=None):
    parser = argparse.ArgumentParser(description="Generate symmetry-canonical BDD candidates.")
    parser.add_argument("--cases", type=parse_cases, default=parse_cases("ex285-ex289"))
    parser.add_argument("--pairs", type=parse_pairs, default=parse_pairs("4:5"))
    parser.add_argument("--orders", type=parse_list, default=parse_list("interleave,sym_first,natural"))
    parser.add_argument("--invalid-policies", type=parse_list, default=parse_list("f10,f00,zero"))
    parser.add_argument("--work-dir", type=Path, required=True)
    parser.add_argument("--results", type=Path, required=True)
    parser.add_argument("--best-results", type=Path, required=True)
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--abc", type=Path, default=ROOT / "student" / "abc")
    parser.add_argument("--yosys", type=Path, default=ROOT / "student" / "tools" / "conda-env" / "bin" / "yosys")
    parser.add_argument("--timeout", type=int, default=900)
    parser.add_argument("--no-yosys-abc", action="store_true")
    parser.add_argument("--require-symmetry", action="store_true")
    return parser.parse_args(argv)


def main(argv=None):
    args = parse_args(argv)
    rows = []
    manifest = {
        "hypothesis": "unknown_symmetry_canonical_bdd",
        "pairs": ["{0}:{1}".format(a, b) for a, b in args.pairs],
        "orders": args.orders,
        "invalid_policies": args.invalid_policies,
        "cases": args.cases,
        "rows": [],
    }
    for case in args.cases:
        rows.extend(run_case(args, case))
    manifest["rows"] = rows
    write_csv(args.results, ALL_FIELDNAMES, rows)
    write_csv(args.best_results, BEST_FIELDNAMES, best_rows(rows))
    write_text(args.work_dir / "manifest.json", json.dumps(manifest, indent=2, sort_keys=True) + "\n")
    print("Results: {0}".format(args.results))
    print("Best: {0}".format(args.best_results))
    print("Rows: {0}".format(len(rows)))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
