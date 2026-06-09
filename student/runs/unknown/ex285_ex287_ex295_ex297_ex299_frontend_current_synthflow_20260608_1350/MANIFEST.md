# ex285_ex287_ex295_ex297_ex299_frontend_current_synthflow_20260608_1350

Run ID: `ex285_ex287_ex295_ex297_ex299_frontend_current_synthflow_20260608_1350`

Purpose: Run limited frontend Yosys synthflow variants on remaining high-gap
current structural Verilog seeds for `ex285`, `ex286`, `ex287`, `ex295`,
`ex297`, and `ex299`.

Inputs:
- Seed CSV: `student/results/current_best_by_case.csv`
- Source Verilog: existing structural unknown candidates under `student/work/reverse_unknown_20260603_1812/`
- Script: `student/scripts/yosys_synthflow_from_best_csv.py`

Artifacts:
- Work directory: `student/work/ex285_ex287_ex295_ex297_ex299_frontend_current_synthflow_20260608_1350/`
- Candidates CSV: `student/runs/unknown/ex285_ex287_ex295_ex297_ex299_frontend_current_synthflow_20260608_1350/results/candidates.csv`
- Best CSV: `student/runs/unknown/ex285_ex287_ex295_ex297_ex299_frontend_current_synthflow_20260608_1350/results/best.csv`
- Summary CSV: `student/runs/unknown/ex285_ex287_ex295_ex297_ex299_frontend_current_synthflow_20260608_1350/results/summary.csv`
- Official evaluate.py recheck: `student/runs/unknown/ex285_ex287_ex295_ex297_ex299_frontend_current_synthflow_20260608_1350/results/evaluate_check.csv`

Best result:
- `ex285`: `775/17/13175`, best variant `synth_preset`.
- `ex286`: `1860/13/24180`, best variant `abc_g_aig`.
- `ex287`: `1743/18/31374`, best variant `synth_preset`.
- `ex295`: `8653/16/138448`, best variant `abc_g_aig`.
- `ex297`: `32422/18/583596`, best variant `abc_g_aig`.
- `ex299`: `118397/22/2604734`, best variant `abc_g_aig`.

Notes:
- Official `evaluate.py` replay passed for all 120 rows.
- This is a frontend synthesis-flow check from verified Verilog seeds, not a
  backend optimization portfolio. Final unknown seed curation is deferred until
  the full `ex280-ex299` class converges.
