# ex280_ex284_frontend_quadratic_compressor_rank_smoke2_20260609_0216

Run ID: `ex280_ex284_frontend_quadratic_compressor_rank_smoke2_20260609_0216`

Purpose: Smoke-test rank-decomposition quadratic-form emitter on `ex280` and `ex284` across the active transform/coordinate choices.

Inputs:
- Truth files: `benchmarks/ex280.truth`, `benchmarks/ex284.truth`
- Generator: `student/generators/unknown_quadratic_compressor_search.py`
- Transforms: `prefix_parity_reduce`, `prefix_parity`
- Coordinate modes: `full_clamp`, `full_clamp_simplified`
- Style: `rank`

Artifacts:
- Work directory: `student/work/ex280_ex284_frontend_quadratic_compressor_rank_smoke2_20260609_0216/`
- Candidates CSV: `student/runs/unknown/ex280_ex284_frontend_quadratic_compressor_rank_smoke2_20260609_0216/results/candidates.csv`
- Best CSV: `student/runs/unknown/ex280_ex284_frontend_quadratic_compressor_rank_smoke2_20260609_0216/results/best.csv`
- Summary CSV: `student/runs/unknown/ex280_ex284_frontend_quadratic_compressor_rank_smoke2_20260609_0216/results/summary.csv`
- Evaluate check CSV: `student/runs/unknown/ex280_ex284_frontend_quadratic_compressor_rank_smoke2_20260609_0216/results/evaluate_check.csv`

Best result:
- `ex280`: `222/30/6660`
- `ex284`: `308/36/11088`

Notes:
- Official evaluate/equivalence replay was `8/8` exact.
- Low-rank quadratic-form decomposition is exact, but the emitted linear forms are area-heavy and did not beat the basic compressor.
- This run intentionally did not update `student/seeds` and did not write `output/`.
