# ex280_ex284_frontend_key_perbit_endpoint_bdd_20260608_1928

Run ID: `ex280_ex284_frontend_key_perbit_endpoint_bdd_20260608_1928`

Purpose: Per-bit endpoint-order BDD raw candidates.

Inputs:
- Truth files: `benchmarks/ex280.truth` through `benchmarks/ex284.truth`
- Generator: `student/generators/unknown_key_perbit_endpoint_bdd_search.py`

Artifacts:
- Work directory: `student/work/ex280_ex284_frontend_key_perbit_endpoint_bdd_20260608_1928/`
- Candidates CSV: `student/runs/unknown/ex280_ex284_frontend_key_perbit_endpoint_bdd_20260608_1928/results/candidates.csv`
- Best CSV: `student/runs/unknown/ex280_ex284_frontend_key_perbit_endpoint_bdd_20260608_1928/results/best.csv`
- Summary CSV: `student/runs/unknown/ex280_ex284_frontend_key_perbit_endpoint_bdd_20260608_1928/results/summary.csv`
- Evaluate check CSV: `student/runs/unknown/ex280_ex284_frontend_key_perbit_endpoint_bdd_20260608_1928/results/evaluate_check.csv`

Methods tried:
- Independent per-output BDDs in prefix_parity_reduce key domain using endpoint/endpoint_rev orders.
- All generated AIGs in `candidates.csv` are exact-equivalence checked through the project ABC/evaluate path.

Best result:
- ex280: `ex280_unknown_key_perbit_endpoint_bdd_prefix_parity_reduce_endpoint_rev` 778/28/21784 via `prefix_parity_reduce_endpoint_rev` (unknown_key_perbit_endpoint_bdd)
- ex281: `ex281_unknown_key_perbit_endpoint_bdd_prefix_parity_reduce_endpoint_rev` 945/31/29295 via `prefix_parity_reduce_endpoint_rev` (unknown_key_perbit_endpoint_bdd)
- ex282: `ex282_unknown_key_perbit_endpoint_bdd_prefix_parity_reduce_endpoint` 1129/34/38386 via `prefix_parity_reduce_endpoint` (unknown_key_perbit_endpoint_bdd)
- ex283: `ex283_unknown_key_perbit_endpoint_bdd_prefix_parity_reduce_endpoint` 1312/38/49856 via `prefix_parity_reduce_endpoint` (unknown_key_perbit_endpoint_bdd)
- ex284: `ex284_unknown_key_perbit_endpoint_bdd_prefix_parity_reduce_endpoint_rev` 1374/43/59082 via `prefix_parity_reduce_endpoint_rev` (unknown_key_perbit_endpoint_bdd)

Notes:
- Per-bit endpoint BDD confirmed endpoint-cone structure but did not beat top-k cofactor after synthflow.
- No files were copied into `student/seeds`; this is still partial unknown-class exploration.
