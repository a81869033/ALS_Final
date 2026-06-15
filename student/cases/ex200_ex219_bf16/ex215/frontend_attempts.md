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

## 2026-06-14 bf16-extra-r2 continuation outcome

Campaign: `ex204_ex299_frontend_continuation_20260614_1216`, agent `bf16-extra-r2`.

- Tried separate-field bit9 residual and mant64-hilo2 delta-pair bit9 residual under `student/work/ex204_ex299_frontend_continuation_20260614_1216/bf16-extra-r2/ex215/`.
- Official `evaluate.py` OK candidates: `ex215_r2_sepfield_e3m4s3_b9bh2` `872/15/13080` and `ex215_r2_delta_m64h2_b9bh2` `447/13/5811`.
- No candidate improved current frontend ADP `4680`; do not repeat these e3/m4/s3 or mant64-hilo2 bit9 groupings unchanged.
- Shard CSVs: `student/frontend_campaigns/campaigns/ex204_ex299_frontend_continuation_20260614_1216/agent_shards/bf16-extra-r2/`.
