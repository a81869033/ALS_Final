# ex255 Frontend Attempts

Semantics: unsigned 4x4 multiply, `low4 * high4`.

Initial verified seeds:
- `ex255_umul_direct`: 97/16/1552
- `ex255_umul_shift_add`: 102/24/2448
- `ex255_umul_partial_products`: 85/21/1785

Notes:
- Direct multiply is current best by ADP.
- Partial products reduce area but increase delay; useful as a source for
  delay-rewrite experiments.

## 2026-06-09 Result

Best verified frontend seed:

- `ex255_umul_wallace_bits_abc_g_aig`
- Verilog: `student/work/ex255_ex259_frontend_umul_wallace_bits_20260609_0034/ex255/verilog/ex255_umul_wallace_bits.v`
- AIG: `student/work/ex255_ex259_frontend_umul_wallace_bits_20260609_0034/ex255/aigs/ex255_umul_wallace_bits_abc_g_aig.aig`
- QoR: `87/13/1131`, reference ADP `836`, ratio `1.352871`

Attempts:

- Direct/context multiply and explicit `wreduce` did not improve the old
  `97/16/1552` direct seed.
- Vector CSA improved to `87/14/1218`.
- Concat/center CSA rowstyle improved slightly to `86/14/1204`.
- Bit-column Wallace was best at `87/13/1131`.
- Booth and Dadda were exact after Booth guard fix but worse.

## 2026-06-09 CLA Follow-Up

- CSA + CLA final merge was exact but reached only `87/14/1218`, so the
  previous bit-column Wallace seed remains best.
