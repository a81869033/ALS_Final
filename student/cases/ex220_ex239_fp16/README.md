# ex220-ex239 FP16 Semantic Reconstruction Notes

Purpose: track case-by-case attempts to reconstruct real semantic RTL from
truth tables, senior hints, and prior non-best Verilog seeds.

This folder is for notes only.  Generated Verilog, AIGs, logs, manifests, and
CSV results must use the run layout from `student/docs/experiment_run_workflow.md`.

For the latest all-case FP16 status, read `CURRENT_PROGRESS.md` first.  The
current known machine-readable rows are under
`student/runs/fp16/ex220_ex239_semantic_20260604/results/`.

## Senior Hints To Preserve

- FP16 input/output is a 16-bit word with sign, 5-bit exponent, and 10-bit mantissa.
- Use `student/frontends/truth.py` / ABC `read_truth -xf` indexing.  Do not assume raw truth indexing.
- Split `sign`, `exponent`, and `mantissa` first.
- Treat denormal input as zero when the truth table indicates DAZ behavior.
- Flush denormal output to zero when the truth table indicates FTZ behavior.
- Use RNE behavior: round to nearest even, including mantissa carry into exponent.
- Preserve canonical NaN behavior and handle `inf`, `zero`, negative inputs, and NaN before normal-domain arithmetic.
- FP16 mantissa has 10 bits.  Direct full mantissa LUTs can be useful locally,
  but should usually be grouped by sign/exponent or split into hi/lo tables.
- Many exponent ranges should collapse to constant, zero, inf, NaN,
  saturation, or passthrough behavior before any mantissa table is used.
- For odd functions, try sign symmetry, but keep periodic positive-domain
  output sign changes in mind.
- For reciprocal, sqrt, square, cube, cbrt, exp, log, sin, tan, sigmoid, and
  related functions, try real semantic RTL before structural tables.

Typical FP16 semantic RTL shape:

1. Split `sign`, `exponent`, and `mantissa`.
2. Classify special values and exponent ranges.
3. Apply constants, saturation, passthrough, or sign symmetry early.
4. Use local mantissa LUTs only for active exponent groups.
5. Apply RNE rounding and carry propagation.
6. Reassemble the FP16 output word.

## Current Class Strategy

The current known run already has exact candidates for all `ex220`-`ex239`,
but many best rows are still `structural_exact`.  The next FP16 work should:

1. Inspect truth facts for each case: special values, sign rule, active exponent ranges, and normal-domain mantissa relation.
2. Use prior structural Verilog only as evidence for grouping, exceptions, and corner cases.
3. Write a primary semantic hypothesis per case before generating new Verilog.
4. Prefer exponent-grouped RTL and local mantissa LUTs over broad full tables.
5. Keep only exact candidates verified by `evaluate.py`.
6. Record failed hypotheses in each case's `frontend_attempts.md`.

## README Maintenance Rule

This README is a living class-level note.  After finishing any individual FP16
case:

- Record case-specific attempts, failures, exact candidates, and QoR in that
  case's `frontend_attempts.md`.
- Promote reusable FP16-class insight into this README, such as shared
  exponent grouping, NaN/inf/zero convention, mantissa LUT split, rounding
  rule, or a direction that should not be repeated.
- Keep this README focused on lessons useful across multiple FP16 cases; put
  one-off case details in the per-case notes.

## Initial Known Status

Source: `student/runs/fp16/ex220_ex239_semantic_20260604/results/best.csv`.

