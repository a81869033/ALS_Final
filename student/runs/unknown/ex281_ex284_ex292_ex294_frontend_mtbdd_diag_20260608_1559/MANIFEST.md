# ex281_ex284_ex292_ex294_frontend_mtbdd_diag_20260608_1559

Run type: frontend diagnostic only.

Scope: `ex281`, `ex282`, `ex283`, `ex284`, `ex292`, `ex294`.

Hypothesis: A vector-valued MTBDD over interleaved input bits might expose
output sharing that the scalar shared-BDD Verilog misses.

Result: The direct vector-leaf MTBDD node count was much larger than the
scalar shared-BDD count on every case, so no Verilog or AIG seed was emitted.
This is an exclusion record for the direct MTBDD source form, not a verified
candidate batch.

Key diagnostics:

| Case | MTBDD nodes | Leaves | Scalar BDD nodes | Ratio |
| --- | ---: | ---: | ---: | ---: |
| ex281 | 7289 | 1587 | 511 | 14.264 |
| ex282 | 14490 | 2950 | 591 | 24.518 |
| ex283 | 28788 | 5103 | 672 | 42.839 |
| ex284 | 57156 | 9528 | 758 | 75.404 |
| ex292 | 12257 | 4695 | 3807 | 3.220 |
| ex294 | 42953 | 15966 | 6020 | 7.135 |

Artifacts:

- Work manifest: `student/work/ex281_ex284_ex292_ex294_frontend_mtbdd_diag_20260608_1559/manifest.json`
- Results: `student/runs/unknown/ex281_ex284_ex292_ex294_frontend_mtbdd_diag_20260608_1559/results/`
- `candidates.csv`: diagnostic rows only.
- `best.csv`: header only; no seed emitted.
- `summary.csv`: per-case diagnostic summary.
- `diagnostics.csv`: MTBDD/scalar node-count comparison.
- `evaluate_check.csv`: `DIAGNOSTIC_ONLY` rows; no AIG replay because no seed was emitted.

Seed policy: this run intentionally did not create or update anything under
`student/seeds`; unknown seed curation is deferred until the full class
converges.
