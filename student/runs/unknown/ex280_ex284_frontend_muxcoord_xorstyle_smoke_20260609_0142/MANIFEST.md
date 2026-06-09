# ex280_ex284_frontend_muxcoord_xorstyle_smoke_20260609_0142

Run ID: `ex280_ex284_frontend_muxcoord_xorstyle_smoke_20260609_0142`

Purpose: Smoke-test lower-depth XOR emission for grouped full-clamp mux-coordinate formulas.

Inputs:
- Truth files: `benchmarks/ex280.truth`, `benchmarks/ex284.truth`
- Generator: `student/generators/unknown_muxcoord_anf_search.py`
- Variants: `grouped_direct`, `grouped_balanced`

Artifacts:
- Work directory: `student/work/ex280_ex284_frontend_muxcoord_xorstyle_smoke_20260609_0142/`
- Results: `student/runs/unknown/ex280_ex284_frontend_muxcoord_xorstyle_smoke_20260609_0142/results/`

Best result:
- See `results/best.csv`.

Notes:
- Official replay was `4/4` exact.
- Direct/balanced XOR styles lowered some raw delay but raised area enough to lose ADP.
