# Task Assignments

Run ID: `ex200_ex299_frontend_parallel_shared_20260612_1422`

Coordinator responsibilities:
- Maintain this manifest, task assignments, merged `results/*.csv`, and final campaign index rebuild.
- Merge subagent shards after checking path uniqueness, method signature uniqueness, and official `evaluate.py` evidence.
- Apply shared CSV updates only after verifying candidate paths and metrics.

| agent_id | domain | cases | work scope | shard scope |
|---|---|---|---|---|
| `fp16-agent` | `fp16` | `ex223`, `ex224`, `ex225` | `student/work/ex200_ex299_frontend_parallel_shared_20260612_1422/fp16-agent/<case>/` | `student/frontend_campaigns/campaigns/ex200_ex299_frontend_parallel_shared_20260612_1422/agent_shards/fp16-agent/` |
| `float-fp8-agent` | `float_fp8` | `ex240`, `ex241`, `ex242`, `ex244`, `ex245`, `ex246`, `ex247`, `ex248`, `ex249`, `ex253` | `student/work/ex200_ex299_frontend_parallel_shared_20260612_1422/float-fp8-agent/<case>/` | `student/frontend_campaigns/campaigns/ex200_ex299_frontend_parallel_shared_20260612_1422/agent_shards/float-fp8-agent/` |
| `unknown-a-agent` | `unknown` | `ex280`, `ex281`, `ex282`, `ex283`, `ex284`, `ex285`, `ex286`, `ex287`, `ex288`, `ex289` | `student/work/ex200_ex299_frontend_parallel_shared_20260612_1422/unknown-a-agent/<case>/` | `student/frontend_campaigns/campaigns/ex200_ex299_frontend_parallel_shared_20260612_1422/agent_shards/unknown-a-agent/` |
| `unknown-b-agent` | `unknown` | `ex290`, `ex291`, `ex292`, `ex293`, `ex294`, `ex295`, `ex296`, `ex297`, `ex298`, `ex299` | `student/work/ex200_ex299_frontend_parallel_shared_20260612_1422/unknown-b-agent/<case>/` | `student/frontend_campaigns/campaigns/ex200_ex299_frontend_parallel_shared_20260612_1422/agent_shards/unknown-b-agent/` |
| `integer-agent` | `integer` | `ex256`, `ex260`, `ex261`, `ex266`, `ex270`, `ex276`, `ex277` | `student/work/ex200_ex299_frontend_parallel_shared_20260612_1422/integer-agent/<case>/` | `student/frontend_campaigns/campaigns/ex200_ex299_frontend_parallel_shared_20260612_1422/agent_shards/integer-agent/` |
| `bf16-agent` | `bf16` | `ex200`, `ex204`, `ex205` | `student/work/ex200_ex299_frontend_parallel_shared_20260612_1422/bf16-agent/<case>/` | `student/frontend_campaigns/campaigns/ex200_ex299_frontend_parallel_shared_20260612_1422/agent_shards/bf16-agent/` |

## Completion Status

| agent_id | status | official evaluated rows | accepted frontend improvements |
|---|---|---:|---:|
| `fp16-agent` | completed | 21 | 3 |
| `float-fp8-agent` | completed | 30 | 0 |
| `unknown-a-agent` | completed | 70 | 0 |
| `unknown-b-agent` | completed | 20 | 0 |
| `integer-agent` | completed | 54 | 2 |
| `bf16-agent` | completed | 6 official best/check rows; 100 synthesized AIG artifacts | 3 |

Shared constraints:
- Case lists are disjoint.
- `iverilog` is debug-only; official validity is from repo `evaluate.py`.
- Do not update `student/seeds`.
- Do not repeat `do_not_repeat_as_is` or low-value methods unless the method signature is materially different.
- Do not paste large Verilog or logs into chat; write files and summarize paths.
