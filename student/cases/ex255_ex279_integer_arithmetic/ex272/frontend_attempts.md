# ex272 Frontend Attempts

Semantics: square, `x * x`.

Initial current semantic best:
- `ex272_square_direct`: 923/46/42458

Notes:
- Symmetric-terms source increases delay heavily; do not repeat without a new
  carry structure.

2026-06-09 update:
- Verified exact unsigned 12-bit square.
- New frontend best: `507/32/16224`, ratio 1.491176 to reference, now within
  1.5x.
- Best source: triangular square partial products, Wallace outside ordering,
  carry-select final adder group size 5 with `synth_preset`.
- Direct, low/high split, cofactor, LUT-to-AIG, and column-count structures did
  not beat the Wallace/carry-select family.
