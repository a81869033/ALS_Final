# ex288_ex289_ex292_ex294_frontend_bdd_synthflow_20260608_1235

Run ID: `ex288_ex289_ex292_ex294_frontend_bdd_synthflow_20260608_1235`

Purpose: Run limited Yosys synthflow variants on the improved shared-BDD
Verilog candidates from `ex285_ex294_frontend_bdd_diagnostic_20260608_1225`.

Inputs:
- Source CSV: `student/runs/unknown/ex285_ex294_frontend_bdd_diagnostic_20260608_1225/results/best.csv`
- Source Verilog: `student/work/ex285_ex294_frontend_bdd_diagnostic_20260608_1225/exNNN/verilog/`
- Script: `student/scripts/yosys_synthflow_from_best_csv.py`

Artifacts:
- Work directory: `student/work/ex288_ex289_ex292_ex294_frontend_bdd_synthflow_20260608_1235/`
- Candidates CSV: `student/runs/unknown/ex288_ex289_ex292_ex294_frontend_bdd_synthflow_20260608_1235/results/candidates.csv`
- Best CSV: `student/runs/unknown/ex288_ex289_ex292_ex294_frontend_bdd_synthflow_20260608_1235/results/best.csv`
- Summary CSV: `student/runs/unknown/ex288_ex289_ex292_ex294_frontend_bdd_synthflow_20260608_1235/results/summary.csv`
- Official evaluate.py recheck: `student/runs/unknown/ex288_ex289_ex292_ex294_frontend_bdd_synthflow_20260608_1235/results/evaluate_check.csv`

Best result:
- `ex288`: `1860/20/37200`, best variant `synth_preset`.
- `ex289`: `1737/23/39951`, best variant `abc_g_aig`.
- `ex292`: `6770/21/142170`, best variant `abc_g_aig`.
- `ex294`: `10726/23/246698`, best variant `synth_preset`.

Notes:
- Official `evaluate.py` replay passed for all 80 rows.
- This is a frontend synthesis-flow check from verified Verilog candidates, not
  a backend optimization portfolio. Final unknown seed curation is deferred
  until the full `ex280-ex299` class converges.
