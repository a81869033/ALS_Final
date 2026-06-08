# ex244_frontend_fp8_hypot_sig_threshold_synthflow_20260608_1216

Run ID: `ex244_frontend_fp8_hypot_sig_threshold_synthflow_20260608_1216`

Purpose: limited Yosys synthflow check for the new ex244 sig/gap threshold
hypot seed.  This is frontend synthesis/verification only, not a backend
portfolio.

Inputs:
- Truth file: `benchmarks/ex244.truth`
- Seed Verilog:
  `student/work/ex244_frontend_fp8_hypot_sig_threshold_fix_20260608_1216/ex244/verilog/ex244_semantic_hypot_sig_gap_threshold.v`

Artifacts:
- Work directory:
  `student/work/ex244_frontend_fp8_hypot_sig_threshold_synthflow_20260608_1216/`
- Candidates CSV:
  `student/runs/float_fp8/ex244_frontend_fp8_hypot_sig_threshold_synthflow_20260608_1216/results/candidates.csv`
- Best CSV:
  `student/runs/float_fp8/ex244_frontend_fp8_hypot_sig_threshold_synthflow_20260608_1216/results/best.csv`

Methods tried:
- Default project Yosys flow, no-internal-abc, delay-target variants,
  alternate gate sets, extra opt/share, late flatten, and synth preset variants.

Best result:
- `ex244_semantic_hypot_sig_gap_threshold_abc_g_aig_abc_g_aig`
- area/delay/ADP: `320/37/11840`
- equivalent: `1`

Notes:
- No synthflow improved beyond the source run's `320/37/11840`.
- The main remaining bottleneck is source critical path delay, not Yosys flow
  choice.
