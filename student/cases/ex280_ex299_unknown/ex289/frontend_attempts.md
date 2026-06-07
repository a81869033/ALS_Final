# ex289 Frontend Attempts

## Current Best

- Current best frontend: `decision_tree_greedy`, area `2203`, delay `21`, ADP `46263`.
- Reference: ADP `13620`.
- Gap: `3.40x` reference ADP.

## Already Tried

- Tried generic unknown variants: `value_case`, `expr_default_exception`, `high_split_default`, `low_split_default`, `rotate_high_split_default`, `rotate_low_split_default`, `decision_tree_greedy`.
- Top results: `decision_tree_greedy:46263`; `rotate_high_split_default:50220`; `rotate_low_split_default:50220`; `low_split_default:125580`; `high_split_default:459984`.
- Algebraic/ANF/Davio/support-LUT candidates exist under `student/work/reverse_unknown_algebraic_20260603_2305_algebraic_safe/ex289`, but they are not the current tracked best.

## Do Not Repeat Blindly

- Decision tree is best, but delay is high.
- Future work should search for semantic output sharing or compact class predicates before backend tuning.

## Sources

- `student/results/unknown_candidates_current_summary.csv`
- `student/results/unknown_candidates_current_best.csv`

