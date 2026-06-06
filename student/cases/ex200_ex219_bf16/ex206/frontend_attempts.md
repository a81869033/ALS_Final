# ex206 BF16 Frontend Attempts

Hypothesis: `bf16_sin`

Current best snapshot:
- variant: `split_sign_exp_mant_case`
- class: `structural_exact`
- ADP/reference ratio: `1.187892`

Semantic direction:
- Odd function: use sign symmetry first.
- Check exponent ranges where output is approximately passthrough, zero, or saturated/constant.
- Use positive-domain exponent guards and 128-entry mantissa LUT only for active ranges.

Attempt log:
- 2026-06-05: Created tracking note.  QoR is already close; semantic cleanup is still useful for future backend seeds.

Failed or Avoided Directions:
- Do not generate more structural split variants without a clearer range split.

## 2026-06-06 batch update

See `student/cases/ex200_ex219_bf16/ex205-209/frontend_attempts.md` and run `ex205_ex209_frontend_bf16_semantic_20260606_0946` for the latest semantic/frontend results and curated seeds.
