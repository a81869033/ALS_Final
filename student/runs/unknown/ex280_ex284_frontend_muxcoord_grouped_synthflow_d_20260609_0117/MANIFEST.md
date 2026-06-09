# ex280_ex284_frontend_muxcoord_grouped_synthflow_d_20260609_0117

Run ID: `ex280_ex284_frontend_muxcoord_grouped_synthflow_d_20260609_0117`

Purpose: Delay-target follow-up for grouped full-width mux-coordinate sources.

Inputs:
- Seed CSV: `student/runs/unknown/ex280_ex284_frontend_muxcoord_grouped_20260609_0117/results/candidates.csv`
- Script: `student/scripts/yosys_synthflow_from_best_csv.py`
- Flows: `abc_g_aig_d18`, `abc_g_aig_d19`, `abc_g_aig_d20`, `abc_g_aig_d21`

Artifacts:
- Work directory: `student/work/ex280_ex284_frontend_muxcoord_grouped_synthflow_d_20260609_0117/`
- Candidates CSV: `student/runs/unknown/ex280_ex284_frontend_muxcoord_grouped_synthflow_d_20260609_0117/results/candidates.csv`
- Best CSV: `student/runs/unknown/ex280_ex284_frontend_muxcoord_grouped_synthflow_d_20260609_0117/results/best.csv`
- Summary CSV: `student/runs/unknown/ex280_ex284_frontend_muxcoord_grouped_synthflow_d_20260609_0117/results/summary.csv`
- Evaluate check CSV: `student/runs/unknown/ex280_ex284_frontend_muxcoord_grouped_synthflow_d_20260609_0117/results/evaluate_check.csv`

Methods tried:
- Replayed all 15 grouped raw rows with four Yosys `abc -g aig -D` targets.

Best result:
- Best rows tied the plain grouped `abc_g_aig` run: `5460`, `6231`, `6665`, `8260`, and `9139` ADP.

Notes:
- Official evaluate/equivalence replay was `60/60` exact.
- Delay targets did not improve QoR beyond plain `abc_g_aig`.
