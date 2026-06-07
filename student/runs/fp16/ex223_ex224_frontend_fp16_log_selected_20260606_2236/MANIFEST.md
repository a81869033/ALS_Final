# ex223_ex224_frontend_fp16_log_selected_20260606_2236

Run ID: `ex223_ex224_frontend_fp16_log_selected_20260606_2236`

Purpose: selected-bit hybrid between baseline table output and fixed-point
semantic output.

Artifacts:
- Work directory: `student/work/ex223_ex224_frontend_fp16_log_selected_20260606_2236/`
- Results: `student/runs/fp16/ex223_ex224_frontend_fp16_log_selected_20260606_2236/results/`

Methods tried:
- Replaced one output bit at a time with semantic fixed-point logic.
- Replaced groups: sign/exponent, exponent-only, mantissa high, mantissa low,
  all mantissa, high byte, and low byte.

Best result:
- `ex223`: semantic sign bit only, `11258/23/258934`.
- `ex224`: semantic sign bit only, `6337/22/139414`.

Notes:
- Sign-bit replacement is close but still worse than baseline.
- Exponent and mantissa semantic bits keep too much arithmetic depth after
  flattening.
