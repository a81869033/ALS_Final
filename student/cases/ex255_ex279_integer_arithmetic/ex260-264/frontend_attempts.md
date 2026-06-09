# ex260-ex264 Frontend Attempts

Batch scope: signed multiplication.

Initial verified semantics from existing integer seeds:

- `ex260`: signed low4 * signed high4
- `ex261`: signed low5 * signed high5
- `ex262`: signed low6 * signed high6
- `ex263`: signed low7 * signed high7
- `ex264`: signed low8 * signed high8

Existing best semantic variant is sign/magnitude-style `abs_sign`.
Future work should compare direct signed multiply, sign/magnitude, Baugh-
Wooley-like source structure, Booth-style recoding, and shallow correction
logic for sign extension and two's-complement corner cases.

## 2026-06-09 Deep Frontend Run

Key runs:

- `student/runs/integer/ex260_ex264_frontend_smul_struct_20260609_0223/`
- `student/runs/integer/ex260_ex264_frontend_smul_booth_wide_fix_20260609_0230/`
- `student/runs/integer/ex260_ex264_frontend_smul_booth_parallel_20260609_0239/`
- `student/runs/integer/ex260_ex264_frontend_smul_baugh_wallace_20260609_0247/`
- `student/runs/integer/ex260_ex264_frontend_smul_baugh_order_20260609_0258/`
- `student/runs/integer/ex260_ex264_frontend_smul_baugh_hcla_all_20260609_0324/`
- Follow-up order/final-merge refinement:
  `ex260_ex264_frontend_smul_order_hybrid_20260609_0558`,
  `ex260_ex264_frontend_smul_order_hybrid_expand_20260609_0559`,
  `ex260_ex264_frontend_smul_order_start_refine_20260609_0604`,
  `ex260_ex264_frontend_smul_order_edge_start_20260609_0605`, and
  `ex260_ex264_frontend_smul_winner_flow_check_20260609_0606`.
- Diagnostics: `ex260_ex261_frontend_smul_anf_20260609_0336`,
  `ex260_frontend_smul_split2_20260609_0344`,
  `ex260_frontend_truth_diag_20260609_0340`.

Current best verified frontend seeds:

| Case | Best source | Area | Delay | ADP | Ref ADP | Ratio |
| --- | --- | ---: | ---: | ---: | ---: | ---: |
| ex260 | Baugh-Wooley Wallace reverse order + hCLA4 | 88 | 13 | 1144 | 657 | 1.741248 |
| ex261 | Baugh-Wooley Wallace + hCLA4 | 164 | 18 | 2952 | 2041 | 1.446350 |
| ex262 | Baugh-Wooley Wallace + hCLA4 | 252 | 22 | 5544 | 4900 | 1.131429 |
| ex263 | Baugh-Wooley Wallace outside order + hCLA1 | 362 | 24 | 8688 | 6840 | 1.270175 |
| ex264 | Baugh-Wooley Wallace reverse order + hCLA6 | 486 | 27 | 13122 | 9724 | 1.349445 |

Progress from initial `abs_sign` seed:

| Case | Initial ADP | Current ADP | Improvement |
| --- | ---: | ---: | ---: |
| ex260 | 2071 | 1144 | 44.76% |
| ex261 | 5103 | 2952 | 42.15% |
| ex262 | 9405 | 5544 | 41.05% |
| ex263 | 17015 | 8688 | 48.94% |
| ex264 | 24345 | 13122 | 46.10% |

Methods and conclusions:

- Direct signed multiply, wide signed multiply, and sign/magnitude variants
  were exact but kept too much sign-extension/final-negation delay.
- Procedural Booth became exact after sign-extension syntax was fixed and
  improved several cases; parallel Booth rows improved larger widths further,
  but remained worse than Baugh-Wooley.
- Baugh-Wooley signed partial products were the main a-ha: complement the
  negative sign row/column, add constants at bit `n` and bit `2n-1`, then use
  Wallace compression.
- Hybrid CLA from bit 4 was the second a-ha.  It beat both full CLA and plain
  `+` final merge for the signed Baugh rows.
- Follow-up order+merge refinement found another useful structure: keep the
  Baugh-Wooley Wallace tree but change the per-column compressor item order
  and the hCLA start.  `reverse+hCLA4` improved ex260, `outside+hCLA1`
  improved ex263, and `reverse+hCLA6` improved ex264.
- Dadda-like scheduling, sign-bit override, exact ANF bit formulas, full
  case-table sources, split-half 2+2, and truth-direct AIG diagnostics were
  exact where applicable but did not beat Baugh-Wooley+hCLA4.
- Later exact experiments also rejected segment-prefix final merge as a broad
  replacement, serial column carry-state arithmetic, minimized column carry
  SOP, full QMC per-bit SOP, and QMC selected high-bit override.  QMC could
  reduce ex260 delay but area was much too high, so ADP regressed.

Open:

- ex260 remains outside 1.5x reference.  The remaining gap is small width
  specific: reference is `73/9/657`, current best is `88/13/1144`.
  Generic truth table, ANF, case table, split-half, serial carry-state,
  per-bit QMC, selected-bit QMC override, and hCLA/order sweeps were all
  worse or only incremental, so further progress likely needs a true shared
  multi-output 4x4 compressor network.

## 2026-06-09 ex260/ex263 Deep Follow-Up

Runs:

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

Conclusions:

- Correction/sign-aware item ordering was exact but only tied ex260 and reached
  `365/24/8760` for ex263, short of current `362/24/8688`.
- Segment-prefix pfx starts, constant-aware FA simplification, sign-bit
  override, and exact 4-input column counters did not improve either case.
- Unsigned-core plus high sign correction and branch-by-sign signcase rewrites
  were exact semantic RTL alternatives, but they moved the critical path into
  subtract/correction logic and lost ADP.
- Shared multi-output BDD for ex260 confirmed that mux/tree structures can
  lower delay but with too much area (`179+` area), so this is not the missing
  reference-like structure.
- Modulo-only final carry-drop source tied ex263 and did not improve ex260,
  suggesting the unused overflow carry is not the remaining bottleneck.
- A hand-written ex260 sparse low-carry/final-merge source was exact but
  worsened delay by one level; current reverse+hCLA4 remains better.

No current-best CSV update was needed; best rows remain ex260 `88/13/1144`
and ex263 `362/24/8688`.

## 2026-06-09 ex260 Alternative Semantic Replay

Additional run/result location:

- `student/runs/integer/ex260_frontend_smul_alt_replay_20260609_1812/results/`

No new best was found.  Sign/magnitude, signed small-case, case-by-operand
constant multiply, and shared BDD variants were exact but non-winning.  The
best replay row was `case_b_signed_const` at `190/9/1710`: lower delay, but
area too high.  Current best remains `88/13/1144`.
