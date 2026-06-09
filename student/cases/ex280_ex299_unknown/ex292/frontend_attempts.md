# ex292 Frontend Attempts

## Current Best

- Current best frontend: `ex292_order_0_13_1_12_2_11_3_10_4_9_5_8_6_7_abc_g_aig`, area `6770`, delay `21`, ADP `142170`.
- Reference: ADP `84854`.
- Gap: `1.68x` reference ADP.

## Already Tried

- Tried generic unknown variants: `value_case`, `expr_default_exception`, `high_split_default`, `low_split_default`, `rotate_high_split_default`, `rotate_low_split_default`, `decision_tree_greedy`.
- Top results: `rotate_high_split_default:168300`; `rotate_low_split_default:168300`; `decision_tree_greedy:252651`; `low_split_default:287380`; `high_split_default:614240`.
- Algebraic/ANF/Davio/support-LUT candidates exist under `student/work/reverse_unknown_algebraic_20260603_2305_algebraic_safe/ex292`, but they are not the current tracked best.
- 2026-06-08 diagnostic shared-BDD run: official `evaluate.py` OK; interleave BDD improved to `6827/21/143367`.
- 2026-06-08 BDD synthflow run: official `evaluate.py` OK for all variants; `abc_g_aig` improved to `6770/21/142170`.
- 2026-06-08 cofactor-BDD source rewrite: official `evaluate.py` OK; best `low1` was `6826/23/156998`, worse than current due delay.
- 2026-06-08 MTBDD diagnostic: direct vector-valued interleave MTBDD had `12257` nodes versus `3807` scalar shared-BDD nodes, so no seed was emitted.
- 2026-06-08 split/BDD selected-bit hybrid: official replay OK after limited synthflow; selected structural overrides on the shared-BDD source were exact, but best was `8734/20/174680`, worse than current.

## Do Not Repeat Blindly

- Rotated split is clearly better than plain split/tree.
- Shared-BDD plus synthflow is now best but still outside `1.5x` reference.
- Need a structural reason for the rotation, then compress the per-group exception logic.
- Do not repeat simple one-bit `low1`/`high1`/`center1` cofactor-BDD; exact but worse than current.
- Do not repeat direct vector-valued MTBDD without a different reduction/root-grouping idea; diagnostic node count was larger than scalar shared-BDD.
- Do not repeat selected structural overrides on the shared-BDD source; exact but split cone area dominated.
- Do not repeat the same split/BDD selected-bit hybrid; raw and limited synthflow rows were exact but area dominated.

## Sources

- `student/results/unknown_candidates_current_summary.csv`
- `student/results/unknown_candidates_current_best.csv`
