# ex204 BF16 Frontend Attempts

Hypothesis: `bf16_log2`

Current best snapshot:
- variant: `exp_mant_delta_pair`
- class: `structural_exact`
- ADP/reference ratio: `1.990909`

Semantic direction:
- High priority: structural best is far from reference.
- Negative normal inputs should be canonical NaN; positive zero likely maps to negative infinity.
- Try semantic `log2(x) = exponent_offset + log2(1.mant)` with signed exponent arithmetic and a 128-entry mantissa LUT.
- Look for passthrough/simple integer-output regions around powers of two.

Attempt log:
- 2026-06-05: Created tracking note.  Next attempt should be a hand-guided BF16 log2 semantic RTL, not more delta-pair factoring.
- 2026-06-05: Run `ex201_ex204_frontend_bf16_semantic_20260605_0924` proved the truth table exactly matches `DAZ + log2(x) + BF16 RNE + FTZ + canonical NaN`.
- 2026-06-05: Tested true semantic split `log2(x) = integer_exponent_offset + log2(1.mant)`.
  - `semantic_log2_grouped_subdelta_base_arith_full`: `1455/38/55290`; lowest area but high delay from arithmetic/addition.
  - `semantic_log2_grouped_subdelta_base_case_full`: `1559/36/56124`.
  - `semantic_log2_grouped_xordelta_pair_full`: `1797/24/43128`; XOR avoids the adder delay but still loses to old delta-pair.
  - `semantic_log2_positive_runs`: `2407/19/45733`.
  - `structural_exp_mant_delta_pair`: `1679/18/30222`, still best.
- 2026-06-05: Official `evaluate.py` recheck passed for all 7 generated ex204 candidates.
- 2026-06-05: Manual no-generator semantic RTL attempt `ex204_bf16_log2_manual_q18_semantic`:
  - Handwritten structure: `k = exp - 127`, Q18 `log2(1 + mant/128)` 128-entry LUT, signed fixed-point add, priority/shift/RNE conversion back to BF16.
  - Official `evaluate.py` result: exact equivalent, `1205/70/84350`.
  - Interpretation: area is lower than all previous ex204 candidates, but conversion logic creates very high delay, so ADP is worse.
- 2026-06-05: Aggressive run `ex201_ex204_frontend_aggressive_semantic_20260605_1139` targeted 50% ADP reduction (`<=15111`) but did not improve current best.
  - `parallel_full_case_hint`: exact, unchanged `1679/18/30222`.
  - `synth_no_yosys_abc`: exact but worse `2873/24/68952`.
  - `manual_field_formula`: exact field-level `log2`, `1254/48/60192`.
  - `manual_field_q13`: exact shared-Q13 correction LUT, `1167/51/59517`.
  - `xordelta_direct_grouped`: exact, `1677/19/31863`; 2 nodes lower than current best but one extra delay level.
  - Official `evaluate.py` recheck passed for all 5 aggressive candidates.

Failed or Avoided Directions:
- Broad delta-pair and positive-default variants already underperform; do not repeat without a new semantic split.
- Grouping log2 mantissa delta patterns reduces source size and area, but the added class decoder/arithmetic depth hurts ADP.
- Full semantic fixed-point log2 conversion is exact and compact in area, but its priority encoder, variable shift, and rounding path are too deep without backend optimization.
- To improve this case without backend optimization, the next useful direction needs to preserve the old delta-pair delay near 18 while reducing the base/delta table area.
- Direct grouping of identical XOR-delta patterns saves only 2 nodes and costs one delay level; the separate class decoder variant and direct grouped variant are both worse than the old exp/mant delta pair.

## 2026-06-05 Bitlogic Follow-Up

Run: `ex201_ex204_frontend_bitlogic_20260605_1412`

Consolidated result:
- `candidates.csv` contains all exact/synthesized current-run candidates.
- Best current-run candidate: `ex204_bf16_log2_exp_mant_delta_pair_no_defaults`, `1679/18/30222`.
- This ties the previous best but does not improve it.

Tried and excluded:
- Shared BDD Verilog, two variable orders: exact but worse (`39644` and `40299` ADP).
- Bitplane sign-exp mode: exact but worse `2842/16/45472`.
- Positive-only XOR delta: exact but worse `1683/19/31977`.
- Default-NaN positive-domain table: exact but worse `2099/18/37782`.
- Separate sign/exp/mant field defaults: exact but worse `2384/19/45296`.
- Removing defaults from the old delta-pair structure did not change QoR.
- XOR-delta base mantissa sweep:
  `m=1,2,4,8,16,32,64,96,127` all lost to the original `m=0` base.

