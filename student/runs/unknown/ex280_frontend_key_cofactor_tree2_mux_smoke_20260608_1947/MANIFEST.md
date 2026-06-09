# ex280_frontend_key_cofactor_tree2_mux_smoke_20260608_1947
## Hypothesis
- Tree2 mux smoke: Test alternate two-level tree mux source for top6 canonical cofactor. Exact but worse; excluded.
- Scope: ex280-ex284 only unless the run name is a single-case smoke check. No `student/seeds` update and no `output/` writes.
## Artifacts
- `results/candidates.csv`
- `results/best.csv`
- `results/summary.csv`
- `results/evaluate_check.csv`
## Best Summary
| Case | Area | Delay | ADP | Delta vs current-at-run | Beats current-at-run | Candidate |
| --- | ---: | ---: | ---: | ---: | ---: | --- |
| ex280 | 873 | 27 | 23571 | 6351 | 0 | `ex280_unknown_key_canonical_cofactor_bdd_prefix_parity_reduce_top6_first_tree2` |
## Conclusion
- Exact-equivalent evidence retained for traceability; not promoted unless referenced by a later synthflow best.
