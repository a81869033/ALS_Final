# ex200-ex219 BF16 Semantic Reconstruction Notes

Purpose: track case-by-case attempts to reconstruct real semantic RTL from
truth tables, senior hints, and prior non-best Verilog seeds.

This folder is for notes only.  Generated Verilog, AIGs, logs, manifests, and
CSV results must use the run layout from `student/docs/experiment_run_workflow.md`.

For the latest all-case BF16 status, read `CURRENT_PROGRESS.md` first.  The
current merged machine-readable rows live under
`student/runs/bf16/ex200_ex219_current/results/`.

## Senior Hints To Preserve

- BF16 input/output is a 16-bit word with sign, 8-bit exponent, and 7-bit mantissa.
- Use `student/frontends/truth.py` / ABC `read_truth -xf` indexing.  Do not assume raw truth indexing.
- Split `sign`, `exponent`, and `mantissa` first.
- Treat denormal input as zero when the truth table indicates DAZ behavior.
- Flush denormal output to zero when the truth table indicates FTZ behavior.
- Use RNE behavior: round to nearest even, including mantissa carry into exponent when applicable.
- Preserve canonical NaN behavior and handle `inf`, `zero`, negative inputs, and NaN before normal-domain arithmetic.
- BF16 mantissa has only 7 bits, so many normal-domain transforms should be representable by a 128-entry mantissa LUT.
- Prefer exponent arithmetic, exponent range guards, sign symmetry, saturation, passthrough, and small mantissa tables over direct truth-table factoring.
- For odd functions, try sign symmetry first.
- For reciprocal, sqrt, square, cube, cbrt, exp, log, sin, tan, sigmoid, and related functions, try a real semantic RTL hypothesis before structural tables.

Typical BF16 semantic RTL shape:

1. Split `sign`, `exponent`, and `mantissa`.
2. Classify exponent ranges and special values.
3. Use a 128-entry mantissa lookup table only where needed.
4. Apply rounding, including RNE tie handling and carry propagation.
5. Reassemble the BF16 output word.

## Current Class Strategy

The previous broad generators produced many exact candidates, but too many best
rows are still structural.  The next BF16 work should be:

1. Inspect each case truth facts: special values, sign rule, active exponent ranges, and normal-domain mantissa relation.
2. Read prior non-best Verilog only as evidence for grouping and corner cases.
3. Write one primary semantic hypothesis per case, plus at most one small alternative.
4. Generate Verilog only when the hypothesis explains the case behavior.
5. Keep a candidate only after exact truth/equivalence verification with `evaluate.py`.
6. Record failed hypotheses here so future runs do not repeat broad structural variants blindly.

## README Maintenance Rule

This README is a living class-level note.  After finishing any individual
BF16 case:

- Record case-specific attempts, failures, exact candidates, and QoR in that
  case's `frontend_attempts.md`.
- Promote any reusable BF16-class insight into this README, such as a shared
  rounding rule, exponent split, NaN/inf/zero convention, mantissa LUT pattern,
  Yosys-friendly RTL structure, or direction that should not be repeated.
- Keep this README focused on lessons useful across multiple BF16 cases; do not
  bury one-off case details here.

## Current BF16 Status Snapshot

This snapshot comes from `student/work/reverse_bf16_semantic_20260604_1522/bf16_best.csv`.

