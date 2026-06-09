# ex280_frontend_key_endpoint_fsm_smoke_20260608_1947
## Hypothesis
- Endpoint-pair FSM smoke: Test deterministic endpoint-pair state transition over prefix_parity_reduce key. Exact but area/delay dominated; excluded from active candidates.
- Scope: ex280-ex284 only unless the run name is a single-case smoke check. No `student/seeds` update and no `output/` writes.
## Artifacts
- `results/candidates.csv`
- `results/best.csv`
- `results/summary.csv`
- `results/evaluate_check.csv`
## Best Summary
| Case | Area | Delay | ADP | Delta vs current-at-run | Beats current-at-run | Candidate |
| --- | ---: | ---: | ---: | ---: | ---: | --- |
| ex280 | 8749 | 85 | 743665 | 726445 | 0 | `ex280_unknown_key_endpoint_fsm_prefix_parity_reduce` |
## Conclusion
- Exact-equivalent evidence retained for traceability; not promoted unless referenced by a later synthflow best.
