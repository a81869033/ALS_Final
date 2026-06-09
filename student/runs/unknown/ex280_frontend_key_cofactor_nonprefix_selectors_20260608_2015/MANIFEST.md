# ex280_frontend_key_cofactor_nonprefix_selectors_20260608_2015
## Hypothesis
- ex280 non-prefix selectors: Test non-prefix five-bit selector candidates selected by BDD-node diagnostics. Exact but synthesized much worse; selector metric rejected.
- Scope: ex280-ex284 only unless the run name is a single-case smoke check. No `student/seeds` update and no `output/` writes.
## Artifacts
- `results/candidates.csv`
- `results/best.csv`
- `results/summary.csv`
- `results/evaluate_check.csv`
## Best Summary
| Case | Area | Delay | ADP | Delta vs current-at-run | Beats current-at-run | Candidate |
| --- | ---: | ---: | ---: | ---: | ---: | --- |
| ex280 | 1578 | 24 | 37872 | 20652 | 0 | `ex280_unknown_key_canonical_cofactor_bdd_prefix_parity_reduce_bits_0_1_3_8_9_first_case_endpoint` |
## Conclusion
- Exact-equivalent evidence retained for traceability; not promoted unless referenced by a later synthflow best.
