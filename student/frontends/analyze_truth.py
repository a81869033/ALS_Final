#!/usr/bin/env python3
"""Structural probes for ALS truth tables."""

import argparse
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]

try:
    from .truth import TruthTable, VALID_BIT_ORDERS, VALID_INPUT_ORDERS, format_word
except ImportError:
    from truth import TruthTable, VALID_BIT_ORDERS, VALID_INPUT_ORDERS, format_word


def case_number(case):
    if len(case) >= 3 and case[:2] == "ex":
        try:
            return int(case[2:])
        except ValueError:
            return None
    return None


def mask_for_width(width):
    if width <= 0:
        return 0
    return (1 << width) - 1


def bit_range_mask(start, width):
    return mask_for_width(width) << start


def format_input_mask(mask, width):
    if mask == 0:
        return "constant"

    ranges = []
    start = None
    previous = None
    for bit_index in range(width):
        if mask & (1 << bit_index):
            if start is None:
                start = bit_index
            previous = bit_index
        elif start is not None:
            ranges.append((start, previous))
            start = None
            previous = None
    if start is not None:
        ranges.append((start, previous))

    parts = []
    for first, last in ranges:
        if first == last:
            parts.append("in[{0}]".format(first))
        else:
            parts.append("in[{0}:{1}]".format(first, last))
    return ", ".join(parts)


def one_bit_index(mask):
    if mask == 0 or (mask & (mask - 1)) != 0:
        return None
    return mask.bit_length() - 1


def print_basic_summary(table, outputs, sample_limit):
    sample_count = min(sample_limit, table.num_inputs)
    sample_unique = len(set(outputs[:sample_count]))
    full_unique = len(set(outputs))

    print("case: {0}".format(table.case))
    print("truth: {0}".format(table.path))
    print(
        "widths: input={0} output={1} rows={2}".format(
            table.input_width, table.output_width, table.num_inputs
        )
    )
    print(
        "bit_order: {0} (line 0 -> output bit {1})".format(
            table.bit_order, table.line_bit_index(0)
        )
    )
    print("input_order: {0}".format(table.input_order))
    print(
        "unique_outputs: sample_first_{0}={1} full={2}".format(
            sample_count, sample_unique, full_unique
        )
    )

    constants = table.constant_bits()
    if constants:
        text = ", ".join(
            "out[{0}]={1}".format(bit_index, value)
            for bit_index, value in constants
        )
    else:
        text = "none"
    print("constant_output_bits: {0}".format(text))


def compute_dependency_masks(outputs, input_width, output_width):
    output_full_mask = mask_for_width(output_width)
    dependencies = [0] * output_width
    num_inputs = len(outputs)

    for input_bit in range(input_width):
        step = 1 << input_bit
        block = step << 1
        changed_outputs = 0

        for base in range(0, num_inputs, block):
            other = base + step
            for offset in range(step):
                changed_outputs |= outputs[base + offset] ^ outputs[other + offset]
                if changed_outputs == output_full_mask:
                    break
            if changed_outputs == output_full_mask:
                break

        for output_bit in range(output_width):
            if changed_outputs & (1 << output_bit):
                dependencies[output_bit] |= 1 << input_bit

    return dependencies


def summarize_split(dependencies, input_width, low_width):
    low_mask = bit_range_mask(0, low_width)
    high_mask = bit_range_mask(low_width, input_width - low_width)
    counts = {
        "constant": 0,
        "low_only": 0,
        "high_only": 0,
        "mixed": 0,
    }

    for dependency in dependencies:
        if dependency == 0:
            counts["constant"] += 1
        elif dependency & ~low_mask == 0:
            counts["low_only"] += 1
        elif dependency & ~high_mask == 0:
            counts["high_only"] += 1
        else:
            counts["mixed"] += 1

    return counts


def passthrough_matches(outputs, dependencies, input_width, output_width):
    matches = []

    for output_bit, dependency in enumerate(dependencies):
        input_bit = one_bit_index(dependency)
        if input_bit is None:
            continue

        same = True
        inverted = True
        for index, output in enumerate(outputs):
            output_value = (output >> output_bit) & 1
            input_value = (index >> input_bit) & 1
            if output_value != input_value:
                same = False
            if output_value == input_value:
                inverted = False
            if not same and not inverted:
                break

        if same:
            matches.append("out[{0}]=in[{1}]".format(output_bit, input_bit))
        elif inverted:
            matches.append("out[{0}]=~in[{1}]".format(output_bit, input_bit))

    return matches


