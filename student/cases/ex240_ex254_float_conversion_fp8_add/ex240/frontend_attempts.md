# ex240 Frontend Attempts

Function hypothesis: E4M3FN FP8 add, high byte + low byte.

Reference row: area/delay/ADP/score = `403/33/13299/19948.5`.

Current known best:
- Source: `student/results/current_best_by_case.csv` and the run result CSVs.
- Variant: `ex240_semantic_add_same_grs_diff_param8_synth_preset_aig`
- QoR: `590/51/30090`
- Reference ADP: `13299`
- Ratio: `2.262576`
- Classification: `semantic_exact`

## Diagnostics To Run

- Verify width, support, constant bits, bit entropy, and special input classes.
- Infer whether this is conversion or packed fp8 add.
- If conversion, infer source/target formats, rounding, saturation, and special
  value behavior.
- If add, infer operand packing, commutativity, alignment, cancellation,
  normalization, rounding, and special value behavior.

## Attempt Log

- 2026-06-12 Round9 pre-candidate (`fp8-wide-r9`):
  - Dossier path: `student/work/ex200_ex299_frontend_refgap_round9_20260612_1851/fp8-wide-r9/ex240/notes/high_level_dossier.md`.
  - Method signatures planned:
    - `ex240|E4M3FN packed add|split_threshold_quant|shared sorted field decode and threshold-band RNE quantizer|round9_yosys|exact_e4m3fn_add_high_plus_low|same_diff_threshold_outputs`
    - `ex240|E4M3FN packed add|residual_mask_overlay|shared active-region predicates plus output-bit residual masks|round9_yosys|exact_e4m3fn_add_high_plus_low|max_passthrough_mask_outputs`
  - Planned outcome check: official `evaluate.py` per AIG; no success claimed before area/delay/ADP and paths are recorded.
  - Next action: run only after ex244 candidate generation because ex244 has higher assigned priority.
- 2026-06-12 Round9 evaluated (`fp8-wide-r9`):
  - Tested method_signature `ex240|E4M3FN packed add|split_threshold_quant|shared sorted field decode and threshold-band RNE quantizer|round9_yosys_default|exact_e4m3fn_add_high_plus_low|same_diff_threshold_outputs`.
  - Official result: `evaluate.py` OK, `2098/146/306308`.
  - Paths: Verilog `student/work/ex200_ex299_frontend_refgap_round9_20260612_1851/fp8-wide-r9/ex240/verilog/ex240_round9_split_threshold_quant.v`; AIG `student/work/ex200_ex299_frontend_refgap_round9_20260612_1851/fp8-wide-r9/ex240/aigs/ex240_round9_split_threshold_quant_default.aig`; log `student/work/ex200_ex299_frontend_refgap_round9_20260612_1851/fp8-wide-r9/ex240/logs/ex240_round9_split_threshold_quant_default.official_evaluate.log`.
  - Outcome: exact but far worse than current frontend `590/51/30090` and reference `403/33/13299`; no improvement.
  - Next action: do not repeat threshold-band quantization for add; it confirms the broad threshold ladder is too deep, so future work should stay near the compact GRS/diff-normalizer path or find a smaller diff-sign predicate form.
- Confirmed exact E4M3FN add semantics.  NaNs canonicalize to `8'h7f`; `-0 +
  -0` returns `8'h80`; normal zero cancellations return positive zero.
- `semantic_add_scaled`: decode both operands to scaled integer magnitude,
  signed add/subtract, then threshold quantize.  Exact; best `1404/56/78624`
  with `abc_g_aig`.
- `semantic_add_norm`: leading-bit/RNE normalizer reduced area to about `922`
  but delay rose to `87`; ADP lost.
- `semantic_add_pair_delta`: sorted-magnitude same-sign/diff-sign correction
  lowered delay to `37` but area rose above `5.7k`; ADP lost.
- 2026-06-08 ex244 transfer check: exact same-sign sig/gap delta plus
  diff-sign arithmetic normalizer reached `1056/89/93984`; lower area but
  delay too high.  Full field-delta version reached `2713/40/108520`.  The
  ex244 `(gap,max_sig,min_sig)` threshold idea does not directly cover
  ex240 because diff-sign cancellation needs normalization depth.
