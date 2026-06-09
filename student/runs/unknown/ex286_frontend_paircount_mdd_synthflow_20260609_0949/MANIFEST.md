# ex286_frontend_paircount_mdd_synthflow_20260609_0949

Run ID: `ex286_frontend_paircount_mdd_synthflow_20260609_0949`

Purpose: Limited synthflow check on the best ex286 pair-count MDD source.

Inputs:
- Seed CSV: `student/runs/unknown/ex286_ex287_frontend_paircount_mdd_20260609_0944/results/best.csv`
- Script: `student/scripts/yosys_synthflow_from_best_csv.py`

Artifacts:
- Work directory: `student/work/ex286_frontend_paircount_mdd_synthflow_20260609_0949/`
- Results: `student/runs/unknown/ex286_frontend_paircount_mdd_synthflow_20260609_0949/results/`

Methods tried:
- `abc_g_aig`
- `synth_preset`

Best result:
- `synth_preset`: exact, `1651/20/33020`

Notes:
- Worse than current `21705`; pair-count MDD does not expose the missing structure.

