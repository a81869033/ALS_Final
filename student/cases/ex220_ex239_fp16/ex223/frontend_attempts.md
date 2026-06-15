# ex223 FP16 Frontend Attempts

Function hypothesis: `fp16_log`.

Current known best:
- Run: `ex223_ex224_frontend_yosys_synthflow_20260607_0910`
- Verilog seed: `casez_sign` from `ex223_ex224_frontend_fp16_bitlogic3_20260606_2344`
- Synthesis flow: Yosys internal `abc -g aig`
- QoR: `11148/21/234108`
- Reference ADP: `120549`
- Ratio: `1.942015`
- Classification: `synthflow_exact`

Next maintenance items:
- High priority: current ADP is far above reference.
- Verify true DAZ + ln(x) + FP16 RNE + FTZ + canonical NaN semantics.
- Derive exponent-base plus mantissa-correction RTL before using structural cases.
- Record negative/zero/inf/NaN behavior and any selected-bit boundary formulas.

## 2026-06-06 Targeted Run

Run: `ex220_ex224_frontend_fp16_semantic_20260606_2050`

Truth/semantic facts:
- Function hypothesis remains FP16 natural `log`.
- Zero and denormal inputs map to `-inf`; negative nonzero inputs map to
  canonical NaN; positive `+inf` maps to `+inf`; NaN maps to canonical NaN.
- Positive normal exponent groups are the only groups that need mantissa
  kernel lookup.

Verified candidates tried:
- `sign_exp_mant_case`: `11164/23/256772`, best.
- `positive_default_exp_mant_case`: `11164/24/267936`.
- `exp_mant_pair_case`: `11174/24/268176`.
- `log_mant0_fastpath`: `11480/24/275520`.
- `split_sign_exp_mant_case`: `12159/23/279650`.
- `log_special_shell`: `12162/23/279725`.
- `log_positive_field_split`: `12159/23/279675`.
- `semantic_exp_delta_fields`: `12713/23/292396`.
- `log_positive_base_delta`: `12726/23/292708`.
- `log_limited_run_range`: much worse, `1728036` ADP.

Conclusion:
- Hand-written semantic shells were exact but did not beat the direct
  sign-exp-mant source.  Continue to prioritize a real exponent-base plus
  shared mantissa-correction arithmetic model; do not expand range-comparator
  compression without a balancing rewrite.

## 2026-06-06 Deep Follow-Up

Runs:
- `ex223_ex224_frontend_fp16_log_deep_20260606_2209`
- `ex223_ex224_frontend_fp16_log_deep2_20260606_2224`
- `ex223_ex224_frontend_fp16_log_selected_20260606_2236`
- `ex223_ex224_frontend_fp16_log_ranges_20260606_2256`
- `ex223_ex224_frontend_fp16_log_signsplit_20260606_2305`
- `ex223_ex224_frontend_fp16_log_caseattrs_20260606_2312`
- `ex223_ex224_frontend_fp16_log_casez_20260606_2319`

Combined result:
- 57 exact equivalent candidates for `ex223` across these follow-up directions.
- Best remains `sign_exp_mant_case` / `sign_exp_mant_attr_*`, `11164/23/256772`.
- Closest new candidate: `hybrid_semantic_bit15`, `11258/23/258934`.

Directions tried and excluded:
- Fixed-point semantic model: confirmed real structure `ln(x) = (exp-15)*ln2 + ln(1.mant)`, but best ADP was `346178` because delay reached `79`.
- Bucketed constant-output-exponent rewrite: exact but duplicated q-LUT and local tables; best ADP `466560`.
- Selected-bit hybrid: exact; replacing only sign bit was close, but all exponent/mantissa bit replacements carried too much arithmetic depth.
- Balanced range tree: fixed the previous linear-chain delay issue, but best ADP `312234` still lost to direct table.
- Sign-known abs rewrite: exact but did not reduce the true bottleneck.
- `parallel_case/full_case` attributes: no QoR change.
- `casez` interval cubes: fewer source entries than full table, but worse AIG after Yosys; best ADP `344775`.

