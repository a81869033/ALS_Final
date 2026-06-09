# ex286_ex287_frontend_paircount_mdd_20260609_0944

Run ID: `ex286_ex287_frontend_paircount_mdd_20260609_0944`

Purpose: Test pair-count multi-valued decision diagrams for symmetry-pair
unknown cases. This treats each exact input symmetry pair as a 0/1/2 variable
instead of encoding it as binary OR/AND key bits.

Inputs:
- Truth files: benchmarks/ex286.truth, benchmarks/ex287.truth
- Generator: `student/generators/unknown_paircount_mdd_search.py`
- Pairs: `4:5,6:7`

Artifacts:
- Work directory: `student/work/ex286_ex287_frontend_paircount_mdd_20260609_0944`
- Results directory: `student/runs/unknown/ex286_ex287_frontend_paircount_mdd_20260609_0944/results`

Methods tried:
- Orders: `pairs_first,interleave,singles_first,reverse`

Best result:
- See `results/best.csv`.

Notes:
- `student/seeds` and `output/` are intentionally untouched.
