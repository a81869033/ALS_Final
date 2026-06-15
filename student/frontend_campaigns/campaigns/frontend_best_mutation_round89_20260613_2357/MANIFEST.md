# frontend_best_mutation_round89_20260613_2357

Run ID: `frontend_best_mutation_round89_20260613_2357`

Purpose: frontend-only mutation of current best Verilog/source structures after
round87 structural RTL and round88 high-level descriptor screens failed to
improve ADP. This round should be small and artifact-driven: mutate known best
frontend representations or generate a concrete blocker. Do not create planned
candidate rows.

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
- linked case notes and round87/round88 summaries/results
- `introduction.md`
- `ref/新錄音 20.txt`

Rules:
- Frontend/source only. No backend portfolio, backend remap, or post-AIG
  optimization.
- Official equivalence/QoR is repo `evaluate.py`.
- `candidates.csv` and `evaluation_results.csv` may contain only real official
  attempts with existing Verilog/AIG/log paths.
- Planned work belongs in `active_methods.csv`; blockers belong in
  `failed_hypotheses.csv`.
- Workers must not edit `prompt_log.md`, seed bundles, global registries,
  backend scripts, or unrelated dirty files.

Best result:
- Merged subagent shards: `10` official candidate rows, `10` evaluation rows,
  `13` failed/blocker rows, `16` shared-structure rows, `0` missing paths, and
  `0` duplicate method signatures.
- Frontend best improvements: none.

Round89 outcome:
- Current-best source mutations were run for FP8 range/product/hypot, FP8
  arithmetic, and small integer cases.
- FP16 and unknown cases were triaged as blocker-only based on round87/round88
  evidence.
- All official candidates were equivalent but nonwinning.
- No backend portfolio, backend remap, or post-AIG optimization was run.
