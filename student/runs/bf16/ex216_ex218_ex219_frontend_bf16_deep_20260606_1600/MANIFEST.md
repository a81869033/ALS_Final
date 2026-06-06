# ex216_ex218_ex219_frontend_bf16_deep_20260606_1600

Run ID: `ex216_ex218_ex219_frontend_bf16_deep_20260606_1600`

Purpose: deeper frontend-only optimization for the still-weak BF16 cases `ex216`, `ex218`, and `ex219`, building on `ex215_ex219_frontend_bf16_semantic_20260606_1447`.

Scope:
- Cases: `ex216`, `ex218`, `ex219`.
- Backend portfolios were not run.
- Yosys AIG synthesis and ABC/evaluate.py checks were used only for exact verification and initial QoR.

Inputs:
- Truth files: `benchmarks/ex216.truth`, `benchmarks/ex218.truth`, `benchmarks/ex219.truth`.
- Generator: `student/generators/bf16_ex215_ex219_frontend.py`.
- Previous run: `student/runs/bf16/ex215_ex219_frontend_bf16_semantic_20260606_1447/results/best.csv`.

Artifacts:
- Work directory: `student/work/ex216_ex218_ex219_frontend_bf16_deep_20260606_1600/`
- Results directory: `student/runs/bf16/ex216_ex218_ex219_frontend_bf16_deep_20260606_1600/results/`
- Official best recheck: `results/evaluate_official_best.csv`
- Full pre-curation history: `student/archive/cleanup_20260606/ex216_ex218_ex219_frontend_bf16_deep_20260606_1600_low_value_intermediates/candidates_full_precuration.csv`

Methods tried:
- Hand guarded semantic RTL for cube, reciprocal-cube, and reciprocal-cbrt.
- Critical-bit predicate encodings using hi/lo, run, comparator, and PLA forms.
- Manual sign-bit formula `sign && !is_nan`.
- Sequential mixed overrides, such as comparator-coded exponent/significant bits plus manual sign extraction.
- Source-level `parallel_case/full_case` attributes as a limited Verilog rewrite.

Best result:
- `ex216`: `aggr_semantic_positive_symmetry_fields_bits_14_cmp_fix5_manual_sign_non_nan_fix10`, `420/14/5880`.
- `ex218`: `legacy_value_case_bits_15_cmp_caseattrs_fix9`, `467/13/6071`.
- `ex219`: `delta_pair_first_hilo3_bits_6_cmp_caseattrs_fix9`, `623/15/9345`.

Official recheck:
- `evaluate.py` returned `OK` for all three best AIGs in `student/work/ex216_ex218_ex219_frontend_bf16_deep_20260606_1600/official_eval_best/`.

Notes:
- `ex216` improved by extracting output bit14 with a shallow comparator predicate, then replacing the sign bit with the semantic non-NaN sign formula.
- `ex218` improved most by extracting output bit15 from the value-case base with comparator runs; this reduced delay from 15 to 13.
- `ex219` improved modestly by changing the selected bit6 predicate from hi/lo to comparator form.
- Hand semantic guarded RTL was exact but synthesized deeper than the best structural/selected-bit seeds for all three cases.
- Mixed multi-bit overrides usually regressed; only the targeted ex216 bit14 plus manual sign composition improved.
