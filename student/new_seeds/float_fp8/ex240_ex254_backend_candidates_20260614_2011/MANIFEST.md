# ex240_ex254_backend_candidates_20260614_2011

Created: `2026-06-14 20:11:01 +0800`

Domain: `float_fp8`
Bundle type: `backend_candidates`

Selection policy:
- Already-verified frontend Verilog/AIG only.
- No backend portfolio/remap/post-AIG outputs.
- Current bundle: one lowest-ADP valid frontend seed per case.
- Backend candidates: non-current candidates, low ADP first, preserving area/delay and method diversity.

| case | selected | best candidate | area | delay | ADP | reference | source run |
| --- | ---: | --- | ---: | ---: | ---: | ---: | --- |
| ex240 | 8 | `ex240_r3_shift_align_source_compress` | 611 | 44 | 26884 | 13299 | `ex204_ex299_frontend_continuation_20260614_1216` |
| ex241 | 8 | `ex241_r27_currentbest_delaytarget_synth_preset_aig_D16` | 536 | 29 | 15544 | 7224 | `ex240_ex299_frontend_gt2_round27_20260613_0619` |
| ex242 | 6 | `ex242_r71_axis_attr_hardrom` | 842 | 21 | 17682 | 11900 | `frontend_source_parallel_round71_20260613_1308` |
| ex243 | 4 | `ex243_semantic_fmod_modsig_nested_delta_abc_g_aig_abc_g_gates` | 1808 | 27 | 48816 | 53227 | `ex241_ex243_frontend_fp8_nested_best_synthflow_20260608_1330` |
| ex244 | 8 | `ex244_r22_maxeff_delta_bdd_replay` | 301 | 34 | 10234 | 4272 | `ex200_ex299_frontend_refgap_round22_20260613_0218` |
| ex245 | 8 | `ex245_ex245_r75_field_active_mux_repo_yosys` | 741 | 31 | 22971 | 11050 | `frontend_source_parallel_round75_20260613_1450` |
| ex246 | 8 | `ex246_semantic_mul_product_dc_seed12_set22to21_synth_preset_aig` | 341 | 22 | 7502 | 2805 | `ex246_frontend_fp8_e5m2_dc_neighbor12_20260608_2000` |
| ex247 | 8 | `ex247_r10_caseattrs_optfull` | 249 | 26 | 6474 | 2975 | `ex204_ex299_frontend_breakthrough_20260614_1051` |
| ex248 | 8 | `ex248_r10_current_muxclean` | 290 | 27 | 7830 | 4180 | `ex204_ex299_frontend_breakthrough_20260614_1051` |
| ex249 | 8 | `ex249_r69_manual_sat_increment_synth_preset_aig` | 165 | 28 | 4620 | 2079 | `frontend_source_parallel_round69_20260613_1204` |
| ex250 | 4 | `ex250_semantic_fp4_dot2_magprod_qcase_synthD20_aig` | 413 | 41 | 16933 | 20355 | `ex250_frontend_magprod_20260608_2254` |
| ex251 | 4 | `ex251_semantic_int3_dot2_arith_qcase_synth_preset_aig` | 450 | 42 | 18900 | 39270 | `ex250_ex254_frontend_fp4_dot_fma_semantic_fix_20260608_2110` |
| ex252 | 6 | `ex252_semantic_u2_dot4_balanced_qcase_abcD15_aig` | 145 | 21 | 3045 | 2603 | `ex252_ex253_frontend_u2_balanced_tree_20260608_2220` |
| ex253 | 6 | `ex253_semantic_u2_sum8_popcount_bitformula_default` | 127 | 19 | 2413 | 1845 | `ex252_ex253_frontend_bitformula_20260608_2240` |
| ex254 | 4 | `ex254_semantic_e4add_fp4product_grs_abcD15_aig` | 664 | 56 | 37184 | 38220 | `ex254_frontend_fp4_product_e4add_20260608_2210` |

