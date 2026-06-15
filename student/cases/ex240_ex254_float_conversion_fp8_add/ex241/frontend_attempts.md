# ex241 Frontend Attempts

Function hypothesis: E4M3FN FP8 multiply.

Reference row: area/delay/ADP/score = `344/21/7224/10836.0`.

Current known best:
- Source: `student/results/current_best_by_case.csv` and the run result CSVs.
- Variant: `semantic_mul_product_nested_exp_synth_preset_aig`
- QoR: `536/29/15544`
- Reference ADP: `7224`
- Ratio: `2.151717`
- Classification: `semantic_exact`

## Diagnostics To Run

- Verify width, support, constant bits, bit entropy, and special input classes.
- Infer whether this is conversion or packed fp8 add.
- Check for shallow sign/exponent/mantissa remapping, saturation guards, and
  selected-bit boundary predicates before using tables.

## Attempt Log

- Confirmed exact E4M3FN multiply semantics, including canonical NaN and signed
  underflow zero from sign xor.
- `semantic_mul_scaled`: exact but too deep/large (`3343/52/173836` best).
- `semantic_mul_field_table`: effective exponent sum + sorted 4-bit
  significands.  Major improvement; best `1033/25/25825`.
- `semantic_mul_product_table`: uses 4x4 product plus exponent sum.  Lower area
  (`752`) but delay `35`; ADP lost.
- 2026-06-08 deep structure: exact product-normalize formula plus only 13
  rounding exceptions was verified, but synthesized as `562/69/38778`.
  This confirms the semantic formula is compact in area but too serial for the
  current Yosys AIG critical path.
- Limited synthflow on the current field-table best did not improve it; the
  best recheck was `1058/25/26450`, worse than the retained `1033/25/25825`.
- 2026-06-08 follow-up: unsorted/sparse field tables and output-bit table
  variants were exact but did not improve ADP.  Best unsorted field table was
  `1423/20/28460`; sparse sorted/unsorted stayed near `40500`/`29040`; bit
  tables were much worse.
- Shared-BDD paired-bit sources transferred poorly to multiply: best after
  synthflow was `1399/21/29379`, not better than field-table current best.
- Product-table synthflow lowered area to `778` but delay stayed `34`, ADP
  `26452`; useful as a low-area alternative but not current best.
- 2026-06-08 arithmetic-structure pass: product-param default plus exact
  exceptions improved to `534/40/21360`; per-bit exception overlay was worse.
- Nested exponent-sum then product table was the best source shape:
  `536/29/15544`, current best.  It keeps the semantic product key but gives
  Yosys a shallower decoder than the compact exception formula.

## Next Maintenance Items

- Future work should replace the field table with normalized product formula
  plus small boundary exceptions only if the formula can be rewritten with a
  shallower leading/round path.  The nested product table is currently the
  strongest frontend seed; repeating broad BDD or bit-table variants is low
  priority.

## 2026-06-13 Round25 fp8-r25

- Campaign: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round25_20260613_0506/agent_shards/fp8-r25/`.
- Status: `blocker_no_material_candidate`.
- Evidence: `student/work/ex200_ex299_frontend_refgap_round25_20260613_0506/fp8-r25/ex241/notes/high_level_dossier.md`.
- Next action: `derive a shallow E4 product leading/round path; avoid nested product-table and BDD replay`.

## 2026-06-13 Round25 fp8-wide-r25

- Campaign: `student/frontend_campaigns/campaigns/ex240_ex299_frontend_gt2_round25_20260613_0531/agent_shards/fp8-wide-r25/`.
- Tested method families: `6` candidates across `2` materially different representations.
- Official `evaluate.py` rows: `3/6` OK.
- Best observed: `ex241_r25w_product_exp_table_synth_preset_aig`, `1038/28/29064`, improved frontend `0`, beats reference `0`.
- Paths: Verilog `student/work/ex240_ex299_frontend_gt2_round25_20260613_0531/fp8-wide-r25/ex241/verilog/ex241_r25w_product_exp_table_synth_preset_aig.v`; AIG `student/work/ex240_ex299_frontend_gt2_round25_20260613_0531/fp8-wide-r25/ex241/aigs/ex241_r25w_product_exp_table_synth_preset_aig.aig`; log `student/work/ex240_ex299_frontend_gt2_round25_20260613_0531/fp8-wide-r25/ex241/logs/ex241_r25w_product_exp_table_synth_preset_aig.evaluate.py.log`.
- Next action: `try source-level arithmetic factoring only if it changes semantic coordinates or sharing materially`.


## 2026-06-13 Round26 fp8-r26

- Campaign: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round26_20260613_0539/agent_shards/fp8-r26/`.
- Best official candidate in this shard: `` `//`.
- Current frontend baseline used by this worker: `15544`; reference ADP `7224`.
- Outcome: improved frontend `0`; beats reference `0`.
- Evidence: ``.
- Next action: Debug non-equivalence or choose a different representation family.


