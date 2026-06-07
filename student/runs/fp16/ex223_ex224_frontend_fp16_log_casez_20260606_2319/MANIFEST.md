# ex223_ex224_frontend_fp16_log_casez_20260606_2319

Run ID: `ex223_ex224_frontend_fp16_log_casez_20260606_2319`

Purpose: compress monotonic mantissa output runs into aligned `casez` cube
covers.

Artifacts:
- Work directory: `student/work/ex223_ex224_frontend_fp16_log_casez_20260606_2319/`
- Results: `student/runs/fp16/ex223_ex224_frontend_fp16_log_casez_20260606_2319/results/`

Methods tried:
- Thresholds 400, 600, 800, and 1024.

Best result:
- `ex223`: `casez_runs_t400`, `344775` ADP.
- `ex224`: `casez_runs_t400`, `156653` ADP.

Notes:
- Cube count is lower than the full table, but decoder cover is worse after
  Yosys synthesis than the direct sign-exp-mant table.
