# ex280_ex284_frontend_key_cofactor_onehot_20260608_1931

Run ID: `ex280_ex284_frontend_key_cofactor_onehot_20260608_1931`

Purpose: One-hot mux prefix-key cofactor BDD raw candidates.

Inputs:
- Truth files: `benchmarks/ex280.truth` through `benchmarks/ex284.truth`
- Generator: `student/generators/unknown_key_canonical_cofactor_search.py`

Artifacts:
- Work directory: `student/work/ex280_ex284_frontend_key_cofactor_onehot_20260608_1931/`
- Candidates CSV: `student/runs/unknown/ex280_ex284_frontend_key_cofactor_onehot_20260608_1931/results/candidates.csv`
- Best CSV: `student/runs/unknown/ex280_ex284_frontend_key_cofactor_onehot_20260608_1931/results/best.csv`
- Summary CSV: `student/runs/unknown/ex280_ex284_frontend_key_cofactor_onehot_20260608_1931/results/summary.csv`
- Evaluate check CSV: `student/runs/unknown/ex280_ex284_frontend_key_cofactor_onehot_20260608_1931/results/evaluate_check.csv`

Methods tried:
- Top5/top6 canonical cofactor source using explicit one-hot decode plus OR mux.
- All generated AIGs in `candidates.csv` are exact-equivalence checked through the project ABC/evaluate path.

Best result:
- ex280: `ex280_unknown_key_canonical_cofactor_bdd_prefix_parity_reduce_top6_first_onehot` 796/25/19900 via `prefix_parity_reduce_top6_first_onehot` (unknown_key_canonical_cofactor_bdd)
- ex281: `ex281_unknown_key_canonical_cofactor_bdd_prefix_parity_reduce_top6_first_onehot` 937/28/26236 via `prefix_parity_reduce_top6_first_onehot` (unknown_key_canonical_cofactor_bdd)
- ex282: `ex282_unknown_key_canonical_cofactor_bdd_prefix_parity_reduce_top6_first_onehot` 1064/32/34048 via `prefix_parity_reduce_top6_first_onehot` (unknown_key_canonical_cofactor_bdd)
- ex283: `ex283_unknown_key_canonical_cofactor_bdd_prefix_parity_reduce_top6_first_onehot` 1246/30/37380 via `prefix_parity_reduce_top6_first_onehot` (unknown_key_canonical_cofactor_bdd)
- ex284: `ex284_unknown_key_canonical_cofactor_bdd_prefix_parity_reduce_top5_first_onehot` 1347/37/49839 via `prefix_parity_reduce_top5_first_onehot` (unknown_key_canonical_cofactor_bdd)

Notes:
- Raw one-hot mux lowered ex283 delay but increased area; limited synthflow was required for useful ADP.
- No files were copied into `student/seeds`; this is still partial unknown-class exploration.