## 2026-06-13 Round26 fp8-r26

- Campaign: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round26_20260613_0539/agent_shards/fp8-r26/`.
- Best official candidate in this shard: `ex241_r26_product_dc_low_synth_preset_aig` `680/33/22440`.
- Current frontend baseline used by this worker: `15544`; reference ADP `7224`.
- Outcome: improved frontend `0`; beats reference `0`.
- Evidence: `student/work/ex200_ex299_frontend_refgap_round26_20260613_0539/fp8-r26/ex241/logs/ex241_r26_product_dc_low_synth_preset_aig.evaluate.py.log`.
- Next action: Try a new high-level representation; do not repeat this r26 source as-is.

## 2026-06-13 14:51 +0800 Round74 sub-fp8-muldiv-r74

- Campaign: `student/frontend_campaigns/campaigns/frontend_source_parallel_round74_20260613_1439/`.
- Tested two source-only exact table families for the E4M3FN packed multiply hypothesis:
  - `ex241|E4M3FN packed multiply high byte times low byte|sigpair plus exponent-sum exact magnitude table|shared sign xor effective exponent and 4-bit significand pair keys|repo_yosys_frontend_default|official_evaluate|full_word`.
  - `ex241|E4M3FN packed multiply high byte times low byte|split exponent and mantissa tables over product/exponent key|shared product and exponent-sum with separated output clusters|repo_yosys_frontend_default|official_evaluate|exp_mant_split`.
- Official `evaluate.py` rows: `2/2` equivalent. Best observed: `ex241_r74_sigpair_exp_mag_table` `1456/21/30576`.
- Current frontend/reference used by this shard: `14094` / `7224`.
- Outcome: no frontend-best improvement; beats reference `no`.
- Evidence: shard CSV `student/frontend_campaigns/campaigns/frontend_source_parallel_round74_20260613_1439/agent_shards/sub-fp8-muldiv-r74/evaluation_results.csv`; best log `student/work/frontend_source_parallel_round74_20260613_1439/sub-fp8-muldiv-r74/ex241/logs/ex241_r74_sigpair_exp_mag_table.evaluate.py.log`.
- Next action: direct semantic-key tables are shallow but too large; future work should target a smaller product/rounding representation rather than more table re-keying.

## 2026-06-13 Round75 sub-fp8-mid-r75

- Campaign: `student/frontend_campaigns/campaigns/frontend_source_parallel_round75_20260613_1507/`.
- Dossier: `student/work/frontend_source_parallel_round75_20260613_1507/sub-fp8-mid-r75/ex241/notes/high_level_dossier.md`.
- Source-only families tried: explicit zero-product shell around the compact product table, and PO-clustered high/low output assignments over the same product/exponent shell.
- Method signatures:
  - `ex241|E4M3FN packed multiply high byte times low byte|explicit zero-product shell around compact product table|shared sign xor effective exponent sum and significand product|repo_yosys_frontend_default|official_evaluate|full_word`
  - `ex241|E4M3FN packed multiply high byte times low byte|PO-clustered high/low output over compact product table|shared product/exponent shell with output clusters|repo_yosys_frontend_default|official_evaluate|full_word`
- Official `evaluate.py` rows: `2/2` equivalent. Best observed: `ex241_r75_zero_product_bypass`, `553/30/16590`.
- Current frontend/current-target/reference used by this shard: `14094` / `11592` / `7224`; improved frontend `0`; beats current target `0`; beats reference `0`.
- Evidence: shard CSV `student/frontend_campaigns/campaigns/frontend_source_parallel_round75_20260613_1507/agent_shards/sub-fp8-mid-r75/evaluation_results.csv`; best log `student/work/frontend_source_parallel_round75_20260613_1507/sub-fp8-mid-r75/ex241/logs/ex241_r75_zero_product_bypass.evaluate.py.log`.
- Next action: zero bypass and PO clustering add too much delay; use a smaller product/rounding representation rather than another product-table wrapper.

## 2026-06-13 Round76 sub-fp8-mid-r76

- Campaign: `student/frontend_campaigns/campaigns/frontend_source_parallel_round76_20260613_1706/`.
- Frontend/source-only families tried:
  - `nested_exp_product`: shared sign xor, exponent sum, product key, nested exponent/product output tables.
  - `product_param_exception`: product exponent formula with parameterized rounding and exception overlay.
- Official `evaluate.py` rows: `2/2` equivalent.
- Best observed: `ex241_r76_nested_exp_product`, `554/30/16620`.
- Current frontend/current-target/reference used by this shard: `14094` / `11592` / `7224`; improved frontend `0`; beats current target `0`; beats reference `0`.
- Evidence: shard CSV `student/frontend_campaigns/campaigns/frontend_source_parallel_round76_20260613_1706/agent_shards/sub-fp8-mid-r76/evaluation_results.csv`; best log `student/work/frontend_source_parallel_round76_20260613_1706/sub-fp8-mid-r76/ex241/logs/ex241_r76_nested_exp_product.evaluate.py.log`.
- Next action: product-param formula remains too deep and nested product remains area/delay dominated; next useful work should change the product rounding basis rather than wrapping product tables.


## 2026-06-13 17:44:55 +0800 Round77 sub-fp8-mid-source-r77

- Campaign: `student/frontend_campaigns/campaigns/frontend_source_parallel_round77_20260613_1733/`.
- Dossier: `student/work/frontend_source_parallel_round77_20260613_1733/sub-fp8-mid-source-r77/ex241/notes/high_level_dossier.md`.
- Frontend/source-only families tried: keep-boundary semantic predicates, grouped sign/magnitude output vector wrapper, per-bit output decomposition, and flattened/staged source form around the current exact high-level source.
- Method signatures: see shard CSV `student/frontend_campaigns/campaigns/frontend_source_parallel_round77_20260613_1733/agent_shards/sub-fp8-mid-source-r77/evaluation_results.csv`.
- Official `evaluate.py` rows: `3/4` equivalent.
- Best observed: `ex241_r77_flattened_inline` `554/30/16620`.
- Current frontend/current-target/reference used by this shard: `14094` / `11592` / `7224`; improved frontend `0`; beats current target `0`; beats reference `0`.
- Evidence: `student/work/frontend_source_parallel_round77_20260613_1733/sub-fp8-mid-source-r77/ex241/logs/ex241_r77_flattened_inline.evaluate.py.log`.
- Next action: do not repeat these r77 source-boundary/output-grouping variants unchanged; pursue a genuinely smaller semantic residual or predicate basis.


## 2026-06-13 17:48:14 +0800 Round77 keep-annotation correction sub-fp8-mid-source-r77

- Campaign: `student/frontend_campaigns/campaigns/frontend_source_parallel_round77_20260613_1733/`.
- Dossier: `student/work/frontend_source_parallel_round77_20260613_1733/sub-fp8-mid-source-r77/ex241/notes/high_level_dossier.md`.
- Frontend/source-only families tried: keep-boundary semantic predicates, grouped sign/magnitude output vector wrapper, per-bit output decomposition, and flattened/staged source form around the current exact high-level source.
- Method signatures: see shard CSV `student/frontend_campaigns/campaigns/frontend_source_parallel_round77_20260613_1733/agent_shards/sub-fp8-mid-source-r77/evaluation_results.csv`.
- Official `evaluate.py` rows: `4/4` equivalent.
- Best observed: `ex241_r77_keep_boundary` `545/30/16350`.
- Current frontend/current-target/reference used by this shard: `14094` / `11592` / `7224`; improved frontend `0`; beats current target `0`; beats reference `0`.
- Evidence: `student/work/frontend_source_parallel_round77_20260613_1733/sub-fp8-mid-source-r77/ex241/logs/ex241_r77_keep_boundary.evaluate.py.log`.
- Next action: do not repeat these r77 source-boundary/output-grouping variants unchanged; pursue a genuinely smaller semantic residual or predicate basis.


## 2026-06-13 18:05:04 +0800 Round78 sub-fp8-mid-enum-r78

- Campaign: `student/frontend_campaigns/campaigns/frontend_source_parallel_round78_20260613_1744/`.
- Dossier: `student/work/frontend_source_parallel_round78_20260613_1744/sub-fp8-mid-enum-r78/ex241/notes/high_level_dossier.md`.
- Frontend/source-only families tried: sparse semantic-wire keep, grouped helper 4+4 output split, grouped helper field output split, flattened staged core, and ex249-only tiny residual predicates keyed by existing semantic wires.
- Method signatures: see shard CSV `student/frontend_campaigns/campaigns/frontend_source_parallel_round78_20260613_1744/agent_shards/sub-fp8-mid-enum-r78/evaluation_results.csv`.
- Official `evaluate.py` rows: `4/4` equivalent.
- Best observed: `ex241_r78_sparse_semantic_keep` `553/30/16590`.
- Current frontend/current-target/reference used by this shard: `14094` / `11592` / `7224`; improved frontend `0`; beats current target `0`; beats reference `0`.
- Evidence: `student/work/frontend_source_parallel_round78_20260613_1744/sub-fp8-mid-enum-r78/ex241/logs/ex241_r78_sparse_semantic_keep.evaluate.py.log`.
- Next action: source-boundary/output splitting did not close the target gap unless noted above; continue only with a materially smaller semantic residual or predicate basis.

## 2026-06-14 12:29:00 +0800 fp8-tail-transfer-r2

- Campaign: `student/frontend_campaigns/campaigns/ex204_ex299_frontend_continuation_20260614_1216/agent_shards/fp8-tail-transfer-r2/`.
- Frontend-only families tried: product-tail direct attribute table, selected low-tail residual overlay, and current-source/tail-source output cone mix.
- Official `evaluate.py` rows: `3/3` equivalent. Best observed: `ex241_r2_tail_product_low_overlay_abc_g_aig_frontend` `562/39/21918`.
- Current frontend/reference used by this shard: `15544` / `7224`; improved frontend `0`; beats reference `0`.
- Evidence: `student/work/ex204_ex299_frontend_continuation_20260614_1216/fp8-tail-transfer-r2/ex241/verilog/ex241_r2_tail_product_low_overlay_abc_g_aig_frontend.v`, `student/work/ex204_ex299_frontend_continuation_20260614_1216/fp8-tail-transfer-r2/ex241/aigs/ex241_r2_tail_product_low_overlay_abc_g_aig_frontend.aig`, `student/runs/float_fp8/ex204_ex299_frontend_continuation_20260614_1216/fp8-tail-transfer-r2/ex241/logs/ex241_r2_tail_product_low_overlay_abc_g_aig_frontend.evaluate.py.log`.
- Next action: do not repeat tail-product attr, low-overlay, or current/tail cone mix unchanged; ex241 still needs a smaller product/rounding basis rather than another product-tail wrapper.

## 2026-06-14 13:00:25 +0800 fp8-source-compress-r3

- Campaign: `student/frontend_campaigns/campaigns/ex204_ex299_frontend_continuation_20260614_1216/agent_shards/fp8-source-compress-r3/`.
- Frontend-only families tried: current nested product table compressed into exp-major product ranges, and independent output-plane product range predicates over shared `exp_sum/product`.
- Official `evaluate.py` rows: `2/2` equivalent. Best observed: `ex241_r3_product_output_plane_bits_abc_g_aig` `587/35/20545`.
- Current frontend/reference used by this shard: `15544` / `7224`; improved frontend `0`; beats reference `0`.
- Evidence: Verilog `student/work/ex204_ex299_frontend_continuation_20260614_1216/fp8-source-compress-r3/ex241/verilog/ex241_r3_product_output_plane_bits_abc_g_aig.v`; AIG `student/work/ex204_ex299_frontend_continuation_20260614_1216/fp8-source-compress-r3/ex241/aigs/ex241_r3_product_output_plane_bits_abc_g_aig.aig`; log `student/runs/float_fp8/ex204_ex299_frontend_continuation_20260614_1216/fp8-source-compress-r3/ex241/logs/ex241_r3_product_output_plane_bits_abc_g_aig.evaluate.py.log`.
- Next action: do not repeat range-compressed product windows or output-plane product predicates unchanged; both are exact but area/delay dominated versus the nested current source.