Current interpretation:
- The `exp_mant_delta_pair` structure is locally stable under source-level
  cleanup and base selection.
- Further frontend improvement likely requires a new log2 reassembly that keeps
  the old 18-level delay, not additional base/delta table reshaping.

## 2026-06-05 Semantic Deep Follow-Up

Run: `ex201_ex204_frontend_semantic_deep_20260605_1525`

Improved result:
- `ex204_bf16_log2_delta_pair_bit2_override`: exact, official recheck `1657/18/29826`.
- Previous best was `1679/18/30222`, so this saves 22 nodes at the same 18-level delay.

Tried and excluded:
- Single-bit delta-pair override found bit 2 as the only clear improvement.
- Multi-bit combinations around bit 2 tied or worsened; no area reduction below `1657` was found.
- Pair-bit exp-mode was exact but worse (`2209/18/39762`).

Current interpretation:
- The old delta-pair structure can be improved slightly by isolating one output
  bit, but additional bit overrides do not combine constructively.
- The broader semantic `log2` arithmetic forms remain lower-area but too deep.

## 2026-06-05 Semantic Continue Follow-Up

Run: `ex201_ex204_frontend_semantic_continue_20260605_1732`

New best:
- `ex204_bf16_log2_delta_pair_first_hilo3_bits_14_bh3`
- Official `evaluate.py` recheck: `1597/17/27149`
- Previous best: `1657/18/29826`

Effective direction:
- Kept the semantic delta-pair idea, but split the delta table by mantissa
  hi/lo (`hi=3`) instead of using a flat 128-entry delta case.
- Overriding output bit 14 with a shallow bit predicate reduced delay from 18
  to 17 and gave the largest ex204 frontend improvement in this pass.

Tried and excluded:
- Ordinary hi/lo word/field tables had 16-level delay but too much area.
- mode-base and mantissa-64 base delta variants were exact but did not beat
  first-base hi=3.
- bit2, bit9, and bit11 were useful locally, but combinations with bit14 lost
  the 17-level/low-area balance.

### Additional continuation pass

- Tried separate field factoring, split-sign positive-domain factoring,
  critical-bit BDD, casez-run/comparator bit predicates, and semantic arithmetic
  base for `log2`.
- The arithmetic-base delta-pair was exact and reduced area as low as
  `1529/18/27522`, but it could not preserve the 17-level path, so it stayed
  behind `1597/17/27149`.
- BDD bit14 was close at `1600/17/27200`, but still did not beat the current
  bit14 hi/lo predicate.

### Formula/PLA continuation pass

New best:
- `ex204_bf16_log2_log2_arithbase_delta_hilo3_formula_bits_11_14`
- Official `evaluate.py` recheck: `1545/17/26265`
- Previous best: `1597/17/27149`

Effective direction:
- Kept the lower-area semantic arithmetic base:
  `base = BF16(exp - 127)` for positive inputs, with special zero/inf/NaN
  handling and a mantissa delta table.
- Replaced output bits 11 and 14 with hand-derived exp/mant formulas:
  bit14 is determined by the log2 sign/exponent boundary around positive
  `exp=125..128`; bit11 is determined by special powers and `mant != 0` at
  positive `exp=125` and `exp=127`.
- This preserved the 17-level path while saving 52 nodes versus the previous
  best.

Tried and excluded:
- Formula bit14 on the old delta-pair seed was exact and slightly better
  (`1596/17/27132`) but lost to the arithmetic-base formula seed.
- Adding bit9 formula or full-run predicates usually raised delay to 18 or 19.
- Per-sign-exp PLA was exact; best close result
  `log2_arithbase_delta_hilo3_bits_9_11_14_pla` was `1587/17/26979`, still
  worse than the new formula best.
- Other arithbase delta splits (`full`, `hilo1`, `hilo2`, `hilo4`, `hilo5`,
  `hilo6`) did not beat `hilo3`.
- Equality-style formula rewrites were exact and lowered area as far as
  `1528/18/27504`, but the 18-level delay kept them behind the current
  `1545/17/26265` best.

## 2026-06-12 mixed-r12 diagnostic

Run ID: `ex200_ex299_frontend_refgap_round12_20260612_2015`, agent `mixed-r12`.

