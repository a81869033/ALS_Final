# ex286_frontend_symcof_tree_mux_20260609_0915

Run ID: `ex286_frontend_symcof_tree_mux_20260609_0915`

Purpose: Test whether replacing the current multi-pair symmetry cofactor outer
onehot mux with a nested selector tree reduces delay for ex286.

Inputs:
- Truth file: `benchmarks/ex286.truth`
- Generator: `student/generators/unknown_symmetry_cofactor_search.py`
- Scope: pairs `4:5,6:7`, order `interleave`, policy `f00`, outer count `4`

Artifacts:
- Work directory: `student/work/ex286_frontend_symcof_tree_mux_20260609_0915/`
- Results: `student/runs/unknown/ex286_frontend_symcof_tree_mux_20260609_0915/results/`

Methods tried:
- `mux_style=tree`, `bdd_share=group`

Best result:
- `ex286_unknown_symcof_interleave_f00_k4_tree_group`: exact, `1472/18/26496`

Notes:
- Worse than current `21705`; do not repeat tree mux for this source form.

