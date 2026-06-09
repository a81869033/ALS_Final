# ex280_ex284_frontend_key_canonical_cofactor_20260608_1916

Run ID: `ex280_ex284_frontend_key_canonical_cofactor_20260608_1916`

Purpose: Canonical outer-state cofactor BDD raw candidates.

Inputs:
- Truth files: `benchmarks/ex280.truth` through `benchmarks/ex284.truth`
- Generator: `student/generators/unknown_key_canonical_cofactor_search.py`

Artifacts:
- Work directory: `student/work/ex280_ex284_frontend_key_canonical_cofactor_20260608_1916/`
- Candidates CSV: `student/runs/unknown/ex280_ex284_frontend_key_canonical_cofactor_20260608_1916/results/candidates.csv`
- Best CSV: `student/runs/unknown/ex280_ex284_frontend_key_canonical_cofactor_20260608_1916/results/best.csv`
- Summary CSV: `student/runs/unknown/ex280_ex284_frontend_key_canonical_cofactor_20260608_1916/results/summary.csv`
- Evaluate check CSV: `student/runs/unknown/ex280_ex284_frontend_key_canonical_cofactor_20260608_1916/results/evaluate_check.csv`

Methods tried:
- Cofactor BDD groups with equivalent outer states shared; top4/top5/top6.
- All generated AIGs in `candidates.csv` are exact-equivalence checked through the project ABC/evaluate path.

Best result:
- ex280: `ex280_unknown_key_canonical_cofactor_bdd_prefix_parity_reduce_top6_first` 752/26/19552 via `prefix_parity_reduce_top6_first` (unknown_key_canonical_cofactor_bdd)
- ex281: `ex281_unknown_key_canonical_cofactor_bdd_prefix_parity_reduce_top6_first` 901/26/23426 via `prefix_parity_reduce_top6_first` (unknown_key_canonical_cofactor_bdd)
- ex282: `ex282_unknown_key_canonical_cofactor_bdd_prefix_parity_reduce_top6_first` 1020/32/32640 via `prefix_parity_reduce_top6_first` (unknown_key_canonical_cofactor_bdd)
- ex283: `ex283_unknown_key_canonical_cofactor_bdd_prefix_parity_reduce_top6_first` 1173/32/37536 via `prefix_parity_reduce_top6_first` (unknown_key_canonical_cofactor_bdd)
- ex284: `ex284_unknown_key_canonical_cofactor_bdd_prefix_parity_reduce_top5_first` 1342/37/49654 via `prefix_parity_reduce_top5_first` (unknown_key_canonical_cofactor_bdd)

Notes:
- Canonical outer-state sharing reproduced the earlier top-k cofactor family; no new source advantage by itself.
- No files were copied into `student/seeds`; this is still partial unknown-class exploration.
