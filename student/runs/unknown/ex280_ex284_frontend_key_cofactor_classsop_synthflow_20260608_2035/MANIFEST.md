# ex280_ex284_frontend_key_cofactor_classsop_synthflow_20260608_2035
## Hypothesis
- Class SOP synthflow: Limited synthflow on classsop best rows. Exact; ex282 improved versus old current but did not beat classonehot.
- Scope: ex280-ex284 only unless the run name is a single-case smoke check. No `student/seeds` update and no `output/` writes.
## Artifacts
- `results/candidates.csv`
- `results/best.csv`
- `results/summary.csv`
- `results/evaluate_check.csv`
## Best Summary
| Case | Area | Delay | ADP | Delta vs current-at-run | Beats current-at-run | Candidate |
| --- | ---: | ---: | ---: | ---: | ---: | --- |
| ex280 | 743 | 25 | 18575 | 1355 | 0 | `ex280_prefix_parity_reduce_top5_first_classsop_endpoint_rev_abc_g_aig` |
| ex281 | 880 | 25 | 22000 | 1408 | 0 | `ex281_prefix_parity_reduce_top6_first_classsop_endpoint_abc_g_aig` |
| ex282 | 985 | 30 | 29550 | -262 | 1 | `ex282_prefix_parity_reduce_top6_first_classsop_endpoint_rev_abc_g_aig` |
| ex283 | 1124 | 34 | 38216 | 2546 | 0 | `ex283_prefix_parity_reduce_top6_first_classsop_endpoint_abc_g_aig` |
| ex284 | 1256 | 35 | 43960 | 1015 | 0 | `ex284_prefix_parity_reduce_top6_first_classsop_endpoint_abc_g_aig` |
## Conclusion
- Exact-equivalent evidence retained for traceability; not promoted unless referenced by a later synthflow best.
