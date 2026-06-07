# ex284 Frontend Attempts

## Current Best

- Current best frontend: `rotate_high_split_default`, area `4831`, delay `20`, ADP `96620`.
- Reference: ADP `4240`.
- Gap: `22.79x` reference ADP.

## Already Tried

- Tried generic unknown variants: `value_case`, `expr_default_exception`, `high_split_default`, `low_split_default`, `rotate_high_split_default`, `rotate_low_split_default`, `decision_tree_greedy`.
- Top results: `rotate_high_split_default:96620`; `rotate_low_split_default:96620`; `low_split_default:253092`; `high_split_default:358656`; `expr_default_exception:455242`.
- Algebraic/ANF/Davio/support-LUT candidates exist under `student/work/reverse_unknown_algebraic_20260603_2305_algebraic_safe/ex284`, but they are not the current tracked best.

## Do Not Repeat Blindly

- Rotation split ties for best, but still far from reference.
- Need a new decomposition beyond high/low split or full decision-tree forms.

## Sources

- `student/results/unknown_candidates_current_summary.csv`
- `student/results/unknown_candidates_current_best.csv`