| Case | Function | Current classification | Current best variant | Ratio vs reference | Priority |
| --- | --- | --- | --- | ---: | --- |
| ex220 | fp16_exp | structural_exact | exp_mant_pair_case | 1.311434 | medium |
| ex221 | fp16_exp2 | structural_exact | exp_mant_pair_case | 1.452160 | medium |
| ex222 | fp16_exp10 | structural_exact | positive_default_exp_mant_case | 1.345056 | medium |
| ex223 | fp16_log | structural_exact | sign_exp_mant_case | 2.130022 | high |
| ex224 | fp16_log2 | structural_exact | sign_exp_mant_case | 2.054955 | high |
| ex225 | fp16_log10 | synthflow_exact | ex225_manual15_14_13_predecode12_9_abc_g_aig | 2.067675 | high |
| ex226 | fp16_sin | synthflow_exact | positive_default_exp_mant_case_abc_g_aig | 1.248459 | medium |
| ex227 | fp16_tan | synthflow_exact | positive_default_exp_mant_case_abc_g_aig | 1.238622 | medium |
| ex228 | fp16_sinh | synthflow_exact | semantic_sign_exp_field_defaults_abc_g_aig | 1.309619 | medium |
| ex229 | fp16_tanh | synthflow_exact | semantic_positive_field_defaults_abc_g_aig | 1.301563 | medium |
| ex230 | fp16_sigmoid | structural_exact | sign_exp_mant_case | 1.364457 | medium |
| ex231 | fp16_reciprocal | structural_exact | positive_default_exp_mant_case | 1.481729 | medium |
| ex232 | fp16_square | structural_exact | positive_default_exp_mant_delta | 1.732751 | high |
| ex233 | fp16_sqrt | structural_exact | positive_default_exp_mant_case | 1.529295 | high |
| ex234 | fp16_reciprocal_square | structural_exact | sign_pair_case | 1.487951 | medium |
| ex235 | fp16_reciprocal_sqrt | semantic_structural_exact | ex235_open_low8_hi6_abc_g_aig | 1.134135 | medium |
| ex236 | fp16_cube | synthflow_exact | ex236_sign_only_synth_preset | 1.416773 | medium |
| ex237 | fp16_cbrt | semantic_structural_exact | ex237_open_low10_hi6_abc_g_aig | 1.216352 | medium |
| ex238 | fp16_reciprocal_cube | semantic_selected_bit_formula | ex238_b10_9_formula_expr_abc_g_aig | 1.501480 | high |
| ex239 | fp16_reciprocal_cbrt | semantic_structural_exact | ex239_open_low8_hi6_abc_g_aig | 1.262623 | medium |

## Category-Level Attempt Log

### 2026-06-06 ex220-ex224 Targeted Run

- Added `student/generators/fp16_ex220_ex224_frontend.py` for a narrow curated
  run instead of a broad FP16 sweep.
- Confirmed semantic hypotheses for the first five FP16 cases:
  `ex220=exp`, `ex221=exp2`, `ex222=exp10`, `ex223=log`, `ex224=log2`.
- Truth behavior for log/log2: zero and denormal classify to `-inf`, negative
  nonzero inputs classify to canonical NaN, positive inf maps to inf, NaN maps
  to canonical NaN, and only positive normal exponent groups require mantissa
  kernel tables.
- Tried hand-written log/log2 special-shell and positive-kernel variants.  They
  were exact but did not beat the existing `sign_exp_mant_case` source after
  Yosys AIG synthesis.
- Do not expand limited run-range compression for these log cases unless a new
  balancing idea is introduced; the first attempt produced much worse ADP.

### 2026-06-06 ex223-ex224 Deep Follow-Up

- Added fixed-point semantic generators for log/log2:
  `student/generators/fp16_log_deep_semantic.py`,
  `student/generators/fp16_log_selected_hybrid.py`,
  `student/generators/fp16_log_balanced_ranges.py`,
  `student/generators/fp16_log_case_attr_variants.py`, and
  `student/generators/fp16_log_casez_runs.py`.
- Confirmed exact internal semantic structure with calibrated fixed-point
  correction LUTs:
  - `ex224`: `log2(x) = exponent_base + log2(1.mant)`.
  - `ex223`: `log(x) = exponent_base * ln(2) + ln(1.mant)`.
- Fixed-point semantic candidates can reduce area but currently create too
  much delay after Yosys AIG synthesis.
- Source forms tried and excluded for these log cases: bucketed constant output
  exponent, sign-known abs rewrite, selected-bit semantic hybrids, balanced
  run-range trees, `parallel_case/full_case` attributes, and `casez` interval
  cube covers.
- At this stage the direct `sign_exp_mant_case` source still won; the next
  useful direction was per-output-bit minimization rather than another full
  table rearrangement.

### 2026-06-06/07 ex223-ex224 Bit-Level Follow-Up

- Added `student/generators/fp16_log_bitrun_hybrid.py` for targeted
  per-output-bit run-cover hybrids.
- New current bests:
  - `ex223`: `casez_sign`, `11189/22/246158`, verified by `evaluate.py`.
  - `ex224`: `casez_sign_bits11_12_t8`, `6250/21/131250`, verified by
    `evaluate.py`.
- Reusable lesson: before expanding structural variants, compute per-output-bit
  run statistics by sign/exponent group.  For log/log2, output sign and a few
  high exponent bits have very small covers even when the whole function is too
  complex for arithmetic RTL under the current Yosys flow.
- Reusable lesson: local bit overrides can improve ADP only when they preserve
  table sharing.  For `ex223`, only output sign should be overridden.  For
  `ex224`, output sign plus bits12 and 11 is the best known combination; adding
  bit9/10/13/14/8/7 was tested and lost.
