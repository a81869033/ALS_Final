# ex282 Frontend Attempts

## Current Best

- Current best frontend: `rotate_high_split_default`, area `3299`, delay `18`, ADP `59382`.
- Reference: ADP `2704`.
- Gap: `21.96x` reference ADP.

## Already Tried

- Tried generic unknown variants: `value_case`, `expr_default_exception`, `high_split_default`, `low_split_default`, `rotate_high_split_default`, `rotate_low_split_default`, `decision_tree_greedy`.
- Top results: `rotate_high_split_default:59382`; `rotate_low_split_default:59382`; `low_split_default:111048`; `high_split_default:146181`; `expr_default_exception:180500`.
- Algebraic/ANF/Davio/support-LUT candidates exist under `student/work/reverse_unknown_algebraic_20260603_2305_algebraic_safe/ex282`, but they are not the current tracked best.

## Do Not Repeat Blindly

- High/low split, rotated split, and simple exception encoding are already covered.
- Need to identify a compact semantic structure; current table-like decompositions are far from reference.

## Sources

- `student/results/unknown_candidates_current_summary.csv`
- `student/results/unknown_candidates_current_best.csv`

