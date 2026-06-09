# ex280_ex284_frontend_key_ac_decomp_20260608_1909

Run ID: `ex280_ex284_frontend_key_ac_decomp_20260608_1909`

Purpose: Prefix-key AC decomposition raw candidates.

Inputs:
- Truth files: `benchmarks/ex280.truth` through `benchmarks/ex284.truth`
- Generator: `student/generators/unknown_key_ac_decomp_search.py`

Artifacts:
- Work directory: `student/work/ex280_ex284_frontend_key_ac_decomp_20260608_1909/`
- Candidates CSV: `student/runs/unknown/ex280_ex284_frontend_key_ac_decomp_20260608_1909/results/candidates.csv`
- Best CSV: `student/runs/unknown/ex280_ex284_frontend_key_ac_decomp_20260608_1909/results/best.csv`
- Summary CSV: `student/runs/unknown/ex280_ex284_frontend_key_ac_decomp_20260608_1909/results/summary.csv`
- Evaluate check CSV: `student/runs/unknown/ex280_ex284_frontend_key_ac_decomp_20260608_1909/results/evaluate_check.csv`

Methods tried:
- Two-stage phi/h BDD over prefix_parity_reduce key; top4/top5/top6, phi_first/free_first.
- All generated AIGs in `candidates.csv` are exact-equivalence checked through the project ABC/evaluate path.

Best result:
- ex280: `ex280_unknown_key_ac_decomp_prefix_parity_reduce_top4_first_phi_first` 893/30/26790 via `prefix_parity_reduce_top4_first_phi_first` (unknown_prefix_key_ac_decomposition)
- ex281: `ex281_unknown_key_ac_decomp_prefix_parity_reduce_top4_first_phi_first` 1068/35/37380 via `prefix_parity_reduce_top4_first_phi_first` (unknown_prefix_key_ac_decomposition)
- ex282: `ex282_unknown_key_ac_decomp_prefix_parity_reduce_top4_first_phi_first` 1237/37/45769 via `prefix_parity_reduce_top4_first_phi_first` (unknown_prefix_key_ac_decomposition)
- ex283: `ex283_unknown_key_ac_decomp_prefix_parity_reduce_top4_first_phi_first` 1437/40/57480 via `prefix_parity_reduce_top4_first_phi_first` (unknown_prefix_key_ac_decomposition)
- ex284: `ex284_unknown_key_ac_decomp_prefix_parity_reduce_top4_first_phi_first` 1614/42/67788 via `prefix_parity_reduce_top4_first_phi_first` (unknown_prefix_key_ac_decomposition)

Notes:
- AC decomposition found strong class sharing but generic phi/h BDD mapping was delay dominated.
- No files were copied into `student/seeds`; this is still partial unknown-class exploration.
