# ex235_ex239_frontend_fp16_final_current_20260608_1055

Run ID: `ex235_ex239_frontend_fp16_final_current_20260608_1055`

Purpose: consolidate the best verified frontend-only FP16 seeds from the
ex235-ex239 deep run.

Inputs:
- Truth files: `benchmarks/ex235.truth` through `benchmarks/ex239.truth`
- Main generators:
  - `student/generators/fp16_ex235_ex239_open_structures.py`
  - `student/generators/fp16_ex236_ex238_selected_wrapper.py`
  - `student/generators/fp16_ex238_b10b9_formula.py`
- Prior seed evidence from `student/results/current_best_by_case.csv`

Artifacts:
- Final result CSV: `student/runs/fp16/ex235_ex239_frontend_fp16_final_current_20260608_1055/results/best.csv`
- Candidate mirror: `student/runs/fp16/ex235_ex239_frontend_fp16_final_current_20260608_1055/results/candidates.csv`
- Summary CSV: `student/runs/fp16/ex235_ex239_frontend_fp16_final_current_20260608_1055/results/summary.csv`
- Official recheck CSV: `student/runs/fp16/ex235_ex239_frontend_fp16_final_current_20260608_1055/results/evaluate_check.csv`
- Curated seed bundle: `student/seeds/fp16/ex235_ex239_frontend_fp16_current_20260608_1055/`

Methods tried:
- Semantic confirmation for reciprocal-sqrt, cube, cbrt, reciprocal-cube, and
  reciprocal-cbrt under DAZ/FTZ/RNE/canonical-NaN assumptions.
- Exponent parity/modulo class structures with nested mantissa low-bit LUTs.
- Current-best wrappers and selected-bit overlays for ex236/ex238.
- Hand-derived b10/b9 reciprocal-cube formula for ex238.
- Supported Yosys synthflow variants for final seeds.

Best results:

| Case | Candidate | Area | Delay | ADP | Ratio |
| --- | --- | ---: | ---: | ---: | ---: |
| ex235 | `ex235_open_low8_hi6_abc_g_aig` | 1685 | 14 | 23590 | 1.134135 |
| ex236 | `ex236_sign_only_synth_preset` | 1531 | 16 | 24496 | 1.416773 |
| ex237 | `ex237_open_low10_hi6_abc_g_aig` | 1934 | 16 | 30944 | 1.216352 |
| ex238 | `ex238_b10_9_formula_expr_abc_g_aig` | 1553 | 16 | 24848 | 1.501480 |
| ex239 | `ex239_open_low8_hi6_abc_g_aig` | 2049 | 16 | 32784 | 1.262623 |

Verification:
- `evaluate.py --case ex235`: OK, `1685/14/23590`
- `evaluate.py --case ex236`: OK, `1531/16/24496`
- `evaluate.py --case ex237`: OK, `1934/16/30944`
- `evaluate.py --case ex238`: OK, `1553/16/24848`
- `evaluate.py --case ex239`: OK, `2049/16/32784`
