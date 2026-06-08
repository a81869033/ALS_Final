# ex235_ex237_ex239_frontend_fp16_direct_special_specs_20260608_0929

Run ID: `ex235_ex237_ex239_frontend_fp16_direct_special_specs_20260608_0929`

Purpose: tune direct semantic-special open structures for reciprocal-sqrt,
cbrt, and reciprocal-cbrt after wrapper special guards showed a small benefit.

Inputs:
- Truth files: `benchmarks/ex235.truth`, `benchmarks/ex237.truth`, `benchmarks/ex239.truth`
- Generator: `student/generators/fp16_ex235_ex237_ex239_direct_special.py`

Artifacts:
- Work directory: `student/work/ex235_ex237_ex239_frontend_fp16_direct_special_specs_20260608_0929/`
- Candidates CSV: `student/runs/fp16/ex235_ex237_ex239_frontend_fp16_direct_special_specs_20260608_0929/results/candidates.csv`
- Best CSV: `student/runs/fp16/ex235_ex237_ex239_frontend_fp16_direct_special_specs_20260608_0929/results/best.csv`

Methods tried:
- Replace inactive full special tables with direct semantic zero/inf/NaN guards.
- Sweep focused high/low cut points around the previous open-structure bests.
- Check `abc_g_aig` and `synth_preset` only for the focused cut-point grid.

Best result:
- `ex235`: `ex235_direct_special_low8_hi6_synth_preset`, `1628/14/22792`
- `ex237`: `ex237_direct_special_low10_hi6_synth_preset`, `1889/16/30224`
- `ex239`: `ex239_direct_special_low7_hi6_abc_g_aig`, `2026/16/32416`

Notes:
- Direct source rewriting beat wrapping because Yosys can trim the inactive
  special path before AIG generation.
- For `ex239`, lowering the low field from 8 to 7 preserved delay 16 and saved
  area.
