# ex280_ex284_frontend_key_cofactor_onehot_top4_20260608_1947
## Hypothesis
- Top4 one-hot cofactor: Test smaller top4 class/onehot cofactor source. Exact, no new best.
- Scope: ex280-ex284 only unless the run name is a single-case smoke check. No `student/seeds` update and no `output/` writes.
## Artifacts
- `results/candidates.csv`
- `results/best.csv`
- `results/summary.csv`
- `results/evaluate_check.csv`
## Best Summary
| Case | Area | Delay | ADP | Delta vs current-at-run | Beats current-at-run | Candidate |
| --- | ---: | ---: | ---: | ---: | ---: | --- |
| ex280 | 730 | 29 | 21170 | 3950 | 0 | `ex280_unknown_key_canonical_cofactor_bdd_prefix_parity_reduce_top4_first_onehot` |
| ex281 | 901 | 31 | 27931 | 7339 | 0 | `ex281_unknown_key_canonical_cofactor_bdd_prefix_parity_reduce_top4_first_onehot` |
| ex282 | 1018 | 37 | 37666 | 7854 | 0 | `ex282_unknown_key_canonical_cofactor_bdd_prefix_parity_reduce_top4_first_onehot` |
| ex283 | 1213 | 38 | 46094 | 10424 | 0 | `ex283_unknown_key_canonical_cofactor_bdd_prefix_parity_reduce_top4_first_onehot` |
| ex284 | 1354 | 37 | 50098 | 3190 | 0 | `ex284_unknown_key_canonical_cofactor_bdd_prefix_parity_reduce_top4_first_onehot` |
## Conclusion
- Exact-equivalent evidence retained for traceability; not promoted unless referenced by a later synthflow best.
