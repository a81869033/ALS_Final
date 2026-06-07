# ex299 Frontend Attempts

## Current Best

- Current best frontend: `high_split_default`, area `118808`, delay `24`, ADP `2851392`.
- Reference: ADP `1013807`.
- Gap: `2.81x` reference ADP.

## Already Tried

- Tried generic unknown variants: `value_case`, `expr_default_exception`, `high_split_default`, `low_split_default`, `decision_tree_greedy`; tracked candidate count is `5`.
- Top results: `high_split_default:2851392`; `low_split_default:2975575`; `value_case:3529387`; `decision_tree_greedy:4185860`; `expr_default_exception:4213475`.
- Algebraic/ANF/Davio/support-LUT candidates exist under `student/work/reverse_unknown_algebraic_20260603_2305_algebraic_safe/ex299`, but they are not the current tracked best.

## Do Not Repeat Blindly

- Plain high/low split and full value/default forms are exhausted.
- This case needs a substantially different representation; backend-only optimization on such a large seed is unlikely to close the gap.

## Sources

- `student/results/unknown_candidates_current_summary.csv`
- `student/results/unknown_candidates_current_best.csv`

