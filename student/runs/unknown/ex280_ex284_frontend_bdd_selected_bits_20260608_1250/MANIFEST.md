# ex280_ex284_frontend_bdd_selected_bits_20260608_1250

Run ID: `ex280_ex284_frontend_bdd_selected_bits_20260608_1250`

Purpose: Test whether replacing low-support output bits with small exact LUTs
can improve the shared-BDD candidates for `ex280-ex284`.

Inputs:
- Truth files: `benchmarks/ex280.truth` through `benchmarks/ex284.truth`
- Generator/script: `student/generators/unknown_bdd_selected_bits.py`
- BDD order: width-specific interleave order
- Selected-bit variants: `support8`, `support10`

Artifacts:
- Work directory: `student/work/ex280_ex284_frontend_bdd_selected_bits_20260608_1250/`
- Candidates CSV: `student/runs/unknown/ex280_ex284_frontend_bdd_selected_bits_20260608_1250/results/candidates.csv`
- Best CSV: `student/runs/unknown/ex280_ex284_frontend_bdd_selected_bits_20260608_1250/results/best.csv`
- Summary CSV: `student/runs/unknown/ex280_ex284_frontend_bdd_selected_bits_20260608_1250/results/summary.csv`
- Official evaluate.py recheck: `student/runs/unknown/ex280_ex284_frontend_bdd_selected_bits_20260608_1250/results/evaluate_check.csv`

Best result:
- `ex280`: `1029/22/22638`; exact but worse than older BDD/project best.
- `ex281`: `1252/24/30048`; exact but worse than BDD synthflow `1158/22/25476`.
- `ex282`: `1391/25/34775`; exact but worse than BDD synthflow `1313/24/31512`.
- `ex283`: `1654/27/44658`; exact but worse than BDD synthflow `1494/26/38844`.
- `ex284`: `1977/29/57333`; exact but worse than BDD synthflow `1727/29/50083`.

Notes:
- Official `evaluate.py` replay passed for all 10 rows.
- Small LUT overrides increased area or delay enough to lose ADP. Do not repeat
  the same `support8`/`support10` split without a different source rewrite.
