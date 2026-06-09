# ex280_ex284_frontend_key_cofactor_classonehot_synthflow_20260608_2027
## Hypothesis
- Class-level one-hot synthflow: Limited synthflow on all classonehot rows. Produced new current bests for ex282, ex283, and ex284.
- Scope: ex280-ex284 only unless the run name is a single-case smoke check. No `student/seeds` update and no `output/` writes.
## Artifacts
- `results/candidates.csv`
- `results/best.csv`
- `results/summary.csv`
- `results/evaluate_check.csv`
## Best Summary
| Case | Area | Delay | ADP | Delta vs current-at-run | Beats current-at-run | Candidate |
| --- | ---: | ---: | ---: | ---: | ---: | --- |
| ex280 | 729 | 25 | 18225 | 1005 | 0 | `ex280_prefix_parity_reduce_top6_first_classonehot_endpoint_rev_abc_g_aig` |
| ex281 | 859 | 27 | 23193 | 2601 | 0 | `ex281_prefix_parity_reduce_top6_first_classonehot_endpoint_abc_g_aig` |
| ex282 | 958 | 30 | 28740 | -1072 | 1 | `ex282_prefix_parity_reduce_top6_first_classonehot_endpoint_rev_abc_g_aig` |
| ex283 | 1107 | 31 | 34317 | -1353 | 1 | `ex283_prefix_parity_reduce_top6_first_classonehot_endpoint_abc_g_aig` |
| ex284 | 1184 | 36 | 42624 | -321 | 1 | `ex284_prefix_parity_reduce_top6_first_classonehot_endpoint_rev_abc_g_aig` |
## Conclusion
- Keep as active frontend candidates for ex282/ex283/ex284; this run updates current best by ADP.
