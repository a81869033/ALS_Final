# ex219 BF16 Frontend Attempts

Hypothesis: `bf16_reciprocal_cbrt`

Current best snapshot:
- variant: `exp_mant_delta_pair`
- class: `structural_exact`
- ADP/reference ratio: `1.998404`

Semantic direction:
- Odd function: use sign symmetry.
- Normal-domain exponent formula should be `out_exp = (508 - exp) / 3 + delta`.
- Mantissa LUT should depend on `exp % 3` and 7-bit mantissa.
- Guard zero, inf, NaN, and subnormal behavior explicitly.

Attempt log:
- 2026-06-05: Created tracking note.  High priority; mine current delta-pair result for `exp % 3` classes, then replace with semantic arithmetic RTL.
- 2026-06-06: Run `ex215_ex219_frontend_bf16_semantic_20260606_1447` confirmed exact `bf16_reciprocal_cbrt` semantics.  Best seed is `delta_pair_first_hilo3_bits_6_bh3_fix2`, `630/15/9450`, improved from `11271` ADP.
- 2026-06-06: Deep run `ex216_ex218_ex219_frontend_bf16_deep_20260606_1600` improved best to `delta_pair_first_hilo3_bits_6_cmp_caseattrs_fix9`, `623/15/9345`.  The useful change is representing output bit6 with comparator runs instead of hi/lo.
- 2026-06-06: Deep2 run `ex215_ex219_frontend_bf16_deep2_20260606_1726` did not improve beyond `623/15/9345`.

Failed or Avoided Directions:
- Avoid broad exp/mant delta factoring unless it becomes an explicit `exp % 3` semantic LUT.
- Arithmetic semantic RTL and positive-domain field defaults were exact but too deep/large.  Selected bit6 override helped; bit14 and multi-bit combinations regressed.  Do not run broad default-expression exception tables for this cbrt-family case.
- Hand reciprocal-cbrt exp-class RTL was exact but too deep (`601/19/11419`).  Cross-base bit6 predicates and mixed bit6+other-bit overrides did not beat the first-hilo3 base with bit6 comparator extraction.
- `exp % 3` bit6 table was exact but worse (`685/16/10960`).  Manual sign extraction on top of bit6 comparator also regressed.
- 2026-06-14: Round94 frontend-only structural search found a small improvement with `ex219_r94_bf16_reciprocal_cbrt_delta_pair_mant64_hilo3_bits_6_cmp`, official `evaluate.py` OK at `658/14/9212`, improving frontend ADP `9345 -> 9212`.  Method signature: `ex219|round94_frontend_structural_bf16|bf16_reciprocal_cbrt|delta_pair_mant64_hilo3_bits_6_cmp|shared_shell_or_grouped_output|yosys_aigmap_then_official_evaluate|abc_read_truth_xf`.  Paths: Verilog `student/work/frontend_bf16_unknown_struct_round94_20260614_0552/sub-bf16-recip-power-r94/ex219/verilog/ex219_r94_bf16_reciprocal_cbrt_delta_pair_mant64_hilo3_bits_6_cmp.v`; AIG `student/work/frontend_bf16_unknown_struct_round94_20260614_0552/sub-bf16-recip-power-r94/ex219/official_eval/ex219_r94_bf16_reciprocal_cbrt_delta_pair_mant64_hilo3_bits_6_cmp/ex219.aig`; log `student/work/frontend_bf16_unknown_struct_round94_20260614_0552/sub-bf16-recip-power-r94/ex219/logs/ex219_r94_bf16_reciprocal_cbrt_delta_pair_mant64_hilo3_bits_6_cmp.evaluate.py.log`.  Next action: keep this as frontend comparator; only extend with materially different mantissa grouping or lower-delay exponent/mod3 sharing.

## 2026-06-14 bf16-extra-r2 continuation outcome

Campaign: `ex204_ex299_frontend_continuation_20260614_1216`, agent `bf16-extra-r2`.

- Tried separate-field bit6 residual, mant64-hilo2 delta-pair bit6 comparator residual, and exact decision-graph bit6 residual under `student/work/ex204_ex299_frontend_continuation_20260614_1216/bf16-extra-r2/ex219/`.
- Official `evaluate.py` OK candidates: `ex219_r2_sepfield_e3m4s3_b6bh2` `1337/15/20055`, `ex219_r2_delta_m64h2_b6cmp` `708/14/9912`, and `ex219_r2_dg_delta_m64h2_b6` `742/20/14840`.
- No candidate improved the round94 frontend best `658/14/9212`; mant64-hilo3 bit6 cmp remains the better grouping than mant64-hilo2 or exact DG bit6.
- Shard CSVs: `student/frontend_campaigns/campaigns/ex204_ex299_frontend_continuation_20260614_1216/agent_shards/bf16-extra-r2/`.
