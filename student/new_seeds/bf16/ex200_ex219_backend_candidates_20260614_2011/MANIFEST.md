# ex200_ex219_backend_candidates_20260614_2011

Created: `2026-06-14 20:11:01 +0800`

Domain: `bf16`
Bundle type: `backend_candidates`

Selection policy:
- Already-verified frontend Verilog/AIG only.
- No backend portfolio/remap/post-AIG outputs.
- Current bundle: one lowest-ADP valid frontend seed per case.
- Backend candidates: non-current candidates, low ADP first, preserving area/delay and method diversity.

| case | selected | best candidate | area | delay | ADP | reference | source run |
| --- | ---: | --- | ---: | ---: | ---: | ---: | --- |
| ex200 | 6 | `ex200_r94_sep_fields_e4_m3_s0_bits_14_bh2` | 3650 | 16 | 58400 | 40052 | `frontend_bf16_unknown_struct_round94_20260614_0552` |
| ex201 | 4 | `ex201_bf16_exp2_hilo3_field_mode_bits_3_8_bh1` | 1655 | 14 | 23170 | 16300 | `ex201_ex204_frontend_semantic_continue_20260605_1732` |
| ex202 | 4 | `ex202_bf16_exp10_hilo3_field_mode_formula_bits_14` | 3488 | 16 | 55808 | 43344 | `ex201_ex204_frontend_semantic_continue_20260605_1732` |
| ex203 | 4 | `ex203_bf16_log_sep_fields_e3_m3_s2_bits_14_pla` | 4571 | 17 | 77707 | 56948 | `ex201_ex204_frontend_semantic_continue_20260605_1732` |
| ex204 | 6 | `ex204_log2_arithbase_delta_hilo3_bits_11_14_bh3_abc_g_gates` | 1510 | 17 | 25670 | 15180 | `ex200_ex299_frontend_parallel_shared_20260612_1422` |
| ex205 | 6 | `ex205_r97_sf_e3m3_b14_15_abc_g_aig` | 4440 | 16 | 71040 | 47128 | `frontend_gt15_deepstruct_round97_20260614_0724` |
| ex206 | 4 | `ex206_bf16_sin_split_sign_word_mixed_h5_h6special` | 26999 | 21 | 566979 | 539049 | `ex205_ex209_frontend_bf16_semantic_20260606_0946` |
| ex207 | 4 | `ex207_bf16_tan_split_sign_word_mixed_h5_h6special` | 30193 | 21 | 634053 | 627817 | `ex205_ex209_frontend_bf16_semantic_20260606_0946` |
| ex208 | 6 | `ex208_bf16_sinh_legacy_split_sign_exp_mant_case` | 2208 | 15 | 33120 | 24505 | `ex205_ex209_frontend_bf16_semantic_20260606_0946` |
| ex209 | 6 | `ex209_bf16_tanh_legacy_sign_exp_default_expr_case` | 765 | 13 | 9945 | 7320 | `ex205_ex209_frontend_bf16_semantic_20260606_0946` |
| ex210 | 6 | `ex210_bf16_sigmoid_const_default_0000_h3` | 2246 | 15 | 33690 | 27053 | `ex210_ex214_frontend_bf16_semantic_20260606_1315` |
| ex211 | 6 | `ex211_bf16_reciprocal_aggr_semantic_positive_symmetry_fields` | 275 | 11 | 3025 | 2136 | `ex210_ex214_frontend_bf16_semantic_20260606_1315` |
| ex212 | 6 | `ex212_bf16_square_delta_pair_mode_hilo4` | 282 | 11 | 3102 | 2304 | `ex210_ex214_frontend_bf16_semantic_20260606_1315` |
| ex213 | 5 | `ex213_bf16_sqrt_sep_fields_e3_m3_s3_bits_14_bh1` | 333 | 12 | 3996 | 2900 | `ex210_ex214_frontend_bf16_semantic_20260606_1315` |
| ex214 | 6 | `ex214_r95_bf16_reciprocal_square_legacy_default_expr_exception_case_bits_13_cmp_caseattrs` | 337 | 11 | 3707 | 2424 | `frontend_gt15_bf16_unknown_round95_20260614_0627` |
| ex215 | 6 | `ex215_bf16_reciprocal_sqrt_delta_pair_mode_hilo3_bits_9_bh1_fix2` | 390 | 12 | 4680 | 3150 | `ex215_ex219_frontend_bf16_semantic_20260606_1447` |
| ex216 | 6 | `ex216_bf16_cube_aggr_semantic_positive_symmetry_fields_cube_bit14_boundary_caseattrs_fix13` | 444 | 13 | 5772 | 3357 | `ex215_ex219_frontend_bf16_deep2_20260606_1726` |
| ex217 | 6 | `ex217_r94_bf16_cbrt_delta_pair_first_hilo4_bits_0_bh3_manual_sign_non_nan` | 632 | 13 | 8216 | 5785 | `frontend_bf16_unknown_struct_round94_20260614_0552` |
| ex218 | 6 | `ex218_bf16_reciprocal_cube_legacy_value_case_bits_15_cmp_caseattrs_fix9` | 467 | 13 | 6071 | 3222 | `ex215_ex219_frontend_bf16_deep2_20260606_1726` |
| ex219 | 6 | `ex219_r94_bf16_reciprocal_cbrt_delta_pair_mant64_hilo3_bits_6_cmp` | 658 | 14 | 9212 | 5640 | `frontend_bf16_unknown_struct_round94_20260614_0552` |

Candidate shortfalls:
- `ex201`: selected 4/6; valid distinct frontend candidates were insufficient after filtering.
- `ex202`: selected 4/6; valid distinct frontend candidates were insufficient after filtering.
- `ex203`: selected 4/6; valid distinct frontend candidates were insufficient after filtering.
- `ex213`: selected 5/6; valid distinct frontend candidates were insufficient after filtering.

