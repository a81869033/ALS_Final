# ex214 BF16 Frontend Attempts

Hypothesis: `bf16_reciprocal_square`

Current best snapshot:
- variant: `default_expr_exception_case`
- class: `semantic_hybrid`
- ADP/reference ratio: `1.574257`

Semantic direction:
- Output sign should be non-negative for finite normal inputs.
- Normal-domain exponent formula should be `out_exp = 381 - 2*exp + delta`.
- Use a 128-entry mantissa LUT for reciprocal-square mantissa plus explicit overflow/underflow guards.

Attempt log:
- 2026-06-05: Created tracking note.  High priority because current best is hybrid and above 1.5x.
- 2026-06-06: Run `ex210_ex214_frontend_bf16_semantic_20260606_1315` confirmed exact reciprocal-square semantics.  Best seed is `legacy_default_expr_exception_case_bits_13_cmp_fix` at `337/11/3707`, improving old `3816` by 2.86%.  The old default/exception base stayed useful, but selected output bit13 reduced delay from 12 to 11.

Failed or Avoided Directions:
- Avoid growing default/exception cases without extracting exponent thresholds.
- Direct reciprocal-square arithmetic and hand formula LUTs were exact but too deep.  Positive-domain sign-insensitive tables and delta-pair variants were larger.  bit15 tied the base, while bit14/bit12 worsened ADP; bit13 `cmp` was the best predicate encoding.
