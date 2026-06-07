# ex225_frontend_fp16_bitvec_highbits_synthflow_20260607_1305

Stage: frontend Yosys synthflow follow-up.

Scope: `ex225`.

Purpose:
- Re-emit high-bit bitvec candidates with the single `abc -g aig` path.

Results:
- Candidates CSV:
  `student/runs/fp16/ex225_frontend_fp16_bitvec_highbits_synthflow_20260607_1305/results/candidates.csv`
- Best CSV:
  `student/runs/fp16/ex225_frontend_fp16_bitvec_highbits_synthflow_20260607_1305/results/best.csv`

Outcome:
- `bitvec_bits14_12_9_t32_abc_g_aig` improved ex225 to
  `11511/21/241731`.
- `bitvec_bits13_12_9_t32_abc_g_aig` had lower area (`11474`) but delay `22`,
  so ADP was worse.
