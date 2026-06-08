# ex239 FP16 Frontend Attempts

Function hypothesis: `fp16_reciprocal_cbrt`.

Current known best:
- Run: `student/seeds/fp16/ex235_ex239_frontend_fp16_current_direct_special_20260608_0938/`
- Variant: `direct_special_low7_hi6_abc_g_aig`
- QoR: `2026/16/32416`
- Reference ADP: `25965`
- Ratio: `1.248450`
- Classification: `semantic_direct_special_open`

2026-06-08 attempts:
- Confirmed exact `fp16_reciprocal_cbrt` semantics and sign symmetry.
- Diagnosis showed exponent modulo-3 grouping.  Best source uses exact
  special/boundary table, sign pass-through, modulo class, high-bit run trees,
  and low 8 output magnitude bits as a nested mantissa hi6 LUT.
- Follow-up showed `low8_hi6` improves over prior `low9_hi5`; adding low9/low10
  or hi7 increases ADP.
- Full synthflow check showed `abc_g_aig` remains best.  `synth_preset` lowered
  area but raised delay; share/default/noabc paths were worse.
- Official `evaluate.py --case ex239` recheck OK at `2049/16/32784`.
- Semantic-shell wrapper first showed the special path was still expensive,
  improving to `2038/16/32608`.
- Direct semantic-special source then replaced the full inactive special table
  with guards for exp0 signed inf, inf signed zero, and canonical NaN.  This
  improved `low8_hi6` to `2032/16/32512`.
- Direct-special cut-point grid found `low7_hi6_abc_g_aig`, which keeps delay
  16 and lowers area to 2026.  Official `evaluate.py` recheck is OK at
  `2026/16/32416`.

Next maintenance items:
- This case improved through both direct semantic-special handling and one
  cut-point adjustment.  Further work should still chase reference ADP, not
  stop at ratio status.
- Future work should focus on a true reciprocal-cbrt mantissa formula if needed;
  the current nested LUT/source-shape neighborhood was exhausted this round.
