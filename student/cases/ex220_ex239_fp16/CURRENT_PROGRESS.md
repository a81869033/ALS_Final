# FP16 ex220-ex239 Current Progress

This is the quick status page for the FP16 unary-function group.

Machine-readable current known rows:

- `student/runs/fp16/ex220_ex224_frontend_fp16_semantic_20260606_2050/results/best.csv`
- `student/runs/fp16/ex220_ex224_frontend_fp16_semantic_20260606_2050/results/candidates.csv`
- `student/runs/fp16/ex220_ex224_frontend_fp16_semantic_20260606_2050/results/summary.csv`
- `student/seeds/fp16/ex223_ex224_yosys_synthflow_current/results/best.csv`
- `student/runs/fp16/ex223_ex224_frontend_fp16_bitlogic3_20260606_2344/results/best.csv`
- `student/runs/fp16/ex223_ex224_frontend_fp16_bitlogic4_20260606_2354/results/best.csv`
- `student/runs/fp16/ex220_ex239_semantic_20260604/results/best.csv`
- `student/runs/fp16/ex220_ex239_semantic_20260604/results/candidates.csv`
- `student/runs/fp16/ex220_ex239_semantic_20260604/results/summary.csv`
- `student/runs/fp16/ex220_ex239_semantic_20260604/results/semantic_gap_summary.csv`

## Directory Map

- Class notes: `student/cases/ex220_ex239_fp16/README.md`
- Per-case notes: `student/cases/ex220_ex239_fp16/exNNN/frontend_attempts.md`
- Group notes:
  - `student/cases/ex220_ex239_fp16/ex220-224/frontend_attempts.md`
  - `student/cases/ex220_ex239_fp16/ex225-229/frontend_attempts.md`
  - `student/cases/ex220_ex239_fp16/ex230-234/frontend_attempts.md`
  - `student/cases/ex220_ex239_fp16/ex235-239/frontend_attempts.md`
- Current known run registry:
  `student/runs/fp16/ex220_ex239_semantic_20260604/`
- Latest ex220-ex224 targeted run registry:
  `student/runs/fp16/ex220_ex224_frontend_fp16_semantic_20260606_2050/`

## Status Summary

- All `ex220`-`ex239` currently have exact candidates in the known FP16 run.
- Current best rows are mostly structural or semantic-hybrid; they should be
  treated as starting points for reverse engineering, not final semantic RTL.
- Latest targeted ex220-ex224 run verified 32/32 exact candidates.  It did not
  improve the previous best ADP for these cases, but it recorded additional
  semantic-shell attempts for log/log2.
- Earlier ex223-ex224 deep follow-up added 114 exact equivalent candidates
  across semantic fixed-point, selected-bit, range-tree, case-attribute, and
  casez cube-cover directions.  It did not improve best ADP at that stage.
- New Yosys synthflow seed follow-up improved both log cases:
  `ex223` is now `casez_sign_abc_g_aig`, `11148/21/234108`; `ex224` is now
  `casez_sign_bits11_12_t8_abc_g_aig`, `6219/20/124380`.  Both were rechecked
  with `evaluate.py`.
- ex225-ex229 follow-up found one more useful frontend-only knob: keep the
  best semantic/structural Verilog seed, then emit the initial AIG with the
  single Yosys `abc -g aig` path.  Official `evaluate.py` rechecked all five:
  ex225 `11499/22/252978`, ex226 `33356/22/733832`, ex227
  `40629/22/893838`, ex228 `6627/20/132540`, ex229 `3971/19/75449`.
- ex225 follow-up then improved log10 further with manual sign/bit14/bit13 plus
  shared threshold predecode for bit12/bit9: official `evaluate.py` OK at
  `11488/21/241248`.
- Within `1.5x` reference: `ex220`, `ex221`, `ex222`, `ex226`, `ex227`,
  `ex228`, `ex229`, `ex230`, `ex231`, `ex234`, `ex237`, `ex239`.
- Above `1.5x` reference and high-priority: `ex223`, `ex224`, `ex225`,
  `ex232`, `ex233`, `ex235`, `ex236`, `ex238`.

## Current Known Best By Case

