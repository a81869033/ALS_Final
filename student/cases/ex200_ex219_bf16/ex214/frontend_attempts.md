# ex214 BF16 Frontend Attempts

Hypothesis: `bf16_reciprocal_square`

Current best snapshot:
- variant: `ex214_r96_bf16_recip_square_bit13_exp_formula_abc_g_aig`
- class: `semantic_hybrid_source_formula`
- ADP/reference ratio: `1.470297`

Semantic direction:
- Output sign should be non-negative for finite normal inputs.
- Normal-domain exponent formula should be `out_exp = 381 - 2*exp + delta`.
- Use a 128-entry mantissa LUT for reciprocal-square mantissa plus explicit overflow/underflow guards.

Attempt log:
- 2026-06-05: Created tracking note.  High priority because current best is hybrid and above 1.5x.
- 2026-06-06: Run `ex210_ex214_frontend_bf16_semantic_20260606_1315` confirmed exact reciprocal-square semantics.  Best seed is `legacy_default_expr_exception_case_bits_13_cmp_fix` at `337/11/3707`, improving old `3816` by 2.86%.  The old default/exception base stayed useful, but selected output bit13 reduced delay from 12 to 11.
- 2026-06-14: Run `frontend_gt15_structural_round96_20260614_0651` accepted `ex214_r96_bf16_recip_square_bit13_exp_formula_abc_g_aig` at `324/11/3564` by replacing the duplicated bit13 compare/casez structure with a sign-independent exponent range plus mantissa-threshold formula.  This is official `evaluate.py` OK and crosses the frontend `<1.5x` target.

Failed or Avoided Directions:
- Avoid growing default/exception cases without extracting exponent thresholds.
- Direct reciprocal-square arithmetic and broad hand formula LUTs were exact but too deep.  Positive-domain sign-insensitive tables and delta-pair variants were larger.  bit15 tied the base, while bit14/bit12 worsened ADP.  The old bit13 `cmp` is superseded by the round96 exponent/mantissa threshold formula; do not replay the old duplicated cmp/casez shape as-is.

## 2026-06-14 bf16-extra-r2 continuation outcome

Campaign: `ex204_ex299_frontend_continuation_20260614_1216`, agent `bf16-extra-r2`.

- Tried separate-field bit13 residual and mant64-hilo2 delta-pair bit13 comparator residual under `student/work/ex204_ex299_frontend_continuation_20260614_1216/bf16-extra-r2/ex214/`.
- Official `evaluate.py` OK candidates: `ex214_r2_sepfield_e4m4s0_b13bh2` `664/12/7968` and `ex214_r2_delta_m64h2_b13cmp` `355/12/4260`.
- No candidate improved the round96 frontend best `324/11/3564`; the bit13 exponent/mantissa formula remains the better frontend basis.
- Shard CSVs: `student/frontend_campaigns/campaigns/ex204_ex299_frontend_continuation_20260614_1216/agent_shards/bf16-extra-r2/`.
