# ex295 Frontend Attempts

## Current Best

- Current best frontend: `ex295_low_split_default_abc_g_aig`, area `8653`, delay `16`, ADP `138448`.
- Reference: ADP `68064`.
- Gap: `2.03x` reference ADP.

## Already Tried

- Tried generic unknown variants: `value_case`, `expr_default_exception`, `high_split_default`, `low_split_default`, `decision_tree_greedy`; rotation variants were not in top tracked candidates for this case.
- Top results: `low_split_default:156456`; `high_split_default:156474`; `decision_tree_greedy:186922`; `value_case:192654`; `expr_default_exception:224595`.
- Algebraic/ANF/Davio/support-LUT candidates exist under `student/work/reverse_unknown_algebraic_20260603_2305_algebraic_safe/ex295`, but they are not the current tracked best.
- 2026-06-08 rot2 canonical-min RTL: exact and official `evaluate.py` OK, but `3517/85/298945`, worse than current due excessive comparator/table delay.
- 2026-06-08 diagnostic-selected shared-BDD order `5:6:4:7:3:8:2:9:1:10:0:11`: exact and official `evaluate.py` OK, but `9186/21/192906`, worse than current.
- 2026-06-08 rotation representative-bit BDD: exact and official `evaluate.py` OK, but `9792/20/195840`, worse than current due duplicated representative logic.
- 2026-06-08 current structural synthflow run: official `evaluate.py` OK for all variants; `abc_g_aig` improved to `8653/16/138448`.
- 2026-06-08 pair-ring local-rule diagnostic: no AIG emitted. Treating the word as 6 two-bit cells, output cell 0 depends on all cells; radius 0/1/2 local rules failed, and radius 3 is exact only because it covers the full ring.
- 2026-06-09 rotation representative-bit BDD interleave/center replay: official `evaluate.py` OK; best was `11112/19/211128`, still worse than current.

## Do Not Repeat Blindly

- High/low split are nearly tied; choosing the other split direction alone is not a meaningful new attempt.
- Need semantic grouping or a better class predicate for the split.
- Do not repeat dynamic canonical-min under even rotations; if using rotation equivariance, avoid a long min-comparator path.
- Do not repeat the center shared-BDD order unless paired with a source rewrite or new synthflow reason.
- Do not repeat natural-order representative-bit BDD reconstruction; future rotation work needs pair-ring/local predicates.
- Do not repeat interleave/center representative-bit BDD reconstruction; exact but still duplicates too much logic.
- Do not pursue a simple small-radius 2-bit pair-ring local rule; support spans the full ring.

## Sources

- `student/results/unknown_candidates_current_summary.csv`
- `student/results/unknown_candidates_current_best.csv`
