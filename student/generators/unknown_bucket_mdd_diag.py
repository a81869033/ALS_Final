#!/usr/bin/env python3
"""Multi-valued MDD diagnostics for exact bucket-count selector keys."""

import argparse
import csv
import math
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from student.frontends.truth import TruthTable
from student.generators.unknown_bucket_count_classifier import (
    bucket_counts,
    bucket_info,
    feature_candidates,
    feature_name,
    feature_value,
    greedy_selectors,
    onehot_slots,
    parse_cases,
)


class MddBuilder:
    def __init__(self, domains, order, default_value, missing_policy):
        self.domains = domains
        self.order = order
        self.default_value = default_value
        self.missing_policy = missing_policy
        self.terminals = {}
        self.unique = {}
        self.nodes = []
        self.memo = {}

    def terminal(self, value):
        edge = ("t", value)
        self.terminals[value] = edge
        return edge

    def fill_missing(self, children):
        present = [child for child in children if child is not None]
        if not present:
            fill = self.terminal(self.default_value)
        elif self.missing_policy == "reuse_first":
            fill = present[0]
        elif self.missing_policy == "reuse_mode":
            counts = {}
            for child in present:
                counts[child] = counts.get(child, 0) + 1
            fill = sorted(counts.items(), key=lambda item: (-item[1], repr(item[0])))[0][0]
        elif self.missing_policy == "zero":
            fill = self.terminal(self.default_value)
        else:
            raise RuntimeError("unknown missing policy {0}".format(self.missing_policy))
        return [fill if child is None else child for child in children]

    def make_node(self, depth, children):
        filled = self.fill_missing(children)
        first = filled[0]
        if all(child == first for child in filled):
            return first
        key = (depth, tuple(filled))
        old = self.unique.get(key)
        if old is not None:
            return old
        node_id = ("n", len(self.nodes))
        self.unique[key] = node_id
        self.nodes.append(
            {
                "id": node_id,
                "depth": depth,
                "var": self.order[depth],
                "children": tuple(filled),
            }
        )
        return node_id

    def build_items(self, items, depth=0):
        key = (depth, items)
        old = self.memo.get(key)
        if old is not None:
            return old
        values = set(value for _key, value in items)
        if len(values) == 1:
            edge = self.terminal(next(iter(values)))
            self.memo[key] = edge
            return edge
        if depth >= len(self.order):
            raise RuntimeError("conflicting leaf after all variables")
        var = self.order[depth]
        groups = {}
        for item_key, out in items:
            groups.setdefault(item_key[var], []).append((item_key, out))
        children = []
        for val in range(self.domains[var]):
            child_items = groups.get(val)
            if child_items:
                children.append(self.build_items(tuple(child_items), depth + 1))
            else:
                children.append(None)
        edge = self.make_node(depth, children)
        self.memo[key] = edge
        return edge

    def build(self, table, depth=0):
        return self.build_items(tuple(sorted(table.items())), depth)

    def eval_edge(self, edge, key):
        kind, value = edge
        if kind == "t":
            return value
        node = self.nodes[value]
        return self.eval_edge(node["children"][key[node["var"]]], key)

    def max_width(self):
        widths = {}
        for node in self.nodes:
            depth = node["depth"]
            widths[depth] = widths.get(depth, 0) + 1
        return max(widths.values()) if widths else 0

    def width_profile(self):
        widths = {}
        for node in self.nodes:
            depth = node["depth"]
            widths[depth] = widths.get(depth, 0) + 1
        return ":".join(str(widths.get(depth, 0)) for depth in range(len(self.order)))


def entropy(counts):
    total = float(sum(counts))
    if total <= 0:
        return 0.0
    value = 0.0
    for count in counts:
        if count:
            p = count / total
            value -= p * math.log(p, 2)
    return value


def variable_entropy_scores(mapping, var_count):
    scores = []
    for var in range(var_count):
        groups = {}
        for key, output in mapping.items():
            hist = groups.setdefault(key[var], {})
            hist[output] = hist.get(output, 0) + 1
        weighted = 0.0
        total = len(mapping)
        for hist in groups.values():
            group_total = sum(hist.values())
            weighted += (group_total / float(total)) * entropy(list(hist.values()))
        scores.append((weighted, var))
    return scores


def center_order(indices):
    if not indices:
        return []
    mid = (len(indices) - 1) / 2.0
    return sorted(indices, key=lambda pos: (abs(pos - mid), pos))


