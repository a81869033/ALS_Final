# ex287 Frontend Attempts

## Current Best

- Current best frontend: `decision_tree_greedy`, area `1833`, delay `19`, ADP `34827`.
- Reference: ADP `5782`.
- Gap: `6.02x` reference ADP.

## Already Tried

- Tried generic unknown variants: `value_case`, `expr_default_exception`, `high_split_default`, `low_split_default`, `rotate_high_split_default`, `rotate_low_split_default`, `decision_tree_greedy`.
- Top results: `decision_tree_greedy:34827`; `rotate_high_split_default:35790`; `rotate_low_split_default:35790`; `low_split_default:104754`; `value_case:210254`.
- Algebraic/ANF/Davio/support-LUT candidates exist under `student/work/reverse_unknown_algebraic_20260603_2305_algebraic_safe/ex287`, but they are not the current tracked best.

## Do Not Repeat Blindly

- Decision tree and rotated split are close, but both are still far from reference.
- Try to find common substructure shared across outputs instead of another full decision tree.

## Sources

- `student/results/unknown_candidates_current_summary.csv`
- `student/results/unknown_candidates_current_best.csv`

