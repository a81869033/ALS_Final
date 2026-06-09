# ex264 Frontend Attempts

Semantics: signed 8x8 multiply, `signed(low8) * signed(high8)`.

Initial current best:
- `ex264_smul_abs_sign`: 541/45/24345

Notes:
- Try decomposed signed 4x4 blocks, sign correction sharing, and compressor
  tree source forms.

## 2026-06-09 Result

Current best verified frontend seed:

- `ex264_smul_baugh_wooley_wallace_rev_hcla6_abc_g_aig`
- Verilog: `student/work/ex260_ex264_frontend_smul_order_edge_start_20260609_0605/ex264/verilog/ex264_smul_baugh_wooley_wallace_rev_hcla6.v`
- AIG: `student/work/ex260_ex264_frontend_smul_order_edge_start_20260609_0605/ex264/aigs/ex264_smul_baugh_wooley_wallace_rev_hcla6_abc_g_aig.aig`
- QoR: `486/27/13122`, reference ADP `9724`, ratio `1.349445`

Attempts:

- Verified semantics: two's-complement `signed(low8) * signed(high8)`.
- Direct signed multiply improved the initial `541/45/24345` to
  `553/35/19355`.
- Fixed Booth improved area but had high delay (`446/40/17840`); parallel
  Booth rows improved to `458/36/16488`.
- Baugh-Wooley Wallace reached `490/30/14700`, just outside 1.5x reference.
- Hybrid CLA from bit 4 was the key final rewrite and reached current
  `489/27/13203`, inside 1.5x.
- Reverse compressor order plus hCLA6 improved the current seed to
  `486/27/13122`.
- Dadda-style scheduling, sign-bit override, plus final merge, serial column
  carry-state, broad pfx replacement, and most order variants were exact but
  did not beat reverse+hCLA6.
