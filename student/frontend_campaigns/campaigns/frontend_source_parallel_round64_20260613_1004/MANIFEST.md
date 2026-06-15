# frontend_source_parallel_round64_20260613_1004

Run ID: `frontend_source_parallel_round64_20260613_1004`

Purpose: Continue frontend-only source-structure search on the worst current frontend/reference gaps, excluding backend portfolio or standalone AIG post-processing. This round prioritizes new high-level coordinates and shared RTL structures rather than replaying recent source or synth-flow variants.

Inputs:
- Truth files: `benchmarks/ex240.truth`, `benchmarks/ex244.truth`, `benchmarks/ex246.truth`, `benchmarks/ex247.truth`, `benchmarks/ex249.truth`, `benchmarks/ex285.truth`, `benchmarks/ex297.truth`, `benchmarks/ex299.truth`
- Required guidance: `AGENTS.md`, `student/docs/experiment_run_workflow.md`, `student/frontend_campaigns/GOAL.md`, `student/frontend_campaigns/FRONTEND_PROGRESS.md`, `student/frontend_campaigns/search_state.csv`, `student/frontend_campaigns/frontend_best_registry.csv`, `student/frontend_campaigns/current_frontend_gap.csv`, `introduction.md`, `ref/新錄音 20.txt`
- Case indexes: `student/frontend_campaigns/case_index/ex240.md`, `ex244.md`, `ex246.md`, `ex247.md`, `ex249.md`, `ex285.md`, `ex297.md`, `ex299.md`

Artifacts:
- Work directory: `student/work/frontend_source_parallel_round64_20260613_1004/`
- Campaign directory: `student/frontend_campaigns/campaigns/frontend_source_parallel_round64_20260613_1004/`
- Results CSVs: `results/*.csv`
- Agent summaries: `agent_summaries/*.md`

Methods planned:
- `sub-fp8-add-alt-r64`: new coordinate/predicate bases for `ex244` and `ex249`.
- `sub-fp8-muldiv-alt-r64`: alternative product/division representations for `ex246` and `ex247`.
- `sub-mixed-diffroute-r64`: new diff-normalizer and routing-state hypotheses for `ex240` and `ex285`.
- `sub-unklarge-alt-r64`: non-table recurrence/descriptor probes for `ex297` and `ex299`.

Verification:
- Official `evaluate.py` is the only success authority.
- `iverilog` may be used only for debug simulation.
- No backend portfolio and no standalone ABC/AIG remap/post-processing are in scope.

Current status:
- Coordinator skeleton created. Agent work is assigned in `task_assignments.md`.
