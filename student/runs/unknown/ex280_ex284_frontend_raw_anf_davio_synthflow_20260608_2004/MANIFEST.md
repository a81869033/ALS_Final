# ex280_ex284_frontend_raw_anf_davio_synthflow_20260608_2004
## Hypothesis
- Raw ANF/Davio synthflow: Limited synthflow on raw Davio best rows. Exact but worse than cofactor family.
- Scope: ex280-ex284 only unless the run name is a single-case smoke check. No `student/seeds` update and no `output/` writes.
## Artifacts
- `results/candidates.csv`
- `results/best.csv`
- `results/summary.csv`
- `results/evaluate_check.csv`
## Best Summary
| Case | Area | Delay | ADP | Delta vs current-at-run | Beats current-at-run | Candidate |
| --- | ---: | ---: | ---: | ---: | ---: | --- |
| ex280 | 929 | 25 | 23225 | 6005 | 0 | `ex280_anf_davio_best_order_abc_g_aig` |
| ex281 | 1171 | 27 | 31617 | 11025 | 0 | `ex281_anf_davio_best_order_abc_g_aig` |
| ex282 | 1323 | 31 | 41013 | 11201 | 0 | `ex282_anf_davio_best_order_abc_g_aig` |
| ex283 | 1584 | 34 | 53856 | 18186 | 0 | `ex283_anf_davio_best_order_abc_g_aig` |
| ex284 | 1749 | 38 | 66462 | 23517 | 0 | `ex284_anf_davio_best_order_abc_g_aig` |
## Conclusion
- Exact-equivalent evidence retained for traceability; not promoted unless referenced by a later synthflow best.
