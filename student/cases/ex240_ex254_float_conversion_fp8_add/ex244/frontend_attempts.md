# ex244 Frontend Attempts

Function hypothesis: E4M3FN FP8 hypot, `sqrt(abs(high)^2 + abs(low)^2)`.

Reference row: area/delay/ADP/score = `356/12/4272/6408.0`.

Current known best:
- Source: `student/results/current_best_by_case.csv` and the run result CSVs.
- Variant: `ex244_semantic_hypot_delta_maxeff_bdd_expfirst_synth_preset_aig`
- QoR: `301/34/10234`
- Reference ADP: `4272`
- Ratio: `2.395599`
- Classification: `semantic_exact`

## Diagnostics To Run

- Verify width, support, constant bits, bit entropy, and special input classes.
- Infer whether this is conversion or packed fp8 add.
- The small reference ADP suggests a compact conversion/remap or very shallow
  arithmetic structure; try semantic remapping before structural tables.

## Attempt Log

- 2026-06-12 Round9 pre-candidate (`fp8-wide-r9`):
  - Dossier path: `student/work/ex200_ex299_frontend_refgap_round9_20260612_1851/fp8-wide-r9/ex244/notes/high_level_dossier.md`.
  - Method signatures planned:
    - `ex244|E4M3FN packed hypot|lane_factored_delta_mask|shared max/min field decode plus output-bit residual masks|round9_yosys|exact_e4m3fn_hypot_abs_high_low|max_passthrough_mask_outputs`
    - `ex244|E4M3FN packed hypot|sqsum_threshold_quant|shared square-sum decode and squared midpoint thresholds|round9_yosys|exact_e4m3fn_hypot_abs_high_low|threshold_quantized_full_output`
  - Planned outcome check: official `evaluate.py` per AIG; no success claimed before area/delay/ADP and paths are recorded.
  - Next action: generate ex244 first because it has the worst assigned frontend/reference ratio.
- 2026-06-12 Round9 evaluated (`fp8-wide-r9`):
  - Tested method_signature `ex244|E4M3FN packed hypot|lane_factored_delta_mask|shared max/min field decode plus output-bit residual masks|round9_yosys_default|exact_e4m3fn_hypot_abs_high_low|max_passthrough_mask_outputs`.
  - Official result: `evaluate.py` OK, `665/33/21945`.
  - Paths: Verilog `student/work/ex200_ex299_frontend_refgap_round9_20260612_1851/fp8-wide-r9/ex244/verilog/ex244_round9_lane_factored_delta_mask.v`; AIG `student/work/ex200_ex299_frontend_refgap_round9_20260612_1851/fp8-wide-r9/ex244/aigs/ex244_round9_lane_factored_delta_mask_default.aig`; log `student/work/ex200_ex299_frontend_refgap_round9_20260612_1851/fp8-wide-r9/ex244/logs/ex244_round9_lane_factored_delta_mask_default.official_evaluate.log`.
  - Outcome: exact but worse than current frontend `301/34/10234` and reference `356/12/4272`; no improvement.
  - Next action: do not continue residual-mask output grouping as-is; a useful follow-up would need to reduce the shared predicate table area while preserving delay near the current max-eff delta source.
- Confirmed hypot semantics.  Input signs are ignored; NaN canonicalizes to
  `8'h7f`; output sign bit is always zero.
- `semantic_hypot_mag_table`: exact full 7-bit magnitude pair table; best
  `2420/22/53240`.
- `semantic_hypot_max_delta`: output is `max(abs(a),abs(b)) + delta`; reduced
  area to `1536` but delay rose to `34`, ADP `52224`.
- `semantic_hypot_gap_delta`: bypasses correction when exponent gap is at
  least 3; new best `1532/33/50556`.
- `semantic_hypot_run_delta`: per-max min-threshold runs reduced source size
  but delay stayed high; best `1630/35/57050`, not retained as best.
- 2026-06-08 deep structure: proved exact correction can be reduced from
  `{max_code,min_code}` to `(exp_gap,max_sig,min_sig)` plus saturation cap.
  `semantic_hypot_sig_gap_delta` reached `344/36/12384`; threshold-run source
  improved to `320/37/11840`, a 76.6% ADP reduction versus the previous
  `50556` best.
