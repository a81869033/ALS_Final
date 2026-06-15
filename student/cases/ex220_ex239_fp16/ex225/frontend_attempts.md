# ex225 FP16 Frontend Attempts

Function hypothesis: `fp16_log10`.

Current known best:
- Run: `ex225_frontend_fp16_predecode_best_neighbor_20260607_1609`
- Variant: `ex225_manual15_14_13_predecode12_9_abc_g_aig`
- QoR: `11488/21/241248`
- Reference ADP: `116676`
- Ratio: `2.067675`
- Classification: `synthflow_exact`

Next maintenance items:
- Highest initial log-family priority by ratio.
- Verify true DAZ + log10(x) + FP16 RNE + FTZ + canonical NaN semantics.
- Try exponent-base plus mantissa-correction and sign/default field factoring.
- Record why any BDD/range/comparator method wins or loses.

## 2026-06-07 Log10 Shell And Casez Attempts

- Pure Python semantic check with DAZ/FTZ/RNE/canonical-NaN confirmed the
  `log10` direction but showed a first `1 ulp` mismatch at input `0x338f`
  (`expected 0xb903`, truth `0xb904`), so exact candidates must still use truth
  correction.
- Generated `ex225_fp16_log10_log10_special_shell`: exact but worse,
  `11628/24/279072` versus the then-current best `11616/23/267168`.
- Ran bounded casez interval compression (`t400`, `t600`, `t800`, `t1024`).
  Best was `t400`, exact but worse at `13234/25/330850`.
- Ran targeted selected-bit hybrids.  Best was
  `ex225_fp16_log10_bitrun_bit11_t8`, exact at `11573/23/266179`, improving
  the previous best `11616/23/267168`.
- Follow-up low-bit single covers (`bit10`, `bit9`, `bit8`, `bit7`) did not
  beat bit11.  Best low-bit candidate was bit8 at ADP `267030`.
- Follow-up multi-bit run-cover combinations found
  `ex225_fp16_log10_bitrun_bits12_9_t32`, exact at `11533/23/265259`.
- Re-emitting that same Verilog through the fixed single Yosys `abc -g aig`
  path produced `ex225_bitrun_bits12_9_t32_abc_g_aig`, official
  `evaluate.py --case ex225` OK at `11499/22/252978`.
- Exclusion: broad special-shell or interval casez compression increases delay
  and area.  Targeted selected-bit replacement can help, but only when the bit
  is critical; broad multi-bit and casez-sign combinations were mostly worse.
  Next useful direction is a true exponent-base plus mantissa correction
  normalizer, not another full positive-normal table rewrite.

## 2026-06-07 Semantic Normalizer Attempt

- Extended `student/generators/fp16_log_deep_semantic.py` to support
  `ex225/log10` and ran a targeted semantic normalizer:
  `base = (exp - bias) * log10(2)` plus a `log10(1.mant)` correction LUT,
  FP16 rounding, and exact exception correction.
- Exact best source candidate:
  `ex225_fp16_log10_fixed_q20_calibrated_exc`, `4061/73/296453`.
- A single `abc_g_aig` synthflow check improved that low-area semantic seed to
  `4028/70/281960`, still worse than the then-current best
  `11509/21/241689`.
- Bucketed const-exp and signsplit normalizers were exact but worse:
  bucket q20/q21 `450135`/`484570`; signsplit q20/q21 `346389`/`349488`.
- Exclusion: pure fixed-point log10 normalization is semantically correct and
  area-efficient, but the normalization/rounding/exception path is too deep
  under the current Yosys AIG flow.  Do not retry wider q-table variants unless
  the normalizer is made structurally shallower.

## 2026-06-07 Shallow Correction Deepening

- Re-emitted the near-miss bit-combo candidates with `abc_g_aig`.  Closest was
  `bits10_12_t16_abc_g_aig`, `11500/22/253000`, still worse than current.
- Added shared vector run-covers for selected output bits.  `bitvec_bits12_9`
  plus `abc_g_aig` reduced delay to 21 and improved ADP to
  `11512/21/241752`.
