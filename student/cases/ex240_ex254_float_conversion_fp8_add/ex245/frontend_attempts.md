# ex245 Frontend Attempts

Function hypothesis: E5M2FN packed FP8 add, high byte + low byte.

Reference row: area/delay/ADP/score = `325/34/11050/16575.0`.

Current known best: `ex245_semantic_add_gap_class_synth_preset_aig`,
`701/34/23834`, ratio `2.156923`.

## Attempt Log

- 2026-06-12 Round9 pre-candidate (`fp8-wide-r9`):
  - Dossier path: `student/work/ex200_ex299_frontend_refgap_round9_20260612_1851/fp8-wide-r9/ex245/notes/high_level_dossier.md`.
  - Method signatures planned:
    - `ex245|E5M2FN packed add|split_threshold_quant|shared sorted field decode and threshold-band RNE quantizer|round9_yosys|exact_e5m2fn_add_high_plus_low|same_diff_threshold_outputs`
    - `ex245|E5M2FN packed add|residual_mask_overlay|shared active-region predicates plus output-bit residual masks|round9_yosys|exact_e5m2fn_add_high_plus_low|max_passthrough_mask_outputs`
  - Planned outcome check: official `evaluate.py` per AIG; no success claimed before area/delay/ADP and paths are recorded.
  - Next action: run after ex244 and ex240 unless an earlier candidate beats reference and the coordinator redirects.
- 2026-06-12 Round9 evaluated (`fp8-wide-r9`):
  - Tested method_signature `ex245|E5M2FN packed add|split_threshold_quant|shared sorted field decode and threshold-band RNE quantizer|round9_yosys_default|exact_e5m2fn_add_high_plus_low|same_diff_threshold_outputs`.
  - Official result: `evaluate.py` OK, `2652/192/509184`.
  - Paths: Verilog `student/work/ex200_ex299_frontend_refgap_round9_20260612_1851/fp8-wide-r9/ex245/verilog/ex245_round9_split_threshold_quant.v`; AIG `student/work/ex200_ex299_frontend_refgap_round9_20260612_1851/fp8-wide-r9/ex245/aigs/ex245_round9_split_threshold_quant_default.aig`; log `student/work/ex200_ex299_frontend_refgap_round9_20260612_1851/fp8-wide-r9/ex245/logs/ex245_round9_split_threshold_quant_default.official_evaluate.log`.
  - Outcome: exact but far worse than current frontend `701/34/23834` and reference `325/34/11050`; no improvement.
  - Next action: do not repeat threshold-band quantization for E5M2 add; the current small-gap class formula remains the better source shape.
- 2026-06-08: exact semantic match for E5M2FN add with RNE and canonical
  `8'h7f` NaN.
- Tried and excluded:
  - direct pair-delta tables: exact but area around 4k.
  - decoded 35-bit magnitude add + normalizer: exact but delay around 120.
  - full-output and sorted-key BDDs: lower delay but still high area/ADP.
  - small-gap local normalizer: low area (`602`) but delay around 70.
- Best structure: small-gap class formula.  Same-sign gap >3 and diff-sign gap
  >4 passthrough `maxc`; active small gaps use `(gap,max_sig,min_sig)` class
  formula with `min_eff` boundary guards.

## 2026-06-13 Round25 fp8-r25

