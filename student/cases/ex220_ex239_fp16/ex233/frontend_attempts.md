# ex233 FP16 Frontend Attempts

Function hypothesis: `fp16_sqrt`.

Current known best:
- Run: `ex231_ex233_ex234_frontend_fp16_power_nested_current_20260607_2027`
- Variant: `ex233_nested_bits9_8_hi6_abc_g_aig`
- QoR: `1530/15/22950`
- Reference ADP: `20174`
- Ratio: `1.137603`
- Classification: `semantic_exact`

2026-06-07 focused pass:
- Official `evaluate.py --case ex233` recheck: OK.
- Python DAZ/FTZ/RNE/canonical-NaN sqrt model exact-matched the truth table.
- Best seed uses selected-bit vector cover for bits 14, 13, 12, and 9, then
  Yosys `abc -g aig`; this lowered both area and delay versus the old best.
- Negative inputs are mostly canonical NaN, so future source rewrites should
  keep the special guard shallow.

Next maintenance items:
- Now within 1.5x reference with a semantic parity-split nested mantissa
  structure; continue only if a lower-delay parity LUT appears.
- Try exponent half arithmetic plus local mantissa LUT grouped by exponent parity.
- Record negative input canonical NaN behavior and selected-bit candidates.

2026-06-07 ex232-style nested follow-up:
- Run: `student/runs/fp16/ex231_ex233_ex234_frontend_fp16_power_nested_20260607_2027/`
- Curated seed:
  `student/seeds/fp16/ex231_ex233_ex234_frontend_fp16_power_nested_current_20260607_2027/`
- Official `evaluate.py --case ex233` recheck: OK at `1530/15/22950`.
- Structure:
  - positive normal exponent range `1..30`;
  - `out_exp = (exp + 15) >> 1`;
  - output mantissa has two classes by exponent parity;
  - mantissa bits9/8 are run trees per parity class;
  - mantissa low8 is nested hi6/lo4 LUT per parity class;
  - negative zero/subnormal preserves signed zero `0x8000`; negative normal
    and negative infinity map to canonical NaN.
- Improvement: `1674/17/28458` -> `1530/15/22950`.
