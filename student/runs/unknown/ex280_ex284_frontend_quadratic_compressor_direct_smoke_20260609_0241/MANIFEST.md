# ex280_ex284_frontend_quadratic_compressor_direct_smoke_20260609_0241

Run ID: `ex280_ex284_frontend_quadratic_compressor_direct_smoke_20260609_0241`

Purpose: Smoke-test direct reduction-XOR emission for shared quadratic compressor linear forms, replacing serial prefix helper reuse inside range XOR forms.

Inputs:
- Truth files: `benchmarks/ex280.truth`, `benchmarks/ex284.truth`
- Generator: `student/generators/unknown_quadratic_compressor_search.py`
- Transforms: `prefix_parity_reduce`, `prefix_parity`
- Coordinate modes: `full_clamp`, `full_clamp_simplified`
- Style: `direct`

Artifacts:
- Work directory: `student/work/ex280_ex284_frontend_quadratic_compressor_direct_smoke_20260609_0241/`
- Candidates CSV: `student/runs/unknown/ex280_ex284_frontend_quadratic_compressor_direct_smoke_20260609_0241/results/candidates.csv`
- Best CSV: `student/runs/unknown/ex280_ex284_frontend_quadratic_compressor_direct_smoke_20260609_0241/results/best.csv`
- Summary CSV: `student/runs/unknown/ex280_ex284_frontend_quadratic_compressor_direct_smoke_20260609_0241/results/summary.csv`
- Evaluate check CSV: `student/runs/unknown/ex280_ex284_frontend_quadratic_compressor_direct_smoke_20260609_0241/results/evaluate_check.csv`

Best result:
- `ex280`: `212/30/6360`
- `ex284`: `267/40/10680`

Notes:
- Official evaluate/equivalence replay was `8/8` exact.
- Direct XOR emission reduced delay on one ex280 row but increased area enough to lose ADP versus the active basic shared quadratic compressor.
- This run intentionally did not update `student/seeds` and did not write `output/`.
