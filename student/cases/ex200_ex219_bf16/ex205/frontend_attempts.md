# ex205 BF16 Frontend Attempts

Hypothesis: `bf16_log10`

Current best snapshot:
- variant: `ex205_r97_sf_e3m3_b14_15_abc_g_aig`
- class: `field_decode_selected_bits`
- ADP/reference ratio: `1.507383`

Semantic direction:
- High priority: current best is structural and far from reference.
- Start from log-style special cases: negative normal -> canonical NaN, zero -> negative infinity, positive infinity -> positive infinity.
- Try exponent arithmetic for the power-of-two component plus a 128-entry mantissa LUT for `log10(1.mant)`.
- Check whether multiplying the exponent component by an approximate constant creates simple piecewise ranges.

Attempt log:
- 2026-06-05: Created tracking note.

Failed or Avoided Directions:
- Do not spend time on more full sign/exp/mant tables unless they expose constant ranges.

## 2026-06-06 batch update

See `student/cases/ex200_ex219_bf16/ex205-209/frontend_attempts.md` and run `ex205_ex209_frontend_bf16_semantic_20260606_0946` for the latest semantic/frontend results and curated seeds.

## 2026-06-13 fpbf-existing-r19 third-case candidate

Run ID: `ex200_ex299_frontend_refgap_round19_20260612_2346`, agent `fpbf-existing-r19`.

- Method signature: `ex205|bf16_log10_field_decode|current_frontend_seed_module_rename|shared sign/exponent/mantissa field decode plus sign predicate|yosys_abc_g_and|DAZ+log10+BF16_RNE+FTZ+canonical_NaN|grouped word output with selected-bit overrides`.
- Candidate Verilog: `student/work/ex200_ex299_frontend_refgap_round19_20260612_2346/fpbf-existing-r19/ex205/verilog/ex205_bf16_log10_sep_fields_abcgand_r19.v`.
- Official AIG: `student/work/ex200_ex299_frontend_refgap_round19_20260612_2346/fpbf-existing-r19/ex205/official_eval/ex205_sep_fields_abc_g_and/ex205.aig`.
- Evaluate log: `student/work/ex200_ex299_frontend_refgap_round19_20260612_2346/fpbf-existing-r19/ex205/logs/ex205_sep_fields_abc_g_and.evaluate.py.log`.
- Outcome: official `evaluate.py --case ex205` OK at `4463/17/75871`, a valid nonwinning row versus the current frontend `71104` ADP.
- Next action: do not repeat this `abc -g AND` flow variant; useful follow-up needs a smaller field decode or materially different log10 sharing.

## 2026-06-13 bf16-r22 round22 outcome

Run ID: `ex200_ex299_frontend_refgap_round22_20260613_0218`, agent `bf16-r22`.

- Dossier: `student/work/ex200_ex299_frontend_refgap_round22_20260613_0218/bf16-r22/ex205/dossiers/ex205_round22_dossier.md`.
- Method signatures:
  - `ex205|bf16_log10_expbase_delta_residual|hilo5_delta|shared positive exponent base plus mantissa delta|yosys_abc_g_AND|DAZ_log10_BF16_RNE_FTZ_canonical_NaN|grouped word output`.
  - `ex205|bf16_log10_field_decode_selected_sign|sep_fields_e2_m5_s0_manual_bit15|shared sign exponent mantissa field decode plus manual sign predicate|yosys_abc_g_AND|DAZ_log10_BF16_RNE_FTZ_canonical_NaN|separate output fields`.
- Official `evaluate.py` rows:
  - `ex205_bf16_log10_log10_exp_base_delta_hilo5`: `4929/23/113367`.
  - `ex205_bf16_log10_sep_fields_e2_m5_s0_manual_bits_15`: `4818/22/105996`.
