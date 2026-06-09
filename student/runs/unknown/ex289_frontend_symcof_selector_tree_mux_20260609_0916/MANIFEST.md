# ex289_frontend_symcof_selector_tree_mux_20260609_0916

Run ID: `ex289_frontend_symcof_selector_tree_mux_20260609_0916`

Purpose: Test nested selector-tree mux for ex289 single-pair selector sources,
including the prior best explicit selector bits `0:1:12:13`.

Inputs:
- Truth file: `benchmarks/ex289.truth`
- Generator: `student/generators/unknown_symmetry_cofactor_search.py`
- Scope: pair `4:5`, order `interleave`, policy `f00`

Artifacts:
- Work directory: `student/work/ex289_frontend_symcof_selector_tree_mux_20260609_0916/`
- Results: `student/runs/unknown/ex289_frontend_symcof_selector_tree_mux_20260609_0916/results/`

Methods tried:
- `mux_style=tree`, default k4 and explicit outer bits `0:1:12:13`

Best result:
- explicit selector tree: exact, `1489/23/34247`

Notes:
- Worse than prior ex289 best; selector tree increases delay.

