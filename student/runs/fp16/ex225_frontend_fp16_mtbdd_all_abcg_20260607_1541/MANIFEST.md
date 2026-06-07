# ex225_frontend_fp16_mtbdd_all_abcg_20260607_1541

Run ID: `ex225_frontend_fp16_mtbdd_all_abcg_20260607_1541`

Purpose: Re-synthesize exact MTBDD selected-bit candidates for `ex225` with
single Yosys `abc -g aig` emission.

Inputs:
- Source run: `student/runs/fp16/ex225_frontend_fp16_mtbdd_correction_20260607_1539/`
- Truth file: `benchmarks/ex225.truth`

Artifacts:
- Work directory: `student/work/ex225_frontend_fp16_mtbdd_all_abcg_20260607_1541/`
- Candidates CSV: `student/runs/fp16/ex225_frontend_fp16_mtbdd_all_abcg_20260607_1541/results/candidates.csv`
- Best CSV: `student/runs/fp16/ex225_frontend_fp16_mtbdd_all_abcg_20260607_1541/results/best.csv`

Best result:
- `11653/21/244713`, exact but worse than the current predecode best.

Notes:
- Frontend-only exact re-synthesis; no backend optimization portfolio.
