#!/usr/bin/env python3
"""Generate bucket-count classifier RTL for conservative unknown cases."""

import argparse
import csv
import json
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from student.frontends.truth import TruthTable


def parse_cases(text):
    return [item.strip() for item in text.split(",") if item.strip()]


def popcount(value):
    return bin(value).count("1")


def bits_of(value, width):
    return [bit for bit in range(width) if (value >> bit) & 1]


def count_width(size):
    value = 1
    width = 0
    while value < size + 1:
        value <<= 1
        width += 1
    return max(1, width)


def exact_pairs(case):
    return {
        "ex286": [(4, 5), (6, 7)],
        "ex287": [(4, 5), (6, 7), (8, 9)],
        "ex288": [(4, 5), (6, 7), (8, 9)],
        "ex289": [(4, 5), (6, 7), (8, 9), (10, 11)],
    }.get(case, [])


def feature_candidates(case, width):
    features = [("raw", bit) for bit in range(width)]
    for left, right in exact_pairs(case):
        features.extend(
            [
                ("or", left, right),
                ("and", left, right),
                ("xor", left, right),
            ]
        )
    return features


def feature_value(feature, value):
    if feature[0] == "raw":
        return (value >> feature[1]) & 1
    left = (value >> feature[1]) & 1
    right = (value >> feature[2]) & 1
    if feature[0] == "or":
        return left | right
    if feature[0] == "and":
        return left & right
    if feature[0] == "xor":
        return left ^ right
    raise RuntimeError("unknown feature {0}".format(feature))


def feature_verilog(feature):
    if feature[0] == "raw":
        return "in[{0}]".format(feature[1])
    op = {"or": "|", "and": "&", "xor": "^"}[feature[0]]
    return "(in[{0}] {1} in[{2}])".format(feature[1], op, feature[2])


def onehot_slots(outputs, width):
    slots = []
    for token in range(width):
        output = outputs[1 << token]
        if popcount(output) != 1:
            raise RuntimeError("one-hot row for token {0} is not one-hot".format(token))
        slots.append(bits_of(output, width)[0])
    return slots


def bucket_info(onehot):
    slots = sorted(set(onehot))
    buckets = []
    for slot in slots:
        members = [bit for bit, onehot_slot in enumerate(onehot) if onehot_slot == slot]
        buckets.append((slot, members, count_width(len(members))))
    return buckets


def bucket_counts(value, buckets):
    out = []
    for _slot, members, _width in buckets:
        count = 0
        for bit in members:
            if (value >> bit) & 1:
                count += 1
        out.append(count)
    return tuple(out)


def majority_match(rows, selected):
    hist = {}
    for base_key, feature_values, output in rows:
        key = base_key + tuple(feature_values[index] for index in selected)
        bucket = hist.setdefault(key, {})
        bucket[output] = bucket.get(output, 0) + 1
    return sum(max(bucket.values()) for bucket in hist.values()), len(hist)


def greedy_selectors(rows, features, row_count, max_selectors):
    selected = []
    trace = []
    match, keys = majority_match(rows, selected)
    trace.append(("base", "", match, keys))
    while match < row_count and len(selected) < max_selectors:
        best = None
        for index, feature in enumerate(features):
            if index in selected:
                continue
            candidate_match, candidate_keys = majority_match(rows, selected + [index])
            candidate = (candidate_match, -candidate_keys, index, candidate_keys, feature)
            if best is None or candidate > best:
                best = candidate
        selected.append(best[2])
        match = best[0]
        keys = best[3]
        trace.append(("add", feature_name(best[4]), match, keys))
    return selected, trace


def feature_name(feature):
    if feature[0] == "raw":
        return "raw{0}".format(feature[1])
    return "{0}{1}_{2}".format(feature[0], feature[1], feature[2])


def encode_key(counts, selectors, buckets):
    fields = []
    for count, (_slot, _members, width) in zip(counts, buckets):
        fields.append((count, width))
    for selector in selectors:
        fields.append((selector, 1))
    key = 0
    for value, width in fields:
        key = (key << width) | value
    return key


def build_mapping(outputs, buckets, features, selected):
    mapping = {}
    for value, output in enumerate(outputs):
        counts = bucket_counts(value, buckets)
        selectors = [feature_value(features[index], value) for index in selected]
        key = encode_key(counts, selectors, buckets)
        previous = mapping.get(key)
        if previous is not None and previous != output:
            raise RuntimeError("key conflict for {0}".format(key))
        mapping[key] = output
    return mapping


def emit_common_prefix(module, width, buckets, features, selected):
    key_width = sum(bucket[2] for bucket in buckets) + len(selected)
    lines = []
    lines.append("module {0}(in, out);".format(module))
    lines.append("  input [{0}:0] in;".format(width - 1))
    return lines, key_width


def emit_key_logic(lines, width, buckets, features, selected, key_width):
    for index, (slot, members, counter_width) in enumerate(buckets):
        terms = ["{0}'d0".format(counter_width)]
        terms.extend("in[{0}]".format(bit) for bit in members)
        lines.append("  wire [{0}:0] cnt_{1} = {2};".format(counter_width - 1, index, " + ".join(terms)))
        lines.append("  // bucket {0}: one-hot output slot {1}, input members {2}".format(index, slot, ",".join(str(bit) for bit in members)))
    for index, feature_index in enumerate(selected):
        lines.append("  wire sel_{0} = {1};".format(index, feature_verilog(features[feature_index])))
    key_terms = ["cnt_{0}".format(index) for index in range(len(buckets))]
    key_terms.extend("sel_{0}".format(index) for index in range(len(selected)))
    lines.append("  wire [{0}:0] key = {{{1}}};".format(key_width - 1, ", ".join(key_terms)))


