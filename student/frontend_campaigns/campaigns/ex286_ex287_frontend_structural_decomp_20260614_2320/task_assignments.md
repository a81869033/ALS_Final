# Task Assignments

Run ID: `ex286_ex287_frontend_structural_decomp_20260614_2320`

Coordinator owns:
- prompt logging
- campaign manifest
- final merge and official acceptance
- registry/index updates only after official `evaluate.py` OK improvements

Agents:

| agent_id | case list | owned output prefix | required focus |
| --- | --- | --- | --- |
| `ex286-struct-r1` | `ex286` | `student/work/ex286_ex287_frontend_structural_decomp_20260614_2320/ex286-struct-r1/ex286/` | decision graph / structural RTL over a newly identified nonlinear routing state; avoid unchanged symcof selector or residual BDD replay |
| `ex287-struct-r1` | `ex287` | `student/work/ex286_ex287_frontend_structural_decomp_20260614_2320/ex287-struct-r1/ex287/` | split decision graph / structural RTL beyond current k4 vector case; search for shared cofactors or compact nonlinear state |
| `ex286-struct-r2` | `ex286` | `student/work/ex286_ex287_frontend_structural_decomp_20260614_2320/ex286-struct-r2/ex286/` | two-hot image cluster and output-linear parity descriptor probes |
| `ex287-struct-r2` | `ex287` | `student/work/ex286_ex287_frontend_structural_decomp_20260614_2320/ex287-struct-r2/ex287/` | outside-in shared BDD and orientation/source descriptor probes |
| `ex286-struct-r3` | `ex286` | `student/work/ex286_ex287_frontend_structural_decomp_20260614_2320/ex286-struct-r3/ex286/` | two-hot collision-lift and image-field reconstruction |
| `ex287-struct-r3` | `ex287` | `student/work/ex286_ex287_frontend_structural_decomp_20260614_2320/ex287-struct-r3/ex287/` | pair-orientation omission and collision-lift residual probes |
| `coordinator-orientbdd-r1` | `ex286, ex287` | `student/work/ex286_ex287_frontend_structural_decomp_20260614_2320/coordinator-orientbdd-r1/` | output-image adjacent-pair count/orientation encoding; ex287 k6 symmetry-key cofactor improvement |

Shard outputs:
- `student/frontend_campaigns/campaigns/ex286_ex287_frontend_structural_decomp_20260614_2320/agent_shards/<agent_id>/candidates.csv`
- `student/frontend_campaigns/campaigns/ex286_ex287_frontend_structural_decomp_20260614_2320/agent_shards/<agent_id>/evaluation_results.csv`
- `student/frontend_campaigns/campaigns/ex286_ex287_frontend_structural_decomp_20260614_2320/agent_shards/<agent_id>/failed_hypotheses.csv`
- `student/frontend_campaigns/campaigns/ex286_ex287_frontend_structural_decomp_20260614_2320/agent_summaries/<agent_id>.md`

Non-repeat guardrails:
- Do not repeat current symcof/cofactor mux/selector/inner-order neighborhoods without a materially new hidden-state basis.
- Do not emit exact bucket/key table, key-BDD, MDD, residual BDD, or lane-parity repair forms unchanged.
- Use `iverilog` only for debug. Official acceptance is only through `evaluate.py`.
