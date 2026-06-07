# ex285 Frontend Attempts

## Current Best

- Current best frontend: `decision_tree_greedy`, area `818`, delay `17`, ADP `13906`.
- Reference: ADP `5499`.
- Gap: `2.53x` reference ADP.

## Already Tried

- Tried generic unknown variants: `value_case`, `expr_default_exception`, `high_split_default`, `low_split_default`, `rotate_high_split_default`, `rotate_low_split_default`, `decision_tree_greedy`.
- Top results: `decision_tree_greedy:13906`; `rotate_high_split_default:17576`; `rotate_low_split_default:17576`; `low_split_default:34530`; `high_split_default:56644`.
- Algebraic/ANF/Davio/support-LUT candidates exist under `student/work/reverse_unknown_algebraic_20260603_2305_algebraic_safe/ex285`, but they are not the current tracked best.

## Do Not Repeat Blindly

- Decision tree is currently clearly better than split/table variants.
- Next work should refine tree factoring or infer the underlying class/rotation structure.

## Sources

- `student/results/unknown_candidates_current_summary.csv`
- `student/results/unknown_candidates_current_best.csv`

