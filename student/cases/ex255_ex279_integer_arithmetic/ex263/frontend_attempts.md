# ex263 Frontend Attempts

Semantics: signed 7x7 multiply, `signed(low7) * signed(high7)`.

Initial current best:
- `ex263_smul_abs_sign`: 415/41/17015

Notes:
- ADP gap suggests source-level signed multiplier structure is worth deep
  exploration before backend optimization.

## 2026-06-09 Result

Current best verified frontend seed:

- `ex263_smul_baugh_wooley_wallace_outside_hcla1_synth_preset_d13`
- Verilog: `student/work/ex260_ex264_frontend_smul_order_edge_start_20260609_0605/ex263/verilog/ex263_smul_baugh_wooley_wallace_outside_hcla1.v`
- AIG: `student/work/ex260_ex264_frontend_smul_order_edge_start_20260609_0605/ex263/aigs/ex263_smul_baugh_wooley_wallace_outside_hcla1_synth_preset_d13.aig`
- QoR: `362/24/8688`, reference ADP `6840`, ratio `1.270175`

Attempts:

- Verified semantics: two's-complement `signed(low7) * signed(high7)`.
- Abs-sign Wallace improved the initial `415/41/17015` to `391/33/12903`.
- Parallel Booth improved to `356/32/11392`.
- Baugh-Wooley Wallace and hCLA4 first reached `357/26/9282`.
- Segment-prefix final merge gave a smaller intermediate improvement
  (`363/25/9075`), then order+merge refinement found the current
  `outside+hCLA1` structure at `362/24/8688`.
- Dadda, sign-bit override, serial column carry-state, minimized carry SOP,
  center/evenodd ordering, and broad final-merge alternatives did not beat the
  current outside+hCLA1 result.

## 2026-06-09 ex263 Deep Follow-Up

Additional exact runs:

- `ex260_ex263_frontend_smul_constfa_signbit_20260609_0638`
- `ex260_ex263_frontend_smul_order_pfx_refine_20260609_0640`
- `ex260_ex263_frontend_smul_counter4_smoke_20260609_0642`
- `ex260_ex263_frontend_smul_corr_order_20260609_0649`
- `ex260_ex263_frontend_smul_unsigned_core_highcorr_20260609_0654`
- `ex260_ex263_frontend_smul_modcarry_20260609_0703`
- `ex260_ex263_frontend_smul_direct_retry_20260609_0707`
- `ex260_ex263_frontend_smul_signcase_core_20260609_0714`

New directions tried and rejected:

- Constant-aware compressor simplification, sign-bit override, and exact
  4-input counters were exact but worsened ADP.
- Segment-prefix starts `pfx1..4` did not beat outside+hCLA1.
- Correction/sign-aware item ordering found `365/24/8760` at best, close but
  still worse than `362/24/8688`.
- Unsigned-core/high-correction and branch-by-sign signcase rewrites were
  exact but delay-heavy.
- Modulo-only carry-drop source tied the current best with
  `outside+hCLA1_mod+synth_preset_d11` at `362/24/8688`; this is a source
  simplification candidate but not a QoR improvement.
- Direct/wide signed `*` was rechecked with current flows; it synthesized but
  remained much worse than Baugh-Wooley.

Current best remains:

- `ex263_smul_baugh_wooley_wallace_outside_hcla1_synth_preset_d11` or the
  tied modulo-carry-drop source
- QoR: `362/24/8688`, reference ADP `6840`, ratio `1.270175`
