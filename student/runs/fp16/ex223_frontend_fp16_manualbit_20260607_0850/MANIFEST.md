# ex223_frontend_fp16_manualbit_20260607_0850

Run ID: `ex223_frontend_fp16_manualbit_20260607_0850`

Purpose: Test a hand-derived `ex223` output bit14 predicate combined with the
current casez sign override.

Inputs:
- Truth file: `benchmarks/ex223.truth`
- Generator: `student/generators/fp16_log_bitrun_hybrid.py`

Artifacts:
- Work directory: `student/work/ex223_frontend_fp16_manualbit_20260607_0850/`
- Candidates CSV: `student/runs/fp16/ex223_frontend_fp16_manualbit_20260607_0850/results/candidates.csv`
- Best CSV: `student/runs/fp16/ex223_frontend_fp16_manualbit_20260607_0850/results/best.csv`
- Summary CSV: `student/runs/fp16/ex223_frontend_fp16_manualbit_20260607_0850/results/summary.csv`

Best result:
- `manual_ex223_sign_bit14`: `11191/23/257393`, equivalent.

Notes:
- The hand predicate is exact but raises delay, so current best remains
  `casez_sign`, `11189/22/246158`.

