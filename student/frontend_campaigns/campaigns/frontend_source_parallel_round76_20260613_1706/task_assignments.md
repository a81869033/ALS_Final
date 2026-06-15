# Task Assignments

Run: `frontend_source_parallel_round76_20260613_1706`

Targets: current gap ratio > 1.5, excluding `ex286` and `ex287`.

| agent_id | cases | domain | focus | status |
| --- | --- | --- | --- | --- |
| sub-fp8-worst-r76 (`019ec040-0093-7ae2-b7e4-b64b83fd0887`) | ex247, ex246, ex244 | float_fp8 | rethink FP8 worst cases with non-table shared arithmetic descriptors | running |
| sub-fp8-mid-r76 (`019ec040-425b-7db2-b527-383ec7560912`) | ex249, ex241, ex240, ex245 | float_fp8 | source-level common decode plus low-bit residual compression | running |
| sub-unknown-r76 (`019ec041-1da5-7a71-a2b0-890ac923690f`) | ex297, ex299, ex285, ex288 | unknown | selector/cell/routing descriptors with compact cofactors | running |
| sub-fp16-r76 (`019ec041-8cf3-74f0-b9d2-d1bba9a1d63c`) | ex225, ex223 | fp16 | FP16 log/log10 low-bit residual structure beyond sparse/nested repeats | running |
| sub-integer-r76 (`019ec041-d213-7c90-a6e5-cd607d48f226`) | ex260, ex266 | integer | multiplier/divider source structures beyond r75 BW/wordmux families | running |

Shard outputs:
- `student/frontend_campaigns/campaigns/frontend_source_parallel_round76_20260613_1706/agent_shards/<agent_id>/`
- `student/frontend_campaigns/campaigns/frontend_source_parallel_round76_20260613_1706/agent_summaries/<agent_id>.md`
- `student/work/frontend_source_parallel_round76_20260613_1706/<agent_id>/<case>/`
- `student/runs/<domain>/frontend_source_parallel_round76_20260613_1706/<agent_id>/<case>/`
