# ex223_ex224_frontend_fp16_log_ranges_20260606_2256

Run ID: `ex223_ex224_frontend_fp16_log_ranges_20260606_2256`

Purpose: balanced range-tree compression of monotonic mantissa output runs.

Artifacts:
- Work directory: `student/work/ex223_ex224_frontend_fp16_log_ranges_20260606_2256/`
- Results: `student/runs/fp16/ex223_ex224_frontend_fp16_log_ranges_20260606_2256/results/`

Methods tried:
- Balanced comparator trees for run groups under thresholds 128, 160, 256,
  400, and 700.

Best result:
- `ex223`: `balanced_ranges_t128`, `312234` ADP.
- `ex224`: `balanced_ranges_t128`, `146924` ADP.

Notes:
- Balanced trees fixed the extreme delay of the earlier linear range attempt,
  but still did not beat direct sign-exp-mant tables.
