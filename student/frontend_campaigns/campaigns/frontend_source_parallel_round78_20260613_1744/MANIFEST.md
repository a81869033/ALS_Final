# frontend_source_parallel_round78_20260613_1744

Run ID: `frontend_source_parallel_round78_20260613_1744`

Purpose: frontend-only systematic source-structure enumeration for still-open >1.5 cases after round77.

Direction:
- Use small bounded enumerations around current/frontend best source structures.
- Avoid r76 heavy semantic descriptors and r77 source-boundary repeats unless materially extended.
- Official QoR/equivalence is repo `evaluate.py`.

Rules:
- Frontend/source only. No backend portfolio, standalone remap, or post-AIG optimization.
- Do not update seed bundles.
- Do not use old ex280-specific scripts.
- Do not edit global registry/state files from subagents; coordinator handles promotion.
