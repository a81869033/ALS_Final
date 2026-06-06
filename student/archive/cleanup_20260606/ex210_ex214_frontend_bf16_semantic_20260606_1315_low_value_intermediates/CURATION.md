# Curation

Run: `ex210_ex214_frontend_bf16_semantic_20260606_1315`

Kept active candidates:
- `ex210`: 5 variants kept: aggr_semantic_field_reassembly, const_default_3f80_h3, const_default_0000_h3, sep_fields_e3_m3_s0, const_default_3f00_h3_first
- `ex211`: 5 variants kept: aggr_semantic_positive_symmetry_fields, legacy_exp_mant_delta_pair, hand_recip_formula_mant_lut, hand_recip_formula_signmag_lut, hand_recip_formula_signmag_add_lut
- `ex212`: 5 variants kept: arith_semantic_fields, legacy_exp_mant_delta_pair, delta_pair_first_hilo4, delta_pair_mode_hilo4, delta_pair_mode_hilo4_bits_15_bh1
- `ex213`: 5 variants kept: arith_semantic_fields, sep_fields_e3_m3_s3, sep_fields_e3_m3_s3_bits_1_bh1, sep_fields_e3_m3_s3_bits_14_bh1, sep_fields_e2_m3_s3_bits_1_bh1
- `ex214`: 5 variants kept: legacy_exp_mant_delta_pair, legacy_default_expr_exception_case, delta_pair_first_hilo3, legacy_default_expr_exception_case_bits_13_runs_fix, legacy_default_expr_exception_case_bits_13_cmp_fix

Archived:
- Full pre-curation CSVs: `student/archive/cleanup_20260606/ex210_ex214_frontend_bf16_semantic_20260606_1315_low_value_intermediates/results_before_curation/`
- Low-value generated Verilog/AIG/log files: `student/archive/cleanup_20260606/ex210_ex214_frontend_bf16_semantic_20260606_1315_low_value_intermediates/work_low_value/`
- Smoke run work/results were archived under this cleanup folder.

Selection rule:
- Keep current best, close alternatives, semantic hand RTL baselines, and one or two structural baselines per case.
- Archive failed candidates, broad table sweeps, slow exception tables, and variants that clearly worsened area-delay product.