- Parallel OR-of-condition delta bits were exact but did not beat threshold
  runs (`338/36/12168` best).  Limited Yosys synthflow on the threshold source
  also did not beat `320/37/11840`.
- 2026-06-08 follow-up:
  - Full shared-BDD sources reached `695/22/15290`; lower delay but worse ADP.
  - BDD synthflow improved delay to `21` but still worse ADP (`712/21/14952`).
  - Direct result table for small exponent gaps was exact but much larger
    (`1142/33/37686` best).
  - Delta-only BDD was not equivalent as written because `gap/max_sig/min_sig`
    alone is insufficient for all saturated cases without adding max exponent,
    which collapses back toward the direct-result table.
- 2026-06-08 deeper follow-up:
  - Exact delta BDD with key `{max_eff,gap[1:0],max_sig,min_sig}` fixes the
    saturation-context issue while keeping the output as `maxc + delta`.
  - The exp-first order reached `301/34/10234`, improving the previous
    `320/37/11840` threshold seed by about 13.6% ADP.
  - A max-eff threshold-pack source was exact but worse (`351/40/14040` best);
    keeping max exponent in the packed threshold table raised area without
    enough delay improvement.
  - Single-seed broader Yosys synthflow on the max-eff BDD did not beat the
    generator result; best synthflow row was `307/34/10438`.

## Next Maintenance Items

- Area is now below reference area (`301` vs `356`), but delay remains high
  (`34` vs `12`).  Future work should target a shallower boolean form for the
  three delta bits or reduce the max/min comparator plus delta-decode critical
  path.

## 2026-06-12 23:59 +0800 Round19 Checkpoint

- Agent/run: `fp8-existing-r19` /
  `ex200_ex299_frontend_refgap_round19_20260612_2346`.
- Source basis: copied current frontend-best Verilog
  `student/work/ex240_ex244_frontend_fp8_magbdd_deltaeff_20260608_1401/ex244/verilog/ex244_semantic_hypot_delta_maxeff_bdd_expfirst.v`.
- Method signature:
  `ex244|E4M3FN packed hypot|max-eff delta BDD small-gap source rewrite|shared abs max/min decode plus explicit small-gap delta gate|yosys_default_abc_and_aigmap|exact_e4m3fn_hypot_abs_high_low|max-plus-delta_outputs`.
- Material change: replaced the source `gap_full < 4'd3` delta gate with an
  explicit small-gap predicate over `gap_full[3:2]` and `gap_full[1:0]`, plus a
  named `delta_raw`; this is not an exact replay of the max-eff delta BDD
  source.
- Official result: `evaluate.py` OK, `329/38/12502`.
- Paths: Verilog
  `student/work/ex200_ex299_frontend_refgap_round19_20260612_2346/fp8-existing-r19/ex244/verilog/ex244_round19_gapdecode_small.v`;
  AIG
  `student/work/ex200_ex299_frontend_refgap_round19_20260612_2346/fp8-existing-r19/ex244/aigs/ex244.aig`;
  evaluate log
  `student/work/ex200_ex299_frontend_refgap_round19_20260612_2346/fp8-existing-r19/ex244/logs/ex244_round19_gapdecode_small_default.official_evaluate.log`.
- Outcome: equivalent but nonwinning versus current frontend `301/34/10234`
  and reference `356/12/4272`; do not repeat this exact small-gap decode.

## 2026-06-13 Round22 float-fp8-r22 completion checkpoint

- Candidate: `ex244_r22_maxeff_delta_bdd_replay`.
- method_signature: `ex244|E4M3FN packed hypot|round22 max-eff delta BDD replay|shared abs max/min decode max_eff gap sig4 and delta BDD bits|yosys_synth_flatten_abc_g_aig_official_evaluate|exact_e4m3fn_hypot_abs_high_low|max_plus_delta_outputs`.
- Official `evaluate.py` result: `OK 301/34/10234`; improved frontend `0`; beats reference `0`.
- Paths: Verilog `student/work/ex200_ex299_frontend_refgap_round22_20260613_0218/float-fp8-r22/ex244/verilog/ex244_r22_maxeff_delta_bdd_replay.v`; AIG `student/work/ex200_ex299_frontend_refgap_round22_20260613_0218/float-fp8-r22/ex244/aigs/ex244_r22_maxeff_delta_bdd_replay.aig`; official log `student/work/ex200_ex299_frontend_refgap_round22_20260613_0218/float-fp8-r22/ex244/logs/ex244_r22_maxeff_delta_bdd_replay.official_evaluate.log`; diagnostic `student/work/ex200_ex299_frontend_refgap_round22_20260613_0218/float-fp8-r22/ex244/notes/round22_ex244_diagnostic.md`.
- Outcome: equivalent but low-value; it ties the current frontend best and remains above reference ADP `4272`. Future work should avoid max-eff BDD replay or small-gap gating and target a shallower delta-bit formula or max/min critical-path reduction.

