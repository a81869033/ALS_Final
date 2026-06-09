# ex288_frontend_symcof_tree_mux_20260609_0916

Run ID: `ex288_frontend_symcof_tree_mux_20260609_0916`

Purpose: Test nested selector-tree mux source form for the current ex288
single-pair symmetry cofactor candidate.

Inputs:
- Truth file: `benchmarks/ex288.truth`
- Generator: `student/generators/unknown_symmetry_cofactor_search.py`
- Scope: pair `4:5`, order `interleave`, policy `f10`, outer count `4`

Artifacts:
- Work directory: `student/work/ex288_frontend_symcof_tree_mux_20260609_0916/`
- Results: `student/runs/unknown/ex288_frontend_symcof_tree_mux_20260609_0916/results/`

Methods tried:
- `mux_style=tree`, `bdd_share=group`

Best result:
- `ex288_unknown_symcof_interleave_f10_k4_tree_group`: exact, `1990/21/41790`

Notes:
- Worse than current `32147`; do not repeat tree mux for this source form.

