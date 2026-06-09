# ex280_ex284_frontend_bilinear_rank_20260609_0039

Run ID: `ex280_ex284_frontend_bilinear_rank_20260609_0039`

Purpose: Test whether the prefix-key degree-4 ANF has a low-rank bilinear split that maps to a much smaller AIG than Davio/cofactor sources.

Inputs:
- Truth files: `benchmarks/ex280.truth`, `benchmarks/ex284.truth`
- Generator: `student/generators/unknown_bilinear_rank_search.py`
- Splits: `mid3`, `mid4`, `inter4`, `inter6`

Artifacts:
- Work directory: `student/work/ex280_ex284_frontend_bilinear_rank_20260609_0039/`
- Candidates CSV: `student/runs/unknown/ex280_ex284_frontend_bilinear_rank_20260609_0039/results/candidates.csv`
- Best CSV: `student/runs/unknown/ex280_ex284_frontend_bilinear_rank_20260609_0039/results/best.csv`
- Summary CSV: `student/runs/unknown/ex280_ex284_frontend_bilinear_rank_20260609_0039/results/summary.csv`
- Evaluate check CSV: `student/runs/unknown/ex280_ex284_frontend_bilinear_rank_20260609_0039/results/evaluate_check.csv`

Best result:
- `ex280`: `1202/31/37262` (`mid4`), exact but worse than current.
- `ex284`: `2400/38/91200` (`inter6`), exact but worse than current.

Conclusion:
- The algebraic rank signal is real, but coefficient cones are too large. Do not expand this family without a new coefficient compression idea.
- This run did not update `student/seeds` and did not write `output/`.
