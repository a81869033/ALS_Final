# ex280_ex284_frontend_key_cofactor_classonehottree_synthflow_20260608_2058
## Hypothesis
- Limited synthflow on the classonehottree best rows, using only `abc_g_aig` and `synth_preset`.
- Scope: ex280-ex284 only. No `student/seeds` update and no `output/` writes.
## Artifacts
- `results/candidates.csv`
- `results/best.csv`
- `results/summary.csv`
- `results/evaluate_check.csv`
## Best Summary
| Case | Area | Delay | ADP | Reference ADP | Ratio | Candidate |
| --- | ---: | ---: | ---: | ---: | ---: | --- |
| ex280 | 726 | 25 | 18150 | 2415 | 7.515528 | `ex280_prefix_parity_reduce_top6_first_classonehottree_endpoint_rev_abc_g_aig` |
| ex281 | 854 | 27 | 23058 | 2336 | 9.870719 | `ex281_prefix_parity_reduce_top6_first_classonehottree_endpoint_abc_g_aig` |
| ex282 | 983 | 30 | 29490 | 2704 | 10.906065 | `ex282_prefix_parity_reduce_top6_first_classonehottree_endpoint_rev_abc_g_aig` |
| ex283 | 1092 | 32 | 34944 | 3168 | 11.030303 | `ex283_prefix_parity_reduce_top6_first_classonehottree_endpoint_abc_g_aig` |
| ex284 | 1249 | 36 | 44964 | 4240 | 10.604717 | `ex284_prefix_parity_reduce_top6_first_classonehottree_endpoint_rev_abc_g_aig` |
## Official Replay
- `evaluate.py` replay passed 10/10 equivalent rows in `results/evaluate_check.csv`.
## Conclusion
- No new current best. `abc_g_aig` improves the tree source, but still loses to the prior classonehot synthflow best for every case.
- Reject balanced OR tree as tested; Yosys already maps the flat classonehot source more effectively.
