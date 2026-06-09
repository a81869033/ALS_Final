# ex262 Frontend Attempts

Semantics: signed 6x6 multiply, `signed(low6) * signed(high6)`.

Initial current best:
- `ex262_smul_abs_sign`: 285/33/9405

Notes:
- Existing sign/magnitude seed is verified; look for shallower sign correction
  and partial-product accumulation.

## 2026-06-09 Result

Current best verified frontend seed:

- `ex262_smul_baugh_wooley_wallace_hcla4_abc_g_aig`
- Verilog: `student/work/ex260_ex264_frontend_smul_baugh_hcla_all_20260609_0324/ex262/verilog/ex262_smul_baugh_wooley_wallace_hcla4.v`
- AIG: `student/work/ex260_ex264_frontend_smul_baugh_hcla_all_20260609_0324/ex262/aigs/ex262_smul_baugh_wooley_wallace_hcla4_abc_g_aig.aig`
- QoR: `252/22/5544`, reference ADP `4900`, ratio `1.131429`

Attempts:

- Verified semantics: two's-complement `signed(low6) * signed(high6)`.
- Split-half signed improved the initial `285/33/9405` to `265/29/7685`.
- Fixed Booth reached `246/28/6888`; Baugh-Wooley Wallace reached
  `254/23/5842`; Baugh-Wooley+hCLA4 reached current best `252/22/5544`.
- This case is now close to reference and well inside 1.5x.
