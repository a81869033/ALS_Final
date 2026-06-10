# ex200_ex219_backend_candidates_20260608_1008

Non-best BF16 backend candidate bundle for ex200-ex219.

This bundle intentionally excludes the current best seed for each case. It keeps verified alternatives per case for backend-start diversity after trying `student/seeds/bf16/ex200_ex219_current/`.

Files:
- `results/candidates.csv`: verified non-best alternatives.
- `results/best.csv`: best alternative row per case.
- `results/summary.csv`: per-case alternative counts and best alternative score.

Notes:
- Most cases keep four alternatives; ex201-ex203 keep three because the original curated pool had only four total seeds including the current best.
- Candidate Verilog/AIG files are copied seed artifacts only; no backend optimization was run by this curation step.

| Case | Alternatives | Best alternative | Area | Delay | ADP |
| --- | ---: | --- | ---: | ---: | ---: |
| ex200 | 4 | `ex200_bf16_exp_semantic_exp_default_one_casez_saturation` | 3717 | 17 | 63189 |
| ex201 | 3 | `ex201_bf16_exp2_hilo3_field_mode_bits_3_8_bh1` | 1655 | 14 | 23170 |
| ex202 | 3 | `ex202_bf16_exp10_hilo3_field_mode_formula_bits_14` | 3488 | 16 | 55808 |
| ex203 | 3 | `ex203_bf16_log_sep_fields_e3_m3_s2_bits_14_pla` | 4571 | 17 | 77707 |
| ex204 | 4 | `ex204_bf16_log2_log2_arithbase_delta_hilo3_bits_9_11_14_pla` | 1587 | 17 | 26979 |
| ex205 | 4 | `ex205_bf16_log10_sep_fields_e3_m3_s0_bits_15_bh2` | 4463 | 17 | 75871 |
| ex206 | 4 | `ex206_bf16_sin_split_sign_word_mixed_h5_h6special` | 26999 | 21 | 566979 |
| ex207 | 4 | `ex207_bf16_tan_split_sign_word_mixed_h5_h6special` | 30193 | 21 | 634053 |
| ex208 | 4 | `ex208_bf16_sinh_legacy_split_sign_exp_mant_case` | 2208 | 15 | 33120 |
| ex209 | 4 | `ex209_bf16_tanh_legacy_sign_exp_default_expr_case` | 765 | 13 | 9945 |
| ex210 | 4 | `ex210_bf16_sigmoid_const_default_0000_h3` | 2246 | 15 | 33690 |
| ex211 | 4 | `ex211_bf16_reciprocal_aggr_semantic_positive_symmetry_fields` | 275 | 11 | 3025 |
| ex212 | 4 | `ex212_bf16_square_delta_pair_mode_hilo4` | 282 | 11 | 3102 |
| ex213 | 4 | `ex213_bf16_sqrt_sep_fields_e3_m3_s3_bits_1_bh1` | 346 | 11 | 3806 |
| ex214 | 4 | `ex214_bf16_reciprocal_square_legacy_default_expr_exception_case_bits_13_runs_fix` | 338 | 11 | 3718 |
| ex215 | 4 | `ex215_bf16_reciprocal_sqrt_delta_pair_mode_hilo3_bits_9_bh1_fix2` | 390 | 12 | 4680 |
| ex216 | 4 | `ex216_bf16_cube_aggr_semantic_positive_symmetry_fields_cube_bit14_boundary_fix12` | 444 | 13 | 5772 |
| ex217 | 4 | `ex217_bf16_cbrt_delta_pair_first_hilo3_bits_0_bh2_fix2_manual_sign_non_nan_fix12` | 587 | 14 | 8218 |
| ex218 | 4 | `ex218_bf16_reciprocal_cube_legacy_value_case_bits_15_cmp_fix5` | 467 | 13 | 6071 |
| ex219 | 4 | `ex219_bf16_reciprocal_cbrt_delta_pair_first_hilo3_bits_6_cmp_fix5` | 623 | 15 | 9345 |
