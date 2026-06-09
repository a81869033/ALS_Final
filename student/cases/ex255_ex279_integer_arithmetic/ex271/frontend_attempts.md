# ex271 Frontend Attempts

Semantics: square, `x * x`.

Initial current semantic best:
- `ex271_square_direct`: 664/40/26560

Notes:
- Direct square is verified but far above reference.
- Try square-specific partial products and carry-save accumulation.

2026-06-09 update:
- Verified exact unsigned 10-bit square.
- New frontend best: `331/25/8275`, ratio 1.493143 to reference, now within
  1.5x.
- Best source: triangular square partial products, Wallace outside ordering,
  carry-select final adder group size 4 with `synth_preset`.
- Full-word 1024-entry case was exact but did not improve ADP.
