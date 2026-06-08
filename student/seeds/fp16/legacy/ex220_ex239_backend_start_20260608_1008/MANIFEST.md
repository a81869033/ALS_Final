# ex220_ex239_backend_start_20260608_1008

Curated backend-start seeds for verified frontend candidates.

Scope:
- Cases: `ex220`-`ex239`
- Contents: copied Verilog/AIG files only; no backend optimization was run by this curation step.
- Selection: current best plus a small number of low-ADP/diverse verified alternatives per case.

Files:
- `results/candidates.csv`: all copied seed candidates.
- `results/best.csv`: best copied seed per case.
- `results/summary.csv`: per-case candidate counts and reference ratios.
- `results/evaluate_check.csv`: optional official recheck records for best seeds.

| Case | Seeds | Best candidate | Area | Delay | ADP |
| --- | ---: | --- | ---: | ---: | ---: |
| ex220 | 5 | `ex220_fp16_exp_exp_mant_pair_case` | 10754 | 22 | 236588 |
| ex221 | 5 | `ex221_fp16_exp2_semantic_positive_field_defaults` | 6968 | 21 | 146328 |
| ex222 | 5 | `ex222_fp16_exp10_positive_default_exp_mant_case` | 10615 | 22 | 233530 |
| ex223 | 5 | `ex223_log_nested_low11_hi5_abc_g_aig` | 10753 | 19 | 204307 |
| ex224 | 5 | `ex224_log_nested_low12_hi6_abc_g_aig` | 6014 | 16 | 96224 |
| ex225 | 5 | `ex225_log_nested_low12_hi5_abc_g_aig` | 11533 | 19 | 219127 |
| ex226 | 5 | `ex226_positive_default_exp_mant_case_abc_g_aig` | 33356 | 22 | 733832 |
| ex227 | 5 | `ex227_positive_default_exp_mant_case_abc_g_aig` | 40629 | 22 | 893838 |
| ex228 | 5 | `ex228_semantic_sign_exp_field_defaults_abc_g_aig` | 6627 | 20 | 132540 |
| ex229 | 5 | `ex229_semantic_positive_field_defaults_abc_g_aig` | 3971 | 19 | 75449 |
| ex230 | 5 | `ex230_exp_mant_pair_case_abc_g_aig` | 6969 | 20 | 139380 |
| ex231 | 5 | `ex231_nested_bits9_hi6_abc_g_aig` | 1163 | 14 | 16282 |
| ex232 | 5 | `ex232_exp_formula_hi9_8_low8_nested_hi6_abc_g_aig` | 1240 | 13 | 16120 |
| ex233 | 5 | `ex233_nested_bits9_8_hi6_abc_g_aig` | 1530 | 15 | 22950 |
| ex234 | 5 | `ex234_nested_bits9_8_hi5_abc_g_aig` | 1351 | 17 | 22967 |
| ex235 | 5 | `ex235_direct_special_low8_hi6_synth_preset` | 1628 | 14 | 22792 |
| ex236 | 5 | `ex236_core_clamp_hi6_abc_g_aig` | 1432 | 15 | 21480 |
| ex237 | 5 | `ex237_direct_special_low10_hi6_synth_preset` | 1889 | 16 | 30224 |
| ex238 | 5 | `ex238_core_boundary_low12_hi6_synth_preset` | 1502 | 15 | 22530 |
| ex239 | 5 | `ex239_direct_special_low7_hi6_abc_g_aig` | 2026 | 16 | 32416 |