## 2026-06-13 Round25 fp8-r25

- Campaign: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round25_20260613_0506/agent_shards/fp8-r25/`.
- Tested method family: `ex244|E4M3FN packed hypot|gap-split maxeff delta functions|shared max/min eff sig decode with separate gap0 gap1 gap2 delta functions|yosys_multi_official_evaluate|exact_e4m3fn_hypot_abs_high_low|max_plus_delta_gap_split`.
- Official `evaluate.py` rows: `2/2` OK.
- Best observed: `ex244_r25_gap_split_delta_synth_preset_aig`, `333/34/11322`, improved frontend `0`, beats reference `0`.
- Paths: Verilog `student/work/ex200_ex299_frontend_refgap_round25_20260613_0506/fp8-r25/ex244/verilog/ex244_r25_gap_split_delta_synth_preset_aig.v`; AIG `student/work/ex200_ex299_frontend_refgap_round25_20260613_0506/fp8-r25/ex244/aigs/ex244_r25_gap_split_delta_synth_preset_aig.aig`; log `student/work/ex200_ex299_frontend_refgap_round25_20260613_0506/fp8-r25/ex244/logs/ex244_r25_gap_split_delta_synth_preset_aig.evaluate.py.log`.
- Next action: `extend only if method_signature changes materially; otherwise move to a different representation family`.

## 2026-06-13 Round25 fp8-worst-r25

- Campaign: `student/frontend_campaigns/campaigns/ex240_ex299_frontend_gt2_round25_20260613_0531/agent_shards/fp8-worst-r25/`.
- Families tested:
  - truth-derived shared ROBDD over interleaved high/low FP8 operand bits;
  - current frontend-best source replay with alternate Yosys/AIG mapping.
- Official `evaluate.py` rows: `3/3` OK.
- Best observed: `ex244_resynth_abc_g_aig`, `312/37/11544`; worse than current frontend `301/34/10234` and reference `4272`.
- BDD fallback: `695/22/15290`; lower delay but area too high.
- Paths: summary `student/frontend_campaigns/campaigns/ex240_ex299_frontend_gt2_round25_20260613_0531/agent_summaries/fp8-worst-r25.md`; evaluation CSV `student/frontend_campaigns/campaigns/ex240_ex299_frontend_gt2_round25_20260613_0531/agent_shards/fp8-worst-r25/evaluation_results.csv`; dossier `student/work/ex240_ex299_frontend_gt2_round25_20260613_0531/fp8-worst-r25/ex244/notes/high_level_dossier.md`.
- Outcome: no frontend improvement. Next action is a shallower max/min plus delta-bit formula rather than max-eff BDD, gap-split replay, or whole-function BDD.


## 2026-06-13 Round26 fp8-r26

- Campaign: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round26_20260613_0539/agent_shards/fp8-r26/`.
- Best official candidate in this shard: `` `//`.
- Current frontend baseline used by this worker: `10234`; reference ADP `4272`.
- Outcome: improved frontend `0`; beats reference `0`.
- Evidence: ``.
- Next action: Debug non-equivalence or choose a different representation family.


## 2026-06-13 Round26 fp8-r26

