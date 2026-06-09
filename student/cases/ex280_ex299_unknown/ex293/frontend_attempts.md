# ex293 Frontend Attempts

## Current Best

- Current best frontend: `ex293_rotate_low_split_default_synth_preset`, area `8054`, delay `18`, ADP `144972`.
- Reference: ADP `112966`.
- Gap: `1.28x` reference ADP.

## Already Tried

- Tried generic unknown variants: `value_case`, `expr_default_exception`, `high_split_default`, `low_split_default`, `rotate_high_split_default`, `rotate_low_split_default`, `decision_tree_greedy`.
- Top results: `rotate_low_split_default:146844`; `rotate_high_split_default:151110`; `decision_tree_greedy:313194`; `low_split_default:360528`; `high_split_default:1262008`.
- Algebraic/ANF/Davio/support-LUT candidates exist under `student/work/reverse_unknown_algebraic_20260603_2305_algebraic_safe/ex293`, but they are not the current tracked best.
- 2026-06-08 diagnostic shared-BDD run: official `evaluate.py` OK; interleave BDD was `8599/22/189178`, worse than current rotated-low split.
- 2026-06-08 current structural synthflow run: official `evaluate.py` OK for all variants; `synth_preset` improved to `8054/18/144972`.

## Do Not Repeat Blindly

- This is already within `1.5x` reference by frontend ADP.
- Do not repeat the tested interleave BDD order without a source rewrite.
- Future work should preserve the current rotated-low split shape and seek local compression.

## Sources

- `student/results/unknown_candidates_current_summary.csv`
- `student/results/unknown_candidates_current_best.csv`
