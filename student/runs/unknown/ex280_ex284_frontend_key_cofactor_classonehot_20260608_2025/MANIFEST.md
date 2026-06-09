# ex280_ex284_frontend_key_cofactor_classonehot_20260608_2025
## Hypothesis
- Class-level one-hot cofactor: New source factoring: OR outer selectors per representative class, then mux class groups. Exact; raw ex283/ex284 improved and ex282 was near current.
- Scope: ex280-ex284 only unless the run name is a single-case smoke check. No `student/seeds` update and no `output/` writes.
## Artifacts
- `results/candidates.csv`
- `results/best.csv`
- `results/summary.csv`
- `results/evaluate_check.csv`
## Best Summary
| Case | Area | Delay | ADP | Delta vs current-at-run | Beats current-at-run | Candidate |
| --- | ---: | ---: | ---: | ---: | ---: | --- |
| ex280 | 764 | 25 | 19100 | 1880 | 0 | `ex280_unknown_key_canonical_cofactor_bdd_prefix_parity_reduce_top6_first_classonehot_endpoint_rev` |
| ex281 | 893 | 28 | 25004 | 4412 | 0 | `ex281_unknown_key_canonical_cofactor_bdd_prefix_parity_reduce_top6_first_classonehot_endpoint` |
| ex282 | 1001 | 30 | 30030 | 218 | 0 | `ex282_unknown_key_canonical_cofactor_bdd_prefix_parity_reduce_top6_first_classonehot_endpoint_rev` |
| ex283 | 1145 | 31 | 35495 | -175 | 1 | `ex283_unknown_key_canonical_cofactor_bdd_prefix_parity_reduce_top6_first_classonehot_endpoint` |
| ex284 | 1227 | 37 | 45399 | 2454 | 0 | `ex284_unknown_key_canonical_cofactor_bdd_prefix_parity_reduce_top6_first_classonehot_endpoint_rev` |
## Conclusion
- Keep as the source Verilog pool for the classonehot synthflow run.
