# ex280 Grouped Davio Refinement Synthflow

Created: 2026-06-08 23:52 +0800

## Hypothesis

The best ex280 grouped-Davio refinements may beat the archived current once the
area is recovered by `abc_g_aig`.

## Scope

- Case: `ex280`
- Input rows: `student/runs/unknown/ex280_frontend_grouped_davio_refine_20260608_2348/results/candidates.csv`
- Flow: `abc_g_aig`
- Wrapper: `student/work/ex280_ex284_frontend_prefix_davio_synthflow_20260608_2315/scripts/synthflow_from_best_csv.py`
- Work directory: `student/work/ex280_frontend_grouped_davio_refine_synthflow_20260608_2352/`

## Results

- Candidates: `results/candidates.csv`
- Best per case: `results/best.csv`
- Summary: `results/summary.csv`
- Generator evaluate check: `results/evaluate_check.csv`
- Official replay: `results/evaluate_replay.csv`
- Best AIG copies for this run only: `best_aigs/`

All 68 emitted AIGs were equivalent and officially replayed through
`evaluate.py` (`68/68 OK`).

Best ADP:

- `ex280`: `623/27/16821`, new current best

## Conclusion

This is the first frontend-only source to beat the archived ex280 backend
current.  The winning row is `threshold=1`, `group_mode=high4`,
`order_metric=node`, mapped with `abc_g_aig`.
