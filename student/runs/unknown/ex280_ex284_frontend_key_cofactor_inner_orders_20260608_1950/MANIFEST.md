# ex280_ex284_frontend_key_cofactor_inner_orders_20260608_1950
## Hypothesis
- Inner BDD order matrix: Test endpoint_rev/natural/reverse internal group BDD orders for top5/top6 case/onehot cofactor. Found ex284 raw improvement; natural/reverse mostly area-dominated.
- Scope: ex280-ex284 only unless the run name is a single-case smoke check. No `student/seeds` update and no `output/` writes.
## Artifacts
- `results/candidates.csv`
- `results/best.csv`
- `results/summary.csv`
- `results/evaluate_check.csv`
## Best Summary
| Case | Area | Delay | ADP | Delta vs current-at-run | Beats current-at-run | Candidate |
| --- | ---: | ---: | ---: | ---: | ---: | --- |
| ex280 | 759 | 26 | 19734 | 2514 | 0 | `ex280_unknown_key_canonical_cofactor_bdd_prefix_parity_reduce_top6_first_case_endpoint_rev` |
| ex281 | 930 | 26 | 24180 | 3588 | 0 | `ex281_unknown_key_canonical_cofactor_bdd_prefix_parity_reduce_top6_first_onehot_endpoint_rev` |
| ex282 | 1013 | 33 | 33429 | 3617 | 0 | `ex282_unknown_key_canonical_cofactor_bdd_prefix_parity_reduce_top6_first_case_endpoint_rev` |
| ex283 | 1149 | 33 | 37917 | 2247 | 0 | `ex283_unknown_key_canonical_cofactor_bdd_prefix_parity_reduce_top6_first_onehot_endpoint_rev` |
| ex284 | 1276 | 36 | 45936 | -972 | 1 | `ex284_unknown_key_canonical_cofactor_bdd_prefix_parity_reduce_top6_first_onehot_endpoint_rev` |
## Conclusion
- Exact-equivalent evidence retained for traceability; not promoted unless referenced by a later synthflow best.
