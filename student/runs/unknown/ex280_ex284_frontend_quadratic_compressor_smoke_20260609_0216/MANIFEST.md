# ex280_ex284_frontend_quadratic_compressor_smoke_20260609_0216

Run ID: `ex280_ex284_frontend_quadratic_compressor_smoke_20260609_0216`

Purpose: Smoke-test a shared quadratic compressor emitter for the active mux-coordinate degree-2 model on `ex280` and `ex284`.

Inputs:
- Truth files: `benchmarks/ex280.truth`, `benchmarks/ex284.truth`
- Generator: `student/generators/unknown_quadratic_compressor_search.py`
- Transforms: `prefix_parity_reduce`, `prefix_parity`
- Coordinate modes: `full_clamp`, `full_clamp_simplified`
- Styles: `basic`, `boundary`

Artifacts:
- Work directory: `student/work/ex280_ex284_frontend_quadratic_compressor_smoke_20260609_0216/`
- Candidates CSV: `student/runs/unknown/ex280_ex284_frontend_quadratic_compressor_smoke_20260609_0216/results/candidates.csv`
- Best CSV: `student/runs/unknown/ex280_ex284_frontend_quadratic_compressor_smoke_20260609_0216/results/best.csv`
- Summary CSV: `student/runs/unknown/ex280_ex284_frontend_quadratic_compressor_smoke_20260609_0216/results/summary.csv`
- Evaluate check CSV: `student/runs/unknown/ex280_ex284_frontend_quadratic_compressor_smoke_20260609_0216/results/evaluate_check.csv`

Best result:
- `ex280`: `162/31/5022`
- `ex284`: `215/39/8385`

Notes:
- Official evaluate/equivalence replay was `16/16` exact.
- This run intentionally did not update `student/seeds` and did not write `output/`.
