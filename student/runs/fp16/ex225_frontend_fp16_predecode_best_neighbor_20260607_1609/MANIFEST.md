# ex225_frontend_fp16_predecode_best_neighbor_20260607_1609

Run ID: `ex225_frontend_fp16_predecode_best_neighbor_20260607_1609`

Purpose: Limited Yosys synthesis-flow neighbor check for the new `ex225`
predecode best.

Inputs:
- Seed CSV: `student/runs/fp16/ex225_frontend_fp16_predecode_all_abcg_20260607_1550/results/best.csv`
- Truth file: `benchmarks/ex225.truth`

Artifacts:
- Work directory: `student/work/ex225_frontend_fp16_predecode_best_neighbor_20260607_1609/`
- Candidates CSV: `student/runs/fp16/ex225_frontend_fp16_predecode_best_neighbor_20260607_1609/results/candidates.csv`
- Best CSV: `student/runs/fp16/ex225_frontend_fp16_predecode_best_neighbor_20260607_1609/results/best.csv`

Best result:
- `11488/21/241248`; `abc_g_aig_d18..d21` reproduced the same result.

Notes:
- Frontend-only Yosys emission check; no backend optimization portfolio.
