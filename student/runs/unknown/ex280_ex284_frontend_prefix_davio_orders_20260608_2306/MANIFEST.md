# ex280-ex284 Prefix-Key Davio Endpoint Orders

Created: 2026-06-08 23:06 +0800

## Hypothesis

The prefix-key Davio form may be sensitive to endpoint-oriented input order.
This run reuses full prefix-key Davio (`threshold=0`) and tests endpoint and
endpoint-reversed schedules to see whether the low-area structure can be made
shallow enough to compete with classonehot/cofactor-BDD seeds.

## Scope

- Cases: `ex280`, `ex281`, `ex282`, `ex283`, `ex284`
- Transform: `prefix_parity_reduce`
- Threshold: `0`
- Orders: `endpoint`, `endpoint_rev`
- Generator: `student/generators/unknown_anf_layered_davio_search.py`
- Work directory: `student/work/ex280_ex284_frontend_prefix_davio_orders_20260608_2306/`

## Results

- Candidates: `results/candidates.csv`
- Best per case: `results/best.csv`
- Summary: `results/summary.csv`
- Generator evaluate check: `results/evaluate_check.csv`
- Official replay: `results/evaluate_replay.csv`
- Best AIG copies for this run only: `best_aigs/`

All 10 emitted candidates were truth-model exact, synthesized, equivalent, and
officially replayed through `evaluate.py` (`10/10 OK`).  No candidate beat the
current best for any case.

Best ADPs:

- `ex280`: `696/31/21576`
- `ex281`: `803/33/26499`
- `ex282`: `911/35/31885`
- `ex283`: `1034/35/36190`
- `ex284`: `1099/42/46158`

## Conclusion

Endpoint-reversed order materially reduced delay for `ex280`, `ex281`,
`ex282`, and `ex283`, and endpoint order was best for `ex284`, but all rows
remain worse than current best.  This is now an exclusion for full prefix
Davio as a standalone source, while preserving it as a possible selected-bit
or depth-rewrite input.