- Method signature: `ex204|bf16_log2_nonreplay_semantic_residual|diagnostic_only|shared_exp_mant_decode_without_sparse_copy|not_run|DAZ_log2_BF16_RNE_FTZ|blocker`.
- Diagnostic artifact: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round12_20260612_2015/agent_shards/mixed-r12/fp_bf_unary_diagnostics.csv`.
- Evidence: `positive_total_mode_exceptions=21293`, `sign_exp_full_groups=257`, `negative_canonical_nan=32640`.
- Outcome: no candidate generated. This blocks another sparse/source-copy residual attempt; useful next work needs a new shallow log2 correction formula that preserves the current 17-level path.

## 2026-06-13 fpbf-existing-r19 continuation candidate

Run ID: `ex200_ex299_frontend_refgap_round19_20260612_2346`, agent `fpbf-existing-r19`.

- Method signature: `ex204|bf16_log2_arithbase_delta_correction|mantissa_hilo_grouped_lut_module_rename|shared exponent/mantissa delta base plus selected output-bit correction|yosys_abc_g_aig|DAZ+log2+BF16_RNE+FTZ+canonical_NaN|grouped word output with selected-bit overrides`.
- Candidate Verilog: `student/work/ex200_ex299_frontend_refgap_round19_20260612_2346/fpbf-existing-r19/ex204/verilog/ex204_bf16_log2_arithbase_hilo3_abcgaig_r19.v`.
- Official AIG: `student/work/ex200_ex299_frontend_refgap_round19_20260612_2346/fpbf-existing-r19/ex204/official_eval/ex204_arithbase_hilo3_abc_g_aig/ex204.aig`.
- Evaluate log: `student/work/ex200_ex299_frontend_refgap_round19_20260612_2346/fpbf-existing-r19/ex204/logs/ex204_arithbase_hilo3_abc_g_aig.evaluate.py.log`.
- Outcome: official `evaluate.py --case ex204` OK at `1511/17/25687`, a valid nonwinning row versus the current frontend `25670` ADP.
- Next action: do not repeat this synth-flow variant; useful follow-up still needs a lower-delay log2 correction formula or materially different sharing.

## 2026-06-13 bf16-r22 round22 outcome

Run ID: `ex200_ex299_frontend_refgap_round22_20260613_0218`, agent `bf16-r22`.

- Dossier: `student/work/ex200_ex299_frontend_refgap_round22_20260613_0218/bf16-r22/ex204/dossiers/ex204_round22_dossier.md`.
- Method signatures:
  - `ex204|bf16_log2_arithbase_delta_correction|hilo3_formulaeq_bits_11_14|shared exponent base plus equality selected-bit formulas|yosys_abc_g_AND|DAZ_log2_BF16_RNE_FTZ_canonical_NaN|grouped word output`.
  - `ex204|bf16_log2_arithbase_delta_correction|hilo3_fullrun_bits_11_14|shared exponent base plus full-run selected-bit predicates|yosys_abc_g_AND|DAZ_log2_BF16_RNE_FTZ_canonical_NaN|grouped word output`.
- Official `evaluate.py` rows:
  - `ex204_bf16_log2_log2_arithbase_delta_hilo3_formulaeq_bits_11_14`: `1550/18/27900`.
  - `ex204_bf16_log2_log2_arithbase_delta_hilo3_fullruns_bits_11_14`: `1570/18/28260`.
- Candidate/evaluation rows: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round22_20260613_0218/agent_shards/bf16-r22/candidates.csv` and `evaluation_results.csv`.
- Outcome: both candidates are official equivalent but nonwinning versus current frontend `25670`; record the equality/full-run selected-bit detour as low-value unless a future version preserves the 17-level path.

## 2026-06-13 mixed-r24 frontend improvement

Run ID: `ex200_ex299_frontend_refgap_round24_20260613_0435`, agent `mixed-r24`.

