# ex223_ex224_frontend_fp16_log_signsplit_20260606_2305

Run ID: `ex223_ex224_frontend_fp16_log_signsplit_20260606_2305`

Purpose: remove signed add plus absolute-value logic from fixed-point semantic
RTL by using input exponent to choose add/sub sign directly.

Artifacts:
- Work directory: `student/work/ex223_ex224_frontend_fp16_log_signsplit_20260606_2305/`
- Results: `student/runs/fp16/ex223_ex224_frontend_fp16_log_signsplit_20260606_2305/results/`

Best result:
- `ex223`: `signsplit_q20_exc`, `380654` ADP.
- `ex224`: `signsplit_q18_exc`, `183800` ADP.

Notes:
- Exact, but not an improvement.  The bottleneck is not only signed absolute
  value; normalization and q-LUT arithmetic remain deep.
