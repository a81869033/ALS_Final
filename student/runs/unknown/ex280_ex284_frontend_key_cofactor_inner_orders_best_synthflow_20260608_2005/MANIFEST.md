# ex280_ex284_frontend_key_cofactor_inner_orders_best_synthflow_20260608_2005
## Hypothesis
- Inner-order best synthflow: Limited synthflow on each case best raw inner-order row. Exact; ex284 improved, other cases stayed worse.
- Scope: ex280-ex284 only unless the run name is a single-case smoke check. No `student/seeds` update and no `output/` writes.
## Artifacts
- `results/candidates.csv`
- `results/best.csv`
- `results/summary.csv`
- `results/evaluate_check.csv`
## Best Summary
| Case | Area | Delay | ADP | Delta vs current-at-run | Beats current-at-run | Candidate |
| --- | ---: | ---: | ---: | ---: | ---: | --- |
| ex280 | 731 | 25 | 18275 | 1055 | 0 | `ex280_prefix_parity_reduce_top6_first_case_endpoint_rev_abc_g_aig` |
| ex281 | 889 | 26 | 23114 | 2522 | 0 | `ex281_prefix_parity_reduce_top6_first_onehot_endpoint_rev_abc_g_aig` |
| ex282 | 971 | 32 | 31072 | 1260 | 0 | `ex282_prefix_parity_reduce_top6_first_case_endpoint_rev_abc_g_aig` |
| ex283 | 1110 | 33 | 36630 | 960 | 0 | `ex283_prefix_parity_reduce_top6_first_onehot_endpoint_rev_abc_g_aig` |
| ex284 | 1227 | 35 | 42945 | 0 | 0 | `ex284_prefix_parity_reduce_top6_first_onehot_endpoint_rev_abc_g_aig` |
## Conclusion
- Exact-equivalent evidence retained for traceability; not promoted unless referenced by a later synthflow best.