- Campaign: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round26_20260613_0539/agent_shards/fp8-r26/`.
- Best official candidate in this shard: `ex244_r26_threshold_packed_synth_preset_aig` `286/39/11154`.
- Current frontend baseline used by this worker: `10234`; reference ADP `4272`.
- Outcome: improved frontend `0`; beats reference `0`.
- Evidence: `student/work/ex200_ex299_frontend_refgap_round26_20260613_0539/fp8-r26/ex244/logs/ex244_r26_threshold_packed_synth_preset_aig.evaluate.py.log`.
- Next action: Try a new high-level representation; do not repeat this r26 source as-is.

## 2026-06-13 Round60 sub-ex244-r60

- Campaign: `student/frontend_campaigns/campaigns/frontend_source_parallel_round60_20260613_0825/`.
- Recording-guided frontend-only/source-only mixed structures tried:
  - gapcofactor/saturation split around the existing max-eff delta structure;
  - mixed tail LUT using shared special/max/gap predicates plus residual carry/low-bit LUT.
- Official `evaluate.py` rows: `24/24` equivalent.
- Best observed: `ex244_r60_gapcofactor_satsplit_field_abc_g_aig`, `304/34/10336`.
- Mixed-source best: `ex244_r60_mixed_tail_lut_raw_synth_preset`, `378/33/12474`.
- Current frontend best remains `285/32/9120`; reference `4272`.
- Evidence: `student/frontend_campaigns/campaigns/frontend_source_parallel_round60_20260613_0825/agent_shards/sub-ex244-r60/evaluation_results.csv`.
- Outcome: no frontend-best improvement. Do not repeat gapcofactor satsplit or mixed tail LUT unchanged; next progress needs a lower-area shallow delta-bit formula or a different max/min critical-path source shape.

## 2026-06-13 Round62 sub-fp8-addhyp-r62

- Campaign: `student/frontend_campaigns/campaigns/frontend_source_parallel_round62_20260613_0907/`.
- Source-only families tried: delta-bit saturation sharing and selected residual/cofactor style FP8 hypot source variants.
- Official `evaluate.py` rows: equivalent rows included in `results/evaluation_results.csv`.
- Best observed: `ex244_ex244_r62_delta_bit_sat_shared_synth_preset_raw`, `311/32/9952`.
- Current frontend best remains `285/32/9120`; reference `4272`.
- Evidence: `student/frontend_campaigns/campaigns/frontend_source_parallel_round62_20260613_0907/agent_shards/sub-fp8-addhyp-r62/evaluation_results.csv`.
- Outcome: no frontend-best improvement. Do not repeat delta-bit saturation sharing unchanged; next attempt should reduce area while preserving the `32`-level delay or shorten the max/min compare plus delta decode path.

## 2026-06-13 10:17:05 +0800 Round64 sub-fp8-add-alt-r64

- Campaign: `student/frontend_campaigns/campaigns/frontend_source_parallel_round64_20260613_1004/`.
- Dossier: `student/work/frontend_source_parallel_round64_20260613_1004/sub-fp8-add-alt-r64/ex244/notes/high_level_dossier.md`.
- Source-only families tried:
  - squared-magnitude threshold classes using `min_sig^2` under shared max/min/gap decode;
  - ratio-of-min-to-max/leading-class compressed table;
  - non-BDD sig/gap threshold control as a contrast candidate.
- Best official candidate: `ex244_ex244_r64_sqmin_threshold_bins_abc_g_aig_raw`, `400/36/14400`.
- method_signature: `ex244|fp8_source_restructure|ex244_r64_sqmin_threshold_bins|squared_magnitude_threshold_classes_using_min_sig_2_with_shared_max_min_gap_decode|abc_g_aig|raw|official_evaluate|full_word`.
- Paths: Verilog `student/work/frontend_source_parallel_round64_20260613_1004/sub-fp8-add-alt-r64/ex244/ex244_r64_sqmin_threshold_bins/verilog/ex244_r64_sqmin_threshold_bins.v`; AIG `student/work/frontend_source_parallel_round64_20260613_1004/sub-fp8-add-alt-r64/ex244/ex244_r64_sqmin_threshold_bins/aigs/ex244_ex244_r64_sqmin_threshold_bins_abc_g_aig_raw.aig`; log `student/work/frontend_source_parallel_round64_20260613_1004/sub-fp8-add-alt-r64/ex244/ex244_r64_sqmin_threshold_bins/logs/ex244_ex244_r64_sqmin_threshold_bins_abc_g_aig_raw.evaluate.py.log`.
- Official result: `evaluate.py` OK, but no frontend improvement versus `9120` and no reference win versus `4272`. The ratio/leading-class compressed table was non-equivalent, so the compressed ratio key lost required information.
- Shard CSVs: `student/frontend_campaigns/campaigns/frontend_source_parallel_round64_20260613_1004/agent_shards/sub-fp8-add-alt-r64/`.
- Next action: do not repeat squared-min or ratio-leading compressed delta coordinates unchanged; focus on a different max/min compare path or a smaller exact delta predictor.

## 2026-06-13 Round74 sub-fp8-addhyp-r74

- Campaign: `student/frontend_campaigns/campaigns/frontend_source_parallel_round74_20260613_1439/`.
- Dossier: `student/work/frontend_source_parallel_round74_20260613_1439/sub-fp8-addhyp-r74/ex244/notes/high_level_dossier.md`.
- Source-only families tried: field-level magnitude compare/decode, small-gap key gating, case-increment saturation tail, and combinations of those around the exact max-plus-delta structure.
- Official `evaluate.py` rows: `6/6` equivalent.
- Best observed: `ex244_ex244_field_compare_decode_repo_yosys`, `328/35/11480`.
- Current frontend target used by this shard: `9120`; reference `4272`; improved frontend `0`; beats reference `0`.
- Evidence: `student/frontend_campaigns/campaigns/frontend_source_parallel_round74_20260613_1439/agent_shards/sub-fp8-addhyp-r74/evaluation_results.csv`.
- Next action: field-level compare is not enough; a useful follow-up needs a lower-area delta predictor or a genuinely shorter max/min plus correction critical path.

## 2026-06-13 15:07 +0800 Round75 sub-fp8-worst-r75

- Campaign: `student/frontend_campaigns/campaigns/frontend_source_parallel_round75_20260613_1507/`.
- Dossier: `student/work/frontend_source_parallel_round75_20260613_1507/sub-fp8-worst-r75/ex244/notes/high_level_dossier.md`.
- Source-only families tried: selected output-cluster grafts from alternate exact source families, keeping the compact semantic shell and rebuilding complementary PO clusters before Yosys.
- Official `evaluate.py` equivalent rows: `2/2`.
- Best observed: `ex244_r75_delta_high5_graft` `325/37/12025`.
- Current frontend/reference used by this shard: `9120` / `4272`.
- Outcome: no frontend-best improvement.
- Evidence: shard CSV `student/frontend_campaigns/campaigns/frontend_source_parallel_round75_20260613_1507/agent_shards/sub-fp8-worst-r75/evaluation_results.csv`.
- Next action: avoid repeating these exact output-cluster grafts; useful follow-up needs a genuinely smaller shared predicate or shorter semantic shell.


## 2026-06-13 17:23:59 +0800 Round76 sub-fp8-worst-r76

- Campaign: `frontend_source_parallel_round76_20260613_1706`.
- Dossier: `student/work/frontend_source_parallel_round76_20260613_1706/sub-fp8-worst-r76/ex244/notes/high_level_dossier.md`.
- Source-only families tried:
  - `ex244_r76_field_pair_magcase`: `ex244|E4M3FN_hypot_can_be_represented_by_sorted_finite_magnitudes|one_vector_case_over_sorted_7-bit_magnitude_pair|sign-free_sorted_magnitude_descriptor_shared_by_all_output_bits|repo_yosys_frontend_default|exact_e4m3fn_hypot_abs_high_low|full_word`.
  - `ex244_r76_maxeff_gap_sig_desc`: `ex244|E4M3FN_hypot_delta_depends_on_max_eff_gap_and_significand_pair|one_vector_case_over_max_eff/gap/sig_descriptor|shared_max/min_decode_with_max_eff_saturation_context|repo_yosys_frontend_default|exact_e4m3fn_hypot_abs_high_low|full_word`.
- Best official candidate: `ex244_r76_maxeff_gap_sig_desc` `1487/36/53532`.
- Current frontend/reference used by this shard: `9120` / `4272`.
- Outcome: frontend improvement `0`; beats reference `0`.
- Evidence: shard CSV `student/frontend_campaigns/campaigns/frontend_source_parallel_round76_20260613_1706/agent_shards/sub-fp8-worst-r76/evaluation_results.csv`.
- Next action: do not expand these descriptor tables further if they remain area dominated; look for smaller boundary formulas.

## 2026-06-13 17:44:36 +0800 Round77 sub-fp8-worst-source-r77

- Campaign: `frontend_source_parallel_round77_20260613_1733`.
- Dossier: `student/work/frontend_source_parallel_round77_20260613_1733/sub-fp8-worst-source-r77/ex244/notes/high_level_dossier.md`.
- Source-only families tried: current-best source copy control, selective `keep` on max/gap/key/delta semantic wires, assign-vs-case output mux rewrite, and flattenable boundary-core wrapper.
- Official `evaluate.py` rows: `4/4` equivalent.
- Best official candidate: `ex244_r77_boundary_core`, `327/35/11445`.
- method_signature: `ex244|E4M3FN_packed_hypot(abs(high),abs(low))|flattenable_boundary_core|shared_semantic_decode_routed_through_a_source_module_boundary_before_flatten|repo_yosys_frontend_default|official_evaluate|full_word`.
- Current frontend/reference used by this shard: `9120` / `4272`.
- Outcome: frontend improvement `0`; beats reference `0`.
- Evidence: shard CSV `student/frontend_campaigns/campaigns/frontend_source_parallel_round77_20260613_1733/agent_shards/sub-fp8-worst-source-r77/evaluation_results.csv`; best log `student/work/frontend_source_parallel_round77_20260613_1733/sub-fp8-worst-source-r77/ex244/ex244_r77_boundary_core/logs/ex244_r77_boundary_core.evaluate.py.log`.
- Next action: boundary wrapping reduced delay relative to this shard's copy control but area remains too high; continue with lower-area delta prediction or shorter max/min plus correction logic.

## 2026-06-14 12:29:00 +0800 fp8-tail-transfer-r2

- Campaign: `student/frontend_campaigns/campaigns/ex204_ex299_frontend_continuation_20260614_1216/agent_shards/fp8-tail-transfer-r2/`.
- Frontend-only families tried: small-gap tail/direct delta predicates, selected delta carry overlay, and current max-eff BDD high bits mixed with direct-tail low bits.
- Official `evaluate.py` rows: `3/3` equivalent. Best observed: `ex244_r2_current_tail_conemix_abc_g_aig_frontend` `311/36/11196`.
- Current frontend/reference used by this shard: `10234` / `4272`; improved frontend `0`; beats reference `0`.
- Evidence: `student/work/ex204_ex299_frontend_continuation_20260614_1216/fp8-tail-transfer-r2/ex244/verilog/ex244_r2_current_tail_conemix_abc_g_aig_frontend.v`, `student/work/ex204_ex299_frontend_continuation_20260614_1216/fp8-tail-transfer-r2/ex244/aigs/ex244_r2_current_tail_conemix_abc_g_aig_frontend.aig`, `student/runs/float_fp8/ex204_ex299_frontend_continuation_20260614_1216/fp8-tail-transfer-r2/ex244/logs/ex244_r2_current_tail_conemix_abc_g_aig_frontend.evaluate.py.log`.
- Next action: do not repeat this small-gap delta predicate, carry-overlay, or cone-mix family unchanged; the gap remains a lower-area shallow delta predictor or shorter max/min path.

## 2026-06-14 13:00:25 +0800 fp8-source-compress-r3

- Campaign: `student/frontend_campaigns/campaigns/ex204_ex299_frontend_continuation_20260614_1216/agent_shards/fp8-source-compress-r3/`.
- Frontend-only families tried: max-eff first residual delta table, and field-class max/min comparator feeding the current exact delta BDD.
- Official `evaluate.py` rows: `2/2` equivalent. Best observed: `ex244_r3_field_compare_current_bdd_abc_g_aig` `321/36/11556`.
- Current frontend/reference used by this shard: `10234` / `4272`; improved frontend `0`; beats reference `0`.
- Evidence: Verilog `student/work/ex204_ex299_frontend_continuation_20260614_1216/fp8-source-compress-r3/ex244/verilog/ex244_r3_field_compare_current_bdd_abc_g_aig.v`; AIG `student/work/ex204_ex299_frontend_continuation_20260614_1216/fp8-source-compress-r3/ex244/aigs/ex244_r3_field_compare_current_bdd_abc_g_aig.aig`; log `student/runs/float_fp8/ex204_ex299_frontend_continuation_20260614_1216/fp8-source-compress-r3/ex244/logs/ex244_r3_field_compare_current_bdd_abc_g_aig.evaluate.py.log`.
- Next action: do not repeat max-eff subkey tables or field-compare-over-current-BDD unchanged; both were exact but worse than the compact current max-eff BDD.
