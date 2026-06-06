# ex215_ex219_frontend_bf16_semantic_20260606_1447

Run ID: `ex215_ex219_frontend_bf16_semantic_20260606_1447`

Purpose: frontend-only BF16 semantic/structural reverse engineering and seed improvement for `ex215`-`ex219`.

Scope:
- Cases: `ex215`, `ex216`, `ex217`, `ex218`, `ex219`.
- Backend portfolios were not run.
- Yosys AIG synthesis and ABC CEC/ADP measurement were used only for frontend seed verification and initial QoR.

Inputs:
- Truth files: `benchmarks/ex215.truth` through `benchmarks/ex219.truth`.
- Generator: `student/generators/bf16_ex215_ex219_frontend.py`.
- Baseline: `student/runs/bf16/ex200_ex219_current/results/best.csv`.
- Reference ADP: `reference_result.csv`.

Artifacts:
- Work directory: `student/work/ex215_ex219_frontend_bf16_semantic_20260606_1447/`
- Results directory: `student/runs/bf16/ex215_ex219_frontend_bf16_semantic_20260606_1447/results/`
- Active curated candidates: `results/candidates.csv`
- Full pre-curation history: `student/archive/cleanup_20260606/ex215_ex219_frontend_bf16_semantic_20260606_1447_low_value_intermediates/candidates_full_precuration.csv`
- Official best recheck: `results/evaluate_official_best.csv`

Semantic checks:
- `ex215`: `bf16_reciprocal_sqrt`, exact semantic model over all 65536 inputs.
- `ex216`: `bf16_cube`, exact semantic model over all 65536 inputs.
- `ex217`: `bf16_cbrt`, exact semantic model over all 65536 inputs.
- `ex218`: `bf16_reciprocal_cube`, exact semantic model over all 65536 inputs.
- `ex219`: `bf16_reciprocal_cbrt`, exact semantic model over all 65536 inputs.

Methods tried:
- Semantic arithmetic RTL using BF16 sign/exponent/mantissa split, DAZ/FTZ/RNE/canonical-NaN assumptions, exponent arithmetic, and mantissa LUTs.
- Aggressive semantic positive-domain/default-field variants.
- Odd-function sign symmetry for cube, cbrt, reciprocal-cube, and reciprocal-cbrt.
- Mantissa hi/lo LUTs, split-sign word tables, separated output fields, and delta/base pair structures.
- Selected output-bit overrides on stable best bases.
- Limited default-expression exception tests where the active exponent range made that direction plausible.

Best result:
- `ex215`: `delta_pair_mode_hilo3_bits_9_bh1_fix2`, `390/12/4680`, old `5005`, reference `3150`, ratio `1.485714`.
- `ex216`: `aggr_semantic_positive_symmetry_fields`, `437/14/6118`, old `6118`, reference `3357`, ratio `1.822461`.
- `ex217`: `delta_pair_first_hilo3_bits_0_bh2_fix2`, `591/14/8274`, old `10864`, reference `5785`, ratio `1.430251`.
- `ex218`: `legacy_value_case_bits_4_bh1_fix3`, `458/15/6870`, old `6945`, reference `3222`, ratio `2.132216`.
- `ex219`: `delta_pair_first_hilo3_bits_6_bh3_fix2`, `630/15/9450`, old `11271`, reference `5640`, ratio `1.675532`.

Official recheck:
- `evaluate.py` returned `OK` for all five best AIGs in `student/work/ex215_ex219_frontend_bf16_semantic_20260606_1447/official_eval_best/`.

Curated seeds:
- 20 verified equivalent active seeds retained, four per case.
- 244 low-value rows and their generated artifacts were archived under `student/archive/cleanup_20260606/ex215_ex219_frontend_bf16_semantic_20260606_1447_low_value_intermediates/`.

Stopped directions:
- `legacy_default_expr_exception_case` was catastrophic for active odd/cbrt-like cases and for ex218 (`19506/24/468144`), so it should not be repeated broadly.
- Selected-bit overrides helped `ex215`, `ex217`, `ex218`, and `ex219`, but multi-bit combinations usually increased mux/predicate cost.
- `ex216` selected-bit and extra hi-split/delta sweeps did not beat the previous semantic positive-symmetry seed.
- `ex218` remains far from reference; semantic arithmetic was exact but too deep, while structural value-case plus one bit override only gave a small area improvement.
