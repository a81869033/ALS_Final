# ex235 FP16 Frontend Attempts

Function hypothesis: `fp16_reciprocal_sqrt`.

Current known best:
- Run: `student/seeds/fp16/ex235_ex239_frontend_fp16_current_direct_special_20260608_0938/`
- Variant: `direct_special_low8_hi6_synth_preset`
- QoR: `1628/14/22792`
- Reference ADP: `20800`
- Ratio: `1.095769`
- Classification: `semantic_direct_special_open`

2026-06-08 attempts:
- Confirmed `fp16_reciprocal_sqrt` semantics with DAZ/FTZ/RNE/canonical NaN
  behavior.
- Diagnosis showed positive normal mantissa arrays split by exponent parity.
- Best source uses exact special/boundary table, exponent parity class, high
  output bits as shallow run trees, and low 8 output magnitude bits as a
  nested mantissa hi6/lo4 LUT.
- Neighbor cut points tested: `low8/hi4`, `low8/hi7`, `low9`, and `low10`.
  `low8_hi6` was best; hi7 increased area and low9/low10 did not improve ADP.
- Official `evaluate.py --case ex235` recheck OK at `1685/14/23590`.
- Direct semantic-special rewrite replaced the full inactive special table with
  guards for exp0 signed inf, +inf zero, and other inactive canonical NaN.  This
  direct source, unlike the wrapper version, improved the best to
  `1628/14/22792` with official `evaluate.py` OK.
- A full synthflow check showed `synth_preset` is now best for this source;
  `abc_g_aig` stayed at delay 14 but higher area (`1679/14/23506`).
- Direct-special cut-point grid confirmed `low8_hi6` remains best.  Lower
  low-width options lost on delay, and wider low fields did not improve ADP.

Next maintenance items:
- This case is now close to reference for this batch, but the goal remains to
  reduce ADP further, not merely satisfy a ratio threshold.
- Future work should not repeat broad table variants; only revisit if a
  smaller closed-form reciprocal-sqrt mantissa transform is derived.
