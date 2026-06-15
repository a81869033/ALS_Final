# Round25 Task Assignments

Run ID: `ex200_ex299_frontend_refgap_round25_20260613_0506`

Coordinator assumptions:
- Current priority is sorted by `frontend_best_adp / reference_adp` from `frontend_best_registry.csv`.
- Agent case lists are disjoint.
- Agents must write only under their own `<run_id>/<agent_id>/<case>/` work/run paths and campaign shard paths.
- Agents must not edit `prompt_log.md`, `student/seeds`, or global registry/search/gap CSV files.
- Coordinator will merge shard CSVs, verify path uniqueness and official `evaluate.py` status, update global CSVs, and rebuild the index.

Assignments:

| agent_id | cases | focus |
|---|---|---|
| `unknown-sym-r25` | `ex286`, `ex287`, `ex285`, `ex288` | Hamming-preserving routing/normalizer; avoid exact symcof/key-BDD/inner-order replay; seek hidden-state, routing descriptor, cross-output shared selector structures. |
| `fp8-r25` | `ex247`, `ex246`, `ex244`, `ex240`, `ex245`, `ex241`, `ex242`, `ex249`, `ex248` | FP/BF to FP8 conversion; avoid attr-SOP, compact-delta, and targeted ex246/ex247 replay; seek formulaic arithmetic, rounding/saturation predicate sharing, and special-case shells. |
| `unknown-large-r25` | `ex297`, `ex299`, `ex294`, `ex295`, `ex292` | Global/cyclic 2-bit-symbol transforms; avoid plain symbol-plane/current-source replay; seek compact recurrence, descriptor bases, nonlocal state sharing, and materially different output grouping. |
| `mixed-r25` | `ex225`, `ex223`, `ex274`, `ex218`, `ex204`, `ex266`, `ex273`, `ex260` | Mixed FP16/integer/BF16 high gaps; avoid nested LUT replay and round24 exact losers; improve arithmetic/shared predicate representations. |
| `coordinator-bf16-r25` | `ex205` | Coordinator-local BF16 log10 probe; test materially different mantissa hi/lo word grouping and write a normal campaign shard. |

Required per-agent outputs:
- `student/frontend_campaigns/campaigns/<run_id>/agent_shards/<agent_id>/candidates.csv`
- `student/frontend_campaigns/campaigns/<run_id>/agent_shards/<agent_id>/evaluation_results.csv`
- `student/frontend_campaigns/campaigns/<run_id>/agent_shards/<agent_id>/best_improvements.csv`
- `student/frontend_campaigns/campaigns/<run_id>/agent_shards/<agent_id>/failed_hypotheses.csv`
- `student/frontend_campaigns/campaigns/<run_id>/agent_shards/<agent_id>/simulation_results.csv`
- `student/frontend_campaigns/campaigns/<run_id>/agent_shards/<agent_id>/shared_structure_report.csv`
- `student/frontend_campaigns/campaigns/<run_id>/agent_shards/<agent_id>/case_outcomes.csv`
- `student/frontend_campaigns/campaigns/<run_id>/agent_summaries/<agent_id>.md`

Subagent launch prompt logged in `prompt_log.md` at `2026-06-13 05:06:00 +0800`.

Coordinator-local BF16 assignment logged in `prompt_log.md` at `2026-06-13 05:21:28 +0800`.
