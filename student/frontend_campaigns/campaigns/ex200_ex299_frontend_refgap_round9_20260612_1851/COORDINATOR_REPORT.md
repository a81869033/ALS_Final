# Coordinator Report: ex200_ex299_frontend_refgap_round9_20260612_1851

## Summary

- Target selection: worst `frontend_best_adp / reference_adp` cases from the current frontend registry.
- Subagents: `routing-r9`, `fp8-core-r9`, `state-r9`, `fp8-wide-r9`.
- Official equivalent candidates recorded: `14`.
- Current frontend improvements: `0`.
- Reference wins: `0`.
- Global registry/search files were not updated because no candidate beat current frontend.

## Result Counts

- `results/candidates.csv`: `14` rows
- `results/evaluation_results.csv`: `16` rows
- `results/best_improvements.csv`: `0` rows
- `results/failed_hypotheses.csv`: `30` rows
- `results/shared_structure_report.csv`: `22` rows
- `results/simulation_results.csv`: `13` rows
- `results/case_outcomes.csv`: `10` rows

## Per-Case Outcomes

| case | current ADP | reference ADP | ratio | Round9 best/status | Round9 ADP | next action |
| --- | ---: | ---: | ---: | --- | ---: | --- |
| ex286 | 20190 | 2376 | 8.497475 | `blocked_no_official_candidate` |  | Need a genuinely new nonlinear conservative-routing state basis; do not repeat bucket/table/symcof/Fredkin/token-count/lane-parity variants unchanged. |
| ex287 | 27480 | 5782 | 4.752681 | `blocked_no_official_candidate` |  | Need a genuinely new nonlinear conservative-routing state basis; current collision-path descriptor did not survive low-weight sanity. |
| ex247 | 8349 | 2975 | 2.806387 | `ex247_semantic_div_key_bdd_delta_then_sig_synth_preset_aig` | 13400 | Current bound-region mux still dominates; avoid threshold/cofactor BDD repeats unless they reduce area below the Round8 363/23 source. |
| ex246 | 7502 | 2805 | 2.674510 | `ex246_semantic_mul_key_bdd_exp_then_product_synth_preset_aig` | 10036 | Current product DC seed remains best; future work should expose cheaper partial-product sharing without the key-BDD/table area growth. |
| ex297 | 583596 | 225900 | 2.583426 | `ex297_ring_state_transition_bank_mtbdd_cellorder` | 925796 | Need a smaller cyclic 2-bit ring descriptor before RTL; MTBDD and direct ANF are too large/deep. |
| ex299 | 2604734 | 1013807 | 2.569260 | `blocked_no_official_candidate` |  | Need a smaller full-ring recurrence or descriptor; MTBDD times out and direct ANF term count is too high. |
| ex285 | 13175 | 5499 | 2.395890 | `ex285_compact_routing_descriptor_mtbdd_natural` | 50065 | Need decision-tree factoring or a compact hidden routing state smaller than the MTBDD/ANF forms. |
| ex244 | 10234 | 4272 | 2.395599 | `ex244_round9_lane_factored_delta_mask_default` | 21945 | Area can be low, but delay is the blocker; target shallow delta/round predicates rather than another mask overlay. |
| ex240 | 30090 | 13299 | 2.262576 | `ex240_round9_split_threshold_quant_default` | 306308 | Same-sign path is already compact; focus on verified diff-sign cancellation/renormalization formulas with lower delay. |
| ex245 | 23834 | 11050 | 2.156923 | `ex245_round9_split_threshold_quant_default` | 509184 | Gap-class current best dominates; future work should find a shallow active-small-gap normalizer rather than threshold tables. |

## Validation

- All 14 equivalent candidate rows have existing Verilog, AIG, and official `evaluate.py` log paths.
- No duplicate `(case, method_signature)` among merged candidate rows.
- All 10 target cases have a Round9 high-level dossier and a final case-doc entry.
- `ref/E-syn.pdf` was not used; it appears only in prohibition text.
- `best_improvements.csv` is intentionally header-only because there were no improvements.

## Important Paths

- Merged candidates: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round9_20260612_1851/results/candidates.csv`
- Case outcomes: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round9_20260612_1851/results/case_outcomes.csv`
- Agent summaries: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round9_20260612_1851/agent_summaries/`
- Work artifacts: `student/work/ex200_ex299_frontend_refgap_round9_20260612_1851/<agent>/<case>/`
