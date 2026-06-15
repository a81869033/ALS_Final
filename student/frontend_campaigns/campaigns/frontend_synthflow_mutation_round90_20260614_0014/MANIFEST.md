# frontend_synthflow_mutation_round90_20260614_0014

Run ID: `frontend_synthflow_mutation_round90_20260614_0014`

Purpose: frontend-only synthesis-flow and source-boundary sweep after rounds
87-89 found no new high-level or structural breakthrough. This round mutates
current best or recent equivalent RTL only through frontend source organization
and Yosys/ABC-in-frontend choices. It must not run backend portfolio, backend
remap, or post-AIG optimization.

Required reading:
- `AGENTS.md`
- `student/docs/experiment_run_workflow.md`
- `student/frontend_campaigns/GOAL.md`
- `student/frontend_campaigns/FRONTEND_PROGRESS.md`
- `student/frontend_campaigns/frontend_best_registry.csv`
- `student/frontend_campaigns/current_frontend_gap.csv`
- `student/frontend_campaigns/method_judgments.csv`
- `student/frontend_campaigns/manual_judgments.csv`
- assigned `student/frontend_campaigns/case_index/exNNN.md`
- linked case notes and round87-round89 summaries/results

Rules:
- Official equivalence/QoR is repo `evaluate.py`.
- `candidates.csv` and `evaluation_results.csv` may contain only real official
  attempts with existing Verilog/AIG/log paths.
- Planned work belongs in `active_methods.csv`; blockers belong in
  `failed_hypotheses.csv`.
- Do not edit `prompt_log.md`, seed bundles, global registries, backend scripts,
  or unrelated dirty files.
- Frontend synthesis variants are allowed only as direct source-to-AIG frontend
  generation; no post-AIG optimization or backend portfolio.

Best result:
- Merged subagent shards: `33` official candidate rows, `33` evaluation rows,
  `9` failed/blocker rows, `23` shared-structure rows, `0` missing paths, and
  `0` duplicate method signatures.
- Frontend best improvements: none.

Round90 outcome:
- Frontend source-to-AIG / source-boundary sweeps were run for FP8, FP16,
  integer, and unknown high-gap cases.
- All official candidates were equivalent but did not beat current frontend
  best. Several tied current frontend best (`ex225`, `ex260`, `ex297`) but no
  row was strictly better.
- `ex299` unknown source-to-AIG sweep timed out and is recorded as a blocker.
- No backend portfolio, backend remap, or post-AIG optimization was run.
