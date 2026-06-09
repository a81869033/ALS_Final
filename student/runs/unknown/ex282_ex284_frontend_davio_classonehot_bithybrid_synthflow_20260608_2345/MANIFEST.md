# ex282-ex284 Davio/Classonehot Bit Hybrid Synthflow

Created: 2026-06-08 23:45 +0800

## Hypothesis

Because `abc_g_aig` was effective on pure prefix-Davio sources, this run applies
the same narrow frontend synthflow to all Davio/classonehot bit hybrids.

## Scope

- Cases: `ex282`, `ex283`, `ex284`
- Input rows: `student/runs/unknown/ex282_ex284_frontend_davio_classonehot_bithybrid_20260608_2340/results/candidates.csv`
- Flow: `abc_g_aig`
- Wrapper: `student/work/ex280_ex284_frontend_prefix_davio_synthflow_20260608_2315/scripts/synthflow_from_best_csv.py`
- Work directory: `student/work/ex282_ex284_frontend_davio_classonehot_bithybrid_synthflow_20260608_2345/`

## Results

- Candidates: `results/candidates.csv`
- Best per case: `results/best.csv`
- Summary: `results/summary.csv`
- Generator evaluate check: `results/evaluate_check.csv`
- Official replay: `results/evaluate_replay.csv`
- Best AIG copies for this run only: `best_aigs/`

All 18 emitted AIGs were equivalent and officially replayed through
`evaluate.py` (`18/18 OK`).  No candidate beat current.

Best ADPs:

- `ex282`: `797/35/27895`
- `ex283`: `1005/33/33165`
- `ex284`: `1003/39/39117`

## Conclusion

`abc_g_aig` improves the hybrid area, but not enough.  The result excludes this
simple selected-bit classonehot replacement strategy.  A future hybrid would
need a much smaller replacement cone or a per-bit Davio rewrite rather than
duplicating classonehot/cofactor logic.
