# ex258 Frontend Attempts

Semantics: unsigned 7x7 multiply, `low7 * high7`.

Initial current best:
- `ex258_umul_direct`: 392/35/13720

Notes:
- Larger width may benefit from explicit partial-product scheduling and
  balanced compressor trees.

## 2026-06-09 Result

Best verified frontend seed:

- `ex258_umul_wallace_bits_abc_g_aig`
- Verilog: `student/work/ex255_ex259_frontend_umul_wallace_bits_20260609_0034/ex258/verilog/ex258_umul_wallace_bits.v`
- AIG: `student/work/ex255_ex259_frontend_umul_wallace_bits_20260609_0034/ex258/aigs/ex258_umul_wallace_bits_abc_g_aig.aig`
- QoR: `351/25/8775`, reference ADP `6289`, ratio `1.395293`

Attempts:

- Narrow/context multiply improved old direct `392/35/13720` to `343/33/11319`.
- Vector CSA and rowstyle CSA improved to `344/29/9976`.
- Bit-column Wallace was the main improvement at `351/25/8775`.
- Split-half, Booth, Dadda, sorted operands, and column-carry were worse.

## 2026-06-09 CLA Follow-Up

- CSA + CLA final merge and Wallace-order CLA variants were exact but did not
  beat `351/25/8775`; ex258 remains best with the previous bit-column Wallace
  source.
