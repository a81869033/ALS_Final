# ex284_frontend_split_classonehot_bit_hybrid_20260608_2153
## Hypothesis
- Hybrid the low-delay `rotate_high_split_default` source with the best classonehot prefix-key cofactor source for ex284.
- Primary selected bits come from the split source; remaining bits come from classonehot.
- Scope: ex284 only. No `student/seeds` update and no `output/` writes.
## Artifacts
- `results/candidates.csv`
- `results/best.csv`
- `results/summary.csv`
- `results/evaluate_check.csv`
## Best Summary
| Case | Area | Delay | ADP | Reference ADP | Candidate |
| --- | ---: | ---: | ---: | ---: | --- |
| ex284 | 1642 | 33 | 54186 | 4240 | `ex284_unknown_bit_hybrid_primary_12_13_14_15` |
## Official Replay
- `evaluate.py` replay passed 6/6 equivalent rows in `results/evaluate_check.csv`.
## Conclusion
- Exact, but worse than current classonehot synthflow (`1184/36/42624`).
- Wider high-bit groups reduced delay but area exploded; small groups did not reduce delay enough. Do not expand this split/classonehot hybrid without a new compact selected-bit source.
