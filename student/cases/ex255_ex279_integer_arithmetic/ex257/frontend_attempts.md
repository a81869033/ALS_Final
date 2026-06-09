# ex257 Frontend Attempts

Semantics: unsigned 6x6 multiply, `low6 * high6`.

Initial current best:
- `ex257_umul_direct`: 261/28/7308

Notes:
- Direct multiply is verified but still above reference.
- Try width-specific multiplier structures before backend optimization.

## 2026-06-09 Result

Best verified frontend seed:

- `ex257_umul_wallace_bits_prefix_abc_g_aig`
- Verilog: `student/work/ex255_ex259_frontend_umul_wallace_bits_20260609_0034/ex257/verilog/ex257_umul_wallace_bits_prefix.v`
- AIG: `student/work/ex255_ex259_frontend_umul_wallace_bits_20260609_0034/ex257/aigs/ex257_umul_wallace_bits_prefix_abc_g_aig.aig`
- QoR: `245/23/5635`, reference ADP `3952`, ratio `1.425860`

Attempts:

- Narrow/context multiply improved old direct `261/28/7308` to `229/27/6183`.
- Vector CSA reached `238/24/5712`.
- Bit-column Wallace with prefix final adder was best at `245/23/5635`.
- Booth/Dadda and split/Karatsuba variants were worse.

## 2026-06-09 CLA Follow-Up

New best verified frontend seed:

- `ex257_umul_csa_androws_cla_from3_synth_preset_d13`
- Verilog: `student/work/ex255_ex259_frontend_umul_cla_spread_20260609_0133/ex257/verilog/ex257_umul_csa_androws_cla_from3.v`
- AIG: `student/work/ex255_ex259_frontend_umul_cla_spread_20260609_0133/ex257/aigs/ex257_umul_csa_androws_cla_from3_synth_preset_d13.aig`
- QoR: `263/20/5260`, reference ADP `3952`, ratio `1.330972`

Attempts:

- CSA AND-row plus hybrid CLA starting at bit 3 traded area for a 3-level delay
  reduction, improving ADP from `5635` to `5260`.
- Full CLA and other CLA start points were exact but slightly worse.
- Concat/reverse/outside/center row encodings with CLA did not beat the
  AND-row hybrid CLA source.
