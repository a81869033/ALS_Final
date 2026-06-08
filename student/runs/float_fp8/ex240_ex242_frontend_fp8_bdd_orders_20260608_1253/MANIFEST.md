# ex240_ex242_frontend_fp8_bdd_orders_20260608_1253

Run ID: `ex240_ex242_frontend_fp8_bdd_orders_20260608_1253`

Purpose: test whether the BDD-order lesson from ex243 can improve ex240-ex242; no seed curation.

Artifacts:
- Work directory: `student/work/ex240_ex242_frontend_fp8_bdd_orders_20260608_1253`
- Candidates CSV: `student/runs/float_fp8/ex240_ex242_frontend_fp8_bdd_orders_20260608_1253/results/candidates.csv`
- Best CSV: `student/runs/float_fp8/ex240_ex242_frontend_fp8_bdd_orders_20260608_1253/results/best.csv`
- Evaluate copy: `student/runs/float_fp8/ex240_ex242_frontend_fp8_bdd_orders_20260608_1253/results/evaluate_check.csv`

Methods tried:
- Shared-BDD structural Verilog for ex240 add, ex241 multiply, and ex242 division.
- Orders included paired high-to-low operand bits and semantic magnitude-biased orders.

Best result:
- ex240: `2786/26/72436`, later improved by synthflow to `2755/23/63365`.
- ex241: `1506/21/31626`, not better than field-table best.
- ex242: `1560/22/34320`, not better than formula/exception best.
