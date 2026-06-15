# ex255_ex279_current

Created: `2026-06-14 20:11:01 +0800`

Domain: `integer`
Bundle type: `current`

Selection policy:
- Already-verified frontend Verilog/AIG only.
- No backend portfolio/remap/post-AIG outputs.
- Current bundle: one lowest-ADP valid frontend seed per case.
- Backend candidates: non-current candidates, low ADP first, preserving area/delay and method diversity.

| case | selected | best candidate | area | delay | ADP | reference | source run |
| --- | ---: | --- | ---: | ---: | ---: | ---: | --- |
| ex255 | 1 | `ex255_umul_wallace_bits_abc_g_aig` | 87 | 13 | 1131 | 836 | `ex255_ex259_frontend_umul_wallace_bits_20260609_0034` |
| ex256 | 1 | `ex256_current_frontend_replay_post_dch` | 158 | 18 | 2844 | 1911 | `ex200_ex299_frontend_parallel_shared_20260612_1422` |
| ex257 | 1 | `ex257_umul_csa_androws_cla_from3_synth_preset_d13` | 263 | 20 | 5260 | 3952 | `ex255_ex259_frontend_umul_cla_spread_20260609_0133` |
| ex258 | 1 | `ex258_umul_wallace_bits_abc_g_aig` | 351 | 25 | 8775 | 6289 | `ex255_ex259_frontend_umul_wallace_bits_20260609_0034` |
| ex259 | 1 | `ex259_umul_wallace_bits_cla_abc_g_aig` | 480 | 28 | 13440 | 10000 | `ex255_ex259_frontend_umul_cla_spread_20260609_0133` |
| ex260 | 1 | `ex260_smul_bw4_center_rhcla2_abc_g_aig` | 92 | 12 | 1104 | 657 | `ex223_ex299_frontend_parallel_deep_20260614_0943` |
| ex261 | 1 | `ex261_current_frontend_replay_post_dch` | 164 | 18 | 2952 | 2041 | `ex200_ex299_frontend_parallel_shared_20260612_1422` |
| ex262 | 1 | `ex262_smul_baugh_wooley_wallace_hcla4_abc_g_aig` | 252 | 22 | 5544 | 4900 | `ex260_ex264_frontend_smul_baugh_hcla_all_20260609_0324` |
| ex263 | 1 | `ex263_smul_baugh_wooley_wallace_outside_hcla1_mod_synth_preset_d11` | 362 | 24 | 8688 | 6840 | `ex260_ex263_frontend_smul_modcarry_20260609_0703` |
| ex264 | 1 | `ex264_smul_baugh_wooley_wallace_rev_hcla6_abc_g_aig` | 486 | 27 | 13122 | 9724 | `ex260_ex264_frontend_smul_order_edge_start_20260609_0605` |
| ex265 | 1 | `ex265_r6_range_bhi2_lut_abc_g_aig` | 58 | 8 | 464 | 322 | `ex204_ex299_frontend_breakthrough_20260614_1051` |
| ex266 | 1 | `ex266_udiv_ex266_cof_bhi2_a4_bitbdd_wordmux_synth_preset_d18` | 148 | 10 | 1480 | 848 | `ex200_ex299_frontend_refgap_round8_20260612_1826` |
| ex267 | 1 | `ex267_r9_q54_formula_overlay` | 331 | 12 | 3972 | 2651 | `ex204_ex299_frontend_breakthrough_20260614_1051` |
| ex268 | 1 | `ex268_udiv_denom_lz_range_direct_synth_preset` | 199 | 53 | 10547 | 7446 | `ex268_ex269_frontend_udiv_lz_range_20260609_0915` |
| ex269 | 1 | `ex269_udiv_radix4_shift_subtract_wreduce_abc_g_aig` | 380 | 41 | 15580 | 11760 | `ex266_ex267_ex269_frontend_udiv_radix_shift_20260609_1110` |
| ex270 | 1 | `ex270_r5_top3_threshold_recut_abc_g_aig` | 204 | 15 | 3060 | 2076 | `ex204_ex299_frontend_breakthrough_20260614_1051` |
| ex271 | 1 | `ex271_square_wallace_square_outside_csel12_synth_preset_d16` | 332 | 24 | 7968 | 5542 | `ex204_ex299_frontend_continuation_20260614_1216` |
| ex272 | 1 | `ex272_square_wallace_square_outside_csel14_synth_preset_d20` | 509 | 30 | 15270 | 10880 | `ex204_ex299_frontend_continuation_20260614_1216` |
| ex273 | 1 | `ex273_square_hybrid_bddtop4_perbit_wreduce_abc_g_aig` | 797 | 33 | 26301 | 15078 | `ex273_ex274_frontend_square_hybrid_bddtop_perbit_20260609_1240` |
| ex274 | 1 | `ex274_square_hybrid_bddtop2_trunc_synth_preset` | 985 | 42 | 41370 | 21630 | `ex273_ex274_frontend_square_hybrid_bddtop_trunc_20260609_1240` |
| ex275 | 1 | `ex275_isqrt_prefix5_ge_tree_lsb_arith_wreduce_aig` | 43 | 7 | 301 | 204 | `ex275_ex276_frontend_isqrt_newbest_gateflow_20260609_1656` |
| ex276 | 1 | `ex276_r4_prefix4_shared_ge_synth_preset_aig` | 101 | 10 | 1010 | 632 | `ex204_ex299_frontend_breakthrough_20260614_1051` |
| ex277 | 1 | `ex277_isqrt_cofbdd4_reverse_synth_preset_d12` | 237 | 12 | 2844 | 1980 | `ex200_ex299_frontend_refgap_round11_20260612_1944` |
| ex278 | 1 | `ex278_isqrt_prefix5_range_synth_preset` | 502 | 14 | 7028 | 5198 | `ex275_ex279_frontend_isqrt_cofbdd_lowtarget_20260609_1551` |
| ex279 | 1 | `ex279_isqrt_radix4_wires_synth_preset` | 334 | 42 | 14028 | 10952 | `ex275_ex279_frontend_isqrt_new_structures_all_20260609_1618` |

