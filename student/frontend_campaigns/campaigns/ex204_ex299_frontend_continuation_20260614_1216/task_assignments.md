# Task Assignments

Run ID: `ex204_ex299_frontend_continuation_20260614_1216`

All agents must keep case lists disjoint and write under:

- Work: `student/work/ex204_ex299_frontend_continuation_20260614_1216/<agent_id>/<case>/`
- Runs: `student/runs/<domain>/ex204_ex299_frontend_continuation_20260614_1216/<agent_id>/<case>/`
- Shards: `student/frontend_campaigns/campaigns/ex204_ex299_frontend_continuation_20260614_1216/agent_shards/<agent_id>/`
- Summary: `student/frontend_campaigns/campaigns/ex204_ex299_frontend_continuation_20260614_1216/agent_summaries/<agent_id>.md`

## Assigned Agents

| agent_id | worker | subagent id | cases | focus |
|---|---|---|---|---|
| `unknown-hard-r4` | Mendel | `019ec45c-7c94-7c23-9064-357ee65e0c09` | `ex286`, `ex287` | hard unknown decision/source descriptors, compact cofactor structures, non-repeated frontend RTL |
| `unknown-large-r4` | Archimedes | `019ec45c-7d81-7010-b3a3-0c98e9ccd72b` | `ex285`, `ex288`, `ex292`, `ex294`, `ex297`, `ex299` | large unknown routing/state descriptors, output grouping, pair/cell-local structures |
| `fp8-tail-transfer-r2` | Cicero | `019ec45c-7e65-70b0-b8d5-10b4cdc8cbce` | `ex241`, `ex244`, `ex246`, `ex247`, `ex249` | transfer tail/direct low-predicate and field-sharing structures across FP8 cases |
| `fp8-semantic-r2` | Popper | `019ec45c-7f6f-7323-873d-ae8e697d69da` | `ex240`, `ex245`, `ex248` | semantic FP8 add/conversion structures, compact residual predicates, special-case sharing |
| `arith-unary-r2` | Euclid | `019ec45c-80a0-79f1-a970-f22c578f7409` | `ex204`, `ex205`, `ex218`, `ex223`, `ex225`, `ex260`, `ex266`, `ex273`, `ex274`, `ex276` | integer algorithm RTL variants plus BF16/FP16 field/residual shared structures |
| `bf16-extra-r2` | Locke | `019ec460-e0e8-78b1-ae7d-8408da502589` | `ex200`, `ex201`, `ex214`, `ex215`, `ex216`, `ex219` | BF16 unary field/residual variants not overlapping arith-unary cases |
| `fp16-extra-r2` | Halley | `019ec467-7727-7211-b89f-0f7f1bc012fa` | `ex221`, `ex224`, `ex229`, `ex234`, `ex236` | FP16 unary field/source variants not overlapping arith-unary cases |
| `integer-extra-r2` | Pauli | `019ec468-eae3-7e11-bfa0-8f62082f1949` | `ex256`, `ex261`, `ex265`, `ex267`, `ex270`, `ex271`, `ex272`, `ex277` | integer arithmetic RTL variants not overlapping arith-unary cases |
| `unknown-hard-r5` | Nash | `019ec46d-7999-7e93-bcca-62335b37a677` | `ex286`, `ex287` | second hard unknown pass after r4 failed; selector minimization and current-best source-RTL compression |
| `fp8-source-compress-r3` | Galileo | `019ec476-ca51-7f00-bd39-5dc076e9ecbc` | `ex241`, `ex244`, `ex246` | FP8 current-best source compression and field-class decision graph; excludes failed tail-transfer/shared-BDD direct repeats |
| `fp8-output-plane-r3` | Kuhn | `019ec477-1253-7873-82fd-119bee0b5941` | `ex240`, `ex245`, `ex247`, `ex248`, `ex249` | FP8 output-plane residual minimization and source-level Verilog compression; excludes failed direct arithmetic/tail-transfer repeats |

## Status

- `2026-06-14 12:16 +0800`: campaign initialized from current frontend registry.
- `2026-06-14 12:17 +0800`: five frontend-only worker subagents spawned.
- `2026-06-14 12:19 +0800`: added three disjoint extra assignment rows for remaining high-ratio BF16/FP16/integer cases; only `bf16-extra-r2` spawned immediately because the subagent thread limit was reached.
- `2026-06-14 12:27 +0800`: `fp8-tail-transfer-r2` completed and was closed; `fp16-extra-r2` was spawned in the freed slot.
- `2026-06-14 12:30 +0800`: `unknown-hard-r4` completed and was closed; `integer-extra-r2` was spawned in the freed slot.
- `2026-06-14 12:36 +0800`: added `unknown-hard-r5` as a second focused pass for `ex286`/`ex287`, excluding r4 paircanon/boundary-bypass directions.
- `2026-06-14 12:49 +0800`: added two FP8 r3 follow-up workers targeting source compression and output-plane residual minimization after r2 tail/semantic shards produced no new high-gap improvements.
