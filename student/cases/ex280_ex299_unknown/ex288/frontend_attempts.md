# ex288 Frontend Attempts

## Current Best

- Current best frontend: `rotate_high_split_default`, area `4356`, delay `16`, ADP `69696`.
- Reference: ADP `16394`.
- Gap: `4.25x` reference ADP.

## Already Tried

- Tried generic unknown variants: `value_case`, `expr_default_exception`, `high_split_default`, `low_split_default`, `rotate_high_split_default`, `rotate_low_split_default`, `decision_tree_greedy`.
- Top results: `rotate_high_split_default:69696`; `rotate_low_split_default:72540`; `decision_tree_greedy:76720`; `low_split_default:138380`; `value_case:357912`.
- Algebraic/ANF/Davio/support-LUT candidates exist under `student/work/reverse_unknown_algebraic_20260603_2305_algebraic_safe/ex288`, but they are not the current tracked best.

## Do Not Repeat Blindly

- Rotation split helps, but not enough.
- Decision tree is close to rotated split, so future work should inspect whether both expose the same hidden classifier.

## Sources

- `student/results/unknown_candidates_current_summary.csv`
- `student/results/unknown_candidates_current_best.csv`