- Hand-written threshold formulas for `ex224` bits11/12 were exact but worse
  than generated run-tree covers, so do not assume manual comparator formulas
  are smaller without measuring.

### 2026-06-07 ex223-ex224 Deeper Follow-Up

- `ex224` has exact shared correction clusters for `log2`: far exponent bands
  can share 128/256/512/1024-scale `log2(1.mant)` correction LUTs.  This
  semantic decomposition reduced area to about `5.1k`, but delay rose to
  `29`-`32`, so ADP lost to the current table/bit hybrid.
- A deeper `ex224` normalizer can derive lower-scale corrections from
  `corr1024` using shift/round plus exact +/-1 patch flags.  This reduced area
  further to `4444`, but delay rose to `37`; it is a useful low-area semantic
  seed, not the current best ADP seed.
- For FP16 log/log2 under the current Yosys AIG flow, a two-level
  correction-LUT plus add/sub normalizer is currently too deep unless a much
  shallower exact rounding/carry structure is found.
- Joint vector-bit covers are not automatically better than separate selected
  bit covers.  For `ex223` and `ex224`, combining selected bits increased the
  mantissa boundary set and worsened delay/ADP.
- `ex223` natural-log exponent bands do not have exact shared delta clusters
  like `ex224`; near-shared pairs require ULP patch logic, which is expected to
  recreate the high-delay fixed-point semantic path.

### 2026-06-07 ex223-ex224 Shallow-Normalizer Stress Tests

- For `ex224`, partial correction derivation from `corr1024` was exact but did
  not reduce delay enough.  The best partial variant was
  `semantic_partial_derive128`, `4981/33/164373`.
- A hand-written `ex224` field-arithmetic normalizer that uses 10/11-bit
  mantissa carry/borrow was exact but worse (`5009/38/190342`).  Under the
  current Yosys AIG flow, source-level field arithmetic can still synthesize
  deeper than the table/selected-bit hybrid.
- Separating all output exponent bits from the `ex224` table was exact but
  worse; the current best keeps bit14/13/10 inside the table and only overrides
  sign plus bits12/11.
- For both `ex223` and `ex224`, special-case shells around the positive-normal
  table were exact but worse.  Do not assume removing special constants helps;
  the full sign-exp table can preserve useful cross-case sharing.
- `parallel_case/full_case` attributes on the current selected-bit hybrids did
  not change QoR.
- New hand-derived high-bit predicates were useful for understanding but not
  for ADP: `ex223` bit14 and `ex224` bit14 both synthesized worse when split
  out of the table.

### 2026-06-07 Yosys Synthflow Lesson

- A limited Yosys synthesis-flow test on the current `ex223`/`ex224` best
  Verilog seeds found a useful frontend-only knob: use `abc -g aig` instead of
  `abc -g AND` before `aigmap`.
- New synthflow bests:
  - `ex223`: `casez_sign` with `abc -g aig`, `11148/21/234108`.
  - `ex224`: `casez_sign_bits11_12_t8` with `abc -g aig`, `6219/20/124380`.
- This was verified by `evaluate.py` and should be treated as a synthesis-flow
  seed improvement, not a backend optimization portfolio.
- Tested and excluded: skipping Yosys internal ABC, `abc -fast`, delay targets
  `-D 20/21/22/24`, `simple`/`AND,MUX` gate sets, extra `share`/`opt_muxtree`
  passes, late flatten, and `synth -flatten -noabc`.
- Follow-up around `abc -g aig` confirmed that `-D 18/19/20/21` gives the same
  AIG QoR, while `gates` and `cmos2` aliases are worse.
- The same fixed single `abc -g aig` path later improved all ex225-ex229
  current seeds after an output-directory bug in the synthflow helper was
  fixed:
  - `ex225`: `11499/22/252978`, later improved to `11509/21/241689`, then
    `11488/21/241248`.
  - `ex226`: `33356/22/733832`.
  - `ex227`: `40629/22/893838`.
  - `ex228`: `6627/20/132540`.
  - `ex229`: `3971/19/75449`.
- Treat this as a required one-shot frontend seed check for future curated
  FP16 Verilog candidates.  Do not expand it into a backend portfolio unless
  explicitly requested.
- A neighbor check on ex225-ex229 confirmed that `abc_g_aig_d18` through
  `abc_g_aig_d21` reproduce the same QoR as `abc_g_aig`; `gates` and `cmos2`
  do not improve.  For future FP16 frontend work, try plain `abc_g_aig` once
  after a seed is curated, then return to semantic/bit-structure work.
