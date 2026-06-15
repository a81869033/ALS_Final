# Task Assignments

Run: `frontend_source_parallel_round72_20260613_1338`

| agent_id | cases | domain | status |
| --- | --- | --- | --- |
| sub-fp8-muldiv-r72 (`019ebf7e-f729-7a53-864c-a32854090300`) | ex246, ex247, ex241 | float_fp8 | completed, no improvement |
| sub-fp8-addhyp-r72 (`019ebf7f-1019-79c0-901a-249f974274a0`) | ex240, ex244, ex245, ex249 | float_fp8 | completed, no improvement |
| sub-unknown-r72 (`019ebf7f-1ad6-7dd2-915c-9c6d3ca874cc`) | ex285, ex288, ex297, ex299 | unknown | completed, no improvement |
| sub-fp16-int-r72 (`019ebf7f-1e62-7ed0-994a-7e95e6975a9a`) | ex223, ex225, ex260, ex266 | fp16/integer | completed, no improvement |

All workers must write shard CSVs under:
`student/frontend_campaigns/campaigns/frontend_source_parallel_round72_20260613_1338/agent_shards/<agent_id>/`

Work artifacts must use:
`student/work/frontend_source_parallel_round72_20260613_1338/<agent_id>/<case>/`

Run records must use:
`student/runs/<domain>/frontend_source_parallel_round72_20260613_1338/<agent_id>/<case>/`
