# ex223_ex224_frontend_fp16_specialshell_current_20260607_0925

Run ID: `ex223_ex224_frontend_fp16_specialshell_current_20260607_0925`

Purpose: Test special-case shells around positive-normal tables combined with
the current selected-bit hybrids.

Inputs:
- Truth files: `benchmarks/ex223.truth`, `benchmarks/ex224.truth`
- Generator: `student/generators/fp16_log_bitrun_hybrid.py`

Artifacts:
- Work directory: `student/work/ex223_ex224_frontend_fp16_specialshell_current_20260607_0925/`
- Candidates CSV: `student/runs/fp16/ex223_ex224_frontend_fp16_specialshell_current_20260607_0925/results/candidates.csv`
- Best CSV: `student/runs/fp16/ex223_ex224_frontend_fp16_specialshell_current_20260607_0925/results/best.csv`
- Summary CSV: `student/runs/fp16/ex223_ex224_frontend_fp16_specialshell_current_20260607_0925/results/summary.csv`

Best result:
- `ex223 special_casez_sign`: `11193/25/279825`, equivalent.
- `ex224 special_casez_sign_bits11_12`: `6309/22/138798`, equivalent.

Notes:
- Special shells were exact but worse for both cases; keep current full
  sign-exp table structure.

