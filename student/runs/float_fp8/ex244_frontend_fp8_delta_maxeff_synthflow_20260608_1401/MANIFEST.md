# ex244_frontend_fp8_delta_maxeff_synthflow_20260608_1401

Run ID: `ex244_frontend_fp8_delta_maxeff_synthflow_20260608_1401`

Purpose: limited Yosys synthflow check for the verified ex244 max-eff delta BDD
seed.

Inputs:
- Truth file: `benchmarks/ex244.truth`
- Seed Verilog:
  `student/work/ex240_ex244_frontend_fp8_magbdd_deltaeff_20260608_1401/ex244/verilog/ex244_semantic_hypot_delta_maxeff_bdd_expfirst.v`
- Seed result CSV:
  `student/runs/float_fp8/ex240_ex244_frontend_fp8_magbdd_deltaeff_20260608_1401/results/best.csv`
- Script: `student/scripts/yosys_synthflow_from_best_csv.py`

Artifacts:
- Work directory:
  `student/work/ex244_frontend_fp8_delta_maxeff_synthflow_20260608_1401/`
- Candidates CSV:
  `student/runs/float_fp8/ex244_frontend_fp8_delta_maxeff_synthflow_20260608_1401/results/candidates.csv`
- Best CSV:
  `student/runs/float_fp8/ex244_frontend_fp8_delta_maxeff_synthflow_20260608_1401/results/best.csv`
- Summary/evaluate check:
  `student/runs/float_fp8/ex244_frontend_fp8_delta_maxeff_synthflow_20260608_1401/results/summary.csv`
  and
  `student/runs/float_fp8/ex244_frontend_fp8_delta_maxeff_synthflow_20260608_1401/results/evaluate_check.csv`

Methods Tried:
- Re-synthesized the exact `maxc + delta` source with the standard limited
  Yosys synthflow variants and ABC gate settings.

Best Result:
- case: `ex244`
- best in this run: `307/34/10438`
- current source-run best remains: `301/34/10234`

Notes:
- This run did not improve the current best.  Keep the source-run
  `synth_preset_aig` AIG as the active ex244 seed.
