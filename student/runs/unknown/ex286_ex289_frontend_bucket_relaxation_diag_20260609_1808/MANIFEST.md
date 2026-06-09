# ex286_ex289_frontend_bucket_relaxation_diag_20260609_1808

Run ID: `ex286_ex289_frontend_bucket_relaxation_diag_20260609_1808`

Purpose: Diagnostic-only bucket-count collision-relaxation search for
ex286-ex289.  This tests whether exact one-hot home bucket counts can be
converted to output occupancy by small local carry/relaxation rules such as
parking carry, binary carry, balanced nearest parking, or line/cycle sandpile.

Inputs:
- Truth files: benchmarks/ex286.truth, benchmarks/ex287.truth, benchmarks/ex288.truth, benchmarks/ex289.truth
- Script: `student/generators/unknown_bucket_relaxation_diag.py`

Artifacts:
- Results directory: `student/runs/unknown/ex286_ex289_frontend_bucket_relaxation_diag_20260609_1808/results/`
- Summary CSV: `results/summary.csv`
- Empty frontend CSVs: `results/candidates.csv`, `results/best.csv`, `results/evaluate_check.csv`

Best result:
- Diagnostic only; no Verilog/AIG candidates generated.

Notes:
- `student/seeds` and `output/` are intentionally untouched.