def print_split_hints(table, outputs):
    print("")
    print("split/dependency hints:")

    dependencies = compute_dependency_masks(
        outputs, table.input_width, table.output_width
    )
    split_specs = []
    seen = set()

    def add_split(name, low_width):
        if low_width <= 0 or low_width >= table.input_width:
            return
        if low_width in seen:
            return
        seen.add(low_width)
        split_specs.append((name, low_width))

    if table.input_width % 2 == 0:
        half = table.input_width // 2
        add_split(
            "half split {0}/{1}".format(half, table.input_width - half),
            half,
        )
    if table.input_width >= 16:
        add_split("byte split low8/rest", 8)
    if table.input_width >= 8:
        add_split("nibble split low4/rest", 4)

    if split_specs:
        for name, low_width in split_specs:
            counts = summarize_split(dependencies, table.input_width, low_width)
            print(
                "  {0}: constant={1} low_only={2} high_only={3} mixed={4}".format(
                    name,
                    counts["constant"],
                    counts["low_only"],
                    counts["high_only"],
                    counts["mixed"],
                )
            )
    else:
        print("  no split probe: input_width={0}".format(table.input_width))

    matches = passthrough_matches(
        outputs, dependencies, table.input_width, table.output_width
    )
    if matches:
        print("  passthrough/inverted bits: {0}".format(", ".join(matches)))
    else:
        print("  passthrough/inverted bits: none")

    print("  output bit dependencies:")
    for output_bit, dependency in enumerate(dependencies):
        print(
            "    out[{0}]: {1}".format(
                output_bit, format_input_mask(dependency, table.input_width)
            )
        )


def add_region(regions, name, output):
    regions[name][0] += 1
    regions[name][1].add(output)


def format_values(values, width, limit):
    ordered = sorted(values)
    shown = [format_word(value, width) for value in ordered[:limit]]
    if len(ordered) > limit:
        shown.append("...")
    return ", ".join(shown)


def print_float_regions(name, table, outputs, exp_lo, exp_width, mant_width):
    exp_mask = mask_for_width(exp_width)
    mant_mask = mask_for_width(mant_width)
    regions = {
        "zero": [0, set()],
        "subnormal": [0, set()],
        "normal": [0, set()],
        "infinity": [0, set()],
        "nan": [0, set()],
    }

    for index, output in enumerate(outputs):
        exponent = (index >> exp_lo) & exp_mask
        mantissa = index & mant_mask

        if exponent == 0 and mantissa == 0:
            add_region(regions, "zero", output)
        elif exponent == 0:
            add_region(regions, "subnormal", output)
        elif exponent == exp_mask and mantissa == 0:
            add_region(regions, "infinity", output)
        elif exponent == exp_mask:
            add_region(regions, "nan", output)
        else:
            add_region(regions, "normal", output)

    print("  {0}:".format(name))
    for region_name in ["zero", "subnormal", "normal", "infinity", "nan"]:
        count, values = regions[region_name]
        if len(values) <= 4:
            value_text = " values={0}".format(
                format_values(values, table.output_width, 4)
            )
        else:
            value_text = " sample_values={0}".format(
                format_values(values, table.output_width, 4)
            )
        print(
            "    {0}: inputs={1} unique_outputs={2}{3}".format(
                region_name, count, len(values), value_text
            )
        )


def print_sign_relation(table, outputs):
    if table.input_width != 16 or table.output_width < 16:
        print("  sign relation: skipped; needs 16 input bits and >=16 output bits")
        return

    sign_mask = 1 << 15
    same = 0
    sign_flipped = 0
    other = 0
    for index in range(sign_mask):
        positive = outputs[index]
        negative = outputs[index | sign_mask]
        if negative == positive:
            same += 1
        elif negative == (positive ^ sign_mask):
            sign_flipped += 1
        else:
            other += 1

    print(
        "  sign relation over paired inputs: same={0} sign_flipped={1} other={2}".format(
            same, sign_flipped, other
        )
    )


def print_float_hints(table, outputs):
    print("")
    print("BF16/FP16 special-region hints:")
    if table.input_width != 16:
        print("  skipped: input_width={0}, expected 16".format(table.input_width))
        return

    print_float_regions("BF16 fields sign|exp[7:0]|mant[6:0]", table, outputs, 7, 8, 7)
    print_float_regions("FP16 fields sign|exp[4:0]|mant[9:0]", table, outputs, 10, 5, 10)
    print_sign_relation(table, outputs)


def to_signed(value, width):
    sign_bit = 1 << (width - 1)
    if value & sign_bit:
        return value - (1 << width)
    return value


def trunc_div(numerator, denominator):
    if denominator == 0:
        raise ZeroDivisionError()
    negative = (numerator < 0) != (denominator < 0)
    quotient = abs(numerator) // abs(denominator)
    if negative:
        return -quotient
    return quotient


