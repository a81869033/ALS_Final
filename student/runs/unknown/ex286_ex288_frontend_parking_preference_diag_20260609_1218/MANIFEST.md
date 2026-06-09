# ex286_ex288_frontend_parking_preference_diag_20260609_1218

Run ID: `ex286_ex288_frontend_parking_preference_diag_20260609_1218`

Purpose: Test whether `ex286-ex288` are static greedy parking/open-addressing functions, using one-hot rows as token home slots and two-hot rows as token preference evidence.

Inputs:
- Truth files: `benchmarks/ex286.truth`, `benchmarks/ex287.truth`, `benchmarks/ex288.truth`
- Script: `student/scripts/unknown_parking_preference_diag.py`

Artifacts:
- Work directory: `student/work/ex286_ex288_frontend_parking_preference_diag_20260609_1218/`
- Diagnostics CSV: `student/runs/unknown/ex286_ex288_frontend_parking_preference_diag_20260609_1218/results/parking_preference_diagnostics.csv`
- Summary CSV: `student/runs/unknown/ex286_ex288_frontend_parking_preference_diag_20260609_1218/results/summary.csv`
- Candidates CSV: `student/runs/unknown/ex286_ex288_frontend_parking_preference_diag_20260609_1218/results/candidates.csv`
- Best CSV: `student/runs/unknown/ex286_ex288_frontend_parking_preference_diag_20260609_1218/results/best.csv`
- Evaluate check CSV: `student/runs/unknown/ex286_ex288_frontend_parking_preference_diag_20260609_1218/results/evaluate_check.csv`

Methods Tried:
- Token orders: natural, reverse, one-hot home order, reverse home order, center-out, outside-in, known symmetry-pair order.
- Preference styles: circular home probing, bidirectional home probing, two-hot frequency order, two-hot first-seen slot order, and circular fallbacks.
- Output transforms: identity, reverse, rotate-left-1, rotate-right-1.
- Full truth-table scoring used `TruthTable(..., input_order="abc_xf")`.

Best Result:
- `ex286`: best full-row match `145/8192`, bit match ratio `0.557223`.
- `ex287`: best full-row match `117/16384`, bit match ratio `0.539873`.
- `ex288`: best full-row match `217/32768`, bit match ratio `0.540210`.
- No Verilog/AIG seed emitted; no candidate was close to exact.

Notes:
- This rejects static greedy parking/open-addressing as the missing large-drop structure for `ex286-ex288`.
- It does not reject richer conservative controlled-routing models with hidden state or data-dependent token order.
