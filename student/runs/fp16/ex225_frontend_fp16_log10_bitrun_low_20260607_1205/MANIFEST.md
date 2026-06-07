# ex225_frontend_fp16_log10_bitrun_low_20260607_1205

Run ID: `ex225_frontend_fp16_log10_bitrun_low_20260607_1205`

Purpose: Follow-up single-bit check for lower output bits of `ex225` FP16
`log10`, after bit 11 improved the current best.

Inputs:
- Truth file: `benchmarks/ex225.truth`
- Generator/script: `student/generators/fp16_log_bitrun_hybrid.py`

Artifacts:
- Candidates CSV:
  `student/runs/fp16/ex225_frontend_fp16_log10_bitrun_low_20260607_1205/results/candidates.csv`
- Best CSV:
  `student/runs/fp16/ex225_frontend_fp16_log10_bitrun_low_20260607_1205/results/best.csv`
- Metadata CSV:
  `student/runs/fp16/ex225_frontend_fp16_log10_bitrun_low_20260607_1205/results/metadata.csv`

Methods tried:
- `bitrun_bit10_t16`
- `bitrun_bit9_t32`
- `bitrun_bit8_t64`
- `bitrun_bit7_t64`

Best result:
- `bitrun_bit8_t64`: exact, `267030`, better than the old baseline but worse
  than `bitrun_bit11_t8` at `266179`.

Notes:
- Low-bit single covers do not beat the current bit 11 cover.
