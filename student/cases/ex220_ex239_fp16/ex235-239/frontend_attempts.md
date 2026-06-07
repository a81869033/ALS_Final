# ex235-ex239 FP16 Frontend Attempts

Setup note: this file is the group-level log for FP16 reciprocal-sqrt/cube/cbrt family cases.
Detailed case work should still be recorded in each `exNNN/frontend_attempts.md`.

Current known run:
- `student/runs/fp16/ex220_ex239_semantic_20260604/`

Cases:
- `ex235`: `fp16_reciprocal_sqrt`, current best `semantic_sign_exp_field_defaults`, ratio `1.541250`.
- `ex236`: `fp16_cube`, current best `positive_default_exp_mant_delta`, ratio `1.549566`.
- `ex237`: `fp16_cbrt`, current best `positive_default_exp_mant_case`, ratio `1.405896`.
- `ex238`: `fp16_reciprocal_cube`, current best `exp_mant_pair_case`, ratio `1.623059`.
- `ex239`: `fp16_reciprocal_cbrt`, current best `semantic_arith_fields`, ratio `1.483998`.

Group strategy:
- Preserve `ex236` targeted-exception learning: a single semantic exception may
  beat another broad template family.
- For cube/reciprocal-cube, test exponent arithmetic plus mantissa delta before
  full structural tables.
- For cbrt/reciprocal-cbrt, inspect exponent modulo behavior and sign symmetry,
  but measure whether modulo tables add too much decoder depth.
