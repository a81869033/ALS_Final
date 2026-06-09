# ex286_ex289_frontend_bucket_layout_diag_20260609_1737

Run ID: `ex286_ex289_frontend_bucket_layout_diag_20260609_1737`

Purpose: Diagnostic-only bucket-count prefix/layout search for ex286-ex289.
This tests whether exact one-hot bucket counts plus selector bits implement a
small histogram-to-output layout such as prefix thermometer placement, selector
offset rotation, or selector-specific bucket/output order.

Inputs:
- Truth files: benchmarks/ex286.truth, benchmarks/ex287.truth, benchmarks/ex288.truth, benchmarks/ex289.truth
- Script: `student/generators/unknown_bucket_layout_diag.py`

Artifacts:
- Results directory: `student/runs/unknown/ex286_ex289_frontend_bucket_layout_diag_20260609_1737/results/`
- Summary CSV: `results/summary.csv`
- Empty frontend CSVs: `results/candidates.csv`, `results/best.csv`, `results/evaluate_check.csv`

Best result:
- Diagnostic only; no Verilog/AIG candidates generated.

Notes:
- `student/seeds` and `output/` are intentionally untouched.
