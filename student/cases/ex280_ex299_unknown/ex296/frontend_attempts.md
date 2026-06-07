# ex296 Frontend Attempts

## Current Best

- Current best frontend: `high_split_default`, area `9032`, delay `17`, ADP `153544`.
- Reference: ADP `104025`.
- Gap: `1.48x` reference ADP.

## Already Tried

- Tried generic unknown variants: `value_case`, `expr_default_exception`, `high_split_default`, `low_split_default`, `rotate_high_split_default`, `rotate_low_split_default`, `decision_tree_greedy`.
- Top results: `high_split_default:153544`; `rotate_high_split_default:169762`; `rotate_low_split_default:188043`; `value_case:194418`; `low_split_default:217056`.
- Algebraic/ANF/Davio/support-LUT candidates exist under `student/work/reverse_unknown_algebraic_20260603_2305_algebraic_safe/ex296`, but they are not the current tracked best.

## Do Not Repeat Blindly

- This is already slightly inside `1.5x` reference.
- Preserve high-split direction; future work should compress group logic or identify class structure.

## Sources

- `student/results/unknown_candidates_current_summary.csv`
- `student/results/unknown_candidates_current_best.csv`

