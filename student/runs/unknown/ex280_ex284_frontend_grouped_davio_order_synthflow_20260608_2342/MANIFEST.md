# ex280-ex284 Grouped Davio Order Synthflow

Created: 2026-06-08 23:42 +0800

## Hypothesis

The grouped-Davio source trades area for lower delay.  Since `abc_g_aig` was
effective on full Davio, this run applies the same narrow frontend mapping to
all grouped-order rows.

## Scope

- Cases: `ex280`, `ex281`, `ex282`, `ex283`, `ex284`
- Input rows: `student/runs/unknown/ex280_ex284_frontend_grouped_davio_order_20260608_2338/results/candidates.csv`
- Flow: `abc_g_aig`
- Wrapper: `student/work/ex280_ex284_frontend_prefix_davio_synthflow_20260608_2315/scripts/synthflow_from_best_csv.py`
- Work directory: `student/work/ex280_ex284_frontend_grouped_davio_order_synthflow_20260608_2342/`

## Results

- Candidates: `results/candidates.csv`
- Best per case: `results/best.csv`
- Summary: `results/summary.csv`
- Generator evaluate check: `results/evaluate_check.csv`
- Official replay: `results/evaluate_replay.csv`
- Best AIG copies for this run only: `best_aigs/`

All 40 emitted AIGs were equivalent and officially replayed through
`evaluate.py` (`40/40 OK`).

Best ADPs:

- `ex280`: `643/27/17361`, near miss versus then-current `17220`
- `ex281`: `780/30/23400`, worse than current
- `ex282`: `765/33/25245`, new current best
- `ex283`: `929/36/33444`, worse than current
- `ex284`: `921/42/38682`, worse than current

## Conclusion

Grouped ordering plus `abc_g_aig` is useful.  It produced a new `ex282` best
and exposed a very close `ex280` near miss, which motivated the focused ex280
group-size refinement.
