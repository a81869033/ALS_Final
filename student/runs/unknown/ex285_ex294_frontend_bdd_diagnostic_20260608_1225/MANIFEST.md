# ex285_ex294_frontend_bdd_diagnostic_20260608_1225

Run ID: `ex285_ex294_frontend_bdd_diagnostic_20260608_1225`

Purpose: Test diagnostic-selected shared-BDD input orders for `ex285-ex294`.
This targeted the small BDD node counts reported by
`ex280_ex299_frontend_diagnostics_20260608_1105`.

Inputs:
- Truth files: `benchmarks/ex285.truth` through `benchmarks/ex294.truth`
- Diagnostic run: `student/runs/unknown/ex280_ex299_frontend_diagnostics_20260608_1105/`
- Generator/script: `student/generators/unknown_bdd_search.py`

Artifacts:
- Work directory: `student/work/ex285_ex294_frontend_bdd_diagnostic_20260608_1225/`
- Candidates CSV: `student/runs/unknown/ex285_ex294_frontend_bdd_diagnostic_20260608_1225/results/candidates.csv`
- Best CSV: `student/runs/unknown/ex285_ex294_frontend_bdd_diagnostic_20260608_1225/results/best.csv`
- Summary CSV: `student/runs/unknown/ex285_ex294_frontend_bdd_diagnostic_20260608_1225/results/summary.csv`
- Official evaluate.py recheck: `student/runs/unknown/ex285_ex294_frontend_bdd_diagnostic_20260608_1225/results/evaluate_check.csv`

Best result:
- Improved raw BDD rows: `ex288` `2012/22/44264`, `ex289`
  `1767/23/40641`, `ex292` `6827/21/143367`, `ex294`
  `10945/24/262680`.
- Exact but worse rows: `ex285` `794/18/14292`, `ex286`
  `1494/20/29880`, `ex287` `1829/21/38409`, `ex290`
  `3949/19/75031`, `ex291` `5369/21/112749`, `ex293`
  `8599/22/189178`.

Notes:
- Official `evaluate.py` replay passed for all 12 rows.
- This is `structural_exact` shared-BDD RTL. Final unknown seed curation is
  deferred until the full `ex280-ex299` class converges.
