# ex280_ex284_frontend_key_cofactor_top7_top8_20260608_2006
## Hypothesis
- Top7/top8 canonical cofactor: Test wider outer selectors with endpoint/endpoint_rev and case/onehot. Exact but area/mux dominated; excluded.
- Scope: ex280-ex284 only unless the run name is a single-case smoke check. No `student/seeds` update and no `output/` writes.
## Artifacts
- `results/candidates.csv`
- `results/best.csv`
- `results/summary.csv`
- `results/evaluate_check.csv`
## Best Summary
| Case | Area | Delay | ADP | Delta vs current-at-run | Beats current-at-run | Candidate |
| --- | ---: | ---: | ---: | ---: | ---: | --- |
| ex280 | 1033 | 32 | 33056 | 15836 | 0 | `ex280_unknown_key_canonical_cofactor_bdd_prefix_parity_reduce_top7_first_case_endpoint_rev` |
| ex281 | 1167 | 28 | 32676 | 12084 | 0 | `ex281_unknown_key_canonical_cofactor_bdd_prefix_parity_reduce_top7_first_case_endpoint` |
| ex282 | 1249 | 30 | 37470 | 7658 | 0 | `ex282_unknown_key_canonical_cofactor_bdd_prefix_parity_reduce_top7_first_case_endpoint` |
| ex283 | 1358 | 32 | 43456 | 7786 | 0 | `ex283_unknown_key_canonical_cofactor_bdd_prefix_parity_reduce_top7_first_case_endpoint_rev` |
| ex284 | 1439 | 35 | 50365 | 3457 | 0 | `ex284_unknown_key_canonical_cofactor_bdd_prefix_parity_reduce_top7_first_case_endpoint_rev` |
## Conclusion
- Exact-equivalent evidence retained for traceability; not promoted unless referenced by a later synthflow best.
