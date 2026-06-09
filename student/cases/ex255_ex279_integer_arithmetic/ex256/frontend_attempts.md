# ex256 Frontend Attempts

Semantics: unsigned 5x5 multiply, `low5 * high5`.

Initial current best:
- `ex256_umul_direct`: 171/24/4104

Notes:
- Start from direct, shift-add, and partial-product variants in
  `student/runs/integer/ex255_ex279_current/results/candidates.csv`.
- Try balanced partial products and carry-save style accumulation.

## 2026-06-09 Result

Best verified frontend seed:

- `ex256_umul_csa_androws_synth_preset_d18`
- Verilog: `student/work/ex255_ex259_frontend_umul_csa_delaytargets_20260609_0027/ex256/verilog/ex256_umul_csa_androws.v`
- AIG: `student/work/ex255_ex259_frontend_umul_csa_delaytargets_20260609_0027/ex256/aigs/ex256_umul_csa_androws_synth_preset_d18.aig`
- QoR: `150/21/3150`, reference ADP `1911`, ratio `1.648352`

Attempts:

- Narrow/context multiply improved the old direct seed from `171/24/4104` to
  `155/25/3875`, but delay stayed high.
- Vector CSA / AND-row CSA reached `150/21/3150`, current best.
- Bit-column Wallace reached `158/20/3160`; lower delay, slightly worse ADP.
- Prefix final adder, Dadda, Booth, high-bit correction, operand-constant
  case, no-internal-ABC, shared-BDD, and Wallace grouping orders were exact or
  diagnostic but worse.

Open:

- ex256 remains the only case in this batch outside 1.5x reference.  The
  remaining gap is mostly delay (`21` vs reference `13`), not area
  (`150` vs reference `147`).

## 2026-06-09 CLA Follow-Up

New best verified frontend seed:

- `ex256_umul_csa_androws_cla_abc_g_aig`
- Verilog: `student/work/ex256_frontend_umul_cla_final_20260609_0127/ex256/verilog/ex256_umul_csa_androws_cla.v`
- AIG: `student/work/ex256_frontend_umul_cla_final_20260609_0127/ex256/aigs/ex256_umul_csa_androws_cla_abc_g_aig.aig`
- QoR: `159/18/2862`, reference ADP `1911`, ratio `1.497645`

Attempts:

- Full CLA final merge over the CSA AND-row residual was the first large
  improvement after the Wallace/CSA plateau.
- Hybrid CLA starting at bits 2, 3, or 4 was exact but did not beat full CLA;
  best hybrid was `159/18/2862` tie or `156/19/2964`, depending on flow.
- Block split, small block case multipliers, odd Karatsuba, sorted constant
  multiply, column carry-state case logic, full product case, per-bit LUT, and
  Yosys LUT-front mapping were all exact or diagnostic but worse.

Current view:

- The remaining gap to reference is still delay (`18` vs `13`), but the seed is
  now inside 1.5x reference.  Further frontend-only improvement likely needs a
  genuinely smaller 5x5 compressor/CLA network rather than another table or
  block-product form.

## 2026-06-09 Deeper Follow-Up

Best remains:

- `ex256_umul_csa_androws_cla_abc_g_aig`
- QoR: `159/18/2862`

Additional attempts:

- AND-row row-order variants with CLA: reverse/evenodd/outside/center exact,
  but no ADP improvement.
- Prefix and carry-select final adders: best non-CLA result was
  carry-select3 at `156/19/2964`, still worse than full CLA.
- 4:2-style compressor variants: best tied `159/18/2862`; no delay reduction.
- Selected high-bit LUT hybrid: top-1 override `190/19/3610`, top-2/top-3
  worse.
- High-bit semantic decomposition into 4x4 low product plus cross correction:
  low area (`151`) but high delay (`26`), so not useful for ADP.

Interpretation:

- The useful frontier is still a compact full-width carry/compressor network.
  Low-area decompositions are too serial, while shallow classifiers are too
  area-heavy.  Any next major improvement likely needs a hand-minimized 5x5
  compressor with shared carry-lookahead predicates, not another source-level
  adder template.

## 2026-06-09 Shared Carry Predicate Follow-Up

Best remains:

- `ex256_umul_csa_androws_cla_abc_g_aig`
- QoR: `159/18/2862`

Focused runs:

- `student/runs/integer/ex256_frontend_umul_shared_carry_pred_20260609_0158/`
- `student/runs/integer/ex256_frontend_umul_weighted_carry_pred_20260609_0204/`
- `student/runs/integer/ex256_frontend_umul_minimized_carry_sop_fix_20260609_0215/`
- `student/runs/integer/ex256_frontend_umul_carry_state_prefix_20260609_0220/`

Additional attempts:

- Column-local pairtree/fastcarry predicates were exact after excluding the
  first unweighted carry-state bug, but the best exact rows were only
  `150/29/4350` and `151/30/4530`.
- Weighted threshold predicates directly modeled incoming carry weights and
  became exact, but were too large and slow: best `273/27/7371`.
- Quine-McCluskey minimized SOP for exact weighted output-bit predicates was
  fixed for bit-ordering and verified exact, but still landed around
  `256/30/7680`.
- Balanced carry-state prefix over column transition tables was exact and
  reduced delay versus serial predicate chains, but the state mux network was
  area-heavy: best `326/21/6846`.

Interpretation:

- Naively minimizing each column carry predicate does not expose the
  reference-like `147/13` network.  The predicates either keep a serial
  dependency through carry weights or introduce a large multi-output state mux.
- The next plausible large improvement is not another final-output table or
  independent carry predicate.  It would need exact multi-output factoring over
  the final two-row compressor representation, or a custom shared compressor
  network whose intermediate carry/save terms are minimized together.
