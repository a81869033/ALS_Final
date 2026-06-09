# ex288_frontend_multipair_selector_20260609_0931

Run ID: `ex288_frontend_multipair_selector_20260609_0931`

Purpose: Test whether ex288 benefits from combining three exact symmetry pairs
with the explicit selector bits `0:1:2:11`.

Inputs:
- Truth file: `benchmarks/ex288.truth`
- Generator: `student/generators/unknown_symmetry_cofactor_search.py`
- Scope: pairs `4:5,6:7,8:9`, order `interleave`, policy `f10`

Artifacts:
- Work directory: `student/work/ex288_frontend_multipair_selector_20260609_0931/`
- Results: `student/runs/unknown/ex288_frontend_multipair_selector_20260609_0931/results/`

Methods tried:
- default k4 onehot/case
- explicit outer bits `0:1:2:11` onehot/case

Best result:
- default k4 onehot: exact, `1938/18/34884`

Notes:
- Worse than current `32147`; multi-pair selector does not transfer to ex288.

