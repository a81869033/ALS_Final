# ex255_ex279_current

Best-only integer seed bundle for ex255-ex279.

This bundle contains exactly one current best verified Verilog/AIG seed per case. Use this as the primary backend optimization starting point list.

Files:
- `results/best.csv`: one best row per case.
- `results/candidates.csv`: same 25 best rows for tools that expect candidate CSVs.
- `results/summary.csv`: per-case score summary.
- `results/evaluate_check.csv`: copied verified candidate records.

| Case | Candidate | Area | Delay | ADP |
| --- | --- | ---: | ---: | ---: |
| ex255 | `ex255_umul_wallace_bits_abc_g_aig` | 87 | 13 | 1131 |
| ex256 | `ex256_umul_csa_androws_cla_abc_g_aig` | 159 | 18 | 2862 |
| ex257 | `ex257_umul_csa_androws_cla_from3_synth_preset_d13` | 263 | 20 | 5260 |
| ex258 | `ex258_umul_wallace_bits_abc_g_aig` | 351 | 25 | 8775 |
| ex259 | `ex259_umul_wallace_bits_cla_abc_g_aig` | 480 | 28 | 13440 |
| ex260 | `ex260_smul_baugh_wooley_wallace_rev_hcla4_abc_g_aig` | 88 | 13 | 1144 |
| ex261 | `ex261_smul_baugh_wooley_wallace_hcla4_abc_g_aig` | 164 | 18 | 2952 |
| ex262 | `ex262_smul_baugh_wooley_wallace_hcla4_abc_g_aig` | 252 | 22 | 5544 |
| ex263 | `ex263_smul_baugh_wooley_wallace_outside_hcla1_synth_preset_d11` | 362 | 24 | 8688 |
| ex264 | `ex264_smul_baugh_wooley_wallace_rev_hcla6_abc_g_aig` | 486 | 27 | 13122 |
| ex265 | `ex265_udiv_cof_bhi3_ahi1_bitbdd_wordmux_synth_preset` | 63 | 8 | 504 |
| ex266 | `ex266_udiv_ex266_cof_bhi2_a4_bitbdd_wordmux_synth_preset_d18` | 148 | 10 | 1480 |
| ex267 | `ex267_udiv_hybrid_top2_deep_abc_g_aig` | 340 | 12 | 4080 |
| ex268 | `ex268_udiv_denom_lz_range_direct_synth_preset` | 199 | 53 | 10547 |
| ex269 | `ex269_udiv_radix4_shift_subtract_wreduce_abc_g_aig` | 380 | 41 | 15580 |
| ex270 | `ex270_square_wallace_square_outside_csel5_abc_g_aig` | 191 | 17 | 3247 |
| ex271 | `ex271_square_wallace_square_outside_csel4_synth_preset` | 331 | 25 | 8275 |
| ex272 | `ex272_square_wallace_square_outside_csel5_synth_preset` | 507 | 32 | 16224 |
| ex273 | `ex273_square_hybrid_bddtop4_wreduce_abc_g_aig` | 797 | 33 | 26301 |
| ex274 | `ex274_square_hybrid_bddtop2_trunc_synth_preset_d16` | 985 | 42 | 41370 |
| ex275 | `ex275_isqrt_prefix5_ge_tree_lsb_arith_wreduce_aig` | 43 | 7 | 301 |
| ex276 | `ex276_isqrt_prefix4_ge_bitwise_synth_preset` | 101 | 10 | 1010 |
| ex277 | `ex277_isqrt_cofbdd4_reverse_synth_preset` | 237 | 12 | 2844 |
| ex278 | `ex278_isqrt_prefix5_range_synth_preset` | 502 | 14 | 7028 |
| ex279 | `ex279_isqrt_radix4_wires_synth_preset` | 334 | 42 | 14028 |
