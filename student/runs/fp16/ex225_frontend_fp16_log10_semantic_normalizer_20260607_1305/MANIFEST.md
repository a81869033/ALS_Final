# ex225_frontend_fp16_log10_semantic_normalizer_20260607_1305

Stage: frontend semantic normalizer check.

Scope:
- `ex225`

Purpose:
- Test a true `fp16_log10` semantic RTL direction: exponent base
  `(exp-bias)*log10(2)` plus a mantissa `log10(1.mant)` correction table,
  fixed-point rounding, and exact truth-table exception correction.
- This was a targeted semantic test, not a broad structural variant sweep.

Inputs:
- Generator:
  `student/generators/fp16_log_deep_semantic.py`
- Work directory:
  `student/work/ex225_frontend_fp16_log10_semantic_normalizer_20260607_1305/`

Results:
- Candidates CSV:
  `student/runs/fp16/ex225_frontend_fp16_log10_semantic_normalizer_20260607_1305/results/candidates.csv`
- Best CSV:
  `student/runs/fp16/ex225_frontend_fp16_log10_semantic_normalizer_20260607_1305/results/best.csv`
- Metadata CSV:
  `student/runs/fp16/ex225_frontend_fp16_log10_semantic_normalizer_20260607_1305/results/metadata.csv`

Outcome:
- Best exact candidate:
  `ex225_fp16_log10_fixed_q20_calibrated_exc`, `4061/73/296453`.
- The source is much lower area than the current table/bitrun seed, but the
  fixed-point normalization and exception path create a much deeper critical
  path.
- Current best remains
  `ex225_bitrun_bits12_9_t32_abc_g_aig`, `11499/22/252978`.

Exclusions:
- `fixed_q21_calibrated_exc`: exact but `313462` ADP.
- `fixed_q22_calibrated`: one mismatch without exceptions.
- `bucket_q20_constexp_exc` and `bucket_q21_constexp_exc`: exact but
  `450135` and `484570` ADP.
- `signsplit_q20_exc` and `signsplit_q21_exc`: exact but `346389` and
  `349488` ADP.
