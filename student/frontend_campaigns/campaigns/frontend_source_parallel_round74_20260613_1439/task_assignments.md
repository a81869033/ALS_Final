# Task Assignments

Run: `frontend_source_parallel_round74_20260613_1439`

High-priority set: cases with current-gap ratio > 1.5 from `current_frontend_gap.csv`, excluding `ex286` and `ex287`.
Expanded frontend set: cases with pure frontend ratio > 1.5 from `frontend_best_registry.csv`.

| agent_id | cases | domain | status |
| --- | --- | --- | --- |
| sub-fp8-muldiv-r74 (`019ebfb7-8df1-7021-877f-334a2e95c169`) | ex246, ex247, ex241, ex248 | float_fp8 | completed, no global frontend improvement |
| sub-fp8-addhyp-r74 (`019ebfb7-def7-7dc3-bbe3-91cb554e7088`) | ex244, ex249, ex245, ex240 | float_fp8 | completed, no global frontend improvement |
| sub-unknown-rot2-r74 (`019ebfb8-740b-7222-9aa2-f0d98259e231`) | ex297, ex299 | unknown | completed, no global frontend improvement |
| sub-unknown-route-state-r74 (`019ebfb8-c662-74f3-a5e5-cd010f5829d0`) | ex285, ex288, ex292, ex294 | unknown | completed, no global frontend improvement |
| sub-integer-r74 (`019ebfb9-1270-78f1-a6ad-49773e1a8c35`) | ex260, ex266, ex273, ex274, ex276, ex265, ex267, ex270 | integer | completed, no global frontend improvement |
| sub-fp16-r74 (`019ebfb9-5df5-7010-bedb-c713c84bbd62`) | ex223, ex225, ex238 | fp16 | completed, no global frontend improvement; ex238 r74 candidate superseded by existing round27 22530 row |

All workers must write shard CSVs under:
`student/frontend_campaigns/campaigns/frontend_source_parallel_round74_20260613_1439/agent_shards/<agent_id>/`

Work artifacts must use:
`student/work/frontend_source_parallel_round74_20260613_1439/<agent_id>/<case>/`

Run records must use:
`student/runs/<domain>/frontend_source_parallel_round74_20260613_1439/<agent_id>/<case>/`
