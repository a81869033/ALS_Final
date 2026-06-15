# ex220_ex239_backend_candidates_20260614_2011

Created: `2026-06-14 20:11:01 +0800`

Domain: `fp16`
Bundle type: `backend_candidates`

Selection policy:
- Already-verified frontend Verilog/AIG only.
- No backend portfolio/remap/post-AIG outputs.
- Current bundle: one lowest-ADP valid frontend seed per case.
- Backend candidates: non-current candidates, low ADP first, preserving area/delay and method diversity.

| case | selected | best candidate | area | delay | ADP | reference | source run |
| --- | ---: | --- | ---: | ---: | ---: | ---: | --- |
| ex220 | 5 | `ex220_fp16_exp_positive_default_exp_mant_case` | 10794 | 22 | 237468 | 180404 | `ex220_ex224_frontend_fp16_semantic_20260606_2050` |
| ex221 | 6 | `ex221_varying_signexp_wordmode_mh5_abc_g_aig` | 7042 | 18 | 126756 | 105655 | `ex204_ex299_frontend_continuation_20260614_1216` |
| ex222 | 5 | `ex222_fp16_exp10_sign_exp_default_expr_case` | 10629 | 22 | 233838 | 173621 | `ex220_ex239_semantic_20260604` |
| ex223 | 6 | `ex223_nested_low15_hi5_synth_preset_aig` | 10581 | 19 | 201039 | 120549 | `ex223_ex299_frontend_parallel_deep_20260614_0943` |
| ex224 | 6 | `ex224_cofactor_bdd_bits15_12_11_synth_preset_aig` | 5844 | 16 | 93504 | 64708 | `ex223_ex299_frontend_parallel_deep_20260614_0943` |
| ex225 | 6 | `ex225_nested_low14_hi5_synth_preset_aig` | 11364 | 19 | 215916 | 116676 | `ex223_ex299_frontend_parallel_deep_20260614_0943` |
| ex226 | 6 | `ex226_fp16_sin_positive_default_exp_mant_case` | 33460 | 23 | 769580 | 587790 | `ex220_ex239_semantic_20260604` |
| ex227 | 6 | `ex227_fp16_tan_positive_default_exp_mant_case` | 40817 | 23 | 938791 | 721639 | `ex220_ex239_semantic_20260604` |
| ex228 | 6 | `ex228_fp16_sinh_odd_sinh_saturation_shell` | 6653 | 21 | 139713 | 101205 | `ex226_ex229_frontend_fp16_shells_fix_20260607_1128` |
| ex229 | 4 | `ex229_odd_nested_low10_hi6_abc_g_aig` | 3919 | 17 | 66623 | 57968 | `ex204_ex299_frontend_continuation_20260614_1216` |
| ex230 | 6 | `ex230_positive_default_exp_mant_case_abc_g_aig` | 6979 | 20 | 139580 | 108320 | `ex230_ex231_ex234_frontend_fp16_oldrows_abcg_20260607_1853` |
| ex231 | 6 | `ex231_abc_g_aig_abc_g_gates` | 1165 | 14 | 16310 | 14066 | `ex231_ex233_ex234_frontend_fp16_power_nested_synthflow_20260607_2027` |
| ex232 | 6 | `ex232_exp_kformula_hi9_8_low8_nested_hi6_abc_g_aig` | 1250 | 13 | 16250 | 13392 | `ex232_frontend_fp16_square_deep_20260607_1940` |
| ex233 | 6 | `ex233_abc_g_aig_abc_g_gates` | 1532 | 15 | 22980 | 20174 | `ex231_ex233_ex234_frontend_fp16_power_nested_synthflow_20260607_2027` |
| ex234 | 6 | `ex234_boundary_wordmode_mh6_abc_g_aig` | 1321 | 14 | 18494 | 15561 | `ex204_ex299_frontend_continuation_20260614_1216` |
| ex235 | 4 | `ex235_direct_special_low8_hi6_abc_g_aig` | 1679 | 14 | 23506 | 20800 | `ex235_ex237_ex239_frontend_fp16_direct_special_20260608_0924` |
| ex236 | 6 | `ex236_core_clamp_hi6_abc_g_gates` | 1435 | 15 | 21525 | 17290 | `ex236_ex238_frontend_fp16_core_clamp_allflows_20260608_0953` |
| ex237 | 6 | `ex237_open_low10_hi6_abc_g_aig` | 1934 | 16 | 30944 | 25440 | `ex235_ex239_frontend_fp16_combined_best_all_synthflows_20260608_0935` |
| ex238 | 6 | `ex238_core_boundary_low15_hi5_synth_preset` | 1462 | 16 | 23392 | 16549 | `ex236_ex238_frontend_fp16_core_boundary_low15_20260608_0944` |
| ex239 | 6 | `ex239_direct_special_low8_hi6_abc_g_aig` | 2032 | 16 | 32512 | 25965 | `ex235_ex237_ex239_frontend_fp16_direct_special_20260608_0924` |

Candidate shortfalls:
- `ex220`: selected 5/6; valid distinct frontend candidates were insufficient after filtering.
- `ex222`: selected 5/6; valid distinct frontend candidates were insufficient after filtering.

