# ex298 Frontend Attempts

## Current Best

- Current best frontend: `rotate_high_split_default`, area `34185`, delay `20`, ADP `683700`.
- Reference: ADP `442296`.
- Gap: `1.55x` reference ADP.

## Already Tried

- Tried generic unknown variants: `value_case`, `expr_default_exception`, `high_split_default`, `low_split_default`, `rotate_high_split_default`, `rotate_low_split_default`, `decision_tree_greedy`.
- Top results: `rotate_high_split_default:683700`; `high_split_default:702020`; `rotate_low_split_default:784058`; `value_case:786900`; `low_split_default:792660`.
- Algebraic/ANF/Davio/support-LUT candidates exist under `student/work/reverse_unknown_algebraic_20260603_2305_algebraic_safe/ex298`, but they are not the current tracked best.

## Do Not Repeat Blindly

- This case is close to `1.5x` reference but not quite there.
- Next attempts should focus on improving rotated-high split or finding the underlying classifier.

## Sources

- `student/results/unknown_candidates_current_summary.csv`
- `student/results/unknown_candidates_current_best.csv`

