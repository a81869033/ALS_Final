# Coordinator Report: ex200_ex299_frontend_refgap_round4_20260612_1705

Run ID: `ex200_ex299_frontend_refgap_round4_20260612_1705`

Status: merged and validated. Round4 produced no frontend-best improvement.

Validation:
- `results/candidates.csv`: 23 rows, complete paths.
- `results/evaluation_results.csv`: 23 rows, complete paths for equivalent rows.
- `results/best_improvements.csv`: 0 rows.
- `results/failed_hypotheses.csv`: 23 rows.
- Duplicate `(case, method_signature)` rows in candidates: 0.

Outcome:
- No candidate beat current frontend best in round4.
- Several replacement agents wrote misplaced root `agent_shards/*` files; coordinator normalized their rows into the campaign results without deleting the misplaced files.
- Top failures this round included `ex286` Fredkin NOT_EQUIV, `ex286/ex287` symcof variants worse/tied, `ex247/ex246` exact arithmetic/wordcase variants much worse, `ex297` state transforms worse, and `ex225/ex223` nested log variants tied or worse.

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

Next direction:
- `ex286/ex287`: current multipair symcof is stuck; needs a new routing high-level description, not more key/order/synth-flow variants.
- `ex247/ex246/ex244`: table/wordcase/arithmetic-normalizer variants are too large or too slow; derive smaller exact FP8 conversion predicates from the truth function.
- `ex297/ex299`: state/cell transforms tried so far are exact but far too large; need a more compact invariant/transition model.
- `ex280-ex284`: round3 GF(2) route is still the only productive family; next work should target delay reduction/root-pool selection from the accepted round3 candidates.
