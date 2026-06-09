# ex287_frontend_paircount_mdd_synthflow_20260609_0949

Run ID: `ex287_frontend_paircount_mdd_synthflow_20260609_0949`

Purpose: Limited synthflow check on the best ex287 three-pair pair-count MDD source.

Inputs:
- Seed CSV: `student/runs/unknown/ex287_frontend_paircount_mdd_3pair_20260609_0947/results/best.csv`
- Script: `student/scripts/yosys_synthflow_from_best_csv.py`

Artifacts:
- Work directory: `student/work/ex287_frontend_paircount_mdd_synthflow_20260609_0949/`
- Results: `student/runs/unknown/ex287_frontend_paircount_mdd_synthflow_20260609_0949/results/`

Methods tried:
- `abc_g_aig`
- `synth_preset`

Best result:
- `synth_preset`: exact, `1723/19/32737`

Notes:
- Worse than current `27480`; pair-count MDD does not expose the missing structure.

