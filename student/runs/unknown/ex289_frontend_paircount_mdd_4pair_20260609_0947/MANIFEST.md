# ex289_frontend_paircount_mdd_4pair_20260609_0947

Run ID: `ex289_frontend_paircount_mdd_4pair_20260609_0947`

Purpose: Test pair-count multi-valued decision diagrams for symmetry-pair
unknown cases. This treats each exact input symmetry pair as a 0/1/2 variable
instead of encoding it as binary OR/AND key bits.

Inputs:
- Truth files: benchmarks/ex289.truth
- Generator: `student/generators/unknown_paircount_mdd_search.py`
- Pairs: `4:5,6:7,8:9,10:11`

Artifacts:
- Work directory: `student/work/ex289_frontend_paircount_mdd_4pair_20260609_0947`
- Results directory: `student/runs/unknown/ex289_frontend_paircount_mdd_4pair_20260609_0947/results`

Methods tried:
- Orders: `reverse`

Best result:
- See `results/best.csv`.

Notes:
- `student/seeds` and `output/` are intentionally untouched.
