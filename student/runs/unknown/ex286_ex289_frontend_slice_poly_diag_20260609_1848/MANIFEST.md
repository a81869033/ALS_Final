# ex286_ex289_frontend_slice_poly_diag_20260609_1848

Run ID: `ex286_ex289_frontend_slice_poly_diag_20260609_1848`

Purpose: Diagnose whether the Hamming-weight-preserving unknown functions are
low-degree polynomial maps on each fixed-popcount slice. This can expose layer
local structure that ordinary global ANF misses.

Inputs:
- Cases: `ex286,ex287,ex288,ex289`
- Truth files: `benchmarks/<case>.truth`
- Script: `student/generators/unknown_slice_poly_diag.py`

Artifacts:
- Work directory: `student/work/ex286_ex289_frontend_slice_poly_diag_20260609_1848`
- Results directory: `student/runs/unknown/ex286_ex289_frontend_slice_poly_diag_20260609_1848/results`
- Results: `results/summary.csv`, `results/slice_detail.csv`

Methods tried:
- GF(2) span checks using all monomials of degree `<= 1,2,3` restricted to each
  popcount layer.

Notes:
- Diagnostic only; no Verilog/AIG candidates emitted unless a compact exact
  slice model is found in a later run.
- `student/seeds` and `output/` are intentionally untouched.