Current conclusion:
- The semantic fixed-point structure is real, but source-level arithmetic forms
  are too deep under the current Yosys-to-AIG flow.
- The current best table likely benefits from bit-level sharing that these
  semantic rewrites break.  A future attempt should target per-output-bit PLA
  minimization or a custom shallow prefix/normalizer, not another table
  rearrangement.

## 2026-06-06/07 Bit-Level Follow-Up

Runs:
- `ex223_ex224_frontend_fp16_bitlogic3_20260606_2344`
- `ex223_ex224_frontend_fp16_bitlogic4_20260606_2354`

New best:
- `casez_sign`: `11189/22/246158`, official `evaluate.py` recheck OK.
- Improvement over old `sign_exp_mant_case`: `256772 -> 246158`, `10614`
  ADP lower, about `4.13%`.

What changed:
- Per-output-bit run statistics showed the output sign bit has a very small
  sign/exponent-only cover.
- Replacing only output bit15 with a hand `casez` interval cover lowered the
  critical delay from `23` to `22`.
- The exact sign rule is shared with `log2`: output sign is `1` for
  zero/denormal inputs and for positive inputs with exponent `< 15`; otherwise
  it is `0`.

Directions tried and excluded:
- Comparator/boolean sign formulas verified exact but synthesized worse than
  the `casez` interval cover.
- Single-bit replacements for bit14 through bit8 mostly increased ADP; bit14
  alone improved relative to the old table but did not beat `casez_sign`.
- Combining `casez_sign` with bit14, bit12, bit11, bit9, or multi-bit covers
  increased delay back to `23` or raised area enough to lose ADP.

Current conclusion:
- For `ex223`, the useful frontend-only simplification is very local: keep the
  direct sign-exp-mant table for bits14:0 and override only output sign with
  the shallow `casez` sign/exponent cover.

## 2026-06-07 Deeper Structural Follow-Up

Run:
- `ex223_ex224_frontend_fp16_bitvec_20260607_0050`
- `ex223_ex224_frontend_fp16_masked_run_20260607_0813`

Hypothesis:
- The previous best might still duplicate sign/exp decode between selected
  high-bit modules.  A joint vector-bit cover could share decode and mantissa
  range boundaries for sign plus nearby exponent bits.

Verified candidates:
- `bitvec_bits11_12_t32`: `11185/23/257255`.
- `bitvec_sign_bit14_t16`: `11253/23/258819`.
- `bitvec_sign_bits11_12_t32`: `11263/24/270312`.
- `masked_table_casez_sign`: `11261/23/259003`.
- `masked_run_casez_sign`: `19264/30/577920`.

Conclusion:
- Joint vector-bit covers are exact but worse.  Combining output sign with
  bit14 or bits11/12 creates a more complex boundary set and increases delay,
  so the current best remains the single `casez_sign` override.
- Additional semantic sharing for natural log was rechecked analytically:
  unlike `log2`, exponent bands do not have exact shared mantissa-delta
  clusters.  Many positive/negative correction pairs differ by one ULP, but
  making them exact would require patch logic plus arithmetic, matching the
  already-excluded fixed-point semantic direction that had excessive delay.
- Explicit masked table output did not improve `ex223`; balanced run-tree
  encoding of the remaining table bits was much worse.  This confirms the
  single sign override is still the best known frontend-only source structure.

## 2026-06-07 Current-Best Stress Follow-Up

Runs:
- `ex223_frontend_fp16_manualbit_20260607_0850`
- `ex223_ex224_frontend_fp16_hybrid_attrs_20260607_0915`
- `ex223_ex224_frontend_fp16_specialshell_current_20260607_0925`

Hypotheses:
- Output bit14 has only two dynamic sign/exponent groups and might be cheaper
  as a hand-written threshold formula than inside the table.
