# ex290 Frontend Attempts

## Current Best

- Current best frontend: `rotate_high_split_default`, area `4484`, delay `16`, ADP `71744`.
- Reference: ADP `42328`.
- Gap: `1.69x` reference ADP.

## Already Tried

- Tried generic unknown variants: `value_case`, `expr_default_exception`, `high_split_default`, `low_split_default`, `rotate_high_split_default`, `rotate_low_split_default`, `decision_tree_greedy`.
- Top results: `rotate_high_split_default:71744`; `rotate_low_split_default:71744`; `low_split_default:98112`; `decision_tree_greedy:115767`; `high_split_default:148482`.
- Algebraic/ANF/Davio/support-LUT candidates exist under `student/work/reverse_unknown_algebraic_20260603_2305_algebraic_safe/ex290`, but they are not the current tracked best.

## Do Not Repeat Blindly

- This case is closer to reference than ex280-ex289.
- Next useful work is targeted improvement of rotated split, not re-running all generic variants.

## Sources

- `student/results/unknown_candidates_current_summary.csv`
- `student/results/unknown_candidates_current_best.csv`

