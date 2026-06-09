# ex280_ex284_frontend_semantic_kernel_diag_20260608_2148
## Hypothesis
- Diagnostic-only semantic kernel probe for ex280-ex284.
- Tested reverse-output residuals against integer/carryless `5*x`, prefix/suffix variants, and high=0 low-half slice matches.
- No Verilog/AIG seeds emitted; no `student/seeds` or `output/` writes.
## Artifacts
- `results/summary.csv`
- `results/best.csv`
- `results/evaluate_check.csv`
- `results/kernel_summary.csv`
- `results/kernel_bit_stats.csv`
## Findings
- `reverse(out) ^ (5*x)` and prefix/suffix variants are not low-complexity corrections; integer multiply residuals raised ANF degree to 10-14, while carryless `5*x` residual was essentially the same size as raw output.
- High-zero low-half slices only matched `5*x` or carryless `5*x` on 6-8 inputs, depending on width, so the visible one-hot response is only the linear component.
- Diagnostic-only search emitted no Verilog/AIG candidates.
