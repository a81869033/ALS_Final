# ex286_ex289_frontend_static_control_swap_narrow_diag_20260609_1724

Run ID: `ex286_ex289_frontend_static_control_swap_narrow_diag_20260609_1724`

Purpose: Diagnostic-only static-feature controlled-swap search for ex286-ex289.
This strengthens the earlier Fredkin greedy check by allowing controls from
raw input bits, exact symmetry-pair signals, prefix/window count thresholds, and
one-hot bucket-count thresholds.  It remains frontend-RTL-relevant because each
step is a conservative mux-swap with a small static control.

Inputs:
- Truth files: benchmarks/ex286.truth, benchmarks/ex287.truth, benchmarks/ex288.truth, benchmarks/ex289.truth
- Script: `student/generators/unknown_static_control_swap_diag.py`
- Max greedy depth: `8`

Artifacts:
- Results directory: `student/runs/unknown/ex286_ex289_frontend_static_control_swap_narrow_diag_20260609_1724/results/`
- Detail CSV: `results/static_control_swap_diagnostics.csv`
- Summary CSV: `results/summary.csv`
- Empty frontend CSVs: `results/candidates.csv`, `results/best.csv`, `results/evaluate_check.csv`

Best result:
- Diagnostic only; no Verilog/AIG candidates generated.

Notes:
- `student/seeds` and `output/` are intentionally untouched.
