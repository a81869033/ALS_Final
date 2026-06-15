# frontend_source_parallel_round80_20260613_1915

Run ID: `frontend_source_parallel_round80_20260613_1915`

Purpose: frontend-only continuation for cases with current ADP ratio above 1.5
after round79, excluding `ex286` and `ex287`. The round also samples a few
frontend-ratio-only high cases when they can share structure with assigned
families.

Inputs:
- Truth files: `benchmarks/exNNN.truth`
- Reference QoR: `reference_result.csv`
- Frontend registry: `student/frontend_campaigns/frontend_best_registry.csv`
- Gap table: `student/frontend_campaigns/current_frontend_gap.csv`
- Required notes: `student/frontend_campaigns/case_index/exNNN.md` and linked
  case notes for each assigned case

Rules:
- Frontend/source only. No backend portfolio, standalone ABC/remap, or post-AIG
  optimization.
- Official equivalence/QoR is repo `evaluate.py`.
- Do not update seed bundles.
- Subagents write only under their assigned `run_id/agent_id/case` paths.
- Avoid method signatures already marked low-value or do-not-repeat unless the
  high-level description, representation, sharing strategy, or synth flow is
  materially different.

Best result:
- `ex294_r80_mod4_shared_mirror_cofactor`: official `evaluate.py` OK,
  `10675/23/245525`, improving frontend best from `246698` by `1173` ADP.
  Overall current best remains backend `165570`.

Notes:
- Senior PPT and `ref/新錄音 20.txt` are treated as methodology clues: find the
  high-level description first, then search diverse source representations and
  shared structures.
- Merged results: 29 candidate rows, 1 best-improvement row, 25 failed/nonwinning
  hypothesis rows, 0 missing paths, 0 duplicate method signatures.
