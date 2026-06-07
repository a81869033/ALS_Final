# ex280 Frontend Attempts

## Current Best

- Best frontend before backend: shared BDD `ex280_sift_449`, area `958`, delay `21`, ADP `20118`.
- Best after backend search: area `820`, delay `21`, ADP `17220`.
- Reference: area `161`, delay `15`, ADP `2415`.
- Gap after backend: `7.13x` reference ADP.

## Already Tried

- Generic unknown structural seeds: `value_case`, `expr_default_exception`, `high_split_default`, `low_split_default`, `rotate_high_split_default`, `rotate_low_split_default`, `decision_tree_greedy`.
- Generic best from that batch: `rotate_high_split_default`, area `1392`, delay `15`, ADP `20880`.
- Shared BDD orders: `natural`, `reverse`, `ex280_sift_449`, `ex280_sift_alt`, plus targeted pair orders.
- Targeted BDD/Davio pair orders: best targeted structure was `bdd_pair_399a`, area `1049`, delay `22`, ADP `23078`; Davio variants were worse.
- Algebraic/ANF/Davio/support-LUT candidates were generated under `student/work/reverse_unknown_algebraic_20260603_2305_algebraic_safe/ex280`.
- ECA search: searched elementary cellular automata style transitions, no exact semantic hit.
- GF/power-map style search: tried finite-field-like power-map hypothesis, no exact hit.

## Do Not Repeat Blindly

- Re-running generic split/rotation/tree templates is unlikely to close the gap.
- Re-running backend only is not enough: ABC/MockTurtle/CULS/ABC9 lowered ADP only to `17220`; `abc9_deepsyn` timed out after `3000s`.
- Need a new semantic or much stronger structural hypothesis.

## Sources

- `student/results/unknown_candidates_current_summary.csv`
- `student/results/target_ex280_bdd_eval_best.csv`
- `student/results/target_ex280_structure_best.csv`
- `student/runs/unknown/ex280_backend_opt_20260604/results/best.csv`
- `student/archive/cleanup_20260605/ex280_backend_intermediate/results/ex280_backend_search_post_delay_mock_best.csv`
