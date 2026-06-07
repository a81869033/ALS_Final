# ex225_frontend_fp16_manual_shallow_synthflow_20260607_1315

Stage: frontend Yosys synthflow follow-up.

Scope: `ex225`.

Purpose:
- Re-emit hand-derived shallow predicate candidates with the single
  `abc -g aig` path.

Results:
- Candidates CSV:
  `student/runs/fp16/ex225_frontend_fp16_manual_shallow_synthflow_20260607_1315/results/candidates.csv`
- Best CSV:
  `student/runs/fp16/ex225_frontend_fp16_manual_shallow_synthflow_20260607_1315/results/best.csv`

Outcome:
- New current best:
  `manual_ex225_bitvec12_9_bit14_abc_g_aig`, `11509/21/241689`.
- Official `evaluate.py --case ex225` returned OK.
