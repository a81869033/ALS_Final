# ex229 FP16 Frontend Attempts

Function hypothesis: `fp16_tanh`.

Current known best:
- Run: `ex225_ex229_frontend_fp16_current_synthflow_fix_20260607_1223`
- Variant: `semantic_positive_field_defaults_abc_g_aig`
- QoR: `3971/19/75449`
- Reference ADP: `57968`
- Ratio: `1.301563`
- Classification: `synthflow_exact`

Next maintenance items:
- Verify true DAZ + tanh(x) + FP16 RNE + FTZ + canonical NaN semantics.
- Look for signed 1.0 saturation/default ranges and small transition LUTs.
- Try sign-exp default expression compression.
- Record low-area high-delay tradeoffs separately from ADP improvements.

## 2026-06-07 Semantic Shell Improvement

- Diagnostics showed `exp >= 18` positive-domain saturation to `+1.0`; negative
  side is sign-flipped except canonical NaN.
- Generated `ex229_fp16_tanh_odd_tanh_saturation_shell`.
- Exact verification passed and official `evaluate.py --case ex229` reported
  `OK`, `4015/20/80300`.
- The broader semantic pass also produced
  `ex229_fp16_tanh_semantic_positive_field_defaults`, official `evaluate.py`
  OK at `3996/20/79920`.  This was later superseded by the same semantic
  source re-emitted with `abc_g_aig`.
- This improves the previous `3988/21/83748`: area increases by 8, delay drops
  from 21 to 20, ADP improves by 3828.
- Curated seed bundle:
  `student/seeds/fp16/ex225_ex229_frontend_fp16_bitrun_shells_current/`.

## 2026-06-07 Synthflow Follow-Up

- Re-emitted the existing verified `semantic_positive_field_defaults` Verilog
  with the fixed single Yosys `abc -g aig` path.
- Exact verification passed and official `evaluate.py --case ex229` reported
  `OK`, `3971/19/75449`.
- This lowers area `3996 -> 3971`, delay `20 -> 19`, and ADP
  `79920 -> 75449`.
- Current best seed is now the same semantic source plus the `abc_g_aig` AIG.

## 2026-06-14 fp16-extra-r2 campaign shard

- Campaign: `ex204_ex299_frontend_continuation_20260614_1216`, agent `fp16-extra-r2`.
- Method signatures:
  - `ex229|fp16_tanh_odd_transition_shell|positive_exp_nested_low9_hi6|shared positive exp decode, high output run trees, and sign xor symmetry|yosys_abc_g_aig|abc_xf_official_evaluate|odd_positive_low9_hi6`
  - `ex229|fp16_tanh_odd_transition_shell|positive_exp_nested_low10_hi6|shared positive exp decode, high output run trees, and sign xor symmetry|yosys_abc_g_aig|abc_xf_official_evaluate|odd_positive_low10_hi6`
  - `ex229|fp16_tanh_odd_transition_shell|positive_exp_wordmode_mh5|shared positive exp decode, per mant_hi residual defaults, and sign xor symmetry|yosys_abc_g_aig|abc_xf_official_evaluate|odd_positive_wordmode_mant_hi5`
- Official `evaluate.py` OK candidates:
  - `ex229_odd_nested_low9_hi6_abc_g_aig`: `3957/16/63312`, best in this shard.
  - `ex229_odd_nested_low10_hi6_abc_g_aig`: `3919/17/66623`, lower area but slower.
  - `ex229_odd_wordmode_mh5_abc_g_aig`: `3776/18/67968`, lowest area but delay cost loses ADP.
- Artifacts:
  - `student/work/ex204_ex299_frontend_continuation_20260614_1216/fp16-extra-r2/ex229/`
  - `student/runs/fp16/ex204_ex299_frontend_continuation_20260614_1216/fp16-extra-r2/ex229/official_eval/`
- Outcome: new frontend reduction versus the campaign target `83748 -> 63312`, and also below the prior `75449` frontend seed.  Splitting output bit9 is useful; word-mode residuals should not be repeated unchanged.
