# Task Assignments

Run: `frontend_truthroot_parallel_round86_20260613_2221`

| agent_id | cases | domain | focus | status |
| --- | --- | --- | --- | --- |
| sub-fp8-root-r86 (`019ec15e-601a-7ce0-9dc4-d73c4bc0220b`) | ex247, ex246, ex244, ex249 | float_fp8 | truth-mined shared predicates plus structural RTL decision graphs | complete: 12 official candidates, no improvement |
| sub-fp8-addmul-root-r86 (`019ec15e-60e0-7fa1-bab5-f66dffec0570`) | ex241, ex240, ex245 | float_fp8 | shared cancellation/product/add roots and exact low-cost residual bits; avoid r85 field/output-cluster repeats | complete: checkpoint/mining only, no candidate |
| sub-fp8-addmul-struct-r86 (`019ec16d-8bb3-7263-a641-b6f06c644798`) | ex241, ex240, ex245 | float_fp8 | decision graph and structural RTL extension after weak root mining | complete: 3 official candidates, no improvement |
| sub-unknown-root-r86 (`019ec15e-6165-7033-98a5-c83a7cfb52e3`) | ex285, ex288, ex297, ex299 | unknown | selected-output roots plus learned multi-output decision DAGs | complete: 4 official candidates, no improvement |
| sub-fp16-int-root-r86 (`019ec15e-627c-7d20-97cd-7c581f377411`) | ex223, ex225, ex260, ex266 | fp16/integer | FP16 log/log10 truth-root output bits; integer multiplier/divider exact bit root banks beyond r85 word-cover/output-cluster forms | complete: 8 official candidates, ex223 frontend improved by 95 ADP |
