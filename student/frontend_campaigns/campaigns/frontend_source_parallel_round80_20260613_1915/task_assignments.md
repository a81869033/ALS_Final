# Task Assignments

Run: `frontend_source_parallel_round80_20260613_1915`

| agent_id | cases | domain | focus | status |
| --- | --- | --- | --- | --- |
| sub-fp16-source-r80 (`019ec0b4-8b5a-7270-90fa-0297ffb26784`) | ex223, ex225 | fp16 | improve log/log10 frontend-best source boundaries; try new high-level grouping if current sparse residual is exhausted | completed; no improvement |
| sub-fp8-struct-r80 (`019ec0b4-8c39-76d0-9870-8025c7523561`) | ex240, ex241, ex244, ex245, ex246, ex247, ex248, ex249 | float_fp8 | FP16/BF16-to-FP8 conversion source structures: shared decode, rounding/saturation predicates, table factoring | completed; no improvement |
| sub-integer-front-r80 (`019ec0b4-8cc4-7f81-9212-1aa223268dcf`) | ex260, ex265, ex266, ex267, ex270, ex273, ex274, ex276 | integer | source-level arithmetic structures and shared partial-product/trial networks; no backend | completed; no improvement |
| sub-unknown-route-r80 (`019ec0b4-8d86-77c0-bd56-7cd8a7789b32`) | ex285, ex288, ex292, ex294 | unknown | routing/permutation/key-BDD/shared cofactor source representations | completed; ex294 frontend improved |
| sub-unknown-large-r80 (`019ec0b4-8fa7-75f3-b890-b98168ce2d0d`) | ex297, ex299 | unknown | 2-bit symbol rot2/cell descriptor variants and output cofactor sharing around latest ex299 best | coordinator-finalized; no improvement |
