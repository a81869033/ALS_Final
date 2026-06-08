# ex245_ex249_frontend_fp8_e5m2_curated_20260608_1715

Run ID: `ex245_ex249_frontend_fp8_e5m2_curated_20260608_1715`

Purpose: curated aggregate results for ex245-ex249 E5M2FN frontend reverse engineering. This run references verified Verilog/AIG artifacts from the individual experiment runs and does not curate `student/seeds`.

Artifacts:
- Candidates CSV: `student/runs/float_fp8/ex245_ex249_frontend_fp8_e5m2_curated_20260608_1715/results/candidates.csv`
- Best CSV: `student/runs/float_fp8/ex245_ex249_frontend_fp8_e5m2_curated_20260608_1715/results/best.csv`

Semantics:
- ex245: E5M2FN add, high byte + low byte, RNE, canonical `8'h7f` NaN.
- ex246: E5M2FN multiply, high byte * low byte, RNE.
- ex247: E5M2FN division, low byte / high byte, RNE.
- ex248: E5M2FN fmod, low byte % high byte, output sign from low byte.
- ex249: E5M2FN hypot of operand magnitudes, positive output sign.

Official `evaluate.py` replay of current best AIGs: all five cases OK.

Best rows:
- ex245: `ex245_semantic_add_gap_class_synth_preset_aig` area/delay/ADP `701/34/23834`, ratio `2.156923`.
- ex246: `ex246_semantic_mul_product_class_synth_preset_aig` area/delay/ADP `343/23/7889`, ratio `2.812478`.
- ex247: `ex247_semantic_div_sigpair_class_synth_preset_aig` area/delay/ADP `420/22/9240`, ratio `3.105882`.
- ex248: `ex248_semantic_fmod_periodic_rem_abc_g_aig` area/delay/ADP `285/30/8550`, ratio `2.045455`.
- ex249: `ex249_semantic_hypot_threshold_rawexp_synth_preset_aig` area/delay/ADP `168/26/4368`, ratio `2.101010`.
