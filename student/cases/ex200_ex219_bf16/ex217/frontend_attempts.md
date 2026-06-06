# ex217 BF16 Frontend Attempts

Hypothesis: `bf16_cbrt`

Current best snapshot:
- variant: `positive_default_exp_mant_delta`
- class: `structural_exact`
- ADP/reference ratio: `1.877960`

Semantic direction:
- Odd function: use sign symmetry.
- Normal-domain exponent formula should be `out_exp = (exp + 254) / 3 + delta`.
- Mantissa LUT should depend on `exp % 3` and 7-bit mantissa.
- Guard zero, inf, NaN, and subnormal behavior explicitly.

Attempt log:
- 2026-06-05: Created tracking note.  High priority; current structural best should be mined for `exp % 3` classes.
- 2026-06-06: Run `ex215_ex219_frontend_bf16_semantic_20260606_1447` confirmed exact `bf16_cbrt` semantics.  Best seed is `delta_pair_first_hilo3_bits_0_bh2_fix2`, `591/14/8274`, improved from `10864` ADP and within `1.5x` reference.
- 2026-06-06: Deep2 run `ex215_ex219_frontend_bf16_deep2_20260606_1726` improved best to `delta_pair_first_hilo3_bits_0_bh3_fix2_manual_sign_non_nan_caseattrs_fix15`, `623/13/8099`.  This trades area for one less delay level.

Failed or Avoided Directions:
- Do not keep positive-default delta as final semantic form.
- Arithmetic semantic RTL proved the function but synthesized too deep.  Selected bit0 override was useful; other single-bit and multi-bit overrides mostly increased area or delay.  Default-expression exception tables were catastrophic.
- `exp % 3` bit0 table was exact but worse (`603/15/9045`).  Runs/cmp/PLA encodings also lost; cmp was especially deep.