| Case | Hypothesis | Current best variant | Class | Ratio vs reference | Priority |
| --- | --- | --- | --- | --- | --- |
| ex200 | bf16_exp | sign_exp_mant_case | structural_exact | 1.591256 | high |
| ex201 | bf16_exp2 | exp_mant_pair_case | structural_exact | 1.471472 | medium |
| ex202 | bf16_exp10 | semantic_sign_exp_field_defaults | semantic_hybrid | 1.366556 | medium |
| ex203 | bf16_log | sign_exp_mant_case | structural_exact | 1.436890 | medium |
| ex204 | bf16_log2 | exp_mant_delta_pair | structural_exact | 1.990909 | high |
| ex205 | bf16_log10 | sign_exp_mant_case | structural_exact | 1.768757 | high |
| ex206 | bf16_sin | split_sign_exp_mant_case | structural_exact | 1.187892 | medium |
| ex207 | bf16_tan | exp_mant_pair_case | structural_exact | 1.235478 | medium |
| ex208 | bf16_sinh | split_sign_exp_mant_case | structural_exact | 1.351561 | medium |
| ex209 | bf16_tanh | sign_exp_default_expr_case | semantic_hybrid | 1.358607 | medium |
| ex210 | bf16_sigmoid | semantic_field_reassembly | semantic_hybrid | 1.399919 | medium |
| ex211 | bf16_reciprocal | semantic_positive_symmetry_fields | semantic_hybrid | 1.416199 | medium |
| ex212 | bf16_square | exp_mant_delta_pair | structural_exact | 1.518229 | high |
| ex213 | bf16_sqrt | semantic_arith_fields | semantic_exact | 1.515172 | medium |
| ex214 | bf16_reciprocal_square | default_expr_exception_case | semantic_hybrid | 1.574257 | high |
| ex215 | bf16_reciprocal_sqrt | sign_pair_case | structural_exact | 1.588889 | high |
| ex216 | bf16_cube | semantic_positive_symmetry_fields | semantic_hybrid | 1.822461 | high |
| ex217 | bf16_cbrt | positive_default_exp_mant_delta | structural_exact | 1.877960 | high |
| ex218 | bf16_reciprocal_cube | value_case | structural_exact | 2.155493 | high |
| ex219 | bf16_reciprocal_cbrt | exp_mant_delta_pair | structural_exact | 1.998404 | high |

## Category-Level Attempt Log

### 2026-06-05 Setup

- Created this BF16 notes folder under `student/cases/`, per experiment workflow.
- Decision: stop broad variant generation as the primary method.
- Decision: use previous structural candidates as reverse-engineering evidence only.
- Next useful work: start with high-priority cases whose current best is structural or far from reference, especially `ex204`, `ex205`, `ex216`, `ex217`, `ex218`, and `ex219`.

### 2026-06-05 ex200 BF16 exp

- `ex200` truth table exactly matches `DAZ + real exp + BF16 RNE + FTZ`.
- Useful BF16 exp RTL pattern: set default output to `1.0`, handle NaN/inf
  explicitly, keep only active exponent regions as 128-entry mantissa LUTs,
  and compress overflow/underflow saturation ranges with `casez`.
- This improved ex200 ADP from `63733` to `63189` after Yosys synthesis and
  official equivalence recheck.
- Bad class-level direction for exp-like cases: run-length mantissa comparison
  chains.  They are exact but produce poor Yosys delay; for ex200 the ADP was
  `204116`.
- Per-exponent `casez` run compression also performed poorly on ex200
  (`84660` ADP), so do not assume fewer source-level table entries will reduce
  synthesized area/delay.
- Sign-splitting positive and negative exponent decoders raised delay on ex200;
  the combined `sign_exp` decoder with semantic defaults is currently better.
- Bit-level mantissa deep dive for ex200 found that the active mantissa mapping
  is monotonic but not cheaply affine/additive.  Per-bit casez, base+delta, and
  run-compressed encodings all synthesized worse than direct active 128-entry
  mantissa cases.
- Hybrid low-variation compression and predecoded active LUTs also synthesized
  worse on ex200.  This suggests source-level entry-count reduction is not a
  reliable proxy for AIG area when it adds decoders, comparators, or mux depth.

### 2026-06-05 ex201-ex204 BF16 exp/log family

- Run: `ex201_ex204_frontend_bf16_semantic_20260605_0924`.
- Official `evaluate.py` recheck passed for all 24 equivalent candidates.
- True semantics identified:
  - `ex201`: `DAZ + 2^x + BF16 RNE + FTZ + canonical NaN`.
  - `ex202`: `DAZ + 10^x + BF16 RNE + FTZ + canonical NaN`.
  - `ex203`: `DAZ + ln(x) + BF16 RNE + FTZ + canonical NaN`.
  - `ex204`: `DAZ + log2(x) + BF16 RNE + FTZ + canonical NaN`.
