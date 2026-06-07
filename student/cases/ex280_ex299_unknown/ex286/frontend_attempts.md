# ex286 Frontend Attempts

## Current Best

- Current best frontend: `rotate_low_split_default`, area `1865`, delay `14`, ADP `26110`.
- Reference: ADP `2376`.
- Gap: `10.99x` reference ADP.

## Already Tried

- Tried generic unknown variants: `value_case`, `expr_default_exception`, `high_split_default`, `low_split_default`, `rotate_high_split_default`, `rotate_low_split_default`, `decision_tree_greedy`.
- Top results: `rotate_low_split_default:26110`; `rotate_high_split_default:40976`; `decision_tree_greedy:41154`; `low_split_default:51488`; `high_split_default:111622`.
- Algebraic/ANF/Davio/support-LUT candidates exist under `student/work/reverse_unknown_algebraic_20260603_2305_algebraic_safe/ex286`, but they are not the current tracked best.

## Do Not Repeat Blindly

- Rotated low split is the only strong generic result so far.
- Do not spend time on direct high split or full case-table variants without a new reason.

## Sources

- `student/results/unknown_candidates_current_summary.csv`
- `student/results/unknown_candidates_current_best.csv`

