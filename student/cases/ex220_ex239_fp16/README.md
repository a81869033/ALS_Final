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
| ex225 | fp16_log10 | structural_exact | sign_exp_mant_case | 2.289828 | high |
| ex226 | fp16_sin | structural_exact | positive_default_exp_mant_case | 1.309277 | medium |
| ex227 | fp16_tan | structural_exact | positive_default_exp_mant_case | 1.300915 | medium |
| ex228 | fp16_sinh | semantic_hybrid | semantic_sign_exp_field_defaults | 1.380495 | medium |
| ex229 | fp16_tanh | structural_exact | exp_mant_pair_case | 1.444728 | medium |
| ex230 | fp16_sigmoid | structural_exact | sign_exp_mant_case | 1.364457 | medium |
| ex231 | fp16_reciprocal | structural_exact | positive_default_exp_mant_case | 1.481729 | medium |
| ex232 | fp16_square | structural_exact | positive_default_exp_mant_delta | 1.732751 | high |
| ex233 | fp16_sqrt | structural_exact | positive_default_exp_mant_case | 1.529295 | high |
| ex234 | fp16_reciprocal_square | structural_exact | sign_pair_case | 1.487951 | medium |
| ex235 | fp16_reciprocal_sqrt | semantic_hybrid | semantic_sign_exp_field_defaults | 1.541250 | high |
| ex236 | fp16_cube | structural_exact | positive_default_exp_mant_delta | 1.549566 | high |
| ex237 | fp16_cbrt | structural_exact | positive_default_exp_mant_case | 1.405896 | medium |
| ex238 | fp16_reciprocal_cube | structural_exact | exp_mant_pair_case | 1.623059 | high |
| ex239 | fp16_reciprocal_cbrt | semantic_exact | semantic_arith_fields | 1.483998 | watch |

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

### 2026-06-06 Setup

- Created this FP16 notes folder under `student/cases/`, following the BF16
  case-note structure.
- Decision: future FP16 work should be semantic-first and case-by-case.
- Decision: preserve the current known `ex220_ex239_semantic_20260604` run as
  initial evidence, not as proof that no better frontend seed exists.
- High-priority initial targets: `ex223`, `ex224`, `ex225`, `ex232`, `ex233`,
  `ex235`, `ex236`, and `ex238`.
