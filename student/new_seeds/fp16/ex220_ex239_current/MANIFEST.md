# ex220_ex239_current

Created: `2026-06-14 20:11:01 +0800`

Domain: `fp16`
Bundle type: `current`

Selection policy:
- Already-verified frontend Verilog/AIG only.
- No backend portfolio/remap/post-AIG outputs.
- Current bundle: one lowest-ADP valid frontend seed per case.
- Backend candidates: non-current candidates, low ADP first, preserving area/delay and method diversity.

| case | selected | best candidate | area | delay | ADP | reference | source run |
| --- | ---: | --- | ---: | ---: | ---: | ---: | --- |
| ex220 | 1 | `ex220_fp16_exp_exp_mant_pair_case` | 10754 | 22 | 236588 | 180404 | `ex220_ex224_frontend_fp16_semantic_20260606_2050` |
| ex221 | 1 | `ex221_varying_signexp_nested_low10_hi5_abc_g_aig` | 6811 | 18 | 122598 | 105655 | `ex204_ex299_frontend_continuation_20260614_1216` |
| ex222 | 1 | `ex222_fp16_exp10_positive_default_exp_mant_case` | 10615 | 22 | 233530 | 173621 | `ex220_ex224_frontend_fp16_semantic_20260606_2050` |
| ex223 | 1 | `ex223_catalog_source_d18_synth_preset_aig_d18` | 10564 | 19 | 200716 | 120549 | `ex223_ex299_frontend_parallel_deep_20260614_0943` |
| ex224 | 1 | `ex224_expbase_xor_low12_hi6_synth_preset_aig` | 5817 | 16 | 93072 | 64708 | `ex223_ex299_frontend_parallel_deep_20260614_0943` |
| ex225 | 1 | `ex225_catalog_source_d18_synth_preset_aig_d18` | 11356 | 19 | 215764 | 116676 | `ex223_ex299_frontend_parallel_deep_20260614_0943` |
| ex226 | 1 | `ex226_positive_default_exp_mant_case_abc_g_aig` | 33356 | 22 | 733832 | 587790 | `ex226_ex228_frontend_fp16_current_synthflow_fix_20260607_1228` |
| ex227 | 1 | `ex227_positive_default_exp_mant_case_abc_g_aig` | 40629 | 22 | 893838 | 721639 | `ex226_ex228_frontend_fp16_current_synthflow_fix_20260607_1228` |
| ex228 | 1 | `ex228_semantic_sign_exp_field_defaults_abc_g_aig` | 6627 | 20 | 132540 | 101205 | `ex226_ex228_frontend_fp16_current_synthflow_fix_20260607_1228` |
| ex229 | 1 | `ex229_odd_nested_low9_hi6_abc_g_aig` | 3957 | 16 | 63312 | 57968 | `ex204_ex299_frontend_continuation_20260614_1216` |
| ex230 | 1 | `ex230_exp_mant_pair_case_abc_g_aig` | 6969 | 20 | 139380 | 108320 | `ex230_ex231_ex234_frontend_fp16_oldrows_abcg_20260607_1853` |
| ex231 | 1 | `ex231_abc_g_aig_abc_g_aig` | 1163 | 14 | 16282 | 14066 | `ex231_ex233_ex234_frontend_fp16_power_nested_synthflow_20260607_2027` |
| ex232 | 1 | `ex232_attr_abc_g_aig` | 1240 | 13 | 16120 | 13392 | `ex232_frontend_fp16_square_deep_attr_20260607_1940` |
| ex233 | 1 | `ex233_abc_g_aig_abc_g_aig` | 1530 | 15 | 22950 | 20174 | `ex231_ex233_ex234_frontend_fp16_power_nested_synthflow_20260607_2027` |
| ex234 | 1 | `ex234_boundary_wordmode_mh5_abc_g_aig` | 1278 | 14 | 17892 | 15561 | `ex204_ex299_frontend_continuation_20260614_1216` |
| ex235 | 1 | `ex235_direct_special_low8_hi6_synth_preset` | 1628 | 14 | 22792 | 20800 | `ex235_ex237_ex239_frontend_fp16_direct_special_20260608_0924` |
| ex236 | 1 | `ex236_core_clamp_hi6_abc_g_aig` | 1432 | 15 | 21480 | 17290 | `ex236_ex238_frontend_fp16_core_clamp_20260608_0953` |
| ex237 | 1 | `ex237_direct_special_low10_hi6_synth_preset` | 1889 | 16 | 30224 | 25440 | `ex235_ex237_ex239_frontend_fp16_direct_special_20260608_0924` |
| ex238 | 1 | `ex238_r27_core_boundary_low12_hi6_synth_preset_recheck` | 1502 | 15 | 22530 | 16549 | `ex200_ex299_frontend_refgap_round27_20260613_0613` |
| ex239 | 1 | `ex239_direct_special_low7_hi6_abc_g_aig` | 2026 | 16 | 32416 | 25965 | `ex235_ex237_ex239_frontend_fp16_direct_special_specs_20260608_0929` |