- Current best seeds from this run:
  - `ex201`: `structural_exp_mant_pair_case`, `1599/15/23985`, ratio `1.471472`.
  - `ex202`: `semantic_sign_exp_field_defaults`, `3702/16/59232`, ratio `1.366556`.
  - `ex203`: `structural_sign_exp_mant_case`, `4546/18/81828`, ratio `1.436890`.
  - `ex204`: `structural_exp_mant_delta_pair`, `1679/18/30222`, ratio `1.990909`.
- Reusable lesson: mantissa run compression again synthesized poorly for
  `ex201`, `ex202`, and `ex203`.  Do not treat fewer Verilog table entries as
  an optimization unless it also preserves decoder depth.
- Reusable lesson: for `ex202`, field-level reassembly can reduce delay versus
  assigning the whole 16-bit word.  The direct word-mode defaults had the same
  ADP as a structural default-expression table and lost to field defaults.
- Reusable lesson: for log/log2, positive-domain-only semantic tables are exact
  and clarify NaN/inf/zero behavior, but they currently synthesize slower than
  the best full sign-exp tables.
- Reusable lesson: `ex204` has a real semantic split into integer exponent base
  plus mantissa correction.  Grouping sub-delta patterns reduces area
  (`1455` nodes best) but adds too much delay (`38` levels).  XOR-delta grouping
  avoids the adder and lowers delay to `24`, still worse than the old
  `exp_mant_delta_pair` at `18`.

### 2026-06-05 ex201-ex204 aggressive 50% target attempt

- Run: `ex201_ex204_frontend_aggressive_semantic_20260605_1139`.
- Target ADPs were `ex201 <=11992`, `ex202 <=29616`, `ex203 <=40914`,
  and `ex204 <=15111`.
- Official `evaluate.py` recheck passed for all 13 equivalent candidates.
- No frontend-only candidate improved the current best; the best rows only tied
  current best through `parallel_case/full_case` variants.
- Reusable lesson: skipping Yosys `abc -g AND` is uniformly worse for these
  four cases.
- Reusable lesson: `parallel_case/full_case` hints do not change the current
  best AIGs for these four cases.
- Reusable lesson: manual semantic fixed-point formulas are exact but usually
  create a long conversion path.  `ex204` Q18 was `1205/70/84350`; field-level
  versions improved delay to about `48-51` but still lost.  `ex203` Q22
  `ln(x)` was `3846/115/442290`.
- Reusable lesson: `ex201` integer/fraction `2^x` split reduced area by only 3
  nodes and raised delay, so the current exp/mant pair table remains better.
- Reusable lesson: `ex204` direct grouped XOR-delta reduced area from `1679`
  to `1677` but raised delay from `18` to `19`, so preserving the 18-level
  path matters more than small area reductions.

### 2026-06-05 ex201-ex204 bitlogic/frontend follow-up

- Run: `ex201_ex204_frontend_bitlogic_20260605_1412`.
- Consolidated recheck wrote 119 synthesized candidates to
  `student/runs/bf16/ex201_ex204_frontend_bitlogic_20260605_1412/results/candidates.csv`.
- Official `evaluate.py` recheck passed for all 110 equivalent candidates.
- No candidate improved the previous best for `ex201`-`ex204`.
  - `ex201`: best tied previous best at `1599/15/23985`.
  - `ex202`: best in this run was `3634/17/61778`, worse than previous
    `3702/16/59232`.
  - `ex203`: best tied previous best at `4546/18/81828`.
  - `ex204`: best tied previous best at `1679/18/30222`.
- Reusable lesson: shared multi-output BDD Verilog produced exact candidates
  with modest BDD node counts, but mux-tree delay made ADP worse for all four
  cases.
