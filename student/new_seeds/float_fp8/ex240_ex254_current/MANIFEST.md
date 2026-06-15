# ex240_ex254_current

Created: `2026-06-14 20:11:01 +0800`

Domain: `float_fp8`
Bundle type: `current`

Selection policy:
- Already-verified frontend Verilog/AIG only.
- No backend portfolio/remap/post-AIG outputs.
- Current bundle: one lowest-ADP valid frontend seed per case.
- Backend candidates: non-current candidates, low ADP first, preserving area/delay and method diversity.

| case | selected | best candidate | area | delay | ADP | reference | source run |
| --- | ---: | --- | ---: | ---: | ---: | ---: | --- |
| ex240 | 1 | `ex240_r64_signmag_selected_output_factor_synth_preset` | 610 | 43 | 26230 | 13299 | `frontend_source_parallel_round64_20260613_1004` |
| ex241 | 1 | `ex241_r71_caseattrs_outputsplit` | 531 | 29 | 15399 | 7224 | `frontend_source_parallel_round71_20260613_1312` |
| ex242 | 1 | `ex242_r8_axis_numzero_shell_abc_g_aig_frontend` | 841 | 20 | 16820 | 11900 | `ex204_ex299_frontend_breakthrough_20260614_1051` |
| ex243 | 1 | `ex243_semantic_fmod_modsig_nested_delta_abc_g_aig` | 1790 | 27 | 48330 | 53227 | `ex241_ex242_ex243_frontend_fp8_nested_tables_fix_20260608_1330` |
| ex244 | 1 | `ex244_r7_satbit_regroup_synth_preset_aig` | 311 | 32 | 9952 | 4272 | `ex204_ex299_frontend_breakthrough_20260614_1051` |
| ex245 | 1 | `ex245_r11_r89_active_branch_muxclean` | 696 | 33 | 22968 | 11050 | `ex204_ex299_frontend_breakthrough_20260614_1051` |
| ex246 | 1 | `ex246_semantic_mul_product_dc_seed12_set11to10_synth_preset_aig` | 341 | 22 | 7502 | 2805 | `ex246_frontend_fp8_e5m2_dc_neighbor12_20260608_2000` |
| ex247 | 1 | `ex247_r5_lowpred_truth_case_abc_g_aig_frontend` | 249 | 26 | 6474 | 2975 | `ex204_ex299_frontend_breakthrough_20260614_1051` |
| ex248 | 1 | `ex248_r8_split_payload_shell_abc_g_aig_frontend` | 290 | 27 | 7830 | 4180 | `ex204_ex299_frontend_breakthrough_20260614_1051` |
| ex249 | 1 | `ex249_semantic_hypot_threshold_rawexp_synth_preset_aig` | 168 | 26 | 4368 | 2079 | `ex245_ex249_frontend_fp8_e5m2_curated_20260608_1715` |
| ex250 | 1 | `ex250_semantic_fp4_dot2_magarith_qcase_synth_preset_aig` | 413 | 41 | 16933 | 20355 | `ex250_frontend_magarith_20260608_2303` |
| ex251 | 1 | `ex251_semantic_int3_dot2_arith_qcase_abc_g_aig` | 495 | 38 | 18810 | 39270 | `ex250_ex254_frontend_fp4_dot_fma_semantic_fix_20260608_2110` |
| ex252 | 1 | `ex252_semantic_u2_dot4_handmul_balanced_qcase_default` | 145 | 21 | 3045 | 2603 | `ex252_ex253_frontend_handmul_popthreshold_20260608_2229` |
| ex253 | 1 | `ex253_semantic_u2_sum8_popcount_laneqcase_default` | 126 | 18 | 2268 | 1845 | `ex252_ex253_frontend_weighted_popcount_20260608_2224` |
| ex254 | 1 | `ex254_semantic_e4add_fp4product_grs_magfactored_abc_g_aig` | 662 | 55 | 36410 | 38220 | `ex254_frontend_product_magfactored_20260608_2310` |

