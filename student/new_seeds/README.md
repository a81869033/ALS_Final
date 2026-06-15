# student/new_seeds

`student/new_seeds` is a curated frontend-only seed set built on 2026-06-14.

Differences from `student/seeds`:
- It is newly generated and does not modify the legacy `student/seeds` tree.
- Current bundles are selected from the best verified frontend rows available now, not backend-optimized AIGs.
- Backend-candidate bundles carry multiple non-current frontend alternatives per case for backend starts.
- Root metadata files record every copied artifact and every rejected candidate reason.

Root metadata:
- `manifest.csv`: every copied Verilog, AIG, and metadata JSON artifact.
- `selection_summary.csv`: one row per case with current best and candidate counts.
- `rejected_candidates.csv`: candidates rejected for non-OK status, missing files, backend-derived source, duplicate current hash, or diversity filtering.

Use the `*_current` bundles for pre-backend frontend comparison. Use the `*_backend_candidates_*` bundles as extra backend starts.
