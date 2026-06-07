# ex225_frontend_fp16_predecode_all_abcg_20260607_1550

Run ID: `ex225_frontend_fp16_predecode_all_abcg_20260607_1550`

Purpose: Re-synthesize exact shared threshold-predecode candidates for
`ex225` with single Yosys `abc -g aig` emission.

Inputs:
- Source run: `student/runs/fp16/ex225_frontend_fp16_predecode_correction_20260607_1548/`
- Truth file: `benchmarks/ex225.truth`

Artifacts:
- Work directory: `student/work/ex225_frontend_fp16_predecode_all_abcg_20260607_1550/`
- Candidates CSV: `student/runs/fp16/ex225_frontend_fp16_predecode_all_abcg_20260607_1550/results/candidates.csv`
- Best CSV: `student/runs/fp16/ex225_frontend_fp16_predecode_all_abcg_20260607_1550/results/best.csv`

Best result:
- `ex225_manual15_14_13_predecode12_9_abc_g_aig`, `11488/21/241248`.

Notes:
- New curated ex225 frontend seed; copied into
  `student/seeds/fp16/ex225_ex229_frontend_fp16_bitrun_shells_current/`.
- Frontend-only exact re-synthesis; no backend optimization portfolio.
