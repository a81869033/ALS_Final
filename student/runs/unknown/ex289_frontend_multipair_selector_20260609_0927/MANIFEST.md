# ex289_frontend_multipair_selector_20260609_0927

Run ID: `ex289_frontend_multipair_selector_20260609_0927`

Purpose: Combine ex289's four exact input symmetry pairs with the previously
useful explicit selector bits `0:1:12:13`.

Inputs:
- Truth file: `benchmarks/ex289.truth`
- Generator: `student/generators/unknown_symmetry_cofactor_search.py`
- Scope: pairs `4:5,6:7,8:9,10:11`, order `interleave`, policy `f00`

Artifacts:
- Work directory: `student/work/ex289_frontend_multipair_selector_20260609_0927/`
- Results: `student/runs/unknown/ex289_frontend_multipair_selector_20260609_0927/results/`

Methods tried:
- default k4 onehot/case
- explicit outer bits `0:1:12:13` onehot/case

Best result:
- explicit selector case: exact, `1401/21/29421`

Notes:
- Raw ADP is worse than current, but lower area made it worth limited synthflow.

