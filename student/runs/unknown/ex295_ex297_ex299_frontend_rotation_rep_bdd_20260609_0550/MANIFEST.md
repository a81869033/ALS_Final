# ex295/ex297/ex299 Rotation Representative BDD

- Run ID: `ex295_ex297_ex299_frontend_rotation_rep_bdd_20260609_0550`
- Scope: `ex295`, `ex297`, `ex299`
- Work dir: `student/work/ex295_ex297_ex299_frontend_rotation_rep_bdd_20260609_0550/`
- Results dir: `student/runs/unknown/ex295_ex297_ex299_frontend_rotation_rep_bdd_20260609_0550/results/`
- Generator: `student/generators/unknown_rotation_rep_bdd.py`
- Hypothesis: transfer the representative/shared-source idea to the exact even-rotation equivariant ring cases by emitting representative output-bit BDDs for parity classes.

## Results

- Rows: 6.
- Official equivalent rows: 6.
- Best ADPs:
  - `ex295`: `11112/19/211128`, worse than current `8653/16/138448`.
  - `ex297`: `40859/24/980616`, worse than current `32422/18/583596`.
  - `ex299`: `144261/28/4039308`, worse than current `118397/22/2604734`.

## Conclusion

Exact rotation representative BDD reconstruction is rejected as an active seed family. It duplicates too much representative logic and does not expose the missing ring sharing needed for a large ADP drop.

