# ex230-ex234 FP16 Frontend Attempts

Setup note: this file is the group-level log for FP16 sigmoid/reciprocal/square/sqrt cases.
Detailed case work should still be recorded in each `exNNN/frontend_attempts.md`.

Current known run:
- `student/runs/fp16/ex220_ex239_semantic_20260604/`

Cases:
- `ex230`: `fp16_sigmoid`, current best `sign_exp_mant_case`, ratio `1.364457`.
- `ex231`: `fp16_reciprocal`, current best `positive_default_exp_mant_case`, ratio `1.481729`.
- `ex232`: `fp16_square`, current best `positive_default_exp_mant_delta`, ratio `1.732751`.
- `ex233`: `fp16_sqrt`, current best `positive_default_exp_mant_case`, ratio `1.529295`.
- `ex234`: `fp16_reciprocal_square`, current best `sign_pair_case`, ratio `1.487951`.

Group strategy:
- For sigmoid, try constant defaults and local transition LUTs.
- For reciprocal and reciprocal-square, test special-case guards plus exponent
  arithmetic and local mantissa LUTs.
- `ex232` and `ex233` are above 1.5x reference; prioritize true exponent
  arithmetic and selected-bit boundary formulas.
