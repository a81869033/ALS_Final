# ex235-ex239 FP16 Frontend Attempts

Setup note: this file is the group-level log for FP16 reciprocal-sqrt/cube/cbrt family cases.
Detailed case work should still be recorded in each `exNNN/frontend_attempts.md`.

Current known runs:
- Baseline: `student/runs/fp16/ex220_ex239_semantic_20260604/`
- Latest curated seeds:
  `student/seeds/fp16/ex235_ex239_frontend_fp16_core_boundary_current_20260608_0946/`

Cases:
- `ex235`: `fp16_reciprocal_sqrt`, current best `direct_special_low8_hi6_synth_preset`, `1628/14/22792`, ratio `1.095769`.
- `ex236`: `fp16_cube`, current best `core_clamp_hi6_abc_g_aig`, `1432/15/21480`, ratio `1.242337`.
- `ex237`: `fp16_cbrt`, current best `direct_special_low10_hi6_synth_preset`, `1889/16/30224`, ratio `1.188050`.
- `ex238`: `fp16_reciprocal_cube`, current best `core_boundary_low12_hi6_synth_preset`, `1502/15/22530`, ratio `1.361412`.
- `ex239`: `fp16_reciprocal_cbrt`, current best `direct_special_low7_hi6_abc_g_aig`, `2026/16/32416`, ratio `1.248450`.

Group strategy:
- Preserve `ex236` targeted-exception learning: a single semantic exception may
  beat another broad template family.
- For cube/reciprocal-cube, test exponent arithmetic plus mantissa delta before
  full structural tables.
- For cbrt/reciprocal-cbrt, inspect exponent modulo behavior and sign symmetry,
  but measure whether modulo tables add too much decoder depth.

## 2026-06-08 Deep Run Notes

Run artifacts:
- Open structural pass:
  `student/runs/fp16/ex235_ex239_frontend_fp16_open_structures_20260608_0745/`
- ex235/ex237/ex239 hi/lo follow-up:
  `student/runs/fp16/ex235_ex237_ex239_frontend_fp16_open_followup_20260608_0820/`
- ex236/ex238 selected-bit wrappers:
  `student/runs/fp16/ex236_ex238_frontend_fp16_selected_wrapper_base_sign_fixed_20260608_0852/`
- ex238 targeted b10/b9 formula:
  `student/runs/fp16/ex238_frontend_fp16_b10b9_formula_expr_all_synthflows_20260608_1040/`
- Final curated seeds:
  `student/seeds/fp16/ex235_ex239_frontend_fp16_current_20260608_1055/`

Reusable lessons:
- `ex235`, `ex237`, and `ex239` benefit from exponent-classed open structures:
  exact special/boundary table, exponent parity or modulo class, shallow high-bit
  run trees, and nested mantissa low-bit LUT.  The best cut points are not the
  same across cases.
- `ex236` improved mostly from source rewrapping plus `synth_preset`; selected
  high-bit overrides for b9/b8/b11 made delay worse.
- `ex238` had the main a-ha: replacing only output bits b10/b9 with a shallow
  magnitude formula improves delay.  b11 overrides are harmful.  Adding b8 or
  b7 increases area without further delay reduction.
- For `ex238` b10/b9, the normal exponent groups share one mantissa
  segmentation; odd exponents toggle b10.  The hand-derived expression source
  beat the generated run-cover source, but still stops just above `1.5x`
  reference at ratio `1.501480`.

## 2026-06-08 Direct Semantic-Special Follow-Up

Run artifacts:
- Direct semantic-special source:
  `student/runs/fp16/ex235_ex237_ex239_frontend_fp16_direct_special_20260608_0924/`
- Full synthflow check on the direct-special source:
  `student/runs/fp16/ex235_ex237_ex239_frontend_fp16_direct_special_allflows_20260608_0926/`
- Direct-special high/low split grid:
  `student/runs/fp16/ex235_ex237_ex239_frontend_fp16_direct_special_specs_20260608_0929/`
- Curated seeds:
  `student/seeds/fp16/ex235_ex239_frontend_fp16_current_direct_special_20260608_0938/`

Reusable lessons:
- `ex235`, `ex237`, and `ex239` had one more useful structural simplification:
  replace the full special/boundary table with direct semantic guards in the
  same source, not as a wrapper around a prior seed.  This lets Yosys trim the
  inactive zero/inf/NaN path before AIG generation.