- Adding bit14 into the vector gave `11511/21/241731`; adding bit13 lowered
  area but increased delay to 22, so ADP was worse.
- Hand-derived bit14 threshold formula plus bitvec12/9 was best:
  `manual_ex225_bitvec12_9_bit14_abc_g_aig`, official `evaluate.py --case
  ex225` OK at `11509/21/241689`.
- Tested and excluded:
  - manual bit13 and bit12 formulas: lower/near area but delay 22.
  - threshold 16 table fallback for bitvec12/9: `11570/22/254540`.
  - packed table for non-overridden bits: `11650/22/256300`.
  - sparse sign-exp decoder for bitvec12/9: worse than auto case structure.
  - compact Boolean rewrite of bit14 predicate: `11598/22/255156`.
  - `abc_g_aig_d18` through `abc_g_aig_d21`: all reproduced
    `11509/21/241689`; `gates`/`cmos2` were worse.
- Current interpretation: the best shallow exact correction is manual bit14
  plus shared bit12/9 vector cover.  Further improvement likely needs a new
  way to reduce the bit9 transition tree or a different table sharing structure
  that keeps delay 21.

## 2026-06-07 Deeper Correction Search

- Looked up hardware elementary-function/table literature and translated the
  relevant exact-safe ideas into source-level experiments:
  - bipartite/multipartite-style high/low mantissa split,
  - lossless LUT decomposition/compression ideas,
  - piecewise/logarithm hardware structures using small LUT/correction stages,
  - BDD-style selected-bit logic.
- Added focused generator:
  `student/generators/fp16_ex225_hilo_correction.py`.
- High/low mantissa split for bit9/bit12:
  - Source best: `manual14_vec12_9_hilo_h4`, `11522/23/265006`.
  - After `abc_g_aig`, all high/low rows were checked; best was
    `manual14_vec12_9_hilo_h4_abc_g_aig`, `11477/22/252494`.
  - Exclusion: area can drop below current best, but delay stays 22 or area
    rises when delay returns to 21.
- Threshold-parity/toggle cover:
  - Best after `abc_g_aig`: `11520/22/253440`.
  - Exclusion: many parallel threshold comparisons plus XOR synthesize deeper
    than the current balanced run cover.
- Aligned `casez` cube covers for the complex `sign_exp=0x0e/0x0f` branches:
  - Best after `abc_g_aig`: `11584/22/254848`.
  - Exclusion: cube patterns do not beat comparator-tree factoring in AIG.
- Manual sign and manual bit13/bit12 cross-checks:
  - Best low-area seed was `manual15cmp_14_13_bitvec12_9_abc_g_aig`,
    `11471/22/252362`.
  - No-sign manual13 variants reached `11475/22/252450`.
  - Exclusion: useful as low-area alternatives, but every good one pays one
    extra delay level.
- ROBDD selected-bit attempts:
  - `bit12/bit9` BDD with sign-exp then mantissa-MSB order was close after
    `abc_g_aig`: `11554/21/242634`.
  - Other BDD orders were worse; all-bit BDD was exact but too deep
    (`11606/26/301756` after fixing the manual-bit wire bug).
  - Exclusion: selected-bit BDD is a valid backup seed but cannot reduce area
    below the current `11509/21` best at the same delay.
- Packed remaining-bits run table:
  - Best source candidate `t128` was `12360/25/309000`; after `abc_g_aig`,
    `12316/23/283268`.
  - Exclusion: run-compressing the full packed table saves source items but
    explodes mux/comparator depth.
- Current-best source with `parallel_case/full_case` attributes reproduced the
  same then-current `11509/21/241689`; attributes do not affect that seed.
- Best at the end of this round:
  `manual_ex225_bitvec12_9_bit14_abc_g_aig`, `11509/21/241689`, reference
  ratio `2.071454`.
- Stop rationale for this round:
  - semantic normalizer is exact and low-area but delay 70;
  - table compression, cube, high/low, BDD, toggle, manual sign/bit13, and
    Yosys-script variants were all exact-tested and fail to beat current ADP;
  - the observed frontier is either delay 21 with area >= 11509, or area <
    11509 with delay 22.

## 2026-06-07 Shared Predecode Breakthrough

