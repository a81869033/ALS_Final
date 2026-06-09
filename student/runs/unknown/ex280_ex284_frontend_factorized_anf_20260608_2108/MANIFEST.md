# ex280_ex284_frontend_factorized_anf_20260608_2108
## Hypothesis
- Split-factorized ANF source rewrite in the successful `prefix_parity_reduce` key domain.
- ANF terms were grouped as `high_monomial * low_coefficient(low_bits)` to share high-half products across many low coefficients.
- Scope: ex280-ex284 only. No `student/seeds` update and no `output/` writes.
## Artifacts
- `results/candidates.csv`
- `results/best.csv`
- `results/summary.csv`
- `results/evaluate_check.csv`
## Best Summary
| Case | Area | Delay | ADP | Delta vs current | Candidate |
| --- | ---: | ---: | ---: | ---: | --- |
| ex280 | 1756 | 28 | 49168 | 31948 | `ex280_unknown_factorized_anf_prefix_parity_reduce_floor` |
| ex281 | 1984 | 27 | 53568 | 32976 | `ex281_unknown_factorized_anf_prefix_parity_reduce_ceil` |
| ex282 | 2471 | 31 | 76601 | 47861 | `ex282_unknown_factorized_anf_prefix_parity_reduce_floor` |
| ex283 | 2671 | 30 | 80130 | 45813 | `ex283_unknown_factorized_anf_prefix_parity_reduce_floor` |
| ex284 | 3251 | 31 | 100781 | 58157 | `ex284_unknown_factorized_anf_prefix_parity_reduce_floor` |
## Official Replay
- `evaluate.py` replay passed 10/10 equivalent rows in `results/evaluate_check.csv`.
## Conclusion
- Exact, but much worse than current classonehot/top-k BDD candidates.
- Reject this source form: sharing high-half monomials did not compensate for the large low-coefficient XOR network.
