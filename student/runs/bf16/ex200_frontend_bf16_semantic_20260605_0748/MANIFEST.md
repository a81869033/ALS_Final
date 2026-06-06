# ex200_frontend_bf16_semantic_20260605_0748

Run ID: `ex200_frontend_bf16_semantic_20260605_0748`

Purpose: reconstruct `ex200` as real BF16 `exp` semantic RTL, then generate
Yosys-synthesized AIG seeds and measure initial ADP without backend portfolio
optimization.

Inputs:
- Truth file: `benchmarks/ex200.truth`
- Prior best for comparison: `student/work/reverse_bf16_deep_20260603_1223/ex200/verilog/ex200_bf16_exp_sign_exp_mant_case.v`
- Generator/script: `student/generators/bf16_exp200_semantic_run.py`

Artifacts:
- Work directory: `student/work/ex200_frontend_bf16_semantic_20260605_0748/`
- Candidates CSV: `student/runs/bf16/ex200_frontend_bf16_semantic_20260605_0748/results/candidates.csv`
- Best CSV: `student/runs/bf16/ex200_frontend_bf16_semantic_20260605_0748/results/best.csv`
- Summary CSV: `student/runs/bf16/ex200_frontend_bf16_semantic_20260605_0748/results/summary.csv`
- Official recheck CSV: `student/runs/bf16/ex200_frontend_bf16_semantic_20260605_0748/results/evaluate_check.csv`
- Best AIG copy: `student/work/ex200_frontend_bf16_semantic_20260605_0748/best_aigs/ex200.aig`

Methods tried:
- Verified truth table equals `DAZ + real exp + BF16 RNE + FTZ`.
- `semantic_exp_default_one_casez_saturation`: default output is `1.0`, with
  active exponent mantissa LUTs and `casez` saturation ranges.
- `semantic_exp_default_one_overrides`: same default-one strategy, but explicit
  saturation cases.
- `semantic_exp_default_one_casez_all_special`: moves NaN/inf special handling
  into the same `casez`.
- `semantic_exp_default_one_parallel_casez_saturation`: same as the best
  `casez` saturation structure with explicit Verilog parallel/full-case
  attributes.  It tied the best result.
- `semantic_exp_default_one_casez_active_first`: same logic with active
  exponent cases ordered before saturation patterns.
- `semantic_exp_default_one_per_exp_mode`: per-exponent mode/default plus
  mantissa exceptions.
- `semantic_exp_default_one_per_exp_casez_runs`: per-exponent `casez` run
  compression for mantissa output ranges.
- `semantic_exp_default_one_sign_split_casez`: split positive and negative
  exponent decoders instead of one 9-bit `sign_exp` decoder.
- `semantic_exp_bitplane_casez`: per-output-bit `casez` ranges for active
  mantissa mappings.
- `semantic_exp_delta_add`: per-exponent base plus signed mantissa delta table.
- `semantic_exp_default_one_bool_saturation`: shared hand-written
  `exp >= 134` boolean saturation condition.
- `semantic_exp_default_one_per_exp_full_casez_runs`: full per-exponent
  monotonic run compression using `casez(mant)`.
- `semantic_exp_hybrid_low_runs20` / `semantic_exp_hybrid_low_runs48`: only
  compress low-variation exponent regions and keep high-variation regions as
  full mantissa LUTs.
- `semantic_exp_predecoded_active_luts`: precompute active exponent mantissa
  LUT outputs and select among them at the top level.
- `semantic_exp_active_mant_cases`: semantic range guards plus active mantissa
  cases.
- `semantic_exp_word_runs`: run-length range comparisons over mantissa.

Best result:
- case: `ex200`
- candidate_id: `ex200_bf16_exp_semantic_exp_default_one_parallel_casez_saturation`
- area: `3717`
- delay: `17`
- ADP: `63189`
- equivalent: `1`

Notes:
- Previous best ADP was `63733`; this run improved it to `63189`.
- Reference ADP is `40052`, so the new ratio is `1.577674`.
- The plain `casez` saturation and parallel-case saturation variants tie at
  area `3717`, delay `17`, ADP `63189`.
- Additional frontend-only variants did not beat this: per-exp mode `63342`,
  active-first `63376`, sign-split `66708`, per-exp `casez` runs `84660`.
- Deeper bit-level attempts also did not beat it: bitplane `casez` `73593`,
  base+delta `168120`, boolean saturation `67050`, full `casez` runs `77688`.
- Additional targeted attempts also did not beat it: hybrid low-runs20 `68562`,
  hybrid low-runs48 `69751`, predecoded active LUTs `67104`.
- Run-length mantissa comparisons were exact but much worse: ADP `204116`.
- Official recheck passed for `17/17` candidates.
- No ABC/ABC9/MockTurtle/CULS/E-Syn backend optimization portfolio was run.
