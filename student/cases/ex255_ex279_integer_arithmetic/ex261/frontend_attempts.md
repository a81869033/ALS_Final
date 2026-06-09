# ex261 Frontend Attempts

Semantics: signed 5x5 multiply, `signed(low5) * signed(high5)`.

Initial current best:
- `ex261_smul_abs_sign`: 189/27/5103

Notes:
- Try sign-extension factoring and Booth/Baugh-Wooley-like source variants.

## 2026-06-09 Result

Current best verified frontend seed:

- `ex261_smul_baugh_wooley_wallace_hcla4_abc_g_aig`
- Verilog: `student/work/ex260_ex264_frontend_smul_baugh_hcla_all_20260609_0324/ex261/verilog/ex261_smul_baugh_wooley_wallace_hcla4.v`
- AIG: `student/work/ex260_ex264_frontend_smul_baugh_hcla_all_20260609_0324/ex261/aigs/ex261_smul_baugh_wooley_wallace_hcla4_abc_g_aig.aig`
- QoR: `164/18/2952`, reference ADP `2041`, ratio `1.446350`

Attempts:

- Verified semantics: two's-complement `signed(low5) * signed(high5)`.
- Split-half signed decomposition first improved the old `abs_sign` seed to
  `179/21/3759`.
- Baugh-Wooley Wallace then improved to `159/20/3180`; hybrid CLA from bit 4
  reached the current `164/18/2952`.
- ANF and full case table were much larger; Booth/parallel Booth were exact
  but did not beat Baugh-Wooley+hCLA4.
- Follow-up order+merge, segment-prefix, carry-select, row-level Baugh,
  serial column carry-state, Dadda hybrid, and winner-flow checks were exact
  but did not improve `164/18/2952`.
