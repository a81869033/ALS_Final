# ex200_ex299_frontend_refgap_round18_20260612_2321

Run ID: `ex200_ex299_frontend_refgap_round18_20260612_2321`

Purpose: continue the frontend reference-gap campaign after round17 produced only one nonwinning official candidate plus blockers. Round18 keeps the `frontend_best_adp / reference_adp` priority and requires each worker to move to a second assigned case if the first case is blocked.

Inputs:
- `student/frontend_campaigns/GOAL.md`
- `student/frontend_campaigns/FRONTEND_PROGRESS.md`
- `student/frontend_campaigns/search_state.csv`
- `student/frontend_campaigns/frontend_best_registry.csv`
- `student/frontend_campaigns/current_frontend_gap.csv`
- assigned `student/frontend_campaigns/case_index/exNNN.md`
- linked case notes for assigned cases

Artifacts:
- Work directory: `student/work/ex200_ex299_frontend_refgap_round18_20260612_2321/`
- Campaign directory: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round18_20260612_2321/`
- Shards: `agent_shards/<agent_id>/`
- Summaries: `agent_summaries/<agent_id>.md`
- Merged CSVs: `results/`

Acceptance rule: only official `evaluate.py` equivalent rows with complete area, delay, ADP, Verilog, AIG, and log paths are candidates. Blockers and non-equivalent rows must be recorded as failed hypotheses.
