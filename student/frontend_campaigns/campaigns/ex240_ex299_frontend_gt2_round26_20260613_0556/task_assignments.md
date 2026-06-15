# Task Assignments

Run ID: `ex240_ex299_frontend_gt2_round26_20260613_0556`

Selection rule: cases with current registry `frontend_best_adp / reference_adp`
greater than 2, excluding `ex286` and `ex287`.

| agent_id | domain | cases | round26 focus |
|---|---|---|---|
| `fp8-rounding-r26` | `float_fp8` | `ex247`, `ex246`, `ex249`, `ex248` | shared rounding/saturation/GRS predicates and compact residual corrections |
| `fp8-region-r26` | `float_fp8` | `ex244`, `ex240`, `ex245`, `ex241`, `ex242` | semantic region/class decode, arithmetic base plus selected-bit correction |
| `unknown-symbol-r26` | `unknown` | `ex297`, `ex299` | nonlocal symbol/cell descriptor recurrence and residual families |
| `unknown-routing-r26` | `unknown` | `ex285` | count-preserving routing descriptor alternatives beyond old symcof |

All case lists are disjoint. Shard summaries must be written to
`agent_summaries/<agent_id>.md`, and shard CSVs should be written under
`agent_shards/<agent_id>/` before coordinator merge.

Spawned subagents:
- `fp8-rounding-r26`: `019ebdd6-d09e-7001-99a9-36e73ca50665`
- `fp8-region-r26`: `019ebdd7-1247-7791-b6ee-cfcc4f41421b`
- `unknown-symbol-r26`: `019ebdd7-4ec4-7500-a5f5-b2b97870ae6a`
- `unknown-routing-r26`: `019ebdd7-93d0-7763-b92a-9deef8383363`
