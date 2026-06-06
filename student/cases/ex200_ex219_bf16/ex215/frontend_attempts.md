# ex215 BF16 Frontend Attempts

Hypothesis: `bf16_reciprocal_sqrt`

Current best snapshot:
- variant: `sign_pair_case`
- class: `structural_exact`
- ADP/reference ratio: `1.588889`

Semantic direction:
- Negative normal inputs should map to canonical NaN.
- Normal-domain exponent formula should be `out_exp = (381 - exp) >> 1 + delta`.
- Mantissa LUT likely depends on exponent parity and mantissa.
- Guard zero -> inf, inf -> zero, NaN -> canonical NaN.

Attempt log:
- 2026-06-05: Created tracking note.  High priority and has a clear arithmetic semantic form.
- 2026-06-06: Run `ex215_ex219_frontend_bf16_semantic_20260606_1447` confirmed exact `bf16_reciprocal_sqrt` semantics.  Best seed is `delta_pair_mode_hilo3_bits_9_bh1_fix2`, `390/12/4680`, improved from `5005` ADP and within `1.5x` reference.
- 2026-06-06: Deep2 run `ex215_ex219_frontend_bf16_deep2_20260606_1726` did not improve beyond `390/12/4680`.

Failed or Avoided Directions:
- Do not use sign-pair structural case as final form; use it only to inspect negative-domain behavior.
- Semantic arithmetic and aggressive field variants were exact but lost to delta-pair plus selected bit9 override.  Multi-bit selected overrides around bit9 increased mux/predicate cost and regressed.
- bit9 cmp/runs/PLA encodings and case attributes did not improve over bit9 `bh1`.