- Reusable lesson: low-unique mantissa run compression, whether encoded as
  `casez` patterns or fixed comparator runs, tends to add one or more delay
  levels on `ex201`/`ex202`; it can lower area but does not improve ADP.
- Reusable lesson: removing default arms from full-coverage cases does not
  change Yosys output for the existing best `ex201`, `ex203`, or `ex204`
  structures.
- Reusable lesson: `ex204` XOR-delta base choice is sensitive but mantissa
  zero remains best.  Sweeping base mantissas `1,2,4,8,16,32,64,96,127`
  all increased ADP.
- Reusable lesson: semantic fixed-point/formula RTL must be judged by the
  whole BF16 reassembly path.  The ex201 sign-exp integer/fraction formula was
  exact but worsened QoR to `1790/16/28640`.

### 2026-06-05 ex201-ex204 semantic deep follow-up

- Run: `ex201_ex204_frontend_semantic_deep_20260605_1525`.
- Consolidated 430 exact candidates and official `evaluate.py` best recheck
  passed for all four cases.
- New frontend bests:
  - `ex201`: `1595/15/23925`, improved from `23985`.
  - `ex202`: tied previous best at `3702/16/59232`.
  - `ex203`: `4496/18/80928`, improved from `81828`.
  - `ex204`: `1657/18/29826`, improved from `30222`.
- Reusable lesson: selected output-bit overrides can improve a stable table
  seed when they preserve the original critical-path level (`ex201`, `ex203`,
  `ex204`), but multi-bit combinations often do not compound.
- Reusable lesson: `ex202` is locally stable around shared `sign_exp`
  field-default reassembly.  Removing constant-looking sign assignments,
  regrouping constants, changing group defaults, and active range gating all
  lost the 16-level advantage or tied the current seed.
- Reusable lesson: exact semantic arithmetic can reduce raw area dramatically
  (`ex202` reached `2797` nodes), but multiplier/fraction/conversion paths are
  too deep as frontend-only seeds without backend optimization.

### 2026-06-05 ex201-ex204 semantic continue follow-up

- Run: `ex201_ex204_frontend_semantic_continue_20260605_1732`.
- Consolidated 234 exact candidates and official `evaluate.py` best recheck
  passed for all four cases.

### 2026-06-06 ex215-ex219 reciprocal/cube/cbrt family

- Run: `ex215_ex219_frontend_bf16_semantic_20260606_1447`.
- True semantics identified and exact semantic models verified over all 65536
  inputs:
  - `ex215`: `bf16_reciprocal_sqrt`.
  - `ex216`: `bf16_cube`.
  - `ex217`: `bf16_cbrt`.
  - `ex218`: `bf16_reciprocal_cube`.
  - `ex219`: `bf16_reciprocal_cbrt`.
- Official `evaluate.py` best recheck passed for all five best AIGs.
- Current best seeds:
  - `ex215`: `390/12/4680`, improved from `5005`, ratio `1.485714`.
  - `ex216`: `437/14/6118`, tied old best, ratio `1.822461`.
  - `ex217`: `591/14/8274`, improved from `10864`, ratio `1.430251`.
  - `ex218`: `458/15/6870`, improved from `6945`, ratio `2.132216`.
  - `ex219`: `630/15/9450`, improved from `11271`, ratio `1.675532`.
- Reusable lesson: semantic arithmetic RTL is useful for proving the function
  identity, but for cbrt/reciprocal-cbrt the source arithmetic path can be
  deeper than delta-pair structural seeds after Yosys.
- Reusable lesson: selected output-bit overrides can help once a stable delta
  or value-case base exists.  Single-bit overrides helped `ex215` bit9,
  `ex217` bit0, `ex218` bit4, and `ex219` bit6.  Multi-bit combinations usually
  added predicate/mux cost and regressed.
- Reusable lesson: do not broadly run `legacy_default_expr_exception_case` on
  active odd/cbrt-like BF16 functions.  It was catastrophic on this group and
  should only be tried when the truth facts show very small exception sets.
