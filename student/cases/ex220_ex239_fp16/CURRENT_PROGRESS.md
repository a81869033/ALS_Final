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
- `student/seeds/fp16/ex235_ex239_frontend_fp16_current_20260608_1055/results/best.csv`
- `student/runs/fp16/ex235_ex239_frontend_fp16_final_current_20260608_1055/results/best.csv`

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
- ex230-ex234 follow-up improved all five current bests and created curated
  seed bundle
  `student/seeds/fp16/ex230_ex234_frontend_fp16_current_20260607_1853/`.
  Official `evaluate.py` rechecked all five: ex230 `6969/20/139380`, ex231
  `1286/16/20576`, ex232 `1343/16/21488`, ex233 `1674/17/28458`, ex234
  `1355/17/23035`.
- ex232 deep square follow-up then found the true shallow structure:
  sign-free exponent formula, mantissa bits9/8 run trees, and nested hi6/lo4
  low8 mantissa LUT.  New official `evaluate.py` best is
  `1240/13/16120`.
- Applying the same power-family lesson to prior cases improved ex231, ex233,
  and ex234 with official `evaluate.py` OK:
  ex231 `1163/14/16282`, ex233 `1530/15/22950`, ex234 `1351/17/22967`.
- Applying the nested mantissa lesson to log-family ex223/ex224/ex225 produced
  new official `evaluate.py` bests:
  ex223 `10753/19/204307`, ex224 `6014/16/96224`, ex225 `11533/19/219127`.
  ex224 is now within `1.5x` reference.
- ex235-ex239 follow-up applied the nested/open-structure lesson to
  reciprocal-sqrt/cube/cbrt-family cases.  Official `evaluate.py` OK for all
  five current curated seeds:
  ex235 `1628/14/22792`, ex236 `1432/15/21480`, ex237 `1889/16/30224`,
  ex238 `1502/15/22530`, ex239 `2026/16/32416`.
- A direct semantic-special follow-up improved ex235, ex237, and ex239 by
  replacing full inactive special tables with source-level zero/inf/NaN guards.
  The ratio threshold is only a status marker; future work should keep pushing
  ADP toward reference whenever a real semantic structure is available.
- A core-boundary follow-up improved ex236 and ex238 by splitting the exact
  arithmetic core from the two irregular boundary exponent groups.
- A later core-clamp follow-up improved ex236 again by replacing those boundary
  tables with exact shallow underflow/overflow predicates.
- Within `1.5x` reference: `ex220`, `ex221`, `ex222`, `ex224`, `ex226`,
  `ex227`, `ex228`, `ex229`, `ex230`, `ex231`, `ex232`, `ex233`, `ex234`,
  `ex235`, `ex236`, `ex237`, `ex238`, `ex239`.
- Above `1.5x` reference and high-priority: `ex223`, `ex225`.

## Current Known Best By Case

