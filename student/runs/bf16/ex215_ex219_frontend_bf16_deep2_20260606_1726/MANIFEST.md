# ex215_ex219_frontend_bf16_deep2_20260606_1726

Run ID: `ex215_ex219_frontend_bf16_deep2_20260606_1726`

Purpose: second deep frontend-only optimization pass for BF16 `ex215`-`ex219`, focusing on hand-derived critical-bit predicates and field-level source rewrites.

Scope:
- Cases: `ex215`, `ex216`, `ex217`, `ex218`, `ex219`.
- Backend portfolios were not run.
- Yosys AIG synthesis and ABC/evaluate.py checks were used only for exact verification and initial QoR.

Inputs:
- Truth files: `benchmarks/ex215.truth` through `benchmarks/ex219.truth`.
- Generator: `student/generators/bf16_ex215_ex219_frontend.py`.
- Previous runs:
  - `ex215_ex219_frontend_bf16_semantic_20260606_1447`
  - `ex216_ex218_ex219_frontend_bf16_deep_20260606_1600`

Artifacts:
- Work directory: `student/work/ex215_ex219_frontend_bf16_deep2_20260606_1726/`
- Results directory: `student/runs/bf16/ex215_ex219_frontend_bf16_deep2_20260606_1726/results/`
- Official best recheck: `results/evaluate_official_best.csv`
- Full pre-curation history: `student/archive/cleanup_20260606/ex215_ex219_frontend_bf16_deep2_20260606_1726_low_value_intermediates/candidates_full_precuration.csv`

Methods tried:
- Manual `ex216` bit14 boundary from truth: `exp >= 128 || (exp == 127 && mant >= 34)`.
- Manual sign casez extraction for odd reciprocal/cube cases.
- `exp % 3 + mant` selected-bit tables for cbrt/reciprocal-cbrt critical bits.
- Predicate-mode comparisons for existing selected-bit bests.
- Source-level case attributes on the current best shapes.
- Limited multi-bit overlays on `ex218` high exponent/sign bits and `ex217` bit0.

Best result:
- `ex215`: `delta_pair_mode_hilo3_bits_9_bh1_fix2_caseattrs_fix12`, `390/12/4680`.
- `ex216`: `aggr_semantic_positive_symmetry_fields_cube_bit14_boundary_caseattrs_fix13`, `444/13/5772`.
- `ex217`: `delta_pair_first_hilo3_bits_0_bh3_fix2_manual_sign_non_nan_caseattrs_fix15`, `623/13/8099`.
- `ex218`: `legacy_value_case_bits_15_cmp_caseattrs_fix9`, `467/13/6071`.
- `ex219`: `delta_pair_first_hilo3_bits_6_cmp_caseattrs_fix9`, `623/15/9345`.

Official recheck:
- `evaluate.py` returned `OK` for all five best AIGs in `student/work/ex215_ex219_frontend_bf16_deep2_20260606_1726/official_eval_best/`.

Notes:
- `ex216` improved again by replacing the learned bit14 predicate with a hand-derived boundary.  It traded area for one less delay level and reduced ADP from `5880` to `5772`.
- `ex217` improved again by changing bit0 extraction from `bh2` to `bh3` and adding semantic sign extraction; ADP moved from `8274` to `8099`.
- `ex215`, `ex218`, and `ex219` did not improve beyond the previous bests in this pass.
- `ex217` mod3 bit0 table was exact but worse than the existing selected-bit structure.
- `ex219` mod3 bit6 table was exact but worse than comparator-coded bit6.
- `ex218` manual sign casez was exact after fixing case order, but still worse than comparator-coded bit15.
- Additional multi-bit overlays increased area and/or delay.
