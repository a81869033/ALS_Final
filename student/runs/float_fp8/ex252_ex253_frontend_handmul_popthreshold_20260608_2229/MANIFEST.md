# ex252_ex253_frontend_handmul_popthreshold_20260608_2229

Run ID: `ex252_ex253_frontend_handmul_popthreshold_20260608_2229`

Purpose: semantic frontend seeds for ex250-ex254 packed FP4/INT2 dot and FMA cases.

Artifacts:
- Work directory: `student/work/ex252_ex253_frontend_handmul_popthreshold_20260608_2229`
- Candidates CSV: `student/runs/float_fp8/ex252_ex253_frontend_handmul_popthreshold_20260608_2229/results/candidates.csv`
- Best CSV: `student/runs/float_fp8/ex252_ex253_frontend_handmul_popthreshold_20260608_2229/results/best.csv`

Semantic identification:
- ex250: packed two-lane FP4 E2M1 dot product, E4M3FN result.
- ex251: packed two-lane signed 3-bit magnitude dot product, E4M3FN result.
- ex252: packed four-lane unsigned 2-bit dot product, E4M3FN result.
- ex253: unsigned 2-bit lane reduction, `2 * sum(lanes)`, E4M3FN result.
- ex254: E4M3FN accumulator plus product of two FP4 E2M1 values from the low byte.

No `student/seeds` curation was performed.
