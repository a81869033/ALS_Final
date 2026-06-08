# ex250_frontend_magprod_quant_followup_20260608_2258

Run ID: `ex250_frontend_magprod_quant_followup_20260608_2258`

Purpose: semantic frontend seeds for ex250-ex254 packed FP4/INT2 dot and FMA cases.

Artifacts:
- Work directory: `student/work/ex250_frontend_magprod_quant_followup_20260608_2258`
- Candidates CSV: `student/runs/float_fp8/ex250_frontend_magprod_quant_followup_20260608_2258/results/candidates.csv`
- Best CSV: `student/runs/float_fp8/ex250_frontend_magprod_quant_followup_20260608_2258/results/best.csv`

Semantic identification:
- ex250: packed two-lane FP4 E2M1 dot product, E4M3FN result.
- ex251: packed two-lane signed 3-bit magnitude dot product, E4M3FN result.
- ex252: packed four-lane unsigned 2-bit dot product, E4M3FN result.
- ex253: unsigned 2-bit lane reduction, `2 * sum(lanes)`, E4M3FN result.
- ex254: E4M3FN accumulator plus product of two FP4 E2M1 values from the low byte.

No `student/seeds` curation was performed.
