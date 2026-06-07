# ex226 FP16 Frontend Attempts

Function hypothesis: `fp16_sin`.

Current known best:
- Run: `ex226_ex228_frontend_fp16_current_synthflow_fix_20260607_1228`
- Variant: `positive_default_exp_mant_case_abc_g_aig`
- QoR: `33356/22/733832`
- Reference ADP: `587790`
- Ratio: `1.248459`
- Classification: `synthflow_exact`

Next maintenance items:
- Verify true DAZ + sin(x) + FP16 RNE + FTZ + canonical NaN semantics.
- Check odd symmetry using positive-domain full-word output, not magnitude-only output.
- Identify exp=255 NaN behavior and periodic active exponent ranges.
- Record hi/lo mantissa split and sign-flip simplification attempts.

## 2026-06-07 Semantic Shell Attempt

- Diagnostics showed near odd symmetry: negative-domain sign-flip matches
  `31744/32768`, with exp=31 special values requiring canonical NaN handling.
- Generated `ex226_fp16_sin_odd_positive_table`, a NaN-aware odd
  positive-domain full table.
- Exact verification passed, but QoR was worse: `33507/25/837675` versus the
  then-current best `33460/23/769580`.
- Exclusion: full positive-domain shell increases delay.  Future attempts
  should not repeat this structure unless a selected-bit or field-level rewrite
  removes the critical path.

## 2026-06-07 Synthflow Follow-Up

- Re-emitted the existing verified `positive_default_exp_mant_case` Verilog
  with the fixed single Yosys `abc -g aig` path.
- Exact verification passed and official `evaluate.py --case ex226` reported
  `OK`, `33356/22/733832`.
- This lowers area `33460 -> 33356`, delay `23 -> 22`, and ADP
  `769580 -> 733832`.
- Interpretation: the source seed is still structural rather than fully
  formulaic semantic RTL, but its initial AIG mapping had a removable delay
  level.  Next useful work needs critical-bit/field-level decomposition, not
  another full positive table shell.
