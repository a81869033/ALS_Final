# ex200_ex299_frontend_refgap_round17_20260612_2300

Run ID: `ex200_ex299_frontend_refgap_round17_20260612_2300`

Purpose: continue the frontend reference-gap campaign after round16 produced no accepted frontend improvements. Round17 uses `frontend_best_adp / reference_adp` priority and avoids replaying round16 shared-BDD, threshold/cofactor, and source-only flow variants.

Inputs:
- `student/frontend_campaigns/GOAL.md`
- `student/frontend_campaigns/FRONTEND_PROGRESS.md`
- `student/frontend_campaigns/search_state.csv`
- `student/frontend_campaigns/frontend_best_registry.csv`
- `student/frontend_campaigns/current_frontend_gap.csv`
- assigned `student/frontend_campaigns/case_index/exNNN.md`
- linked case notes for assigned cases

Artifacts:
- Work directory: `student/work/ex200_ex299_frontend_refgap_round17_20260612_2300/`
- Campaign directory: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round17_20260612_2300/`
- Shards: `agent_shards/<agent_id>/`
- Summaries: `agent_summaries/<agent_id>.md`
- Merged CSVs: `results/`

Priority basis: highest `frontend_best_adp / reference_adp` in `current_frontend_gap.csv`, not backend/current-best ADP.

Acceptance rule: only official `evaluate.py` equivalent rows with complete area, delay, ADP, Verilog, AIG, and log paths are candidates. Non-equivalent or blocked attempts must be recorded as failed hypotheses.
