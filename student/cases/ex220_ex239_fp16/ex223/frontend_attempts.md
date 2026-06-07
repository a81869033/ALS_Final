# ex223 FP16 Frontend Attempts

Function hypothesis: `fp16_log`.

Current known best:
- Run: `ex223_ex224_frontend_yosys_synthflow_20260607_0910`
- Verilog seed: `casez_sign` from `ex223_ex224_frontend_fp16_bitlogic3_20260606_2344`
- Synthesis flow: Yosys internal `abc -g aig`
- QoR: `11148/21/234108`
- Reference ADP: `120549`
- Ratio: `1.942015`
- Classification: `synthflow_exact`

Next maintenance items:
- High priority: current ADP is far above reference.
- Verify true DAZ + ln(x) + FP16 RNE + FTZ + canonical NaN semantics.
- Derive exponent-base plus mantissa-correction RTL before using structural cases.
- Record negative/zero/inf/NaN behavior and any selected-bit boundary formulas.

## 2026-06-06 Targeted Run

Run: `ex220_ex224_frontend_fp16_semantic_20260606_2050`

Truth/semantic facts:
- Function hypothesis remains FP16 natural `log`.
- Zero and denormal inputs map to `-inf`; negative nonzero inputs map to
  canonical NaN; positive `+inf` maps to `+inf`; NaN maps to canonical NaN.
- Positive normal exponent groups are the only groups that need mantissa
  kernel lookup.

Verified candidates tried:
- `sign_exp_mant_case`: `11164/23/256772`, best.
- `positive_default_exp_mant_case`: `11164/24/267936`.
- `exp_mant_pair_case`: `11174/24/268176`.
- `log_mant0_fastpath`: `11480/24/275520`.
- `split_sign_exp_mant_case`: `12159/23/279650`.
- `log_special_shell`: `12162/23/279725`.
- `log_positive_field_split`: `12159/23/279675`.
- `semantic_exp_delta_fields`: `12713/23/292396`.
- `log_positive_base_delta`: `12726/23/292708`.
- `log_limited_run_range`: much worse, `1728036` ADP.

Conclusion:
- Hand-written semantic shells were exact but did not beat the direct
  sign-exp-mant source.  Continue to prioritize a real exponent-base plus
  shared mantissa-correction arithmetic model; do not expand range-comparator
  compression without a balancing rewrite.

## 2026-06-06 Deep Follow-Up

Runs:
- `ex223_ex224_frontend_fp16_log_deep_20260606_2209`
- `ex223_ex224_frontend_fp16_log_deep2_20260606_2224`
- `ex223_ex224_frontend_fp16_log_selected_20260606_2236`
- `ex223_ex224_frontend_fp16_log_ranges_20260606_2256`
- `ex223_ex224_frontend_fp16_log_signsplit_20260606_2305`
- `ex223_ex224_frontend_fp16_log_caseattrs_20260606_2312`
- `ex223_ex224_frontend_fp16_log_casez_20260606_2319`

Combined result:
- 57 exact equivalent candidates for `ex223` across these follow-up directions.
- Best remains `sign_exp_mant_case` / `sign_exp_mant_attr_*`, `11164/23/256772`.
- Closest new candidate: `hybrid_semantic_bit15`, `11258/23/258934`.

Directions tried and excluded:
- Fixed-point semantic model: confirmed real structure `ln(x) = (exp-15)*ln2 + ln(1.mant)`, but best ADP was `346178` because delay reached `79`.
- Bucketed constant-output-exponent rewrite: exact but duplicated q-LUT and local tables; best ADP `466560`.
- Selected-bit hybrid: exact; replacing only sign bit was close, but all exponent/mantissa bit replacements carried too much arithmetic depth.
- Balanced range tree: fixed the previous linear-chain delay issue, but best ADP `312234` still lost to direct table.
- Sign-known abs rewrite: exact but did not reduce the true bottleneck.
- `parallel_case/full_case` attributes: no QoR change.
- `casez` interval cubes: fewer source entries than full table, but worse AIG after Yosys; best ADP `344775`.

Current conclusion:
- The semantic fixed-point structure is real, but source-level arithmetic forms
  are too deep under the current Yosys-to-AIG flow.
- The current best table likely benefits from bit-level sharing that these
  semantic rewrites break.  A future attempt should target per-output-bit PLA
  minimization or a custom shallow prefix/normalizer, not another table
  rearrangement.

## 2026-06-06/07 Bit-Level Follow-Up

Runs:
- `ex223_ex224_frontend_fp16_bitlogic3_20260606_2344`
- `ex223_ex224_frontend_fp16_bitlogic4_20260606_2354`

New best:
- `casez_sign`: `11189/22/246158`, official `evaluate.py` recheck OK.
- Improvement over old `sign_exp_mant_case`: `256772 -> 246158`, `10614`
  ADP lower, about `4.13%`.

What changed:
- Per-output-bit run statistics showed the output sign bit has a very small
  sign/exponent-only cover.
