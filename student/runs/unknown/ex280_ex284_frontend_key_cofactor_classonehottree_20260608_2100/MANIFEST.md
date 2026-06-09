# ex280_ex284_frontend_key_cofactor_classonehottree_20260608_2100
## Hypothesis
- Classonehottree source rewrite: keep the successful class-level one-hot factoring, but emit explicit balanced OR trees for selector and output ORs to try to reduce mux depth.
- Scope: ex280-ex284 only. No `student/seeds` update and no `output/` writes.
## Artifacts
- `results/candidates.csv`
- `results/best.csv`
- `results/summary.csv`
- `results/evaluate_check.csv`
## Best Summary
| Case | Area | Delay | ADP | Delta vs current-at-run | Beats current-at-run | Candidate |
| --- | ---: | ---: | ---: | ---: | ---: | --- |
| ex280 | 759 | 25 | 18975 | 1755 | 0 | `ex280_unknown_key_canonical_cofactor_bdd_prefix_parity_reduce_top6_first_classonehottree_endpoint_rev` |
| ex281 | 886 | 28 | 24808 | 4216 | 0 | `ex281_unknown_key_canonical_cofactor_bdd_prefix_parity_reduce_top6_first_classonehottree_endpoint` |
| ex282 | 1015 | 31 | 31465 | 2725 | 0 | `ex282_unknown_key_canonical_cofactor_bdd_prefix_parity_reduce_top6_first_classonehottree_endpoint_rev` |
| ex283 | 1137 | 33 | 37521 | 3204 | 0 | `ex283_unknown_key_canonical_cofactor_bdd_prefix_parity_reduce_top6_first_classonehottree_endpoint` |
| ex284 | 1295 | 36 | 46620 | 3996 | 0 | `ex284_unknown_key_canonical_cofactor_bdd_prefix_parity_reduce_top6_first_classonehottree_endpoint_rev` |
## Conclusion
- Exact for all emitted rows, but raw QoR was worse than current classonehot synthflow rows.
- Keep only as exclusion evidence unless a different source form can share the balanced-tree nodes across outputs.
