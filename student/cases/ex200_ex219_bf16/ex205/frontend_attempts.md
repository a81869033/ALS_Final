# ex205 BF16 Frontend Attempts

Hypothesis: `bf16_log10`

Current best snapshot:
- variant: `sign_exp_mant_case`
- class: `structural_exact`
- ADP/reference ratio: `1.768757`

Semantic direction:
- High priority: current best is structural and far from reference.
- Start from log-style special cases: negative normal -> canonical NaN, zero -> negative infinity, positive infinity -> positive infinity.
- Try exponent arithmetic for the power-of-two component plus a 128-entry mantissa LUT for `log10(1.mant)`.
- Check whether multiplying the exponent component by an approximate constant creates simple piecewise ranges.

Attempt log:
- 2026-06-05: Created tracking note.

Failed or Avoided Directions:
- Do not spend time on more full sign/exp/mant tables unless they expose constant ranges.

## 2026-06-06 batch update

See `student/cases/ex200_ex219_bf16/ex205-209/frontend_attempts.md` and run `ex205_ex209_frontend_bf16_semantic_20260606_0946` for the latest semantic/frontend results and curated seeds.
