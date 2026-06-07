# ex295 Frontend Attempts

## Current Best

- Current best frontend: `low_split_default`, area `8692`, delay `18`, ADP `156456`.
- Reference: ADP `68064`.
- Gap: `2.30x` reference ADP.

## Already Tried

- Tried generic unknown variants: `value_case`, `expr_default_exception`, `high_split_default`, `low_split_default`, `decision_tree_greedy`; rotation variants were not in top tracked candidates for this case.
- Top results: `low_split_default:156456`; `high_split_default:156474`; `decision_tree_greedy:186922`; `value_case:192654`; `expr_default_exception:224595`.
- Algebraic/ANF/Davio/support-LUT candidates exist under `student/work/reverse_unknown_algebraic_20260603_2305_algebraic_safe/ex295`, but they are not the current tracked best.

## Do Not Repeat Blindly

- High/low split are nearly tied; choosing the other split direction alone is not a meaningful new attempt.
- Need semantic grouping or a better class predicate for the split.

## Sources

- `student/results/unknown_candidates_current_summary.csv`
- `student/results/unknown_candidates_current_best.csv`

