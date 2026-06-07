# ex291 Frontend Attempts

## Current Best

- Current best frontend: `rotate_high_split_default`, area `6624`, delay `16`, ADP `105984`.
- Reference: ADP `66850`.
- Gap: `1.59x` reference ADP.

## Already Tried

- Tried generic unknown variants: `value_case`, `expr_default_exception`, `high_split_default`, `low_split_default`, `rotate_high_split_default`, `rotate_low_split_default`, `decision_tree_greedy`.
- Top results: `rotate_high_split_default:105984`; `low_split_default:151344`; `rotate_low_split_default:151521`; `decision_tree_greedy:168360`; `high_split_default:298509`.
- Algebraic/ANF/Davio/support-LUT candidates exist under `student/work/reverse_unknown_algebraic_20260603_2305_algebraic_safe/ex291`, but they are not the current tracked best.

## Do Not Repeat Blindly

- Rotated high split is the best known direction.
- Since it is close to `1.5x` reference, tune or reinterpret this split before trying unrelated brute force forms.

## Sources

- `student/results/unknown_candidates_current_summary.csv`
- `student/results/unknown_candidates_current_best.csv`

