# Task Assignments

Run: `frontend_source_parallel_round73_20260613_1404`

| agent_id | cases | domain | status |
| --- | --- | --- | --- |
| sub-fp8-muldiv-r73 (`019ebf96-36b6-7962-9a77-7e83e591415f`) | ex246, ex247, ex241 | float_fp8 | completed, no improvement |
| sub-fp8-addhyp-r73 (`019ebf96-387f-70b1-8b25-4ed1be1ac271`) | ex240, ex244, ex245, ex249 | float_fp8 | completed, no improvement |
| sub-unknown-r73 (`019ebf96-3a75-74b0-a5d9-3e1f7a75a710`) | ex285, ex288, ex297, ex299 | unknown | completed, improved ex297/ex299 |
| sub-fp16-int-r73 (`019ebf96-3b70-7693-97ca-1dbc63ace6d8`) | ex223, ex225, ex260, ex266 | fp16/integer | completed, no improvement |

All workers must write shard CSVs under:
`student/frontend_campaigns/campaigns/frontend_source_parallel_round73_20260613_1404/agent_shards/<agent_id>/`

Work artifacts must use:
`student/work/frontend_source_parallel_round73_20260613_1404/<agent_id>/<case>/`

Run records must use:
`student/runs/<domain>/frontend_source_parallel_round73_20260613_1404/<agent_id>/<case>/`
