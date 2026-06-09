# ex285-ex289 Symmetry Cofactor Class-Onehot

- Run ID: `ex285_ex289_frontend_symmetry_cofactor_classonehot_20260609_0548`
- Scope: `ex285-ex289`
- Work dir: `student/work/ex285_ex289_frontend_symmetry_cofactor_classonehot_20260609_0548/`
- Results dir: `student/runs/unknown/ex285_ex289_frontend_symmetry_cofactor_classonehot_20260609_0548/results/`
- Generator: `student/generators/unknown_symmetry_cofactor_search.py`
- Tool paths: `student/tools/conda-env/bin/yosys`, `student/abc`
- Hypothesis: reuse the `ex280-ex284` class/cofactor source rewrite on the `ex285-ex289` exact `swap_in_4_5` canonical key.

## Results

- Rows: 30.
- Official equivalent rows: 30.
- New current bests:
  - `ex286`: `1474/16/23584`, previous `1860/13/24180`, improvement `596`.
  - `ex288`: `1930/18/34740`, previous `1877/19/35663`, improvement `923`.
  - `ex289`: `1755/19/33345`, previous `1733/21/36393`, improvement `3048`.
- Exact but worse than current:
  - `ex285`: best `1042/15/15630`, current `775/17/13175`.
  - `ex287`: best `1755/18/31590`, current `1723/18/31014`.

## Conclusion

This is a verified frontend source-structure improvement, not a backend portfolio. Interleave top-4 class-onehot is the useful form; it reduces delay enough to beat the old symmetry-BDD or rotate-split current rows on `ex286`, `ex288`, and `ex289`.

