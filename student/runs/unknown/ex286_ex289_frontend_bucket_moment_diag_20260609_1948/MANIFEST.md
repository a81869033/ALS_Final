# ex286_ex289_frontend_bucket_moment_diag_20260609_1948

Diagnostic-only low-dimensional bucket-count moment search.

Purpose: test whether exact bucket-count classifier state collapses to compact moment/residue/prefix coordinates before emitting any RTL.

Inputs:
- Cases: `ex286,ex287,ex288,ex289`
- Script: `student/generators/unknown_bucket_moment_diag.py`

Artifacts:
- `results/bucket_moment_diagnostics.csv`
- Empty frontend CSVs: `results/summary.csv`, `results/candidates.csv`, `results/best.csv`, `results/evaluate_check.csv`

Notes:
- Exact scalar coordinate re-encodings exist, but they are not compact enough
  for a large-drop RTL source. Exact key counts are still bucket-table scale:
  ex286 `4608`, ex287 `6912`, ex288 `13824`, ex289 `20480`.
- Prefix/modulo/vector moment families were not exact. No Verilog/AIG
  candidates emitted.
- `student/seeds` and `output/` are intentionally untouched.
