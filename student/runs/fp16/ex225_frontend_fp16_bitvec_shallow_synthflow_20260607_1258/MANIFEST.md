# ex225_frontend_fp16_bitvec_shallow_synthflow_20260607_1258

Stage: frontend Yosys synthflow follow-up.

Scope: `ex225`.

Purpose:
- Re-emit the bitvec shallow candidates with the single `abc -g aig` path.

Results:
- Candidates CSV:
  `student/runs/fp16/ex225_frontend_fp16_bitvec_shallow_synthflow_20260607_1258/results/candidates.csv`
- Best CSV:
  `student/runs/fp16/ex225_frontend_fp16_bitvec_shallow_synthflow_20260607_1258/results/best.csv`

Outcome:
- `bitvec_bits12_9_t32_abc_g_aig` improved ex225 to
  `11512/21/241752`.
- `bitvec_bits12_10_t16` and `bitvec_bits12_9_10_t32` were worse.