- Added architecture-level variants to
  `student/generators/fp16_ex225_hilo_correction.py`:
  - multi-terminal BDD (MTBDD) shared across selected output bits,
  - shared threshold-predecode networks for bit12/bit9 and related high bits,
  - mixed predecode/tree hybrids for only complex `sign_exp` groups,
  - sign predicate style neighbors.
- MTBDD was exact but did not improve:
  - source candidates were `11595/23`, `11656/25`, `11625/23`,
    `11687/23`, `11686/24`.
  - after `abc_g_aig`, best was `manual14_mtbdd13_12_9_interleave`,
    `11653/21/244713`; delay 21 but area too high.
- Shared threshold predecode succeeded:
  - `manual15_14_13_predecode12_9_abc_g_aig`:
    `11488/21/241248`, official evaluate wrapper OK.
  - Structure: manual sign, bit14, and bit13 predicates; shared global
    threshold predecode for bit12/bit9.
  - This breaks the previous frontier by keeping delay 21 while dropping area
    from `11509` to `11488`.
- Neighbor/exclusion results:
  - `manual15bits_14_13_predecode12_9`: `11463/22/252186`, lower area but
    delay 22; delay targets `d18..d21` reproduced `11463/22`.
  - `manual15_14_predecode13_12_9`: `11484/22/252648`, delay 22.
  - `manual15bits2_14_13_predecode12_9`: `11482/22/252604`, delay 22.
  - mixed predecode only on complex groups (`0x0e/0x0f`, plus neighbors) all
    stayed delay 22 after `abc_g_aig`; best `11497/22/252934`.
  - New best Yosys neighbors `abc_g_aig_d18..d21` reproduced
    `11488/21/241248`; `extra_opt_share`, `synth_preset`, `gates`, and
    `cmos2` were worse.
- Curated seed bundle updated:
  `student/seeds/fp16/ex225_ex229_frontend_fp16_bitrun_shells_current/`.
- Current best:
  `ex225_manual15_14_13_predecode12_9_abc_g_aig`,
  `11488/21/241248`, reference ratio `2.067675`.

## 2026-06-07 Log-Family Nested Mantissa Follow-Up

Generator:
- `student/generators/fp16_log_nested_semantic.py`

Curated seed:
- `student/seeds/fp16/ex223_ex225_frontend_fp16_log_nested_current_20260607_2140/`

Best result:
- `ex225_log_nested_low12_hi5_abc_g_aig`, official `evaluate.py` OK at
  `11533/19/219127`, reference ratio `1.878081`.

Structure:
- Non-positive/special sign-exp groups are exact special/default table.
- Positive-normal log10 region is split by sign+exponent.
- Output high bits are per-exp mantissa run trees.
- Output low12 bits use a nested mantissa hi5/lo5 LUT.

Delta from previous best:
- Previous current best was `manual15_14_13_predecode12_9_abc_g_aig`,
  `11488/21/241248`.
- New nested seed raises area by 45 but cuts delay from 21 to 19, improving ADP
  by `22121`.

Exclusions from this nested family:
- `low8`, `low9`, and `low11` were exact and improved earlier rows, but
  `low12_hi5` was best.
- `low12_hi6`, `low13_hi5`, and `low13_hi6` did not beat `low12_hi5`.
- `hi4` gave lower area on some rows but delay 20; `hi6/hi7` generally raised
  area too much for ex225.

Next useful direction:
- The nested source is now the best exact frontend seed, but it is still above
  `1.5x` reference.  Future work should target a shallower arithmetic
  exponent-base/mantissa-correction normalizer, or compress the low12 nested
  LUT without reintroducing the high delay seen in the fixed-point normalizer.

## 2026-06-12 mixed-r12 diagnostic

Run ID: `ex200_ex299_frontend_refgap_round12_20260612_2015`, agent `mixed-r12`.

