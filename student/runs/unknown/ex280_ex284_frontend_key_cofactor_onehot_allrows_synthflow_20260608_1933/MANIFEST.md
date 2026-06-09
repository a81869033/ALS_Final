# ex280_ex284_frontend_key_cofactor_onehot_allrows_synthflow_20260608_1933

Run ID: `ex280_ex284_frontend_key_cofactor_onehot_allrows_synthflow_20260608_1933`

Purpose: All-row limited synthflow for one-hot cofactor BDD.

Inputs:
- Truth files: `benchmarks/ex280.truth` through `benchmarks/ex284.truth`
- Seed Verilog: best or candidate rows from the paired raw frontend run
- Script: `student/scripts/yosys_synthflow_from_best_csv.py`

Artifacts:
- Work directory: `student/work/ex280_ex284_frontend_key_cofactor_onehot_allrows_synthflow_20260608_1933/`
- Candidates CSV: `student/runs/unknown/ex280_ex284_frontend_key_cofactor_onehot_allrows_synthflow_20260608_1933/results/candidates.csv`
- Best CSV: `student/runs/unknown/ex280_ex284_frontend_key_cofactor_onehot_allrows_synthflow_20260608_1933/results/best.csv`
- Summary CSV: `student/runs/unknown/ex280_ex284_frontend_key_cofactor_onehot_allrows_synthflow_20260608_1933/results/summary.csv`
- Evaluate check CSV: `student/runs/unknown/ex280_ex284_frontend_key_cofactor_onehot_allrows_synthflow_20260608_1933/results/evaluate_check.csv`

Methods tried:
- abc_g_aig and synth_preset on every top5/top6 one-hot raw row.
- All generated AIGs in `candidates.csv` are exact-equivalence checked through the project ABC/evaluate path.

Best result:
- ex280: `ex280_prefix_parity_reduce_top6_first_onehot_abc_g_aig` 769/25/19225 via `abc_g_aig` (unknown_key_canonical_cofactor_bdd)
- ex281: `ex281_prefix_parity_reduce_top6_first_onehot_synth_preset` 882/27/23814 via `synth_preset` (unknown_key_canonical_cofactor_bdd)
- ex282: `ex282_prefix_parity_reduce_top6_first_onehot_synth_preset` 1028/29/29812 via `synth_preset` (unknown_key_canonical_cofactor_bdd)
- ex283: `ex283_prefix_parity_reduce_top6_first_onehot_abc_g_aig` 1189/30/35670 via `abc_g_aig` (unknown_key_canonical_cofactor_bdd)
- ex284: `ex284_prefix_parity_reduce_top5_first_onehot_abc_g_aig` 1310/36/47160 via `abc_g_aig` (unknown_key_canonical_cofactor_bdd)

Notes:
- One-hot mux source produced new current-best candidates for ex282 and ex283; ex284 remained a near miss.
- No files were copied into `student/seeds`; this is still partial unknown-class exploration.
