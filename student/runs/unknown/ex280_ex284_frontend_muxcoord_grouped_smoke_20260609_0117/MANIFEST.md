# ex280_ex284_frontend_muxcoord_grouped_smoke_20260609_0117

Run ID: `ex280_ex284_frontend_muxcoord_grouped_smoke_20260609_0117`

Purpose: Smoke-test factorized pair emission for full-width mux-coordinate degree-2 formulas.

Inputs:
- Truth files: `benchmarks/ex280.truth`, `benchmarks/ex284.truth`
- Generator: `student/generators/unknown_muxcoord_anf_search.py`
- Emit style: `grouped`

Artifacts:
- Work directory: `student/work/ex280_ex284_frontend_muxcoord_grouped_smoke_20260609_0117/`
- Candidates CSV: `student/runs/unknown/ex280_ex284_frontend_muxcoord_grouped_smoke_20260609_0117/results/candidates.csv`
- Best CSV: `student/runs/unknown/ex280_ex284_frontend_muxcoord_grouped_smoke_20260609_0117/results/best.csv`
- Summary CSV: `student/runs/unknown/ex280_ex284_frontend_muxcoord_grouped_smoke_20260609_0117/results/summary.csv`
- Evaluate check CSV: `student/runs/unknown/ex280_ex284_frontend_muxcoord_grouped_smoke_20260609_0117/results/evaluate_check.csv`

Methods tried:
- Replaced flat pair features with grouped terms of the form `mc[b] & xor(mc[a] for a in group)`, using shared prefix XORs where possible.

Best result:
- `ex280`: `221/28/6188` with `full_clamp_grouped`.
- `ex284`: `289/37/10693` with `full_clamp_grouped`.

Notes:
- Smoke confirmed the grouped pair factorization is a second large-drop structure.
- Formal full replay is in `ex280_ex284_frontend_muxcoord_grouped_20260609_0117`.
