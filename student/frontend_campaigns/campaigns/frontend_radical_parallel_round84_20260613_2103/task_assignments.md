# Task Assignments

Run: `frontend_radical_parallel_round84_20260613_2103`

| agent_id | cases | domain | focus | status |
| --- | --- | --- | --- | --- |
| sub-fp8-structural-r84 (`019ec117-3cb3-7d03-a663-ab58946b8dcf`) | ex247, ex246, ex244 | float_fp8 | new conversion datapath representations: shared exponent/saturation/rounding predicates, quotient/product/hypot decomposition, avoid r80-r83 anchors and feature-SOP repeats | complete: 6 official candidates, no improvement |
| sub-fp8-wide-r84 (`019ec117-3d50-7161-81fb-50cf749d2f96`) | ex249, ex241, ex240, ex245 | float_fp8 | less-attacked conversion cases: rederive high-level description, compare shared decode/residual table vs cofactored output grouping | complete: 8 official candidates, no improvement |
| sub-unknown-descriptor-r84 (`019ec117-3e16-7df0-9e09-aa594a03ba48`) | ex297, ex299 | unknown | cyclic 2-bit-symbol/state descriptor alternatives beyond transition masks and celllocal/pairsel selected-output mixes | complete: diagnostics/blockers only |
| sub-unknown-route-r84 (`019ec117-3fb3-7540-a605-d173e810282d`) | ex285, ex288 | unknown | Hamming-weight-preserving routing: new route normalizer/state descriptor, avoid keyBDD/symcof/pairdesc repeats | complete: 1 official candidate, no improvement |
| sub-arith-fp16-r84 (`019ec117-4168-7531-909f-a1363167b600`) | ex225, ex223, ex260, ex266 | fp16/integer | high-payoff math cases: log/log10 interval model or source-free minimization, signed multiply compressor families, unsigned division quotient-threshold alternatives | complete: 4 official candidates, no improvement |
