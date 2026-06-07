# ex297 Frontend Attempts

## Current Best

- Current best frontend: `low_split_default`, area `32553`, delay `21`, ADP `683613`.
- Reference: ADP `225900`.
- Gap: `3.03x` reference ADP.

## Already Tried

- Tried generic unknown variants: `value_case`, `high_split_default`, `low_split_default`, `rotate_high_split_default`, `decision_tree_greedy`; tracked candidate count is `6`.
- Top results: `low_split_default:683613`; `rotate_high_split_default:684789`; `high_split_default:694029`; `value_case:813816`; `decision_tree_greedy:889479`.
- Algebraic/ANF/Davio/support-LUT candidates exist under `student/work/reverse_unknown_algebraic_20260603_2305_algebraic_safe/ex297`, but they are not the current tracked best.

## Do Not Repeat Blindly

- Low split, rotate-high split, and high split are very close; just changing split direction is exhausted.
- Need a stronger decomposition than table split.

## Sources

- `student/results/unknown_candidates_current_summary.csv`
- `student/results/unknown_candidates_current_best.csv`

