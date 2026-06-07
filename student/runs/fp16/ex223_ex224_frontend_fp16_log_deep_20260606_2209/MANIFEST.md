# ex223_ex224_frontend_fp16_log_deep_20260606_2209

Run ID: `ex223_ex224_frontend_fp16_log_deep_20260606_2209`

Purpose: deep semantic fixed-point reconstruction for FP16 `log` and `log2`.
This run models positive normal inputs as exponent base plus mantissa log
correction, then rounds back to FP16.

Artifacts:
- Work directory: `student/work/ex223_ex224_frontend_fp16_log_deep_20260606_2209/`
- Results: `student/runs/fp16/ex223_ex224_frontend_fp16_log_deep_20260606_2209/results/`
- Combined ex223/ex224 comparison:
  `results/combined_summary_ex223_ex224.csv`

Methods tried:
- Calibrated fixed-point correction LUTs for `log2` Q18-Q21.
- Calibrated fixed-point correction LUTs for natural `log` Q20-Q23.
- Low-Q variants used a small number of exact truth-derived exception patches.

Best result:
- `ex223`: `fixed_q20_calibrated_exc`, `4382/79/346178`.
- `ex224`: `fixed_q18_calibrated_exc`, `3617/49/177233`.

Notes:
- These candidates expose the semantic internal structure and have much lower
  area than the baseline table, especially `ex224`.
- Delay is too high because fixed-point add/round/normalization creates a long
  combinational chain.
- Combined best across all follow-up runs remains the prior
  `sign_exp_mant_case`.
