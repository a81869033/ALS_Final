# ex200_ex299_frontend_refgap_round10_20260612_1911

Run ID: `ex200_ex299_frontend_refgap_round10_20260612_1911`

Purpose: Continue the frontend reference-gap search after round9 produced no
new best improvements. Prioritize the highest `frontend_best_adp /
reference_adp` cases and require materially different high-level
descriptions or sharing strategies before emitting more Verilog.

Inputs:
- Truth files: `benchmarks/exNNN.truth`
- Campaign spec: `student/frontend_campaigns/GOAL.md`
- Progress index: `student/frontend_campaigns/FRONTEND_PROGRESS.md`
- Current best registry: `student/frontend_campaigns/frontend_best_registry.csv`
- Gap ranking: `student/frontend_campaigns/current_frontend_gap.csv`
- Prior judgments: `student/frontend_campaigns/method_judgments.csv`,
  `student/frontend_campaigns/manual_judgments.csv`

Artifacts:
- Campaign directory: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round10_20260612_1911/`
- Work directory: `student/work/ex200_ex299_frontend_refgap_round10_20260612_1911/`
- Domain run directories:
  - `student/runs/unknown/ex200_ex299_frontend_refgap_round10_20260612_1911/`
  - `student/runs/float_fp8/ex200_ex299_frontend_refgap_round10_20260612_1911/`
  - `student/runs/fp16/ex200_ex299_frontend_refgap_round10_20260612_1911/`
  - `student/runs/bf16/ex200_ex299_frontend_refgap_round10_20260612_1911/`
  - `student/runs/integer/ex200_ex299_frontend_refgap_round10_20260612_1911/`

Methods planned:
- Unknown routing/state cases: class descriptors, pair-count/orientation
  cofactors, cell-anchor deltas, and output-grouped decision logic.
- Float FP8 cases: boundary-region muxes, shared exponent/significand decode,
  and materially different synth flows from previous failed replays.
- FP16/BF16 cases: semantic unary shell plus smaller grouped residual
  structures, not direct source-copy repeats.
- Integer cases: arithmetic RTL variants with shared partial products,
  saturating divider predicates, and square/sqrt trial-subtract sharing.

Best result:
- Pending.

Notes:
- Official success requires `evaluate.py` equivalence and existing
  Verilog/AIG/log paths.
- Do not promote partial-batch outputs to `student/seeds`.
