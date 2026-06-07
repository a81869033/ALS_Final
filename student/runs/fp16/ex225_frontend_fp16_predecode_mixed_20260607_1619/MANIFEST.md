# ex225_frontend_fp16_predecode_mixed_20260607_1619

Run ID: `ex225_frontend_fp16_predecode_mixed_20260607_1619`

Purpose: exact high/low mantissa correction for ex225 bit9/bit12 selected-bit bottlenecks.

Inputs:
- Truth file: `benchmarks/ex225.truth`
- Generator: `student/generators/fp16_ex225_hilo_correction.py`

Artifacts:
- Work directory: `student/work/ex225_frontend_fp16_predecode_mixed_20260607_1619`
- Candidates CSV: `student/runs/fp16/ex225_frontend_fp16_predecode_mixed_20260607_1619/results/candidates.csv`
- Best CSV: `student/runs/fp16/ex225_frontend_fp16_predecode_mixed_20260607_1619/results/best.csv`

Methods tried:
- Bipartite-style mantissa split: high bits select a local low-bit run tree.
- Manual bit14 threshold retained from current best.
- Crossed bit9 high/low with bit12 run-cover, bit12 manual formula, bit12 high/low, and shared bit12/bit9 vector high/low.

Best result:
- See `student/runs/fp16/ex225_frontend_fp16_predecode_mixed_20260607_1619/results/best.csv`.

Notes:
- Frontend-only exact verification plus single Yosys AIG synthesis; no backend optimization portfolio.
