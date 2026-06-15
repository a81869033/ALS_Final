# Task Assignments

Run: `frontend_synthflow_mutation_round90_20260614_0014`

| agent_id | cases | domain | focus | status |
| --- | --- | --- | --- | --- |
| sub-fp8-top-flow-r90 (`019ec1c5-4790-7ff3-b7b4-2f51fbae7c40`) | ex247, ex246, ex244, ex249 | float_fp8 | frontend synthesis-flow and source-boundary sweep on current best / round89 FP8 top candidates | complete: 8 official candidates, no improvement |
| sub-fp8-arith-flow-r90 (`019ec1c5-4905-7630-a8c3-e6de31910cf1`) | ex240, ex241, ex245 | float_fp8 | frontend synthesis-flow and source-boundary sweep on FP8 add/multiply candidates | complete: 12 official candidates, no improvement |
| sub-int-fp16-flow-r90 (`019ec1c5-49ad-7f82-a99c-29f45b405a24`) | ex223, ex225, ex260, ex266 | fp16/integer | frontend synthesis-flow and source-boundary sweep on FP16/integer candidates | complete: 10 official candidates, ties only/no improvement |
| sub-unknown-flow-r90 (`019ec1c5-4a7b-7ec2-877a-ad2c13819924`) | ex285, ex288, ex297, ex299 | unknown | current-best source-boundary triage and blocker rows if no bounded sweep is plausible | complete: 3 official candidates plus ex299 blocker, no improvement |