- `parallel_case/full_case` attributes might help the current `casez_sign`
  hybrid.
- A semantic special-case shell might reduce table cost by removing negative
  and exceptional constant groups.

Verified candidates:
- `manual_ex223_sign_bit14`: `11191/23/257393`.
- `attr_casez_sign`: `11189/22/246158`.
- `special_casez_sign`: `11193/25/279825`.

Conclusion:
- Hand bit14 logic was exact, with rule:
  negative inputs are `1`; positive `exp<=11` or `exp>=18` are `1`;
  `exp=12` uses `mant<=85`; `exp=17` uses `mant>=867`; otherwise `0`.
  It still raised delay to `23`, so bit14 should remain in the table.
- Attributes do not change the current best QoR.
- Special-shell positive-normal tables are much worse, confirming that the
  current full sign-exp table shares logic across special and normal groups in
  a way Yosys can exploit.
- The current best remains `casez_sign`, `11189/22/246158`.

## 2026-06-07 Yosys Synthflow Follow-Up

Run:
- `ex223_ex224_frontend_yosys_synthflow_20260607_0910`

Hypothesis:
- The current `casez_sign` Verilog seed may be good, but the fixed Yosys
  synthesis script might not be the best way to map it into an AIG.

Verified candidates:
- Previous flow recheck (`abc -g AND`): `11189/22/246158`.
- `abc_g_aig`: `11148/21/234108`, official `evaluate.py` OK.
- `synth_preset`: `10990/23/252770`.
- `no_internal_abc`: `15406/26/400556`.
- `abc_fast`: `14965/26/389090`.

Conclusion:
- New current synthflow best is `abc_g_aig`, `11148/21/234108`.
- Improvement over previous best: `246158 -> 234108`, `12050` ADP lower.
- The useful knob is changing Yosys internal ABC from `abc -g AND` to
  `abc -g aig` before `aigmap`; delay-target `-D` values did not change QoR.
- Follow-up `abc -g aig -D 18/19/20/21` reproduced the same `11148/21/234108`
  result; `gates` and `cmos2` aliases were worse.

## 2026-06-12 mixed-r12 diagnostic

Run ID: `ex200_ex299_frontend_refgap_round12_20260612_2015`, agent `mixed-r12`.

- Method signature: `ex223|fp16_log_non_nested_normalizer|diagnostic_only|shared_field_decode_without_nested_low_replay|not_run|DAZ_log_FP16_RNE_FTZ|blocker`.
- Diagnostic artifact: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round12_20260612_2015/agent_shards/mixed-r12/fp_bf_unary_diagnostics.csv`.
- Evidence: `positive_total_mode_exceptions=30476`, `sign_exp_full_groups=33`, `negative_canonical_nan=31744`.
- Outcome: no candidate generated. Dense positive residuals mean an exact low-bit residual would replay the existing nested-low family; useful next work needs a genuinely shallow non-nested log normalizer.

## 2026-06-12 fpbf-alt-r18 round18 diagnostic

Run ID: `ex200_ex299_frontend_refgap_round18_20260612_2321`, agent `fpbf-alt-r18`.

- Method signature: `ex223|fp16_log_non_nested_bitplane_range_patch|diagnostic_blocker|sign_exp_shell_plus_dominant_range_patch_and_highbit_planes|not_run|DAZ_log_FP16_RNE_FTZ|blocker`.
- Dossier: `student/work/ex200_ex299_frontend_refgap_round18_20260612_2321/fpbf-alt-r18/ex223/dossiers/ex223_semantic_dossier.md`.
- Evidence artifact: `student/work/ex200_ex299_frontend_refgap_round18_20260612_2321/fpbf-alt-r18/ex223/diagnostics/ex223_round18_blocker_evidence.md`.
- Shard rows: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round18_20260612_2321/agent_shards/fpbf-alt-r18/failed_hypotheses.csv`, `evaluation_results.csv`, and `shared_structure_report.csv`.
- Outcome: `BLOCKED_NO_CANDIDATE`; no Verilog/AIG candidate was claimed. The non-nested sign/exponent shell plus dominant range patch was materially different from sparse residual and nested-low replay, but the positive-normal region still has `9716` distinct output words and the best tested `exp+mant_hi8` patch leaves `8532` exceptions over `30720` samples.
- Next action: only revisit with a true shallow natural-log correction formula or a synthesis strategy that shares dense low-bit predicates without materializing residual/nested tables.