- Method signature: `ex225|fp16_log10_non_nested_normalizer|diagnostic_only|shared_field_decode_without_sparse_or_nested_low_replay|not_run|DAZ_log10_FP16_RNE_FTZ|blocker`.
- Diagnostic artifact: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round12_20260612_2015/agent_shards/mixed-r12/fp_bf_unary_diagnostics.csv`.
- Evidence: `positive_total_mode_exceptions=30480`, `sign_exp_full_groups=33`, `negative_canonical_nan=31744`.
- Outcome: no candidate generated. Sparse residual defaults, mant0-base additive/XOR residuals, and full-bitrun predicates are already official nonwinning rows; next work needs a true shallow log10 correction formula.

## 2026-06-12 fp-bf-r13 checkpoint diagnostic

Run ID: `ex200_ex299_frontend_refgap_round13_20260612_2045`, agent `fp-bf-r13`.

- Method signature: `ex225|fp16_log10_non_nested_segmented_residual|diagnostic_blocker|shared_field_decode_plus_range_symmetry_output_predicates|not_run|DAZ_log10_FP16_RNE_FTZ|blocker`.
- Dossier: `student/work/ex200_ex299_frontend_refgap_round13_20260612_2045/fp-bf-r13/ex225/dossiers/ex225_semantic_dossier.md`.
- Diagnostic artifact: `student/work/ex200_ex299_frontend_refgap_round13_20260612_2045/fp-bf-r13/ex225/diagnostics/ex225_non_nested_blocker_metrics.csv`.
- Evidence: positive-normal region has `30720` inputs and `9791` exact word runs; low12 residual has `9745` distinct words and `9761` adjacent changes; hi3/lo7, hi4/lo6, and hi5/lo5 segmentations have zero repeated block shapes; mirror symmetry has zero exact, constant-XOR, or constant-additive matching groups.
- Outcome: no candidate generated. This is a fresh blocker for range/symmetry segmented mantissa transforms and output-grouped residual predicates beyond the already-known high-bit predicates. Any exact candidate in this family would replay the prohibited dense nested/sparse residual table shape.

## 2026-06-12 fpbf-normal-r17 hard checkpoint

Run ID: `ex200_ex299_frontend_refgap_round17_20260612_2300`, agent `fpbf-normal-r17`.

- Method signature: `ex225|fp16_log10_selected_output_arith_exact_patch_probe|diagnostic_blocker|exact_exception_shell_plus_dense_lowbit_patch_audit|not_run|DAZ_log10_FP16_RNE_FTZ|blocker`.
- Evidence artifact: `student/work/ex200_ex299_frontend_refgap_round17_20260612_2300/fpbf-normal-r17/ex225/diagnostics/ex225_round17_blocked_no_candidate_evidence.md`.
- Shard rows: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round17_20260612_2300/agent_shards/fpbf-normal-r17/failed_hypotheses.csv` and `evaluation_results.csv`.
- Outcome: `BLOCKED_NO_CANDIDATE`; no Verilog/AIG candidate was claimed. The hard-checkpoint audit kept the scope to first-priority `ex225` and found that any exact selected-output arithmetic approximant with exception patching would still need dense low-bit correction. That would replay prohibited dense residual or nested-low table forms because prior diagnostics already show low12 residual density (`9745` distinct words, `9761` adjacent changes) and no reusable hi3/lo7 through hi6/lo4 segment shapes.
- Next action: only revisit `ex225` with a genuinely new shallow `log10` correction formula or a synthesis strategy that shares dense low-bit predicates without materializing residual tables.

## 2026-06-13 fp16-r22 round22 diagnostic

Run ID: `ex200_ex299_frontend_refgap_round22_20260613_0218`, agent `fp16-r22`.

