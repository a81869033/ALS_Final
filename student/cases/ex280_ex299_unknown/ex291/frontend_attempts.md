# ex291 Frontend Attempts

## Current Best

- Current best frontend: `ex291_rotate_high_split_default_synth_preset`, area `6503`, delay `15`, ADP `97545`.
- Reference: ADP `66850`.
- Gap: `1.46x` reference ADP.

## Already Tried

- Tried generic unknown variants: `value_case`, `expr_default_exception`, `high_split_default`, `low_split_default`, `rotate_high_split_default`, `rotate_low_split_default`, `decision_tree_greedy`.
- Top results: `rotate_high_split_default:105984`; `low_split_default:151344`; `rotate_low_split_default:151521`; `decision_tree_greedy:168360`; `high_split_default:298509`.
- Algebraic/ANF/Davio/support-LUT candidates exist under `student/work/reverse_unknown_algebraic_20260603_2305_algebraic_safe/ex291`, but they are not the current tracked best.
- 2026-06-08 diagnostic shared-BDD run: official `evaluate.py` OK; interleave BDD was `5369/21/112749`, worse than current rotated-high split.
- 2026-06-08 current structural synthflow run: official `evaluate.py` OK for all variants; `synth_preset` improved to `6503/15/97545`, now within `1.5x` reference.

## Do Not Repeat Blindly

- Rotated high split is the best known direction.
- Do not repeat the tested interleave BDD order without a source rewrite.
- Since it is close to `1.5x` reference, tune or reinterpret this split before trying unrelated brute force forms.

## Sources

- `student/results/unknown_candidates_current_summary.csv`
- `student/results/unknown_candidates_current_best.csv`
