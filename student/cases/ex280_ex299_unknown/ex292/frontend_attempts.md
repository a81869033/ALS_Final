# ex292 Frontend Attempts

## Current Best

- Current best frontend: `rotate_high_split_default`, area `9350`, delay `18`, ADP `168300`.
- Reference: ADP `84854`.
- Gap: `1.98x` reference ADP.

## Already Tried

- Tried generic unknown variants: `value_case`, `expr_default_exception`, `high_split_default`, `low_split_default`, `rotate_high_split_default`, `rotate_low_split_default`, `decision_tree_greedy`.
- Top results: `rotate_high_split_default:168300`; `rotate_low_split_default:168300`; `decision_tree_greedy:252651`; `low_split_default:287380`; `high_split_default:614240`.
- Algebraic/ANF/Davio/support-LUT candidates exist under `student/work/reverse_unknown_algebraic_20260603_2305_algebraic_safe/ex292`, but they are not the current tracked best.

## Do Not Repeat Blindly

- Rotated split is clearly better than plain split/tree.
- Need a structural reason for the rotation, then compress the per-group exception logic.

## Sources

- `student/results/unknown_candidates_current_summary.csv`
- `student/results/unknown_candidates_current_best.csv`

