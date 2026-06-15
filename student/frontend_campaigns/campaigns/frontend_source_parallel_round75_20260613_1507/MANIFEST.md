# frontend_source_parallel_round75_20260613_1507

Run ID: `frontend_source_parallel_round75_20260613_1507`

Purpose: frontend-only follow-up focused on the 15 non-ex286/ex287 cases whose `current_frontend_gap.csv` ratio remains above 1.5 after round74.

Inputs:
- `AGENTS.md`
- `student/docs/experiment_run_workflow.md`
- `student/frontend_campaigns/GOAL.md`
- `student/frontend_campaigns/FRONTEND_PROGRESS.md`
- `student/frontend_campaigns/frontend_best_registry.csv`
- `student/frontend_campaigns/current_frontend_gap.csv`
- `student/frontend_campaigns/search_state.csv`
- `student/frontend_campaigns/method_judgments.csv`
- `student/frontend_campaigns/manual_judgments.csv`
- `student/frontend_campaigns/hypothesis_bank.csv`
- `introduction.md`
- `ref/新錄音 20.txt`

Artifacts:
- Campaign directory: `student/frontend_campaigns/campaigns/frontend_source_parallel_round75_20260613_1507/`
- Work directory: `student/work/frontend_source_parallel_round75_20260613_1507/`
- Run records: `student/runs/<domain>/frontend_source_parallel_round75_20260613_1507/`

Rules:
- Frontend/source only. Do not run backend portfolios or standalone post-AIG remap.
- Official equivalence/QoR must be via repo `evaluate.py`.
- Do not promote anything to `student/seeds`.
- Do not repeat round74 method signatures or manual `do_not_repeat_as_is` rows without material source/sharing changes.
