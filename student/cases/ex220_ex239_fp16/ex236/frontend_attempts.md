# ex236 FP16 Frontend Attempts

Function hypothesis: `fp16_cube`.

Current known best:
- Run: `student/seeds/fp16/ex235_ex239_frontend_fp16_core_boundary_current_20260608_0946/`
- Variant: `core_clamp_hi6_abc_g_aig`
- QoR: `1432/15/21480`
- Reference ADP: `17290`
- Ratio: `1.242337`
- Classification: `semantic_core_clamp`

2026-06-08 attempts:
- Confirmed exact `fp16_cube` semantics under the FP16 assumptions.
- Current best source is a wrapper around the previous base/delta seed.  It
  keeps the base exact sign bit and reconnects output bits explicitly, then
  uses Yosys `synth_preset` to get the best AIG.
- `abc_g_aig` on the wrapper gave `1559/17/26503`; `synth_preset` improved it
  to `1531/16/24496`.
- Selected-bit overrides for b9, b8, b11, and combinations were exact but
  worsened delay or ADP.  b10 alone reproduced wrapper-only QoR.
- A direct `out[15]=in[15]` shortcut was non-equivalent because zero/special
  sign behavior is not that simple.
- Exponent arithmetic plus mantissa-delta formula candidates were exact but
  worse; the arithmetic/delta logic dominated after synthesis.
- Official `evaluate.py --case ex236` recheck OK at `1531/16/24496`.

2026-06-08 core-boundary follow-up:
- New semantic structure: middle exponent groups use exact cube
  exponent-delta plus mantissa formula; only boundary exponent groups exp10 and
  exp20 use local mantissa tables; all other regions are direct signed
  zero/inf or canonical NaN constants.
- Best run:
  `student/runs/fp16/ex236_ex238_frontend_fp16_core_boundary_allflows_20260608_0942/`
  with `core_boundary_low14_hi6_abc_g_aig`, `1480/15/22200`.
- Improvement over the previous curated seed: ADP `24496 -> 22200`, delay
  `16 -> 15`, area `1531 -> 1480`.
- Tested nearby boundary splits (`low8` through `low15`) and allflow neighbors.
  `low15_hi6` was close but worse (`1482/15/22230`); non-AIG/default flows
  either raised delay or area.

2026-06-08 core-clamp follow-up:
- Boundary truth inspection showed exp10/exp20 do not need local tables:
  exp10 is the core formula except mantissa `0x001..0x109` flushes to zero and
  mantissa `0x10a` rounds to min-normal; exp20 is the core formula until
  mantissa `0x10b`, then overflows to inf.
- Best run:
  `student/runs/fp16/ex236_ex238_frontend_fp16_core_clamp_allflows_20260608_0953/`
  with `core_clamp_hi6_abc_g_aig`, `1432/15/21480`.
- Improvement over the core-boundary seed: ADP `22200 -> 21480`, area
  `1480 -> 1432`, same delay `15`.

Next maintenance items:
- This case is within `1.5x` reference, but that is only a status marker.
- Further improvement likely needs a shallower expression for the boundary
  clamp predicates or a way to reduce the core mantissa LUT without increasing
  delay.