| Case | Function | ADP | Ref ADP | Ratio | Status | Current best variant |
| --- | --- | ---: | ---: | ---: | --- | --- |
| ex220 | exp | 236588 | 180404 | 1.311434 | within_1p5_reference | `exp_mant_pair_case` |
| ex221 | exp2 | 146328 | 105655 | 1.384960 | within_1p5_reference | `semantic_hybrid` |
| ex222 | exp10 | 233530 | 173621 | 1.345056 | within_1p5_reference | `positive_default_exp_mant_case` |
| ex223 | log | 204307 | 120549 | 1.694805 | above_1p5_reference | `ex223_log_nested_low11_hi5_abc_g_aig` |
| ex224 | log2 | 96224 | 64708 | 1.487050 | within_1p5_reference | `ex224_log_nested_low12_hi6_abc_g_aig` |
| ex225 | log10 | 219127 | 116676 | 1.878081 | above_1p5_reference | `ex225_log_nested_low12_hi5_abc_g_aig` |
| ex226 | sin | 733832 | 587790 | 1.248459 | within_1p5_reference | `positive_default_exp_mant_case_abc_g_aig` |
| ex227 | tan | 893838 | 721639 | 1.238622 | within_1p5_reference | `positive_default_exp_mant_case_abc_g_aig` |
| ex228 | sinh | 132540 | 101205 | 1.309619 | within_1p5_reference | `semantic_sign_exp_field_defaults_abc_g_aig` |
| ex229 | tanh | 75449 | 57968 | 1.301563 | within_1p5_reference | `semantic_positive_field_defaults_abc_g_aig` |
| ex230 | sigmoid | 139380 | 108320 | 1.286743 | within_1p5_reference | `ex230_exp_mant_pair_case_abc_g_aig` |
| ex231 | reciprocal | 16282 | 14066 | 1.157543 | within_1p5_reference | `ex231_nested_bits9_hi6_abc_g_aig` |
| ex232 | square | 16120 | 13392 | 1.203704 | within_1p5_reference | `ex232_exp_formula_hi9_8_low8_nested_hi6_abc_g_aig` |
| ex233 | sqrt | 22950 | 20174 | 1.137603 | within_1p5_reference | `ex233_nested_bits9_8_hi6_abc_g_aig` |
| ex234 | reciprocal_square | 22967 | 15561 | 1.475933 | within_1p5_reference | `ex234_nested_bits9_8_hi5_abc_g_aig` |
| ex235 | reciprocal_sqrt | 22792 | 20800 | 1.095769 | within_1p5_reference | `ex235_direct_special_low8_hi6_synth_preset` |
| ex236 | cube | 21480 | 17290 | 1.242337 | within_1p5_reference | `ex236_core_clamp_hi6_abc_g_aig` |
| ex237 | cbrt | 30224 | 25440 | 1.188050 | within_1p5_reference | `ex237_direct_special_low10_hi6_synth_preset` |
| ex238 | reciprocal_cube | 22530 | 16549 | 1.361412 | within_1p5_reference | `ex238_core_boundary_low12_hi6_synth_preset` |
| ex239 | reciprocal_cbrt | 32416 | 25965 | 1.248450 | within_1p5_reference | `ex239_direct_special_low7_hi6_abc_g_aig` |

## Follow-Up Priorities

- `ex223`: nested positive-normal low11/hi5 mantissa structure improved the
  current best, but the case remains above `1.5x`; next work should look for a
  shallow arithmetic normalizer or compress the nested low table.
- `ex224`: nested positive-normal low12/hi6 mantissa structure is now within
  `1.5x`; avoid repeating old broad casez/selected-bit table reshapes.
- `ex225`: log10 improved through selected output bits 12/9, shared predecode,
  and now nested low12/hi5 mantissa structure.  It remains far from reference.
  Prioritize a true shallow exponent-base plus mantissa-correction semantic
  decomposition; avoid broad interval casez compression, which was exact but
  worse.
  A fixed-point exponent-base plus mantissa-correction normalizer was tested
  and exact, but `abc_g_aig` still gave only `4028/70/281960`, so future work
  must make that normalizer much shallower rather than only changing q width.
- `ex238`: core-boundary structure moved this case within `1.5x`; next useful
  work should compress exp9/exp19 boundary tables or derive shallow exact
  boundary rounding predicates.  Do not repeat b11/b8/b7 selected expansions or
  generic synthflow sweeps.
- `ex235`/`ex236`/`ex237`/`ex239`: all have verified current seeds, but do not
  treat the ratio threshold as a stopping criterion.  Revisit them only with a
  new semantic mantissa formula or another source-level simplification like the
  direct-special rewrite; avoid more broad table or blind hi/lo cut-point
  variants.
- `ex220`-`ex222`, `ex226`-`ex231`, `ex233`, `ex234`, `ex237`, and `ex239` are
  currently within 1.5x reference but still need true semantic RTL notes before
  treating them as settled.