def integer_sqrt(value):
    if value < 0:
        raise ValueError("integer_sqrt expects a non-negative value")
    low = 0
    high = value
    answer = 0
    while low <= high:
        mid = (low + high) // 2
        square = mid * mid
        if square <= value:
            answer = mid
            low = mid + 1
        else:
            high = mid - 1
    return answer


def split_operands(index, part_width, order):
    part_mask = mask_for_width(part_width)
    low = index & part_mask
    high = (index >> part_width) & part_mask
    if order == "low_high":
        return low, high
    return high, low


def inverted_split_operands(index, part_width, order):
    part_mask = mask_for_width(part_width)
    a, b = split_operands(index, part_width, order)
    return a ^ part_mask, b ^ part_mask


def dbz_value(policy, a, b, index, part_mask, output_mask):
    if policy == "zero":
        return 0
    if policy == "max":
        return output_mask
    if policy == "part_max":
        return part_mask
    if policy == "lhs":
        return a
    if policy == "rhs":
        return b
    if policy == "input":
        return index
    raise ValueError("unknown divide-by-zero policy: {0}".format(policy))


def build_integer_candidates(input_width, output_width):
    output_mask = mask_for_width(output_width)
    candidates = []

    def add(name, func):
        candidates.append((name, func))

    add("x", lambda index: index)
    add("~x", lambda index: ~index)
    add("x*x", lambda index: index * index)
    add("isqrt(x)", lambda index: integer_sqrt(index))

    if input_width % 2 != 0:
        return candidates

    part_width = input_width // 2
    part_mask = mask_for_width(part_width)
    orders = [
        ("low{0}_high{0}".format(part_width), "low_high"),
        ("high{0}_low{0}".format(part_width), "high_low"),
    ]

    for order_name, order in orders:
        add(
            "{0}:a".format(order_name),
            lambda index, order=order: split_operands(index, part_width, order)[0],
        )
        add(
            "{0}:b".format(order_name),
            lambda index, order=order: split_operands(index, part_width, order)[1],
        )
        add(
            "{0}:a+b".format(order_name),
            lambda index, order=order: sum(split_operands(index, part_width, order)),
        )
        add(
            "{0}:a-b".format(order_name),
            lambda index, order=order: split_operands(index, part_width, order)[0]
            - split_operands(index, part_width, order)[1],
        )
        add(
            "{0}:b-a".format(order_name),
            lambda index, order=order: split_operands(index, part_width, order)[1]
            - split_operands(index, part_width, order)[0],
        )
        add(
            "{0}:a*b".format(order_name),
            lambda index, order=order: split_operands(index, part_width, order)[0]
            * split_operands(index, part_width, order)[1],
        )
        add(
            "{0}:signed_a*signed_b".format(order_name),
            lambda index, order=order: to_signed(
                split_operands(index, part_width, order)[0], part_width
            )
            * to_signed(split_operands(index, part_width, order)[1], part_width),
        )
        add(
            "{0}:a&b".format(order_name),
            lambda index, order=order: split_operands(index, part_width, order)[0]
            & split_operands(index, part_width, order)[1],
        )
        add(
            "{0}:a|b".format(order_name),
            lambda index, order=order: split_operands(index, part_width, order)[0]
            | split_operands(index, part_width, order)[1],
        )
        add(
            "{0}:a^b".format(order_name),
            lambda index, order=order: split_operands(index, part_width, order)[0]
            ^ split_operands(index, part_width, order)[1],
        )
        add(
            "{0}:~a+~b".format(order_name),
            lambda index, order=order: sum(
                inverted_split_operands(index, part_width, order)
            ),
        )
        add(
            "{0}:~a*~b".format(order_name),
            lambda index, order=order: inverted_split_operands(
                index, part_width, order
            )[0]
            * inverted_split_operands(index, part_width, order)[1],
        )
        add(
            "{0}:signed_~a*signed_~b".format(order_name),
            lambda index, order=order: to_signed(
                inverted_split_operands(index, part_width, order)[0], part_width
            )
            * to_signed(
                inverted_split_operands(index, part_width, order)[1], part_width
            ),
        )

        for policy in ["zero", "max", "part_max", "lhs", "rhs", "input"]:
            add(
                "{0}:a/b dbz={1}".format(order_name, policy),
                lambda index, order=order, policy=policy: unsigned_div_probe(
                    index, part_width, order, policy, part_mask, output_mask
                ),
            )
            add(
                "{0}:a%b dbz={1}".format(order_name, policy),
                lambda index, order=order, policy=policy: unsigned_mod_probe(
                    index, part_width, order, policy, part_mask, output_mask
                ),
            )
            add(
                "{0}:signed_a/signed_b dbz={1}".format(order_name, policy),
                lambda index, order=order, policy=policy: signed_div_probe(
                    index, part_width, order, policy, part_mask, output_mask
                ),
            )
            add(
                "{0}:~a/~b dbz={1}".format(order_name, policy),
                lambda index, order=order, policy=policy: unsigned_div_inverted_probe(
                    index, part_width, order, policy, part_mask, output_mask
                ),
            )

    return candidates


