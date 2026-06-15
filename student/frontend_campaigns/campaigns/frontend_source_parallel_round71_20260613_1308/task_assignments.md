# Task Assignments

Run: `frontend_source_parallel_round71_20260613_1308`

| agent_id | cases | domain | status |
| --- | --- | --- | --- |
| sub-fp8-arith-hybrid-r71 (`019ebf63-e11e-74e2-86f0-b0b77f42eb2b`) | ex246, ex247, ex241, ex242 | float_fp8 | completed, ex242 improved |
| sub-fp8-addhyp-hybrid-r71 (`019ebf63-e18d-75c1-b81e-d813cf42364b`) | ex240, ex244, ex245, ex249 | float_fp8 | completed, no improvement |
| sub-unknown-hybrid-r71 (`019ebf63-e237-7321-8099-70f11d085bfa`) | ex285, ex288, ex297, ex299 | unknown | completed, no improvement |
| sub-fp16-int-hybrid-r71 (`019ebf63-e303-7252-b8f9-cb4c8cc707f3`) | ex223, ex225, ex260, ex266 | fp16/integer | completed, no improvement |

All workers must write shard CSVs under:
`student/frontend_campaigns/campaigns/frontend_source_parallel_round71_20260613_1308/agent_shards/<agent_id>/`

Work artifacts must use:
`student/work/frontend_source_parallel_round71_20260613_1308/<agent_id>/<case>/`

Run records must use:
`student/runs/<domain>/frontend_source_parallel_round71_20260613_1308/<agent_id>/<case>/`
