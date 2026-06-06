# ex207 BF16 Frontend Attempts

Hypothesis: `bf16_tan`

Current best snapshot:
- variant: `exp_mant_pair_case`
- class: `structural_exact`
- ADP/reference ratio: `1.235478`

Semantic direction:
- Odd function: use sign symmetry first.
- Identify small-input passthrough/near-identity ranges.
- Use exponent range guards and localized 128-entry mantissa LUTs for nonlinear ranges.

Attempt log:
- 2026-06-05: Created tracking note.

Failed or Avoided Directions:
- Avoid more pair-case variants unless they identify a semantic range boundary.

## 2026-06-06 batch update

See `student/cases/ex200_ex219_bf16/ex205-209/frontend_attempts.md` and run `ex205_ex209_frontend_bf16_semantic_20260606_0946` for the latest semantic/frontend results and curated seeds.
