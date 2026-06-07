# ex224_frontend_fp16_bitlogic5_20260607_0001

Run ID: `ex224_frontend_fp16_bitlogic5_20260607_0001`

Purpose: focused ex224 follow-up testing whether bit10, bit7, or larger
high-bit combinations can improve on `casez_sign_bits11_12_t8`.

Inputs:
- Truth file: `benchmarks/ex224.truth`
- Generator: `student/generators/fp16_log_bitrun_hybrid.py`
- Prior best: `ex224_fp16_log2_casez_sign_bits11_12_t8`

Artifacts:
- Work directory: `student/work/ex224_frontend_fp16_bitlogic5_20260607_0001/`
- Candidates CSV: `student/runs/fp16/ex224_frontend_fp16_bitlogic5_20260607_0001/results/candidates.csv`
- Best CSV: `student/runs/fp16/ex224_frontend_fp16_bitlogic5_20260607_0001/results/best.csv`
- Summary CSV: `student/runs/fp16/ex224_frontend_fp16_bitlogic5_20260607_0001/results/summary.csv`

Methods tried:
- bit7 single-bit cover.
- bit10 combinations with bits11/12/9.
- `casez_sign` combinations including bit10.

Best result:
- Best in this run: `casez_sign_bits10_11_t16`, `6284/21/131964`,
  equivalent.
- It did not beat `casez_sign_bits11_12_t8`.

Notes:
- bit10 and bit7 should not be added to the current best structure under the
  current Yosys flow.
