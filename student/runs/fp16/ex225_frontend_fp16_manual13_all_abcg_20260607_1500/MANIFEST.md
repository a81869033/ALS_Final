# ex225_frontend_fp16_manual13_all_abcg_20260607_1500

Run ID: `ex225_frontend_fp16_manual13_all_abcg_20260607_1500`

Purpose: focused ex225 frontend-only Yosys `abc_g_aig` re-synthesis check for exact source candidates from the deeper log10 correction search.

Inputs:
- Seed CSV: see matching source run or seed bundle noted in `results/candidates.csv`.
- Truth file: `benchmarks/ex225.truth`

Artifacts:
- Work directory: `student/work/ex225_frontend_fp16_manual13_all_abcg_20260607_1500`
- Candidates CSV: `student/runs/fp16/ex225_frontend_fp16_manual13_all_abcg_20260607_1500/results/candidates.csv`
- Best CSV: `student/runs/fp16/ex225_frontend_fp16_manual13_all_abcg_20260607_1500/results/best.csv`

Methods tried:
- Single `abc -g aig` Yosys RTL-to-AIG emission for already truth-verified Verilog.
- No backend optimization portfolio.

Best result:
- See `student/runs/fp16/ex225_frontend_fp16_manual13_all_abcg_20260607_1500/results/best.csv`.

Notes:
- Created during the ex225 deep correction pass on 2026-06-07.
