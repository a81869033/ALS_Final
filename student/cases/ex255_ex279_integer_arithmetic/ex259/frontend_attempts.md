# ex259 Frontend Attempts

Semantics: unsigned 8x8 multiply, `low8 * high8`.

Initial current best:
- `ex259_umul_direct`: 506/38/19228

Notes:
- Try direct multiply, structured partial products, and decomposed 4x4 blocks
  with shared additions.

## 2026-06-09 Result

Best verified frontend seed:

- `ex259_umul_wallace_bits_prefix_abc_g_aig`
- Verilog: `student/work/ex255_ex259_frontend_umul_wallace_bits_20260609_0034/ex259/verilog/ex259_umul_wallace_bits_prefix.v`
- AIG: `student/work/ex255_ex259_frontend_umul_wallace_bits_20260609_0034/ex259/aigs/ex259_umul_wallace_bits_prefix_abc_g_aig.aig`
- QoR: `483/28/13524`, reference ADP `10000`, ratio `1.352400`

Attempts:

- Narrow/context multiply improved old direct `506/38/19228` to `455/37/16835`.
- Vector CSA nearly reached 1.5x reference at `469/32/15008`.
- Bit-column Wallace with prefix final adder was the main improvement at
  `483/28/13524`.
- Balanced rows had lower area (`433/35/15155`) but worse ADP.
- Split-half, Karatsuba, Booth, sorted operands, and column-carry were worse.

## 2026-06-09 CLA Follow-Up

New best verified frontend seed:

- `ex259_umul_wallace_bits_cla_abc_g_aig`
- Verilog: `student/work/ex255_ex259_frontend_umul_cla_spread_20260609_0133/ex259/verilog/ex259_umul_wallace_bits_cla.v`
- AIG: `student/work/ex255_ex259_frontend_umul_cla_spread_20260609_0133/ex259/aigs/ex259_umul_wallace_bits_cla_abc_g_aig.aig`
- QoR: `480/28/13440`, reference ADP `10000`, ratio `1.344000`

Attempts:

- Replacing the previous prefix final adder with the explicit CLA final merge
  preserved delay 28 and saved a little area, improving ADP from `13524` to
  `13440`.
- Wallace item-order variants with CLA were exact but did not beat natural
  order.