- Candidate/evaluation rows: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round22_20260613_0218/agent_shards/bf16-r22/candidates.csv` and `evaluation_results.csv`.
- Outcome: both candidates are official equivalent but nonwinning versus current frontend `71104`; record this as further evidence that deeper log10 base/delta and coarser field partitions are not useful frontend paths.

## 2026-06-13 coordinator-bf16-r25 mantissa grouping probe

Run ID: `ex200_ex299_frontend_refgap_round25_20260613_0506`, agent `coordinator-bf16-r25`.

- Dossier: `student/work/ex200_ex299_frontend_refgap_round25_20260613_0506/coordinator-bf16-r25/ex205/notes/ex205_coordinator_bf16_r25_dossier.md`.
- Hypothesis: materially different BF16 log10 mantissa hi/lo word grouping might expose better shared decode/default/override balance than current `hilo3`, without replaying archived `hilo4`.
- Method signatures:
  - `ex205|bf16_log10_mantissa_grouping_probe|hilo2_word_mode|shared_sign_exp_decode_mantissa_hi2_word_defaults|yosys_aigmap_official_evaluate_py|DAZ_log10_BF16_RNE_FTZ_canonical_NaN|full_word_mantissa_hilo2`.
  - `ex205|bf16_log10_mantissa_grouping_probe|hilo5_word_mode|shared_sign_exp_decode_mantissa_hi5_word_defaults|yosys_aigmap_official_evaluate_py|DAZ_log10_BF16_RNE_FTZ_canonical_NaN|full_word_mantissa_hilo5`.
- Official `evaluate.py` rows:
  - `ex205_bf16_log10_hilo2_word_mode`: `4536/19/86184`.
  - `ex205_bf16_log10_hilo5_word_mode`: `4847/21/101787`.
- Outcome: both are official equivalent but worse than current frontend `71104` and reference `47128`; do not repeat `hilo2`/`hilo5` word grouping as-is.
- Next action: useful follow-up needs a smaller field-sharing formula or a genuinely different log10 semantic representation, not more hi/lo granularity sweeps.

## 2026-06-14 round97 deepstruct logmodel

Run ID: `frontend_gt15_deepstruct_round97_20260614_0724`, agent `sub-bf16-logmodel-r97`.

- Dossier: `student/frontend_campaigns/campaigns/frontend_gt15_deepstruct_round97_20260614_0724/agent_shards/sub-bf16-logmodel-r97/dossiers/ex205_dossier.md`.
- Winning frontend candidate: `ex205_r97_sf_e3m3_b14_15_abc_g_aig`.
- Method signature: `ex205|selected_output_extra_bit|sep_fields_e3_m3_s0_bits_14_15_bh1|current-style field decode plus non-sign selected bit14 and sign bit15 predicates|abc_g_aig|DAZ_log10_BF16_RNE_FTZ_canonical_NaN|separate output fields`.
- Verilog: `student/work/frontend_gt15_deepstruct_round97_20260614_0724/sub-bf16-logmodel-r97/ex205/verilog/ex205_r97_sf_e3m3_b14_15_abc_g_aig.v`.
- AIG: `student/work/frontend_gt15_deepstruct_round97_20260614_0724/sub-bf16-logmodel-r97/ex205/aigs/ex205_r97_sf_e3m3_b14_15_abc_g_aig.aig`.
- Evaluate log: `student/work/frontend_gt15_deepstruct_round97_20260614_0724/sub-bf16-logmodel-r97/ex205/logs/ex205_r97_sf_e3m3_b14_15_abc_g_aig.evaluate.py.log`.
- Outcome: official `evaluate.py` OK at `4440/16/71040`, improving the frontend best `71104` by `64` ADP.  It is still above the `<1.5x` target `70691`.
- Next action: do not repeat e3/m3 selected-bit overlays as-is.  The remaining gap is too small for another source-copy tweak but still needs a materially different log10 exponent/mantissa formula or shared correction representation.

## 2026-06-14 arith-unary-r2 continuation

Run ID: `ex204_ex299_frontend_continuation_20260614_1216`, agent `arith-unary-r2`.

- Families tested: BF16 output-grouped truth structure with shared sign/exp high-bit run trees plus nested low-bit LUT; BF16 odd-positive/semantic delta variants.
- Official best from this shard: `ex205_bf16_output_grouped_low8_hi3_abc_g_aig` at `4898/16/78368`.
- Outcome: nonwinning versus frontend `4440/16/71040`; semantic delta best was `4544/22/99968`, and `ex205_bf16_log10_odd_pos_fields_e3_m3` was official `NOT_EQUIV`.
