# frontend_source_parallel_round74_20260613_1438

Run ID: `frontend_source_parallel_round74_20260613_1438`

Purpose: continue frontend/source-only optimization for cases still above `frontend/reference ADP > 1.5` after round73 and concurrent updates. This round explores hybrid source seeds assembled from multiple previously equivalent frontend representations, using per-output or per-field selection when that creates a genuinely new source structure.

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
- Campaign root: `student/frontend_campaigns/campaigns/frontend_source_parallel_round74_20260613_1438/`
- Shards: `student/frontend_campaigns/campaigns/frontend_source_parallel_round74_20260613_1438/agent_shards/<agent_id>/`
- Summaries: `student/frontend_campaigns/campaigns/frontend_source_parallel_round74_20260613_1438/agent_summaries/<agent_id>.md`
- Work dirs: `student/work/frontend_source_parallel_round74_20260613_1438/<agent_id>/<case>/`
- Run dirs: `student/runs/<domain>/frontend_source_parallel_round74_20260613_1438/<agent_id>/<case>/`

Coordinator notes:
- `ex242` is excluded because latest index reports ratio below 1.5.
- `ex286/ex287` remain excluded by current campaign scope.
- Workers must mine existing equivalent attempts/source paths before emitting candidates, and must not repeat a method marked `do_not_repeat_as_is` unless the source mix and method signature are materially different.
