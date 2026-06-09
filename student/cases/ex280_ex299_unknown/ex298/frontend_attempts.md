# ex298 Frontend Attempts

## Current Best

- Current best frontend: `ex298_rotate_high_split_default_synth_preset`, area `33981`, delay `19`, ADP `645639`.
- Reference: ADP `442296`.
- Gap: `1.46x` reference ADP.

## Already Tried

- Tried generic unknown variants: `value_case`, `expr_default_exception`, `high_split_default`, `low_split_default`, `rotate_high_split_default`, `rotate_low_split_default`, `decision_tree_greedy`.
- Top results: `rotate_high_split_default:683700`; `high_split_default:702020`; `rotate_low_split_default:784058`; `value_case:786900`; `low_split_default:792660`.
- Algebraic/ANF/Davio/support-LUT candidates exist under `student/work/reverse_unknown_algebraic_20260603_2305_algebraic_safe/ex298`, but they are not the current tracked best.
- 2026-06-08 arbitrary-width split-refine run: official `evaluate.py` OK for `rotate13_low14`, `rotate14_high14`, and `rotate11_low14`; best was `58114/21/1220394`, worse than current `rotate_high_split_default`.
- 2026-06-08 current structural synthflow run: official `evaluate.py` OK for all variants; `synth_preset` improved to `33981/19/645639`, now within `1.5x` reference.

## Do Not Repeat Blindly

- This case is close to `1.5x` reference but not quite there.
- Next attempts should focus on improving rotated-high split or finding the underlying classifier.
- Do not repeat the tested arbitrary-width split parameters without selected-bit overrides or shared source rewrites.

## Sources

- `student/results/unknown_candidates_current_summary.csv`
- `student/results/unknown_candidates_current_best.csv`
