# ex224_frontend_fp16_manualbit_20260607_0855

Run ID: `ex224_frontend_fp16_manualbit_20260607_0855`

Purpose: Test hand-derived `ex224` bit14 logic combined with current sign and
bit11/bit12 selected-bit overrides.

Inputs:
- Truth file: `benchmarks/ex224.truth`
- Generator: `student/generators/fp16_log_bitrun_hybrid.py`

Artifacts:
- Work directory: `student/work/ex224_frontend_fp16_manualbit_20260607_0855/`
- Candidates CSV: `student/runs/fp16/ex224_frontend_fp16_manualbit_20260607_0855/results/candidates.csv`
- Best CSV: `student/runs/fp16/ex224_frontend_fp16_manualbit_20260607_0855/results/best.csv`
- Summary CSV: `student/runs/fp16/ex224_frontend_fp16_manualbit_20260607_0855/results/summary.csv`

Best result:
- `manual_ex224_sign_bits11_12_bit14`: `6286/22/138292`, equivalent.

Notes:
- Hand bit14 logic is exact but disrupts current table sharing and raises
  delay to `22`.

