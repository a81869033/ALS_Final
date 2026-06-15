# frontend_source_parallel_round73_20260613_1404

Purpose: continue frontend-only search after round72 produced no improvement. Target remaining current ADP ratio > 1.5 cases, excluding ex242, ex286, and ex287.

Coordinator start: 2026-06-13 14:04 +0800

Scope:
- Official equivalence and QoR must come only from repository `evaluate.py`.
- Frontend/source work only. Repo Yosys frontend synthesis is allowed; backend portfolios, standalone AIG remap, and cross-AIG post-optimization are out of scope.
- Do not use old ex280-specific search scripts.
- Do not edit seed bundles.
- Do not overwrite or revert dirty work from other sessions.

Remaining >1.5 after round72:
ex247, ex246, ex244, ex297, ex225, ex299, ex285, ex260, ex249, ex241, ex288, ex240, ex223, ex245, ex266.

Round73 emphasis:
- Avoid round68-72 low-value signatures as-is.
- For ex297/ex299, build on but do not repeat the current `sel0_identity_bypass` bounded local wrapper family.
- For FP8 arithmetic, try multi-output cofactor/DAG sharing rather than more direct arithmetic shell variants.
- For FP16/integer, try narrower per-output minimization and shared comparator/product monomial structures.
