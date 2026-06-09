# ex287_frontend_symcof_tree_mux_20260609_0916

Run ID: `ex287_frontend_symcof_tree_mux_20260609_0916`

Purpose: Test nested selector-tree mux source form for the current ex287
multi-pair symmetry cofactor candidate.

Inputs:
- Truth file: `benchmarks/ex287.truth`
- Generator: `student/generators/unknown_symmetry_cofactor_search.py`
- Scope: pairs `4:5,6:7,8:9`, order `interleave`, policy `f00`, outer count `5`

Artifacts:
- Work directory: `student/work/ex287_frontend_symcof_tree_mux_20260609_0916/`
- Results: `student/runs/unknown/ex287_frontend_symcof_tree_mux_20260609_0916/results/`

Methods tried:
- `mux_style=tree`, `bdd_share=group`

Best result:
- `ex287_unknown_symcof_interleave_f00_k5_tree_group`: exact, `1847/18/33246`

Notes:
- Worse than current `27480`; outer mux source rewrite is not the large-drop structure.