- Shared-BDD variable orders using paired high-to-low operand bits produced a
  better shallow structural seed.  Best raw BDD was `2786/26/72436`; limited
  synthflow improved it to `2755/23/63365`, now current best.
- 2026-06-08 deeper BDD order refinement put exponent/magnitude bits first,
  then sign bits, then low mantissa bits.  Raw best was `2514/23/57822`;
  limited synthflow improved it to `2493/23/57339`, current best.
- Aligned 4-bit significand add/sub with local normalizer was exact but
  high-delay (`935/80/74800` best); it is a semantic check, not current best.
- 2026-06-08 deeper semantic add follow-up:
  - Gap clamping proved the semantic normalizer only needs a 9-bit local
    significand for meaningful correction; `norm9_clamped` improved to
    `767/67/51389`.
  - Replacing the priority/rounding normalizer with a local
    `sigval -> {exp_offset,rounded_sig}` table improved to `736/53/39008`.
  - Splitting same-sign and diff-sign paths showed gap-5 diff correction is
    exactly `maxc-1` only when `max_sig==8 && min_sig>=9`; the hybrid
    same-delta/diff-param source reached `778/50/38900`.
  - The best current source uses a hand-written same-sign GRS/RNE formula and
    the compact diff normalizer, reaching `590/51/30090` with official
    `evaluate.py` OK.  This is now the best ex240 frontend seed.
  - Direct `{min_eff,diff_sig}` diff table reduced little delay and raised
    area (`1078/49/52822`), so it is excluded.
  - `parallel_case` source hints did not change QoR under Yosys.
  - A fully formula-based diff-GRS normalizer matched the Python semantic
    model but the current Verilog candidate is not equivalent; keep it as a
    follow-up/debug direction, not a seed.
  - An accidental broad synthflow over all rows in `candidates.csv` repeated
    many old variants and found no better result; future synthflow checks
    should use a best-only seed CSV.

## Next Maintenance Items

- Future work should focus on a verified formula-based diff-sign
  cancellation/renormalization path.  The same-sign path is now compact; the
  remaining delay is in diff normalization and sign/magnitude selection.

## 2026-06-13 Round25 fp8-r25

- Campaign: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round25_20260613_0506/agent_shards/fp8-r25/`.
- Tested method family: `ex240|E4M3FN packed add|direct active-region magnitude table|shared sorted field decode sign gap sig and direct same/diff active output magnitudes|yosys_multi_official_evaluate|exact_e4m3fn_add_high_plus_low|active_region_magnitude_override`.
- Official `evaluate.py` rows: `2/2` OK.
- Best observed: `ex240_r25_direct_active_add_synth_preset_aig`, `5413/37/200281`, improved frontend `0`, beats reference `0`.
- Paths: Verilog `student/work/ex200_ex299_frontend_refgap_round25_20260613_0506/fp8-r25/ex240/verilog/ex240_r25_direct_active_add_synth_preset_aig.v`; AIG `student/work/ex200_ex299_frontend_refgap_round25_20260613_0506/fp8-r25/ex240/aigs/ex240_r25_direct_active_add_synth_preset_aig.aig`; log `student/work/ex200_ex299_frontend_refgap_round25_20260613_0506/fp8-r25/ex240/logs/ex240_r25_direct_active_add_synth_preset_aig.evaluate.py.log`.
- Next action: `extend only if method_signature changes materially; otherwise move to a different representation family`.

## 2026-06-13 Round25 fp8-worst-r25

- Campaign: `student/frontend_campaigns/campaigns/ex240_ex299_frontend_gt2_round25_20260613_0531/agent_shards/fp8-worst-r25/`.
- Families tested:
  - truth-derived shared ROBDD over interleaved high/low FP8 operand bits;
  - current frontend-best source replay with alternate Yosys/AIG mapping.
- Official `evaluate.py` rows: `3/3` OK.
- Best observed: `ex240_resynth_abc_g_aig`, `626/50/31300`; worse than current frontend `590/51/30090` and reference `13299`.
- BDD fallback: `2786/26/72436`; lower delay than semantic source but far too much area.
- Paths: summary `student/frontend_campaigns/campaigns/ex240_ex299_frontend_gt2_round25_20260613_0531/agent_summaries/fp8-worst-r25.md`; evaluation CSV `student/frontend_campaigns/campaigns/ex240_ex299_frontend_gt2_round25_20260613_0531/agent_shards/fp8-worst-r25/evaluation_results.csv`; dossier `student/work/ex240_ex299_frontend_gt2_round25_20260613_0531/fp8-worst-r25/ex240/notes/high_level_dossier.md`.
- Outcome: no frontend improvement. Next action is verified formula-level diff-sign cancellation/renormalization, not active-region tables, BDD fallback, or current source flow probes.


## 2026-06-13 Round26 fp8-r26

- Campaign: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round26_20260613_0539/agent_shards/fp8-r26/`.
- Best official candidate in this shard: `` `//`.
- Current frontend baseline used by this worker: `30090`; reference ADP `13299`.
- Outcome: improved frontend `0`; beats reference `0`.
- Evidence: ``.
- Next action: Debug non-equivalence or choose a different representation family.


