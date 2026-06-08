# ex240_ex254_current

Best-only float_fp8 seed bundle for ex240-ex254.

Scope:
- Cases: `ex240`-`ex254`
- Contents: copied verified frontend Verilog/AIG files only; no backend optimization was run by this curation step.

Files:
- `results/candidates.csv`: copied seed candidates.
- `results/best.csv`: best copied seed per case.
- `results/summary.csv`: per-case candidate counts and reference ratios.
- `results/evaluate_check.csv`: copied verification status from source frontend results.

Selection:
- Exactly one current best verified Verilog/AIG seed per case from `student/results/current_best_by_case.csv`.

| Case | Seeds | Best candidate | Area | Delay | ADP |
| --- | ---: | --- | ---: | ---: | ---: |
| ex240 | 1 | `ex240_semantic_add_same_grs_diff_param8_synth_preset_aig` | 590 | 51 | 30090 |
| ex241 | 1 | `ex241_semantic_mul_product_nested_exp_synth_preset_aig` | 536 | 29 | 15544 |
| ex242 | 1 | `ex242_semantic_div_field_sparse_clean_synth_preset_aig` | 1266 | 20 | 25320 |
| ex243 | 1 | `ex243_semantic_fmod_modsig_nested_delta_abc_g_aig` | 1790 | 27 | 48330 |
| ex244 | 1 | `ex244_semantic_hypot_delta_maxeff_bdd_expfirst_synth_preset_aig` | 301 | 34 | 10234 |
| ex245 | 1 | `ex245_semantic_add_gap_class_synth_preset_aig` | 701 | 34 | 23834 |
| ex246 | 1 | `ex246_semantic_mul_product_dc_seed12_set11to10_synth_preset_aig` | 341 | 22 | 7502 |
| ex247 | 1 | `ex247_semantic_div_bound_smallpat_nested_den_synth_preset_aig` | 365 | 25 | 9125 |
| ex248 | 1 | `ex248_semantic_fmod_periodic_rem_abc_g_aig` | 285 | 30 | 8550 |
| ex249 | 1 | `ex249_semantic_hypot_threshold_rawexp_synth_preset_aig` | 168 | 26 | 4368 |
| ex250 | 1 | `ex250_semantic_fp4_dot2_magarith_qcase_synth_preset_aig` | 413 | 41 | 16933 |
| ex251 | 1 | `ex251_semantic_int3_dot2_arith_qcase_abc_g_aig` | 495 | 38 | 18810 |
| ex252 | 1 | `ex252_semantic_u2_dot4_handmul_balanced_qcase_default` | 145 | 21 | 3045 |
| ex253 | 1 | `ex253_semantic_u2_sum8_popcount_laneqcase_default` | 126 | 18 | 2268 |
| ex254 | 1 | `ex254_semantic_e4add_fp4product_grs_magfactored_abc_g_aig` | 662 | 55 | 36410 |
