# ex238 FP16 Frontend Attempts

Function hypothesis: `fp16_reciprocal_cube`.

Current known best:
- Run: `student/seeds/fp16/ex235_ex239_frontend_fp16_core_boundary_current_20260608_0946/`
- Variant: `core_boundary_low12_hi6_synth_preset`
- QoR: `1502/15/22530`
- Reference ADP: `16549`
- Ratio: `1.361412`
- Classification: `semantic_core_boundary`

2026-06-08 attempts:
- Confirmed exact `fp16_reciprocal_cube` semantics under the FP16 assumptions.
- Current best starts from the old `exp_mant_pair_case` seed but replaces only
  output bits b10/b9 with a hand-derived shallow formula.
- Generated selected-bit wrapper found the first improvement:
  b10/b9 run-cover gave `1555/16/24880`; b10/b9/b8 was slightly worse
  (`1568/16/25088`), and b11 overrides were consistently harmful.
- Manual inspection found the useful structure: normal exponent groups share
  one mantissa segmentation, and odd exponents toggle b10.  Boundary groups
  exp9, exp19, and exp31 need separate rules.
- The factored expression source improved the wrapper to `1553/16/24848`.
  Case-style formula, bit-level predicate formula, active-only mux back to the
  base seed, b7 extension, b8 extension, b12/high-bit extension, and supported
  synthflow variants were all exact but worse.
- A direct `out[15]=in[15]` shortcut was non-equivalent because zero/special
  sign behavior is not that simple.
- Official `evaluate.py --case ex238` recheck OK at `1553/16/24848`.

2026-06-08 core-boundary follow-up:
- New semantic structure: core exponents exp10..exp18 use exact
  reciprocal-cube exponent-delta plus mantissa formula; boundary exponents
  exp9 and exp19 use local mantissa tables; exp<=8 maps to signed inf,
  exp>=20/inf maps to signed zero, and NaNs canonicalize.
- Best run:
  `student/runs/fp16/ex236_ex238_frontend_fp16_core_boundary_allflows_20260608_0942/`
  with `core_boundary_low12_hi6_synth_preset`, `1502/15/22530`.
- Improvement over the previous b10/b9 formula seed: ADP `24848 -> 22530`,
  delay `16 -> 15`, area `1553 -> 1502`.
- Boundary split sweep showed `low12_hi6` is the useful cut.  Wider `low15`
  reduced area in one variant (`1462`) but delay rose to 16, so ADP was worse.
- A core-clamp follow-up also matched the boundary behavior semantically:
  exp9 is the core formula after mantissa `0x259`, and exp19 is the core
  formula until mantissa `0x259`.  It was exact, but best ADP was
  `1461/17/24837`, so the local boundary table remains better.

Next maintenance items:
- This case is now within `1.5x` reference, but the real target remains
  reference ADP.
- The next plausible direction is to compress the exp9/exp19 boundary tables
  or derive a shallow exact rounding predicate for them.  Do not repeat
  b11/b8/b7 selected-bit expansions or generic synthflow sweeps.
