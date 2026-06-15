# Coordinator Report: ex200_ex299_frontend_refgap_round3_20260612_1554

Run ID: `ex200_ex299_frontend_refgap_round3_20260612_1554`

Status: round3 merged, coordinator-replayed for accepted improvements, and indexed.

Validation:
- `results/candidates.csv`: 53 rows; success rows have existing Verilog/AIG/evaluate-log paths.
- `results/evaluation_results.csv`: 55 rows.
- `results/best_improvements.csv`: 5 accepted frontend improvements, all replayed with official `evaluate.py` by coordinator for the final accepted AIG.
- Duplicate `(case, method_signature)` rows in candidates: 0.
- `manual_judgments.csv` merged with unary proposed low-value directions; other failed directions are in `results/failed_hypotheses.csv`.

Accepted frontend improvements:
- `ex280`: 3915 -> 2990 (area 115, delay 26), candidate `ex280_gf2_overlap_roots_small_roots_balanced_linfact_abc_g_aig`, reference 2415
- `ex281`: 4814 -> 3328 (area 128, delay 26), candidate `ex281_gf2_overlap_roots_small_roots_balanced_linfact_abc_g_aig`, reference 2336
- `ex282`: 4266 -> 4032 (area 144, delay 28), candidate `ex282_gf2_overlap_roots_mixed_roots_delaycap_balanced_linfact_abc_g_aig`, reference 2704
- `ex283`: 4830 -> 4500 (area 150, delay 30), candidate `ex283_gf2_overlap_roots_wide_roots_delaycap_balanced_linfact_abc_g_aig`, reference 3168
- `ex284`: 6981 -> 5440 (area 160, delay 34), candidate `ex284_gf2_overlap_roots_wide_roots_delaycap_balanced_linfact_abc_g_aig`, reference 4240

Largest remaining frontend/reference gaps:
- `ex286`: frontend 21705 vs reference 2376 (ratio 9.135)
- `ex287`: frontend 27480 vs reference 5782 (ratio 4.753)
- `ex247`: frontend 9125 vs reference 2975 (ratio 3.067)
- `ex246`: frontend 7502 vs reference 2805 (ratio 2.675)
- `ex297`: frontend 583596 vs reference 225900 (ratio 2.583)
- `ex299`: frontend 2604734 vs reference 1013807 (ratio 2.569)
- `ex285`: frontend 13175 vs reference 5499 (ratio 2.396)
- `ex244`: frontend 10234 vs reference 4272 (ratio 2.396)
- `ex240`: frontend 30090 vs reference 13299 (ratio 2.263)
- `ex245`: frontend 23834 vs reference 11050 (ratio 2.157)
- `ex241`: frontend 15544 vs reference 7224 (ratio 2.152)
- `ex242`: frontend 25320 vs reference 11900 (ratio 2.128)
- `ex249`: frontend 4368 vs reference 2079 (ratio 2.101)
- `ex248`: frontend 8550 vs reference 4180 (ratio 2.045)
- `ex295`: frontend 138448 vs reference 68064 (ratio 2.034)

Artifacts:
- Candidates: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round3_20260612_1554/results/candidates.csv`
- Evaluation: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round3_20260612_1554/results/evaluation_results.csv`
- Improvements: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round3_20260612_1554/results/best_improvements.csv`
- Failed hypotheses: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round3_20260612_1554/results/failed_hypotheses.csv`
- Case outcomes: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round3_20260612_1554/results/case_outcomes.csv`

Coordinator notes:
- Round3 materially improved only GF(2) event/filter cases `ex280-ex284`.
- Routing, float-fp8, unary, integer, and state/cell candidates were official-equivalent where applicable but did not improve current frontend best; these directions are recorded as failed/tie rows to avoid repetition.
- Round4 should focus on genuinely new high-level descriptions for `ex286/ex287` and FP8 conversion cases, not more synth-flow-only or table/cofactor variants.
