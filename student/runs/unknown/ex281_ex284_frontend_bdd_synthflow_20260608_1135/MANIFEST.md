# ex281_ex284_frontend_bdd_synthflow_20260608_1135

Run ID: `ex281_ex284_frontend_bdd_synthflow_20260608_1135`

Purpose: Run limited Yosys synthflow variants on the verified shared-BDD
Verilog seeds for `ex281-ex284` to improve frontend seed ADP.

Inputs:
- Source CSV: `student/runs/unknown/ex280_ex284_frontend_bdd_interleave_20260608_1120/results/best.csv`
- Source Verilog: `student/work/ex280_ex284_frontend_bdd_interleave_20260608_1120/exNNN/verilog/`
- Script: `student/scripts/yosys_synthflow_from_best_csv.py`

Artifacts:
- Work directory: `student/work/ex281_ex284_frontend_bdd_synthflow_20260608_1135/`
- Candidates CSV: `student/runs/unknown/ex281_ex284_frontend_bdd_synthflow_20260608_1135/results/candidates.csv`
- Best CSV: `student/runs/unknown/ex281_ex284_frontend_bdd_synthflow_20260608_1135/results/best.csv`
- Summary CSV: `student/runs/unknown/ex281_ex284_frontend_bdd_synthflow_20260608_1135/results/summary.csv`
- Official evaluate.py recheck: `student/runs/unknown/ex281_ex284_frontend_bdd_synthflow_20260608_1135/results/evaluate_check.csv`

Methods tried:
- `no_internal_abc`
- `abc_g_aig`
- `abc_g_aig_d18`, `abc_g_aig_d19`, `abc_g_aig_d20`, `abc_g_aig_d21`
- `abc_g_and_mux`
- `extra_opt_share`
- `synth_preset`

Best result:
- `ex281`: `1158/22/25476`, best variant `synth_preset`.
- `ex282`: `1313/24/31512`, best variant `abc_g_aig`.
- `ex283`: `1494/26/38844`, best variant `abc_g_aig`.
- `ex284`: `1727/29/50083`, best variant `abc_g_aig`.

Notes:
- Official `evaluate.py` replay passed for all 36 rows.
- This is a frontend synthesis-flow check from verified Verilog seeds, not a backend optimization portfolio.
- `ex281-ex284` are run-level current best inputs; final unknown seed curation
  is deferred until the full `ex280-ex299` class converges.