def unsigned_div_probe(index, part_width, order, policy, part_mask, output_mask):
    a, b = split_operands(index, part_width, order)
    if b == 0:
        return dbz_value(policy, a, b, index, part_mask, output_mask)
    return a // b


def unsigned_mod_probe(index, part_width, order, policy, part_mask, output_mask):
    a, b = split_operands(index, part_width, order)
    if b == 0:
        return dbz_value(policy, a, b, index, part_mask, output_mask)
    return a % b


def signed_div_probe(index, part_width, order, policy, part_mask, output_mask):
    a, b = split_operands(index, part_width, order)
    signed_a = to_signed(a, part_width)
    signed_b = to_signed(b, part_width)
    if signed_b == 0:
        return dbz_value(policy, a, b, index, part_mask, output_mask)
    return trunc_div(signed_a, signed_b)


def unsigned_div_inverted_probe(index, part_width, order, policy, part_mask, output_mask):
    a, b = inverted_split_operands(index, part_width, order)
    if b == 0:
        return dbz_value(policy, a, b, index, part_mask, output_mask)
    return a // b


def score_candidates(outputs, output_width, candidates):
    output_mask = mask_for_width(output_width)
    results = []

    for name, func in candidates:
        mismatches = 0
        first = None
        for index, expected in enumerate(outputs):
            actual = func(index) & output_mask
            if actual != expected:
                mismatches += 1
                if first is None:
                    first = (index, expected, actual)
        results.append((mismatches, name, first))

    results.sort(key=lambda item: (item[0], item[1]))
    return results


def print_integer_probes(table, outputs, top):
    print("")
    print("integer arithmetic probes:")

    number = case_number(table.case)
    if number is None or number < 255 or number > 279:
        print("  skipped: case is outside ex255-ex279")
        return
    if table.input_width > 16:
        print("  skipped: input_width={0} is above quick-probe limit".format(table.input_width))
        return

    candidates = build_integer_candidates(table.input_width, table.output_width)
    results = score_candidates(outputs, table.output_width, candidates)
    exact = [item for item in results if item[0] == 0]

    if exact:
        print("  exact matches:")
        for mismatches, name, first in exact[:top]:
            print("    {0}".format(name))
    else:
        print("  exact matches: none")

    print("  best full-table candidates:")
    for mismatches, name, first in results[:top]:
        if first is None:
            print("    {0}: mismatches=0/{1}".format(name, table.num_inputs))
        else:
            index, expected, actual = first
            print(
                "    {0}: mismatches={1}/{2}; first index {3} expected {4} got {5}".format(
                    name,
                    mismatches,
                    table.num_inputs,
                    index,
                    format_word(expected, table.output_width),
                    format_word(actual, table.output_width),
                )
            )


def parse_args(argv):
    parser = argparse.ArgumentParser(description="Analyze an ALS truth table.")
    parser.add_argument("--case", required=True, help="Benchmark case, for example ex200.")
    parser.add_argument(
        "--benchmarks",
        type=Path,
        default=ROOT / "benchmarks",
        help="Directory containing exNNN.truth files.",
    )
    parser.add_argument(
        "--bit-order",
        choices=VALID_BIT_ORDERS,
        default="lsb_first",
        help="Map file lines to output bit positions.",
    )
    parser.add_argument(
        "--input-order",
        choices=VALID_INPUT_ORDERS,
        default="abc_xf",
        help="Map numeric input index to truth-file character index.",
    )
    parser.add_argument(
        "--sample-limit",
        type=int,
        default=4096,
        help="Number of leading rows used for the sample unique count.",
    )
    parser.add_argument(
        "--top",
        type=int,
        default=8,
        help="Number of integer-probe candidates to report.",
    )
    return parser.parse_args(argv)


def main(argv=None):
    args = parse_args(argv)
    truth_path = args.benchmarks / "{0}.truth".format(args.case)
    if not truth_path.is_file():
        print("truth table not found: {0}".format(truth_path), file=sys.stderr)
        return 2

    try:
        table = TruthTable(
            truth_path,
            bit_order=args.bit_order,
            input_order=args.input_order,
        )
        outputs = list(table.iter_outputs())
    except (IOError, OSError, ValueError) as error:
        print("analyze_truth.py: {0}".format(error), file=sys.stderr)
        return 2

    print_basic_summary(table, outputs, args.sample_limit)
    print_split_hints(table, outputs)
    print_float_hints(table, outputs)
    print_integer_probes(table, outputs, args.top)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
