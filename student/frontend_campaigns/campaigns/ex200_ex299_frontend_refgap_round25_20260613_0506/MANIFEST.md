# ex200_ex299_frontend_refgap_round25_20260613_0506

Run ID: `ex200_ex299_frontend_refgap_round25_20260613_0506`

Purpose: continue high-gap frontend search after round24, prioritizing cases whose frontend ADP remains far above `reference_result.csv`.

Inputs:
- Truth files: `benchmarks/exNNN.truth`
- Current frontend registry: `student/frontend_campaigns/frontend_best_registry.csv`
- Current gap table: `student/frontend_campaigns/current_frontend_gap.csv`
- Prior judgments: `student/frontend_campaigns/method_judgments.csv`, `student/frontend_campaigns/manual_judgments.csv`
- Case indexes: `student/frontend_campaigns/case_index/exNNN.md`

Artifacts:
- Work directory: `student/work/ex200_ex299_frontend_refgap_round25_20260613_0506/<agent_id>/<case>/`
- Run registry: `student/runs/<domain>/ex200_ex299_frontend_refgap_round25_20260613_0506/<agent_id>/<case>/`
- Campaign results: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round25_20260613_0506/results/`
- Agent shards: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round25_20260613_0506/agent_shards/<agent_id>/`

Methods planned:
- Avoid exact replay of round24 and known `do_not_repeat_as_is` signatures.
- Seek simpler high-level descriptions before RTL generation.
- Emphasize shared decode, shared arithmetic predicates, BDD/cofactor subfunctions, GF(2)/ANF roots, and state/descriptor sharing.
- Accept candidates only after official `evaluate.py` equivalence and QoR.

Status: merged and indexed.
