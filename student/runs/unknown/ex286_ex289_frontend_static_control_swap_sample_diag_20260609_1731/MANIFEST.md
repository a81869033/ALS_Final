# ex286_ex289_frontend_static_control_swap_sample_diag_20260609_1731

Run ID: `ex286_ex289_frontend_static_control_swap_sample_diag_20260609_1731`

Purpose: Sampled static-feature controlled-swap smoke for ex286-ex289 after the
full-table version was too slow and ex286 showed weak early full-table results.
The sample includes all weight<=2 rows plus deterministic stratified rows.

Inputs:
- Truth files: benchmarks/ex286.truth, benchmarks/ex287.truth, benchmarks/ex288.truth, benchmarks/ex289.truth
- Script: `student/generators/unknown_static_control_swap_sample_diag.py`
- Max depth: `12`
- Sample limit: `2048`

Artifacts:
- Results directory: `student/runs/unknown/ex286_ex289_frontend_static_control_swap_sample_diag_20260609_1731/results/`
- Detail CSV: `results/static_control_swap_sample_diagnostics.csv`
- Summary CSV: `results/summary.csv`
- Empty frontend CSVs: `results/candidates.csv`, `results/best.csv`, `results/evaluate_check.csv`

Best result:
- Diagnostic only; no Verilog/AIG candidates generated.

Notes:
- `student/seeds` and `output/` are intentionally untouched.
