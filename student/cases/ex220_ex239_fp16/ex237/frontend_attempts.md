# ex237 FP16 Frontend Attempts

Function hypothesis: `fp16_cbrt`.

Current known best:
- Run: `student/seeds/fp16/ex235_ex239_frontend_fp16_current_direct_special_20260608_0938/`
- Variant: `direct_special_low10_hi6_synth_preset`
- QoR: `1889/16/30224`
- Reference ADP: `25440`
- Ratio: `1.188050`
- Classification: `semantic_direct_special_open`

2026-06-08 attempts:
- Confirmed `fp16_cbrt` sign symmetry and exponent modulo-3 grouping.  A naive
  Python half conversion showed a few rounding mismatches, so candidates were
  taken from the truth table and verified exactly instead of trusting the
  float model.
- Best source uses exact special/boundary table, sign pass-through, exponent
  modulo class, high-bit run trees, and low 10 output magnitude bits as a
  nested mantissa hi6 LUT.
- Follow-up cut points (`low8`, `low9`, hi4/hi6/hi7) were exact but did not
  beat `low10_hi6`.
- Full synthflow check showed `abc_g_aig` remains best; synth preset lowered
  area but raised delay.
- Official `evaluate.py --case ex237` recheck OK at `1934/16/30944`.
- Direct semantic-special rewrite replaced the full inactive special table with
  guards for exp0 signed zero, inf pass-through, and canonical NaN.  This
  shifted the best flow to `synth_preset` and improved the best to
  `1889/16/30224`, with official `evaluate.py` OK.
- Direct-special cut-point grid confirmed `low10_hi6` remains best.  Lower
  low-width options either increased delay or area; vector high-bit packing was
  exact but worse.

Next maintenance items:
- This case improved again through source-level special handling.  Further work
  should still target lower ADP toward reference, not just threshold status.
- Do not repeat hi7 or lower-width nested variants unless paired with a new
  semantic mantissa formula; they were exact but ADP-worse.
