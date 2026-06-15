# frontend_source_parallel_round77_20260613_1733

Run ID: `frontend_source_parallel_round77_20260613_1733`

Purpose: frontend-only source-structuring search around current best high-level descriptions for the 15 non-ex286/ex287 cases still above 1.5 ADP/reference after round76.

Direction:
- Avoid r76 heavy semantic descriptors and broad tables.
- Prefer source-level structural variants around known exact/current best RTL: common-subexpression boundaries, output grouping, mux/case style, module boundaries, `keep`/`noinline`-style source annotations where already accepted by the toolchain, and compact cofactor residuals keyed by existing semantic wires.
- Official equivalence/QoR remains repo `evaluate.py` only.

Rules:
- Frontend/source only. No backend portfolio and no post-AIG optimization.
- Do not promote anything to `student/seeds`.
- Do not use old ex280-specific scripts.
- Avoid `do_not_repeat_as_is` method signatures unless materially different.

Status: initialized by coordinator.
