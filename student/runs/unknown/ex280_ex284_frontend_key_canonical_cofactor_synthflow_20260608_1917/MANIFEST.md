# ex280_ex284_frontend_key_canonical_cofactor_synthflow_20260608_1917

Run ID: `ex280_ex284_frontend_key_canonical_cofactor_synthflow_20260608_1917`

Purpose: Limited synthflow for canonical cofactor BDD.

Inputs:
- Truth files: `benchmarks/ex280.truth` through `benchmarks/ex284.truth`
- Seed Verilog: best or candidate rows from the paired raw frontend run
- Script: `student/scripts/yosys_synthflow_from_best_csv.py`

Artifacts:
- Work directory: `student/work/ex280_ex284_frontend_key_canonical_cofactor_synthflow_20260608_1917/`
- Candidates CSV: `student/runs/unknown/ex280_ex284_frontend_key_canonical_cofactor_synthflow_20260608_1917/results/candidates.csv`
- Best CSV: `student/runs/unknown/ex280_ex284_frontend_key_canonical_cofactor_synthflow_20260608_1917/results/best.csv`
- Summary CSV: `student/runs/unknown/ex280_ex284_frontend_key_canonical_cofactor_synthflow_20260608_1917/results/summary.csv`
- Evaluate check CSV: `student/runs/unknown/ex280_ex284_frontend_key_canonical_cofactor_synthflow_20260608_1917/results/evaluate_check.csv`

Methods tried:
- abc_g_aig and synth_preset on canonical cofactor best rows.
- All generated AIGs in `candidates.csv` are exact-equivalence checked through the project ABC/evaluate path.

Best result:
- ex280: `ex280_prefix_parity_reduce_top6_first_abc_g_aig` 731/25/18275 via `abc_g_aig` (unknown_key_canonical_cofactor_bdd)
- ex281: `ex281_prefix_parity_reduce_top6_first_abc_g_aig` 858/24/20592 via `abc_g_aig` (unknown_key_canonical_cofactor_bdd)
- ex282: `ex282_prefix_parity_reduce_top6_first_synth_preset` 1021/31/31651 via `synth_preset` (unknown_key_canonical_cofactor_bdd)
- ex283: `ex283_prefix_parity_reduce_top6_first_abc_g_aig` 1133/32/36256 via `abc_g_aig` (unknown_key_canonical_cofactor_bdd)
- ex284: `ex284_prefix_parity_reduce_top5_first_abc_g_aig` 1303/36/46908 via `abc_g_aig` (unknown_key_canonical_cofactor_bdd)

Notes:
- Canonical outer-state sharing reproduced the earlier top-k cofactor family; no new source advantage by itself.
- No files were copied into `student/seeds`; this is still partial unknown-class exploration.
