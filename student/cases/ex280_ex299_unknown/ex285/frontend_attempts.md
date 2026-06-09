# ex285 Frontend Attempts

## Current Best

- Current best frontend: `ex285_decision_tree_greedy_synth_preset`, area `775`, delay `17`, ADP `13175`.
- Reference: ADP `5499`.
- Gap: `2.40x` reference ADP.

## Already Tried

- Tried generic unknown variants: `value_case`, `expr_default_exception`, `high_split_default`, `low_split_default`, `rotate_high_split_default`, `rotate_low_split_default`, `decision_tree_greedy`.
- Top results: `decision_tree_greedy:13906`; `rotate_high_split_default:17576`; `rotate_low_split_default:17576`; `low_split_default:34530`; `high_split_default:56644`.
- Algebraic/ANF/Davio/support-LUT candidates exist under `student/work/reverse_unknown_algebraic_20260603_2305_algebraic_safe/ex285`, but they are not the current tracked best.
- 2026-06-08 diagnostic shared-BDD run: official `evaluate.py` OK for 2 rows; best BDD was `794/18/14292`, worse than current decision tree.
- 2026-06-08 current structural synthflow run: official `evaluate.py` OK for all variants; `synth_preset` improved to `775/17/13175`.
- 2026-06-08 symmetry-canonical BDD run: exact `swap_in_4_5` canonical key was verified with official `evaluate.py`; best was `1038/17/17646`, worse than current best.
- 2026-06-08 symmetry-BDD synthflow run: official `evaluate.py` OK; best was `1037/17/17629`, still worse than current decision-tree synthflow.
- 2026-06-09 symmetry cofactor class-onehot run: transferred the ex280-ex284 cofactor/class-onehot idea to the exact `swap_in_4_5` canonical key. Official `evaluate.py` OK; best `interleave_f10_k4` was `1042/15/15630`, exact but worse than current `775/17/13175`.

## Do Not Repeat Blindly

- Decision tree is currently clearly better than split/table variants.
- Do not repeat `split_rot8` or interleave BDD orders without a source rewrite.
- Do not repeat the tested `swap_in_4_5` symmetry-canonical BDD interleave/sym_first/natural orders without a deeper source rewrite; interleave was exact but worse, and the other orders were much larger.
- Limited synthflow on the symmetry-BDD source did not close the gap for this case.
- Do not repeat the tested top-3/4/5 interleave symmetry cofactor class-onehot rows; they reduced delay but duplicated too much area.
- Next work should refine tree factoring or infer the underlying class/rotation structure.

## Sources

- `student/results/unknown_candidates_current_summary.csv`
- `student/results/unknown_candidates_current_best.csv`
