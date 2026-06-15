# Task Assignments

Run ID: `ex240_ex299_frontend_gt2_round27_20260613_0619`

| agent_id | domain | cases | round27 focus |
|---|---|---|---|
| `fp8-worst-r27` | `float_fp8` | `ex247`, `ex246`, `ex249` | compact semantic residuals and synthesis-flow variants around current best families |
| `fp8-semantic-r27` | `float_fp8` | `ex244`, `ex240`, `ex245`, `ex241`, `ex242` | alternative high-level descriptions and low-delay selected-bit corrections |
| `unknown-symbol-r27` | `unknown` | `ex297`, `ex299` | compact state/descriptor basis beyond cell-plane and oppdelta residuals |
| `unknown-routing-r27` | `unknown` | `ex285` | local conservation/routing repair beyond exact key/MDD/symcof wrappers |

All case lists are disjoint. Shard summaries must be written to
`agent_summaries/<agent_id>.md`, and shard CSVs should be written under
`agent_shards/<agent_id>/` before coordinator merge.

Spawned subagents:
- `fp8-worst-r27`: `019ebdeb-eaf6-7682-a3c7-b284f9b7368c`
- `fp8-semantic-r27`: `019ebdec-2e35-7bf1-a167-b5de33068581`
- `unknown-symbol-r27`: `019ebdec-6bb9-7eb3-9a3f-d3a3d12fd2ea`
- `unknown-routing-r27`: `019ebdec-a1d8-7940-8964-91ab09e63465`
