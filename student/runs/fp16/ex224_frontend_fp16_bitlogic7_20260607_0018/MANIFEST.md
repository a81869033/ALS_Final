# ex224_frontend_fp16_bitlogic7_20260607_0018

Run ID: `ex224_frontend_fp16_bitlogic7_20260607_0018`

Purpose: final small ex224 combination check around the current best, adding
bit13, bit14, or bit8 to see whether sharing changes create an improvement.

Inputs:
- Truth file: `benchmarks/ex224.truth`
- Generator: `student/generators/fp16_log_bitrun_hybrid.py`
- Prior best: `casez_sign_bits11_12_t8`

Artifacts:
- Work directory: `student/work/ex224_frontend_fp16_bitlogic7_20260607_0018/`
- Candidates CSV: `student/runs/fp16/ex224_frontend_fp16_bitlogic7_20260607_0018/results/candidates.csv`
- Best CSV: `student/runs/fp16/ex224_frontend_fp16_bitlogic7_20260607_0018/results/best.csv`
- Summary CSV: `student/runs/fp16/ex224_frontend_fp16_bitlogic7_20260607_0018/results/summary.csv`

Methods tried:
- `casez_sign_bits14_11_12_t8`
- `casez_sign_bits13_11_12_t8`
- `casez_sign_bits11_12_8_t64`
- `casez_sign_bits14_13_11_12_t8`

Best result:
- Best in this run: `casez_sign_bits14_11_12_t8`, `6273/21/131733`,
  equivalent.
- It did not beat `casez_sign_bits11_12_t8`.

Notes:
- bit13, bit14, and bit8 should be excluded from the current best combination.
