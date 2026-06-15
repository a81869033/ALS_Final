# frontend_radical_parallel_round81_20260613_1958

Run ID: `frontend_radical_parallel_round81_20260613_1958`

Purpose: frontend-only radical-structure search for remaining high-gap cases.
This round explicitly avoids small source spelling, output-boundary, and
keep-wire tweaks unless they are part of a materially new high-level
description or representation family.

Inputs:
- Truth files: `benchmarks/exNNN.truth`
- Reference QoR: `reference_result.csv`
- Current frontend registry: `student/frontend_campaigns/frontend_best_registry.csv`
- Gap table: `student/frontend_campaigns/current_frontend_gap.csv`
- Case guidance: `student/frontend_campaigns/case_index/exNNN.md` and linked
  case notes
- Methodology notes: `introduction.md`, senior PPT-derived notes, and
  `ref/新錄音 20.txt`

Rules:
- Frontend/source only. No backend portfolio, standalone ABC/remap, or post-AIG
  optimization.
- Official equivalence/QoR is repo `evaluate.py`.
- Do not update seed bundles.
- Each shard must write under its own `run_id/agent_id/case` paths.
- Each shard must produce a short radical-hypothesis dossier before candidates.

Best result:
- `ex294_r81_octant_plane_descriptor_cofactor`: official `evaluate.py` OK,
  `10664/22/234608`, improving frontend best from `245525` by `10917` ADP.
  Overall current best remains backend `165570`.

Merged results:
- `candidates.csv`: 9 rows
- `best_improvements.csv`: 1 row
- `failed_hypotheses.csv`: 7 rows
- `simulation_results.csv`: 9 rows
- `evaluation_results.csv`: 9 rows
- `shared_structure_report.csv`: 9 rows
- merge sanity: 0 missing paths, 0 duplicate method signatures
