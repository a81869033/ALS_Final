# ex204 BF16 Frontend Attempts

Hypothesis: `bf16_log2`

Current best snapshot:
- variant: `exp_mant_delta_pair`
- class: `structural_exact`
- ADP/reference ratio: `1.990909`

Semantic direction:
- High priority: structural best is far from reference.
- Negative normal inputs should be canonical NaN; positive zero likely maps to negative infinity.
- Try semantic `log2(x) = exponent_offset + log2(1.mant)` with signed exponent arithmetic and a 128-entry mantissa LUT.
- Look for passthrough/simple integer-output regions around powers of two.

Attempt log:
- 2026-06-05: Created tracking note.  Next attempt should be a hand-guided BF16 log2 semantic RTL, not more delta-pair factoring.
- 2026-06-05: Run `ex201_ex204_frontend_bf16_semantic_20260605_0924` proved the truth table exactly matches `DAZ + log2(x) + BF16 RNE + FTZ + canonical NaN`.
- 2026-06-05: Tested true semantic split `log2(x) = integer_exponent_offset + log2(1.mant)`.
  - `semantic_log2_grouped_subdelta_base_arith_full`: `1455/38/55290`; lowest area but high delay from arithmetic/addition.
  - `semantic_log2_grouped_subdelta_base_case_full`: `1559/36/56124`.
  - `semantic_log2_grouped_xordelta_pair_full`: `1797/24/43128`; XOR avoids the adder delay but still loses to old delta-pair.
  - `semantic_log2_positive_runs`: `2407/19/45733`.
  - `structural_exp_mant_delta_pair`: `1679/18/30222`, still best.
- 2026-06-05: Official `evaluate.py` recheck passed for all 7 generated ex204 candidates.
- 2026-06-05: Manual no-generator semantic RTL attempt `ex204_bf16_log2_manual_q18_semantic`:
  - Handwritten structure: `k = exp - 127`, Q18 `log2(1 + mant/128)` 128-entry LUT, signed fixed-point add, priority/shift/RNE conversion back to BF16.
  - Official `evaluate.py` result: exact equivalent, `1205/70/84350`.
  - Interpretation: area is lower than all previous ex204 candidates, but conversion logic creates very high delay, so ADP is worse.
- 2026-06-05: Aggressive run `ex201_ex204_frontend_aggressive_semantic_20260605_1139` targeted 50% ADP reduction (`<=15111`) but did not improve current best.
  - `parallel_full_case_hint`: exact, unchanged `1679/18/30222`.
  - `synth_no_yosys_abc`: exact but worse `2873/24/68952`.
  - `manual_field_formula`: exact field-level `log2`, `1254/48/60192`.
  - `manual_field_q13`: exact shared-Q13 correction LUT, `1167/51/59517`.
  - `xordelta_direct_grouped`: exact, `1677/19/31863`; 2 nodes lower than current best but one extra delay level.
  - Official `evaluate.py` recheck passed for all 5 aggressive candidates.

Failed or Avoided Directions:
- Broad delta-pair and positive-default variants already underperform; do not repeat without a new semantic split.
- Grouping log2 mantissa delta patterns reduces source size and area, but the added class decoder/arithmetic depth hurts ADP.
- Full semantic fixed-point log2 conversion is exact and compact in area, but its priority encoder, variable shift, and rounding path are too deep without backend optimization.
- To improve this case without backend optimization, the next useful direction needs to preserve the old delta-pair delay near 18 while reducing the base/delta table area.
- Direct grouping of identical XOR-delta patterns saves only 2 nodes and costs one delay level; the separate class decoder variant and direct grouped variant are both worse than the old exp/mant delta pair.

## 2026-06-05 Bitlogic Follow-Up

Run: `ex201_ex204_frontend_bitlogic_20260605_1412`

Consolidated result:
- `candidates.csv` contains all exact/synthesized current-run candidates.
- Best current-run candidate: `ex204_bf16_log2_exp_mant_delta_pair_no_defaults`, `1679/18/30222`.
- This ties the previous best but does not improve it.

Tried and excluded:
- Shared BDD Verilog, two variable orders: exact but worse (`39644` and `40299` ADP).
- Bitplane sign-exp mode: exact but worse `2842/16/45472`.
- Positive-only XOR delta: exact but worse `1683/19/31977`.
- Default-NaN positive-domain table: exact but worse `2099/18/37782`.
- Separate sign/exp/mant field defaults: exact but worse `2384/19/45296`.
- Removing defaults from the old delta-pair structure did not change QoR.
- XOR-delta base mantissa sweep:
  `m=1,2,4,8,16,32,64,96,127` all lost to the original `m=0` base.

