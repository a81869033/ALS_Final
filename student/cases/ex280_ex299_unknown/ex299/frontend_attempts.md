# ex299 Frontend Attempts

## Current Best

- Current best frontend: `ex299_high_split_default_abc_g_aig`, area `118397`, delay `22`, ADP `2604734`.
- Reference: ADP `1013807`.
- Gap: `2.57x` reference ADP.

## Already Tried

- Tried generic unknown variants: `value_case`, `expr_default_exception`, `high_split_default`, `low_split_default`, `decision_tree_greedy`; tracked candidate count is `5`.
- Top results: `high_split_default:2851392`; `low_split_default:2975575`; `value_case:3529387`; `decision_tree_greedy:4185860`; `expr_default_exception:4213475`.
- Algebraic/ANF/Davio/support-LUT candidates exist under `student/work/reverse_unknown_algebraic_20260603_2305_algebraic_safe/ex299`, but they are not the current tracked best.
- 2026-06-08 rot2 canonical-min RTL: exact and official `evaluate.py` OK, but `33880/128/4336640`, worse than current due excessive comparator/table delay.
- 2026-06-08 diagnostic-selected natural shared-BDD order: exact and official `evaluate.py` OK, but `118187/27/3191049`, worse than current.
- 2026-06-08 rotation representative-bit BDD: exact and official `evaluate.py` OK, but `123601/27/3337227`, worse than current due duplicated representative logic.
- 2026-06-08 current structural synthflow run: official `evaluate.py` OK for all variants; `abc_g_aig` improved to `118397/22/2604734`.
- 2026-06-08 pair-ring local-rule diagnostic: no AIG emitted. Treating the word as 8 two-bit cells, output cell 0 depends on all cells; radius 0/1/2/3 local rules failed, and radius 4 is exact only because it covers the full ring.
- 2026-06-09 rotation representative-bit BDD interleave/center replay: official `evaluate.py` OK; best was `144261/28/4039308`, worse than current.

## Do Not Repeat Blindly

- Plain high/low split and full value/default forms are exhausted.
- This case needs a substantially different representation; backend-only optimization on such a large seed is unlikely to close the gap.
- Even-rotation equivariance is exact, but dynamic canonical-min is too deep. Future attempts should preserve fixed phase or derive pair-ring logic instead of comparing all rotations.
- Natural shared-BDD slightly lowers area but increases delay enough to lose; do not repeat without a different order/source rewrite.
- Do not repeat natural-order representative-bit BDD reconstruction; future rotation work needs pair-ring/local predicates.
- Do not repeat interleave/center representative-bit BDD reconstruction; exact but significantly worse than current.
- Do not pursue a simple small-radius 2-bit pair-ring local rule; support spans the full ring.

## Sources

- `student/results/unknown_candidates_current_summary.csv`
- `student/results/unknown_candidates_current_best.csv`
