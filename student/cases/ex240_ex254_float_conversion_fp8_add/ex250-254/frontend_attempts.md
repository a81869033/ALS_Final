# ex250-ex254 Batch Frontend Attempts

Scope: third batch of the float conversion / fp8 add class.

Initial status: folders and notes created for future runs.  This batch turned
out to be packed FP4/INT2 arithmetic, not plain FP8 conversion/add.

## Batch Attempt Log

- 2026-06-08 `ex250_ex254_frontend_fp4_dot_fma_semantic_fix_20260608_2110`:
  exact semantic identification and first verified Verilog/AIG seeds.
  - `ex250`: packed two-lane FP4 E2M1 dot product to E4M3FN.
  - `ex251`: packed two-lane signed 3-bit magnitude dot product to E4M3FN.
  - `ex252`: packed four-lane unsigned 2-bit dot product to E4M3FN.
  - `ex253`: unsigned 2-bit lane reduction, `2 * sum(lanes)`, to E4M3FN.
  - `ex254`: E4M3FN accumulator plus one low-byte FP4 E2M1 product.
- Signed-zero corner cases were exact-checked.  For the dot cases, `-0` appears
  only when both lane products are negative zero.  For ex254, `acc=-0` plus a
  negative-zero FP4 product yields `8'h80`.
- 2026-06-08 follow-up structure results:

| Case | Current best candidate | Area | Delay | ADP | Ref ADP | Ratio |
| --- | --- | ---: | ---: | ---: | ---: | ---: |
| ex250 | `ex250_semantic_fp4_dot2_magarith_qcase_synth_preset_aig` | 413 | 41 | 16933 | 20355 | 0.831884 |
| ex251 | `ex251_semantic_int3_dot2_arith_qcase_abc_g_aig` | 495 | 38 | 18810 | 39270 | 0.478992 |
| ex252 | `ex252_semantic_u2_dot4_handmul_balanced_qcase_default` | 145 | 21 | 3045 | 2603 | 1.169804 |
| ex253 | `ex253_semantic_u2_sum8_popcount_laneqcase_default` | 126 | 18 | 2268 | 1845 | 1.229268 |
| ex254 | `ex254_semantic_e4add_fp4product_grs_magfactored_abc_g_aig` | 662 | 55 | 36410 | 38220 | 0.952643 |

- Useful methods retained:
  - FP4 magnitude product factoring plus exact E4 quant case for ex250.
  - Direct signed int3 arithmetic plus E4 quant case for ex251.
  - Balanced/hand 2x2 dot tree for ex252; weighted low/high-bit popcount for ex253.
  - Product-to-E4 plus ex240 compact E4 add GRS/diff-normalizer for ex254, with
    FP4 product-to-E4 magnitude factoring.
- Excluded or lower-value methods:
  - Generic qrange/qnorm normalizers were exact but too deep for ex250/ex252/ex253.
  - ex250 reachable-only abs-sum qcase was worse; global unreachable states were
    not useful to Yosys in that source form.  Magnitude arithmetic tied the
    magnitude product table best.
  - ex252 weighted partial-product popcount and bitformula output rewrites were
    exact but worse; handmul only tied the current best.
  - ex253 2D `{hi_count,lo_count}` table lowered delay to 17 but area dominated;
    minimized bit formulas and threshold field formulas were worse than the
    popcount plus lane-sum qcase.
  - ex254 wide `acc_k + product_k -> quant` qcase/qrange/qnorm was exact but ADP-worse.
  - Full-output BDD and nested accumulator table lowered delay for ex254 but area was
    too large; full BDD was also too large for ex250/ex253.
  - `abc -D` delay-target synthflow and parallel-case hints did not improve the best
    measured AIGs.
- Official `evaluate.py` replay returned OK for the updated new bests:
  ex250 `413/41/16933`, ex253 `126/18/2268`, and ex254 `662/55/36410`.
  Earlier replay also returned OK for ex251 `495/38/18810` and ex252
  `145/21/3045`.
