# frontend_current_source_rewrite_round93_20260614_0119

Run ID: `frontend_current_source_rewrite_round93_20260614_0119`

Purpose: frontend-only current-best source rewrite and selected output-cluster
search for the remaining `frontend_best_adp / reference_adp > 1.5` cases,
excluding `ex286` and `ex287`.

Motivation:
- Round91 cone replacement did not improve.
- Round92 decision-graph / structural-RTL variants were equivalent but worse.
- This round starts from each case's current best frontend Verilog/source and
  tries materially different source-level structure: shared predecode,
  selected output-cluster overlays, cube/default compression, and compact
  residual factoring.

Rules:
- Frontend/source only. No backend portfolio, backend remap, or post-AIG
  optimization.
- Official equivalence/QoR is repo `evaluate.py`.
- `candidates.csv` and `evaluation_results.csv` may contain only real official
  attempts with existing Verilog/AIG/log paths.
- Planned rows belong in `active_methods.csv`; blockers belong in
  `failed_hypotheses.csv`.
- Do not edit `prompt_log.md`, seed bundles, global registries, backend
  scripts, or unrelated dirty files.

Results:
- Merged candidate rows: 0.
- Best improvements: 0.
- Failed/blocker rows: 15.
- Shared-structure rows: 3.
- Merge sanity: `missing_paths=0`, `duplicate_method_signatures=0`.

Best result:
- No frontend best changed. Workers found the current-best source rewrite and
  selected overlay ideas to be table-sized, non-distinct from prior low-value
  attempts, or not feasible without replaying existing structures.