| Case | Function | ADP | Ref ADP | Ratio | Status | Current best variant |
| --- | --- | ---: | ---: | ---: | --- | --- |
| ex220 | exp | 236588 | 180404 | 1.311434 | within_1p5_reference | `exp_mant_pair_case` |
| ex221 | exp2 | 146328 | 105655 | 1.384960 | within_1p5_reference | `semantic_hybrid` |
| ex222 | exp10 | 233530 | 173621 | 1.345056 | within_1p5_reference | `positive_default_exp_mant_case` |
| ex223 | log | 234108 | 120549 | 1.942015 | above_1p5_reference | `casez_sign_abc_g_aig` |
| ex224 | log2 | 124380 | 64708 | 1.922173 | above_1p5_reference | `casez_sign_bits11_12_t8_abc_g_aig` |
| ex225 | log10 | 241248 | 116676 | 2.067675 | above_1p5_reference | `ex225_manual15_14_13_predecode12_9_abc_g_aig` |
| ex226 | sin | 733832 | 587790 | 1.248459 | within_1p5_reference | `positive_default_exp_mant_case_abc_g_aig` |
| ex227 | tan | 893838 | 721639 | 1.238622 | within_1p5_reference | `positive_default_exp_mant_case_abc_g_aig` |
| ex228 | sinh | 132540 | 101205 | 1.309619 | within_1p5_reference | `semantic_sign_exp_field_defaults_abc_g_aig` |
| ex229 | tanh | 75449 | 57968 | 1.301563 | within_1p5_reference | `semantic_positive_field_defaults_abc_g_aig` |
| ex230 | sigmoid | 147798 | 108320 | 1.364457 | within_1p5_reference | `sign_exp_mant_case` |
| ex231 | reciprocal | 20842 | 14066 | 1.481729 | within_1p5_reference | `positive_default_exp_mant_case` |
| ex232 | square | 23205 | 13392 | 1.732751 | above_1p5_reference | `positive_default_exp_mant_delta` |
| ex233 | sqrt | 30852 | 20174 | 1.529295 | above_1p5_reference | `positive_default_exp_mant_case` |
| ex234 | reciprocal_square | 23154 | 15561 | 1.487951 | within_1p5_reference | `sign_pair_case` |
| ex235 | reciprocal_sqrt | 32058 | 20800 | 1.541250 | above_1p5_reference | `semantic_sign_exp_field_defaults` |
| ex236 | cube | 26792 | 17290 | 1.549566 | above_1p5_reference | `positive_default_exp_mant_delta` |
| ex237 | cbrt | 35766 | 25440 | 1.405896 | within_1p5_reference | `positive_default_exp_mant_case` |
| ex238 | reciprocal_cube | 26860 | 16549 | 1.623059 | above_1p5_reference | `exp_mant_pair_case` |
| ex239 | reciprocal_cbrt | 38532 | 25965 | 1.483998 | within_1p5_reference | `semantic_arith_fields` |

## Follow-Up Priorities

- `ex223`/`ex224`: bit-level sign/exponent covers improved the current best,
  but both remain far from reference.  Avoid repeating broad table reshapes;
  future work should either find a shallow arithmetic normalizer or a better
  per-output-bit PLA/cover for the next critical bits.
- `ex225`: log10 improved through selected output bits 12 and 9 plus
  `abc -g aig`, then improved again through manual bit14 plus shared bit12/9
  vector cover.  It remains far from reference.  Prioritize a true shallow
  exponent-base plus mantissa-correction semantic decomposition or a shallower
  exact bit9 transition structure; avoid broad interval casez compression,
  which was exact but worse.
  A fixed-point exponent-base plus mantissa-correction normalizer was tested
  and exact, but `abc_g_aig` still gave only `4028/70/281960`, so future work
  must make that normalizer much shallower rather than only changing q width.
- `ex232`/`ex236`/`ex238`: arithmetic power-family cases likely need better
  exponent arithmetic and selected-bit or exception formulas.
- `ex233`/`ex235`: sqrt-family cases need special-case and local mantissa LUT
  review.
- `ex220`-`ex222`, `ex226`-`ex231`, `ex234`, `ex237`, and `ex239` are
  currently within 1.5x reference but still need true semantic RTL notes before
  treating them as settled.
