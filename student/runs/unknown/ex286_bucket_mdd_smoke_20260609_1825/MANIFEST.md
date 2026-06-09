# ex286_bucket_mdd_smoke_20260609_1825

Run ID: `ex286_bucket_mdd_smoke_20260609_1825`

Purpose: Diagnose whether exact bucket-count selector keys for ex286-ex289
collapse into a small multi-valued decision diagram. This is a high-upside
frontend gate: only a compact MDD would justify RTL generation.

Inputs:
- Cases: `ex286`
- Truth files: `benchmarks/<case>.truth`
- Script: `student/generators/unknown_bucket_mdd_diag.py`

Artifacts:
- Work directory: `student/work/ex286_bucket_mdd_smoke_20260609_1825`
- Results directory: `student/runs/unknown/ex286_bucket_mdd_smoke_20260609_1825/results`
- Results: `results/summary.csv`

Methods tried:
- Word-valued reduced MDD and shared per-bit MDD.
- Missing invalid key policies: `reuse_first,reuse_mode,zero`.
- Variable orders based on selectors/counts, count center/edge, domain size, and output entropy.

Notes:
- Diagnostic only; no Verilog/AIG candidates emitted.
- `student/seeds` and `output/` are intentionally untouched.
