# ex280_ex284_frontend_key_cofactor_classcase_20260608_2055
## Hypothesis
- Classcase source rewrite: map the reduction-XOR prefix-key outer selector to a representative cofactor class with a first-stage `case`, then select the representative group BDD with a second `case`.
- Scope: ex280-ex284 only. No `student/seeds` update and no `output/` writes.
## Artifacts
- `results/candidates.csv`
- `results/best.csv`
- `results/summary.csv`
- `results/evaluate_check.csv`
## Best Summary
| Case | Area | Delay | ADP | Delta vs current-at-run | Beats current-at-run | Candidate |
| --- | ---: | ---: | ---: | ---: | ---: | --- |
| ex280 | 803 | 25 | 20075 | 2855 | 0 | `ex280_unknown_key_canonical_cofactor_bdd_prefix_parity_reduce_top5_first_classcase_endpoint_rev` |
| ex281 | 941 | 30 | 28230 | 7638 | 0 | `ex281_unknown_key_canonical_cofactor_bdd_prefix_parity_reduce_top6_first_classcase_endpoint` |
| ex282 | 1094 | 30 | 32820 | 4080 | 0 | `ex282_unknown_key_canonical_cofactor_bdd_prefix_parity_reduce_top6_first_classcase_endpoint` |
| ex283 | 1222 | 32 | 39104 | 4787 | 0 | `ex283_unknown_key_canonical_cofactor_bdd_prefix_parity_reduce_top6_first_classcase_endpoint` |
| ex284 | 1367 | 37 | 50579 | 7955 | 0 | `ex284_unknown_key_canonical_cofactor_bdd_prefix_parity_reduce_top6_first_classcase_endpoint` |
## Conclusion
- Exact for all emitted rows, but worse than current classonehot/top-k sources.
- Reject this implementation: serializing class factoring through two `case` levels loses the equality-comparator sharing that the classonehot form preserves.
