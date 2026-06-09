# ex280_ex284_frontend_key_perbit_endpoint_bdd_synthflow_20260608_1929

Run ID: `ex280_ex284_frontend_key_perbit_endpoint_bdd_synthflow_20260608_1929`

Purpose: Limited synthflow for per-bit endpoint BDD.

Inputs:
- Truth files: `benchmarks/ex280.truth` through `benchmarks/ex284.truth`
- Seed Verilog: best or candidate rows from the paired raw frontend run
- Script: `student/scripts/yosys_synthflow_from_best_csv.py`

Artifacts:
- Work directory: `student/work/ex280_ex284_frontend_key_perbit_endpoint_bdd_synthflow_20260608_1929/`
- Candidates CSV: `student/runs/unknown/ex280_ex284_frontend_key_perbit_endpoint_bdd_synthflow_20260608_1929/results/candidates.csv`
- Best CSV: `student/runs/unknown/ex280_ex284_frontend_key_perbit_endpoint_bdd_synthflow_20260608_1929/results/best.csv`
- Summary CSV: `student/runs/unknown/ex280_ex284_frontend_key_perbit_endpoint_bdd_synthflow_20260608_1929/results/summary.csv`
- Evaluate check CSV: `student/runs/unknown/ex280_ex284_frontend_key_perbit_endpoint_bdd_synthflow_20260608_1929/results/evaluate_check.csv`

Methods tried:
- abc_g_aig and synth_preset on per-bit endpoint raw best rows.
- All generated AIGs in `candidates.csv` are exact-equivalence checked through the project ABC/evaluate path.

Best result:
- ex280: `ex280_prefix_parity_reduce_endpoint_rev_abc_g_aig` 753/28/21084 via `abc_g_aig` (unknown_key_perbit_endpoint_bdd)
- ex281: `ex281_prefix_parity_reduce_endpoint_rev_abc_g_aig` 902/31/27962 via `abc_g_aig` (unknown_key_perbit_endpoint_bdd)
- ex282: `ex282_prefix_parity_reduce_endpoint_abc_g_aig` 1089/34/37026 via `abc_g_aig` (unknown_key_perbit_endpoint_bdd)
- ex283: `ex283_prefix_parity_reduce_endpoint_synth_preset` 1207/36/43452 via `synth_preset` (unknown_key_perbit_endpoint_bdd)
- ex284: `ex284_prefix_parity_reduce_endpoint_rev_abc_g_aig` 1341/42/56322 via `abc_g_aig` (unknown_key_perbit_endpoint_bdd)

Notes:
- Per-bit endpoint BDD confirmed endpoint-cone structure but did not beat top-k cofactor after synthflow.
- No files were copied into `student/seeds`; this is still partial unknown-class exploration.
