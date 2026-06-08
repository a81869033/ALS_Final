# ex235_ex239_frontend_fp16_core_boundary_current_20260608_0946

Run ID: `ex235_ex239_frontend_fp16_core_boundary_current_20260608_0946`

Purpose: curated current frontend seeds for FP16 ex235-ex239 after the direct
semantic-special and core-boundary follow-ups.

Inputs:
- Truth files: `benchmarks/ex235.truth` through `benchmarks/ex239.truth`
- Direct-special run: `student/runs/fp16/ex235_ex237_ex239_frontend_fp16_direct_special_specs_20260608_0929/`
- Core-boundary run: `student/runs/fp16/ex236_ex238_frontend_fp16_core_boundary_allflows_20260608_0942/`

Artifacts:
- Seed bundle: `student/seeds/fp16/ex235_ex239_frontend_fp16_core_boundary_current_20260608_0946/`
- Best CSV: `student/seeds/fp16/ex235_ex239_frontend_fp16_core_boundary_current_20260608_0946/results/best.csv`
- Candidate CSV: `student/seeds/fp16/ex235_ex239_frontend_fp16_core_boundary_current_20260608_0946/results/candidates.csv`

Methods kept:
- `ex235`: direct semantic zero/inf/NaN guards plus open low8/hi6 structure.
- `ex236`: cube core exponent-delta formula plus exact boundary clamps.
- `ex237`: direct semantic zero/inf/NaN guards plus open low10/hi6 structure.
- `ex238`: reciprocal-cube core exponent-delta formula plus local boundary exponent table.
- `ex239`: direct semantic zero/inf/NaN guards plus open low7/hi6 structure.

Best results:
- `ex235`: `1628/14/22792`, ratio `1.095769`
- `ex236`: `1432/15/21480`, ratio `1.242337`
- `ex237`: `1889/16/30224`, ratio `1.188050`
- `ex238`: `1502/15/22530`, ratio `1.361412`
- `ex239`: `2026/16/32416`, ratio `1.248450`

Notes:
- All rows are exact-equivalent according to the generator/evaluate flow.
- This bundle supersedes `ex235_ex239_frontend_fp16_current_direct_special_20260608_0938`.
- `ex236` was updated after the core-boundary pass with the later
  `core_clamp_hi6_abc_g_aig` seed.
