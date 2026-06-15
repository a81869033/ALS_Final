# Coordinator Report: ex200_ex299_frontend_refgap_round2_20260612_1512

Run ID: `ex200_ex299_frontend_refgap_round2_20260612_1512`

Status: merged, validated, and indexed.

Validation:
- `results/candidates.csv`: 74 deduplicated official-equivalent candidates; all success rows have existing Verilog, AIG, and evaluate log paths.
- `results/evaluation_results.csv`: 75 rows; equivalent rows were cross-filled from candidates and now have complete paths.
- `results/best_improvements.csv`: 7 accepted frontend-best improvements.
- Duplicate `(case, method_signature)` rows in candidates: 0.
- Reference beats in the tracked target set after round2: 1.

Accepted frontend improvements:
- `ex225`: 219070 -> 218728 (area 11512, delay 19), candidate `ex225_log_sparse_residual_low14_hi5_abc_g_aig`; reference 116676
- `ex200`: 59232 -> 54405 (area 3627, delay 15), candidate `ex200_bf16_sparse_residual_hilo3_abc_g_aig`; reference 40052
- `ex281`: 5474 -> 4814 (area 166, delay 29), candidate `ex281_gf2_overlap_roots_small_roots_balanced_abc_g_aig`; reference 2336
- `ex282`: 6336 -> 5115 (area 165, delay 31), candidate `ex282_gf2_overlap_roots_small_roots_balanced_abc_g_aig`; reference 2704
- `ex280`: 4712 -> 3915 (area 135, delay 29), candidate `ex280_gf2_overlap_roots_small_roots_balanced_abc_g_aig`; reference 2415
- `ex283`: 6516 -> 4830 (area 161, delay 30), candidate `ex283_gf2_overlap_roots_small_roots_balanced_abc_g_aig`; reference 3168
- `ex284`: 7800 -> 6981 (area 179, delay 39), candidate `ex284_gf2_overlap_roots_wide_roots_balanced_abc_g_aig`; reference 4240

Largest remaining frontend/reference gaps after round2:
- `ex286`: frontend 21705 vs reference 2376 (ratio 7.801347)
- `ex287`: frontend 27480 vs reference 5782 (ratio 4.048426)
- `ex297`: frontend 583596 vs reference 225900 (ratio 2.434582)
- `ex247`: frontend 9125 vs reference 2975 (ratio 2.287059)
- `ex299`: frontend 2604734 vs reference 1013807 (ratio 2.280908)
- `ex246`: frontend 7502 vs reference 2805 (ratio 2.133333)
- `ex244`: frontend 10234 vs reference 4272 (ratio 2.089888)
- `ex295`: frontend 138448 vs reference 68064 (ratio 1.846571)
- `ex225`: frontend 218728 vs reference 116676 (ratio 1.762625)
- `ex285`: frontend 13175 vs reference 5499 (ratio 1.660666)

Artifacts:
- Candidates: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round2_20260612_1512/results/candidates.csv`
- Evaluation: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round2_20260612_1512/results/evaluation_results.csv`
- Improvements: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round2_20260612_1512/results/best_improvements.csv`
- Case outcomes: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round2_20260612_1512/results/case_outcomes.csv`

Coordinator notes:
- Round2 did not beat senior reference on any target case, but it improved ex200, ex225, and ex280-ex284.
- `frontend_best_registry.csv` was updated with accepted round2 improvements and `student/scripts/build_frontend_campaign_index.py` was rerun.
- Round3 was started immediately to continue convergence rather than stopping at these deltas.
