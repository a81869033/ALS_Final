# ex280_ex284_frontend_key_ac_decomp_synthflow_20260608_1913

Run ID: `ex280_ex284_frontend_key_ac_decomp_synthflow_20260608_1913`

Purpose: Limited synthflow for prefix-key AC decomposition.

Inputs:
- Truth files: `benchmarks/ex280.truth` through `benchmarks/ex284.truth`
- Seed Verilog: best or candidate rows from the paired raw frontend run
- Script: `student/scripts/yosys_synthflow_from_best_csv.py`

Artifacts:
- Work directory: `student/work/ex280_ex284_frontend_key_ac_decomp_synthflow_20260608_1913/`
- Candidates CSV: `student/runs/unknown/ex280_ex284_frontend_key_ac_decomp_synthflow_20260608_1913/results/candidates.csv`
- Best CSV: `student/runs/unknown/ex280_ex284_frontend_key_ac_decomp_synthflow_20260608_1913/results/best.csv`
- Summary CSV: `student/runs/unknown/ex280_ex284_frontend_key_ac_decomp_synthflow_20260608_1913/results/summary.csv`
- Evaluate check CSV: `student/runs/unknown/ex280_ex284_frontend_key_ac_decomp_synthflow_20260608_1913/results/evaluate_check.csv`

Methods tried:
- abc_g_aig and synth_preset on raw AC best rows.
- All generated AIGs in `candidates.csv` are exact-equivalence checked through the project ABC/evaluate path.

Best result:
- ex280: `ex280_prefix_parity_reduce_top4_first_phi_first_synth_preset` 865/29/25085 via `synth_preset` (unknown_prefix_key_ac_decomposition)
- ex281: `ex281_prefix_parity_reduce_top4_first_phi_first_abc_g_aig` 1025/34/34850 via `abc_g_aig` (unknown_prefix_key_ac_decomposition)
- ex282: `ex282_prefix_parity_reduce_top4_first_phi_first_abc_g_aig` 1206/36/43416 via `abc_g_aig` (unknown_prefix_key_ac_decomposition)
- ex283: `ex283_prefix_parity_reduce_top4_first_phi_first_synth_preset` 1363/39/53157 via `synth_preset` (unknown_prefix_key_ac_decomposition)
- ex284: `ex284_prefix_parity_reduce_top4_first_phi_first_synth_preset` 1620/40/64800 via `synth_preset` (unknown_prefix_key_ac_decomposition)

Notes:
- AC decomposition found strong class sharing but generic phi/h BDD mapping was delay dominated.
- No files were copied into `student/seeds`; this is still partial unknown-class exploration.