def emit_verilog(case, module, width, buckets, features, selected, mapping, path, style):
    lines, key_width = emit_common_prefix(module, width, buckets, features, selected)
    if style in ("case_zero", "case_defaultx"):
        lines.append("  output reg [{0}:0] out;".format(width - 1))
        emit_key_logic(lines, width, buckets, features, selected, key_width)
        default_value = "{0}'h0".format(width)
        if style == "case_defaultx":
            default_value = "{0}'b{1}".format(width, "x" * width)
        lines.append("  always @* begin")
        lines.append("    case (key)")
        for key in sorted(mapping):
            lines.append("      {0}'h{1:x}: out = {2}'h{3:x};".format(key_width, key, width, mapping[key]))
        lines.append("      default: out = {0};".format(default_value))
        lines.append("    endcase")
        lines.append("  end")
    elif style == "perbit_defaultx":
        lines.append("  output [{0}:0] out;".format(width - 1))
        emit_key_logic(lines, width, buckets, features, selected, key_width)
        for bit in range(width):
            lines.append("  reg out_{0};".format(bit))
        lines.append("  assign out = {{{0}}};".format(", ".join("out_{0}".format(bit) for bit in reversed(range(width)))))
        for bit in range(width):
            lines.append("  always @* begin")
            lines.append("    case (key)")
            for key in sorted(mapping):
                lines.append("      {0}'h{1:x}: out_{2} = 1'b{3};".format(key_width, key, bit, (mapping[key] >> bit) & 1))
            lines.append("      default: out_{0} = 1'bx;".format(bit))
            lines.append("    endcase")
            lines.append("  end")
    else:
        raise RuntimeError("unknown style {0}".format(style))
    lines.append("endmodule")
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text("\n".join(lines) + "\n")


def run_case(case, benchmarks, work_dir, max_selectors, styles):
    table = TruthTable(benchmarks / "{0}.truth".format(case))
    if table.input_width != table.output_width:
        raise RuntimeError("{0} width mismatch".format(case))
    outputs = list(table.iter_outputs())
    width = table.input_width
    onehot = onehot_slots(outputs, width)
    buckets = bucket_info(onehot)
    features = feature_candidates(case, width)
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
        raise RuntimeError("{0} did not become exact with {1} selectors".format(case, max_selectors))
    mapping = build_mapping(outputs, buckets, features, selected)
    rows = []
    for style in styles:
        module = "{0}_unknown_bucket_count_classifier_{1}".format(case, style)
        verilog = work_dir / case / "verilog" / "{0}.v".format(module)
        emit_verilog(case, module, width, buckets, features, selected, mapping, verilog, style)
        rows.append(
            {
                "case": case,
                "module": module,
                "verilog": str(verilog),
                "label": "unknown_bucket_count_classifier",
                "variant": "bucket_count_sel{0}_{1}".format(len(selected), style),
                "source_style": style,
                "input_width": width,
                "output_width": width,
                "bucket_count": len(buckets),
                "bucket_slots": ":".join(str(slot) for slot, _members, _width in buckets),
                "bucket_members": ";".join(",".join(str(bit) for bit in members) for _slot, members, _width in buckets),
                "bucket_widths": ":".join(str(width) for _slot, _members, width in buckets),
                "selected_features": ":".join(feature_name(features[index]) for index in selected),
                "key_width": sum(bucket[2] for bucket in buckets) + len(selected),
                "mapped_keys": len(mapping),
                "trace": ";".join("{0}:{1}:{2}:{3}".format(kind, name, match, keys) for kind, name, match, keys in trace),
            }
        )
    return rows


def main(argv=None):
    parser = argparse.ArgumentParser()
    parser.add_argument("--cases", required=True)
    parser.add_argument("--benchmarks", type=Path, default=ROOT / "benchmarks")
    parser.add_argument("--work-dir", type=Path, required=True)
    parser.add_argument("--summary", type=Path, required=True)
    parser.add_argument("--seed-json", type=Path, required=True)
    parser.add_argument("--max-selectors", type=int, default=8)
    parser.add_argument("--styles", default="case_zero", help="Comma-separated RTL styles: case_zero,case_defaultx,perbit_defaultx")
    args = parser.parse_args(argv)

    rows = []
    seeds = {}
    for case in parse_cases(args.cases):
        case_rows = run_case(case, args.benchmarks, args.work_dir, args.max_selectors, parse_cases(args.styles))
        rows.extend(case_rows)
        best_row = case_rows[0]
        seeds[case] = {
            "label": best_row["label"],
            "module": best_row["module"],
            "variant": best_row["variant"],
            "verilog": best_row["verilog"],
        }
        for row in case_rows:
            seeds["{0}:{1}".format(case, row["source_style"])] = {
            "label": row["label"],
            "module": row["module"],
            "variant": row["variant"],
            "verilog": row["verilog"],
            }
    args.summary.parent.mkdir(parents=True, exist_ok=True)
    fields = [
        "case",
        "module",
        "verilog",
        "label",
        "variant",
        "source_style",
        "input_width",
        "output_width",
        "bucket_count",
        "bucket_slots",
        "bucket_members",
        "bucket_widths",
        "selected_features",
        "key_width",
        "mapped_keys",
        "trace",
    ]
    with args.summary.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields)
        writer.writeheader()
        writer.writerows(rows)
    args.seed_json.parent.mkdir(parents=True, exist_ok=True)
    args.seed_json.write_text(json.dumps(seeds, indent=2) + "\n")
    for row in rows:
        print("{case} style={source_style} buckets={bucket_count} selectors={selected_features} key_width={key_width} mapped_keys={mapped_keys}".format(**row))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
