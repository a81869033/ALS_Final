# ex218 BF16 Frontend Attempts

Hypothesis: `bf16_reciprocal_cube`

Current best snapshot:
- variant: `value_case`
- class: `structural_exact`
- ADP/reference ratio: `2.155493`

Semantic direction:
- Odd function: use sign symmetry.
- Normal-domain exponent formula should be `out_exp = 508 - 3*exp + delta`.
- Use a 128-entry mantissa LUT for reciprocal-cube mantissa and explicit underflow/overflow guards.
- This is one of the highest priority BF16 cases because current best is a direct value case.

Attempt log:
- 2026-06-05: Created tracking note.  First real attempt should replace `value_case` with arithmetic exponent RTL.
- 2026-06-06: Run `ex215_ex219_frontend_bf16_semantic_20260606_1447` confirmed exact `bf16_reciprocal_cube` semantics.  Best seed is `legacy_value_case_bits_4_bh1_fix3`, `458/15/6870`, a small improvement from `6945` ADP.
- 2026-06-06: Deep run `ex216_ex218_ex219_frontend_bf16_deep_20260606_1600` improved best to `legacy_value_case_bits_15_cmp_caseattrs_fix9`, `467/13/6071`.  The key was extracting output bit15 with a comparator predicate, reducing delay from 15 to 13.
- 2026-06-06: Deep2 run `ex215_ex219_frontend_bf16_deep2_20260606_1726` did not improve beyond `467/13/6071`.

Failed or Avoided Directions:
- Do not repeat `value_case` or sign-pair structural tables as candidates.
- The warning above is revised: the old value-case seed is still the best frontend base after semantic attempts; keep only the curated value-case plus bit4 override as a seed.  Semantic arithmetic, positive-symmetry, delta, split-sign, and default-expression exception variants all lost; default-expression exception was especially bad at `19506/24/468144`.
- Hand reciprocal-cube guarded semantic RTL was exact but too deep (`469/22/10318`).  Manual sign extraction was exact but did not beat the comparator-coded bit15 predicate.  Mixed bit15+bit4/bit9 overrides regressed.

## 2026-06-12 mixed-r12 diagnostic

Run ID: `ex200_ex299_frontend_refgap_round12_20260612_2015`, agent `mixed-r12`.

- Method signature: `ex218|bf16_reciprocal_cube_nonreplay_semantic|diagnostic_only|odd_sign_decode_plus_exponent_formula_probe|not_run|DAZ_reciprocal_cube_BF16_RNE_FTZ|blocker`.
- Diagnostic artifact: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round12_20260612_2015/agent_shards/mixed-r12/fp_bf_unary_diagnostics.csv`.
- Evidence: `positive_total_mode_exceptions=10764`, `negative_sign_flip_positive=32513`, `negative_canonical_nan=127`.
- Outcome: no candidate generated. Strong sign symmetry is already exposed; the blocker is the missing shallow reciprocal-cube mantissa/exponent formula rather than another value-case or sign-copy table.
- Manual sign casez became exact after fixing case order, but still lost (`467/14/6538`).  Additional bit15 plus exponent high-bit overlays regressed.

## 2026-06-12 fpbf-alt-r18 round18 diagnostic

Run ID: `ex200_ex299_frontend_refgap_round18_20260612_2321`, agent `fpbf-alt-r18`.

- Method signature: `ex218|bf16_reciprocal_cube_sign_exp_range_patch|diagnostic_blocker|odd_sign_shell_plus_exp_mant_hi_patch_and_bitplane_density|not_run|DAZ_reciprocal_cube_BF16_RNE_FTZ|blocker`.
- Dossier: `student/work/ex200_ex299_frontend_refgap_round18_20260612_2321/fpbf-alt-r18/ex218/dossiers/ex218_semantic_dossier.md`.
- Evidence artifact: `student/work/ex200_ex299_frontend_refgap_round18_20260612_2321/fpbf-alt-r18/ex218/diagnostics/ex218_round18_blocker_evidence.md`.
- Shard rows: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round18_20260612_2321/agent_shards/fpbf-alt-r18/failed_hypotheses.csv`, `evaluation_results.csv`, and `shared_structure_report.csv`.
- Outcome: `BLOCKED_NO_CANDIDATE`; no Verilog/AIG candidate was claimed. The odd-sign shell is exact for `32512` negative-normal samples, but the positive-normal reciprocal-cube region still has `10849` distinct output words and the best tested `exp+mant_hi6` dominant patch leaves `5424` exceptions over `32512` samples.
- Next action: only revisit with a shallow reciprocal-cube mantissa/exponent formula that beats the existing value-case/comparator structure without re-materializing a mantissa table.

## 2026-06-12 fpbf-existing-r19 file-first candidate

Run ID: `ex200_ex299_frontend_refgap_round19_20260612_2346`, agent `fpbf-existing-r19`.

