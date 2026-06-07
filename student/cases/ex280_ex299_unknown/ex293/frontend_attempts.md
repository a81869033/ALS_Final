# ex293 Frontend Attempts

## Current Best

- Current best frontend: `rotate_low_split_default`, area `8158`, delay `18`, ADP `146844`.
- Reference: ADP `112966`.
- Gap: `1.30x` reference ADP.

## Already Tried

- Tried generic unknown variants: `value_case`, `expr_default_exception`, `high_split_default`, `low_split_default`, `rotate_high_split_default`, `rotate_low_split_default`, `decision_tree_greedy`.
- Top results: `rotate_low_split_default:146844`; `rotate_high_split_default:151110`; `decision_tree_greedy:313194`; `low_split_default:360528`; `high_split_default:1262008`.
- Algebraic/ANF/Davio/support-LUT candidates exist under `student/work/reverse_unknown_algebraic_20260603_2305_algebraic_safe/ex293`, but they are not the current tracked best.

## Do Not Repeat Blindly

- This is already within `1.5x` reference by frontend ADP.
- Future work should preserve the current rotated-low split shape and seek local compression.

## Sources

- `student/results/unknown_candidates_current_summary.csv`
- `student/results/unknown_candidates_current_best.csv`