- When reusing `student/scripts/yosys_synthflow_from_best_csv.py` on seed
  bundles, the Verilog top module must be parsed from the source file; a
  current-best candidate ID can name an AIG candidate rather than the module.
- `ex225/log10` now has a tested true semantic normalizer: exponent-base plus
  mantissa-correction LUT with exact exception correction.  It is exact and
  low-area, but too deep (`4028/70/281960` after `abc_g_aig`) versus the
  current shared-predecode seed (`11488/21/241248`).  Future ex225 work needs a much
  shallower exact correction/rounding structure, not simply wider fixed-point
  q-tables.
- A later ex225 shallow-correction pass found that output bits 12 and 9 should
  be emitted as a shared vector run-cover, while bit14 is better as a
  hand-derived threshold predicate.  A deeper shared-threshold-predecode pass
  then added manual sign/bit14/bit13 predicates plus shared bit12/bit9
  threshold predecode.  The current ex225 best is
  `ex225_manual15_14_13_predecode12_9_abc_g_aig`, `11488/21/241248`.

### 2026-06-07 ex230-ex234 Focused Pass

- Created curated seed bundle
  `student/seeds/fp16/ex230_ex234_frontend_fp16_current_20260607_1853/`.
- Official `evaluate.py --case` rechecked all five current-best AIGs:
  - `ex230`: `ex230_exp_mant_pair_case_abc_g_aig`, `6969/20/139380`.
  - `ex231`: `ex231_semantic_sign_exp_field_defaults_abc_g_aig`,
    `1286/16/20576`.
  - `ex232`: `ex232_bitvec_bits12_9_t32_abc_g_aig`, `1343/16/21488`.
  - `ex233`: `ex233_bitvec_bits14_13_12_9_t32_abc_g_aig`,
    `1674/17/28458`.
  - `ex234`: `ex234_sign_pair_case_abc_g_aig`, `1355/17/23035`.
- Semantic checks exact-matched `ex231` reciprocal, `ex232` square, `ex233`
  sqrt, and `ex234` reciprocal-square under DAZ/FTZ/RNE/canonical-NaN
  assumptions.  `ex230` remains sigmoid-family but not an exact Python sigmoid
  model due to rounding mismatches starting at input `0x1a00`.
- `ex232` and `ex233` benefited from selected-bit vector covers plus the
  one-shot `abc -g aig` flow.  The later ex232 deep square run superseded the
  selected-bit vector-cover seed with a square-specific exact carry/mantissa
  structure.

### 2026-06-07 ex232 Deep Square Structure

- `ex232` improved from `1343/16/21488` to `1240/13/16120` and is now within
  1.5x reference.
- Curated seed:
  `student/seeds/fp16/ex232_frontend_fp16_square_deep_current_20260607_1940/`.
- The key was not another selected-bit sweep.  The exact square structure is:
  - output sign is constant zero;
  - active normal exponent range is `8..22`;
  - `out_exp = 2*exp - 15 + (mant >= 424)`;
  - normalized output mantissa depends only on input mantissa;
  - mantissa bits9/8 are run trees;
  - mantissa low8 is a nested hi6/lo4 LUT.
- This is the preferred pattern to try next on square-family cases such as
  `ex236` and `ex238`: derive the arithmetic exponent/carry first, then
  reshape the mantissa-only correction table.

### 2026-06-07 Applying the ex232 Lesson to Earlier FP16 Cases

- `ex231`, `ex233`, and `ex234` were suitable for the same idea because their
  normal outputs can be expressed as exponent formulas plus mantissa-only (or
  parity-class) correction tables.
- New official `evaluate.py` bests:
  - `ex231`: reciprocal, `1163/14/16282`, from
    `out_exp = 30 - exp - (mant != 0)`, mant bit9 run tree, and low9 nested
    hi6 LUT.
  - `ex233`: sqrt, `1530/15/22950`, from
    `out_exp = (exp + 15) >> 1`, exponent parity mantissa classes, bits9/8
    run trees, and low8 nested hi6 LUT.
  - `ex234`: reciprocal-square, `1351/17/22967`, from
    `out_exp = 45 - 2*exp - (mant != 0) - (mant >= 425)`, bits9/8 run trees,
    and low8 nested hi5 LUT.
- `ex230` sigmoid is not a good target for this power-family trick.  The next
  best targets are still `ex236` cube, `ex238` reciprocal-cube, and `ex235`
  reciprocal-sqrt.

### 2026-06-07 Applying Nested Mantissa Tables to Log-Family Cases