- Method signature: `ex225|fp16_log10_non_nested_segment_mode_base_probe|diagnostic_blocker|shared_field_decode_plus_segment_shape_mode_base_metrics|not_run|DAZ_log10_FP16_RNE_FTZ|blocked`.
- Dossier: `student/work/ex200_ex299_frontend_refgap_round22_20260613_0218/fp16-r22/ex225/dossiers/ex225_semantic_dossier.md`.
- Evidence artifact: `student/work/ex200_ex299_frontend_refgap_round22_20260613_0218/fp16-r22/ex225/diagnostics/ex225_round22_blocker_evidence.md`.
- Shard rows: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round22_20260613_0218/agent_shards/fp16-r22/failed_hypotheses.csv`, `evaluation_results.csv`, and `shared_structure_report.csv`.
- Outcome: `BLOCKED_NO_CANDIDATE`; no Verilog/AIG candidate was claimed. The round22 audit re-derived the FP16 `log10` shell and checked a materially different non-nested segment/mode/base family. Positive-normal density remains high (`9769` distinct words, `9791` word runs), low12 residual density is still `9745` distinct values with `9761` changes, hi3/lo7 through hi6/lo4 segmentations have zero repeated block shapes, and the best mode patch tested (`exp+mant_hi8`) still leaves `8653` exceptions.
- Next action: only revisit with a genuinely new shallow exact `log10` correction formula or a synthesis method that shares dense low-bit predicates without materializing nested/sparse residual tables.

## 2026-06-13 mixed-r25 diagnostic

Run ID: `ex200_ex299_frontend_refgap_round25_20260613_0506`, agent `mixed-r25`.

- Dossier: `student/work/ex200_ex299_frontend_refgap_round25_20260613_0506/mixed-r25/ex225/notes/dossier.md`.
- Method signatures:
  - `ex225|fp16_log_family_dense_residual_blocker_non_nested_segment_shape_recheck|segment hi3..hi6 shape reuse diagnostic|shared_field_decode_metrics_only|not_run|DAZ_log10_FP16_RNE_FTZ|diagnostic_blocker`.
  - `ex225|fp16_log_family_dense_residual_blocker_selected_output_arith_patch_recheck|dense low12 residual exact-patch diagnostic|shared_field_decode_metrics_only|not_run|DAZ_log10_FP16_RNE_FTZ|diagnostic_blocker`.
- Evidence: `student/work/ex200_ex299_frontend_refgap_round25_20260613_0506/mixed-r25/ex225/diagnostics/ex225_round25_dense_metrics.csv` and `ex225_round25_segment_shapes.csv`.
- Outcome: no Verilog/AIG candidate was claimed because round25 explicitly banned nested-LUT replay and the fresh metrics did not expose exact shared segment structure. Next action should require a true shallow log10 correction formula or a new synthesis strategy for dense low-bit sharing.

## 2026-06-13 mixed-r26 diagnostic

Run ID: `ex200_ex299_frontend_refgap_round26_20260613_0539`, agent `mixed-r26`.

- Dossier: `student/work/ex200_ex299_frontend_refgap_round26_20260613_0539/mixed-r26/ex225/notes/dossier.md`.
- Method signatures:
  - `ex225|fp16_log_family_dense_residual_blocker_non_nested_segment_shape_recheck|segment hi3..hi6 shape reuse diagnostic|shared_field_decode_metrics_only|not_run|DAZ_log10_FP16_RNE_FTZ|diagnostic_blocker`.
  - `ex225|fp16_log_family_dense_residual_blocker_selected_output_arith_patch_recheck|dense low12 residual exact-patch diagnostic|shared_field_decode_metrics_only|not_run|DAZ_log10_FP16_RNE_FTZ|diagnostic_blocker`.
- Evidence: `student/work/ex200_ex299_frontend_refgap_round26_20260613_0539/mixed-r26/ex225/diagnostics/ex225_round26_dense_metrics.csv` and `ex225_round26_segment_shapes.csv`.
- Outcome: diagnostic only; no Verilog/AIG candidate was claimed. The positive-normal residual remains dense with no reused segment shapes in hi3..hi6, so nested/sparse/full-bitrun replay remains blocked.

## 2026-06-13 sub-fp16-r74 round74

Run ID: `frontend_source_parallel_round74_20260613_1439`, agent `sub-fp16-r74`.

- Dossier: `student/work/frontend_source_parallel_round74_20260613_1439/sub-fp16-r74/ex225/dossier.md`.
- Families tested:
  - `ex225|fp16_log10_r74_low10_nested_cut|low10_hi7_nested_lut|shared_special_decode_plus_highbit_runs|yosys_abc_g_aig|abc_xf_official_evaluate|not_round73_segword_or_wordrun`.
  - `ex225|fp16_log10_r74_flat_low10_table|flat_low10_plus_highbit_runs|shared_special_decode_no_nested_low_lut|yosys_abc_g_aig|abc_xf_official_evaluate|not_round73_segword_or_wordrun`.
- Official `evaluate.py` results:
  - `ex225_r74_nested_low10_hi7_abc_g_aig`: `14599/18/262782`, equivalent.
  - `ex225_r74_flat_low10_hi_runs_abc_g_aig`: `11418/22/251196`, equivalent.
- Outcome: both are exact but nonwinning versus current frontend ADP `218728`; the flat low10 form lowers area but delay rises to 22. Do not repeat these exact r74 low10 signatures. Next useful direction still needs a genuinely shallow exact `log10` correction formula or a new synthesis strategy for dense low-bit sharing.

## 2026-06-13 sub-fp16-r75 round75

Run ID: `frontend_source_parallel_round75_20260613_1507`, agent `sub-fp16-r75`.

- Dossier: `student/work/frontend_source_parallel_round75_20260613_1507/sub-fp16-r75/ex225/dossier.md`.
- Family 1 method signature: `ex225|fp16_log10_r75_output_grouped_low_mtbdd|hi12_runs_low12_mtbdd|shared_special_decode_plus_highbit_run_trees_and_shared_low_mtbdd|yosys_abc_g_aig|abc_xf_official_evaluate|low12_mtbdd_not_round74_low10`.
- Family 2 method signature: `ex225|fp16_log10_r75_output_grouped_low_mtbdd|hi8_runs_low8_mtbdd|shared_special_decode_plus_highbit_run_trees_and_shared_low_mtbdd|yosys_abc_g_aig|abc_xf_official_evaluate|low8_mtbdd_not_round74_low10`.
- Official `evaluate.py` results:
  - `ex225_r75_hi12_runs_low12_mtbdd_abc_g_aig`: `11656/24/279744`, equivalent.
  - `ex225_r75_hi8_runs_low8_mtbdd_abc_g_aig`: `11619/24/278856`, equivalent.
- Paths: shard CSVs under `student/frontend_campaigns/campaigns/frontend_source_parallel_round75_20260613_1507/agent_shards/sub-fp16-r75/`; Verilog/AIG/logs under `student/work/frontend_source_parallel_round75_20260613_1507/sub-fp16-r75/ex225/`; official eval copies under `student/runs/fp16/frontend_source_parallel_round75_20260613_1507/sub-fp16-r75/ex225/official_eval/`.
- Outcome: both source families are exact and materially different from round74 low10 nested/flat and round73 segword/wordrun threshold variants, but neither beats current frontend ADP `218728` or overall current ADP `205656`. The low8 MTBDD cut was better than low12 within this family, but delay `24` dominates; future work should avoid moving dense low residuals into a shared MTBDD unless a shallower output grouping/order is found.

## 2026-06-13 sub-fp16-r76 round76

Run ID: `frontend_source_parallel_round76_20260613_1706`, agent `sub-fp16-r76`.

Families tested:
- `segbase_delta_lo5`: `ex225|exact_log/log10_exponent-region_affine_boundary_delta|sign-exp_plus_mant_hi5_base_word_with_exact_mant_lo5_modular_delta|shared_special_shell_and_shared_per-region_base_feeding_one_16-bit_delta_adder|yosys_abc_g_aig|abc_xf_official_evaluate|r76_segbase_delta_lo5`.
- `ratio_xor_lo6`: `ex225|positive-normal_mantissa_quotient/ratio_descriptor|mant_hi4_leading-ratio_class_base_word_plus_exact_mant_lo6_XOR_residual|shared_leading-region_predicate_and_one_semantic-class_residual_family|yosys_abc_g_aig|abc_xf_official_evaluate|r76_ratio_xor_lo6`.

Official `evaluate.py` results:
- `ex225_r76_segbase_delta_lo5_segbase_delta_lo5_abc_g_aig`: `12727/46/585442`, equivalent.
- `ex225_r76_ratio_xor_lo6_ratio_xor_lo6_abc_g_aig`: `12728/21/267288`, equivalent.

Paths: shard CSVs under `student/frontend_campaigns/campaigns/frontend_source_parallel_round76_20260613_1706/agent_shards/sub-fp16-r76/`; Verilog/AIG/logs under `student/work/frontend_source_parallel_round76_20260613_1706/sub-fp16-r76/ex225/`; official eval copies under `student/runs/fp16/frontend_source_parallel_round76_20260613_1706/sub-fp16-r76/ex225/official_eval/`.
Outcome: best round76 row is `ex225_r76_ratio_xor_lo6_ratio_xor_lo6_abc_g_aig` at ADP `267288`; it did not beat current/reference. The boundary-delta and ratio-class descriptors are materially different from r75 direct-special/MTBDD and prior nested/sparse low-table repeats, but QoR should be treated as source evidence unless a coordinator merges it.

## 2026-06-13 round77 sub-fp16-source-r77

Run ID: `frontend_source_parallel_round77_20260613_1733`, agent `sub-fp16-source-r77`.

- Direction: source-boundary reshaping around current nested log/log10 source and the registry frontend-best source, avoiding r76 ratio-XOR/segbase-delta and r75 sparse/MTBDD/direct-special families as-is.
- Families tested: selective decode/high-bit `keep`, high-vs-low grouped output assigns, and positive-normal predicate helper module for the generated nested source; selective `keep` and high/low output grouping for the registry frontend-best source.
- Official result: best shard row `ex225_r77_frontendbest_decode_keep_abc_g_aig`: `11531/19/219089`; beats current/frontend/reference = `0/0/0`.
- Candidate rows: `student/runs/fp16/frontend_source_parallel_round77_20260613_1733/sub-fp16-source-r77/ex225/results/candidates.csv`.
- Evaluation rows: `student/runs/fp16/frontend_source_parallel_round77_20260613_1733/sub-fp16-source-r77/ex225/results/evaluation_results.csv`.
- Failed rows: `student/runs/fp16/frontend_source_parallel_round77_20260613_1733/sub-fp16-source-r77/ex225/results/failed_hypotheses.csv`.
- Work path: `student/work/frontend_source_parallel_round77_20260613_1733/sub-fp16-source-r77/ex225`.
- Next action: only continue this boundary direction if a coordinator wants lower-area delay-19/21 neighbors; otherwise a true shallow exact log correction remains the larger gap.

## 2026-06-14 arith-unary-r2 continuation

Run ID: `ex204_ex299_frontend_continuation_20260614_1216`, agent `arith-unary-r2`.

- Families tested: positive-normal exponent-group high-bit run trees plus nested mantissa low LUT; FP16 bit-run/casez/manual bit-vector hybrids.
- Official best from this shard: `ex225_log_nested_low13_hi4_abc_g_aig` at `11243/20/224860`.
- Outcome: all rows were official equivalent but nonwinning versus frontend `11505/19/218595`; bit-vector/casez best was `11551/24/277224`.

## 2026-06-14 fp16-transfer-r1 campaign

Run ID: `ex223_ex225_frontend_fp16_transfer_20260614_1310`, agent `fp16-transfer-r1`.

- Direction: transfer the `ex221` active sign/exponent nested-low and word-mode residual structures to this FP16 log10 case.
- Official `evaluate.py` OK but nonwinning candidates:
  - `ex225_transfer_nested_low10_hi5_abc_g_aig`: `11608/19/220552`.
  - `ex225_transfer_nested_low9_hi6_abc_g_aig`: `12842/18/231156`.
  - `ex225_transfer_wordmode_mh5_abc_g_aig`: `11532/19/219108`.
- Outcome: all candidates were equivalent but worse than current frontend best `218595`. The word-mode mh5 form was close (`+513` ADP versus best) but should not be repeated unchanged; only a materially different correction-sharing/output-grouping variant is worth trying.
- Artifacts: `student/frontend_campaigns/campaigns/ex223_ex225_frontend_fp16_transfer_20260614_1310/results/evaluation_results.csv`; work under `student/work/ex223_ex225_frontend_fp16_transfer_20260614_1310/fp16-transfer-r1/ex225/`.
