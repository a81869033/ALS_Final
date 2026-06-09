# ex280-ex284 Grouped Davio Order

Created: 2026-06-08 23:38 +0800

## Hypothesis

Full prefix-Davio uses one global variable order for every output bit.  That
keeps sharing high, but it may make some output bits deeper than necessary.
This run splits output bits into groups and chooses a depth-oriented Davio
order per group.

## Scope

- Cases: `ex280`, `ex281`, `ex282`, `ex283`, `ex284`
- Transform: `prefix_parity_reduce`
- Thresholds: `0`, `1`
- Group modes: `all`, `split4`, `high4`, `perbit`
- Order metric: `depth`
- Generator: `student/generators/unknown_anf_grouped_davio_search.py`
- Work directory: `student/work/ex280_ex284_frontend_grouped_davio_order_20260608_2338/`

## Results

- Candidates: `results/candidates.csv`
- Best per case: `results/best.csv`
- Summary: `results/summary.csv`
- Generator evaluate check: `results/evaluate_check.csv`
- Official replay: `results/evaluate_replay.csv`
- Best AIG copies for this run only: `best_aigs/`

All 40 emitted candidates were equivalent and officially replayed through
`evaluate.py` (`40/40 OK`).  No raw candidate beat current, but grouped orders
confirmed that output-group order selection can reduce delay substantially.

Best raw ADPs:

- `ex280`: `751/27/20277`
- `ex281`: `932/30/27960`
- `ex282`: `920/33/30360`
- `ex283`: `1101/37/40737`
- `ex284`: `1099/42/46158`

## Conclusion

Grouped ordering is a real delay signal, especially for `ex280-ex282`, but the
raw source is still area-heavy.  It must be paired with `abc_g_aig` mapping.