- Campaign: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round25_20260613_0506/agent_shards/fp8-r25/`.
- Tested method family: `ex245|E5M2FN packed add|direct active-region magnitude table|shared sorted field decode sign gap sig and direct same/diff active output magnitudes|yosys_multi_official_evaluate|exact_e5m2fn_add_high_plus_low|active_region_magnitude_override`.
- Official `evaluate.py` rows: `2/2` OK.
- Best observed: `ex245_r25_direct_active_add_synth_preset_aig`, `2205/38/83790`, improved frontend `0`, beats reference `0`.
- Paths: Verilog `student/work/ex200_ex299_frontend_refgap_round25_20260613_0506/fp8-r25/ex245/verilog/ex245_r25_direct_active_add_synth_preset_aig.v`; AIG `student/work/ex200_ex299_frontend_refgap_round25_20260613_0506/fp8-r25/ex245/aigs/ex245_r25_direct_active_add_synth_preset_aig.aig`; log `student/work/ex200_ex299_frontend_refgap_round25_20260613_0506/fp8-r25/ex245/logs/ex245_r25_direct_active_add_synth_preset_aig.evaluate.py.log`.
- Next action: `extend only if method_signature changes materially; otherwise move to a different representation family`.

## 2026-06-13 Round25 fp8-wide-r25

- Campaign: `student/frontend_campaigns/campaigns/ex240_ex299_frontend_gt2_round25_20260613_0531/agent_shards/fp8-wide-r25/`.
- Tested method families: `3` candidates across `1` materially different representations.
- Official `evaluate.py` rows: `3/3` OK.
- Best observed: `ex245_r25w_pair_delta_maxmin_synth_preset_aig`, `4048/33/133584`, improved frontend `0`, beats reference `0`.
- Paths: Verilog `student/work/ex240_ex299_frontend_gt2_round25_20260613_0531/fp8-wide-r25/ex245/verilog/ex245_r25w_pair_delta_maxmin_synth_preset_aig.v`; AIG `student/work/ex240_ex299_frontend_gt2_round25_20260613_0531/fp8-wide-r25/ex245/aigs/ex245_r25w_pair_delta_maxmin_synth_preset_aig.aig`; log `student/work/ex240_ex299_frontend_gt2_round25_20260613_0531/fp8-wide-r25/ex245/logs/ex245_r25w_pair_delta_maxmin_synth_preset_aig.evaluate.py.log`.
- Next action: `try source-level arithmetic factoring only if it changes semantic coordinates or sharing materially`.


## 2026-06-13 Round26 fp8-r26

- Campaign: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round26_20260613_0539/agent_shards/fp8-r26/`.
- Best official candidate in this shard: `` `//`.
- Current frontend baseline used by this worker: `23834`; reference ADP `11050`.
- Outcome: improved frontend `0`; beats reference `0`.
- Evidence: ``.
- Next action: Debug non-equivalence or choose a different representation family.


## 2026-06-13 Round26 fp8-r26

