# ex228 FP16 Frontend Attempts

Function hypothesis: `fp16_sinh`.

Current known best:
- Run: `ex226_ex228_frontend_fp16_current_synthflow_fix_20260607_1228`
- Variant: `semantic_sign_exp_field_defaults_abc_g_aig`
- QoR: `6627/20/132540`
- Reference ADP: `101205`
- Ratio: `1.309619`
- Classification: `synthflow_exact`

Next maintenance items:
- Verify true DAZ + sinh(x) + FP16 RNE + FTZ + canonical NaN semantics.
- Preserve sign symmetry and large-exponent saturation behavior.
- Try constant/default ranges before local mantissa LUTs.
- Record whether field defaults or full-word defaults synthesize better.

## 2026-06-07 Semantic Shell Attempt

- Diagnostics showed `exp >= 19` positive-domain saturation to `+inf`, with
  odd sign symmetry except NaN handling.
- Generated `ex228_fp16_sinh_odd_sinh_saturation_shell`.
- Exact verification passed and synthesized to `6653/21/139713`, tying the
  existing best.
- Interpretation: the saturation shell is semantically clearer but does not
  improve ADP.  Further improvement needs source rewrite inside the active
  `exp <= 18` transition table.

## 2026-06-07 Synthflow Follow-Up

- Re-emitted the existing verified `semantic_sign_exp_field_defaults` Verilog
  with the fixed single Yosys `abc -g aig` path.
- Exact verification passed and official `evaluate.py --case ex228` reported
  `OK`, `6627/20/132540`.
- This lowers area `6653 -> 6627`, delay `21 -> 20`, and ADP
  `139713 -> 132540`.
- Interpretation: the semantic sign/exp default seed remains the right source
  basis; any further source improvement should focus on the `exp <= 18`
  transition region rather than high-exponent saturation.
