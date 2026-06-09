# ex280_ex284_frontend_key_cofactor_classsop_20260608_2032
## Hypothesis
- Class SOP cofactor: Exact SOP-minimized selectors per class. Exact but generally worse than classonehot.
- Scope: ex280-ex284 only unless the run name is a single-case smoke check. No `student/seeds` update and no `output/` writes.
## Artifacts
- `results/candidates.csv`
- `results/best.csv`
- `results/summary.csv`
- `results/evaluate_check.csv`
## Best Summary
| Case | Area | Delay | ADP | Delta vs current-at-run | Beats current-at-run | Candidate |
| --- | ---: | ---: | ---: | ---: | ---: | --- |
| ex280 | 769 | 25 | 19225 | 2005 | 0 | `ex280_unknown_key_canonical_cofactor_bdd_prefix_parity_reduce_top5_first_classsop_endpoint_rev` |
| ex281 | 919 | 25 | 22975 | 2383 | 0 | `ex281_unknown_key_canonical_cofactor_bdd_prefix_parity_reduce_top6_first_classsop_endpoint` |
| ex282 | 1021 | 30 | 30630 | 818 | 0 | `ex282_unknown_key_canonical_cofactor_bdd_prefix_parity_reduce_top6_first_classsop_endpoint_rev` |
| ex283 | 1142 | 34 | 38828 | 3158 | 0 | `ex283_unknown_key_canonical_cofactor_bdd_prefix_parity_reduce_top6_first_classsop_endpoint` |
| ex284 | 1289 | 35 | 45115 | 2170 | 0 | `ex284_unknown_key_canonical_cofactor_bdd_prefix_parity_reduce_top6_first_classsop_endpoint` |
## Conclusion
- Exact-equivalent evidence retained for traceability; not promoted unless referenced by a later synthflow best.
