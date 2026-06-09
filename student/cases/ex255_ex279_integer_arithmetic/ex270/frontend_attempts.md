# ex270 Frontend Attempts

Semantics: square, `x * x`.

Initial semantic seeds:
- `ex270_square_direct`: 312/36/11232
- `ex270_square_symmetric_terms`: 297/61/18117

Current best row is baseline `495/11/5445`, better than the semantic seeds.

Notes:
- Frontend work must reduce square delay substantially, not only area.
- Try shallow small-width square truth decomposition and triangular products.

2026-06-09 update:
- Verified exact unsigned 8-bit square.
- New frontend best: `191/17/3247`, ratio 1.564066 to reference.
- Best source: triangular square partial products, Wallace outside ordering,
  carry-select final adder group size 5.
- Full-word 256-entry case and low-cofactor structures were exact but did not
  beat the carry-select Wallace source.

## 2026-06-09 Selected-BDD Follow-Up

Additional run/result location:

- `student/runs/integer/ex270_frontend_square_selected_bdd_20260609_1808/results/`

Tested:

- Selected middle/high output-bit BDD overrides combined with arithmetic lower
  square logic, mirroring the ex273/ex274 high-bit hybrid idea.

Result:

- No new best.  Best row was `353/15/5295`, which lowered delay from current
  `17` to `15` but area rose too much compared with `191/17/3247`.
- For ex270, selected output-bit BDD is not a good frontend tradeoff; the
  remaining gap likely needs a lighter final-carry improvement on the existing
  triangular Wallace/carry-select source.
