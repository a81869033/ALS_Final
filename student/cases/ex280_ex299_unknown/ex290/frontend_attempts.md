# ex290 Frontend Attempts

## Current Best

- Current best frontend: `ex290_rotate_high_split_default_abc_g_aig`, area `4428`, delay `14`, ADP `61992`.
- Reference: ADP `42328`.
- Gap: `1.46x` reference ADP.

## Already Tried

- Tried generic unknown variants: `value_case`, `expr_default_exception`, `high_split_default`, `low_split_default`, `rotate_high_split_default`, `rotate_low_split_default`, `decision_tree_greedy`.
- Top results: `rotate_high_split_default:71744`; `rotate_low_split_default:71744`; `low_split_default:98112`; `decision_tree_greedy:115767`; `high_split_default:148482`.
- Algebraic/ANF/Davio/support-LUT candidates exist under `student/work/reverse_unknown_algebraic_20260603_2305_algebraic_safe/ex290`, but they are not the current tracked best.
- 2026-06-08 diagnostic shared-BDD run: official `evaluate.py` OK for 2 rows; best BDD was `3949/19/75031`, worse than current rotated-high split.
- 2026-06-08 current structural synthflow run: official `evaluate.py` OK for all variants; `abc_g_aig` improved to `4428/14/61992`, now within `1.5x` reference.

## Do Not Repeat Blindly

- This case is closer to reference than ex280-ex289.
- Do not repeat `split_rot8` or interleave BDD orders without a source rewrite.
- Next useful work is targeted improvement of rotated split, not re-running all generic variants.

## Sources

- `student/results/unknown_candidates_current_summary.csv`
- `student/results/unknown_candidates_current_best.csv`
