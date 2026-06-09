# ex280_ex284_frontend_key_classonehot_bitoverride_20260608_2118
## Hypothesis
- Classonehot prefix-key BDD with selected low output bits overridden by exact prefix-key ANF formulas.
- Goal: shrink each representative BDD by removing low-support bits while retaining the successful classonehot outer selector structure.
- Scope: ex280-ex284 only. No `student/seeds` update and no `output/` writes.
## Artifacts
- `results/candidates.csv`
- `results/best.csv`
- `results/summary.csv`
- `results/evaluate_check.csv`
## Best Summary
| Case | Area | Delay | ADP | Delta vs current | Candidate |
| --- | ---: | ---: | ---: | ---: | --- |
| ex280 | 1217 | 27 | 32859 | 15639 | `ex280_unknown_key_classonehot_bitoverride_prefix_parity_reduce_top6_endpoint_low4` |
| ex281 | 1382 | 27 | 37314 | 16722 | `ex281_unknown_key_classonehot_bitoverride_prefix_parity_reduce_top6_endpoint_low4` |
| ex282 | 1541 | 30 | 46230 | 17490 | `ex282_unknown_key_classonehot_bitoverride_prefix_parity_reduce_top6_endpoint_rev_low4` |
| ex283 | 1629 | 30 | 48870 | 14553 | `ex283_unknown_key_classonehot_bitoverride_prefix_parity_reduce_top6_endpoint_rev_low4` |
| ex284 | 1793 | 34 | 60962 | 18338 | `ex284_unknown_key_classonehot_bitoverride_prefix_parity_reduce_top6_endpoint_rev_low4` |
## Official Replay
- `evaluate.py` replay passed 20/20 equivalent rows in `results/evaluate_check.csv`.
## Conclusion
- Exact, but worse for every case. The selected-output BDD node savings were overwhelmed by added low-bit ANF logic and poorer mapping.
- Do not expand to wider low-bit overrides or synthflow variants unless the low-bit source is replaced by a materially smaller semantic formula.
