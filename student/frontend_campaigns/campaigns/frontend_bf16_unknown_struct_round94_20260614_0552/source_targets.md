# Source Targets

Use `frontend_best_registry.csv` as the frontend-only comparator. The
`current_best_*` fields in `current_frontend_gap.csv` are backend-sourced for
most rows and must not be used as frontend seeds in this run.

| case | domain | frontend ADP | A/D | reference ADP | frontend ratio | frontend best run | candidate |
| --- | --- | ---: | --- | ---: | ---: | --- | --- |
| ex200 | bf16 | 54405 | 3627/15 | 40052 | 1.358359 | ex200_ex299_frontend_refgap_round2_20260612_1512 | ex200_bf16_sparse_residual_hilo3_abc_g_aig |
| ex201 | bf16 | 23058 | 1647/14 | 16300 | 1.414601 | ex200_ex219_current | ex201_bf16_exp2_hilo3_field_mode_bits_3_bh1 |
| ex202 | bf16 | 55648 | 3478/16 | 43344 | 1.283869 | ex200_ex219_current | ex202_bf16_exp10_sep_fields_e3_m3_s0_bits_14_15_bh4 |
| ex203 | bf16 | 77248 | 4544/17 | 56948 | 1.356466 | ex200_ex219_current | ex203_bf16_log_sep_fields_e3_m3_s2_bits_14_bh2 |
| ex204 | bf16 | 24576 | 1536/16 | 15180 | 1.618972 | ex200_ex299_frontend_refgap_round24_20260613_0435 | ex204_r24_bf16_log2_log2_arithbase_delta_hilo3_bits_11_14_bh2_abc_g_aig |
| ex205 | bf16 | 71104 | 4444/16 | 47128 | 1.508742 | ex200_ex299_frontend_parallel_shared_20260612_1422 | ex205_sep_fields_e3_m3_s0_bits_15_bh1_abc_g_aig |
| ex206 | bf16 | 564312 | 26872/21 | 539049 | 1.046866 | ex200_ex219_current | ex206_bf16_sin_odd_pos_fullword_h4 |
| ex207 | bf16 | 627333 | 29873/21 | 627817 | 0.999229 | ex200_ex219_current | ex207_bf16_tan_odd_pos_fullword_expflip_h4 |
| ex208 | bf16 | 32505 | 2167/15 | 24505 | 1.326464 | ex200_ex219_current | ex208_bf16_sinh_default_in_const_excepts_h4 |
| ex209 | bf16 | 9828 | 756/13 | 7320 | 1.342623 | ex200_ex219_current | ex209_bf16_tanh_sign_exp_default_expr_casez |
| ex210 | bf16 | 33480 | 2232/15 | 27053 | 1.237571 | ex200_ex219_current | ex210_bf16_sigmoid_const_default_3f80_h3 |
| ex211 | bf16 | 3003 | 273/11 | 2136 | 1.405899 | ex200_ex219_current | ex211_bf16_reciprocal_hand_recip_formula_signmag_lut |
| ex212 | bf16 | 3091 | 281/11 | 2304 | 1.341580 | ex200_ex219_current | ex212_bf16_square_delta_pair_mode_hilo4_bits_15_bh1 |
| ex213 | bf16 | 3806 | 346/11 | 2900 | 1.312414 | ex200_ex219_current | ex213_bf16_sqrt_sep_fields_e2_m3_s3_bits_1_bh1 |
| ex214 | bf16 | 3707 | 337/11 | 2424 | 1.529290 | ex200_ex219_current | ex214_bf16_reciprocal_square_legacy_default_expr_exception_case_bits_13_cmp_fix |
| ex215 | bf16 | 4680 | 390/12 | 3150 | 1.485714 | ex200_ex219_current | ex215_bf16_reciprocal_sqrt_delta_pair_mode_hilo3_bits_9_bh1_fix2_caseattrs_fix12 |
| ex216 | bf16 | 5772 | 444/13 | 3357 | 1.719392 | ex200_ex219_current | ex216_bf16_cube_aggr_semantic_positive_symmetry_fields_cube_bit14_boundary_caseattrs_fix13 |
| ex217 | bf16 | 8099 | 623/13 | 5785 | 1.400000 | ex200_ex219_current | ex217_bf16_cbrt_delta_pair_first_hilo3_bits_0_bh3_fix2_manual_sign_non_nan_caseattrs_fix15 |
| ex218 | bf16 | 5941 | 457/13 | 3222 | 1.843886 | ex200_ex299_frontend_refgap_round19_20260612_2346 | ex218_field_selector_abc_g_aig |
| ex219 | bf16 | 9345 | 623/15 | 5640 | 1.656915 | ex200_ex219_current | ex219_bf16_reciprocal_cbrt_delta_pair_first_hilo3_bits_6_cmp_caseattrs_fix9 |
| ex286 | unknown | 20190 | 1346/15 | 2376 | 8.497475 | ex286_frontend_symcof_bitset_probe_20260612_1820 | ex286_unknown_symcof_interleave_f00_bits_0_12_1_10_onehot_group_abc_g_aig |
| ex287 | unknown | 27390 | 1826/15 | 5782 | 4.737115 | ex287_frontend_targeted_symcof_mux_probe_20260613_0407 | ex287_r25_symcof_f00_bits_13_0_1_12_2_onehot_group_abc_g_aig |

Full paths and method signatures are in `student/frontend_campaigns/frontend_best_registry.csv`.
