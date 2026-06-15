# frontend_source_parallel_round63_20260613_0940

Run ID: `frontend_source_parallel_round63_20260613_0940`

Purpose: continue frontend/source-only search on remaining frontend ratio > 2 cases after round62 produced no frontend-best improvement but found a promising unknown-large descriptor shrink.

Scope:
- Frontend/source-only only.
- Yosys RTL synthesis is allowed.
- Repo `evaluate.py` is the only official equivalence/QoR authority.
- No backend portfolio.
- No standalone ABC/AIG remap/post-processing on existing or generated AIGs.
- No old ex280-specific search script.

Required context for workers:
- `AGENTS.md`
- `student/docs/experiment_run_workflow.md`
- `student/frontend_campaigns/GOAL.md`
- `student/frontend_campaigns/FRONTEND_PROGRESS.md`
- `introduction.md`
- `ref/新錄音 20.txt`
- `student/frontend_campaigns/search_state.csv`
- `student/frontend_campaigns/frontend_best_registry.csv`
- `student/frontend_campaigns/current_frontend_gap.csv`
- `student/frontend_campaigns/manual_judgments.csv`
- `student/frontend_campaigns/hypothesis_bank.csv`
- assigned case index files and relevant case notes

Priority notes:
- `ex297`/`ex299`: round62 `adjhist_distance2_local` is promising but blocked. The next search should compress the source representation before Yosys rather than re-emitting the same large RTL.
- FP8 cases: avoid round54/57/60/61/62 nonwinning source families unchanged.
- `ex285`: avoid selector/delta/cube residual table replay; seek true nonlinear routing recurrence.

Expected outputs:
- `agent_shards/<agent_id>/candidates.csv`
- `agent_shards/<agent_id>/best_improvements.csv`
- `agent_shards/<agent_id>/failed_hypotheses.csv`
- `agent_shards/<agent_id>/simulation_results.csv`
- `agent_shards/<agent_id>/evaluation_results.csv`
- `agent_shards/<agent_id>/shared_structure_report.csv`
- `agent_summaries/<agent_id>.md`
