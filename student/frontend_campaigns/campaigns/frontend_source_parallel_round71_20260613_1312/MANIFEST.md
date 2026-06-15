# frontend_source_parallel_round71_20260613_1312

Run ID: `frontend_source_parallel_round71_20260613_1312`

Purpose: continue frontend/source-only optimization for cases still above `frontend/reference ADP > 1.5` after round70. Round70 showed that broad keycase, full-word residual, wordpatch, and shared-comparator refactors preserve equivalence but usually explode ADP. This round focuses on smaller exact replacement structures around the current best source: selected subnetwork replacement, local high-fanout decode factoring, low-delay output grouping, and targeted source-level arithmetic decomposition.

Scope:
- Frontend RTL/source search only.
- Official equivalence and QoR must come from repo `evaluate.py`.
- `iverilog` may be used only for debug simulation.
- No backend portfolio, no standalone AIG/ABC remap/post-processing, and no seed-bundle curation.

Still-`>1.5` cases at launch:
- `float_fp8`: `ex240`, `ex241`, `ex242`, `ex244`, `ex245`, `ex246`, `ex247`, `ex249`
- `fp16`: `ex223`, `ex225`
- `integer`: `ex260`, `ex266`
- `unknown`: `ex285`, `ex288`, `ex297`, `ex299`

Artifacts:
- Campaign root: `student/frontend_campaigns/campaigns/frontend_source_parallel_round71_20260613_1312/`
- Shards: `student/frontend_campaigns/campaigns/frontend_source_parallel_round71_20260613_1312/agent_shards/<agent_id>/`
- Summaries: `student/frontend_campaigns/campaigns/frontend_source_parallel_round71_20260613_1312/agent_summaries/<agent_id>.md`
- Work dirs: `student/work/frontend_source_parallel_round71_20260613_1312/<agent_id>/<case>/`
- Run dirs: `student/runs/<domain>/frontend_source_parallel_round71_20260613_1312/<agent_id>/<case>/`

Coordinator notes:
- `ex295` is excluded because round67 reduced it below 1.5.
- `ex286/ex287` remain excluded by current campaign scope.
- r67-r70 nonwinning signatures are in `manual_judgments.csv`; workers must check them before generating candidates.
