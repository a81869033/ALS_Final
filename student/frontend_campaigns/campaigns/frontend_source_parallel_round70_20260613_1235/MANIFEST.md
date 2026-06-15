# frontend_source_parallel_round70_20260613_1235

Purpose: continue frontend-only source search for cases whose current ADP ratio to reference remains above 1.5, excluding ex286 and ex287.

Coordinator start: 2026-06-13 12:35 +0800

Scope:
- Official equivalence and QoR must come only from repository `evaluate.py`.
- Source-level frontend work only. Repo Yosys frontend synthesis is allowed; backend portfolios and standalone AIG/ABC remap probes are out of scope.
- Do not use old ex280-specific search scripts.
- Do not update seed bundles.
- Do not overwrite other sessions' dirty work.

Target cases after round69 index rebuild:
- FP8 worst: ex244, ex246, ex247, ex249
- FP8 mid: ex240, ex241, ex242, ex245
- Unknown: ex285, ex288, ex297, ex299
- FP16/integer: ex223, ex225, ex260, ex266

Round70 strategy:
- Avoid repeating round68/round69 signatures as-is.
- Prefer materially different high-level source representations over post-synthesis remaps.
- Explore shared decode, exponent/mantissa/sign logic, rounding/saturation predicates, GF(2)/ANF monomials, routing/state descriptors, BDD/cofactor subfunctions, and output grouping where appropriate.
