# Round27 Task Assignments

Run ID: `ex200_ex299_frontend_refgap_round27_20260613_0613`

Coordinator assumptions:
- Case lists are disjoint.
- Agents must write only under their own `<run_id>/<agent_id>/<case>/` paths and shard paths.
- Agents must not edit `prompt_log.md`, `student/seeds`, or global registry/search/gap CSVs.
- Coordinator will merge shards, verify official `evaluate.py` status, update global CSVs when appropriate, and rebuild the index.
- Every long synthesis/evaluate command should use about 60s timeout; timeout/blockers must be recorded instead of hanging the run.

Assignments:

| agent_id | cases | focus |
|---|---|---|
| `unknown-worst-r27` | `ex286`, `ex287`, `ex285`, `ex288` | Worst unknown normalizer gaps. Avoid r26 pairfield shared/split BDD and hidden-order local-rule screen replay, plus prior symcof/key-BDD exact replays. |
| `fp8-a-r27` | `ex247`, `ex246`, `ex244`, `ex240` | Worst FP8 conversion gaps. Avoid r26 qclass/bound/threshold/same-delta families unless the high-level semantics or sharing changes materially. |
| `fp8-b-r27` | `ex245`, `ex241`, `ex242`, `ex249`, `ex248` | Remaining FP8 gaps. Avoid r26 gap/product/formula/periodic/threshold replay; seek new predicate sharing or output grouping. |
| `unknown-large-r27` | `ex297`, `ex299`, `ex294`, `ex295`, `ex292` | Large unknown transforms. Avoid r26 cell-prefix/stride2 descriptor/residual BDD families and r24/r25 symbol-plane replay. |
| `mixed-uncovered-r27` | `ex225`, `ex223`, `ex216`, `ex219`, `ex205`, `ex238`, `ex224`, `ex265`, `ex270`, `ex267` | High-gap cases not fully covered by round26. Avoid exact round26/r25/r24 nonwinning RTL and source-flow replay. |

Runtime agent IDs:
- `unknown-worst-r27`: `019ebde9-1986-7742-83e4-0672f892f033`
- `fp8-a-r27`: `019ebde9-1d0b-7c23-bdf0-8b69f07d4350`
- `fp8-b-r27`: `019ebde9-202b-79b0-a85d-e24ed2a3fcd8`
- `unknown-large-r27`: `019ebde9-242b-79d2-a1a5-66b73f6be731`
- `mixed-uncovered-r27`: `019ebde9-2c4f-7342-aa76-c253fddd258d`

Replacement agent:
- `unknown-large-r27` was shut down after failing to create durable shard files after checkpoints.
- `unknown-large-r27b`: `019ebdf2-f835-7cc2-9e5c-27f86e4c9a63`

Required per-agent outputs:
- `candidates.csv`
- `evaluation_results.csv`
- `best_improvements.csv`
- `failed_hypotheses.csv`
- `simulation_results.csv`
- `shared_structure_report.csv`
- `case_outcomes.csv`
- `agent_summaries/<agent_id>.md`

Launch prompt logged in `prompt_log.md` at `2026-06-13 06:13:55 +0800`.