def build_orders(field_names, domains, mapping, bucket_count):
    counts = list(range(bucket_count))
    selectors = list(range(bucket_count, len(field_names)))
    entropy_scores = variable_entropy_scores(mapping, len(field_names))
    entropy_asc = [var for _score, var in sorted(entropy_scores)]
    entropy_desc = list(reversed(entropy_asc))
    domain_asc = sorted(range(len(field_names)), key=lambda var: (domains[var], var))
    domain_desc = list(reversed(domain_asc))
    orders = {
        "counts_then_selectors": counts + selectors,
        "selectors_then_counts": selectors + counts,
        "count_center_then_selectors": center_order(counts) + selectors,
        "count_edges_then_selectors": list(reversed(center_order(counts))) + selectors,
        "domain_asc": domain_asc,
        "domain_desc": domain_desc,
        "entropy_asc": entropy_asc,
        "entropy_desc": entropy_desc,
    }
    if selectors:
        interleaved = []
        for idx in range(max(len(counts), len(selectors))):
            if idx < len(selectors):
                interleaved.append(selectors[idx])
            if idx < len(counts):
                interleaved.append(counts[idx])
        orders["selector_count_interleave"] = interleaved
    unique = {}
    for name, order in orders.items():
        if sorted(order) != list(range(len(field_names))):
            raise RuntimeError("bad order {0}: {1}".format(name, order))
        key = tuple(order)
        if key not in unique.values():
            unique[name] = order
    return unique


def build_case(case, benchmarks, max_selectors):
    table = TruthTable(benchmarks / "{0}.truth".format(case))
    outputs = list(table.iter_outputs())
    onehot = onehot_slots(outputs, table.input_width)
    buckets = bucket_info(onehot)
    features = feature_candidates(case, table.input_width)
    rows = []
    for value, output in enumerate(outputs):
        rows.append(
            (
                bucket_counts(value, buckets),
                tuple(feature_value(feature, value) for feature in features),
                output,
            )
        )
    selected, trace = greedy_selectors(rows, features, len(outputs), max_selectors)
    if trace[-1][2] != len(outputs):
        raise RuntimeError("{0} did not become exact".format(case))
    field_names = ["cnt{0}".format(index) for index in range(len(buckets))]
    field_names.extend("sel{0}_{1}".format(pos, feature_name(features[index])) for pos, index in enumerate(selected))
    domains = [len(members) + 1 for _slot, members, _bits in buckets]
    domains.extend(2 for _index in selected)
    mapping = {}
    for counts, feature_values, output in rows:
        key = tuple(list(counts) + [feature_values[index] for index in selected])
        previous = mapping.get(key)
        if previous is not None and previous != output:
            raise RuntimeError("{0}: key conflict".format(case))
        mapping[key] = output
    return table, buckets, features, selected, field_names, domains, mapping, trace


def verify_mapping(builder, root, mapping):
    for key, expected in mapping.items():
        if builder.eval_edge(root, key) != expected:
            return False
    return True


def run_case(case, benchmarks, max_selectors, policies, order_filter):
    table, buckets, features, selected, field_names, domains, mapping, trace = build_case(case, benchmarks, max_selectors)
    orders = build_orders(field_names, domains, mapping, len(buckets))
    if order_filter:
        wanted = set(order_filter)
        orders = {name: order for name, order in orders.items() if name in wanted}
        missing = wanted - set(orders)
        if missing:
            raise RuntimeError("{0}: unknown order filters {1}".format(case, ",".join(sorted(missing))))
    rows = []
    selected_names = ":".join(feature_name(features[index]) for index in selected)
    trace_text = ";".join("{0}:{1}:{2}:{3}".format(kind, name, match, keys) for kind, name, match, keys in trace)
    for policy in policies:
        for order_name, order in orders.items():
            word_builder = MddBuilder(domains, order, 0, policy)
            word_root = word_builder.build(mapping)
            rows.append(
                {
                    "case": case,
                    "model": "word",
                    "missing_policy": policy,
                    "order_name": order_name,
                    "order_fields": ":".join(field_names[index] for index in order),
                    "input_width": table.input_width,
                    "output_width": table.output_width,
                    "field_count": len(field_names),
                    "bucket_count": len(buckets),
                    "selected_features": selected_names,
                    "mapped_keys": len(mapping),
                    "domain_space": math.prod(domains) if hasattr(math, "prod") else product(domains),
                    "terminal_count": len(word_builder.terminals),
                    "nonterm_nodes": len(word_builder.nodes),
                    "total_nodes": len(word_builder.nodes) + len(word_builder.terminals),
                    "max_width": word_builder.max_width(),
                    "width_profile": word_builder.width_profile(),
                    "valid_exact": "1" if verify_mapping(word_builder, word_root, mapping) else "0",
                    "trace": trace_text,
                }
            )
            print(
                "{0} {1} {2} word nodes={3} width={4}".format(
                    case, policy, order_name, len(word_builder.nodes), word_builder.max_width()
                ),
                flush=True,
            )
            bit_builder = MddBuilder(domains, order, 0, policy)
            roots = []
            for bit in range(table.output_width):
                roots.append(bit_builder.build({key: (value >> bit) & 1 for key, value in mapping.items()}))
            bit_exact = all(
                sum((bit_builder.eval_edge(root, key) & 1) << bit for bit, root in enumerate(roots)) == value
                for key, value in mapping.items()
            )
            rows.append(
                {
                    "case": case,
                    "model": "bit_shared",
                    "missing_policy": policy,
                    "order_name": order_name,
                    "order_fields": ":".join(field_names[index] for index in order),
                    "input_width": table.input_width,
                    "output_width": table.output_width,
                    "field_count": len(field_names),
                    "bucket_count": len(buckets),
                    "selected_features": selected_names,
                    "mapped_keys": len(mapping),
                    "domain_space": math.prod(domains) if hasattr(math, "prod") else product(domains),
                    "terminal_count": len(bit_builder.terminals),
                    "nonterm_nodes": len(bit_builder.nodes),
                    "total_nodes": len(bit_builder.nodes) + len(bit_builder.terminals),
                    "max_width": bit_builder.max_width(),
                    "width_profile": bit_builder.width_profile(),
                    "valid_exact": "1" if bit_exact else "0",
                    "trace": trace_text,
                }
            )
            print(
                "{0} {1} {2} bit_shared nodes={3} width={4}".format(
                    case, policy, order_name, len(bit_builder.nodes), bit_builder.max_width()
                ),
                flush=True,
            )
    return rows