- Candidate: `ex204_r24_bf16_log2_log2_arithbase_delta_hilo3_bits_11_14_bh2_abc_g_gates`.
- Method signature: `ex204|bf16_log2_arithbase_delta_correction|hilo3_bits_11_14_bh2|shared exponent/mantissa delta base plus selected output-bit correction|abc_g_gates|DAZ_log2_BF16_RNE_FTZ_canonical_NaN|grouped word output`.
- Official `evaluate.py` result: `1536/16/24576`, improving frontend best from `25670`; reference remains `15180`.
- Paths:
  - Verilog: `student/work/ex200_ex299_frontend_refgap_round24_20260613_0435/mixed-r24/ex204/verilog/ex204_r24_bf16_log2_log2_arithbase_delta_hilo3_bits_11_14_bh2.v`
  - AIG: `student/work/ex200_ex299_frontend_refgap_round24_20260613_0435/mixed-r24/ex204/aigs/ex204_r24_bf16_log2_log2_arithbase_delta_hilo3_bits_11_14_bh2_abc_g_gates.aig`
  - Evaluate log: `student/work/ex200_ex299_frontend_refgap_round24_20260613_0435/mixed-r24/ex204/logs/ex204_r24_bf16_log2_log2_arithbase_delta_hilo3_bits_11_14_bh2_abc_g_gates.evaluate.py.log`
  - Round24 merged results: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round24_20260613_0435/results/best_improvements.csv`
- Outcome: the `bh2` selected-bit variant preserves a 16-level path and is now the best frontend seed, but still above reference. Future work should start from this candidate and search for area reduction without losing the 16-level delay.

## 2026-06-13 mixed-r25 nonwinning follow-up

Run ID: `ex200_ex299_frontend_refgap_round25_20260613_0506`, agent `mixed-r25`.

- Dossier: `student/work/ex200_ex299_frontend_refgap_round25_20260613_0506/mixed-r25/ex204/notes/dossier.md`.
- Method families tested:
  - `ex204|bf16_log2_arithbase_delta_bit9_extension|hilo3 selected-bit correction adding bit9 to round24 bh2 seed|shared exponent base plus selected output-bit correction tables|abc_g_aig|DAZ_log2_BF16_RNE_FTZ_canonical_NaN|grouped word output`: official `1567/17/26639`.
  - `ex204|bf16_log2_arithbase_delta_bh3_rebalance|hilo3 selected-bit correction with wider bit grouping|shared exponent base plus selected output-bit correction tables|abc_g_aig|DAZ_log2_BF16_RNE_FTZ_canonical_NaN|grouped word output`: official `1511/17/25687`.
  - `ex204|bf16_log2_arithbase_delta_hilo4_recut|hilo4 arithmetic-base delta with round24 selected-bit grouping|shared exponent base plus selected output-bit correction tables|abc_g_aig|DAZ_log2_BF16_RNE_FTZ_canonical_NaN|grouped word output`: official `1549/17/26333`.
- Shard rows: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round25_20260613_0506/agent_shards/mixed-r25/candidates.csv` and `evaluation_results.csv`.
- Outcome: all candidates are official equivalent but nonwinning versus frontend `1536/16/24576`; adding bit9 or changing `bh`/`hilo` recuts loses the 16-level path. Next action should derive a new bit11/14 formula that preserves delay 16 or reduce area inside the exact round24 `bh2` source without changing its selected-bit cut.

## 2026-06-13 mixed-r26 official rows

Run ID: `ex200_ex299_frontend_refgap_round26_20260613_0539`, agent `mixed-r26`.

- Dossier: `student/work/ex200_ex299_frontend_refgap_round26_20260613_0539/mixed-r26/ex204/notes/dossier.md`.
- Official rows:
  - `ex204_r26_bf16_log2_log2_arithbase_delta_hilo3_formula_bits_11_14_abc_g_gates`: `1534/17/26078`.
  - `ex204_r26_bf16_log2_log2_arithbase_delta_hilo3_bits_11_14_pla_abc_g_gates`: `1528/17/25976`.
  - `ex204_r26_bf16_log2_log2_arithbase_delta_hilo3_bits_11_14_runs_abc_g_gates`: `1528/17/25976`.
- Failed render row: `ex204_r26_bf16_log2_log2_arithbase_delta_hilo3_bits_11_14_cmp_abc_g_gates` was not generated because the renderer has no `cmp` mode for `log2_arithbase_delta`.
- Outcome: official rows are equivalent but nonwinning versus frontend `1536/16/24576`. PLA/runs save a few area nodes but add one delay level, so the round24 `bh2` gate-flow source remains best.

## 2026-06-14 arith-unary-r2 continuation

Run ID: `ex204_ex299_frontend_continuation_20260614_1216`, agent `arith-unary-r2`.

- Families tested: BF16 output-grouped truth structure with shared sign/exp high-bit run trees plus nested low-bit LUT; BF16 semantic hi/lo field/delta variants.
- Official best from this shard: `ex204_bf16_output_grouped_low10_hi3_abc_g_aig` at `2077/16/33232`.
- Outcome: all rows were official equivalent but nonwinning versus frontend `1536/16/24576`; the semantic/delta family best was `2332/16/37312`.
