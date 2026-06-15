# ex280_ex299_backend_candidates_20260614_2011

Created: `2026-06-14 23:20:22 +0800 refresh`

Domain: `unknown`
Bundle type: `backend_candidates`

Selection policy:
- Already-verified frontend Verilog/AIG only.
- No backend portfolio/remap/post-AIG outputs.
- Current bundle: one lowest-ADP valid frontend seed per case.
- Backend candidates: non-current candidates, low ADP first, preserving area/delay and method diversity.

| case | selected | best candidate | area | delay | ADP | reference | source run |
| --- | ---: | --- | ---: | ---: | ---: | ---: | --- |
| ex280 | 6 | `ex280_gf2_overlap_roots_small_roots_balanced_abc_g_aig` | 135 | 29 | 3915 | 2415 | `ex200_ex299_frontend_refgap_round2_20260612_1512` |
| ex281 | 6 | `ex281_gf2_overlap_roots_mixed_roots_delaycap_balanced_linfact_abc_g_aig` | 128 | 26 | 3328 | 2336 | `ex200_ex299_frontend_refgap_round3_20260612_1554` |
| ex282 | 6 | `ex282_gf2_overlap_roots_small_roots_balanced_linfact_abc_g_aig` | 158 | 27 | 4266 | 2704 | `ex200_ex299_frontend_refgap_round3_20260612_1554` |
| ex283 | 6 | `ex283_gf2_overlap_roots_small_roots_balanced_abc_g_aig` | 161 | 30 | 4830 | 3168 | `ex200_ex299_frontend_refgap_round2_20260612_1512` |
| ex284 | 6 | `ex284_gf2_overlap_roots_mixed_roots_delaycap_balanced_linfact_abc_g_aig` | 170 | 33 | 5610 | 4240 | `ex200_ex299_frontend_refgap_round4_20260612_1705` |
| ex285 | 8 | `ex285_r9_boundary_mask_all_boundary_optfull` | 781 | 16 | 12496 | 5499 | `ex204_ex299_frontend_breakthrough_20260614_1051` |
| ex286 | 8 | `ex286_linhyb_sweep_raw_5_6_7_8_1_f11_global_abc_g_aig` | 1338 | 15 | 20070 | 2376 | `ex286_ex287_frontend_structural_decomp_20260614_2320` |
| ex287 | 8 | `ex287_orientfollow_k6_b2_b3_f11_case_direct_abc_g_aig` | 1593 | 15 | 23895 | 5782 | `ex286_ex287_frontend_structural_decomp_20260614_2320` |
| ex288 | 8 | `ex288_keybdd_selected_controlled_routing_abc_g_aig` | 2257 | 14 | 31598 | 16394 | `ex200_ex299_frontend_refgap_round3_20260612_1554` |
| ex289 | 6 | `ex289_unknown_duality_symcof_split2_f10_bits_0_1_12_13_onehot_group_xor_abc_g_gates_round2` | 1047 | 19 | 19893 | 13620 | `ex200_ex299_frontend_refgap_round2_20260612_1512` |
| ex290 | 6 | `ex290_rotate_high_split_default_abc_g_aig` | 4428 | 14 | 61992 | 42328 | `ex290_ex291_ex293_ex296_ex298_frontend_current_synthflow_20260608_1320` |
| ex291 | 6 | `ex291_rotate_high_split_default_synth_preset` | 6503 | 15 | 97545 | 66850 | `ex290_ex291_ex293_ex296_ex298_frontend_current_synthflow_20260608_1320` |
| ex292 | 8 | `ex292_r4_adjacent_mod7_mask_mix` | 6760 | 20 | 135200 | 84854 | `ex204_ex299_frontend_continuation_20260614_1216` |
| ex293 | 6 | `ex293_rotate_low_split_default_abc_g_aig` | 8122 | 18 | 146196 | 112966 | `ex290_ex291_ex293_ex296_ex298_frontend_current_synthflow_20260608_1320` |
| ex294 | 8 | `ex294_r9_current_inline_synth_preset` | 10565 | 21 | 221865 | 133365 | `ex204_ex299_frontend_breakthrough_20260614_1051` |
| ex295 | 6 | `ex295_r67_cell_value_cube_defaults_abc_g_aig` | 7526 | 14 | 105364 | 68064 | `frontend_source_parallel_round67_20260613_1104` |
| ex296 | 6 | `ex296_high_split_default_abc_g_gates` | 8984 | 17 | 152728 | 104025 | `ex290_ex291_ex293_ex296_ex298_frontend_current_synthflow_20260608_1320` |
| ex297 | 8 | `ex297_r73_pairsel_cell_bit_template` | 26564 | 16 | 425024 | 225900 | `frontend_source_parallel_round73_20260613_1414` |
| ex298 | 6 | `ex298_rotate_high_split_default_synth_preset` | 33981 | 19 | 645639 | 442296 | `ex290_ex291_ex293_ex296_ex298_frontend_current_synthflow_20260608_1320` |
| ex299 | 8 | `ex299_r9_casez_full_parallel_synth_preset` | 96509 | 18 | 1737162 | 1013807 | `ex204_ex299_frontend_breakthrough_20260614_1051` |
