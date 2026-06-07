# ex281 Frontend Attempts

## Current Best

- Current best frontend: `rotate_low_split_default`, area `2425`, delay `17`, ADP `41225`.
- Reference: ADP `2336`.
- Gap: `17.65x` reference ADP.

## Already Tried

- Tried generic unknown variants: `value_case`, `expr_default_exception`, `high_split_default`, `low_split_default`, `rotate_high_split_default`, `rotate_low_split_default`, `decision_tree_greedy`.
- Top results: `rotate_low_split_default:41225`; `rotate_high_split_default:54706`; `low_split_default:59800`; `high_split_default:92017`; `expr_default_exception:119899`.
- Algebraic/ANF/Davio/support-LUT candidates exist under `student/work/reverse_unknown_algebraic_20260603_2305_algebraic_safe/ex281`, but they are not the current tracked best.

## Do Not Repeat Blindly

- Generic split and rotation split have already been tried.
- Current gap is too large for backend-only work; need a semantic or stronger decomposition hypothesis.

## Sources

- `student/results/unknown_candidates_current_summary.csv`
- `student/results/unknown_candidates_current_best.csv`

