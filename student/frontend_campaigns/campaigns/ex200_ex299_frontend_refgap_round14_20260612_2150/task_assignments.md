# Round14 Task Assignments

Run ID: `ex200_ex299_frontend_refgap_round14_20260612_2150`

Coordinator setup time: `2026-06-12 21:50 +0800`

Common requirements:
- Read the mandatory project/campaign files and assigned case notes before candidates.
- Use only shard-scoped paths under this run ID.
- Do not update global registry/search state directly.
- Do not repeat round13 blockers unchanged.

Assignments:

| Agent | Cases | Primary target |
| --- | --- | --- |
| `fp8-predicate-r14` | `ex244`, `ex240`, `ex241`, `ex249`, `ex248` | Predicate-lattice or terminal-sharing FP8 conversion candidates, excluding ex246 product-class replays. |
| `bf16-smallmant-r14` | `ex205`, `ex204`, `ex200`, `ex218` | BF16 small-mantissa semantic RTL with shared field decode and compact residual tables. |
| `unknown-state2-r14` | `ex299`, `ex295`, `ex296`, `ex298`, `ex290`, `ex292`, `ex294` | Alternative state/cell descriptors after prefix2 affine residual lost. |
| `integer-isqrt-r14` | `ex276`, `ex277`, `ex270`, `ex256`, `ex261` | Delay-reduced isqrt/square/multiplier forms, avoiding ex266 wordmux and ex260 constant tree replay. |

Spawned agents:

| Agent | Runtime agent id | Nickname |
| --- | --- | --- |
| `fp8-predicate-r14` | `019ebc1a-e309-7d42-b33d-bb84812379d2` | Dewey |
| `bf16-smallmant-r14` | `019ebc1a-e3ac-7b23-913a-7c4c323d5264` | Boyle |
| `unknown-state2-r14` | `019ebc1a-e422-7723-8e2a-22444143c263` | Ramanujan |
| `integer-isqrt-r14` | `019ebc1a-e4e1-7673-9544-a0ad8c45fc05` | Faraday |
