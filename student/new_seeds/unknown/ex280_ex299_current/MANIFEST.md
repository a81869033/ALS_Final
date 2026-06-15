# ex280_ex299_current

Created: `2026-06-14 23:20:22 +0800 refresh`

Domain: `unknown`
Bundle type: `current`

Selection policy:
- Already-verified frontend Verilog/AIG only.
- No backend portfolio/remap/post-AIG outputs.
- Current bundle: one lowest-ADP valid frontend seed per case.
- Backend candidates: non-current candidates, low ADP first, preserving area/delay and method diversity.

| case | selected | best candidate | area | delay | ADP | reference | source run |
| --- | ---: | --- | ---: | ---: | ---: | ---: | --- |
| ex280 | 1 | `ex280_gf2_overlap_roots_small_roots_balanced_linfact_abc_g_aig` | 115 | 26 | 2990 | 2415 | `ex200_ex299_frontend_refgap_round3_20260612_1554` |
| ex281 | 1 | `ex281_gf2_overlap_roots_small_roots_balanced_linfact_abc_g_aig` | 128 | 26 | 3328 | 2336 | `ex200_ex299_frontend_refgap_round3_20260612_1554` |
| ex282 | 1 | `ex282_gf2_overlap_roots_mixed_roots_delaycap_balanced_linfact_abc_g_aig` | 144 | 28 | 4032 | 2704 | `ex200_ex299_frontend_refgap_round3_20260612_1554` |
| ex283 | 1 | `ex283_gf2_overlap_roots_wide_roots_delaycap_balanced_linfact_abc_g_aig` | 150 | 30 | 4500 | 3168 | `ex200_ex299_frontend_refgap_round3_20260612_1554` |
| ex284 | 1 | `ex284_gf2_overlap_roots_wide_roots_delaycap_balanced_linfact_abc_g_aig` | 160 | 34 | 5440 | 4240 | `ex200_ex299_frontend_refgap_round3_20260612_1554` |
| ex285 | 1 | `ex285_r9_boundary_mask_all_boundary` | 772 | 16 | 12352 | 5499 | `ex204_ex299_frontend_breakthrough_20260614_1051` |
| ex286 | 1 | `ex286_linhyb_sweep_raw_3_5_6_8_f00_global_abc_g_aig` | 1338 | 15 | 20070 | 2376 | `ex286_ex287_frontend_structural_decomp_20260614_2320` |
| ex287 | 1 | `ex287_orientfollow_k7_b2_b3_b11_f11_case_direct_abc_g_aig` | 1697 | 14 | 23758 | 5782 | `ex286_ex287_frontend_structural_decomp_20260614_2320` |
| ex288 | 1 | `ex288_r8_current_keybdd_synth_preset_control` | 2173 | 14 | 30422 | 16394 | `ex204_ex299_frontend_breakthrough_20260614_1051` |
| ex289 | 1 | `ex289_unknown_duality_symcof_split2_f10_bits_0_1_12_13_onehot_group_xor_abc_g_aig` | 1047 | 19 | 19893 | 13620 | `ex289_frontend_duality_symcof_split2_xorwrap_synthflow_20260609_1128` |
| ex290 | 1 | `ex290_r8_rotate_parallel_case_attrs` | 4376 | 14 | 61264 | 42328 | `ex204_ex299_frontend_breakthrough_20260614_1051` |
| ex291 | 1 | `ex291_r8_rotate_parallel_case_attrs` | 6447 | 14 | 90258 | 66850 | `ex204_ex299_frontend_breakthrough_20260614_1051` |
| ex292 | 1 | `ex292_r8_mod7_4_drop_mod7_13` | 6743 | 20 | 134860 | 84854 | `ex204_ex299_frontend_breakthrough_20260614_1051` |
| ex293 | 1 | `ex293_rotate_low_split_default_synth_preset` | 8054 | 18 | 144972 | 112966 | `ex290_ex291_ex293_ex296_ex298_frontend_current_synthflow_20260608_1320` |
| ex294 | 1 | `ex294_r8_current_synth_preset` | 10497 | 21 | 220437 | 133365 | `ex204_ex299_frontend_breakthrough_20260614_1051` |
| ex295 | 1 | `ex295_r67_bit_plane_cube_defaults_abc_g_aig` | 7311 | 13 | 95043 | 68064 | `frontend_source_parallel_round67_20260613_1104` |
| ex296 | 1 | `ex296_high_split_default_abc_g_aig` | 8987 | 16 | 143792 | 104025 | `ex290_ex291_ex293_ex296_ex298_frontend_current_synthflow_20260608_1320` |
| ex297 | 1 | `ex297_r9_casez_full_parallel_synth_preset` | 26188 | 16 | 419008 | 225900 | `ex204_ex299_frontend_breakthrough_20260614_1051` |
| ex298 | 1 | `ex298_r7_rotate_split_parallel_case_attrs` | 33802 | 18 | 608436 | 442296 | `ex204_ex299_frontend_breakthrough_20260614_1051` |
| ex299 | 1 | `ex299_r9_pairsel_center_quad_synth_preset` | 96502 | 18 | 1737036 | 1013807 | `ex204_ex299_frontend_breakthrough_20260614_1051` |