## 2026-06-13 Round26 fp8-r26

- Campaign: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round26_20260613_0539/agent_shards/fp8-r26/`.
- Best official candidate in this shard: `ex240_r26_samedelta_diffdirect_synth_preset_aig` `1078/49/52822`.
- Current frontend baseline used by this worker: `30090`; reference ADP `13299`.
- Outcome: improved frontend `0`; beats reference `0`.
- Evidence: `student/work/ex200_ex299_frontend_refgap_round26_20260613_0539/fp8-r26/ex240/logs/ex240_r26_samedelta_diffdirect_synth_preset_aig.evaluate.py.log`.
- Next action: Try a new high-level representation; do not repeat this r26 source as-is.

## 2026-06-13 Round61 local-ex240-source-r61

- Campaign: `student/frontend_campaigns/campaigns/ex240_frontend_source_only_round61_20260613_0858/`.
- Recording-guided frontend-only/source-only mixed structures tried:
  - formula diff normalizer replacing split `sigval -> {offset,sig}` tables;
  - explicit diff gapcase source with split norm tables;
  - active diff-only gating before formula/table normalizer.
- Official `evaluate.py` rows: `20/20` equivalent.
- Best observed: `ex240_ex240_r61_diff_gapcase_formula_norm_extra_share_raw`, `675/40/27000`.
- Current frontend best remains `582/46/26772`; reference `13299`.
- Evidence: `student/work/ex240_frontend_source_only_round61_20260613_0858/local-ex240-source-r61/ex240/ex240_r61_diff_gapcase_formula_norm/logs/ex240_ex240_r61_diff_gapcase_formula_norm_extra_share_raw.evaluate.py.log`.
- Outcome: no frontend-best improvement. Formula normalization can reduce delay to `40`, but area rises enough to lose ADP; do not repeat r61 formula/gapcase/active gating unchanged.

## 2026-06-13 Round62 sub-fp8-addhyp-r62

- Campaign: `student/frontend_campaigns/campaigns/frontend_source_parallel_round62_20260613_0907/`.
- Source-only families tried: branch-pack function split norm and related same/diff branch output grouping around the current E4M3FN add source.
- Official `evaluate.py` rows: equivalent rows included in `results/evaluation_results.csv`.
- Best observed: `ex240_ex240_r62_branch_pack_function_split_norm_synth_preset_raw`, `582/46/26772`.
- Current frontend best remains `582/46/26772`; reference `13299`.
- Evidence: `student/frontend_campaigns/campaigns/frontend_source_parallel_round62_20260613_0907/agent_shards/sub-fp8-addhyp-r62/evaluation_results.csv`.
- Outcome: ties frontend best but does not improve. Do not replay branch-pack split norm unchanged; next useful move is a genuinely smaller diff-sign normalizer or reduced branch muxing.

## 2026-06-13 Round64 sub-mixed-diffroute-r64

- Campaign: `student/frontend_campaigns/campaigns/frontend_source_parallel_round64_20260613_1004/agent_shards/sub-mixed-diffroute-r64`.
- Families tried: one-hot leading-zero bucket normalizer, separate sign/magnitude selected-output factoring, compact cancellation predicates, reduced branch muxing.
- Official result: best `ex240_r64_signmag_selected_output_factor_synth_preset` `610/43/26230`; improves frontend `1`; beats reference `0`.
- Evidence: `student/frontend_campaigns/campaigns/frontend_source_parallel_round64_20260613_1004/agent_shards/sub-mixed-diffroute-r64/evaluation_results.csv`.
- Next action: keep only materially new diff-normalizer/source sharing; do not replay r61/r62 unchanged.

## 2026-06-13 Round74 sub-fp8-addhyp-r74

- Campaign: `student/frontend_campaigns/campaigns/frontend_source_parallel_round74_20260613_1439/`.
- Dossier: `student/work/frontend_source_parallel_round74_20260613_1439/sub-fp8-addhyp-r74/ex240/notes/high_level_dossier.md`.
- Source-only families tried: field-level compare/decode, same-gapcase constant alignment, split diff-normalizer parameter tables, and case-attribute variants around the compact E4M3 add source.
- Official `evaluate.py` rows: `4/4` equivalent.
- Best observed: `ex240_ex240_field_same_gapcase_case_attrs_repo_yosys`, `641/45/28845`.
- Current frontend target used by this shard: `26230`; reference `13299`; improved frontend `0`; beats reference `0`.
- Evidence: `student/frontend_campaigns/campaigns/frontend_source_parallel_round74_20260613_1439/agent_shards/sub-fp8-addhyp-r74/evaluation_results.csv`.
- Next action: same-gapcase and field-compare rewrites did not beat r64; focus next on a materially smaller diff-sign cancellation normalizer or reduced sign/magnitude output mux.

## 2026-06-13 Round75 sub-fp8-mid-r75

- Campaign: `student/frontend_campaigns/campaigns/frontend_source_parallel_round75_20260613_1507/`.
- Dossier: `student/work/frontend_source_parallel_round75_20260613_1507/sub-fp8-mid-r75/ex240/notes/high_level_dossier.md`.
- Source-only families tried: inline selected sign/magnitude output mux preserving signed-zero semantics, and PO-clustered sign/magnitude tail over the r64 compact diff-normalizer source.
- Method signatures:
  - `ex240|E4M3FN packed add high byte plus low byte|inline selected sign/magnitude output mux|shared r64 sorted field decode and compact diff normalizer|repo_yosys_frontend_default|official_evaluate|full_word`
  - `ex240|E4M3FN packed add high byte plus low byte|PO-clustered sign and magnitude tail over r64 source|shared same-sign GRS path plus diff-sign local normalizer|repo_yosys_frontend_default|official_evaluate|full_word`
- Official `evaluate.py` rows: `2/2` equivalent. Best observed: `ex240_r75_inline_select_po`, `641/45/28845`.
- Current frontend/current-target/reference used by this shard: `26230` / `21046` / `13299`; improved frontend `0`; beats current target `0`; beats reference `0`.
- Evidence: shard CSV `student/frontend_campaigns/campaigns/frontend_source_parallel_round75_20260613_1507/agent_shards/sub-fp8-mid-r75/evaluation_results.csv`; best log `student/work/frontend_source_parallel_round75_20260613_1507/sub-fp8-mid-r75/ex240/logs/ex240_r75_inline_select_po.evaluate.py.log`.
- Next action: output-tail rewrites tie the earlier r74 QoR shape and do not recover r64; continue only with a materially smaller diff-sign cancellation normalizer.

## 2026-06-13 Round76 sub-fp8-mid-r76

- Campaign: `student/frontend_campaigns/campaigns/frontend_source_parallel_round76_20260613_1706/`.
- Frontend/source-only families tried:
  - `signmag_selected_output_factor`: shared field decode and separate sign/magnitude selected-output factoring.
  - `compact_cancel_predicate_mux`: compact cancellation predicates with same/diff active muxing.
- Official `evaluate.py` rows: `2/2` equivalent.
- Best observed: `ex240_r76_signmag_selected_output_factor`, `650/46/29900`.
- Current frontend/current-target/reference used by this shard: `26230` / `21046` / `13299`; improved frontend `0`; beats current target `0`; beats reference `0`.
- Evidence: shard CSV `student/frontend_campaigns/campaigns/frontend_source_parallel_round76_20260613_1706/agent_shards/sub-fp8-mid-r76/evaluation_results.csv`; best log `student/work/frontend_source_parallel_round76_20260613_1706/sub-fp8-mid-r76/ex240/logs/ex240_r76_signmag_selected_output_factor.evaluate.py.log`.
- Next action: bounded non-r75 replays did not recover r64 QoR under this default frontend pass; the open problem remains a smaller diff-sign cancellation normalizer or less expensive final sign/magnitude selection.


## 2026-06-13 17:45:00 +0800 Round77 sub-fp8-mid-source-r77

- Campaign: `student/frontend_campaigns/campaigns/frontend_source_parallel_round77_20260613_1733/`.
- Dossier: `student/work/frontend_source_parallel_round77_20260613_1733/sub-fp8-mid-source-r77/ex240/notes/high_level_dossier.md`.
- Frontend/source-only families tried: keep-boundary semantic predicates, grouped sign/magnitude output vector wrapper, per-bit output decomposition, and flattened/staged source form around the current exact high-level source.
- Method signatures: see shard CSV `student/frontend_campaigns/campaigns/frontend_source_parallel_round77_20260613_1733/agent_shards/sub-fp8-mid-source-r77/evaluation_results.csv`.
- Official `evaluate.py` rows: `3/4` equivalent.
- Best observed: `ex240_r77_grouped_vector` `634/47/29798`.
- Current frontend/current-target/reference used by this shard: `26230` / `21046` / `13299`; improved frontend `0`; beats current target `0`; beats reference `0`.
- Evidence: `student/work/frontend_source_parallel_round77_20260613_1733/sub-fp8-mid-source-r77/ex240/logs/ex240_r77_grouped_vector.evaluate.py.log`.
- Next action: do not repeat these r77 source-boundary/output-grouping variants unchanged; pursue a genuinely smaller semantic residual or predicate basis.


## 2026-06-13 17:48:20 +0800 Round77 keep-annotation correction sub-fp8-mid-source-r77

- Campaign: `student/frontend_campaigns/campaigns/frontend_source_parallel_round77_20260613_1733/`.
- Dossier: `student/work/frontend_source_parallel_round77_20260613_1733/sub-fp8-mid-source-r77/ex240/notes/high_level_dossier.md`.
- Frontend/source-only families tried: keep-boundary semantic predicates, grouped sign/magnitude output vector wrapper, per-bit output decomposition, and flattened/staged source form around the current exact high-level source.
- Method signatures: see shard CSV `student/frontend_campaigns/campaigns/frontend_source_parallel_round77_20260613_1733/agent_shards/sub-fp8-mid-source-r77/evaluation_results.csv`.
- Official `evaluate.py` rows: `4/4` equivalent.
- Best observed: `ex240_r77_keep_boundary` `638/46/29348`.
- Current frontend/current-target/reference used by this shard: `26230` / `21046` / `13299`; improved frontend `0`; beats current target `0`; beats reference `0`.
- Evidence: `student/work/frontend_source_parallel_round77_20260613_1733/sub-fp8-mid-source-r77/ex240/logs/ex240_r77_keep_boundary.evaluate.py.log`.
- Next action: do not repeat these r77 source-boundary/output-grouping variants unchanged; pursue a genuinely smaller semantic residual or predicate basis.


## 2026-06-13 18:05:10 +0800 Round78 sub-fp8-mid-enum-r78

- Campaign: `student/frontend_campaigns/campaigns/frontend_source_parallel_round78_20260613_1744/`.
- Dossier: `student/work/frontend_source_parallel_round78_20260613_1744/sub-fp8-mid-enum-r78/ex240/notes/high_level_dossier.md`.
- Frontend/source-only families tried: sparse semantic-wire keep, grouped helper 4+4 output split, grouped helper field output split, flattened staged core, and ex249-only tiny residual predicates keyed by existing semantic wires.
- Method signatures: see shard CSV `student/frontend_campaigns/campaigns/frontend_source_parallel_round78_20260613_1744/agent_shards/sub-fp8-mid-enum-r78/evaluation_results.csv`.
- Official `evaluate.py` rows: `4/4` equivalent.
- Best observed: `ex240_r78_sparse_semantic_keep` `639/46/29394`.
- Current frontend/current-target/reference used by this shard: `26230` / `21046` / `13299`; improved frontend `0`; beats current target `0`; beats reference `0`.
- Evidence: `student/work/frontend_source_parallel_round78_20260613_1744/sub-fp8-mid-enum-r78/ex240/logs/ex240_r78_sparse_semantic_keep.evaluate.py.log`.
- Next action: source-boundary/output splitting did not close the target gap unless noted above; continue only with a materially smaller semantic residual or predicate basis.

## 2026-06-14 12:34:04 +0800 fp8-semantic-r2

- Campaign: `student/frontend_campaigns/campaigns/ex204_ex299_frontend_continuation_20260614_1216/agent_shards/fp8-semantic-r2/`.
- Dossier: `student/work/ex204_ex299_frontend_continuation_20260614_1216/fp8-semantic-r2/ex240/notes/high_level_dossier.md`.
- Families tried: direct integer add/sub normalizer and byte-interleaved shared-output BDD; both compared with `default_and` and `abc_g_aig` frontend Yosys flows.
- Official `evaluate.py` rows: `4/4` equivalent. Best observed: `ex240_r2_shared_bdd_interleave_abc_g_aig` `2755/23/63365`; low-area observed: `ex240_r2_direct_arith_norm_abc_g_aig` `921/88/81048`.
- Current frontend/reference used by this shard: `26230` / `13299`; improved frontend `0`; beats reference `0`.
- Evidence: `student/frontend_campaigns/campaigns/ex204_ex299_frontend_continuation_20260614_1216/agent_shards/fp8-semantic-r2/evaluation_results.csv`.
- Next action: do not repeat direct arithmetic normalizer or full shared BDD for ex240; a useful next attempt still needs a smaller diff-sign cancellation residual than the current sign/magnitude-selected source.

## 2026-06-14 13:00:55 +0800 fp8-output-plane-r3

- Campaign: `student/frontend_campaigns/campaigns/ex204_ex299_frontend_continuation_20260614_1216/agent_shards/fp8-output-plane-r3/`.
- Dossier: `student/work/ex204_ex299_frontend_continuation_20260614_1216/fp8-output-plane-r3/ex240/notes/high_level_dossier.md`.
- Frontend-only family tried: current-best source compression by replacing the fixed min-alignment case tree with a guarded variable align shifter while preserving the r64 field decode, same-sign GRS path, and compact diff normalizer.
- Official `evaluate.py`: `ex240_r3_shift_align_source_compress` OK `611/44/26884`.
- Current frontend/reference used by this shard: `26230` / `13299`; improved frontend `0`; beats reference `0`.
- Evidence: Verilog `student/work/ex204_ex299_frontend_continuation_20260614_1216/fp8-output-plane-r3/ex240/verilog/ex240_r3_shift_align_source_compress.v`; AIG `student/work/ex204_ex299_frontend_continuation_20260614_1216/fp8-output-plane-r3/ex240/aigs/ex240_r3_shift_align_source_compress.aig`; log `student/runs/float_fp8/ex204_ex299_frontend_continuation_20260614_1216/fp8-output-plane-r3/ex240/logs/ex240_r3_shift_align_source_compress.evaluate.py.log`.
- Next action: do not repeat this shift-align compression unchanged; it trades one area node and one delay level for worse ADP.
