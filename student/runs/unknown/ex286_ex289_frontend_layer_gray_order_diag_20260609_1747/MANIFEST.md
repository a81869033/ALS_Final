# ex286_ex289_frontend_layer_gray_order_diag_20260609_1747

Run ID: `ex286_ex289_frontend_layer_gray_order_diag_20260609_1747`

Purpose: Diagnostic-only Gray-filtered same-popcount layer order search for
ex286-ex289.  This tests whether the conservative maps are compact successors
or affine transforms inside each popcount layer under BRGC-filtered or
bit-reversed Gray orders.

Inputs:
- Truth files: benchmarks/ex286.truth, benchmarks/ex287.truth, benchmarks/ex288.truth, benchmarks/ex289.truth
- Script: `student/generators/unknown_layer_gray_order_diag.py`
- Orders: `value,rev_value,gray_value,rev_gray_value,brgc_index,rev_brgc_index,gray_then_reverse,reverse_gray_then_reverse`

Artifacts:
- Results directory: `student/runs/unknown/ex286_ex289_frontend_layer_gray_order_diag_20260609_1747/results/`
- Summary CSV: `results/summary.csv`
- Layer CSV: `results/layer_details.csv`
- Empty frontend CSVs: `results/candidates.csv`, `results/best.csv`, `results/evaluate_check.csv`

Best result:
- Diagnostic only; no Verilog/AIG candidates generated.

Notes:
- `student/seeds` and `output/` are intentionally untouched.
