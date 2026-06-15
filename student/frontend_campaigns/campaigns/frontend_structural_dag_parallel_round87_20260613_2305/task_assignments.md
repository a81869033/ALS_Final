# Task Assignments

Run: `frontend_structural_dag_parallel_round87_20260613_2305`

| agent_id | cases | domain | focus | status |
| --- | --- | --- | --- | --- |
| sub-fp8-guard-r87 (`019ec188-70ae-78a0-95cb-ea961e046e66`) | ex247, ex246, ex244, ex249 | float_fp8 | guarded conversion/range datapath structural RTL plus shared round/saturation predicates | complete: 8 official candidates, no improvement |
| sub-fp8-arith-r87 (`019ec188-71e1-7e63-a787-5c42e84093ec`) | ex241, ex240, ex245 | float_fp8 | add/multiply semantic structural RTL with shared cancellation/product/normalize/sticky decision graph | complete: 2 official equivalent nonwinning, 1 non-equivalent |
| sub-unknown-route-r87 (`019ec188-72b0-7180-b6fc-6a7ec3196318`) | ex285, ex288 | unknown | route/popcount descriptor decision graphs and reusable small cofactor modules | complete: 2 official candidates, no improvement |
| sub-unknown-cell-r87 (`019ec188-73cc-7ba3-8097-1b30b3fe8497`) | ex297, ex299 | unknown | 2-bit cell/state structural RTL, GF(2)/ANF roots, and predicate DAGs | complete: screened noncompact, no candidate |
| sub-fp16-int-r87 (`019ec188-7626-7c92-b37b-ccbfd3f340c1`) | ex223, ex225, ex260, ex266 | fp16/integer | multi-output log/log10 structural roots plus multiplier/divider threshold/compare RTL | complete: 4 official candidates, no improvement |
