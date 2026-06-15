# Coordinator Report: ex200_ex299_frontend_refgap_round5_20260612_1743

Status: merged and validated.

Validation:
- Equivalent candidate rows: 7
- Evaluation rows including blockers/non-winning attempts: 9
- Best improvements accepted: 1
- Candidate duplicate `(case, candidate_id)` rows: 0
- Success rows missing Verilog/AIG/evaluate-log paths: 0

Accepted Improvements:
- `ex247`: 9125 -> 8808 with `ex247_e5m2fn_div_bound_region_mux` (367/24/8808); reference 2975

Non-Winning Or Blocked Directions:
- `ex200` `blocked_no_materially_different_normalizer`: no materially different BF16 exp semantic normalizer available within constraints; prior low-value signatures cover seed copy/sparse residual/selected-bit splits
- `ex223` `blocked_no_materially_different_normalizer`: no materially different semantic normalizer available within constraints; prior low-value signatures cover nested/residual/selected-bit predicates
- `ex225` `equivalent_but_bad_qor`: official equivalent but much worse than current frontend 218728
- `ex256` `blocked`: no new ex256 candidate was run because prior notes already cover Wallace/Dadda/CSA row orders/4to2/CLA/carry-select/carry-predicate/high-bit decomposition/Karatsuba-style block var
- `ex260` `low_value_official_ok`: official evaluate.py OK 103/18/1854 but worse than current frontend ADP 1144
- `ex266` `blocked`: no new ex266 candidate was run because prior notes already cover BDD/cofactor word-mux/radix/residual/shift-subtract/binary-search/threshold families and the remaining queued thres
- `ex280` `blocked`: no materially different ex280 root pool correction or output grouping found in allowed round5 scope
- `ex281` `blocked`: no materially different ex281 root pool correction or output grouping found in allowed round5 scope
- `ex284` `equivalent_but_bad_qor`: official evaluate.py equivalent but ADP 9243 does not improve current frontend 5440
- `ex286` `equivalent_but_bad_qor`: official evaluate.py OK 19719/109/2149371 but far worse than current frontend and reference; do not repeat rank/colex/table descriptors
- `ex287` `blocked`: no genuinely new compact routing descriptor remained after filtering out truth-ROM bucket cofactor rank-table and Fredkin r0 families plus prior rejected token-routing/count/orient
- `ex297` `equivalent_but_low_value`: official evaluate.py OK 36056/27/973512 worse than current frontend 583596
- `ex299` `blocked_no_material_new_recurrence`: prior ex299 rows already cover value/split/rot2/cell-BDD/outside-in-BDD/direct-descriptor families and no new recurrence found

Largest Remaining Frontend/Reference Gaps After Round5 Accepted Improvements:
- `ex286`: frontend 21705 vs reference 2376 (ratio 9.135, gap 19329)
- `ex287`: frontend 27480 vs reference 5782 (ratio 4.753, gap 21698)
- `ex247`: frontend 8808 vs reference 2975 (ratio 2.961, gap 5833)
- `ex246`: frontend 7502 vs reference 2805 (ratio 2.675, gap 4697)
- `ex297`: frontend 583596 vs reference 225900 (ratio 2.583, gap 357696)
- `ex299`: frontend 2604734 vs reference 1013807 (ratio 2.569, gap 1590927)
- `ex285`: frontend 13175 vs reference 5499 (ratio 2.396, gap 7676)
- `ex244`: frontend 10234 vs reference 4272 (ratio 2.396, gap 5962)
- `ex240`: frontend 30090 vs reference 13299 (ratio 2.263, gap 16791)
- `ex245`: frontend 23834 vs reference 11050 (ratio 2.157, gap 12784)
- `ex241`: frontend 15544 vs reference 7224 (ratio 2.152, gap 8320)
- `ex242`: frontend 25320 vs reference 11900 (ratio 2.128, gap 13420)
- `ex249`: frontend 4368 vs reference 2079 (ratio 2.101, gap 2289)
- `ex248`: frontend 8550 vs reference 4180 (ratio 2.045, gap 4370)
- `ex295`: frontend 138448 vs reference 68064 (ratio 2.034, gap 70384)

Artifacts:
- Candidates: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round5_20260612_1743/results/candidates.csv`
- Best improvements: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round5_20260612_1743/results/best_improvements.csv`
- Failed hypotheses: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round5_20260612_1743/results/failed_hypotheses.csv`
- Case outcomes: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round5_20260612_1743/results/case_outcomes.csv`
