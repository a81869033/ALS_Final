# ex255_ex279_backend_candidates_20260614_2011

Created: `2026-06-14 20:11:01 +0800`

Domain: `integer`
Bundle type: `backend_candidates`

Selection policy:
- Already-verified frontend Verilog/AIG only.
- No backend portfolio/remap/post-AIG outputs.
- Current bundle: one lowest-ADP valid frontend seed per case.
- Backend candidates: non-current candidates, low ADP first, preserving area/delay and method diversity.

| case | selected | best candidate | area | delay | ADP | reference | source run |
| --- | ---: | --- | ---: | ---: | ---: | ---: | --- |
| ex255 | 6 | `ex255_umul_wallace_bits_prefix_synth_preset` | 87 | 13 | 1131 | 836 | `ex255_ex259_frontend_umul_wallace_bits_20260609_0034` |
| ex256 | 6 | `ex256_current_frontend_replay_post_resyn2` | 158 | 18 | 2844 | 1911 | `ex200_ex299_frontend_parallel_shared_20260612_1422` |
| ex257 | 6 | `ex257_umul_csa_androws_cla_from4_wreduce_abc_g_aig` | 254 | 21 | 5334 | 3952 | `ex255_ex259_frontend_umul_cla_spread_20260609_0133` |
| ex258 | 6 | `ex258_umul_csa_androws_cla_from3_wreduce_abc_g_aig` | 372 | 24 | 8928 | 6289 | `ex255_ex259_frontend_umul_cla_spread_20260609_0133` |
| ex259 | 6 | `ex259_umul_wallace_bits_outside_cla_abc_g_aig` | 480 | 28 | 13440 | 10000 | `ex258_ex259_frontend_umul_wallace_order_cla_20260609_0140` |
| ex260 | 6 | `ex260_r78_grouped_keep_common_abc_g_aig` | 87 | 13 | 1131 | 657 | `frontend_source_parallel_round78_20260613_1744` |
| ex261 | 6 | `ex261_current_frontend_replay_post_resyn2` | 164 | 18 | 2952 | 2041 | `ex200_ex299_frontend_parallel_shared_20260612_1422` |
| ex262 | 6 | `ex262_smul_baugh_wooley_wallace_hcla4_wreduce_abc_g_aig` | 252 | 22 | 5544 | 4900 | `ex260_ex264_frontend_smul_baugh_hcla_all_20260609_0324` |
| ex263 | 6 | `ex263_smul_baugh_wooley_wallace_rev_rhcla7_synth_preset_d13` | 363 | 24 | 8712 | 6840 | `ex260_ex264_frontend_smul_order_edge_start_20260609_0605` |
| ex264 | 6 | `ex264_smul_baugh_wooley_wallace_rev_rhcla1_abc_g_aig` | 487 | 27 | 13149 | 9724 | `ex260_ex264_frontend_smul_order_edge_start_20260609_0605` |
| ex265 | 6 | `ex265_r4_udiv_current_source_synth_preset_aig` | 63 | 8 | 504 | 322 | `ex204_ex299_frontend_breakthrough_20260614_1051` |
| ex266 | 6 | `ex266_udiv_cof_bhi2_a_hi2_wordmux_synth_preset` | 153 | 10 | 1530 | 848 | `ex266_ex267_ex276_frontend_highgap_struct_20260609_1732` |
| ex267 | 6 | `ex267_r9_q54_formula_overlay_abc_and` | 334 | 12 | 4008 | 2651 | `ex204_ex299_frontend_breakthrough_20260614_1051` |
| ex268 | 6 | `ex268_udiv_denom_lz_range_direct_abc_g_aig` | 200 | 53 | 10600 | 7446 | `ex268_ex269_frontend_udiv_lz_range_20260609_0915` |
| ex269 | 6 | `ex269_udiv_radix4_shift_subtract_gt_guard_synth_preset` | 382 | 42 | 16044 | 11760 | `ex266_ex267_ex269_frontend_udiv_radix_shift_20260609_1110` |
| ex270 | 6 | `ex270_r5_top3_threshold_recut_synth_preset_aig` | 199 | 16 | 3184 | 2076 | `ex204_ex299_frontend_breakthrough_20260614_1051` |
| ex271 | 6 | `ex271_square_wallace_square_outside_csel12_abc_g_aig` | 336 | 24 | 8064 | 5542 | `ex204_ex299_frontend_continuation_20260614_1216` |
| ex272 | 6 | `ex272_square_wallace_square_outside_csel14_abc_g_aig` | 510 | 30 | 15300 | 10880 | `ex204_ex299_frontend_continuation_20260614_1216` |
| ex273 | 6 | `ex273_square_hybrid_bddtop4_wreduce_abc_g_aig` | 797 | 33 | 26301 | 15078 | `ex273_ex274_frontend_square_block4_decomp_20260609_1240` |
| ex274 | 6 | `ex274_hybrid_cmptop2_trunc_abc_g_aig` | 986 | 42 | 41412 | 21630 | `ex223_ex299_frontend_parallel_deep_20260614_0943` |
| ex275 | 6 | `ex275_isqrt_prefix3_ge_bitwise_arith_wreduce_aig` | 48 | 7 | 336 | 204 | `ex275_ex276_frontend_isqrt_shared_ge_20260609_1656` |
| ex276 | 6 | `ex276_r4_prefix4_shared_ge_synth_preset_and` | 101 | 10 | 1010 | 632 | `ex204_ex299_frontend_breakthrough_20260614_1051` |
| ex277 | 6 | `ex277_isqrt_prefix6_range_synth_preset` | 267 | 11 | 2937 | 1980 | `ex275_ex279_frontend_isqrt_radix_prefix_20260609_1551` |
| ex278 | 6 | `ex278_isqrt_prefix6_range_synth_preset` | 517 | 14 | 7238 | 5198 | `ex275_ex279_frontend_isqrt_radix_prefix_20260609_1551` |
| ex279 | 6 | `ex279_isqrt_radix4_prio_synth_preset` | 337 | 42 | 14154 | 10952 | `ex275_ex279_frontend_isqrt_radix_prio_bdd_20260609_1551` |

