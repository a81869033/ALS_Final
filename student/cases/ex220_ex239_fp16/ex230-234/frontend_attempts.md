# ex230-ex234 FP16 Frontend Attempts

Setup note: this file is the group-level log for FP16 sigmoid/reciprocal/square/sqrt cases.
Detailed case work should still be recorded in each `exNNN/frontend_attempts.md`.

Current curated seed bundle:
- `student/seeds/fp16/ex230_ex234_frontend_fp16_current_20260607_1853/`

Cases:
- `ex230`: `fp16_sigmoid` family, current best
  `ex230_exp_mant_pair_case_abc_g_aig`, `6969/20/139380`, ratio `1.286743`.
- `ex231`: exact `fp16_reciprocal`, current best
  `ex231_nested_bits9_hi6_abc_g_aig`, `1163/14/16282`, ratio `1.157543`.
- `ex232`: exact `fp16_square`, current best
  `ex232_exp_formula_hi9_8_low8_nested_hi6_abc_g_aig`, `1240/13/16120`,
  ratio `1.203704`.
- `ex233`: exact `fp16_sqrt`, current best
  `ex233_nested_bits9_8_hi6_abc_g_aig`, `1530/15/22950`, ratio `1.137603`.
- `ex234`: exact `fp16_reciprocal_square`, current best
  `ex234_nested_bits9_8_hi5_abc_g_aig`, `1351/17/22967`, ratio `1.475933`.

Group strategy:
- For sigmoid, try constant defaults and local transition LUTs.
- For reciprocal and reciprocal-square, test special-case guards plus exponent
  arithmetic and local mantissa LUTs.
- `ex232` is now within 1.5x reference after the deep square follow-up.

## 2026-06-07 Focused Pass

Run family:
- Diagnosis and semantic checks:
  `student/runs/fp16/ex230_ex234_frontend_fp16_semantic_20260607_1853/`
- Current-best synthflow check:
  `student/runs/fp16/ex230_ex234_frontend_fp16_synthflow_20260607_1853/`
- Arithmetic/field-default shell checks:
  `student/runs/fp16/ex231_ex234_frontend_fp16_arith_20260607_1853/`
  and
  `student/runs/fp16/ex230_ex234_frontend_fp16_fielddefaults_20260607_1853/`
- Old-row `abc -g aig` reuse:
  `student/runs/fp16/ex232_ex233_frontend_fp16_oldrows_abcg_20260607_1853/`
  and
  `student/runs/fp16/ex230_ex231_ex234_frontend_fp16_oldrows_abcg_20260607_1853/`
- Selected-bit follow-up:
  `student/runs/fp16/ex232_ex233_frontend_fp16_bitrun_20260607_1853/`
  and
  `student/runs/fp16/ex232_ex233_frontend_fp16_bitrun_abcg_20260607_1853/`

Results:
- All five curated AIGs were rechecked with official `evaluate.py --case`.
- `ex230` improved from `7038/21/147798` to `6969/20/139380` by applying
  `abc -g aig` to the existing exp/mant pair-case seed.  Direct Python
  DAZ/FTZ/RNE sigmoid did not exact-match the table, first mismatch at
  `0x1a00`, so keep it as sigmoid-family structural/semantic-hybrid.
- `ex231` improved from `1226/17/20842` to `1286/16/20576`.  Area rose, but
  the delay drop won ADP.  Exact reciprocal semantics matched.
- `ex232` first improved from `1365/17/23205` to `1343/16/21488` using a
  bits12/9 vector-cover seed plus `abc -g aig`, then improved again to
  `1240/13/16120` with a square-specific semantic structure:
  sign-free exponent formula, mantissa bits9/8 run trees, and a nested
  hi6/lo4 LUT for mantissa low8.
- `ex233` improved from `1714/18/30852` to `1674/17/28458` using a
  bits14/13/12/9 vector-cover seed plus `abc -g aig`, bringing it within
  1.5x reference.
- `ex234` improved from `1362/17/23154` to `1355/17/23035` through
  `abc -g aig` on the sign-pair seed, keeping it within 1.5x reference.

Excluded or deprioritized:
- Broad field-default variants did not beat the curated bests.
- Re-synthesizing all older rows found better sources for ex230/ex231/ex234
  and was useful once, but should not be repeated blindly.
- Ex232 bitvec neighbor sets around bits12/9 were close but did not beat the
  square-specific nested hi6 structure; future ex232 work should not return to
  broad selected-bit sweeps without a new low-bit arithmetic insight.

## 2026-06-07 ex232 Deep Square Follow-Up

- Run: `student/runs/fp16/ex232_frontend_fp16_square_deep_20260607_1940/`
- Curated seed:
  `student/seeds/fp16/ex232_frontend_fp16_square_deep_current_20260607_1940/`
- New ex232 best: `1240/13/16120`, ratio `1.203704`.
- Key structural lesson: square is much smaller when represented as
  `out_exp = 2*exp - 15 + (mant >= 424)` and a mantissa-only normalized square
  mapping.  The winning source keeps mantissa bits9/8 as run trees and emits
  low8 with nested `mant[9:4]` / `mant[3:0]` cases.

## 2026-06-07 Applying ex232 Lesson Before ex235

- Run:
  `student/runs/fp16/ex231_ex233_ex234_frontend_fp16_power_nested_20260607_2027/`
- Curated seed:
  `student/seeds/fp16/ex231_ex233_ex234_frontend_fp16_power_nested_current_20260607_2027/`
- Results:
  - `ex231`: `1286/16/20576` -> `1163/14/16282`.
  - `ex233`: `1674/17/28458` -> `1530/15/22950`.
  - `ex234`: `1355/17/23035` -> `1351/17/22967`.
- Suitability conclusion:
  - `ex231` reciprocal and `ex234` reciprocal-square have mantissa-only
    correction tables after exponent formula extraction.
  - `ex233` sqrt needs exponent parity classes, but the same high-bit run
    tree plus nested low LUT idea applies.
  - `ex230` sigmoid is not suitable for this power-family trick.