- Reusable lesson: `ex218` reciprocal-cube remains far from reference even
  after semantic identification.  The value-case base plus one selected-bit
  override is still better than current semantic arithmetic, delta, split-sign,
  and default-exception seeds.

### 2026-06-06 ex216/ex218/ex219 deep selected-bit follow-up

- Run: `ex216_ex218_ex219_frontend_bf16_deep_20260606_1600`.
- Official `evaluate.py` best recheck passed for all three cases.
- New frontend bests:
  - `ex216`: `420/14/5880`, improved from `6118`.
  - `ex218`: `467/13/6071`, improved from previous curated `6870`.
  - `ex219`: `623/15/9345`, improved from previous curated `9450`.
- Reusable lesson: hand guarded semantic RTL can confirm the real function and
  simplify source text, but it may synthesize deeper than selected-bit hybrids.
  This happened for cube, reciprocal-cube, and reciprocal-cbrt.
- Reusable lesson: comparator-coded selected bits are not uniformly good.
  Low mantissa bits often create long comparator chains, but high/critical bits
  can be valuable.  Useful examples: `ex216` bit14, `ex218` bit15, and `ex219`
  bit6.
- Reusable lesson: sequential mixed overrides can help when each extracted bit
  has a clear role.  `ex216` improved by combining bit14 comparator extraction
  with semantic sign extraction; broad multi-bit combinations still mostly
  regressed.

### 2026-06-06 ex215-ex219 deep2 critical-bit follow-up

- Run: `ex215_ex219_frontend_bf16_deep2_20260606_1726`.
- Official `evaluate.py` best recheck passed for all five cases.
- New or retained frontend bests:
  - `ex215`: `390/12/4680`, tied previous best.
  - `ex216`: `444/13/5772`, improved from `5880`.
  - `ex217`: `623/13/8099`, improved from `8274`.
  - `ex218`: `467/13/6071`, tied previous best.
  - `ex219`: `623/15/9345`, tied previous best.
- Reusable lesson: when a selected bit corresponds to a real field boundary,
  hand-derived predicate logic can beat learned predicates.  `ex216` bit14 is
  exactly `exp >= 128 || (exp == 127 && mant >= 34)`, which lowered delay.
- Reusable lesson: `exp % 3` single-bit tables for cbrt-family functions are
  exact but not automatically better.  They lost for `ex217` bit0 and `ex219`
  bit6 because the decoder/table cost outweighed semantic compactness.
- Reusable lesson: casez sign extraction can be exact, but comparator-coded
  selected sign bits may synthesize better; `ex218` kept the comparator bit15
  seed.
- New frontend bests:
  - `ex201`: `1647/14/23058`, improved from `23925`.
  - `ex202`: `3493/16/55888`, improved from `59232`.
  - `ex203`: `4617/17/78489`, improved from `80928`.
  - `ex204`: `1597/17/27149`, improved from `29826`.
- Reusable lesson: mantissa hi/lo splitting can be useful when it changes the
  synthesized critical path, not just source table size.  `ex202` benefited
  from `hi=3` field-mode; `ex203` benefited from `hi=3` word-mode.
- Reusable lesson: output-bit override can reduce delay, not only area.  This
  was decisive for `ex201` bit 3 and `ex204` bit 14.
- Reusable lesson: for `log2`, delta-pair remains the best semantic structure,
  but splitting the delta table by mantissa hi/lo can beat the flat delta table.
- Reusable failed direction: per-exponent mixed hi policies and multi-bit
  override combinations often lose the best delay balance even when their local
  source scores look smaller.
- Additional continuation improved `ex202` to `3478/16/55648` and `ex203` to
  `4544/17/77248` using separate field factoring plus a single critical-bit
  predicate.
- Reusable lesson: separate `out_sign`, `out_exp`, and `out_mant` tables can
  beat packed field reassembly when only one field needs an expensive bit
  override (`ex202`, `ex203`).
