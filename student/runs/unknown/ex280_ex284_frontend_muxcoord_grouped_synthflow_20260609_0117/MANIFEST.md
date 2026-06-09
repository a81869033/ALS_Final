# ex280_ex284_frontend_muxcoord_grouped_synthflow_20260609_0117

Run ID: `ex280_ex284_frontend_muxcoord_grouped_synthflow_20260609_0117`

Purpose: Limited `abc_g_aig` synthflow replay for grouped full-width mux-coordinate sources.

Inputs:
- Seed CSV: `student/runs/unknown/ex280_ex284_frontend_muxcoord_grouped_20260609_0117/results/candidates.csv`
- Script: `student/scripts/yosys_synthflow_from_best_csv.py`
- Flow: `abc_g_aig`

Artifacts:
- Work directory: `student/work/ex280_ex284_frontend_muxcoord_grouped_synthflow_20260609_0117/`
- Candidates CSV: `student/runs/unknown/ex280_ex284_frontend_muxcoord_grouped_synthflow_20260609_0117/results/candidates.csv`
- Best CSV: `student/runs/unknown/ex280_ex284_frontend_muxcoord_grouped_synthflow_20260609_0117/results/best.csv`
- Summary CSV: `student/runs/unknown/ex280_ex284_frontend_muxcoord_grouped_synthflow_20260609_0117/results/summary.csv`
- Evaluate check CSV: `student/runs/unknown/ex280_ex284_frontend_muxcoord_grouped_synthflow_20260609_0117/results/evaluate_check.csv`

Methods tried:
- Re-synthesized all 15 grouped Verilog rows with Yosys `abc -g aig`.

Best result:
- `ex280 195/28/5460`
- `ex281 201/31/6231`
- `ex282 215/31/6665`
- `ex283 236/35/8260`
- `ex284 247/37/9139`

Notes:
- Official evaluate/equivalence replay was `15/15` exact.
- `student/results/current_best_by_case.csv` now points ex280-ex284 to this run.
- No files under `student/seeds` were updated.
