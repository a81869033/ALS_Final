# ex280_ex284_frontend_quadratic_compressor_20260609_0216

Run ID: `ex280_ex284_frontend_quadratic_compressor_20260609_0216`

Purpose: Full `ex280-ex284` test of shared products of linear forms `(xor mc) & (xor mc)` over the exact mux-coordinate degree-2 model.

Inputs:
- Truth files: `benchmarks/ex280.truth` through `benchmarks/ex284.truth`
- Generator: `student/generators/unknown_quadratic_compressor_search.py`
- Transforms: `prefix_parity_reduce`, `prefix_parity`
- Coordinate modes: `full_clamp`, `full_clamp_simplified`
- Style: `basic`

Artifacts:
- Work directory: `student/work/ex280_ex284_frontend_quadratic_compressor_20260609_0216/`
- Candidates CSV: `student/runs/unknown/ex280_ex284_frontend_quadratic_compressor_20260609_0216/results/candidates.csv`
- Best CSV: `student/runs/unknown/ex280_ex284_frontend_quadratic_compressor_20260609_0216/results/best.csv`
- Summary CSV: `student/runs/unknown/ex280_ex284_frontend_quadratic_compressor_20260609_0216/results/summary.csv`
- Evaluate check CSV: `student/runs/unknown/ex280_ex284_frontend_quadratic_compressor_20260609_0216/results/evaluate_check.csv`

Best result:
- Raw bests: `ex280 162/31/5022`, `ex281 176/34/5984`, `ex282 191/36/6876`, `ex283 190/36/6840`, `ex284 215/39/8385`.

Notes:
- Official evaluate/equivalence replay was `20/20` exact.
- `ex282` raw did not beat the previous grouped full-clamp synthflow best, but the same source became better after `abc_g_aig`.
- This run intentionally did not update `student/seeds` and did not write `output/`.
