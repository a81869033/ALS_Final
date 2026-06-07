# ex225_frontend_fp16_bitvec_shallow_20260607_1255

Stage: frontend shallow selected-bit vector-cover check.

Scope: `ex225`.

Purpose:
- Test whether selected output bits can share a vector run-cover rather than
  using independent bit-cover modules.

Results:
- Candidates CSV:
  `student/runs/fp16/ex225_frontend_fp16_bitvec_shallow_20260607_1255/results/candidates.csv`
- Best CSV:
  `student/runs/fp16/ex225_frontend_fp16_bitvec_shallow_20260607_1255/results/best.csv`

Outcome:
- Best default candidate was `bitvec_bits12_9_t32`, `11549/23/265627`.
- Default QoR did not beat the existing seed, but this source became useful
  after `abc_g_aig` in the follow-up run.
