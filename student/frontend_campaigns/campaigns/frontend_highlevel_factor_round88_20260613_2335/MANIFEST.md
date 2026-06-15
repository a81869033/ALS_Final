# frontend_highlevel_factor_round88_20260613_2335

Run ID: `frontend_highlevel_factor_round88_20260613_2335`

Purpose: frontend-only high-level descriptor rediscovery for high-gap cases after
round87 decision-graph/structural RTL wrappers produced no frontend
improvements. This round should not start from a wrapper; it should first prove
that a lower-dimensional exact descriptor, shared support, or compact residual
exists, then emit Verilog only when the structure is plausibly lower ADP.

Required reading:
- `AGENTS.md`
- `student/docs/experiment_run_workflow.md`
- `student/frontend_campaigns/GOAL.md`
- `student/frontend_campaigns/FRONTEND_PROGRESS.md`
- `student/frontend_campaigns/search_state.csv`
- `student/frontend_campaigns/frontend_best_registry.csv`
- `student/frontend_campaigns/current_frontend_gap.csv`
- `student/frontend_campaigns/method_judgments.csv`
- `student/frontend_campaigns/manual_judgments.csv`
- `student/frontend_campaigns/hypothesis_bank.csv`
- assigned `student/frontend_campaigns/case_index/exNNN.md`
- linked case notes and prior round84-round87 results
- `introduction.md`
- `ref/新錄音 20.txt`

Rules:
- Frontend/source only. Do not run backend portfolio, backend remap, or post-AIG
  optimization.
- Official equivalence/QoR is repo `evaluate.py`; debug simulation alone is not
  success.
- Do not use old ex280-specific search scripts.
- Workers must not edit `prompt_log.md`, seed bundles, global registries,
  backend scripts, or unrelated dirty files.
- Record non-repeated failed screens in `failed_hypotheses.csv`; do not emit
  table-sized RTL just to get an exact but obviously worse candidate.

Focus:
- lower-dimensional exact descriptors before RTL
- multi-output support sharing and output clustering
- affine/ANF roots with bounded nonlinear residuals
- semantic arithmetic formulas with shared correction predicates
- compact cofactor modules only when residual support is demonstrably small

Best result:
- Merged subagent shards: `0` official candidate rows, `0` evaluation rows,
  `44` failed/blocker rows, `29` shared-structure rows, `0` missing paths, and
  `0` duplicate method signatures.
- Frontend best improvements: none.

Round88 outcome:
- All four workers ended blocker-only after compactness screens.
- FP8 range/product/hypot descriptors were exact only with thousands of states.
- FP8 add/multiply residual screens stayed table-sized or conflict-heavy.
- Unknown spectral/ANF/state screens still had large key and residual counts.
- FP16 log/log10 and integer multiplier/divider factoring screens did not find
  compact residual support worth emitting as RTL.

Next useful direction:
- Avoid another broad descriptor-screen round using the same families.
- If continuing, focus on very small, high-signal cases or on mutating known
  best Verilog structure around synthesis-critical signals, while staying
  frontend-only and using official `evaluate.py`.