- The wrapper version only hinted at the opportunity.  Direct source improved
  all three target cases:
  `ex235` `1685/14/23590 -> 1628/14/22792`,
  `ex237` `1934/16/30944 -> 1889/16/30224`,
  and `ex239` `2049/16/32784 -> 2026/16/32416`.
- Flow behavior changed with the source rewrite: `ex235` and `ex237` now prefer
  `synth_preset`, while `ex239` still prefers `abc_g_aig`.
- For `ex239`, lowering the nested low field from low8 to low7 preserved delay
  16 and reduced area.  For `ex235` and `ex237`, the previous cut points remain
  best after the semantic-special rewrite.

## 2026-06-08 Core-Boundary Follow-Up

Run artifacts:
- Core formula plus boundary table pass:
  `student/runs/fp16/ex236_ex238_frontend_fp16_core_boundary_20260608_0938/`
- Focused boundary split grid:
  `student/runs/fp16/ex236_ex238_frontend_fp16_core_boundary_specs_20260608_0939/`
- Wide boundary split follow-up:
  `student/runs/fp16/ex236_ex238_frontend_fp16_core_boundary_wide_20260608_0940/`
- Synthflow check for the best source shapes:
  `student/runs/fp16/ex236_ex238_frontend_fp16_core_boundary_allflows_20260608_0942/`
- Curated seeds:
  `student/seeds/fp16/ex235_ex239_frontend_fp16_core_boundary_current_20260608_0946/`

Reusable lessons:
- `ex236` and `ex238` had another large semantic structure hidden behind the
  older pair/delta seeds: middle exponent groups can use the compact
  exponent-delta plus mantissa formula, while only the two rounding boundary
  exponent groups need local mantissa tables.  All other regions are direct
  zero/inf/NaN constants.
- This beats both the old selected-bit overlay and the broad formula source:
  `ex236` improved `1531/16/24496 -> 1480/15/22200`, and `ex238` improved
  `1553/16/24848 -> 1502/15/22530`.
- For `ex236`, the best boundary split is wide `low14_hi6` with `abc_g_aig`.
  Wider `low15_hi6` was exact but slightly worse (`1482/15/22230`).
- For `ex238`, the best boundary split is `low12_hi6` with `synth_preset`.
  Some wider splits reduced area, but delay rose to 16/17 and ADP lost.
- This is the main lesson to reuse: when a semantic arithmetic core is good but
  boundary rounding groups are irregular, isolate those boundary exponent
  groups instead of either using a full special table or overlaying selected
  output bits on a large base.
- A follow-up showed `ex236` can go one step further: its boundary tables are
  exactly the core formula plus shallow clamps (`exp10` underflow, one
  min-normal exception at mantissa `0x10a`, `exp20` overflow).  That improved
  `ex236` again to `1432/15/21480`.  The same clamp rewrite was exact for
  `ex238` but worse (`1461/17/24837`) because delay increased.

Directions excluded this follow-up:
- Full vector high-bit packing saved source-level comparator count but worsened
  ADP because mux packing increased delay.
- Broad synthflow neighbors (`default`, `no_internal_abc`, `abc_fast`,
  `abc_d20..24`, `extra_opt_share`, `late_flatten`, `gates`, `cmos2`) did not
  beat the final direct-special flow choices.
- Very wide low fields such as low11/low12 in this generator are not valid
  candidates under the current active-magnitude stitching and are excluded.

Directions excluded after the core-boundary pass:
- Repeating selected-bit b11/b8/b7 overlays for `ex238`; the core-boundary
  source dominated them.
- Full boundary `low15` tables; exact, but not better than `low14_hi6` for
  `ex236` or `low12_hi6` for `ex238`.
- Generic allflows around the core-boundary source; only the recorded
  `abc_g_aig` / `synth_preset` choices won on ADP.

Directions excluded this round:
- Repeating broad sign-exp-mant case tables for these five cases.
- Arithmetic exponent/delta formula for `ex236`/`ex238`; exact but worse after
  synthesis.
- Direct `out[15]=in[15]` sign override for `ex236`/`ex238`; zero/special
  handling makes it non-equivalent.
- `no_internal_abc`, `abc_fast`, `extra_opt_share`, `late_flatten`, and
  most non-AIG gate sets for the final seeds; they either reproduced the same
  result or worsened ADP.
