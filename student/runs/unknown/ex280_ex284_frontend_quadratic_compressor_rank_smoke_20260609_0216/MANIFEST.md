# ex280_ex284_frontend_quadratic_compressor_rank_smoke_20260609_0216

Run ID: `ex280_ex284_frontend_quadratic_compressor_rank_smoke_20260609_0216`

Purpose: Single-row validation of rank-decomposition quadratic-form emitter on `ex280`.

Inputs:
- Truth file: `benchmarks/ex280.truth`
- Generator: `student/generators/unknown_quadratic_compressor_search.py`
- Transform: `prefix_parity_reduce`
- Coordinate mode: `full_clamp`
- Style: `rank`

Artifacts:
- Work directory: `student/work/ex280_ex284_frontend_quadratic_compressor_rank_smoke_20260609_0216/`
- Candidates CSV: `student/runs/unknown/ex280_ex284_frontend_quadratic_compressor_rank_smoke_20260609_0216/results/candidates.csv`
- Best CSV: `student/runs/unknown/ex280_ex284_frontend_quadratic_compressor_rank_smoke_20260609_0216/results/best.csv`
- Summary CSV: `student/runs/unknown/ex280_ex284_frontend_quadratic_compressor_rank_smoke_20260609_0216/results/summary.csv`
- Evaluate check CSV: `student/runs/unknown/ex280_ex284_frontend_quadratic_compressor_rank_smoke_20260609_0216/results/evaluate_check.csv`

Best result:
- `ex280`: `246/28/6888`

Notes:
- Official evaluate/equivalence replay was `1/1` exact.
- Rank decomposition lowered delay but increased area versus the basic shared quadratic compressor.
- This run intentionally did not update `student/seeds` and did not write `output/`.
