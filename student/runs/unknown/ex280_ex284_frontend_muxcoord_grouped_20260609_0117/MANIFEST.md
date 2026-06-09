# ex280_ex284_frontend_muxcoord_grouped_20260609_0117

Run ID: `ex280_ex284_frontend_muxcoord_grouped_20260609_0117`

Purpose: Full ex280-ex284 replay of factorized full-width mux-coordinate degree-2 formulas.

Inputs:
- Truth files: `benchmarks/ex280.truth` through `benchmarks/ex284.truth`
- Generator: `student/generators/unknown_muxcoord_anf_search.py`
- Emit style: `grouped`
- Coordinate modes: `full_mod`, `full_clamp`, `full_wrap_low_zero_high`

Artifacts:
- Work directory: `student/work/ex280_ex284_frontend_muxcoord_grouped_20260609_0117/`
- Candidates CSV: `student/runs/unknown/ex280_ex284_frontend_muxcoord_grouped_20260609_0117/results/candidates.csv`
- Best CSV: `student/runs/unknown/ex280_ex284_frontend_muxcoord_grouped_20260609_0117/results/best.csv`
- Summary CSV: `student/runs/unknown/ex280_ex284_frontend_muxcoord_grouped_20260609_0117/results/summary.csv`
- Evaluate check CSV: `student/runs/unknown/ex280_ex284_frontend_muxcoord_grouped_20260609_0117/results/evaluate_check.csv`

Methods tried:
- Full-width mux-coordinate degree-2 formulas.
- Grouped pair factorization with shared prefix XOR helpers.

Best result:
- Raw bests: `ex280 221/28/6188`, `ex281 231/31/7161`, `ex282 257/31/7967`, `ex283 284/35/9940`, `ex284 289/37/10693`.

Notes:
- Official evaluate/equivalence replay was `15/15` exact.
- `full_clamp_grouped` was best for every case.
- This source is the active semantic/structural base for future ex280-ex284 work.
