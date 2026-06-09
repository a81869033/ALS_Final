# ex294 Frontend Attempts

## Current Best

- Current best frontend: `ex294_order_0_15_1_14_2_13_3_12_4_11_5_10_6_9_7_8_synth_preset`, area `10726`, delay `23`, ADP `246698`.
- Reference: ADP `133365`.
- Gap: `1.85x` reference ADP.

## Already Tried

- Tried generic unknown variants: `value_case`, `expr_default_exception`, `high_split_default`, `low_split_default`, `rotate_high_split_default`, `rotate_low_split_default`, `decision_tree_greedy`.
- Top results: `rotate_high_split_default:349258`; `rotate_low_split_default:349258`; `decision_tree_greedy:427768`; `low_split_default:657272`; `high_split_default:2577725`.
- Algebraic/ANF/Davio/support-LUT candidates exist under `student/work/reverse_unknown_algebraic_20260603_2305_algebraic_safe/ex294`, but they are not the current tracked best.
- 2026-06-08 diagnostic shared-BDD run: official `evaluate.py` OK; interleave BDD improved to `10945/24/262680`.
- 2026-06-08 BDD synthflow run: official `evaluate.py` OK for all variants; `synth_preset` improved to `10726/23/246698`.
- 2026-06-08 cofactor-BDD source rewrite: official `evaluate.py` OK; best `low1` was `10898/23/250654`, close but worse than current.
- 2026-06-08 MTBDD diagnostic: direct vector-valued interleave MTBDD had `42953` nodes versus `6020` scalar shared-BDD nodes, so no seed was emitted.
- 2026-06-08 split/BDD selected-bit hybrid: official replay OK after limited synthflow; selected structural overrides on the shared-BDD source were exact, but best was `14060/21/295260`, worse than current.

## Do Not Repeat Blindly

- Rotated split ties both directions and beats tree/split variants.
- Shared-BDD plus synthflow is now best but still outside `1.5x` reference.
- Need a new factoring method for large 16-bit case size; repeating exception-table generation is not enough.
- Do not repeat simple one-bit `low1`/`high1`/`center1` cofactor-BDD; exact but area increased without ADP improvement.
- Do not repeat direct vector-valued MTBDD without a different reduction/root-grouping idea; diagnostic node count was larger than scalar shared-BDD.
- Do not repeat selected structural overrides on the shared-BDD source; exact but split cone area dominated.
- Do not repeat the same split/BDD selected-bit hybrid; raw and limited synthflow rows were exact but area dominated.

## Sources

- `student/results/unknown_candidates_current_summary.csv`
- `student/results/unknown_candidates_current_best.csv`
