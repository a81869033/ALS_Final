# Task Assignments

Run ID: `ex223_ex299_frontend_parallel_deep_20260614_0943`

All agents must keep case lists disjoint and write only under:

- `student/work/ex223_ex299_frontend_parallel_deep_20260614_0943/<agent_id>/<case>/`
- `student/runs/<domain>/ex223_ex299_frontend_parallel_deep_20260614_0943/<agent_id>/<case>/`
- `student/frontend_campaigns/campaigns/ex223_ex299_frontend_parallel_deep_20260614_0943/agent_shards/<agent_id>/`
- `student/frontend_campaigns/campaigns/ex223_ex299_frontend_parallel_deep_20260614_0943/agent_summaries/<agent_id>.md`

| agent_id | cases | focus |
| --- | --- | --- |
| `unknown-ex286-agent` | `ex286` | hard unknown sym/cofactor/routing rethink |
| `unknown-ex287-agent` | `ex287` | hard unknown sym/cofactor/routing rethink |
| `unknown-cell-agent` | `ex285`, `ex288`, `ex297`, `ex299` | routing/cell descriptor and decision graph variants |
| `unknown-state-agent` | `ex292`, `ex294`, `ex296`, `ex298` | permutation/state/cofactor and split descriptor variants |
| `float-fp8-agent` | `ex240`, `ex241`, `ex244`, `ex245`, `ex246`, `ex247`, `ex248`, `ex249` | conversion high-level recuts and shared round/saturate/decode logic |
| `fp16-agent` | `ex223`, `ex224`, `ex225` | FP16 unary log/log10/sqrt style semantic recuts |
| `integer-agent` | `ex260`, `ex266`, `ex270`, `ex273`, `ex274`, `ex276` | arithmetic RTL, BDD top splits, shared subtract/partial products |
| `bf16-agent` | `ex204`, `ex216`, `ex218`, `ex219` | BF16 unary semantic recuts and selected-bit residual sharing |
| `unknown-hard-r2-agent` | `ex286`, `ex287` | follow-up after completed hard-case shards; avoid bucket/key-table and k4 vector-mask neighborhoods |
| `fp16-r2-agent` | `ex223`, `ex224`, `ex225` | follow-up after ex224 wrapper improvement; extend wrapper/output-group recuts |

## Launch Status

| agent_id | tool_agent_id | status |
| --- | --- | --- |
| `unknown-ex286-agent` | `019ec3cf-a2d9-7400-a0b9-e86a3909942b` | completed; no new frontend best |
| `unknown-ex287-agent` | `019ec3cf-a3ad-7581-8aaf-241bb805f64e` | completed; new frontend best ADP 26880 |
| `unknown-cell-agent` | `019ec3cf-a471-71a1-9f1e-90ea4c485da5` | completed; new clean frontend best for `ex285`, `ex299` |
| `unknown-state-agent` | `019ec3cf-a6a5-7552-8f8b-418cb509ca31` | completed; no new frontend best |
| `float-fp8-agent` | `019ec3cf-a95c-7eb3-bcba-c22d0493c2a3` | completed; no new frontend best |
| `fp16-agent` | `019ec3cf-ac5a-7d50-8d30-2ef7879de81d` | completed; improved `ex224` to ADP 93568 |
| `integer-agent` | `019ec3e4-72ff-7443-aa45-18da73fedf3c` | completed; new frontend best for `ex260` |
| `bf16-agent` | `019ec3e6-6441-7c83-b7be-915888f2db82` | completed; no new frontend best |
| `unknown-hard-r2-agent` | `019ec3e9-1ef0-7fc0-80e5-83a845c6edf4` | completed; no new frontend best |
| `fp16-r2-agent` | `019ec3e9-207e-7840-9b1c-8991ec3b9a5d` | completed; improved `ex224` to ADP 93072 |

## Coordinator Merge

- Root results merged in `results/*.csv`.
- Official OK/equivalent rows: 157.
- Best clean frontend improvements: `ex224`, `ex260`, `ex285`, `ex287`, `ex299`.
- Frontend-only scope audit: no backend portfolio/remap candidates were promoted; old backend-derived registry rows are filtered during index rebuild.
