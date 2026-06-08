# ex220_ex239_current

Best-only FP16 seed bundle for ex220-ex239.

This bundle contains exactly one current best verified Verilog/AIG seed per case. Use this as the primary backend optimization starting point list.

Files:
- `results/best.csv`: one best row per case.
- `results/candidates.csv`: same 20 best rows for tools that expect candidate CSVs.
- `results/summary.csv`: per-case score summary.
- `results/evaluate_check.csv`: copied official best recheck records.

| Case | Candidate | Area | Delay | ADP |
| --- | --- | ---: | ---: | ---: |
| ex220 | `ex220_fp16_exp_exp_mant_pair_case` | 10754 | 22 | 236588 |
| ex221 | `ex221_fp16_exp2_semantic_positive_field_defaults` | 6968 | 21 | 146328 |
| ex222 | `ex222_fp16_exp10_positive_default_exp_mant_case` | 10615 | 22 | 233530 |
| ex223 | `ex223_log_nested_low11_hi5_abc_g_aig` | 10753 | 19 | 204307 |
| ex224 | `ex224_log_nested_low12_hi6_abc_g_aig` | 6014 | 16 | 96224 |
| ex225 | `ex225_log_nested_low12_hi5_abc_g_aig` | 11533 | 19 | 219127 |
| ex226 | `ex226_positive_default_exp_mant_case_abc_g_aig` | 33356 | 22 | 733832 |
| ex227 | `ex227_positive_default_exp_mant_case_abc_g_aig` | 40629 | 22 | 893838 |
| ex228 | `ex228_semantic_sign_exp_field_defaults_abc_g_aig` | 6627 | 20 | 132540 |
| ex229 | `ex229_semantic_positive_field_defaults_abc_g_aig` | 3971 | 19 | 75449 |
| ex230 | `ex230_exp_mant_pair_case_abc_g_aig` | 6969 | 20 | 139380 |
| ex231 | `ex231_nested_bits9_hi6_abc_g_aig` | 1163 | 14 | 16282 |
| ex232 | `ex232_exp_formula_hi9_8_low8_nested_hi6_abc_g_aig` | 1240 | 13 | 16120 |
| ex233 | `ex233_nested_bits9_8_hi6_abc_g_aig` | 1530 | 15 | 22950 |
| ex234 | `ex234_nested_bits9_8_hi5_abc_g_aig` | 1351 | 17 | 22967 |
| ex235 | `ex235_direct_special_low8_hi6_synth_preset` | 1628 | 14 | 22792 |
| ex236 | `ex236_core_clamp_hi6_abc_g_aig` | 1432 | 15 | 21480 |
| ex237 | `ex237_direct_special_low10_hi6_synth_preset` | 1889 | 16 | 30224 |
| ex238 | `ex238_core_boundary_low12_hi6_synth_preset` | 1502 | 15 | 22530 |
| ex239 | `ex239_direct_special_low7_hi6_abc_g_aig` | 2026 | 16 | 32416 |
