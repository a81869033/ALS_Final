# ex295_ex297_ex299_frontend_bdd_orders_20260608_1200

Run ID: `ex295_ex297_ex299_frontend_bdd_orders_20260608_1200`

Purpose: Test diagnostic-selected shared-BDD orders for the exact even-rotation
equivariant cases `ex295`, `ex297`, and `ex299`.

Inputs:
- Truth files: `benchmarks/ex295.truth`, `benchmarks/ex297.truth`, `benchmarks/ex299.truth`
- Diagnostic BDD orders from `student/runs/unknown/ex280_ex299_frontend_diagnostics_20260608_1105/results/summary.csv`
- Generator/script: `student/generators/unknown_bdd_search.py`

Artifacts:
- Work directory: `student/work/ex295_ex297_ex299_frontend_bdd_orders_20260608_1200/`
- Candidates CSV: `student/runs/unknown/ex295_ex297_ex299_frontend_bdd_orders_20260608_1200/results/candidates.csv`
- Best CSV: `student/runs/unknown/ex295_ex297_ex299_frontend_bdd_orders_20260608_1200/results/best.csv`
- Summary CSV: `student/runs/unknown/ex295_ex297_ex299_frontend_bdd_orders_20260608_1200/results/summary.csv`
- Official evaluate.py recheck: `student/runs/unknown/ex295_ex297_ex299_frontend_bdd_orders_20260608_1200/results/evaluate_check.csv`

Methods tried:
- `ex295`: center-like BDD order `5:6:4:7:3:8:2:9:1:10:0:11`
- `ex297`: natural BDD order
- `ex299`: natural BDD order

Best result:
- `ex295`: `9186/21/192906`, exact but worse than current `8692/18/156456`.
- `ex297`: `32175/24/772200`, exact but worse than current `32553/21/683613`.
- `ex299`: `118187/27/3191049`, exact but worse than current `118808/24/2851392`.

Notes:
- Official `evaluate.py` replay passed for all 3 rows.
- Diagnostic BDD node count did not translate into better ADP because delay increased.
- Do not repeat these exact shared-BDD orders without a source rewrite or synthflow reason.
