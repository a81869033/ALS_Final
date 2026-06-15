# frontend_source_parallel_round65_20260613_1029

Run ID: `frontend_source_parallel_round65_20260613_1029`

Purpose: Continue frontend-only source search on cases still above 2.0 frontend/reference ratio after round64. This round emphasizes representations not covered by round64: compact classifier synthesis, arithmetic-code transforms, local-rule proof screens, and source-size gated exact RTL.

Inputs:
- Current >2 cases excluding `ex286`/`ex287`: `ex297`, `ex246`, `ex247`, `ex299`, `ex244`, `ex249`, `ex285`
- Required guidance: `AGENTS.md`, `student/docs/experiment_run_workflow.md`, `student/frontend_campaigns/GOAL.md`, `student/frontend_campaigns/FRONTEND_PROGRESS.md`, `student/frontend_campaigns/search_state.csv`, `student/frontend_campaigns/frontend_best_registry.csv`, `student/frontend_campaigns/current_frontend_gap.csv`, `introduction.md`, `ref/新錄音 20.txt`
- Round64 outputs: `student/frontend_campaigns/campaigns/frontend_source_parallel_round64_20260613_1004/`

Artifacts:
- Work directory: `student/work/frontend_source_parallel_round65_20260613_1029/`
- Campaign directory: `student/frontend_campaigns/campaigns/frontend_source_parallel_round65_20260613_1029/`
- Results CSVs: `results/*.csv`
- Agent summaries: `agent_summaries/*.md`

Verification:
- Official `evaluate.py` is the only success authority.
- `iverilog` is debug-only.
- No backend portfolio and no standalone ABC/AIG remap/post-processing.

Status:
- Coordinator skeleton created; assignments are in `task_assignments.md`.