Current interpretation:
- The `exp_mant_delta_pair` structure is locally stable under source-level
  cleanup and base selection.
- Further frontend improvement likely requires a new log2 reassembly that keeps
  the old 18-level delay, not additional base/delta table reshaping.

## 2026-06-05 Semantic Deep Follow-Up

Run: `ex201_ex204_frontend_semantic_deep_20260605_1525`

Improved result:
- `ex204_bf16_log2_delta_pair_bit2_override`: exact, official recheck `1657/18/29826`.
- Previous best was `1679/18/30222`, so this saves 22 nodes at the same 18-level delay.

Tried and excluded:
- Single-bit delta-pair override found bit 2 as the only clear improvement.
- Multi-bit combinations around bit 2 tied or worsened; no area reduction below `1657` was found.
- Pair-bit exp-mode was exact but worse (`2209/18/39762`).

Current interpretation:
- The old delta-pair structure can be improved slightly by isolating one output
  bit, but additional bit overrides do not combine constructively.
- The broader semantic `log2` arithmetic forms remain lower-area but too deep.

## 2026-06-05 Semantic Continue Follow-Up

Run: `ex201_ex204_frontend_semantic_continue_20260605_1732`

New best:
- `ex204_bf16_log2_delta_pair_first_hilo3_bits_14_bh3`
- Official `evaluate.py` recheck: `1597/17/27149`
- Previous best: `1657/18/29826`

Effective direction:
- Kept the semantic delta-pair idea, but split the delta table by mantissa
  hi/lo (`hi=3`) instead of using a flat 128-entry delta case.
- Overriding output bit 14 with a shallow bit predicate reduced delay from 18
  to 17 and gave the largest ex204 frontend improvement in this pass.

Tried and excluded:
- Ordinary hi/lo word/field tables had 16-level delay but too much area.
- mode-base and mantissa-64 base delta variants were exact but did not beat
  first-base hi=3.
- bit2, bit9, and bit11 were useful locally, but combinations with bit14 lost
  the 17-level/low-area balance.

### Additional continuation pass

- Tried separate field factoring, split-sign positive-domain factoring,
  critical-bit BDD, casez-run/comparator bit predicates, and semantic arithmetic
  base for `log2`.
- The arithmetic-base delta-pair was exact and reduced area as low as
  `1529/18/27522`, but it could not preserve the 17-level path, so it stayed
  behind `1597/17/27149`.
- BDD bit14 was close at `1600/17/27200`, but still did not beat the current
  bit14 hi/lo predicate.

### Formula/PLA continuation pass

New best:
- `ex204_bf16_log2_log2_arithbase_delta_hilo3_formula_bits_11_14`
- Official `evaluate.py` recheck: `1545/17/26265`
- Previous best: `1597/17/27149`

Effective direction:
- Kept the lower-area semantic arithmetic base:
  `base = BF16(exp - 127)` for positive inputs, with special zero/inf/NaN
  handling and a mantissa delta table.
- Replaced output bits 11 and 14 with hand-derived exp/mant formulas:
  bit14 is determined by the log2 sign/exponent boundary around positive
  `exp=125..128`; bit11 is determined by special powers and `mant != 0` at
  positive `exp=125` and `exp=127`.
- This preserved the 17-level path while saving 52 nodes versus the previous
  best.

Tried and excluded:
- Formula bit14 on the old delta-pair seed was exact and slightly better
  (`1596/17/27132`) but lost to the arithmetic-base formula seed.
- Adding bit9 formula or full-run predicates usually raised delay to 18 or 19.
- Per-sign-exp PLA was exact; best close result
  `log2_arithbase_delta_hilo3_bits_9_11_14_pla` was `1587/17/26979`, still
  worse than the new formula best.
- Other arithbase delta splits (`full`, `hilo1`, `hilo2`, `hilo4`, `hilo5`,
  `hilo6`) did not beat `hilo3`.
- Equality-style formula rewrites were exact and lowered area as far as
  `1528/18/27504`, but the 18-level delay kept them behind the current
  `1545/17/26265` best.
