# ex232_frontend_fp16_square_deep_synthflow_20260607_1940

Run ID: `ex232_frontend_fp16_square_deep_synthflow_20260607_1940`

Purpose: Limited Yosys synthflow neighbor check for the new ex232 deep-square
seed.

Inputs:
- Seed CSV:
  `student/runs/fp16/ex232_frontend_fp16_square_deep_20260607_1940/results/best.csv`
- Source Verilog:
  `student/work/ex232_frontend_fp16_square_deep_20260607_1940/ex232/verilog/ex232_fp16_square_exp_formula_hi9_8_low8_nested_hi6.v`

Artifacts:
- Work directory:
  `student/work/ex232_frontend_fp16_square_deep_synthflow_20260607_1940/`
- Candidates CSV:
  `student/runs/fp16/ex232_frontend_fp16_square_deep_synthflow_20260607_1940/results/candidates.csv`
- Best CSV:
  `student/runs/fp16/ex232_frontend_fp16_square_deep_synthflow_20260607_1940/results/best.csv`

Result:
- `abc_g_aig` reproduced the source-run best `1240/13/16120`.
- `abc_g_aig_d18`, `extra_opt_share`, `gates`, `cmos2`, and default recheck
  did not improve.

Notes:
- This was a limited frontend synthesis check, not a backend portfolio.
