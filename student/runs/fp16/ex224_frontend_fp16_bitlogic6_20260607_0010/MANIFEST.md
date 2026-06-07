# ex224_frontend_fp16_bitlogic6_20260607_0010

Run ID: `ex224_frontend_fp16_bitlogic6_20260607_0010`

Purpose: hand-derived ex224 `log2` threshold-expression experiment for output
bits11 and 12.

Inputs:
- Truth file: `benchmarks/ex224.truth`
- Generator: `student/generators/fp16_log_bitrun_hybrid.py`

Artifacts:
- Work directory: `student/work/ex224_frontend_fp16_bitlogic6_20260607_0010/`
- Candidates CSV: `student/runs/fp16/ex224_frontend_fp16_bitlogic6_20260607_0010/results/candidates.csv`
- Best CSV: `student/runs/fp16/ex224_frontend_fp16_bitlogic6_20260607_0010/results/best.csv`
- Summary CSV: `student/runs/fp16/ex224_frontend_fp16_bitlogic6_20260607_0010/results/summary.csv`

Methods tried:
- Direct hand-written threshold formulas for bit12 and bit11.
- Same formulas with and without `casez_sign`.

Best result:
- Best in this run: `manual_log2_bits11_12`, `6305/22/138710`,
  equivalent.

Notes:
- The hand formulas were exact but much worse than generated run-tree covers.
- Do not assume comparator threshold formulas improve AIG QoR without
  measurement.
