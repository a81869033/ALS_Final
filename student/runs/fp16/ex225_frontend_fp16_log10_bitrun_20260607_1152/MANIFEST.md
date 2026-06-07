# ex225_frontend_fp16_log10_bitrun_20260607_1152

Run ID: `ex225_frontend_fp16_log10_bitrun_20260607_1152`

Purpose: Targeted selected-bit follow-up for `ex225` FP16 `log10`, after
special-shell and casez run compression both lost QoR.

Inputs:
- Truth file: `benchmarks/ex225.truth`
- Generator/script: `student/generators/fp16_log_bitrun_hybrid.py`

Artifacts:
- Candidates CSV:
  `student/runs/fp16/ex225_frontend_fp16_log10_bitrun_20260607_1152/results/candidates.csv`
- Best CSV:
  `student/runs/fp16/ex225_frontend_fp16_log10_bitrun_20260607_1152/results/best.csv`
- Metadata CSV:
  `student/runs/fp16/ex225_frontend_fp16_log10_bitrun_20260607_1152/results/metadata.csv`

Methods tried:
- `casez_sign`
- Single selected output bits: `bit14`, `bit13`, `bit12`, `bit11`
- `exp_t16`
- `casez_sign` combined with selected high bits

Best result:
- `ex225_fp16_log10_bitrun_bit11_t8`: `11573/23/266179`, equivalent.

Notes:
- Single selected bit 11 was the best source-level change.  Multi-bit and
  casez-sign combinations increased ADP, consistent with the ex223/ex224
  lesson that selected-bit improvements often do not compose.
