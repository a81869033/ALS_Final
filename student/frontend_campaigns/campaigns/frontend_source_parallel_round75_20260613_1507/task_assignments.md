# Task Assignments

Run: `frontend_source_parallel_round75_20260613_1507`

Targets: current-gap ratio > 1.5, excluding `ex286` and `ex287`.

| agent_id | cases | domain | status |
| --- | --- | --- | --- |
| sub-fp8-worst-r75 (`019ebfcf-eb82-7940-97e8-bf843dd25f1c`) | ex247, ex246, ex244 | float_fp8 | running |
| sub-fp8-mid-r75 (`019ebfd0-27a4-72b0-8345-2ea0f8e7f1b0`) | ex249, ex241, ex240, ex245 | float_fp8 | running |
| sub-unknown-r75 (`019ebfd0-856d-73f0-9654-3e8ce0494187`) | ex297, ex299, ex285, ex288 | unknown | running |
| sub-fp16-r75 (`019ebfd0-bd91-7f30-b663-99b35e614c83`) | ex225, ex223 | fp16 | running |
| sub-integer-r75 (`019ebfd0-f33f-7042-b757-08ea41876ed4`) | ex260, ex266 | integer | running |

All workers must write shard CSVs under:
`student/frontend_campaigns/campaigns/frontend_source_parallel_round75_20260613_1507/agent_shards/<agent_id>/`

Work artifacts must use:
`student/work/frontend_source_parallel_round75_20260613_1507/<agent_id>/<case>/`

Run records must use:
`student/runs/<domain>/frontend_source_parallel_round75_20260613_1507/<agent_id>/<case>/`
