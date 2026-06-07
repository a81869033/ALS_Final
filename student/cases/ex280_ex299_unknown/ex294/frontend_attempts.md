# ex294 Frontend Attempts

## Current Best

- Current best frontend: `rotate_high_split_default`, area `18382`, delay `19`, ADP `349258`.
- Reference: ADP `133365`.
- Gap: `2.62x` reference ADP.

## Already Tried

- Tried generic unknown variants: `value_case`, `expr_default_exception`, `high_split_default`, `low_split_default`, `rotate_high_split_default`, `rotate_low_split_default`, `decision_tree_greedy`.
- Top results: `rotate_high_split_default:349258`; `rotate_low_split_default:349258`; `decision_tree_greedy:427768`; `low_split_default:657272`; `high_split_default:2577725`.
- Algebraic/ANF/Davio/support-LUT candidates exist under `student/work/reverse_unknown_algebraic_20260603_2305_algebraic_safe/ex294`, but they are not the current tracked best.

## Do Not Repeat Blindly

- Rotated split ties both directions and beats tree/split variants.
- Need a new factoring method for large 16-bit case size; repeating exception-table generation is not enough.

## Sources

- `student/results/unknown_candidates_current_summary.csv`
- `student/results/unknown_candidates_current_best.csv`

