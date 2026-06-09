# ex286_ex289_frontend_output_pair_component_field_diag_20260609_1923

Run ID: `ex286_ex289_frontend_output_pair_component_field_diag_20260609_1923`

Purpose: Split component-wise adjacent output-pair encoding into pair-count
fields and orientation fields, to identify whether either part is compact
enough to become a frontend source.

Inputs:
- Cases: `ex286,ex287,ex288,ex289`
- Relations: `student/runs/unknown/ex286_ex289_frontend_image_constraint_diag_fix_20260609_1912/results/relations.csv`
- Script: `student/generators/unknown_output_pair_component_field_diag.py`

Artifacts:
- Work directory: `student/work/ex286_ex289_frontend_output_pair_component_field_diag_20260609_1923`
- Results directory: `student/runs/unknown/ex286_ex289_frontend_output_pair_component_field_diag_20260609_1923/results`
- Results: `results/summary.csv`, `results/field_support.csv`,
  `results/candidates.csv`, `results/best.csv`, `results/evaluate_check.csv`

Notes:
- Diagnostic only; no Verilog/AIG candidates emitted.
- Pair-count fields dominate the split (`998..2170` BDD nodes) and keep
  full-width support; orientation bits alone are not enough to reconstruct a
  compact source.
- `student/seeds` and `output/` are intentionally untouched.
