# ex209 BF16 Frontend Attempts

Hypothesis: `bf16_tanh`

Current best snapshot:
- variant: `sign_exp_default_expr_case`
- class: `semantic_hybrid`
- ADP/reference ratio: `1.358607`

Semantic direction:
- Odd function: use sign symmetry.
- Tanh should have small-input passthrough/near-identity and large-input +/-1 saturation.
- Replace remaining exception list with exponent thresholds and a 128-entry mantissa LUT in the transition region.

Attempt log:
- 2026-06-05: Created tracking note.  Current hybrid candidate is a useful baseline.

Failed or Avoided Directions:
- Avoid pure default/exception growth unless it shrinks after semantic range guards.

## 2026-06-06 batch update

See `student/cases/ex200_ex219_bf16/ex205-209/frontend_attempts.md` and run `ex205_ex209_frontend_bf16_semantic_20260606_0946` for the latest semantic/frontend results and curated seeds.
