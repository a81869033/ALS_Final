# ex227 FP16 Frontend Attempts

Function hypothesis: `fp16_tan`.

Current known best:
- Run: `ex226_ex228_frontend_fp16_current_synthflow_fix_20260607_1228`
- Variant: `positive_default_exp_mant_case_abc_g_aig`
- QoR: `40629/22/893838`
- Reference ADP: `721639`
- Ratio: `1.238622`
- Classification: `synthflow_exact`

Next maintenance items:
- Verify true DAZ + tan(x) + FP16 RNE + FTZ + canonical NaN semantics.
- Try positive-domain full-word odd symmetry and exp=255 sign-flip exclusions.
- Inspect transition regions where periodic positive inputs produce negative outputs.
- Record whether h4/h5/h6 mantissa grouping changes critical path.

## 2026-06-07 Semantic Shell Attempt

- Diagnostics showed near odd symmetry: negative-domain sign-flip matches
  `31744/32768`, with exp=31 special values requiring canonical NaN handling.
- Generated `ex227_fp16_tan_odd_positive_table`, a NaN-aware odd
  positive-domain full table.
- Exact verification passed, but QoR was worse: `40882/24/981168` versus the
  then-current best `40817/23/938791`.
- Exclusion: full positive-domain shell raises delay.  Next useful direction
  is critical-bit/field-level decomposition of the existing positive table, not
  another whole-table odd shell.

## 2026-06-07 Synthflow Follow-Up

- Re-emitted the existing verified `positive_default_exp_mant_case` Verilog
  with the fixed single Yosys `abc -g aig` path.
- Exact verification passed and official `evaluate.py --case ex227` reported
  `OK`, `40629/22/893838`.
- This lowers area `40817 -> 40629`, delay `23 -> 22`, and ADP
  `938791 -> 893838`.
- Interpretation: source-level positive-domain odd shells were worse, but the
  existing structural seed still benefited from a shallower initial AIG.
