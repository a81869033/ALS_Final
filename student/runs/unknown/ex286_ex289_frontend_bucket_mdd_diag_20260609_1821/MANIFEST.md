# ex286_ex289_frontend_bucket_mdd_diag_20260609_1821

Run ID: `ex286_ex289_frontend_bucket_mdd_diag_20260609_1821`

Purpose: Diagnose whether exact bucket-count selector keys for ex286-ex289
collapse into a small multi-valued decision diagram. This is a high-upside
frontend gate: only a compact MDD would justify RTL generation.

Inputs:
- Cases: `ex286,ex287,ex288,ex289`
- Truth files: `benchmarks/<case>.truth`
- Script: `student/generators/unknown_bucket_mdd_diag.py`

Artifacts:
- Work directory: `student/work/ex286_ex289_frontend_bucket_mdd_diag_20260609_1821`
- Results directory: `student/runs/unknown/ex286_ex289_frontend_bucket_mdd_diag_20260609_1821/results`
- Results: `results/summary.csv`

Methods tried:
- Word-valued reduced MDD and shared per-bit MDD.
- Missing invalid key policies: `reuse_first,reuse_mode,zero`.
- Variable orders based on selectors/counts, count center/edge, domain size, and output entropy.

Notes:
- Diagnostic only; no Verilog/AIG candidates emitted.
- `student/seeds` and `output/` are intentionally untouched.