- Reusable failed direction: critical-bit BDD, comparator-threshold predicates,
  and whole-field bitplane splits generally raised delay or area.
- Reusable near miss: ex204 arithmetic-base log2 delta-pair reached
  `1529/18/27522`, but the extra arithmetic base logic could not beat the
  current `1597/17/27149` seed because delay stayed at 18.

### 2026-06-05 ex201-ex204 formula/PLA continuation

- Run: `ex201_ex204_frontend_semantic_continue_20260605_1732`.
- Consolidated 443 exact candidates and official `evaluate.py --case` recheck
  passed for the four current best AIGs.
- Current frontend bests:
  - `ex201`: `1647/14/23058`.
  - `ex202`: `3478/16/55648`.
  - `ex203`: `4544/17/77248`.
  - `ex204`: `1545/17/26265`, improved from `1597/17/27149`.
- Effective new direction: hand-derive selected output-bit formulas from
  semantic exp/mant boundary rules, then splice those bits into an already good
  seed.  This worked for `ex204` bits 11 and 14 on the arithmetic-base log2
  delta structure.
- Reusable lesson: formulas are only useful when they avoid a new comparator
  critical path.  For `ex202` and `ex203`, bit14 formulas were exact but did
  not beat the existing shallow hi/lo predicates.
- Reusable lesson: per-sign-exp mantissa PLA/cube covers can reduce source
  table irregularity and sometimes delay, but they often add too much area.
  `ex201` bit3 PLA was exact `1754/15/26310`, worse than the current
  `1647/14/23058`.
- Reusable failed direction: full-input casez run overrides for irregular bits
  are too large for Yosys and should not be repeated for `ex201` bit3.
- Reusable near miss: equality-style ex204 bit formulas reduced raw area as low
  as `1528`, but kept delay at 18, so they lost to the `1545/17` formula seed.

### 2026-06-05 ex201-ex204 curation cleanup

- Active run `ex201_ex204_frontend_semantic_continue_20260605_1732` was reduced
  from 443 candidates to 17 curated frontend seeds.
- Non-curated Verilog/AIG/logs and earlier superseded ex201-ex204 work dirs
  were moved to
  `student/archive/cleanup_20260605/ex201_ex204_curated_cleanup_20260605_2315/`.
- Active `candidates.csv`, `best.csv`, and `summary.csv` now describe only the
  curated seed set.  Full history remains available under the archive cleanup
  manifest.

### 2026-06-06 ex205-ex209 trig/hyperbolic/log10 follow-up

- Run: `ex205_ex209_frontend_bf16_semantic_20260606_0946`.
- Official `evaluate.py --case` best recheck passed for all five cases.
- True semantics identified:
  - `ex205`: `DAZ + log10(x) + BF16 RNE + FTZ + canonical NaN`.
  - `ex206`: `DAZ + sin(x) + BF16 RNE + FTZ + canonical NaN`.
  - `ex207`: `DAZ + tan(x) + BF16 RNE + FTZ + canonical NaN`.
  - `ex208`: `DAZ + sinh(x) + BF16 RNE + FTZ + canonical NaN`.
  - `ex209`: `DAZ + tanh(x) + BF16 RNE + FTZ + canonical NaN`.
- Current frontend bests:
  - `ex205`: `4463/17/75871`, improved from `83358`.
  - `ex206`: `26872/21/564312`, improved from `640332`.
  - `ex207`: `29873/21/627333`, improved from `775654` and slightly beat the reference `627817`.
  - `ex208`: `2167/15/32505`, improved from `33120`.
  - `ex209`: `756/13/9828`, improved from `9945`.
- Reusable lesson: for odd periodic functions, do not reduce the positive
  output to `{input_sign, magnitude}`.  `sin` and `tan` can be negative for
  positive inputs, so the useful odd form is a positive-domain full-word table
  plus output sign XOR, with canonical NaN excluded from the XOR.
