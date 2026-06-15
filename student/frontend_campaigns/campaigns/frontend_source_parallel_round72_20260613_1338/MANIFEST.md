# frontend_source_parallel_round72_20260613_1338

Purpose: continue frontend-only search after round71 improved ex242 below 1.5 ratio. Target remaining current ADP ratio > 1.5 cases, excluding ex242, ex286, and ex287.

Coordinator start: 2026-06-13 13:38 +0800

Scope:
- Official equivalence and QoR must come only from repository `evaluate.py`.
- Frontend/source work only. Repo Yosys frontend synthesis is allowed; backend portfolios, standalone AIG remap, and cross-AIG post-optimization are out of scope.
- Do not use old ex280-specific search scripts.
- Do not edit seed bundles.
- Do not overwrite or revert dirty work from other sessions.

Remaining >1.5 after round71:
ex247, ex246, ex244, ex297, ex225, ex299, ex285, ex260, ex249, ex241, ex288, ex240, ex223, ex245, ex266.

Round72 emphasis:
- Avoid round68-71 low-value signatures as-is.
- Use high-level description first, then materially new source representations.
- Prefer source-level common substructure extraction: shared decode, selected output groups, compact exception shells, exact small residuals, and arithmetic/source hybrids that are not pure post-synthesis remaps.