def product(values):
    out = 1
    for value in values:
        out *= value
    return out


def write_csv(path, fieldnames, rows):
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(rows)


def write_manifest(path, run_id, cases, work_dir, results_dir, policies):
    text = """# {0}

Run ID: `{0}`

Purpose: Diagnose whether exact bucket-count selector keys for ex286-ex289
collapse into a small multi-valued decision diagram. This is a high-upside
frontend gate: only a compact MDD would justify RTL generation.

Inputs:
- Cases: `{1}`
- Truth files: `benchmarks/<case>.truth`
- Script: `student/generators/unknown_bucket_mdd_diag.py`

Artifacts:
- Work directory: `{2}`
- Results directory: `{3}`
- Results: `results/summary.csv`

Methods tried:
- Word-valued reduced MDD and shared per-bit MDD.
- Missing invalid key policies: `{4}`.
- Variable orders based on selectors/counts, count center/edge, domain size, and output entropy.

Notes:
- Diagnostic only; no Verilog/AIG candidates emitted.
- `student/seeds` and `output/` are intentionally untouched.
""".format(
        run_id,
        ",".join(cases),
        work_dir,
        results_dir,
        ",".join(policies),
    )
    path.write_text(text)


def main(argv=None):
    parser = argparse.ArgumentParser()
    parser.add_argument("--cases", required=True)
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--run-id", required=True)
    parser.add_argument("--work-dir", type=Path, required=True)
    parser.add_argument("--results-dir", type=Path, required=True)
    parser.add_argument("--max-selectors", type=int, default=8)
    parser.add_argument("--policies", default="reuse_first,reuse_mode,zero")
    parser.add_argument("--orders", default="")
    args = parser.parse_args(argv)

    cases = parse_cases(args.cases)
    policies = parse_cases(args.policies)
    order_filter = parse_cases(args.orders)
    rows = []
    for case in cases:
        rows.extend(run_case(case, args.benchmarks, args.max_selectors, policies, order_filter))
    fields = [
        "case",
        "model",
        "missing_policy",
        "order_name",
        "order_fields",
        "input_width",
        "output_width",
        "field_count",
        "bucket_count",
        "selected_features",
        "mapped_keys",
        "domain_space",
        "terminal_count",
        "nonterm_nodes",
        "total_nodes",
        "max_width",
        "width_profile",
        "valid_exact",
        "trace",
    ]
    summary = args.results_dir / "summary.csv"
    write_csv(summary, fields, rows)
    empty_fields = ["case", "candidate_id", "equivalent", "area", "delay", "adp", "notes"]
    write_csv(args.results_dir / "candidates.csv", empty_fields, [])
    write_csv(args.results_dir / "best.csv", empty_fields, [])
    write_csv(args.results_dir / "evaluate_check.csv", empty_fields, [])
    write_manifest(args.results_dir.parent / "MANIFEST.md", args.run_id, cases, args.work_dir, args.results_dir, policies)
    for case in cases:
        best = min([row for row in rows if row["case"] == case], key=lambda row: int(row["nonterm_nodes"]))
        print(
            "{0} best {1}/{2}/{3} nodes={4} max_width={5} terminals={6} mapped={7}".format(
                case,
                best["model"],
                best["missing_policy"],
                best["order_name"],
                best["nonterm_nodes"],
                best["max_width"],
                best["terminal_count"],
                best["mapped_keys"],
            )
        )
    print("rows={0} output={1}".format(len(rows), summary))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