- Reusable lesson: positive-domain full-word odd symmetry can be the best seed
  when the odd function is periodic.  The best `sin` used positive-domain
  full-word `hi=4`; the best `tan` used positive-domain full-word `hi=4`
  with sign flip simplified to `sign & (exp != 8'hff)`.
- Reusable lesson: saturation/default functions benefit from direct constant
  sign-exp groups.  For `sinh`, rewriting input-default exceptions so full
  constant sign-exp ranges emit one constant case improved `33120` to `32505`.
- Reusable lesson: range-compressing full-default sign-exp groups can help
  small saturation functions.  For `tanh`, it improved the legacy
  sign-exp-default expression from `9945` to `9828`.
- Reusable failed direction: hand-derived sign formulas were exact for
  `log10`, `sinh`, and `tanh`, but the added comparisons often increased
  delay enough to lose to shallow table predicates.
- Reusable failed direction: full-output BDD and bitplane encodings did not
  close the `log10` gap.  `ex205` BDD order `exp` was `4688/23/107824`, and
  order `sem` was `4332/23/99636`; both lost to `4463/17/75871`.
- Reusable failed direction: ex205 positive-domain monotone range encoding was
  exact but synthesized poorly.  Full-word range `casez` was
  `13255/23/304865`; balanced range tree was `12327/30/369810`; linear
  comparator chain timed out in Yosys.
- Curation: active work now retains 22 high-value seeds; low-value
  intermediates were moved to
  `student/archive/cleanup_20260606/ex205_ex209_frontend_bf16_semantic_20260606_0946_low_value_intermediates/`.

### 2026-06-06 ex210-ex214 sigmoid/reciprocal/square/sqrt follow-up

- Run: `ex210_ex214_frontend_bf16_semantic_20260606_1315`.
- Official `evaluate.py --case` best recheck passed for all five cases.
- True semantics identified:
  - `ex210`: `DAZ + sigmoid(x) + BF16 RNE + FTZ + canonical NaN`.
  - `ex211`: `DAZ + 1/x + BF16 RNE + FTZ + canonical NaN`.
  - `ex212`: `DAZ + x*x + BF16 RNE + FTZ + canonical NaN`.
  - `ex213`: `DAZ + sqrt(x) + BF16 RNE + FTZ + canonical NaN`.
  - `ex214`: `DAZ + 1/(x*x) + BF16 RNE + FTZ + canonical NaN`.
- Current frontend bests:
  - `ex210`: `2232/15/33480`, improved from `37872`.
  - `ex211`: `273/11/3003`, improved from `3025`.
  - `ex212`: `281/11/3091`, improved from `3498`.
  - `ex213`: `346/11/3806`, improved from `4394`.
  - `ex214`: `337/11/3707`, improved from `3816`.
- Reusable lesson: sigmoid benefited from a saturation-default source form.
  Using `1.0` as the default with local exception LUTs lowered delay versus
  semantic field reassembly.
- Reusable lesson: reciprocal can be expressed compactly as explicit special
  cases plus a 128-entry mantissa LUT and sign/magnitude output mux.  This beat
  the previous positive-symmetry field seed by a small margin.
- Reusable lesson: for square, the best frontend seed was a delta/base hi-lo
  structure, not direct arithmetic.  Mantissa hi split `h4` preserved the
  11-level path while reducing area, and constant sign-bit override saved one
  more node.
- Reusable lesson: selected-bit overrides can be useful when they reduce delay,
  not just area.  `ex213` bit1 and `ex214` bit13 reduced delay from 12/13 to 11.
- Reusable failed direction: direct semantic arithmetic for reciprocal-square
  was exact but too deep (`368/19/6992`), and sign-insensitive positive-domain
  full-word tables were much larger than default/exception or delta structures.
- Curation: active work retains 25 high-value seeds; full 226-row history and
  low-value intermediates were archived under
  `student/archive/cleanup_20260606/ex210_ex214_frontend_bf16_semantic_20260606_1315_low_value_intermediates/`.
