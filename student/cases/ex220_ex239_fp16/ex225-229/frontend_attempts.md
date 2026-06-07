# ex225-ex229 FP16 Frontend Attempts

Setup note: this file is the group-level log for FP16 log/trig/hyperbolic cases.
Detailed case work should still be recorded in each `exNNN/frontend_attempts.md`.

Current known run:
- `student/runs/fp16/ex220_ex239_semantic_20260604/`
- `student/runs/fp16/ex226_ex229_frontend_fp16_shells_fix_20260607_1128/`
- `student/runs/fp16/ex225_frontend_fp16_log10_bitcombo_20260607_1210/`
- `student/runs/fp16/ex225_ex229_frontend_fp16_current_synthflow_fix_20260607_1223/`
- `student/runs/fp16/ex226_ex228_frontend_fp16_current_synthflow_fix_20260607_1228/`
- `student/runs/fp16/ex225_frontend_fp16_manual_shallow_synthflow_20260607_1315/`
- `student/runs/fp16/ex225_frontend_fp16_predecode_best_neighbor_20260607_1609/`
- Curated seed: `student/seeds/fp16/ex225_ex229_frontend_fp16_bitrun_shells_current/`

Cases:
- `ex225`: `fp16_log10`, current best `ex225_manual15_14_13_predecode12_9_abc_g_aig`, ratio `2.067675`.
- `ex226`: `fp16_sin`, current best `positive_default_exp_mant_case_abc_g_aig`, ratio `1.248459`.
- `ex227`: `fp16_tan`, current best `positive_default_exp_mant_case_abc_g_aig`, ratio `1.238622`.
- `ex228`: `fp16_sinh`, current best `semantic_sign_exp_field_defaults_abc_g_aig`, ratio `1.309619`.
- `ex229`: `fp16_tanh`, current best `semantic_positive_field_defaults_abc_g_aig`, ratio `1.301563`.

Group strategy:
- `ex225` is a high-priority log-family gap; try exponent-base plus mantissa
  correction and selected-bit formulas.
- For `sin`/`tan`, verify whether positive-domain full-word odd symmetry works
  better than magnitude-only sign handling, as BF16 showed periodic positive
  inputs can produce negative outputs.
- For `sinh`/`tanh`, look for saturation/default ranges and compact transition
  exponent groups before mantissa tables.

## 2026-06-07 Semantic Shell Pass

Diagnostics:
- `ex225`: negative domain is mostly canonical NaN; positive normal region is
  still dense.  A hand-written log10 special shell was exact but worse than the
  old best: `11628/24/279072` vs `11616/23/267168`.
  A bounded casez interval-compression pass was also exact but worse; best was
  `casez_runs_t400`, `13234/25/330850`.
  A targeted selected-bit pass improved the then-current best to
  `bitrun_bit11_t8`,
  `11573/23/266179`.  A follow-up multi-bit run-cover pass found
  `bitrun_bits12_9_t32`, `11533/23/265259`.
- `ex226`: NaN-aware odd positive-domain table was exact but worse:
  `33507/25/837675` vs `33460/23/769580`.  Do not repeat this full positive
  table shell without a new bit/field rewrite.
- `ex227`: NaN-aware odd positive-domain table was exact but worse:
  `40882/24/981168` vs `40817/23/938791`.
- `ex228`: odd saturation shell with `exp >= 19 -> signed inf` was exact and
  tied the old best: `6653/21/139713`.
- `ex229`: odd saturation shell with `exp >= 18 -> signed 1.0` improved the
  then-current best to `4015/20/80300`; the broader semantic positive-field default
  candidate later improved it further to `3996/20/79920`.  Official
  `evaluate.py --case ex229` returned OK.
- Single Yosys `abc -g aig` emission on the current semantic/structural seeds
  improved every case in the group and passed official `evaluate.py`:
  `ex225` `11499/22/252978`, `ex226` `33356/22/733832`, `ex227`
  `40629/22/893838`, `ex228` `6627/20/132540`, `ex229` `3971/19/75449`.

Useful lesson:
- Saturation/default shells can reduce delay when they remove high-exponent
  table depth (`ex229`), but for sin/tan the full positive table raises delay.
  Future work should target critical-bit predicates or field-level corrections,
  not another full positive-domain shell.
- For `ex225`, broad interval casez compression is not useful; the next
  plausible direction is a real exponent-base plus mantissa-correction
  normalizer.  Targeted selected-bit correction is useful only when driven by
  critical bits; broad multi-bit cover search mostly worsened delay/area.
- `abc -g aig` is now a proven frontend synthflow knob for current FP16 log and
  trig/hyperbolic seeds.  It should be tried once for future curated source
  seeds, but repeated `-D` or gate-family sweeps were already unproductive in
  the ex223-ex224 follow-up.
- A repaired current-seed neighbor run confirmed the same for ex225-ex229:
  `abc_g_aig_d18`, `abc_g_aig_d19`, `abc_g_aig_d20`, and `abc_g_aig_d21`
  reproduce the current best for all five cases; `gates`/`cmos2` are tied only
  in isolated cases and otherwise worse.  Do not spend more time on this
  parameter family unless a new Verilog source seed is found.
- Tooling fix: `student/scripts/yosys_synthflow_from_best_csv.py` now parses
  the Verilog top module from source, because a seed-bundle best row can have a
  candidate ID like `*_abc_g_aig` that is not the module name.
- A true `ex225/log10` semantic normalizer was tested after this pass:
  exponent-base plus mantissa-correction LUT, fixed-point rounding, and exact
  exception correction.  It produced exact low-area seeds, but the best was
  `4061/73/296453`; `abc_g_aig` reduced it to `4028/70/281960`, still worse
  than the then-current `11499/22/252978`.  This excludes wider q-table
  normalizers unless a shallower rounding/carry structure is derived.

## 2026-06-07 ex225 Shallow Correction Follow-Up

- Shared vector run-cover for output bits 12 and 9 plus `abc_g_aig` reduced
  ex225 to `11512/21/241752`.
- Adding bit14 to that vector improved slightly to `11511/21/241731`.
- Best result came from replacing vector bit14 with a hand-derived shallow
  threshold predicate and keeping bit12/9 as a vector cover:
  `manual_ex225_bitvec12_9_bit14_abc_g_aig`, official `evaluate.py` OK at
  `11509/21/241689`.
- Excluded after exact checks: manual bit12/13 formulas, threshold-16 fallback,
  packed table output, sparse sign-exp decoder, compact Boolean bit14 rewrite,
  and `abc_g_aig_d18..21` / `gates` / `cmos2` neighbors.

## 2026-06-07 ex225 Shared Predecode Follow-Up

- Further ex225 architecture search found a better source structure: manual
  sign/bit14/bit13 predicates plus shared threshold predecode for bit12/bit9.
- Current curated best:
  `ex225_manual15_14_13_predecode12_9_abc_g_aig`, official evaluate wrapper OK
  at `11488/21/241248`, reference ratio `2.067675`.
- Exact checked but excluded: MTBDD sharing, high/low split, toggle/threshold
  covers, packed tables, cube covers, mixed predecode for only complex groups,
  source attributes, and Yosys neighbor variants.  They either kept delay 22
  with lower area or kept delay 21 with higher area.
