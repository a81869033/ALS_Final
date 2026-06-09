# ex286_ex289_frontend_paircount_linear_diag_fast_20260609_2004

Diagnostic-only finite-field linear search for output adjacent-pair counts.

Purpose: test whether the pair-count half of component output encoding is a compact affine/integer function of input bucket counts and selector features.

Inputs:
- Cases: `ex286,ex287,ex288,ex289`
- Prime: `101`
- Script: `student/generators/unknown_paircount_linear_diag.py`

Artifacts:
- `results/paircount_linear_diagnostics.csv`
- Empty frontend CSVs: `results/summary.csv`, `results/candidates.csv`, `results/best.csv`, `results/evaluate_check.csv`

Notes:
- No exact finite-field linear pair-count formula found; no Verilog/AIG candidates emitted.
- `student/seeds` and `output/` are intentionally untouched.
