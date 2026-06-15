# Coordinator Notes: ex200_ex299_frontend_refgap_round6_20260612_1807

Top assigned frontend/reference gaps at launch:
- `ex286` (unknown-a-r6): frontend `21705` vs reference `2376`, ratio `9.135101`; current `ex286_interleave_f00_k4_abc_g_aig`
- `ex287` (unknown-a-r6): frontend `27480` vs reference `5782`, ratio `4.752681`; current `ex287_interleave_f00_k5_abc_g_aig`
- `ex247` (float-fp8-r6): frontend `8808` vs reference `2975`, ratio `2.960672`; current `ex247_e5m2fn_div_bound_region_mux`
- `ex246` (float-fp8-r6): frontend `7502` vs reference `2805`, ratio `2.674510`; current `ex246_semantic_mul_product_dc_seed12_set11to10_synth_preset_aig`
- `ex297` (unknown-b-r6): frontend `583596` vs reference `225900`, ratio `2.583426`; current `ex297_low_split_default_abc_g_aig`
- `ex299` (unknown-b-r6): frontend `2604734` vs reference `1013807`, ratio `2.569260`; current `ex299_high_split_default_abc_g_aig`
- `ex285` (unknown-a-r6): frontend `13175` vs reference `5499`, ratio `2.395890`; current `ex285_decision_tree_greedy_synth_preset`
- `ex244` (float-fp8-r6): frontend `10234` vs reference `4272`, ratio `2.395599`; current `ex244_semantic_hypot_delta_maxeff_bdd_expfirst_synth_preset_aig`
- `ex240` (float-fp8-r6): frontend `30090` vs reference `13299`, ratio `2.262576`; current `ex240_semantic_add_same_grs_diff_param8_synth_preset_aig`
- `ex245` (float-fp8-r6): frontend `23834` vs reference `11050`, ratio `2.156923`; current `ex245_semantic_add_gap_class_synth_preset_aig`
- `ex241` (float-fp8-r6): frontend `15544` vs reference `7224`, ratio `2.151717`; current `ex241_semantic_mul_product_nested_exp_synth_preset_aig`
- `ex242` (float-fp8-r6): frontend `25320` vs reference `11900`, ratio `2.127731`; current `ex242_semantic_div_field_sparse_clean_synth_preset_aig`
- `ex249` (float-fp8-r6): frontend `4368` vs reference `2079`, ratio `2.101010`; current `ex249_semantic_hypot_threshold_rawexp_synth_preset_aig`
- `ex248` (float-fp8-r6): frontend `8550` vs reference `4180`, ratio `2.045455`; current `ex248_semantic_fmod_periodic_rem_abc_g_aig`
- `ex295` (unknown-b-r6): frontend `138448` vs reference `68064`, ratio `2.034086`; current `ex295_low_split_default_abc_g_aig`

Merge protocol:
- Concatenate agent shard CSVs by schema into `results/`.
- Deduplicate by `(case, method_signature)` for candidate/eval rows.
- For success rows, verify `verilog_path`, `aig_path`, and `evaluate_log` exist and `equivalent` is true.
- Re-run or inspect official `evaluate.py` logs before accepting any best improvement.
- Update global frontend registry only after merge validation, then run `python3 student/scripts/build_frontend_campaign_index.py`.
