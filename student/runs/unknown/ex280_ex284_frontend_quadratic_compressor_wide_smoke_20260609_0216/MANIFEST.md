# ex280_ex284_frontend_quadratic_compressor_wide_smoke_20260609_0216

Run ID: `ex280_ex284_frontend_quadratic_compressor_wide_smoke_20260609_0216`

Purpose: Smoke-test a wider shared quadratic compressor basis with additional neighbor-XOR merged linear forms.

Inputs:
- Truth files: `benchmarks/ex280.truth`, `benchmarks/ex284.truth`
- Generator: `student/generators/unknown_quadratic_compressor_search.py`
- Transforms: `prefix_parity_reduce`, `prefix_parity`
- Coordinate modes: `full_clamp`, `full_clamp_simplified`
- Style: `wide`

Artifacts:
- Work directory: `student/work/ex280_ex284_frontend_quadratic_compressor_wide_smoke_20260609_0216/`
- Candidates CSV: `student/runs/unknown/ex280_ex284_frontend_quadratic_compressor_wide_smoke_20260609_0216/results/candidates.csv`
- Best CSV: `student/runs/unknown/ex280_ex284_frontend_quadratic_compressor_wide_smoke_20260609_0216/results/best.csv`
- Summary CSV: `student/runs/unknown/ex280_ex284_frontend_quadratic_compressor_wide_smoke_20260609_0216/results/summary.csv`
- Evaluate check CSV: `student/runs/unknown/ex280_ex284_frontend_quadratic_compressor_wide_smoke_20260609_0216/results/evaluate_check.csv`

Best result:
- `ex280`: `162/31/5022`
- `ex284`: `215/39/8385`

Notes:
- Official evaluate/equivalence replay was `8/8` exact.
- The wider basis did not improve over the basic shared quadratic compressor source, so it was not expanded to all cases.
- This run intentionally did not update `student/seeds` and did not write `output/`.
