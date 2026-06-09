# ex296 Frontend Attempts

## Current Best

- Current best frontend: `ex296_high_split_default_abc_g_aig`, area `8987`, delay `16`, ADP `143792`.
- Reference: ADP `104025`.
- Gap: `1.38x` reference ADP.

## Already Tried

- Tried generic unknown variants: `value_case`, `expr_default_exception`, `high_split_default`, `low_split_default`, `rotate_high_split_default`, `rotate_low_split_default`, `decision_tree_greedy`.
- Top results: `high_split_default:153544`; `rotate_high_split_default:169762`; `rotate_low_split_default:188043`; `value_case:194418`; `low_split_default:217056`.
- Algebraic/ANF/Davio/support-LUT candidates exist under `student/work/reverse_unknown_algebraic_20260603_2305_algebraic_safe/ex296`, but they are not the current tracked best.
- 2026-06-08 arbitrary-width split-refine run: official `evaluate.py` OK for `rotate11_low12`, `rotate12_high12`, and `rotate0_low12`; best was `15543/18/279774`, worse than current `high_split_default`.
- 2026-06-08 current structural synthflow run: official `evaluate.py` OK for all variants; `abc_g_aig` improved to `8987/16/143792`.

## Do Not Repeat Blindly

- This is already slightly inside `1.5x` reference.
- Preserve high-split direction; future work should compress group logic or identify class structure.
- Do not repeat the tested arbitrary-width split parameters without selected-bit overrides or shared source rewrites.

## Sources

- `student/results/unknown_candidates_current_summary.csv`
- `student/results/unknown_candidates_current_best.csv`
