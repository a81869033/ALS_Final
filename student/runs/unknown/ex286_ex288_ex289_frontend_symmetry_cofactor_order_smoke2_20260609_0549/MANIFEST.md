# ex286/ex288/ex289 Symmetry Cofactor Order Smoke2

- Run ID: `ex286_ex288_ex289_frontend_symmetry_cofactor_order_smoke2_20260609_0549`
- Scope: `ex286`, `ex288`, `ex289`
- Work dir: `student/work/ex286_ex288_ex289_frontend_symmetry_cofactor_order_smoke2_20260609_0549/`
- Results dir: `student/runs/unknown/ex286_ex288_ex289_frontend_symmetry_cofactor_order_smoke2_20260609_0549/results/`
- Generator: `student/generators/unknown_symmetry_cofactor_search.py`

## Results

- Rows: 54.
- Official equivalent rows: 54.
- Best rows were much worse than current:
  - `ex286`: best `5281/18/95058`.
  - `ex288`: best `13113/21/275373`.
  - `ex289`: best `17936/22/394592`.

## Conclusion

`reverse`, `natural`, and `sym_first` cofactor orders are rejected. The useful order remains `interleave`; non-interleave orders duplicate too much BDD logic even after class-onehot factoring.

