# ex297 Frontend Attempts

## Current Best

- Current best frontend: `ex297_low_split_default_abc_g_aig`, area `32422`, delay `18`, ADP `583596`.
- Reference: ADP `225900`.
- Gap: `2.58x` reference ADP.

## Already Tried

- Tried generic unknown variants: `value_case`, `high_split_default`, `low_split_default`, `rotate_high_split_default`, `decision_tree_greedy`; tracked candidate count is `6`.
- Top results: `low_split_default:683613`; `rotate_high_split_default:684789`; `high_split_default:694029`; `value_case:813816`; `decision_tree_greedy:889479`.
- Algebraic/ANF/Davio/support-LUT candidates exist under `student/work/reverse_unknown_algebraic_20260603_2305_algebraic_safe/ex297`, but they are not the current tracked best.
- 2026-06-08 rot2 canonical-min RTL: exact and official `evaluate.py` OK, but `10352/112/1159424`, worse than current due excessive comparator/table delay.
- 2026-06-08 diagnostic-selected natural shared-BDD order: exact and official `evaluate.py` OK, but `32175/24/772200`, worse than current.
- 2026-06-08 rotation representative-bit BDD: exact and official `evaluate.py` OK, but `35431/22/779482`, worse than current due duplicated representative logic.
- 2026-06-08 current structural synthflow run: official `evaluate.py` OK for all variants; `abc_g_aig` improved to `32422/18/583596`.
- 2026-06-08 pair-ring local-rule diagnostic: no AIG emitted. Treating the word as 7 two-bit cells, output cell 0 depends on all cells; radius 0/1/2 local rules failed, and radius 3 is exact only because it covers the full ring.
- 2026-06-09 rotation representative-bit BDD interleave/center replay: official `evaluate.py` OK; best was `40859/24/980616`, worse than current.

## Do Not Repeat Blindly

- Low split, rotate-high split, and high split are very close; just changing split direction is exhausted.
- Need a stronger decomposition than table split.
- Even-rotation equivariance is exact, but dynamic canonical-min is not the right source form; try fixed-phase/orbit sharing or pair-ring local logic instead.
- Natural shared-BDD did not improve ADP; if revisiting BDD, change source structure or order substantially.
- Do not repeat natural-order representative-bit BDD reconstruction; future rotation work needs pair-ring/local predicates.
- Do not repeat interleave/center representative-bit BDD reconstruction; exact but worse than current by a wide margin.
- Do not pursue a simple small-radius 2-bit pair-ring local rule; support spans the full ring.

## Sources

- `student/results/unknown_candidates_current_summary.csv`
- `student/results/unknown_candidates_current_best.csv`
