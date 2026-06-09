# ex295_ex297_ex299_frontend_rot_rep_bdd_20260608_1310

Run ID: `ex295_ex297_ex299_frontend_rot_rep_bdd_20260608_1310`

Purpose: Test exact even-rotation equivariance without dynamic canonical-min by
building BDDs only for representative output bits 0 and 1, then reconstructing
other output bits from rotated inputs.

Inputs:
- Truth files: `benchmarks/ex295.truth`, `benchmarks/ex297.truth`, `benchmarks/ex299.truth`
- Generator/script: `student/generators/unknown_rotation_rep_bdd.py`
- BDD order: `natural`

Artifacts:
- Work directory: `student/work/ex295_ex297_ex299_frontend_rot_rep_bdd_20260608_1310/`
- Candidates CSV: `student/runs/unknown/ex295_ex297_ex299_frontend_rot_rep_bdd_20260608_1310/results/candidates.csv`
- Best CSV: `student/runs/unknown/ex295_ex297_ex299_frontend_rot_rep_bdd_20260608_1310/results/best.csv`
- Summary CSV: `student/runs/unknown/ex295_ex297_ex299_frontend_rot_rep_bdd_20260608_1310/results/summary.csv`
- Official evaluate.py recheck: `student/runs/unknown/ex295_ex297_ex299_frontend_rot_rep_bdd_20260608_1310/results/evaluate_check.csv`

Best result:
- `ex295`: `9792/20/195840`; exact but worse than `low_split_default` at `156456`.
- `ex297`: `35431/22/779482`; exact but worse than `low_split_default` at `683613`.
- `ex299`: `123601/27/3337227`; exact but worse than `high_split_default` at `2851392`.

Notes:
- Official `evaluate.py` replay passed for all 3 rows.
- Representative-bit reconstruction avoids the canonical-min comparator delay,
  but duplicated BDD logic still loses ADP. Future rotation work needs
  pair-ring/local logic or stronger shared predicates, not duplicated BDDs.
