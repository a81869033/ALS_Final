# ex200_ex219_current

Created: `2026-06-14 20:11:01 +0800`

Domain: `bf16`
Bundle type: `current`

Selection policy:
- Already-verified frontend Verilog/AIG only.
- No backend portfolio/remap/post-AIG outputs.
- Current bundle: one lowest-ADP valid frontend seed per case.
- Backend candidates: non-current candidates, low ADP first, preserving area/delay and method diversity.

| case | selected | best candidate | area | delay | ADP | reference | source run |
| --- | ---: | --- | ---: | ---: | ---: | ---: | --- |
| ex200 | 1 | `ex200_bf16_sparse_residual_hilo3_abc_g_aig` | 3627 | 15 | 54405 | 40052 | `ex200_ex299_frontend_refgap_round2_20260612_1512` |
| ex201 | 1 | `ex201_bf16_exp2_hilo3_field_mode_bits_3_bh1` | 1647 | 14 | 23058 | 16300 | `ex200_ex219_current` |
| ex202 | 1 | `ex202_bf16_exp10_sep_fields_e3_m3_s0_bits_14_15_bh4` | 3478 | 16 | 55648 | 43344 | `ex200_ex219_current` |
| ex203 | 1 | `ex203_bf16_log_sep_fields_e3_m3_s2_bits_14_bh2` | 4544 | 17 | 77248 | 56948 | `ex200_ex219_current` |
| ex204 | 1 | `ex204_r24_bf16_log2_log2_arithbase_delta_hilo3_bits_11_14_bh2_abc_g_aig` | 1536 | 16 | 24576 | 15180 | `ex200_ex299_frontend_refgap_round24_20260613_0435` |
| ex205 | 1 | `ex205_r27_seedcopy_synth_preset_aig` | 4410 | 16 | 70560 | 47128 | `ex200_ex299_frontend_refgap_round27_20260613_0613` |
| ex206 | 1 | `ex206_bf16_sin_odd_pos_fullword_h4` | 26872 | 21 | 564312 | 539049 | `ex200_ex219_current` |
| ex207 | 1 | `ex207_bf16_tan_odd_pos_fullword_expflip_h4` | 29873 | 21 | 627333 | 627817 | `ex200_ex219_current` |
| ex208 | 1 | `ex208_bf16_sinh_default_in_const_excepts_h4` | 2167 | 15 | 32505 | 24505 | `ex200_ex219_current` |
| ex209 | 1 | `ex209_bf16_tanh_sign_exp_default_expr_casez` | 756 | 13 | 9828 | 7320 | `ex200_ex219_current` |
| ex210 | 1 | `ex210_bf16_sigmoid_const_default_3f80_h3` | 2232 | 15 | 33480 | 27053 | `ex200_ex219_current` |
| ex211 | 1 | `ex211_bf16_reciprocal_hand_recip_formula_signmag_lut` | 273 | 11 | 3003 | 2136 | `ex200_ex219_current` |
| ex212 | 1 | `ex212_bf16_square_delta_pair_mode_hilo4_bits_15_bh1` | 281 | 11 | 3091 | 2304 | `ex200_ex219_current` |
| ex213 | 1 | `ex213_bf16_sqrt_sep_fields_e2_m3_s3_bits_1_bh1` | 346 | 11 | 3806 | 2900 | `ex200_ex219_current` |
| ex214 | 1 | `ex214_r96_bf16_recip_square_bit13_exp_formula_abc_g_aig` | 324 | 11 | 3564 | 2424 | `frontend_gt15_structural_round96_20260614_0651` |
| ex215 | 1 | `ex215_r8_caseattrs_abc_g_aig` | 389 | 12 | 4668 | 3150 | `ex204_ex299_frontend_breakthrough_20260614_1051` |
| ex216 | 1 | `ex216_r4_current_source_abc_g_aig` | 440 | 13 | 5720 | 3357 | `ex204_ex299_frontend_breakthrough_20260614_1051` |
| ex217 | 1 | `ex217_bf16_cbrt_delta_pair_first_hilo3_bits_0_bh3_fix2_manual_sign_non_nan_caseattrs_fix15` | 623 | 13 | 8099 | 5785 | `ex215_ex219_frontend_bf16_deep2_20260606_1726` |
| ex218 | 1 | `ex218_field_selector_abc_g_aig` | 457 | 13 | 5941 | 3222 | `ex200_ex299_frontend_refgap_round19_20260612_2346` |
| ex219 | 1 | `ex219_r4_current_source_abc_g_aig` | 657 | 13 | 8541 | 5640 | `ex204_ex299_frontend_breakthrough_20260614_1051` |

