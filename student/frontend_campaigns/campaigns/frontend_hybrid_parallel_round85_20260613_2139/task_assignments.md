# Task Assignments

Run: `frontend_hybrid_parallel_round85_20260613_2139`

| agent_id | cases | domain | focus | status |
| --- | --- | --- | --- | --- |
| sub-fp8-top-hybrid-r85 (`019ec137-f037-7092-848c-766a28d6fef1`) | ex247, ex246, ex244 | float_fp8 | bit-cluster hybrid Verilog over current frontend best plus residual-only active-region replacements; avoid whole-word/nibble descriptor tables from r84 | complete: 3 official candidates, no improvement |
| sub-fp8-wide-hybrid-r85 (`019ec137-f0e9-78d1-95ff-e6409770628a`) | ex249, ex241, ex240, ex245 | float_fp8 | output-bit cost isolation, shared rounding/cancellation predicate roots, current-best-source decomposition; avoid r84 semantic/table BDD forms | complete: 4 official candidates, no improvement |
| sub-unknown-hybrid-r85 (`019ec137-f16e-79c3-a392-2fdd71d967d7`) | ex285, ex288, ex297, ex299 | unknown | source-level output-group grafting and compact residual screens after r84 descriptor conflicts; avoid full-ring/full-table descriptors | complete: 7 official candidates, no improvement; ex299 synth blockers only |
| sub-fp16-int-hybrid-r85 (`019ec137-f222-7781-ba42-e235ded7cf73`) | ex223, ex225, ex260, ex266 | fp16/integer | FP16 log/log10 high-cost bit residual replacement; integer compressor/quotient output clusters materially different from r84 word-cover forms | complete: 4 official candidates, no improvement |