- Added `student/generators/fp16_log_nested_semantic.py`.
- The useful source structure for `ex223`/`ex224`/`ex225` is:
  - exact special/non-positive sign-exp table,
  - positive-normal exponent group,
  - high output bits as mantissa run trees,
  - low output bits as nested mantissa hi/lo LUT.
- Curated seed bundle:
  `student/seeds/fp16/ex223_ex225_frontend_fp16_log_nested_current_20260607_2140/`.
- Official `evaluate.py` bests:
  - `ex223`: `10753/19/204307`, ratio `1.694805`.
  - `ex224`: `6014/16/96224`, ratio `1.487050`, now within `1.5x`.
  - `ex225`: `11533/19/219127`, ratio `1.878081`.
- Practical lesson: for log-family cases, a source-level nested low-bit table
  can preserve the exact bit sharing that selected-bit and fixed-point
  normalizer attempts missed.  Choose the low-bit boundary by measured ADP:
  `ex223` wants low11/hi5, `ex224` wants low12/hi6, and `ex225` wants
  low12/hi5.

### 2026-06-08 ex235-ex239 Power/Root-Family Follow-Up

- Curated seed bundle:
  `student/seeds/fp16/ex235_ex239_frontend_fp16_current_direct_special_20260608_0938/`.
- Official `evaluate.py` bests:
  - `ex235`: reciprocal-sqrt, `1628/14/22792`, ratio `1.095769`.
  - `ex236`: cube, `1531/16/24496`, ratio `1.416773`.
  - `ex237`: cbrt, `1889/16/30224`, ratio `1.188050`.
  - `ex238`: reciprocal-cube, `1553/16/24848`, ratio `1.501480`.
  - `ex239`: reciprocal-cbrt, `2026/16/32416`, ratio `1.248450`.
- `ex235`, `ex237`, and `ex239` benefit from the same broad source shape as
  the log-family nested run: exact special table, exponent parity/modulo class,
  high output bits as shallow run trees, and low output bits as a nested
  mantissa hi/lo LUT.  The best cut point is case-specific.
- `ex236` did not benefit from selected-bit overlays.  A wrapper around the
  previous base/delta source plus `synth_preset` was best.  Directly assigning
  `out[15]=in[15]` was non-equivalent because zero/special behavior matters.
- `ex238` has a reusable a-ha: replacing only output bits b10/b9 is useful,
  while b11, b8, b7, and high-bit expansions are harmful.  The normal exponent
  groups share one mantissa segmentation, and odd exponents toggle b10.  A
  hand-derived factored expression beats the generated run-cover, but still
  stops barely above `1.5x` reference.  Future work should integrate this
  b10/b9 formula into a smaller base source rather than overlaying it.
- Supported synthflow checks confirmed that `abc_g_aig` is best for ex235,
  ex237, ex238, and ex239.  `ex236` is the exception where `synth_preset`
  gives the best AIG.  `no_internal_abc`, `abc_fast`, `extra_opt_share`, and
  `late_flatten` were consistently worse for this batch.
- Follow-up found one more useful source-level rewrite for `ex235`, `ex237`,
  and `ex239`: direct semantic-special guards in the same open-structure
  source.  This removes full inactive special tables before synthesis.  With
  that rewrite, `ex235` and `ex237` now prefer `synth_preset`, while `ex239`
  still prefers `abc_g_aig`.  The ratio columns are tracking metrics only; the
  optimization target remains lower ADP toward reference, not simply crossing a
  threshold.
- A later core-boundary/core-clamp rewrite improved the cube pair:
  - `ex236`: `1432/15/21480`, ratio `1.242337`.
  - `ex238`: `1502/15/22530`, ratio `1.361412`.
  The reusable structure is to keep the exact exponent-delta/mantissa formula
  for middle exponent groups, isolate only the two irregular rounding boundary
  exponent groups into local mantissa tables, and drive all other ranges with
  direct zero/inf/NaN constants.  This beat both selected-bit overlays and the
  earlier broad formula source.  For `ex236`, the boundary tables can be
  reduced further to exact clamp predicates; for `ex238`, the clamp form was
  exact but slower than the boundary table.

### 2026-06-06 Setup

- Created this FP16 notes folder under `student/cases/`, following the BF16
  case-note structure.
- Decision: future FP16 work should be semantic-first and case-by-case.
- Decision: preserve the current known `ex220_ex239_semantic_20260604` run as
  initial evidence, not as proof that no better frontend seed exists.
- High-priority initial targets: `ex223`, `ex224`, `ex225`, `ex232`, `ex233`,
  `ex235`, `ex236`, and `ex238`.
