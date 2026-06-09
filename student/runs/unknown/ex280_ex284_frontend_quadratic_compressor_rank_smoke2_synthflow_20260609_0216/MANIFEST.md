# ex280_ex284_frontend_quadratic_compressor_rank_smoke2_synthflow_20260609_0216

Run ID: `ex280_ex284_frontend_quadratic_compressor_rank_smoke2_synthflow_20260609_0216`

Purpose: Tiny `abc_g_aig` check on the best rank-decomposition rows for `ex280` and `ex284`.

Inputs:
- Seed CSV: `student/runs/unknown/ex280_ex284_frontend_quadratic_compressor_rank_smoke2_20260609_0216/results/best.csv`
- Script: `student/scripts/yosys_synthflow_from_best_csv.py`
- Variant: `abc_g_aig`

Artifacts:
- Work directory: `student/work/ex280_ex284_frontend_quadratic_compressor_rank_smoke2_synthflow_20260609_0216/`
- Candidates CSV: `student/runs/unknown/ex280_ex284_frontend_quadratic_compressor_rank_smoke2_synthflow_20260609_0216/results/candidates.csv`
- Best CSV: `student/runs/unknown/ex280_ex284_frontend_quadratic_compressor_rank_smoke2_synthflow_20260609_0216/results/best.csv`
- Summary CSV: `student/runs/unknown/ex280_ex284_frontend_quadratic_compressor_rank_smoke2_synthflow_20260609_0216/results/summary.csv`
- Evaluate check CSV: `student/runs/unknown/ex280_ex284_frontend_quadratic_compressor_rank_smoke2_synthflow_20260609_0216/results/evaluate_check.csv`

Best result:
- `ex280`: `196/30/5880`
- `ex284`: `257/36/9252`

Notes:
- Official evaluate/equivalence replay was `2/2` exact.
- `abc_g_aig` recovered some area, but both rows remained worse than the basic shared quadratic compressor bests.
- This run intentionally did not update `student/seeds` and did not write `output/`.