- Campaign: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round26_20260613_0539/agent_shards/fp8-r26/`.
- Best official candidate in this shard: `ex245_r26_gap_class_synth_preset_aig` `701/34/23834`.
- Current frontend baseline used by this worker: `23834`; reference ADP `11050`.
- Outcome: improved frontend `0`; beats reference `0`.
- Evidence: `student/work/ex200_ex299_frontend_refgap_round26_20260613_0539/fp8-r26/ex245/logs/ex245_r26_gap_class_synth_preset_aig.evaluate.py.log`.
- Next action: Try a new high-level representation; do not repeat this r26 source as-is.

## 2026-06-13 Round74 sub-fp8-addhyp-r74

- Campaign: `student/frontend_campaigns/campaigns/frontend_source_parallel_round74_20260613_1439/`.
- Dossier: `student/work/frontend_source_parallel_round74_20260613_1439/sub-fp8-addhyp-r74/ex245/notes/high_level_dossier.md`.
- Source-only families tried: active same/diff table mux, selected-magnitude helper function, and inactive-key-gated same/diff table form around the E5M2 small-gap class source.
- Official `evaluate.py` rows: `3/3` equivalent.
- Best observed: `ex245_ex245_selected_mag_function_repo_yosys`, `734/34/24956`.
- Current frontend target used by this shard: `22077`; reference `11050`; improved frontend `0`; beats reference `0`.
- Evidence: `student/frontend_campaigns/campaigns/frontend_source_parallel_round74_20260613_1439/agent_shards/sub-fp8-addhyp-r74/evaluation_results.csv`.
- Next action: selected-mag/function factoring does not reduce area enough; future attempts should change the active-region residual representation instead of wrapping the same same/diff tables.

## 2026-06-13 Round75 sub-fp8-mid-r75

- Campaign: `student/frontend_campaigns/campaigns/frontend_source_parallel_round75_20260613_1507/`.
- Dossier: `student/work/frontend_source_parallel_round75_20260613_1507/sub-fp8-mid-r75/ex245/notes/high_level_dossier.md`.
- Source-only families tried: explicit zero-pair shell around the small-gap class formula, and PO-clustered exponent/mantissa output tail over the gap-class source.
- Method signatures:
  - `ex245|E5M2FN packed add high byte plus low byte|explicit zero-pair shell around small-gap class formula|shared sorted E5M2 field decode and same/diff active-region class formulas|repo_yosys_frontend_default|official_evaluate|full_word`
  - `ex245|E5M2FN packed add high byte plus low byte|PO-clustered exponent/mantissa output over gap-class source|shared small-gap same/diff residual with separated output clusters|repo_yosys_frontend_default|official_evaluate|full_word`
- Official `evaluate.py` rows: `2/2` equivalent. Best observed: `ex245_r75_po_clustered_gapclass`, `751/34/25534`.
- Current frontend/current-target/reference used by this shard: `22077` / `17319` / `11050`; improved frontend `0`; beats current target `0`; beats reference `0`.
- Evidence: shard CSV `student/frontend_campaigns/campaigns/frontend_source_parallel_round75_20260613_1507/agent_shards/sub-fp8-mid-r75/evaluation_results.csv`; best log `student/work/frontend_source_parallel_round75_20260613_1507/sub-fp8-mid-r75/ex245/logs/ex245_r75_po_clustered_gapclass.evaluate.py.log`.
- Next action: zero-pair and PO-cluster wrappers do not help; change the active-region residual representation instead of adding shell logic.

## 2026-06-13 Round76 sub-fp8-mid-r76

- Campaign: `student/frontend_campaigns/campaigns/frontend_source_parallel_round76_20260613_1706/`.
- Frontend/source-only families tried:
  - `gap_class_semantic`: small-gap class formula using ordered_abs, gap, same_sign, and saturation boundary.
  - `gap4_normalizer_semantic`: gap-limited local normalizer over shared sorted sign/magnitude fields.
- Official `evaluate.py` rows: `2/2` equivalent.
- Best observed: `ex245_r76_gap_class_semantic`, `734/35/25690`.
- Current frontend/current-target/reference used by this shard: `22077` / `17319` / `11050`; improved frontend `0`; beats current target `0`; beats reference `0`.
- Evidence: shard CSV `student/frontend_campaigns/campaigns/frontend_source_parallel_round76_20260613_1706/agent_shards/sub-fp8-mid-r76/evaluation_results.csv`; best log `student/work/frontend_source_parallel_round76_20260613_1706/sub-fp8-mid-r76/ex245/logs/ex245_r76_gap_class_semantic.evaluate.py.log`.
- Next action: gap-class remains the better family, but still does not close the target gap; future attempts should change the active-region residual representation rather than add zero/shell/output wrappers.


## 2026-06-13 17:45:06 +0800 Round77 sub-fp8-mid-source-r77

- Campaign: `student/frontend_campaigns/campaigns/frontend_source_parallel_round77_20260613_1733/`.
- Dossier: `student/work/frontend_source_parallel_round77_20260613_1733/sub-fp8-mid-source-r77/ex245/notes/high_level_dossier.md`.
- Frontend/source-only families tried: keep-boundary semantic predicates, grouped sign/magnitude output vector wrapper, per-bit output decomposition, and flattened/staged source form around the current exact high-level source.
- Method signatures: see shard CSV `student/frontend_campaigns/campaigns/frontend_source_parallel_round77_20260613_1733/agent_shards/sub-fp8-mid-source-r77/evaluation_results.csv`.
- Official `evaluate.py` rows: `3/4` equivalent.
- Best observed: `ex245_r77_grouped_vector` `727/34/24718`.
- Current frontend/current-target/reference used by this shard: `22077` / `17319` / `11050`; improved frontend `0`; beats current target `0`; beats reference `0`.
- Evidence: `student/work/frontend_source_parallel_round77_20260613_1733/sub-fp8-mid-source-r77/ex245/logs/ex245_r77_grouped_vector.evaluate.py.log`.
- Next action: do not repeat these r77 source-boundary/output-grouping variants unchanged; pursue a genuinely smaller semantic residual or predicate basis.


## 2026-06-13 17:48:28 +0800 Round77 keep-annotation correction sub-fp8-mid-source-r77

- Campaign: `student/frontend_campaigns/campaigns/frontend_source_parallel_round77_20260613_1733/`.
- Dossier: `student/work/frontend_source_parallel_round77_20260613_1733/sub-fp8-mid-source-r77/ex245/notes/high_level_dossier.md`.
- Frontend/source-only families tried: keep-boundary semantic predicates, grouped sign/magnitude output vector wrapper, per-bit output decomposition, and flattened/staged source form around the current exact high-level source.
- Method signatures: see shard CSV `student/frontend_campaigns/campaigns/frontend_source_parallel_round77_20260613_1733/agent_shards/sub-fp8-mid-source-r77/evaluation_results.csv`.
- Official `evaluate.py` rows: `4/4` equivalent.
- Best observed: `ex245_r77_grouped_vector` `727/34/24718`.
- Current frontend/current-target/reference used by this shard: `22077` / `17319` / `11050`; improved frontend `0`; beats current target `0`; beats reference `0`.
- Evidence: `student/work/frontend_source_parallel_round77_20260613_1733/sub-fp8-mid-source-r77/ex245/logs/ex245_r77_grouped_vector.evaluate.py.log`.
- Next action: do not repeat these r77 source-boundary/output-grouping variants unchanged; pursue a genuinely smaller semantic residual or predicate basis.


## 2026-06-13 18:05:18 +0800 Round78 sub-fp8-mid-enum-r78

- Campaign: `student/frontend_campaigns/campaigns/frontend_source_parallel_round78_20260613_1744/`.
- Dossier: `student/work/frontend_source_parallel_round78_20260613_1744/sub-fp8-mid-enum-r78/ex245/notes/high_level_dossier.md`.
- Frontend/source-only families tried: sparse semantic-wire keep, grouped helper 4+4 output split, grouped helper field output split, flattened staged core, and ex249-only tiny residual predicates keyed by existing semantic wires.
- Method signatures: see shard CSV `student/frontend_campaigns/campaigns/frontend_source_parallel_round78_20260613_1744/agent_shards/sub-fp8-mid-enum-r78/evaluation_results.csv`.
- Official `evaluate.py` rows: `4/4` equivalent.
- Best observed: `ex245_r78_split_44_output` `727/34/24718`.
- Current frontend/current-target/reference used by this shard: `22077` / `17319` / `11050`; improved frontend `0`; beats current target `0`; beats reference `0`.
- Evidence: `student/work/frontend_source_parallel_round78_20260613_1744/sub-fp8-mid-enum-r78/ex245/logs/ex245_r78_split_44_output.evaluate.py.log`.
- Next action: source-boundary/output splitting did not close the target gap unless noted above; continue only with a materially smaller semantic residual or predicate basis.

## 2026-06-14 12:34:04 +0800 fp8-semantic-r2

- Campaign: `student/frontend_campaigns/campaigns/ex204_ex299_frontend_continuation_20260614_1216/agent_shards/fp8-semantic-r2/`.
- Dossier: `student/work/ex204_ex299_frontend_continuation_20260614_1216/fp8-semantic-r2/ex245/notes/high_level_dossier.md`.
- Families tried: direct integer add/sub normalizer and split same/diff sorted-magnitude BDD; both compared with `default_and` and `abc_g_aig` frontend Yosys flows.
- Official `evaluate.py` rows: `4/4` equivalent. Best observed: `ex245_r2_split_bdd_interleave_abc_g_aig` `1187/36/42732`; direct arithmetic best was `1630/125/203750`.
- Current frontend/reference used by this shard: `23834` / `11050`; improved frontend `0`; beats reference `0`.
- Evidence: `student/frontend_campaigns/campaigns/ex204_ex299_frontend_continuation_20260614_1216/agent_shards/fp8-semantic-r2/evaluation_results.csv`.
- Next action: do not repeat direct integer normalizer or split BDD; next useful ex245 work needs a smaller active-region residual than the current small-gap class family.

## 2026-06-14 13:00:55 +0800 fp8-output-plane-r3

- Campaign: `student/frontend_campaigns/campaigns/ex204_ex299_frontend_continuation_20260614_1216/agent_shards/fp8-output-plane-r3/`.
- Dossier: `student/work/ex204_ex299_frontend_continuation_20260614_1216/fp8-output-plane-r3/ex245/notes/high_level_dossier.md`.
- Frontend-only family tried: same/diff semantic decision graph that selects inactive passthrough or active residual before output assembly, preserving the sorted field decode and small-gap class functions.
- Official `evaluate.py`: `ex245_r3_same_diff_decision_graph` OK `724/34/24616`.
- Current frontend/reference used by this shard: `23834` / `11050`; improved frontend `0`; beats reference `0`.
- Evidence: Verilog `student/work/ex204_ex299_frontend_continuation_20260614_1216/fp8-output-plane-r3/ex245/verilog/ex245_r3_same_diff_decision_graph.v`; AIG `student/work/ex204_ex299_frontend_continuation_20260614_1216/fp8-output-plane-r3/ex245/aigs/ex245_r3_same_diff_decision_graph.aig`; log `student/runs/float_fp8/ex204_ex299_frontend_continuation_20260614_1216/fp8-output-plane-r3/ex245/logs/ex245_r3_same_diff_decision_graph.evaluate.py.log`.
- Next action: do not repeat this same/diff decision split unchanged; it preserves delay but adds area versus the current gap-class source.
