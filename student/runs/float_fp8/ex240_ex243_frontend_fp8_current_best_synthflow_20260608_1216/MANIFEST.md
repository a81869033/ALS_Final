# ex240_ex243_frontend_fp8_current_best_synthflow_20260608_1216

Run ID: `ex240_ex243_frontend_fp8_current_best_synthflow_20260608_1216`

Purpose: limited Yosys synthflow check for current ex240-ex243 FP8 frontend
best seeds.  This is frontend synthesis/verification only, not a backend
portfolio.

Inputs:
- Current best rows from `student/results/current_best_by_case.csv`
- Truth files: `benchmarks/ex240.truth` through `benchmarks/ex243.truth`

Artifacts:
- Work directory:
  `student/work/ex240_ex243_frontend_fp8_current_best_synthflow_20260608_1216/`
- Candidates CSV:
  `student/runs/float_fp8/ex240_ex243_frontend_fp8_current_best_synthflow_20260608_1216/results/candidates.csv`
- Best CSV:
  `student/runs/float_fp8/ex240_ex243_frontend_fp8_current_best_synthflow_20260608_1216/results/best.csv`

Methods tried:
- Default project Yosys flow, no-internal-abc, delay-target variants,
  alternate gate sets, extra opt/share, late flatten, and synth preset variants.

Best result:
- ex240: rechecked current best `1404/56/78624`; no improvement.
- ex241: best in this run `1058/25/26450`, worse than current `1033/25/25825`.
- ex242: best in this run `1076/25/26900`, worse than current `1028/25/25700`.
- ex243: rechecked current best `5746/25/143650`; no improvement.

Notes:
- Broad Yosys synthflow changes are not the next useful direction for these
  sources; further gains need source-level arithmetic/exception structure.
