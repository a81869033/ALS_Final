# frontend_source_parallel_round67_20260613_1104

Run ID: `frontend_source_parallel_round67_20260613_1104`

Purpose: frontend/source-only optimization for cases whose current frontend/reference ADP ratio is greater than 1.5, excluding cases already active in round66 and excluding `ex286`/`ex287` per the current campaign scope.

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

Artifacts:
- Campaign root: `student/frontend_campaigns/campaigns/frontend_source_parallel_round67_20260613_1104/`
- Shards: `student/frontend_campaigns/campaigns/frontend_source_parallel_round67_20260613_1104/agent_shards/<agent_id>/`
- Summaries: `student/frontend_campaigns/campaigns/frontend_source_parallel_round67_20260613_1104/agent_summaries/<agent_id>.md`
- Work dirs: `student/work/frontend_source_parallel_round67_20260613_1104/<agent_id>/<case>/`
- Run dirs: `student/runs/<domain>/frontend_source_parallel_round67_20260613_1104/<agent_id>/<case>/`

Initial assignments:
- `sub-fp8-mid-r67`: `ex240`, `ex241`, `ex242`, `ex245`, `ex248`
- `sub-fp16-mid-r67`: `ex223`, `ex225`, `ex238`
- `sub-int-mid-r67`: `ex260`, `ex265`, `ex266`, `ex267`, `ex270`, `ex273`, `ex274`, `ex276`
- `sub-unk-mid-r67`: `ex288`, `ex292`, `ex294`, `ex295`

Coordinator notes:
- Round66 is separately covering `ex244`, `ex246`, `ex247`, `ex249`, `ex285`, `ex297`, and `ex299`.
- The merged `results/*.csv` files are initialized with headers and must be populated only after shard review.
