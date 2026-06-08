# ex240_ex254_backend_candidates_20260608_2327

Non-best float_fp8 backend candidate bundle for ex240-ex254.

Scope:
- Cases: `ex240`-`ex254`
- Contents: copied verified frontend Verilog/AIG files only; no backend optimization was run by this curation step.

Files:
- `results/candidates.csv`: copied seed candidates.
- `results/best.csv`: best copied seed per case.
- `results/summary.csv`: per-case candidate counts and reference ratios.

Selection:
- Exactly four verified non-best alternatives per case.
- Alternatives are selected by low ADP while requiring a distinct source Verilog path from the current best and prior selected alternatives.

| Case | Seeds | Best candidate | Area | Delay | ADP |
| --- | ---: | --- | ---: | ---: | ---: |
| ex240 | 4 | `ex240_semantic_add_same_grs_diff_param8_parallel_synth_preset_aig` | 590 | 51 | 30090 |
| ex241 | 4 | `ex241_semantic_mul_product_param_exception_synth_preset` | 534 | 40 | 21360 |
| ex242 | 4 | `ex242_semantic_div_formula_exception_compact_synth_preset_aig` | 1028 | 25 | 25700 |
| ex243 | 4 | `ex243_semantic_fmod_modsig_table_synth_preset_aig` | 2167 | 29 | 62843 |
| ex244 | 4 | `ex244_semantic_hypot_delta_maxeff_bdd_expfirst_synth_preset` | 307 | 34 | 10438 |
| ex245 | 4 | `ex245_truth_bdd_interleave_synth_preset_aig` | 1481 | 23 | 34063 |
| ex246 | 4 | `ex246_semantic_mul_product_dc_seed12_set13to13_synth_preset_aig` | 341 | 22 | 7502 |
| ex247 | 4 | `ex247_semantic_div_bound_smallpat_nested_den_parallel_synth_preset_aig` | 365 | 25 | 9125 |
| ex248 | 4 | `ex248_semantic_fmod_modsig_nested_delta_synth_preset_aig` | 476 | 32 | 15232 |
| ex249 | 4 | `ex249_semantic_hypot_threshold_case_synth_preset_aig` | 164 | 29 | 4756 |
| ex250 | 4 | `ex250_semantic_fp4_dot2_magprod_qcase_synthD20_aig` | 413 | 41 | 16933 |
| ex251 | 4 | `ex251_semantic_int3_dot2_arith_qcase_synth_preset_aig` | 450 | 42 | 18900 |
| ex252 | 4 | `ex252_semantic_u2_dot4_balanced_qcase_abcD15_aig` | 145 | 21 | 3045 |
| ex253 | 4 | `ex253_semantic_u2_sum8_popcount_bitformula_default` | 127 | 19 | 2413 |
| ex254 | 4 | `ex254_semantic_e4add_fp4product_grs_abcD15_aig` | 664 | 56 | 37184 |
