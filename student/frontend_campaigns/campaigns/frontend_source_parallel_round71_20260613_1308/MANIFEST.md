# frontend_source_parallel_round71_20260613_1308

Purpose: continue frontend-only search after round70 produced no best improvements. Target current ADP ratio > 1.5 cases, excluding ex286 and ex287.

Coordinator start: 2026-06-13 13:08 +0800

Scope:
- Official equivalence and QoR must come only from repository `evaluate.py`.
- Frontend/source work only. Repo Yosys frontend synthesis is allowed; backend portfolios, standalone AIG remap, and cross-AIG post-optimization are out of scope.
- Do not use old ex280-specific search scripts.
- Do not edit seed bundles.
- Do not overwrite or revert dirty work from other sessions.

Round71 emphasis from `ref/新錄音 20.txt`:
- Re-check high-level description before RTL.
- Generate materially diverse RTL representations rather than one source style.
- Use frontend-only source-level hybrids of low-delay table pieces and shared RTL pieces where useful.
- Look for missing mixed structures between fully expanded LUT-like logic and highly shared RTL logic.

Still high after round70:
ex247, ex246, ex244, ex297, ex225, ex299, ex285, ex260, ex249, ex241, ex288, ex240, ex223, ex245, ex242, ex266.
