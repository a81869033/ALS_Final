# ex280_ex284_frontend_bdd_interleave_20260608_1120

Run ID: `ex280_ex284_frontend_bdd_interleave_20260608_1120`

Purpose: Generate exact shared-BDD frontend Verilog/AIG seeds for `ex280-ex284`
using the interleaved input orders suggested by
`ex280_ex299_frontend_diagnostics_20260608_1105`.

Inputs:
- Truth files: `benchmarks/ex280.truth` through `benchmarks/ex284.truth`
- Diagnostic run: `student/runs/unknown/ex280_ex299_frontend_diagnostics_20260608_1105/`
- Generator/script: `student/generators/unknown_bdd_search.py`

Artifacts:
- Work directory: `student/work/ex280_ex284_frontend_bdd_interleave_20260608_1120/`
- Candidates CSV: `student/runs/unknown/ex280_ex284_frontend_bdd_interleave_20260608_1120/results/candidates.csv`
- Best CSV: `student/runs/unknown/ex280_ex284_frontend_bdd_interleave_20260608_1120/results/best.csv`
- Summary CSV: `student/runs/unknown/ex280_ex284_frontend_bdd_interleave_20260608_1120/results/summary.csv`
- Official evaluate.py recheck: `student/runs/unknown/ex280_ex284_frontend_bdd_interleave_20260608_1120/results/evaluate_check.csv`

Methods tried:
- Shared ROBDD Verilog emission with one width-specific interleaved order per case.
- Yosys Verilog-to-AIG synthesis through the existing frontend harness.
- ABC CEC/ADP through the generator, followed by official `evaluate.py --case` replay.

Best result:
- `ex280`: `977/21/20517`; exact, but not a new best because older ex280 BDD/backend rows are better.
- `ex281`: `1179/23/27117`; new current best.
- `ex282`: `1404/25/35100`; new current best.
- `ex283`: `1638/27/44226`; new current best.
- `ex284`: `1826/29/52954`; new current best.

Notes:
- Official `evaluate.py` replay passed for all 5 rows.
- `ex281-ex284` are run-level current best inputs; final unknown seed curation
  is deferred until the full `ex280-ex299` class converges.
- These are `structural_exact` shared-BDD seeds, not semantic identifications.
