# ex225_frontend_fp16_manual_best_neighbor_20260607_1343

Stage: frontend Yosys synthflow exclusion check.

Scope: `ex225`.

Purpose:
- Check whether neighbors of `abc_g_aig` can improve the new manual shallow
  best seed.

Results:
- Candidates CSV:
  `student/runs/fp16/ex225_frontend_fp16_manual_best_neighbor_20260607_1343/results/candidates.csv`
- Best CSV:
  `student/runs/fp16/ex225_frontend_fp16_manual_best_neighbor_20260607_1343/results/best.csv`

Outcome:
- `abc_g_aig_d18` through `abc_g_aig_d21` reproduced
  `11509/21/241689`.
- `gates` and `cmos2` were worse.
- No curated seed change.