## 2026-06-13 fp16-r22 round22 diagnostic

Run ID: `ex200_ex299_frontend_refgap_round22_20260613_0218`, agent `fp16-r22`.

- Method signature: `ex223|fp16_log_non_nested_segment_mode_base_probe|diagnostic_blocker|shared_field_decode_plus_segment_shape_mode_base_metrics|not_run|DAZ_log_FP16_RNE_FTZ|blocked`.
- Dossier: `student/work/ex200_ex299_frontend_refgap_round22_20260613_0218/fp16-r22/ex223/dossiers/ex223_semantic_dossier.md`.
- Evidence artifact: `student/work/ex200_ex299_frontend_refgap_round22_20260613_0218/fp16-r22/ex223/diagnostics/ex223_round22_blocker_evidence.md`.
- Shard rows: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round22_20260613_0218/agent_shards/fp16-r22/failed_hypotheses.csv`, `evaluation_results.csv`, and `shared_structure_report.csv`.
- Outcome: `BLOCKED_NO_CANDIDATE`; no Verilog/AIG candidate was claimed. The round22 audit checked a materially different non-nested segment/mode/base family. Positive-normal density remains high (`9716` distinct words, `9736` word runs), low12 residual density is `9691` distinct values, hi3/lo7 through hi6/lo4 segmentations have zero repeated block shapes, and the best mode patch tested (`exp+mant_hi8`) still leaves `8532` exceptions.
- Next action: only revisit with a true shallow natural-log correction formula or a synthesis strategy that shares dense low-bit predicates without materializing nested/sparse residual tables.

## 2026-06-13 mixed-r25 diagnostic

Run ID: `ex200_ex299_frontend_refgap_round25_20260613_0506`, agent `mixed-r25`.

- Dossier: `student/work/ex200_ex299_frontend_refgap_round25_20260613_0506/mixed-r25/ex223/notes/dossier.md`.
- Method signatures:
  - `ex223|fp16_log_family_dense_residual_blocker_non_nested_segment_shape_recheck|segment hi3..hi6 shape reuse diagnostic|shared_field_decode_metrics_only|not_run|DAZ_log_FP16_RNE_FTZ|diagnostic_blocker`.
  - `ex223|fp16_log_family_dense_residual_blocker_selected_output_arith_patch_recheck|dense low12 residual exact-patch diagnostic|shared_field_decode_metrics_only|not_run|DAZ_log_FP16_RNE_FTZ|diagnostic_blocker`.
- Evidence: `student/work/ex200_ex299_frontend_refgap_round25_20260613_0506/mixed-r25/ex223/diagnostics/ex223_round25_dense_metrics.csv` and `ex223_round25_segment_shapes.csv`.
- Outcome: no Verilog/AIG candidate was claimed. This is a fresh density recheck under the round25 ban on nested/sparse/full-bitrun replay; no reusable segment shape emerged. Next action should only proceed with a new shallow natural-log correction formula or a synthesis method that shares dense predicates without materializing residual tables.

## 2026-06-13 mixed-r26 diagnostic

Run ID: `ex200_ex299_frontend_refgap_round26_20260613_0539`, agent `mixed-r26`.

- Dossier: `student/work/ex200_ex299_frontend_refgap_round26_20260613_0539/mixed-r26/ex223/notes/dossier.md`.
- Method signatures:
  - `ex223|fp16_log_family_dense_residual_blocker_non_nested_segment_shape_recheck|segment hi3..hi6 shape reuse diagnostic|shared_field_decode_metrics_only|not_run|DAZ_log_FP16_RNE_FTZ|diagnostic_blocker`.
  - `ex223|fp16_log_family_dense_residual_blocker_selected_output_arith_patch_recheck|dense low12 residual exact-patch diagnostic|shared_field_decode_metrics_only|not_run|DAZ_log_FP16_RNE_FTZ|diagnostic_blocker`.
- Evidence: `student/work/ex200_ex299_frontend_refgap_round26_20260613_0539/mixed-r26/ex223/diagnostics/ex223_round26_dense_metrics.csv` and `ex223_round26_segment_shapes.csv`.
- Outcome: diagnostic only; no Verilog/AIG candidate was claimed. The positive-normal residual remains dense with no reused segment shapes in hi3..hi6, so future work needs a new shallow log correction formula or predicate-sharing method.

## 2026-06-13 sub-fp16-r74 round74

Run ID: `frontend_source_parallel_round74_20260613_1439`, agent `sub-fp16-r74`.

- Dossier: `student/work/frontend_source_parallel_round74_20260613_1439/sub-fp16-r74/ex223/dossier.md`.
- Families tested:
  - `ex223|fp16_log_r74_low10_nested_cut|low10_hi7_nested_lut|shared_special_decode_plus_highbit_runs|yosys_abc_g_aig|abc_xf_official_evaluate|not_round73_segword_or_wordrun`.
  - `ex223|fp16_log_r74_flat_low10_table|flat_low10_plus_highbit_runs|shared_special_decode_no_nested_low_lut|yosys_abc_g_aig|abc_xf_official_evaluate|not_round73_segword_or_wordrun`.
- Official `evaluate.py` results:
  - `ex223_r74_nested_low10_hi7_abc_g_aig`: `13049/18/234882`, equivalent.
  - `ex223_r74_flat_low10_hi_runs_abc_g_aig`: `11158/22/245476`, equivalent.
- Outcome: both are exact but nonwinning versus current frontend ADP `203756`; do not repeat these exact low10 r74 source signatures. Next useful direction still needs a true shallow natural-log correction formula or a synthesis strategy that shares dense low-bit predicates without materializing residual/nested tables.

## 2026-06-13 sub-fp16-r75 round75

Run ID: `frontend_source_parallel_round75_20260613_1507`, agent `sub-fp16-r75`.

- Dossier: `student/work/frontend_source_parallel_round75_20260613_1507/sub-fp16-r75/ex223/dossier.md`.
- Family 1 method signature: `ex223|fp16_log_r75_output_grouped_low_mtbdd|hi12_runs_low12_mtbdd|shared_special_decode_plus_highbit_run_trees_and_shared_low_mtbdd|yosys_abc_g_aig|abc_xf_official_evaluate|low12_mtbdd_not_round74_low10`.
- Family 2 method signature: `ex223|fp16_log_r75_output_grouped_low_mtbdd|hi8_runs_low8_mtbdd|shared_special_decode_plus_highbit_run_trees_and_shared_low_mtbdd|yosys_abc_g_aig|abc_xf_official_evaluate|low8_mtbdd_not_round74_low10`.
- Official `evaluate.py` results:
  - `ex223_r75_hi12_runs_low12_mtbdd_abc_g_aig`: `11211/25/280275`, equivalent.
  - `ex223_r75_hi8_runs_low8_mtbdd_abc_g_aig`: `11316/24/271584`, equivalent.
- Paths: shard CSVs under `student/frontend_campaigns/campaigns/frontend_source_parallel_round75_20260613_1507/agent_shards/sub-fp16-r75/`; Verilog/AIG/logs under `student/work/frontend_source_parallel_round75_20260613_1507/sub-fp16-r75/ex223/`; official eval copies under `student/runs/fp16/frontend_source_parallel_round75_20260613_1507/sub-fp16-r75/ex223/official_eval/`.
- Outcome: both source families are exact and materially different from round74 low10 nested/flat and round73 segword/wordrun threshold variants, but neither beats current frontend ADP `203756` or overall current ADP `189468`. The shared low MTBDD residual kept area near the table seeds but increased delay to `24`-`25`; future work still needs a shallower exact natural-log correction or a way to share dense low predicates without putting them on the critical path.

## 2026-06-13 sub-fp16-r76 round76

Run ID: `frontend_source_parallel_round76_20260613_1706`, agent `sub-fp16-r76`.

Families tested:
- `segbase_delta_lo5`: `ex223|exact_log/log10_exponent-region_affine_boundary_delta|sign-exp_plus_mant_hi5_base_word_with_exact_mant_lo5_modular_delta|shared_special_shell_and_shared_per-region_base_feeding_one_16-bit_delta_adder|yosys_abc_g_aig|abc_xf_official_evaluate|r76_segbase_delta_lo5`.
- `ratio_xor_lo6`: `ex223|positive-normal_mantissa_quotient/ratio_descriptor|mant_hi4_leading-ratio_class_base_word_plus_exact_mant_lo6_XOR_residual|shared_leading-region_predicate_and_one_semantic-class_residual_family|yosys_abc_g_aig|abc_xf_official_evaluate|r76_ratio_xor_lo6`.

Official `evaluate.py` results:
- `ex223_r76_segbase_delta_lo5_segbase_delta_lo5_abc_g_aig`: `12626/46/580796`, equivalent.
- `ex223_r76_ratio_xor_lo6_ratio_xor_lo6_abc_g_aig`: `12055/21/253155`, equivalent.

Paths: shard CSVs under `student/frontend_campaigns/campaigns/frontend_source_parallel_round76_20260613_1706/agent_shards/sub-fp16-r76/`; Verilog/AIG/logs under `student/work/frontend_source_parallel_round76_20260613_1706/sub-fp16-r76/ex223/`; official eval copies under `student/runs/fp16/frontend_source_parallel_round76_20260613_1706/sub-fp16-r76/ex223/official_eval/`.
Outcome: best round76 row is `ex223_r76_ratio_xor_lo6_ratio_xor_lo6_abc_g_aig` at ADP `253155`; it did not beat current/reference. The boundary-delta and ratio-class descriptors are materially different from r75 direct-special/MTBDD and prior nested/sparse low-table repeats, but QoR should be treated as source evidence unless a coordinator merges it.

## 2026-06-13 round77 sub-fp16-source-r77

Run ID: `frontend_source_parallel_round77_20260613_1733`, agent `sub-fp16-source-r77`.

- Direction: source-boundary reshaping around current nested log/log10 source and the registry frontend-best source, avoiding r76 ratio-XOR/segbase-delta and r75 sparse/MTBDD/direct-special families as-is.
- Families tested: selective decode/high-bit `keep`, high-vs-low grouped output assigns, and positive-normal predicate helper module for the generated nested source; selective `keep` and high/low output grouping for the registry frontend-best source.
- Official result: best shard row `ex223_r77_frontendbest_split_output_assigns_abc_g_aig`: `10710/19/203490`; beats current/frontend/reference = `0/1/0`.
- Candidate rows: `student/runs/fp16/frontend_source_parallel_round77_20260613_1733/sub-fp16-source-r77/ex223/results/candidates.csv`.
- Evaluation rows: `student/runs/fp16/frontend_source_parallel_round77_20260613_1733/sub-fp16-source-r77/ex223/results/evaluation_results.csv`.
- Failed rows: `student/runs/fp16/frontend_source_parallel_round77_20260613_1733/sub-fp16-source-r77/ex223/results/failed_hypotheses.csv`.
- Work path: `student/work/frontend_source_parallel_round77_20260613_1733/sub-fp16-source-r77/ex223`.
- Next action: only continue this boundary direction if a coordinator wants lower-area delay-19/21 neighbors; otherwise a true shallow exact log correction remains the larger gap.

## 2026-06-13 round86 sub-fp16-int-root-r86

Run ID: `frontend_truthroot_parallel_round86_20260613_2221`, agent `sub-fp16-int-root-r86`.

- Winning frontend candidate: `ex223_r86_truthroot_bit11_abc_g_aig`.
- Official `evaluate.py` result: `10705/19/203395`, equivalent.
- Improvement: frontend best `203490 -> 203395` (`95` ADP lower). Overall current best remains backend `189468`, so the current/reference ratio is unchanged.
- Method signature: `ex223|fp16_log_truthroot_bit11_positive_normal_root|sign_exp_mantissa_run_root_for_bit11_over_frontend_best|single_exact_low_high_boundary_root|yosys_abc_g_aig|abc_xf_official_evaluate|not_r84_highword_not_r85_outputcluster`.
- Verilog: `student/work/frontend_truthroot_parallel_round86_20260613_2221/sub-fp16-int-root-r86/ex223/verilog/ex223_r86_truthroot_bit11.v`.
- AIG: `student/work/frontend_truthroot_parallel_round86_20260613_2221/sub-fp16-int-root-r86/ex223/aigs/ex223_r86_truthroot_bit11_abc_g_aig.aig`.
- Log: `student/runs/fp16/frontend_truthroot_parallel_round86_20260613_2221/sub-fp16-int-root-r86/ex223/official_eval/ex223_r86_truthroot_bit11_abc_g_aig/ex223_r86_truthroot_bit11_abc_g_aig.evaluate.py.log`.
- Also tried full-output MTBDD decision-DAG structural RTL for this case; it was exact but nonwinning and is recorded in the round86 failed hypotheses. Do not repeat the single-bit truthroot or full-output MTBDD decision-DAG forms unchanged.
- Next action: seek a larger high-level exact log/log10 structure, such as multi-bit shared positive-normal roots or a shallow correction RTL that shares dense low-bit predicates without putting a large residual table on the critical path.

## 2026-06-14 arith-unary-r2 continuation

Run ID: `ex204_ex299_frontend_continuation_20260614_1216`, agent `arith-unary-r2`.

- Families tested: positive-normal exponent-group high-bit run trees plus nested mantissa low LUT; FP16 bit-run/casez/manual sign-bit hybrids.
- Official best from this shard: `ex223_log_nested_low14_hi4_abc_g_aig` at `10621/20/212420`.
- Outcome: all rows were official equivalent but nonwinning versus frontend `10705/19/203395`; bit-run/manual best was `11191/23/257393`.

## 2026-06-14 fp16-transfer-r1 campaign

Run ID: `ex223_ex225_frontend_fp16_transfer_20260614_1310`, agent `fp16-transfer-r1`.

- Direction: transfer the `ex221` active sign/exponent nested-low and word-mode residual structures to this FP16 log case.
- Official `evaluate.py` OK but nonwinning candidates:
  - `ex223_transfer_nested_low10_hi5_abc_g_aig`: `10810/19/205390`.
  - `ex223_transfer_nested_low9_hi6_abc_g_aig`: `11551/19/219469`.
  - `ex223_transfer_wordmode_mh5_abc_g_aig`: `10776/20/215520`.
- Outcome: all candidates were equivalent but worse than current frontend best `203395`; do not repeat this active sign-exp nested/wordmode transfer unchanged.
- Artifacts: `student/frontend_campaigns/campaigns/ex223_ex225_frontend_fp16_transfer_20260614_1310/results/evaluation_results.csv`; work under `student/work/ex223_ex225_frontend_fp16_transfer_20260614_1310/fp16-transfer-r1/ex223/`.
