# frontend_source_parallel_round68_20260613_1134

Run ID: `frontend_source_parallel_round68_20260613_1134`

Purpose: continue frontend/source-only optimization for cases still above `frontend/reference ADP > 1.5` after round66 and round67 accepted improvements.

Scope:
- Frontend RTL/source search only.
- Official equivalence and QoR must come from repo `evaluate.py`.
- `iverilog` may be used only for debug simulation.
- No backend portfolio, no standalone AIG/ABC remap/post-processing, and no seed-bundle curation.

Inputs:
- `student/frontend_campaigns/GOAL.md`
- `student/docs/experiment_run_workflow.md`
- `student/frontend_campaigns/current_frontend_gap.csv`
- `student/frontend_campaigns/frontend_best_registry.csv`
- `student/frontend_campaigns/search_state.csv`
- `student/frontend_campaigns/method_judgments.csv`
- `student/frontend_campaigns/manual_judgments.csv`
- `student/frontend_campaigns/hypothesis_bank.csv`
- assigned `student/frontend_campaigns/case_index/exNNN.md`
- assigned case notes under `student/cases/`
- `introduction.md`
- `ref/新錄音 20.txt`

Current still-`>1.5` cases at launch:
- `float_fp8`: `ex240`, `ex241`, `ex242`, `ex244`, `ex245`, `ex246`, `ex247`, `ex249`
- `fp16`: `ex223`, `ex225`
- `integer`: `ex260`, `ex266`
- `unknown`: `ex285`, `ex288`, `ex297`, `ex299`

Artifacts:
- Campaign root: `student/frontend_campaigns/campaigns/frontend_source_parallel_round68_20260613_1134/`
- Shards: `student/frontend_campaigns/campaigns/frontend_source_parallel_round68_20260613_1134/agent_shards/<agent_id>/`
- Summaries: `student/frontend_campaigns/campaigns/frontend_source_parallel_round68_20260613_1134/agent_summaries/<agent_id>.md`
- Work dirs: `student/work/frontend_source_parallel_round68_20260613_1134/<agent_id>/<case>/`
- Run dirs: `student/runs/<domain>/frontend_source_parallel_round68_20260613_1134/<agent_id>/<case>/`

Coordinator notes:
- `ex295` improved in round67 to ADP `95043`, ratio `1.396377`; it is excluded from round68.
- Avoid r66/r67 nonwinning directions recorded in `manual_judgments.csv` and shard `failed_hypotheses.csv`.