- Method signature: `ex218|bf16_reciprocal_cube_existing_seed_field_selector|legacy_value_case_field_selector|decoded_sign_exp_mant_selector|yosys_abc_g_aig|DAZ_reciprocal_cube_BF16_RNE_FTZ|full_word_value_case`.
- Candidate Verilog: `student/work/ex200_ex299_frontend_refgap_round19_20260612_2346/fpbf-existing-r19/ex218/verilog/ex218_bf16_reciprocal_cube_field_selector_abcgaig_r19.v`.
- Official AIG: `student/work/ex200_ex299_frontend_refgap_round19_20260612_2346/fpbf-existing-r19/ex218/official_eval/ex218_field_selector_abc_g_aig/ex218.aig`.
- Evaluate log: `student/work/ex200_ex299_frontend_refgap_round19_20260612_2346/fpbf-existing-r19/ex218/logs/ex218_field_selector_abc_g_aig.evaluate.py.log`.
- Outcome: official `evaluate.py --case ex218` OK at `457/13/5941`, improving the registered frontend seed `6071` ADP but not beating backend/reference.
- Next action: continue only with a shallow reciprocal-cube formula or materially different sharing; this still remains value-case dominated.

## 2026-06-13 bf16-r22 round22 outcome

Run ID: `ex200_ex299_frontend_refgap_round22_20260613_0218`, agent `bf16-r22`.

- Dossier: `student/work/ex200_ex299_frontend_refgap_round22_20260613_0218/bf16-r22/ex218/dossiers/ex218_round22_dossier.md`.
- Method signatures:
  - `ex218|bf16_reciprocal_cube_guarded_semantic|normal_first_guarded_mant_lut|shared odd sign and guarded exponent zone decode|yosys_abc_g_AND|DAZ_reciprocal_cube_BF16_RNE_FTZ|semantic fields`.
  - `ex218|bf16_reciprocal_cube_delta_selected_bit|mode_hilo4_bit15_cmp|shared delta pair plus comparator selected sign bit|yosys_abc_g_AND|DAZ_reciprocal_cube_BF16_RNE_FTZ|grouped word output`.
- Official `evaluate.py` rows:
  - `ex218_bf16_reciprocal_cube_hand_recip_cube_guard_lut_normal_first`: `477/24/11448`.
  - `ex218_bf16_reciprocal_cube_delta_pair_mode_hilo4_bits_15_cmp`: `530/14/7420`.
- Candidate/evaluation rows: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round22_20260613_0218/agent_shards/bf16-r22/candidates.csv` and `evaluation_results.csv`.
- Outcome: both candidates are official equivalent but nonwinning versus current frontend `5941`; guarded semantic RTL is too deep, and the delta-pair bit15 comparator still loses to the current value-case field selector.

## 2026-06-13 mixed-r25 nonwinning follow-up

Run ID: `ex200_ex299_frontend_refgap_round25_20260613_0506`, agent `mixed-r25`.

- Dossier: `student/work/ex200_ex299_frontend_refgap_round25_20260613_0506/mixed-r25/ex218/notes/dossier.md`.
- Official rows:
  - `ex218_r25_bf16_recip_cube_delta_pair_mode_hilo4_abc_g_aig`: `543/14/7602`.
  - `ex218_r25_bf16_recip_cube_sep_fields_e3_m3_s3_abc_g_gates`: `905/15/13575`.
- Shard rows: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round25_20260613_0506/agent_shards/mixed-r25/candidates.csv` and `evaluation_results.csv`.
- Outcome: both are official equivalent but lose to frontend `457/13/5941`; field recut and mode-hilo4 delta are not competitive. Next action remains a genuinely shallow reciprocal-cube exponent/mantissa formula, not more field/value-case table reshaping.

## 2026-06-13 mixed-r26 official rows

Run ID: `ex200_ex299_frontend_refgap_round26_20260613_0539`, agent `mixed-r26`.

- Dossier: `student/work/ex200_ex299_frontend_refgap_round26_20260613_0539/mixed-r26/ex218/notes/dossier.md`.
- Official rows:
  - `ex218_r26_bf16_recip_cube_hand_recip_cube_guard_lut_normal_first_abc_g_gates`: `473/24/11352`.
  - `ex218_r26_bf16_recip_cube_delta_pair_mode_hilo4_bits_8_15_bh2_abc_g_gates`: `598/15/8970`.
- Shard rows: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round26_20260613_0539/agent_shards/mixed-r26/candidates.csv` and `evaluation_results.csv`.
- Outcome: both rows are official equivalent but nonwinning versus frontend `457/13/5941`. Guarded semantic RTL is still too deep; selected-bit delta recut also loses to the value-case field selector.

## 2026-06-14 arith-unary-r2 continuation

Run ID: `ex204_ex299_frontend_continuation_20260614_1216`, agent `arith-unary-r2`.

- Families tested: BF16 output-grouped truth structure with shared high-bit run trees plus nested low-bit LUT; BF16 reciprocal-cube separate-field and delta-pair semantic variants.
- Official best from this shard: `ex218_bf16_reciprocal_cube_delta_pair_mode_hilo4` at `546/14/7644`.
- Outcome: all rows were official equivalent but nonwinning versus frontend `457/13/5941`; output-grouped best was `1183/15/17745`.
