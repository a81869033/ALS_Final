# ex235_ex239_frontend_fp16_current_20260608_1055

Run ID: `ex235_ex239_frontend_fp16_current_20260608_1055`

Purpose: curated git-trackable seed bundle for the current best ex235-ex239
FP16 frontend seeds.

Contents:
- `results/best.csv`: one current best row per case, with paths inside this
  seed bundle.
- `results/candidates.csv`: same curated rows for collection scripts.
- `results/summary.csv`: ADP/reference comparison.
- `results/evaluate_check.csv`: official `evaluate.py` recheck status.
- `exNNN/verilog/*.v`: curated Verilog source.
- `exNNN/aigs/*.aig`: curated AIG emitted by the selected frontend synthflow.

Current seeds:

| Case | Verilog | AIG | Area | Delay | ADP |
| --- | --- | --- | ---: | ---: | ---: |
| ex235 | `ex235/verilog/ex235_open_low8_hi6.v` | `ex235/aigs/ex235_open_low8_hi6_abc_g_aig.aig` | 1685 | 14 | 23590 |
| ex236 | `ex236/verilog/ex236_sign_only.v` | `ex236/aigs/ex236_sign_only_synth_preset.aig` | 1531 | 16 | 24496 |
| ex237 | `ex237/verilog/ex237_open_low10_hi6.v` | `ex237/aigs/ex237_open_low10_hi6_abc_g_aig.aig` | 1934 | 16 | 30944 |
| ex238 | `ex238/verilog/ex238_b10_9_formula_expr.v` | `ex238/aigs/ex238_b10_9_formula_expr_abc_g_aig.aig` | 1553 | 16 | 24848 |
| ex239 | `ex239/verilog/ex239_open_low8_hi6.v` | `ex239/aigs/ex239_open_low8_hi6_abc_g_aig.aig` | 2049 | 16 | 32784 |

Notes:
- `ex238` is the only case still above `1.5x` reference, at ratio `1.501480`.
- Full search history remains in `student/work/` and `student/runs/fp16/`.
