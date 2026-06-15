# Task Assignments

Run: `frontend_highlevel_factor_round88_20260613_2335`

| agent_id | cases | domain | focus | status |
| --- | --- | --- | --- | --- |
| sub-fp8-range-r88 (`019ec1a2-9e5d-7903-bfe5-a4b0400b945c`) | ex247, ex246, ex244, ex249 | float_fp8 | rediscover compact range/product/hypot descriptors and shared output clusters | complete: blocker-only, descriptors too large |
| sub-fp8-arith-r88 (`019ec1a2-a046-7e12-aeea-464f8b8d774c`) | ex240, ex241, ex245 | float_fp8 | derive exact add/multiply formulas with bounded cancellation/product residuals | complete: blocker-only, compact residual screens too dense |
| sub-unknown-spectral-r88 (`019ec1a2-a292-7fc0-8751-0baad8b2e2f8`) | ex285, ex288, ex297, ex299 | unknown | spectral/ANF/state mining for lower-dimensional unknown descriptors | complete: blocker-only, spectral/ANF residuals too large |
| sub-fp16-int-factor-r88 (`019ec1a2-a448-70f1-a1d9-3c8fb1d78e7e`) | ex223, ex225, ex260, ex266 | fp16/integer | exact multi-output factoring for log/log10, multiplier, and divider cases | complete: blocker-only, dense residual/support evidence |
