# ex200_ex299_frontend_refgap_round12_20260612_2015

Run ID: `ex200_ex299_frontend_refgap_round12_20260612_2015`

Purpose: Continue frontend seed search after round11 produced no accepted
frontend improvement. Focus is still the largest frontend/reference gaps and
near-reference blockers, with stricter requirements that each shard either
emits an official `evaluate.py` candidate or records a small, evidence-backed
diagnostic instead of only a broad blocker.

Inputs:
- Truth files: `benchmarks/exNNN.truth`
- Campaign spec: `student/frontend_campaigns/GOAL.md`
- Progress index: `student/frontend_campaigns/FRONTEND_PROGRESS.md`
- Current frontend registry/gap CSVs under `student/frontend_campaigns/`
- Prior method controls: `method_judgments.csv`, `manual_judgments.csv`,
  `hypothesis_bank.csv`

Artifacts:
- Campaign directory: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round12_20260612_2015/`
- Work directory: `student/work/ex200_ex299_frontend_refgap_round12_20260612_2015/`
- Domain run directories: `student/runs/<domain>/ex200_ex299_frontend_refgap_round12_20260612_2015/`
- Merge script: `merge_round12_results.py`

Methods requested:
- routing descriptors, cofactor/BDD subfunctions, and compact class keys
- state/cell descriptor variants and residual sharing
- shared FP8 sign/exponent/significand decode and rounding predicates
- FP16/BF16 residual decompositions that are not previous nested-table replays
- integer arithmetic shared partial products, comparator/prefix structures,
  and quotient/sqrt trial-subtract sharing

Success criteria:
- Only candidates with official repo `evaluate.py` OK/equivalent and complete
  Verilog, AIG, and evaluate-log paths may enter `results/candidates.csv`.
- Any accepted frontend best must be merged through `frontend_best_registry.csv`
  and followed by `python3 student/scripts/build_frontend_campaign_index.py`.
- Non-equivalent, not-run, generator-only, or low-value attempts must be
  recorded in failed/evaluation/shared-structure CSVs.
