# ex223_ex224_frontend_fp16_bitlogic4_20260606_2354

Run ID: `ex223_ex224_frontend_fp16_bitlogic4_20260606_2354`

Purpose: targeted combination run after `bitlogic3`, testing whether the best
local sign and high-bit covers can be combined without losing table sharing.

Inputs:
- Truth files: `benchmarks/ex223.truth`, `benchmarks/ex224.truth`
- Generator: `student/generators/fp16_log_bitrun_hybrid.py`
- Prior run: `ex223_ex224_frontend_fp16_bitlogic3_20260606_2344`

Artifacts:
- Work directory: `student/work/ex223_ex224_frontend_fp16_bitlogic4_20260606_2354/`
- Candidates CSV: `student/runs/fp16/ex223_ex224_frontend_fp16_bitlogic4_20260606_2354/results/candidates.csv`
- Best CSV: `student/runs/fp16/ex223_ex224_frontend_fp16_bitlogic4_20260606_2354/results/best.csv`
- Summary CSV: `student/runs/fp16/ex223_ex224_frontend_fp16_bitlogic4_20260606_2354/results/summary.csv`
- Evaluate check CSV: `student/runs/fp16/ex223_ex224_frontend_fp16_bitlogic4_20260606_2354/results/evaluate_check.csv`

Methods tried:
- `casez_sign` combined with bit14, bit12, bit11, bit9, and selected multi-bit
  run covers.
- Non-sign bit combinations around ex224 bits11, 12, and 9.

Best result:
- `ex224`: `casez_sign_bits11_12_t8`, `6250/21/131250`, equivalent;
  official `evaluate.py` recheck OK.
- `ex223`: no improvement over `bitlogic3`; `casez_sign` remains best.

Notes:
- `ex224` improved from `132972` to `131250` ADP by overriding output sign and
  only bits12 and 11.
- Adding bit9 to the best structure lost; `bit12+bit9` without sign was close
  but still worse at `131775`.
