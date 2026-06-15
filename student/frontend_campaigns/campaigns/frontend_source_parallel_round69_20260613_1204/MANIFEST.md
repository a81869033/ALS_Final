# frontend_source_parallel_round69_20260613_1204

Run ID: `frontend_source_parallel_round69_20260613_1204`

Purpose: continue frontend/source-only optimization for cases still above `frontend/reference ADP > 1.5` after round68. This round deliberately avoids repeating r67/r68 nonwinning source families.

Scope:
- Frontend RTL/source search only.
- Official equivalence and QoR must come from repo `evaluate.py`.
- `iverilog` may be used only for debug simulation.
- No backend portfolio, no standalone AIG/ABC remap/post-processing, and no seed-bundle curation.

Current still-`>1.5` cases:
- `float_fp8`: `ex240`, `ex241`, `ex242`, `ex244`, `ex245`, `ex246`, `ex247`, `ex249`
- `fp16`: `ex223`, `ex225`
- `integer`: `ex260`, `ex266`
- `unknown`: `ex285`, `ex288`, `ex297`, `ex299`

Round69 direction:
- mine current best frontend Verilog/source structure before generating new RTL;
- try selected-output residual compression over known-good structures;
- prefer small shared predicates and reusable subfunctions over wide descriptor tables;
- avoid all `manual_judgments.csv` entries marked `do_not_repeat_as_is`.

Artifacts:
- Campaign root: `student/frontend_campaigns/campaigns/frontend_source_parallel_round69_20260613_1204/`
- Shards: `student/frontend_campaigns/campaigns/frontend_source_parallel_round69_20260613_1204/agent_shards/<agent_id>/`
- Summaries: `student/frontend_campaigns/campaigns/frontend_source_parallel_round69_20260613_1204/agent_summaries/<agent_id>.md`
- Work dirs: `student/work/frontend_source_parallel_round69_20260613_1204/<agent_id>/<case>/`
- Run dirs: `student/runs/<domain>/frontend_source_parallel_round69_20260613_1204/<agent_id>/<case>/`
