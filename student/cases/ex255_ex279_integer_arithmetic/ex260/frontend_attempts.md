# ex260 Frontend Attempts

Semantics: signed 4x4 multiply, `signed(low4) * signed(high4)`.

Initial current best:
- `ex260_smul_abs_sign`: 109/19/2071

Notes:
- Compare sign/magnitude against direct signed multiply and explicit correction
  terms for negative operands.

## 2026-06-09 Result

Current best verified frontend seed:

- `ex260_smul_baugh_wooley_wallace_rev_hcla4_abc_g_aig`
- Verilog: `student/work/ex260_ex264_frontend_smul_order_edge_start_20260609_0605/ex260/verilog/ex260_smul_baugh_wooley_wallace_rev_hcla4.v`
- AIG: `student/work/ex260_ex264_frontend_smul_order_edge_start_20260609_0605/ex260/aigs/ex260_smul_baugh_wooley_wallace_rev_hcla4_abc_g_aig.aig`
- QoR: `88/13/1144`, reference ADP `657`, ratio `1.741248`

Attempts:

- Verified semantics: two's-complement `signed(low4) * signed(high4)`.
- Baugh-Wooley Wallace + hybrid CLA from bit 4 improved the old `abs_sign`
  seed from `109/19/2071` to `92/13/1196`.
- Reverse compressor item order combined with hCLA4 improved further to
  `88/13/1144`.
- Booth serial/parallel, Baugh order variants, hCLA start sweep, split-half
  2+2, exact ANF, full case table, and truth-direct AIG were exact or
  diagnostic but worse.
- Follow-up serial column carry-state, minimized carry SOP, full QMC per-bit
  SOP, and QMC selected high-bit override were exact but worse.  QMC high-bit
  override could lower delay on some rows, but the area increase lost ADP.

Open:

- Still outside 1.5x reference.  Further improvement likely needs a
  true shared multi-output 4x4 compressor network beyond per-bit SOP/table
  factoring.

## 2026-06-09 ex260 Deep Follow-Up

Additional exact runs:

- `ex260_ex263_frontend_smul_constfa_signbit_20260609_0638`
- `ex260_ex263_frontend_smul_order_pfx_refine_20260609_0640`
- `ex260_ex263_frontend_smul_counter4_smoke_20260609_0642`
- `ex260_ex263_frontend_smul_corr_order_20260609_0649`
- `ex260_ex263_frontend_smul_unsigned_core_highcorr_20260609_0654`
- `ex260_frontend_smul_shared_bdd_20260609_0658`
- `ex260_ex263_frontend_smul_modcarry_20260609_0703`
- `ex260_ex263_frontend_smul_direct_retry_20260609_0707`
- `ex260_frontend_smul_handmerge_20260609_0710`
- `ex260_ex263_frontend_smul_signcase_core_20260609_0714`

New directions tried and rejected:

- Constant-aware full-adder simplification and sign-bit override did not beat
  `88/13/1144`; sign-bit override increased cost.
- Segment-prefix starts `pfx1..4` tied or worsened the reverse+hCLA4 source.
- Exact 4-input column counters were area-heavy; best ex260 row was about
  `93/13/1209`.
- Correction/sign-aware item ordering (`corrfirst`, `corrlast`, `signfirst`,
  `signlast`, `corrzip`) tied the current best at best and often added area.
- Unsigned `(n-1)x(n-1)` core plus high sign-correction was exact but delay
  rose to 17+; branch-by-sign `signcase` was worse.
- Shared multi-output BDD reduced delay to 11-12 on some rows, but area rose to
  179+, so ADP regressed.
- Modulo-only final carry drop tied or worsened current best, suggesting Yosys
  already removes the unused overflow carry or that it is not the bottleneck.
- Hand-written sparse low-carry/final-merge source stayed at area 88 but delay
  rose to 14, so the current hCLA4 form maps better.

Current best remains:

- `ex260_smul_baugh_wooley_wallace_rev_hcla4_abc_g_aig`
- QoR: `88/13/1144`, reference ADP `657`, ratio `1.741248`

## 2026-06-09 Alternative Semantic Replay

Additional run/result location:

- `student/runs/integer/ex260_frontend_smul_alt_replay_20260609_1812/results/`

Tested:

- Sign/magnitude direct and Wallace variants.
- Signed small case and case-by-`b` constant multiply.
- Shared BDD variants with outside/interleave orders.

Result:

- No new best.  The lowest-delay row was `case_b_signed_const` at `190/9/1710`;
  delay improved versus current `13`, but area was too high.
- Current `88/13/1144` remains the best ADP.  The open problem is still a
  genuinely shallow and shared 4x4 signed compressor, not sign/magnitude,
  constant-case, or BDD replacement.
