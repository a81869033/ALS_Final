# ex223_ex224_frontend_fp16_bitvec_20260607_0050

Run ID: `ex223_ex224_frontend_fp16_bitvec_20260607_0050`

Purpose: test joint vector-bit selected covers for `ex223`/`ex224`, sharing
sign-exp decode and mantissa range trees across selected output bits.

Inputs:
- Truth files: `benchmarks/ex223.truth`, `benchmarks/ex224.truth`
- Generator: `student/generators/fp16_log_bitrun_hybrid.py`
- Prior bests:
  - `ex223`: `casez_sign`
  - `ex224`: `casez_sign_bits11_12_t8`

Artifacts:
- Work directory: `student/work/ex223_ex224_frontend_fp16_bitvec_20260607_0050/`
- Candidates CSV: `student/runs/fp16/ex223_ex224_frontend_fp16_bitvec_20260607_0050/results/candidates.csv`
- Best CSV: `student/runs/fp16/ex223_ex224_frontend_fp16_bitvec_20260607_0050/results/best.csv`
- Summary CSV: `student/runs/fp16/ex223_ex224_frontend_fp16_bitvec_20260607_0050/results/summary.csv`

Methods tried:
- `bitvec_sign_bit14_t16`
- `bitvec_sign_bits11_12_t32`
- `bitvec_bits11_12_t32`

Best result:
- `ex223`: best in this run `bitvec_bits11_12_t32`, `11185/23/257255`,
  equivalent; worse than current best.
- `ex224`: best in this run `bitvec_bits11_12_t32`, `6307/21/132447`,
  equivalent; worse than current best.

Notes:
- Joint vector covers increased boundary complexity and did not beat separate
  selected-bit covers.
