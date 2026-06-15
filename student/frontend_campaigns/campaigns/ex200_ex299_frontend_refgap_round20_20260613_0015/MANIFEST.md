# ex200_ex299_frontend_refgap_round20_20260613_0015

Run ID: `ex200_ex299_frontend_refgap_round20_20260613_0015`

Purpose: continue frontend high-gap search after round19, focusing on the worst remaining frontend/reference ratios with materially different high-level/shared-structure hypotheses.

Inputs:
- Truth files: `benchmarks/exNNN.truth`
- Current registry: `student/frontend_campaigns/frontend_best_registry.csv`
- Gap index: `student/frontend_campaigns/current_frontend_gap.csv`
- Case notes: `student/frontend_campaigns/case_index/exNNN.md` and linked notes

Artifacts:
- Campaign directory: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round20_20260613_0015/`
- Work directory: `student/work/ex200_ex299_frontend_refgap_round20_20260613_0015/`
- Domain run directories: `student/runs/<domain>/ex200_ex299_frontend_refgap_round20_20260613_0015/`

Methods:
- Unknown high-gap semantic/structure rethink for `ex286`, `ex287`, `ex297`, `ex299`, `ex295`
- FP8 conversion/arithmetic high-gap source-level shared predicate factoring for `ex247`, `ex246`, `ex244`, `ex240`, `ex245`, `ex241`, `ex242`

Validation:
- Official `evaluate.py` only for accepted candidate rows.
- Each success row must include existing Verilog, AIG, and evaluate-log paths.

