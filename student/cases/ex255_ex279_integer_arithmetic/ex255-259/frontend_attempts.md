# ex255-ex259 Frontend Attempts

Batch scope: unsigned multiplication.

Initial verified semantics from existing integer seeds:

- `ex255`: low4 * high4
- `ex256`: low5 * high5
- `ex257`: low6 * high6
- `ex258`: low7 * high7
- `ex259`: low8 * high8

Existing variants include direct multiply, shift-add, and partial-products.
Future work should try source-level multiplier structures that reduce ADP
before any backend optimization: CSA/Wallace-style accumulation, balanced
partial-product trees, output-bit factoring, and width-specific hand RTL.

## 2026-06-09 Deep Unsigned-Multiply Frontend Run

All five cases were rechecked as unsigned `lowN * highN` under the project
`read_truth -xf` convention.  Every retained candidate below was synthesized
to AIG and checked by ABC CEC through `evaluate_aig`.

| Case | Best source | Area | Delay | ADP | Ref ADP | Ratio |
| --- | --- | ---: | ---: | ---: | ---: | ---: |
| ex255 | bit-column Wallace, `abc -g aig` | 87 | 13 | 1131 | 836 | 1.352871 |
| ex256 | CSA AND-row, `synth_preset_d18` | 150 | 21 | 3150 | 1911 | 1.648352 |
| ex257 | bit-column Wallace + prefix final adder, `abc -g aig` | 245 | 23 | 5635 | 3952 | 1.425860 |
| ex258 | bit-column Wallace, `abc -g aig` | 351 | 25 | 8775 | 6289 | 1.395293 |
| ex259 | bit-column Wallace + prefix final adder, `abc -g aig` | 483 | 28 | 13524 | 10000 | 1.352400 |

Runs:

- `student/runs/integer/ex255_ex259_frontend_umul_deep_20260609_0013/`
- `student/runs/integer/ex255_ex259_frontend_umul_struct_20260609_0020/`
- `student/runs/integer/ex255_ex259_frontend_umul_csa_rowstyles_20260609_0025/`
- `student/runs/integer/ex255_ex259_frontend_umul_csa_delaytargets_20260609_0027/`
- `student/runs/integer/ex255_ex259_frontend_umul_wallace_bits_20260609_0034/`
- ex256-only exclusion checks: case-constant, high-bit correction, no-ABC,
  shared-BDD, Wallace order variants.

Useful conclusions:

- The old direct source used over-wide zero-extended multiply operands.  Narrow
  context multiply and `synth` flows improved ex256-ex259 but did not solve
  delay.
- Vector CSA was the first major improvement; explicit AND/concat row styles
  helped ex255/ex258 slightly.
- Bit-column Wallace compression was the main a-ha structure.  It avoids
  full-width vector CSA zeros and gives the best current seeds for ex255,
  ex257, ex258, and ex259.
- Prefix final adders help only in selected widths: useful for ex257/ex259
  with Wallace, not useful as a generic CSA replacement.
- Booth, Dadda, case-by-operand constant multiply, BDD, no-internal-ABC, and
  high-bit correction were exact where applicable but did not beat the current
  bests.  Dadda had equivalence issues for wider widths and was already worse
  for the smaller exact widths, so it was not pursued further.

Open:

- ex256 remains outside 1.5x reference.  The best frontend-only seed found is
  `150/21/3150`; reference is `147/13/1911`.  The gap is primarily delay, and
  likely needs either a substantially different hand-derived 5x5 carry network
  or later backend optimization.

## 2026-06-09 CLA Final-Merge Follow-Up

Focused runs:

- `student/runs/integer/ex256_frontend_umul_cla_final_20260609_0127/`
- `student/runs/integer/ex256_frontend_umul_hybrid_cla_20260609_0131/`
- `student/runs/integer/ex255_ex259_frontend_umul_cla_spread_20260609_0133/`
- `student/runs/integer/ex256_ex257_frontend_umul_csa_order_cla_20260609_0137/`
- `student/runs/integer/ex258_ex259_frontend_umul_wallace_order_cla_20260609_0140/`

Updated best verified frontend seeds:

