# ex280_ex284_frontend_muxcoord_full_synthflow_20260609_0117

Run ID: `ex280_ex284_frontend_muxcoord_full_synthflow_20260609_0117`

Purpose: Limited `abc_g_aig` synthflow replay for all full-width mux-coordinate degree-2 rows.

Inputs:
- Seed CSV: `student/runs/unknown/ex280_ex284_frontend_muxcoord_full_20260609_0117/results/candidates.csv`
- Script: `student/scripts/yosys_synthflow_from_best_csv.py`
- Flow: `abc_g_aig`

Artifacts:
- Work directory: `student/work/ex280_ex284_frontend_muxcoord_full_synthflow_20260609_0117/`
- Candidates CSV: `student/runs/unknown/ex280_ex284_frontend_muxcoord_full_synthflow_20260609_0117/results/candidates.csv`
- Best CSV: `student/runs/unknown/ex280_ex284_frontend_muxcoord_full_synthflow_20260609_0117/results/best.csv`
- Summary CSV: `student/runs/unknown/ex280_ex284_frontend_muxcoord_full_synthflow_20260609_0117/results/summary.csv`
- Evaluate check CSV: `student/runs/unknown/ex280_ex284_frontend_muxcoord_full_synthflow_20260609_0117/results/evaluate_check.csv`

Methods tried:
- Re-synthesized all 15 full-coordinate raw Verilog rows with Yosys `abc -g aig`.

Best result:
- `ex280 301/25/7525`
- `ex281 362/29/10498`
- `ex282 318/31/9858`
- `ex283 378/37/13986`
- `ex284 429/35/15015`

Notes:
- Official evaluate/equivalence replay was `15/15` exact.
- This produced new current bests before the grouped factorized source superseded it.
