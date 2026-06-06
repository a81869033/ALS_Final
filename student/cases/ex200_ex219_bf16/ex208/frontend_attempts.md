# ex208 BF16 Frontend Attempts

Hypothesis: `bf16_sinh`

Current best snapshot:
- variant: `split_sign_exp_mant_case`
- class: `structural_exact`
- ADP/reference ratio: `1.351561`

Semantic direction:
- Odd function: use sign symmetry first.
- Expect small-input passthrough and large-input inf/saturation ranges.
- For positive normal active ranges, use exponent guards and a 128-entry mantissa LUT.

Attempt log:
- 2026-06-05: Created tracking note.

Failed or Avoided Directions:
- Do not repeat split structural variants without converting them into explicit semantic ranges.

## 2026-06-06 batch update

See `student/cases/ex200_ex219_bf16/ex205-209/frontend_attempts.md` and run `ex205_ex209_frontend_bf16_semantic_20260606_0946` for the latest semantic/frontend results and curated seeds.
