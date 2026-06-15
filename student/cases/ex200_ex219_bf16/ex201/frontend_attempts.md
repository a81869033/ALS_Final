# ex201 BF16 Frontend Attempts

Hypothesis: `bf16_exp2`

Current best snapshot:
- variant: `exp_mant_pair_case`
- class: `structural_exact`
- ADP/reference ratio: `1.471472`

Semantic direction:
- Use BF16 field RTL for base-2 exponentiation.
- Expect many constant/underflow/overflow exponent ranges and active positive ranges with 128-entry mantissa LUT.
- Derive exponent output from input exponent plus a small range-dependent transform instead of full pair table.

Attempt log:
- 2026-06-05: Created tracking note.  Current QoR is within 1.5x but not semantic; preserve structural best as grouping evidence.
- 2026-06-05: Run `ex201_ex204_frontend_bf16_semantic_20260605_0924` proved the truth table exactly matches `DAZ + 2^x + BF16 RNE + FTZ + canonical NaN`.
- 2026-06-05: Exact candidates generated and officially rechecked:
  - `structural_exp_mant_pair_case`: `1599/15/23985`, still best.
  - `semantic_exp_pair_casez_full`: `1590/16/25440`; lower area but one extra level.
  - `semantic_exp_sign_exp_casez_full`: `1623/17/27591`.
  - `semantic_exp_pair_casez_runs`: `1961/19/37259`.
- 2026-06-05: Official `evaluate.py` recheck passed for all 4 candidates.
- 2026-06-05: Aggressive run `ex201_ex204_frontend_aggressive_semantic_20260605_1139` targeted 50% ADP reduction (`<=11992`) but did not improve current best.
  - `parallel_full_case_hint`: exact, unchanged `1599/15/23985`.
  - `synth_no_yosys_abc`: exact but worse `2627/21/55167`.
  - `semantic_int_frac`: exact manual `2^x = 2^integer * 2^fraction` split, `1596/16/25536`; area lower by 3 nodes but delay worsened.
  - Official `evaluate.py` recheck passed for all 3 aggressive candidates.

Failed or Avoided Directions:
- Avoid generating more `exp_mant_pair_case` variants without a new exponent formula.
- `casez` saturation and mantissa run compression are exact but hurt delay on this case.
- The best current frontend seed remains a structural pair table, now annotated with the verified `2^x` semantic meaning.
- The integer/fraction semantic split is not enough by itself; it needs a lower-delay way to combine integer exponent and fraction LUT to beat the pair table.

## 2026-06-05 Bitlogic Follow-Up

Run: `ex201_ex204_frontend_bitlogic_20260605_1412`

Consolidated result:
- `candidates.csv` contains all exact/synthesized current-run candidates.
- Best current-run candidate: `ex201_bf16_exp2_exp_mant_pair_no_defaults`, `1599/15/23985`.
- This ties the previous best but does not improve it.

Tried and excluded:
- Shared BDD Verilog, two variable orders: exact but worse (`32338` to `35301` ADP).
- Exp/mant hi-lo XOR factoring: exact but worse `2309/20/46180`.
- Grouped constants and special NaN ternary variants: closest was `1601/15/24015`, still worse than `1599/15/23985`.
- Hybrid mantissa run compression and selected low-exponent run compression: exact, sometimes lower area (`1595`), but always raised delay to `16` or worse.
- Fixed comparator run encoding: exact after generator fix, but best was `1595/16/25520`.
- Positive-default and sign/exp split variants: exact but worse.
- Sign-exp integer/fraction formula RTL: exact `1790/16/28640`; formula control and LUTs cost more than the direct pair table.

Current interpretation:
- The true semantic is known, but the best frontend seed remains the direct exp/mant pair table.
- To improve without backend optimization, the next direction needs a semantic formula that preserves the 15-level critical path, not another source-level compression of low-variation mantissa ranges.

## 2026-06-05 Semantic Deep Follow-Up

Run: `ex201_ex204_frontend_semantic_deep_20260605_1525`

Improved result:
- `ex201_bf16_exp2_hybrid_pair_table_bit9_mode`: exact, official recheck `1595/15/23925`.
- Previous best was `1599/15/23985`, so this saves 4 nodes at the same 15-level delay.

Tried and excluded:
- Pair-bit exp-mode full variant was exact but worse overall: `1568/16/25088`.
- Multi-bit additions around bit 9 only tied or worsened the single-bit result.

Current interpretation:
- A single output-bit override can let Yosys remove a few nodes while preserving
  the 15-level path.
- Combining multiple such overrides did not compound the gain.

## 2026-06-05 Semantic Continue Follow-Up

Run: `ex201_ex204_frontend_semantic_continue_20260605_1732`

New best:
- `ex201_bf16_exp2_hilo3_field_mode_bits_3_bh1`
- Official `evaluate.py` recheck: `1647/14/23058`
- Previous best: `1595/15/23925`

Effective direction:
- A mantissa hi/lo field seed did not reduce area versus the previous pair-table
  seed, but overriding output bit 3 with a shallow 1-bit predicate reduced the
  critical path from 15 to 14 levels.

Tried and excluded:
- Plain hi/lo field/word variants were exact, but best plain result was still
  worse than the previous seed.
- Delta-pair variants were exact but delay 18-19, not competitive.
- bit2 also reached 14 levels, but had higher ADP than bit3.
- bit3 combinations with bits 4/5/8/10/14/15 raised delay or area enough to lose.

### Additional continuation pass

- Tried separate field factoring, field bitplanes, critical-bit BDD, casez-run
  bit predicates, and comparator-threshold bit predicates.
- None improved over `1647/14/23058`.
- The closest separated-field candidates returned to 15-16 delay, so the
  existing bit3 hi/lo predicate remains the best frontend seed for ex201.

### Formula/PLA continuation pass

- Tried full-input casez run override for output bit 3:
  `hilo3_field_mode_fullruns_bits_3`, exact but much worse `2188/16/35008`.
- Tried per-sign-exp mantissa PLA/cube covers for output bit 3:
  best was `hilo3_field_mode_bits_3_pla`, exact `1754/15/26310`.
- Interpretation: PLA reduces the selected-bit critical path versus ordinary
  table logic, but its extra area loses ADP.  The current best remains
  `hilo3_field_mode_bits_3_bh1`, official `evaluate.py` `1647/14/23058`.

## 2026-06-14 bf16-extra-r2 continuation outcome

Campaign: `ex204_ex299_frontend_continuation_20260614_1216`, agent `bf16-extra-r2`.

- Tried field residual, mant64 delta-pair residual, and exact decision-graph bit3 residual families under `student/work/ex204_ex299_frontend_continuation_20260614_1216/bf16-extra-r2/ex201/`.
- Official `evaluate.py` OK candidates: `ex201_r2_sepfield_e2m4s0_b3bh2` `1708/16/27328`, `ex201_r2_delta_m64h2_b3bh2` `1660/19/31540`, and `ex201_r2_dg_delta_m64h2_b3` `1743/18/31374`.
- No candidate improved current frontend ADP `23058`; do not repeat these e2/m4, mant64-hilo2, or exact DG bit3 shapes unchanged.
- Shard CSVs: `student/frontend_campaigns/campaigns/ex204_ex299_frontend_continuation_20260614_1216/agent_shards/bf16-extra-r2/`.
