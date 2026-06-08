#!/usr/bin/env python3
"""Semantic diagnostics for ex250-ex254 FP8/float class cases."""

from bisect import bisect_left
from collections import Counter
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]

import sys

if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from student.frontends.truth import TruthTable


CASES = ["ex250", "ex251", "ex252", "ex253", "ex254"]


class FP8Format:
    def __init__(self, exp_bits, bias=None, nan_mode="fn_max"):
        self.exp_bits = exp_bits
        self.mant_bits = 7 - exp_bits
        self.exp_max = (1 << exp_bits) - 1
        self.mant_max = (1 << self.mant_bits) - 1
        self.bias = (1 << (exp_bits - 1)) - 1 if bias is None else bias
        self.nan_mode = nan_mode
        self.nan = [False] * 128
        self.k = [0] * 128
        for code in range(128):
            exp = (code >> self.mant_bits) & self.exp_max
            mant = code & self.mant_max
            if nan_mode == "fn_max":
                nan = exp == self.exp_max and mant == self.mant_max
            elif nan_mode == "ieee":
                nan = exp == self.exp_max and mant != 0
            else:
                nan = False
            self.nan[code] = nan
            if nan:
                self.k[code] = None
            elif exp == 0:
                self.k[code] = mant
            elif nan_mode == "ieee" and exp == self.exp_max and mant == 0:
                self.k[code] = None
            else:
                self.k[code] = ((1 << self.mant_bits) + mant) << (exp - 1)
        if self.bias > 0:
            self.scale = (1 << self.mant_bits) << (self.bias - 1)
        else:
            self.scale = 1 << self.mant_bits
        self.pos = [
            (self.k[code], code)
            for code in range(1, 128)
            if not self.nan[code] and self.k[code] is not None
        ]
        self.pos_k = [value for value, _code in self.pos]

    @property
    def name(self):
        return "E{0}M{1}_{2}".format(self.exp_bits, self.mant_bits, self.nan_mode)

    def quant_mag(self, numerator, denominator=1):
        if denominator < 0:
            numerator = -numerator
            denominator = -denominator
        if numerator <= 0:
            return 0
        idx = bisect_left(self.pos_k, numerator // denominator)
        best_key = (numerator * 4, 0, 0)
        best_code = 0
        for pos in range(max(0, idx - 12), min(len(self.pos), idx + 14)):
            point, code = self.pos[pos]
            diff = abs(numerator - point * denominator)
            key = (diff * 2, code & 1, code)
            if key < best_key:
                best_key = key
                best_code = code
        return best_code

    def add(self, left, right):
        lm = left & 0x7F
        rm = right & 0x7F
        if self.nan[lm] or self.nan[rm] or self.k[lm] is None or self.k[rm] is None:
            return 0x7F
        lval = -self.k[lm] if left & 0x80 else self.k[lm]
        rval = -self.k[rm] if right & 0x80 else self.k[rm]
        total = lval + rval
        sign = 0x80 if total < 0 else 0
        mag = self.quant_mag(abs(total))
        if mag == 0 and self.k[lm] == 0 and self.k[rm] == 0 and (left & 0x80) and (right & 0x80):
            sign = 0x80
        return sign | mag

    def sub(self, left, right):
        return self.add(left, right ^ 0x80)

    def mul(self, left, right):
        lm = left & 0x7F
        rm = right & 0x7F
        if self.nan[lm] or self.nan[rm] or self.k[lm] is None or self.k[rm] is None:
            return 0x7F
        return ((left ^ right) & 0x80) | self.quant_mag(self.k[lm] * self.k[rm], self.scale)

    def div(self, numerator, denominator):
        nm = numerator & 0x7F
        dm = denominator & 0x7F
        if self.nan[nm] or self.nan[dm] or self.k[nm] is None or self.k[dm] is None:
            return 0x7F
        sign = (numerator ^ denominator) & 0x80
        if self.k[dm] == 0:
            return 0x7F if self.k[nm] == 0 else sign | 0x7E
        return sign | self.quant_mag(self.k[nm] * self.scale, self.k[dm])

    def fmod(self, numerator, denominator):
        nm = numerator & 0x7F
        dm = denominator & 0x7F
        if self.nan[nm] or self.nan[dm] or self.k[nm] is None or self.k[dm] is None or self.k[dm] == 0:
            return 0x7F
        return (numerator & 0x80) | self.quant_mag(self.k[nm] % self.k[dm])

    def absdiff_mag(self, left, right):
        lm = left & 0x7F
        rm = right & 0x7F
        if self.nan[lm] or self.nan[rm] or self.k[lm] is None or self.k[rm] is None:
            return 0x7F
        return self.quant_mag(abs(self.k[lm] - self.k[rm]))

    def avg(self, left, right):
        lm = left & 0x7F
        rm = right & 0x7F
        if self.nan[lm] or self.nan[rm] or self.k[lm] is None or self.k[rm] is None:
            return 0x7F
        lval = -self.k[lm] if left & 0x80 else self.k[lm]
        rval = -self.k[rm] if right & 0x80 else self.k[rm]
        total = lval + rval
        return (0x80 if total < 0 else 0) | self.quant_mag(abs(total), 2)

    def max_real(self, left, right):
        lm = left & 0x7F
        rm = right & 0x7F
        if self.nan[lm] or self.nan[rm] or self.k[lm] is None or self.k[rm] is None:
            return 0x7F
        lval = -self.k[lm] if left & 0x80 else self.k[lm]
        rval = -self.k[rm] if right & 0x80 else self.k[rm]
        return left if lval >= rval else right

    def min_real(self, left, right):
        lm = left & 0x7F
        rm = right & 0x7F
        if self.nan[lm] or self.nan[rm] or self.k[lm] is None or self.k[rm] is None:
            return 0x7F
        lval = -self.k[lm] if left & 0x80 else self.k[lm]
        rval = -self.k[rm] if right & 0x80 else self.k[rm]
        return left if lval <= rval else right


def mismatch_count(outputs, fn):
    mismatches = 0
    first = []
    for index, expected in enumerate(outputs):
        left = (index >> 8) & 0xFF
        right = index & 0xFF
        actual = fn(left, right)
        if actual != expected:
            mismatches += 1
            if len(first) < 5:
                first.append((index, expected, actual))
    return mismatches, first


def main():
    e4 = FP8Format(4, nan_mode="fn_max")

    def fp4_e2m1_value(nibble):
        mag = nibble & 0x7
        exp = (mag >> 1) & 0x3
        mant = mag & 0x1
        if exp == 0:
            value = mant
        else:
            value = (2 + mant) << (exp - 1)
        return -value if nibble & 0x8 else value

    def int3_signmag_value(nibble):
        value = nibble & 0x7
        return -value if nibble & 0x8 else value

    def quant_e4_from_scaled_int(value):
        sign = 0x80 if value < 0 else 0
        return sign | e4.quant_mag(abs(value) * 128)

    def quant_e4_from_k(value):
        sign = 0x80 if value < 0 else 0
        return sign | e4.quant_mag(abs(value))

    def signed_e4_k(code):
        mag = code & 0x7F
        if mag == 0x7F:
            return None
        value = e4.k[mag]
        return -value if code & 0x80 else value

    def product_is_neg_zero(left_nibble, right_nibble, value_fn):
        return (
            value_fn(left_nibble) == 0
            or value_fn(right_nibble) == 0
        ) and (((left_nibble ^ right_nibble) & 0x8) != 0)

    def dot2_e4(value_fn, left, right):
        hi_value = value_fn(left >> 4) * value_fn(right >> 4)
        lo_value = value_fn(left & 0xF) * value_fn(right & 0xF)
        total = hi_value + lo_value
        if total == 0:
            hi_neg_zero = product_is_neg_zero(left >> 4, right >> 4, value_fn)
            lo_neg_zero = product_is_neg_zero(left & 0xF, right & 0xF, value_fn)
            if hi_neg_zero and lo_neg_zero:
                return 0x80
        return quant_e4_from_scaled_int(total)

    def fma_fp4_e4(left, right):
        product = fp4_e2m1_value(right >> 4) * fp4_e2m1_value(right & 0xF)
        total_k = signed_e4_k(left) + 128 * product
        if total_k == 0:
            product_neg_zero = product_is_neg_zero(right >> 4, right & 0xF, fp4_e2m1_value)
            if left == 0x80 and product_neg_zero:
                return 0x80
        return quant_e4_from_k(total_k)

    semantic = {
        "ex250": lambda left, right: dot2_e4(
            fp4_e2m1_value,
            left,
            right,
        ),
        "ex251": lambda left, right: dot2_e4(
            int3_signmag_value,
            left,
            right,
        ),
        "ex252": lambda left, right: quant_e4_from_scaled_int(
            sum(
                ((left >> shift) & 0x3) * ((right >> shift) & 0x3)
                for shift in (0, 2, 4, 6)
            )
        ),
        "ex253": lambda left, right: quant_e4_from_scaled_int(
            2
            * sum(
                ((left >> shift) & 0x3) + ((right >> shift) & 0x3)
                for shift in (0, 2, 4, 6)
            )
        ),
        "ex254": lambda left, right: (
            0x7F
            if (left & 0x7F) == 0x7F
            else fma_fp4_e4(left, right)
        ),
    }

    print("Targeted semantic checks")
    for case, fn in semantic.items():
        table = TruthTable(ROOT / "benchmarks" / (case + ".truth"))
        outputs = [table.get_output(index) for index in range(table.num_inputs)]
        mismatches, first = mismatch_count(outputs, fn)
        print(case, "mismatches", mismatches, "first", first)
    if "--targeted-only" in sys.argv:
        return

    formats = [
        FP8Format(exp_bits, nan_mode=nan_mode)
        for exp_bits in range(2, 7)
        for nan_mode in ("fn_max", "none", "ieee")
    ]
    operations = [
        ("add", lambda fmt: fmt.add),
        ("mul", lambda fmt: fmt.mul),
        ("sub_hi_lo", lambda fmt: fmt.sub),
        ("sub_lo_hi", lambda fmt: lambda left, right: fmt.sub(right, left)),
        ("div_lo_hi", lambda fmt: lambda left, right: fmt.div(right, left)),
        ("div_hi_lo", lambda fmt: fmt.div),
        ("fmod_lo_hi", lambda fmt: lambda left, right: fmt.fmod(right, left)),
        ("fmod_hi_lo", lambda fmt: fmt.fmod),
        ("absdiff_mag", lambda fmt: fmt.absdiff_mag),
        ("avg", lambda fmt: fmt.avg),
        ("max_real", lambda fmt: fmt.max_real),
        ("min_real", lambda fmt: fmt.min_real),
    ]

    for case in CASES:
        table = TruthTable(ROOT / "benchmarks" / (case + ".truth"))
        outputs = [table.get_output(index) for index in range(table.num_inputs)]
        print("\\nCASE {0}".format(case))
        print("distinct", len(set(outputs)), "top", Counter(outputs).most_common(8))
        rows = []
        for fmt in formats:
            for name, builder in operations:
                mismatches, first = mismatch_count(outputs, builder(fmt))
                rows.append((mismatches, name, fmt.name, first))
        for row in sorted(rows)[:12]:
            print(row)


if __name__ == "__main__":
    main()
