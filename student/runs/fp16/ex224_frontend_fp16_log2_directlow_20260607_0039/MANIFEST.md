# ex224_frontend_fp16_log2_directlow_20260607_0039

Run ID: `ex224_frontend_fp16_log2_directlow_20260607_0039`

Purpose: hand-derived direct low-bit formulas for `ex224`, avoiding the full
16-bit semantic add/sub path.

Inputs:
- Truth file: `benchmarks/ex224.truth`
- Generator: `student/generators/fp16_log2_cluster_semantic.py`

Artifacts:
- Work directory: `student/work/ex224_frontend_fp16_log2_directlow_20260607_0039/`
- Candidates CSV: `student/runs/fp16/ex224_frontend_fp16_log2_directlow_20260607_0039/results/candidates.csv`
- Best CSV: `student/runs/fp16/ex224_frontend_fp16_log2_directlow_20260607_0039/results/best.csv`
- Summary CSV: `student/runs/fp16/ex224_frontend_fp16_log2_directlow_20260607_0039/results/summary.csv`

Methods tried:
- Low4/low6/low8 exact formulas from correction low bits and two's-complement
  subtraction, plus current high-bit overrides.

Best result:
- `direct_low4`: `5390/25/134750`, equivalent.

Notes:
- Direct low-bit formulas were shallower than full clustered output but still
  placed correction LUTs on the critical path.
