# frontend_source_parallel_round73_20260613_1414

Run ID: `frontend_source_parallel_round73_20260613_1414`

Purpose: continue frontend/source-only optimization for cases still above `frontend/reference ADP > 1.5` after round72. Round70-72 showed that broad residual tables, simple local wrappers, and micro cone edits rarely close the gap. This round returns to high-level source representation changes while staying bounded: class/action split for FP8 arithmetic, selector-state variants for unknown, and semantic small decompositions for FP16/integer.

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
- Campaign root: `student/frontend_campaigns/campaigns/frontend_source_parallel_round73_20260613_1414/`
- Shards: `student/frontend_campaigns/campaigns/frontend_source_parallel_round73_20260613_1414/agent_shards/<agent_id>/`
- Summaries: `student/frontend_campaigns/campaigns/frontend_source_parallel_round73_20260613_1414/agent_summaries/<agent_id>.md`
- Work dirs: `student/work/frontend_source_parallel_round73_20260613_1414/<agent_id>/<case>/`
- Run dirs: `student/runs/<domain>/frontend_source_parallel_round73_20260613_1414/<agent_id>/<case>/`

Coordinator notes:
- `ex242` is excluded because the latest index reports ratio below 1.5.
- `ex286/ex287` remain excluded by current campaign scope.
- r67-r72 nonwinning signatures are in `manual_judgments.csv`; workers must check them before generating candidates.
