# ex286_ex289_frontend_image_constraint_diag_fix_20260609_1912

Run ID: `ex286_ex289_frontend_image_constraint_diag_fix_20260609_1912`

Purpose: Diagnose whether the output image of ex286-ex289 lies in a low-degree
GF(2) variety, which could imply a compact parameterized output source.

Inputs:
- Cases: `ex286,ex287,ex288,ex289`
- Truth files: `benchmarks/<case>.truth`
- Script: `student/generators/unknown_image_constraint_diag.py`

Artifacts:
- Work directory: `student/work/ex286_ex289_frontend_image_constraint_diag_fix_20260609_1912`
- Results directory: `student/runs/unknown/ex286_ex289_frontend_image_constraint_diag_fix_20260609_1912/results`
- Results: `results/summary.csv`, `results/relations.csv`

Methods tried:
- Polynomial relations of degree `1,2,3` over unique output image points.

Notes:
- Diagnostic only; no Verilog/AIG candidates emitted.
- `student/seeds` and `output/` are intentionally untouched.
