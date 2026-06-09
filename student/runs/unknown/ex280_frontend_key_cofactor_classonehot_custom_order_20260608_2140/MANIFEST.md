# ex280_frontend_key_cofactor_classonehot_custom_order_20260608_2140
## Hypothesis
- Ex280-only custom inner BDD order for the current classonehot prefix-key cofactor source.
- A node-count diagnostic found `[3,7,8,4,5,6]` slightly better than endpoint order (`3512` vs `3576` representative-group BDD nodes), so this run checks whether the saving maps to AIG QoR.
- Scope: ex280 only. No `student/seeds` update and no `output/` writes.
## Artifacts
- `results/candidates.csv`
- `results/best.csv`
- `results/summary.csv`
- `results/evaluate_check.csv`
## Best Summary
| Case | Area | Delay | ADP | Reference ADP | Candidate |
| --- | ---: | ---: | ---: | ---: | --- |
| ex280 | 858 | 27 | 23166 | 2415 | `ex280_unknown_key_canonical_cofactor_bdd_prefix_parity_reduce_top6_first_classonehot_bits_3_7_8_4_5_6` |
## Official Replay
- `evaluate.py` replay passed 1/1 equivalent row in `results/evaluate_check.csv`.
## Conclusion
- Exact, but worse than both classonehot synthflow (`18225`) and archived current (`17220`).
- Do not expand this custom order family unless a much larger node-count improvement is found.
