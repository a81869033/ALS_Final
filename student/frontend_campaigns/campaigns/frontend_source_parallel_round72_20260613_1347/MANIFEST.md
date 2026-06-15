# frontend_source_parallel_round72_20260613_1347

Run ID: `frontend_source_parallel_round72_20260613_1347`

Purpose: continue frontend/source-only optimization for cases still above `frontend/reference ADP > 1.5` after round71 and concurrent index updates. `ex242` is excluded at launch because `current_frontend_gap.csv` now reports ratio `1.485882`.

Scope:
- Frontend RTL/source search only.
- Official equivalence and QoR must come from repo `evaluate.py`.
- `iverilog` may be used only for debug simulation.
- No backend portfolio, no standalone AIG/ABC remap/post-processing, and no seed-bundle curation.

Still-`>1.5` cases at launch:
- `float_fp8`: `ex240`, `ex241`, `ex244`, `ex245`, `ex246`, `ex247`, `ex249`
- `fp16`: `ex223`, `ex225`
- `integer`: `ex260`, `ex266`
- `unknown`: `ex285`, `ex288`, `ex297`, `ex299`

Artifacts:
- Campaign root: `student/frontend_campaigns/campaigns/frontend_source_parallel_round72_20260613_1347/`
- Shards: `student/frontend_campaigns/campaigns/frontend_source_parallel_round72_20260613_1347/agent_shards/<agent_id>/`
- Summaries: `student/frontend_campaigns/campaigns/frontend_source_parallel_round72_20260613_1347/agent_summaries/<agent_id>.md`
- Work dirs: `student/work/frontend_source_parallel_round72_20260613_1347/<agent_id>/<case>/`
- Run dirs: `student/runs/<domain>/frontend_source_parallel_round72_20260613_1347/<agent_id>/<case>/`

Coordinator notes:
- `ex295` is below 1.5 and excluded.
- `ex286/ex287` remain excluded by current campaign scope.
- r67-r71 nonwinning signatures are in `manual_judgments.csv`; workers must check them before generating candidates.
- Round71 found small wins on `ex297` and `ex299` through bounded `sel==0` identity-bypass wrappers. Unknown worker should try materially different local selector variants, not the same wrapper as-is.