| Case | Best source | Area | Delay | ADP | Ref ADP | Ratio |
| --- | --- | ---: | ---: | ---: | ---: | ---: |
| ex255 | bit-column Wallace, `abc -g aig` | 87 | 13 | 1131 | 836 | 1.352871 |
| ex256 | CSA AND-row + full CLA final merge, `abc -g aig` | 159 | 18 | 2862 | 1911 | 1.497645 |
| ex257 | CSA AND-row + hybrid CLA-from-bit3 final merge, `synth_preset_d13` | 263 | 20 | 5260 | 3952 | 1.330972 |
| ex258 | bit-column Wallace, `abc -g aig` | 351 | 25 | 8775 | 6289 | 1.395293 |
| ex259 | bit-column Wallace + CLA final merge, `abc -g aig` | 480 | 28 | 13440 | 10000 | 1.344000 |

New conclusions:

- The main ex256 gap was the final carry merge, not the partial product rows.
  Replacing the final `+` in the CSA seed with an explicit CLA dropped delay
  from 21 to 18 and improved ADP from `3150` to `2862`.
- Hybrid CLA saved little area and usually lost delay; full CLA is best for
  ex256, while ex257 prefers a CLA starting at bit 3.
- Full product case and per-bit LUT classifiers proved delay can fall to
  14-16, but area exploded (`>790`), so they are excluded as active seeds.
- LUT-front Yosys mapping (`abc -lut 3/4/5` then AIG) was worse than direct
  `abc -g aig`.
- CLA spread did not improve ex255 or ex258; their previous Wallace seeds
  remain best.

## 2026-06-09 Deeper ex256 Follow-Up

Focused runs:

- `student/runs/integer/ex256_frontend_umul_deeper_merge_20260609_0148/`
- `student/runs/integer/ex256_frontend_umul_4to2_compressor_20260609_0153/`
- `student/runs/integer/ex256_frontend_umul_highbit_hybrid_20260609_0158/`
- `student/runs/integer/ex256_frontend_umul_highbit_decomp_20260609_0203/`

No new best was found beyond `ex256_umul_csa_androws_cla_abc_g_aig`
(`159/18/2862`).

Excluded directions:

- AND-row reverse/evenodd/outside/center schedules with CLA: exact but area or
  delay worsened; natural order stayed best.
- Kogge/Sklansky prefix and carry-select final adders: Sklansky/carry-select
  can reduce area, but delay rises enough that ADP loses.
- 4:2-style row compressor before CLA: best tied `159/18/2862`; Yosys/ABC
  effectively converges it back to the full-CLA structure.
- Selected high-bit LUT override: top-1 override was already `190/19/3610`,
  top-2/top-3 were much larger, so high-bit classifier replacement is not a
  good ADP path.
- 4x4 low-product plus top-bit cross correction: area reached `151`, but delay
  was `26`; reference `147/13` is not explained by this simple decomposition.

## 2026-06-09 ex256 Shared Carry Predicate Follow-Up

Focused runs:

- `student/runs/integer/ex256_frontend_umul_shared_carry_pred_20260609_0158/`
- `student/runs/integer/ex256_frontend_umul_weighted_carry_pred_20260609_0204/`
- `student/runs/integer/ex256_frontend_umul_minimized_carry_sop_fix_20260609_0215/`
- `student/runs/integer/ex256_frontend_umul_carry_state_prefix_20260609_0220/`

No new best was found beyond `ex256_umul_csa_androws_cla_abc_g_aig`
(`159/18/2862`).

Excluded directions:

- Column-local pairtree/fastcarry carry predicates were exact but remained
  high-delay: best `150/29/4350` and `151/30/4530`.
- Weighted threshold carry predicates fixed the carry-weight modeling and were
  exact, but too large: best `273/27/7371`.
- Exact minimized SOP predicates were verified after a bit-order fix, but were
  still around `256/30/7680`.
- Balanced carry-state prefix over column transition states reduced serial
  carry depth but paid too much mux/control area: best `326/21/6846`.

Conclusion:

- Independent carry predicate minimization is not enough for ex256.  The
  remaining gap likely needs a shared multi-output compressor network, where
  carry/save intermediate terms are minimized together before the final merge.
