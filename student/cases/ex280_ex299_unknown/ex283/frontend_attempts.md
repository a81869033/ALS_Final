# ex283 Frontend Attempts

## Current Best

- Current best frontend: `rotate_high_split_default`, area `4982`, delay `20`, ADP `99640`.
- Reference: ADP `3168`.
- Gap: `31.45x` reference ADP.

## Already Tried

- Tried generic unknown variants: `value_case`, `expr_default_exception`, `high_split_default`, `low_split_default`, `rotate_high_split_default`, `rotate_low_split_default`, `decision_tree_greedy`.
- Top results: `rotate_high_split_default:99640`; `rotate_low_split_default:111520`; `low_split_default:130504`; `high_split_default:231506`; `expr_default_exception:303885`.
- Algebraic/ANF/Davio/support-LUT candidates exist under `student/work/reverse_unknown_algebraic_20260603_2305_algebraic_safe/ex283`, but they are not the current tracked best.

## Do Not Repeat Blindly

- Current generic variants are all much worse than reference.
- Prioritize function identification or non-table structural factoring.

## Sources

- `student/results/unknown_candidates_current_summary.csv`
- `student/results/unknown_candidates_current_best.csv`

