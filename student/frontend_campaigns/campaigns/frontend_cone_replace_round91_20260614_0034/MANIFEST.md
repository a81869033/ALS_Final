# frontend_cone_replace_round91_20260614_0034

Run ID: `frontend_cone_replace_round91_20260614_0034`

Purpose: frontend-only output-cone replacement and output grouping using
already official-equivalent frontend variants. Rounds 87-90 did not produce a
new best, so this round focuses on small cone-level rewrites instead of whole
datapath/descriptor rewrites.

Rules:
- Frontend/source only. No backend portfolio, backend remap, or post-AIG
  optimization.
- Official equivalence/QoR is repo `evaluate.py`.
- `candidates.csv` and `evaluation_results.csv` may contain only real official
  attempts with existing Verilog/AIG/log paths.
- Planned rows belong in `active_methods.csv`; blockers belong in
  `failed_hypotheses.csv`.
- Do not edit `prompt_log.md`, seed bundles, global registries, backend scripts,
  or unrelated dirty files.

Results:
- Merged candidate rows: 9 official `evaluate.py` equivalent frontend attempts.
- Best improvements: 0.
- Failed/blocker rows: 11.
- Merge sanity: `missing_paths=0`, `duplicate_method_signatures=0`.

Best result:
- No frontend best changed. Direct cone replacement and bounded structural
  candidates were equivalent but worse than the existing frontend bests.
