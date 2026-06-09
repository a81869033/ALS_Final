# ex286_ex289_frontend_canonical_image_diag_20260609_1815

Run ID: `ex286_ex289_frontend_canonical_image_diag_20260609_1815`

Purpose: Diagnostic-only image/preimage and bucket-key representative search
for ex286-ex289.  This tests whether the conservative truth maps are
canonicalizers: many inputs mapping to a smaller image, or each exact bucket-key
class choosing a simple min/max representative under candidate bit orders.

Inputs:
- Truth files: benchmarks/ex286.truth, benchmarks/ex287.truth, benchmarks/ex288.truth, benchmarks/ex289.truth
- Script: `student/generators/unknown_canonical_image_diag.py`

Artifacts:
- Results directory: `student/runs/unknown/ex286_ex289_frontend_canonical_image_diag_20260609_1815/results/`
- Summary CSV: `results/summary.csv`
- Representative CSV: `results/representatives.csv`
- Empty frontend CSVs: `results/candidates.csv`, `results/best.csv`, `results/evaluate_check.csv`

Best result:
- Diagnostic only; no Verilog/AIG candidates generated.

Notes:
- `student/seeds` and `output/` are intentionally untouched.
