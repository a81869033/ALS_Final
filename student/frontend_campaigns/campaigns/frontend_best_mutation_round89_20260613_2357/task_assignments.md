# Task Assignments

Run: `frontend_best_mutation_round89_20260613_2357`

| agent_id | cases | domain | focus | status |
| --- | --- | --- | --- | --- |
| sub-fp8-top-mutate-r89 (`019ec1b5-aebe-7252-99e2-3d19260096d2`) | ex247, ex246, ex244, ex249 | float_fp8 | mutate current best FP8 range/product/hypot RTL around shared mux/decode boundaries | complete: 4 official candidates, no improvement |
| sub-fp8-arith-mutate-r89 (`019ec1b5-afb0-7ed2-aab1-1d8c2a4356ea`) | ex240, ex241, ex245 | float_fp8 | mutate current best FP8 add/multiply RTL around cancellation/product rounding signals | complete: 3 official candidates, no improvement |
| sub-integer-small-r89 (`019ec1b5-b139-75e3-9076-191caa0938fe`) | ex260, ex266 | integer | small exact RTL enumeration/mutation for multiplier and divider cases | complete: 3 official candidates, no improvement |
| sub-fp16-unknown-triage-r89 (`019ec1b5-b359-7850-bfb7-a3a835db567b`) | ex223, ex225, ex285, ex288, ex297, ex299 | fp16/unknown | only run a candidate if a local mutation is clearly plausible; otherwise blocker evidence | complete: blocker-only, no candidate emitted |
