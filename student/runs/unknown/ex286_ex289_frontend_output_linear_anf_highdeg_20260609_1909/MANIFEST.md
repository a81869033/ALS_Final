# ex286_ex289_frontend_output_linear_anf_highdeg_20260609_1909

Run ID: `ex286_ex289_frontend_output_linear_anf_highdeg_20260609_1909`

Purpose: Diagnose whether ex286-ex289 have a hidden low-degree ANF basis after
an arbitrary linear transform of output bits. This is stronger than testing
fixed raw/prefix/reverse output coordinates.

Inputs:
- Cases: `ex286,ex287,ex288,ex289`
- Truth files: `benchmarks/<case>.truth`
- Script: `student/generators/unknown_output_linear_anf_diag.py`

Artifacts:
- Work directory: `student/work/ex286_ex289_frontend_output_linear_anf_highdeg_20260609_1909`
- Results directory: `student/runs/unknown/ex286_ex289_frontend_output_linear_anf_highdeg_20260609_1909/results`
- Results: `results/summary.csv`, `results/basis.csv`

Methods tried:
- Word-level Mobius transform of the multi-output truth table.
- Nullspace of all output coefficient vectors above each target degree `5,6,7,8`.

Notes:
- Diagnostic only; no Verilog/AIG candidates emitted unless a high-dimensional
  low-degree output basis appears in a later run.
- `student/seeds` and `output/` are intentionally untouched.
