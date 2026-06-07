# ex225_frontend_fp16_predecode_signstyle_abcg_20260607_1606

Run ID: `ex225_frontend_fp16_predecode_signstyle_abcg_20260607_1606`

Purpose: Re-synthesize `ex225` predecode sign-style neighbors with single
Yosys `abc -g aig` emission.

Inputs:
- Source run: `student/runs/fp16/ex225_frontend_fp16_predecode_signstyle_20260607_1605/`
- Truth file: `benchmarks/ex225.truth`

Artifacts:
- Work directory: `student/work/ex225_frontend_fp16_predecode_signstyle_abcg_20260607_1606/`
- Candidates CSV: `student/runs/fp16/ex225_frontend_fp16_predecode_signstyle_abcg_20260607_1606/results/candidates.csv`
- Best CSV: `student/runs/fp16/ex225_frontend_fp16_predecode_signstyle_abcg_20260607_1606/results/best.csv`

Best result:
- `11482/22/252604`; exact but worse than the current predecode best.

Notes:
- Frontend-only exact re-synthesis; no backend optimization portfolio.