- Replacing only output bit15 with a hand `casez` interval cover lowered the
  critical delay from `23` to `22`.
- The exact sign rule is shared with `log2`: output sign is `1` for
  zero/denormal inputs and for positive inputs with exponent `< 15`; otherwise
  it is `0`.

Directions tried and excluded:
- Comparator/boolean sign formulas verified exact but synthesized worse than
  the `casez` interval cover.
- Single-bit replacements for bit14 through bit8 mostly increased ADP; bit14
  alone improved relative to the old table but did not beat `casez_sign`.
- Combining `casez_sign` with bit14, bit12, bit11, bit9, or multi-bit covers
  increased delay back to `23` or raised area enough to lose ADP.

Current conclusion:
- For `ex223`, the useful frontend-only simplification is very local: keep the
  direct sign-exp-mant table for bits14:0 and override only output sign with
  the shallow `casez` sign/exponent cover.

## 2026-06-07 Deeper Structural Follow-Up

Run:
- `ex223_ex224_frontend_fp16_bitvec_20260607_0050`
- `ex223_ex224_frontend_fp16_masked_run_20260607_0813`

Hypothesis:
- The previous best might still duplicate sign/exp decode between selected
  high-bit modules.  A joint vector-bit cover could share decode and mantissa
  range boundaries for sign plus nearby exponent bits.

Verified candidates:
- `bitvec_bits11_12_t32`: `11185/23/257255`.
- `bitvec_sign_bit14_t16`: `11253/23/258819`.
- `bitvec_sign_bits11_12_t32`: `11263/24/270312`.
- `masked_table_casez_sign`: `11261/23/259003`.
- `masked_run_casez_sign`: `19264/30/577920`.

Conclusion:
- Joint vector-bit covers are exact but worse.  Combining output sign with
  bit14 or bits11/12 creates a more complex boundary set and increases delay,
  so the current best remains the single `casez_sign` override.
- Additional semantic sharing for natural log was rechecked analytically:
  unlike `log2`, exponent bands do not have exact shared mantissa-delta
  clusters.  Many positive/negative correction pairs differ by one ULP, but
  making them exact would require patch logic plus arithmetic, matching the
  already-excluded fixed-point semantic direction that had excessive delay.
- Explicit masked table output did not improve `ex223`; balanced run-tree
  encoding of the remaining table bits was much worse.  This confirms the
  single sign override is still the best known frontend-only source structure.

## 2026-06-07 Current-Best Stress Follow-Up

Runs:
- `ex223_frontend_fp16_manualbit_20260607_0850`
- `ex223_ex224_frontend_fp16_hybrid_attrs_20260607_0915`
- `ex223_ex224_frontend_fp16_specialshell_current_20260607_0925`

Hypotheses:
- Output bit14 has only two dynamic sign/exponent groups and might be cheaper
  as a hand-written threshold formula than inside the table.
- `parallel_case/full_case` attributes might help the current `casez_sign`
  hybrid.
- A semantic special-case shell might reduce table cost by removing negative
  and exceptional constant groups.

Verified candidates:
- `manual_ex223_sign_bit14`: `11191/23/257393`.
- `attr_casez_sign`: `11189/22/246158`.
- `special_casez_sign`: `11193/25/279825`.

Conclusion:
- Hand bit14 logic was exact, with rule:
  negative inputs are `1`; positive `exp<=11` or `exp>=18` are `1`;
  `exp=12` uses `mant<=85`; `exp=17` uses `mant>=867`; otherwise `0`.
  It still raised delay to `23`, so bit14 should remain in the table.
- Attributes do not change the current best QoR.
- Special-shell positive-normal tables are much worse, confirming that the
  current full sign-exp table shares logic across special and normal groups in
  a way Yosys can exploit.
- The current best remains `casez_sign`, `11189/22/246158`.

## 2026-06-07 Yosys Synthflow Follow-Up

Run:
- `ex223_ex224_frontend_yosys_synthflow_20260607_0910`

Hypothesis:
- The current `casez_sign` Verilog seed may be good, but the fixed Yosys
  synthesis script might not be the best way to map it into an AIG.

Verified candidates:
- Previous flow recheck (`abc -g AND`): `11189/22/246158`.
- `abc_g_aig`: `11148/21/234108`, official `evaluate.py` OK.
- `synth_preset`: `10990/23/252770`.
- `no_internal_abc`: `15406/26/400556`.
- `abc_fast`: `14965/26/389090`.

Conclusion:
- New current synthflow best is `abc_g_aig`, `11148/21/234108`.
- Improvement over previous best: `246158 -> 234108`, `12050` ADP lower.
- The useful knob is changing Yosys internal ABC from `abc -g AND` to
  `abc -g aig` before `aigmap`; delay-target `-D` values did not change QoR.
- Follow-up `abc -g aig -D 18/19/20/21` reproduced the same `11148/21/234108`
  result; `gates` and `cmos2` aliases were worse.
