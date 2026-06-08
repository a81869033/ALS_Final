# ex200_ex219_backend_start_20260608_1008

Curated backend-start seeds for verified frontend candidates.

Scope:
- Cases: `ex200`-`ex219`
- Contents: copied Verilog/AIG files only; no backend optimization was run by this curation step.
- Selection: current best plus a small number of low-ADP/diverse verified alternatives per case.

Files:
- `results/candidates.csv`: all copied seed candidates.
- `results/best.csv`: best copied seed per case.
- `results/summary.csv`: per-case candidate counts and reference ratios.
- `results/evaluate_check.csv`: optional official recheck records for best seeds.

| Case | Seeds | Best candidate | Area | Delay | ADP |
| --- | ---: | --- | ---: | ---: | ---: |
| ex200 | 5 | `ex200_bf16_exp_semantic_exp_default_one_parallel_casez_saturation` | 3717 | 17 | 63189 |
| ex201 | 4 | `ex201_bf16_exp2_hilo3_field_mode_bits_3_bh1` | 1647 | 14 | 23058 |
| ex202 | 4 | `ex202_bf16_exp10_sep_fields_e3_m3_s0_bits_14_15_bh4` | 3478 | 16 | 55648 |
| ex203 | 4 | `ex203_bf16_log_sep_fields_e3_m3_s2_bits_14_bh2` | 4544 | 17 | 77248 |
| ex204 | 5 | `ex204_bf16_log2_log2_arithbase_delta_hilo3_formula_bits_11_14` | 1545 | 17 | 26265 |
| ex205 | 5 | `ex205_bf16_log10_sep_fields_e3_m3_s0_bits_15_bh1` | 4463 | 17 | 75871 |
| ex206 | 5 | `ex206_bf16_sin_odd_pos_fullword_h4` | 26872 | 21 | 564312 |
| ex207 | 5 | `ex207_bf16_tan_odd_pos_fullword_expflip_h4` | 29873 | 21 | 627333 |
| ex208 | 5 | `ex208_bf16_sinh_default_in_const_excepts_h4` | 2167 | 15 | 32505 |
| ex209 | 5 | `ex209_bf16_tanh_sign_exp_default_expr_casez` | 756 | 13 | 9828 |
| ex210 | 5 | `ex210_bf16_sigmoid_const_default_3f80_h3` | 2232 | 15 | 33480 |
| ex211 | 5 | `ex211_bf16_reciprocal_hand_recip_formula_signmag_lut` | 273 | 11 | 3003 |
| ex212 | 5 | `ex212_bf16_square_delta_pair_mode_hilo4_bits_15_bh1` | 281 | 11 | 3091 |
| ex213 | 5 | `ex213_bf16_sqrt_sep_fields_e2_m3_s3_bits_1_bh1` | 346 | 11 | 3806 |
| ex214 | 5 | `ex214_bf16_reciprocal_square_legacy_default_expr_exception_case_bits_13_cmp_fix` | 337 | 11 | 3707 |
| ex215 | 5 | `ex215_bf16_reciprocal_sqrt_delta_pair_mode_hilo3_bits_9_bh1_fix2_caseattrs_fix12` | 390 | 12 | 4680 |
| ex216 | 5 | `ex216_bf16_cube_aggr_semantic_positive_symmetry_fields_cube_bit14_boundary_caseattrs_fix13` | 444 | 13 | 5772 |
| ex217 | 5 | `ex217_bf16_cbrt_delta_pair_first_hilo3_bits_0_bh3_fix2_manual_sign_non_nan_caseattrs_fix15` | 623 | 13 | 8099 |
| ex218 | 5 | `ex218_bf16_reciprocal_cube_legacy_value_case_bits_15_cmp_caseattrs_fix9` | 467 | 13 | 6071 |
| ex219 | 5 | `ex219_bf16_reciprocal_cbrt_delta_pair_first_hilo3_bits_6_cmp_caseattrs_fix9` | 623 | 15 | 9345 |
