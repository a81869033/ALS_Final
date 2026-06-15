# ex247 Frontend Attempts

Function hypothesis: E5M2FN packed FP8 division, low byte / high byte.

Reference row: area/delay/ADP/score = `175/17/2975/4462.5`.

Current known best:
`ex247_semantic_div_bound_smallpat_nested_den_synth_preset_aig`,
`365/25/9125`, ratio `3.067227`.

## Attempt Log

- 2026-06-08: exact semantic match for E5M2FN low/high division with RNE,
  sign xor, divide-by-zero saturation, and canonical NaN.
- Tried and excluded:
  - nested exponent-delta/significand table: exact, best `630/22/13860`.
  - semantic-key BDD/full-output BDD: exact but larger.
- Best structure: ratio class formula by `{sig_num,sig_den}`.  The class
  drives an exponent-delta offset/mantissa formula plus exact low/high boundary
  exceptions.
- 2026-06-08 deeper pass: no new best over `420/22/9240`.  Official
  `evaluate.py` replay on the current best AIG is still `OK 420/22/9240`.
- Additional structures tried and excluded:
  - possible-row and special-row factoring: exact after renderer fix; best
    `411/23/9453` lowered area but delay increase lost ADP.
  - denominator-zero don't-care completions: exact, best `426/22/9372`.
  - ordered row-major completions: exact; zero/saturation versions reproduced
    `420/22/9240`, copy variants were worse.
  - limited synthflow on the current source: no improvement over the existing
    `synth_preset_aig` row.
  - selected output-bit BDD override: exact but worse; best `463/22/10186`,
    bit0 reached delay `21` only by increasing area to `538`.
  - shared attribute and split-attribute hand-written structures: exact after
    fixing divide-by-zero/zero/saturation priority, but much worse
    (`450/27/12150` and `457/27/12339`).
  - quotient threshold/comparator normalizer: exact and more semantic, but
    Yosys built a deep comparator chain; best `447/32/14304`.
  - direct sigpair classifier SOP plus small-mag SOP: exact, but area-only
    improvement was cancelled by delay; best `419/26/10894`.
  - two-level nested denominator/numerator mux: exact but much worse; best
    `607/25/15175`.
  - grouped identical case blocks: exact, kept delay `22` but area rose to
    `437`, ADP `9614`.
  - random invalid sigpair don't-care completion seeds 0-119: exact but not
    useful; best seed49 `440/24/10560`.
- 2026-06-08 qclass/small-pattern pass:
  - reciprocal-multiply structure was implemented as denominator reciprocal
    `floor(128/sig_d)` times numerator significand, followed by a compact
    quotient classifier.  It was exact but much worse: best `437/41/17917`.
  - qclass + formulaic 2-bit underflow pattern was exact and informative:
    nested-den best `309/30/9270`, a low-area high-delay near miss.
  - direct case-inside small-pattern replacement was exact but worse:
    `455/27/12285`.
  - bound-smallpat classifier, nested by denominator, became the new best:
    `365/25/9125`.  It stores `zero_hi/sat_lo/offset/mant/smallpat` instead
    of a full low-delta table, then reconstructs low underflow with four
    2-bit patterns.
  - numerator-first nesting and case attributes were exact but did not beat
    denominator-first: best `376/25/9400`.
  - log-code and normal/subnormal split were rechecked after fixing the
    generator `render_div_logcode` return path; exact but worse (`427/25/10675`
    and `555/25/13875`).
- Follow-up should focus on reducing the new bound-smallpat nested-den delay
  from 25 without reintroducing the full low-delta table.  Repeating broad row
  completion, flat BDD override, reciprocal-product classification, or generic
  normal/subnormal split is unlikely to produce a large jump.
- 2026-06-08 ex250 product-factoring transfer check:
  - Factored the 49 denominator/numerator bound-smallpat rows into a
    sigpair-to-class-id table plus a shared attribute table.  The 49 rows only
    have 29 unique attribute tuples, so this was a plausible internal-classifier
    rewrite.
  - Exact results were much worse: nested class-id best `421/31/13051`, flat
    class-id best `424/32/13568`; case attributes did not improve it.
  - Conclusion: for ex247, the current denominator-first bound-smallpat table is
    better kept as one direct attribute lookup.  The extra class-id indirection
    lengthens the critical path and should not be repeated as-is.

- 2026-06-12 Round9 fp8-core-r9 pre-candidate dossier:
  - Dossier path:
    `student/work/ex200_ex299_frontend_refgap_round9_20260612_1851/fp8-core-r9/ex247/notes/high_level_dossier.md`.
  - Reconfirmed suspected operation before Verilog: E5M2FN packed division,
    low byte over high byte, with sign xor, canonical NaN, `0/0` NaN,
    divide-by-zero saturation, RNE rounding, underflow, and max-finite
    saturation.
  - Planned hypotheses:
    `ex247|E5M2FN packed low-over-high division|direct midpoint-threshold quantizer|shared special-case shell exponent-delta significand and RNE threshold predicates|pending_official_evaluate|exact_e5m2fn_div_low_over_high|threshold_quantized_magnitude`
    and
    `ex247|E5M2FN packed low-over-high division|semantic-key cofactor residual logic|shared special-case shell with delta/significand cofactors|pending_official_evaluate|exact_e5m2fn_div_low_over_high|cofactored_output_bits`.
  - Outcome: planned only; no Round9 Verilog candidate had been generated at
    the time of this note.
  - Next action: generate and officially evaluate both materially different
    families, then append result paths and ADP.

- 2026-06-12 Round9 fp8-core-r9 evaluated results:
  - Shard CSVs:
    `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round9_20260612_1851/agent_shards/fp8-core-r9/candidates.csv`,
    `evaluation_results.csv`, `failed_hypotheses.csv`, and
    `shared_structure_report.csv`.
  - `ex247|E5M2FN packed low-over-high division|direct midpoint-threshold quotient normalizer|shared special-case shell sign xor exponent delta significand decode and RNE quotient threshold predicates|yosys_synth_preset_aig_official_evaluate|exact_e5m2fn_div_low_over_high|threshold_quantized_magnitude`:
    official `evaluate.py` OK, `448/32/14336`, no improvement over frontend
    ADP `8349`.  Verilog:
    `student/work/ex200_ex299_frontend_refgap_round9_20260612_1851/fp8-core-r9/ex247/verilog/ex247_semantic_div_threshold_compare.v`;
    AIG:
    `student/work/ex200_ex299_frontend_refgap_round9_20260612_1851/fp8-core-r9/ex247/aigs/ex247_semantic_div_threshold_compare_synth_preset_aig.aig`;
    log:
    `student/work/ex200_ex299_frontend_refgap_round9_20260612_1851/fp8-core-r9/ex247/logs/ex247_semantic_div_threshold_compare_synth_preset_aig.official_evaluate.log`.
  - `ex247|E5M2FN packed low-over-high division|semantic-key cofactor residual logic|shared special-case shell with exponent-delta and significand-key output cofactors|yosys_synth_preset_aig_official_evaluate|exact_e5m2fn_div_low_over_high|cofactored_output_bits`:
    official `evaluate.py` OK, `670/20/13400`, no improvement over frontend
    ADP `8349`.  Verilog:
    `student/work/ex200_ex299_frontend_refgap_round9_20260612_1851/fp8-core-r9/ex247/verilog/ex247_semantic_div_key_bdd_delta_then_sig.v`;
    AIG:
    `student/work/ex200_ex299_frontend_refgap_round9_20260612_1851/fp8-core-r9/ex247/aigs/ex247_semantic_div_key_bdd_delta_then_sig_synth_preset_aig.aig`;
    log:
    `student/work/ex200_ex299_frontend_refgap_round9_20260612_1851/fp8-core-r9/ex247/logs/ex247_semantic_div_key_bdd_delta_then_sig_synth_preset_aig.official_evaluate.log`.
  - Outcome: evaluated no improvement. Threshold form was exact but too deep;
    cofactor form reduced delay but area dominated.  Next action: future work
    needs a representation that keeps the Round8 low-delay path while reducing
    attribute-table area, not another threshold comparator or broad cofactor
    BDD.

## 2026-06-12 Round12 coordinator-fp8-dtarget

- method_signature: `ex247|E5M2FN packed low-over-high division with boundary-first region mux|round5 boundary-region mux source, unchanged RTL, targeted frontend ABC delay constraints|shared sign/exponent/significand decode plus denominator-nested boundary attributes|yosys_abc_g_aig_d14_official_evaluate|exact_e5m2fn_div_low_over_high|region-grouped_magnitude_output`
- official result: `OK 363/23/8349`; improved frontend `0`.
- paths: candidate CSV `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round12_20260612_2015/agent_shards/coordinator-fp8-dtarget/candidates.csv`, evaluate log `student/work/ex200_ex299_frontend_refgap_round12_20260612_2015/coordinator-fp8-dtarget/ex247/logs/ex247_round12_bound_region_mux_abc_g_aig_d14.official_evaluate.log`.
- next action: continue only with RTL/source structure changes if these D-targets do not improve.

## 2026-06-12 Round16 coordinator-flow-r16

- method_signature: `ex247|E5M2FN packed low-over-high division|round15 split bound-smallpat per-attribute denominator tables|shared special-case shell plus separate zero/sat/offset/mant/pattern source functions|yosys_synth_default_abc_g_AND_official_evaluate|exact_e5m2fn_div_low_over_high|source_split_den_bound_smallpat`
- official result: `OK 367/24/8808`; improved frontend `0`; beats reference `0`.
- paths: Verilog `student/work/ex200_ex299_frontend_refgap_round16_20260612_2233/coordinator-flow-r16/ex247/verilog/ex247_semantic_div_bound_smallpat_split_den_r16_and.v`; AIG `student/work/ex200_ex299_frontend_refgap_round16_20260612_2233/coordinator-flow-r16/ex247/aigs/ex247_semantic_div_bound_smallpat_split_den_r16_abc_and.aig`; log `student/work/ex200_ex299_frontend_refgap_round16_20260612_2233/coordinator-flow-r16/ex247/logs/ex247_semantic_div_bound_smallpat_split_den_r16_abc_and.evaluate.py.log`.
- outcome: standard `yosys_synth.py` AND flow worsened the round15 source; do not repeat this synth-flow-only variant without source/partition changes.

## 2026-06-12 Round17 fp8-arith-r17 checkpoint

- status: `BLOCKED_NO_CANDIDATE`.
- evidence: `student/work/ex200_ex299_frontend_refgap_round17_20260612_2300/fp8-arith-r17/ex247/notes/round17_checkpoint_blocked_no_candidate.md`.
- shard CSVs: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round17_20260612_2300/agent_shards/fp8-arith-r17/`.
- summary: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round17_20260612_2300/agent_summaries/fp8-arith-r17.md`.
- outcome: hard checkpoint required a recorded first-priority case outcome before a new Round17 Verilog/AIG candidate had been created. No official `evaluate.py` result is claimed for Round17.
- next action: stay on `ex247` and create a materially new arithmetic-region source with shared normalize/round/saturate predicates plus compact residual low-boundary tables; avoid the Round16 split-den AND replay, threshold comparator, cofactor BDD, and other documented `do_not_repeat_as_is` signatures.

## 2026-06-12 Round18 fp8-source-r18 checkpoint

- status: `BLOCKED_NO_CANDIDATE`.
- evidence: `student/work/ex200_ex299_frontend_refgap_round18_20260612_2321/fp8-source-r18/ex247/notes/round18_checkpoint_blocked_no_candidate.md`.
- shard CSVs: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round18_20260612_2321/agent_shards/fp8-source-r18/`.
- summary: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round18_20260612_2321/agent_summaries/fp8-source-r18.md`.
- outcome: reached after first-priority `ex246` blocked. No new materially distinct source was ready before checkpoint, and no official `evaluate.py` row is claimed.
- next action: implement an arithmetic-region quotient source that shares exponent-delta, quotient-class, rounding/sticky, divide-by-zero saturation, and low-underflow predicates, with residual tables limited to exact boundary zones. Avoid round15/round16 split-den replay, threshold comparator, cofactor BDD, and repeating the round17 blocker-only result.

## 2026-06-13 Round22 float-fp8-r22 completion checkpoint

- Candidate: `ex247_r22_bound_region_mux_share2`.
- method_signature: `ex247|E5M2FN packed low-over-high division|round22 copied boundary-region mux with share+dual-abc synth|shared sign/exponent/significand decode and denominator boundary predicates|yosys_share_abc_g_aig_then_abc_g_AND_official_evaluate|exact_e5m2fn_div_low_over_high|region_mux_outputs`.
- Official `evaluate.py` result: `OK 363/23/8349`; improved frontend `0`; beats reference `0`.
- Paths: Verilog `student/work/ex200_ex299_frontend_refgap_round22_20260613_0218/float-fp8-r22/ex247/verilog/ex247_r22_bound_region_mux_share2.v`; AIG `student/work/ex200_ex299_frontend_refgap_round22_20260613_0218/float-fp8-r22/ex247/aigs/ex247_r22_bound_region_mux_share2.aig`; official log `student/work/ex200_ex299_frontend_refgap_round22_20260613_0218/float-fp8-r22/ex247/logs/ex247_r22_bound_region_mux_share2.official_evaluate.log`; dossier `student/work/ex200_ex299_frontend_refgap_round22_20260613_0218/float-fp8-r22/ex247/dossier.md`.
- Outcome: equivalent but low-value; it ties the current frontend best and remains above reference ADP `2975`. Do not repeat source-identical boundary-region synth-flow variants unless the source-level region/predicate structure changes.

## 2026-06-13 Targeted Probe r24

- Campaign: `student/frontend_campaigns/campaigns/ex246_ex247_frontend_targeted_probe_20260613_0351/`.
- Tested three source-level variants around the exact E5M2FN low-over-high
  division hypothesis:
  - `ex247|E5M2FN packed low-over-high division|validless nested boundary-region mux|shared sign exponent significand decode and denominator-nested validless boundary attrs|multi_yosys_official_evaluate|exact_e5m2fn_div_low_over_high|region_grouped_magnitude_validless`.
  - `ex247|E5M2FN packed low-over-high division|validless flat pair boundary attrs|shared sign exponent significand decode and flat sigpair boundary attrs|multi_yosys_official_evaluate|exact_e5m2fn_div_low_over_high|flat_pair_region_magnitude`.
  - `ex247|E5M2FN packed low-over-high division|validless direct assignment region mux|shared sign exponent significand decode boundary attrs and direct priority expression|multi_yosys_official_evaluate|exact_e5m2fn_div_low_over_high|direct_region_magnitude`.
- Official `evaluate.py` coverage: 12/12 ex247 candidate/synth rows were `OK`.
  Best observed row was
  `ex247_r24_bound_novalid_nested_default_aig`, `363/23/8349`,
  with Verilog
  `student/work/ex246_ex247_frontend_targeted_probe_20260613_0351/local-targeted/ex247/verilog/ex247_r24_bound_novalid_nested_default_aig.v`,
  AIG
  `student/work/ex246_ex247_frontend_targeted_probe_20260613_0351/local-targeted/ex247/aigs/ex247_r24_bound_novalid_nested_default_aig.aig`,
  and official log
  `student/work/ex246_ex247_frontend_targeted_probe_20260613_0351/local-targeted/ex247/logs/ex247_r24_bound_novalid_nested_default_aig.evaluate.py.log`.
- Outcome: no frontend improvement. Removing the attr valid bit can lower area
  to `356` in one flow but increases delay to `24`; flat-pair and direct
  priority forms are worse. Do not repeat validless nested/flat/direct region
  mux forms unless paired with a different quotient-class or low-boundary
  decomposition.

## 2026-06-13 Round25 fp8-r25

- Campaign: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round25_20260613_0506/agent_shards/fp8-r25/`.
- Tested method family: `ex247|E5M2FN packed low-over-high division|direct low-boundary magnitude attrs instead of small-pattern decoder|shared sign exponent significand delta boundary attrs and direct low mags|yosys_multi_official_evaluate|exact_e5m2fn_div_low_over_high|direct_low_boundary_region_output`.
- Official `evaluate.py` rows: `2/2` OK.
- Best observed: `ex247_r25_direct_lowattrs_synth_preset_aig`, `381/28/10668`, improved frontend `0`, beats reference `0`.
- Paths: Verilog `student/work/ex200_ex299_frontend_refgap_round25_20260613_0506/fp8-r25/ex247/verilog/ex247_r25_direct_lowattrs_synth_preset_aig.v`; AIG `student/work/ex200_ex299_frontend_refgap_round25_20260613_0506/fp8-r25/ex247/aigs/ex247_r25_direct_lowattrs_synth_preset_aig.aig`; log `student/work/ex200_ex299_frontend_refgap_round25_20260613_0506/fp8-r25/ex247/logs/ex247_r25_direct_lowattrs_synth_preset_aig.evaluate.py.log`.
- Next action: `extend only if method_signature changes materially; otherwise move to a different representation family`.

## 2026-06-13 Round25 fp8-worst-r25

- Campaign: `student/frontend_campaigns/campaigns/ex240_ex299_frontend_gt2_round25_20260613_0531/agent_shards/fp8-worst-r25/`.
- Families tested:
  - truth-derived shared ROBDD over interleaved high/low FP8 operand bits;
  - current frontend-best source replay with alternate Yosys/AIG mapping.
- Official `evaluate.py` rows: `3/3` OK.
- Best observed: `ex247_resynth_abc_g_aig`, `363/23/8349`; this ties current frontend best and does not beat reference `2975`.
- BDD fallback: `1007/21/21147`; shallow but too much area.
- Paths: summary `student/frontend_campaigns/campaigns/ex240_ex299_frontend_gt2_round25_20260613_0531/agent_summaries/fp8-worst-r25.md`; evaluation CSV `student/frontend_campaigns/campaigns/ex240_ex299_frontend_gt2_round25_20260613_0531/agent_shards/fp8-worst-r25/evaluation_results.csv`; dossier `student/work/ex240_ex299_frontend_gt2_round25_20260613_0531/fp8-worst-r25/ex247/notes/high_level_dossier.md`.
- Outcome: no frontend improvement. Next action is a genuinely new quotient/boundary semantic decomposition; do not repeat BDD fallback or current source flow probes unchanged.


## 2026-06-13 Round26 fp8-r26

- Campaign: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round26_20260613_0539/agent_shards/fp8-r26/`.
- Best official candidate in this shard: `` `//`.
- Current frontend baseline used by this worker: `8349`; reference ADP `2975`.
- Outcome: improved frontend `0`; beats reference `0`.
- Evidence: ``.
- Next action: Debug non-equivalence or choose a different representation family.


## 2026-06-13 Round26 fp8-r26

- Campaign: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round26_20260613_0539/agent_shards/fp8-r26/`.
- Best official candidate in this shard: `ex247_r26_qclass_nested_synth_preset_aig` `309/30/9270`.
- Current frontend baseline used by this worker: `8349`; reference ADP `2975`.
- Outcome: improved frontend `0`; beats reference `0`.
- Evidence: `student/work/ex200_ex299_frontend_refgap_round26_20260613_0539/fp8-r26/ex247/logs/ex247_r26_qclass_nested_synth_preset_aig.evaluate.py.log`.
- Next action: Try a new high-level representation; do not repeat this r26 source as-is.

## 2026-06-13 Round60 sub-ex246-ex247-r60

- Campaign: `student/frontend_campaigns/campaigns/frontend_source_parallel_round60_20260613_0825/`.
- Recording-guided frontend-only/source-only mixed RTL tried: quotient-region split with shared quotient and boundary predicates.
- Official `evaluate.py` rows: `4/4` equivalent for ex247.
- Best observed: `ex247_r60_quotient_region_split_synth_flatten`, `367/32/11744`.
- Current frontend best remains `317/23/7291`; reference `2975`.
- Evidence: `student/frontend_campaigns/campaigns/frontend_source_parallel_round60_20260613_0825/agent_shards/sub-ex246-ex247-r60/evaluation_results.csv`.
- Outcome: no frontend-best improvement. Do not repeat quotient-region split unchanged; next attempt should reduce the residual underflow path or use a different quotient boundary decomposition.

## 2026-06-13 Round62 sub-fp8-muldiv-r62

- Campaign: `student/frontend_campaigns/campaigns/frontend_source_parallel_round62_20260613_0907/`.
- Source-only families tried: selected-bit residual cofactor and denominator-nested quotient-class small residual pattern.
- Official `evaluate.py` rows: `4/4` equivalent for ex247.
- Best observed: `ex247_r62_qclass_smallpat_nested_den_synth_preset_aig`, `309/30/9270`.
- Current frontend best remains `317/23/7291`; reference `2975`.
- Evidence: `student/frontend_campaigns/campaigns/frontend_source_parallel_round62_20260613_0907/agent_shards/sub-fp8-muldiv-r62/evaluation_results.csv`.
- Outcome: no frontend-best improvement. Do not repeat qclass smallpat nested denominator source unchanged; next useful direction is a smaller low-underflow residual path.


## 2026-06-13 Round64 sub-fp8-muldiv-alt-r64

- Campaign: `student/frontend_campaigns/campaigns/frontend_source_parallel_round64_20260613_1004/`.
- method_signature: `ex247|E5M2FN packed low-over-high division|denominator quotient zone lattice|shared denominator-major quotient boundaries and low residual magnitudes|yosys_rtl_official_evaluate|exact_e5m2fn_div_low_over_high|den_quotient_zone_lattice|synth_preset_aig`.
- Official result: `OK 445/28/12460`; improved frontend `no`; beats reference `no`.
- Paths: Verilog `student/work/frontend_source_parallel_round64_20260613_1004/sub-fp8-muldiv-alt-r64/ex247/verilog/ex247_r64_den_quotient_zone_lattice.v`; AIG `student/work/frontend_source_parallel_round64_20260613_1004/sub-fp8-muldiv-alt-r64/ex247/aigs/ex247_r64_den_quotient_zone_lattice_synth_preset_aig.aig`; log `student/work/frontend_source_parallel_round64_20260613_1004/sub-fp8-muldiv-alt-r64/ex247/logs/ex247_r64_den_quotient_zone_lattice_synth_preset_aig.evaluate.py.log`.
- Next action: keep the exact result as a recorded non-winning source-only family; move to a different high-level decomposition unless the coordinator wants to mine this lattice for a smaller shared residual.


## 2026-06-13 Round65 sub-fp8-codearith-r65

- Campaign: `student/frontend_campaigns/campaigns/frontend_source_parallel_round65_20260613_1029/`.
- Source-only code-arithmetic families tried for `ex247`; official `evaluate.py` was the only acceptance check.
- Best observed: `ex247_r65_div_biased_delta_microcode_synth_preset_aig` `462/28/12936`.
- Current frontend/reference used by this shard: `7291` / `2975`.
- Outcome: no frontend-best improvement; beats reference `no`.
- Evidence: shard evaluation CSV `student/frontend_campaigns/campaigns/frontend_source_parallel_round65_20260613_1029/agent_shards/sub-fp8-codearith-r65/evaluation_results.csv`; dossier `student/work/frontend_source_parallel_round65_20260613_1029/sub-fp8-codearith-r65/ex247/notes/high_level_dossier.md`.
- Next action: keep as recorded source-only evidence; do not repeat unchanged without a new code or residual decomposition.

## 2026-06-13 14:51 +0800 Round74 sub-fp8-muldiv-r74

- Campaign: `student/frontend_campaigns/campaigns/frontend_source_parallel_round74_20260613_1439/`.
- Tested two source-only exact table families for the E5M2FN low-over-high division hypothesis:
  - `ex247|E5M2FN packed low-over-high division|flat exact magnitude table over delta and numerator-denominator significands|shared sign xor exponent-delta and sigpair key|repo_yosys_frontend_default|official_evaluate|full_word`.
  - `ex247|E5M2FN packed low-over-high division|denominator-nested exact delta-numerator magnitude functions|shared denominator class with local delta numerator key|repo_yosys_frontend_default|official_evaluate|den_nested_full_word`.
- Official `evaluate.py` rows: `2/2` equivalent. Best observed: `ex247_r74_den_nested_delta_num_mag` `774/26/20124`.
- Current frontend/reference used by this shard: `7291` / `2975`.
- Outcome: no frontend-best improvement; beats reference `no`.
- Evidence: shard CSV `student/frontend_campaigns/campaigns/frontend_source_parallel_round74_20260613_1439/agent_shards/sub-fp8-muldiv-r74/evaluation_results.csv`; best log `student/work/frontend_source_parallel_round74_20260613_1439/sub-fp8-muldiv-r74/ex247/logs/ex247_r74_den_nested_delta_num_mag.evaluate.py.log`.
- Next action: exact quotient tables are much too large; continue reducing the denominator-bound low-underflow residual instead of expanding to full delta/sigpair tables.

## 2026-06-13 15:07 +0800 Round75 sub-fp8-worst-r75

- Campaign: `student/frontend_campaigns/campaigns/frontend_source_parallel_round75_20260613_1507/`.
- Dossier: `student/work/frontend_source_parallel_round75_20260613_1507/sub-fp8-worst-r75/ex247/notes/high_level_dossier.md`.
- Source-only families tried: selected output-cluster grafts from alternate exact source families, keeping the compact semantic shell and rebuilding complementary PO clusters before Yosys.
- Official `evaluate.py` equivalent rows: `2/4`.
- Best observed: `ex247_r75_shell_low2_cluster` `367/24/8808`.
- Current frontend/reference used by this shard: `7291` / `2975`.
- Outcome: no frontend-best improvement.
- Evidence: shard CSV `student/frontend_campaigns/campaigns/frontend_source_parallel_round75_20260613_1507/agent_shards/sub-fp8-worst-r75/evaluation_results.csv`.
- Next action: avoid repeating these exact output-cluster grafts; useful follow-up needs a genuinely smaller shared predicate or shorter semantic shell.


## 2026-06-13 17:23:34 +0800 Round76 sub-fp8-worst-r76

- Campaign: `frontend_source_parallel_round76_20260613_1706`.
- Dossier: `student/work/frontend_source_parallel_round76_20260613_1706/sub-fp8-worst-r76/ex247/notes/high_level_dossier.md`.
- Source-only families tried:
  - `ex247_r76_field_pair_div_case`: `ex247|E5M2FN_low-over-high_division_can_be_represented_by_sign_and_magnitude_field_pair|one_vector_case_over_sign-xor_numerator_magnitude_and_denominator_magnitude|shared_sign_xor_numerator/denominator_magnitude_descriptor|repo_yosys_frontend_default|exact_e5m2fn_div_low_over_high|full_word`.
  - `ex247_r76_exp_delta_sigratio_desc`: `ex247|E5M2FN_division_output_is_driven_by_exponent_delta_and_significand_ratio|one_vector_case_over_special_flags_exponent_delta_and_sig_ratio|shared_special_shell_sign_xor_exponent_delta_numerator/denominator_sig_descriptor|repo_yosys_frontend_default|exact_e5m2fn_div_low_over_high|full_word`.
- Best official candidate: `ex247_r76_exp_delta_sigratio_desc` `1809/30/54270`.
- Current frontend/reference used by this shard: `7291` / `2975`.
- Outcome: frontend improvement `0`; beats reference `0`.
- Evidence: shard CSV `student/frontend_campaigns/campaigns/frontend_source_parallel_round76_20260613_1706/agent_shards/sub-fp8-worst-r76/evaluation_results.csv`.
- Next action: do not expand these descriptor tables further if they remain area dominated; look for smaller boundary formulas.

## 2026-06-13 17:44:36 +0800 Round77 sub-fp8-worst-source-r77

- Campaign: `frontend_source_parallel_round77_20260613_1733`.
- Dossier: `student/work/frontend_source_parallel_round77_20260613_1733/sub-fp8-worst-source-r77/ex247/notes/high_level_dossier.md`.
- Source-only families tried: current-best source copy control, selective `keep` on boundary/low-residual semantic wires, assign-vs-case output mux rewrite, and flattenable boundary-core wrapper.
- Official `evaluate.py` rows: `4/4` equivalent.
- Best official candidate: `ex247_r77_current_copy`, `367/24/8808`.
- method_signature: `ex247|E5M2FN_packed_low-over-high_division|current_source_copy|shared_semantic_wires_preserved_as_original_source|repo_yosys_frontend_default|official_evaluate|full_word`.
- Current frontend/reference used by this shard: `7291` / `2975`.
- Outcome: frontend improvement `0`; beats reference `0`.
- Evidence: shard CSV `student/frontend_campaigns/campaigns/frontend_source_parallel_round77_20260613_1733/agent_shards/sub-fp8-worst-source-r77/evaluation_results.csv`; best log `student/work/frontend_source_parallel_round77_20260613_1733/sub-fp8-worst-source-r77/ex247/ex247_r77_current_copy/logs/ex247_r77_current_copy.evaluate.py.log`.
- Next action: output style, selective `keep`, and flattenable boundary wrapping did not help; pursue a smaller low-underflow residual or new quotient boundary decomposition.

## 2026-06-14 12:10:31 +0800 Breakthrough campaign ex204_ex299_frontend_breakthrough_20260614_1051

- Scope: frontend-only `ex247` source-level recuts; no backend portfolio/remap/postpareto and no existing-AIG optimization input.
- Baseline at campaign start: `ex247_round5_bound_region_mux_abc_g_aig` `363/23/8349`; reference `2975`.
- R2 useful direction: `ex247_r2_special_lowpat_boolean_abc_g_aig_frontend` `361/23/8303`, special-case shell plus direct low-underflow Boolean residual.
- R3 amplified direction: `ex247_r3_factored_lowpred_abc_g_aig_frontend` `354/23/8142`, factoring low-underflow residual into shared `pat/step` predicates.
- R4 breakthrough: `ex247_r4_tail_direct_lowpred_min_abc_g_aig_frontend` official `evaluate.py OK` `251/26/6526`, improving the campaign frontend baseline by `1823` ADP.
- Winning method signature: `ex247|E5M2FN packed low-over-high division|tail-only bound table with minimized low-underflow predicates|derived region predicates and compact pat/step low residual share the tail table|abc_g_aig_frontend|official_evaluate|tail_direct_min_lowpred`.
- Evidence:
  - Verilog: `student/work/ex204_ex299_frontend_breakthrough_20260614_1051/ex247-breakthrough-r4/ex247/verilog/ex247_r4_tail_direct_lowpred_min_abc_g_aig_frontend.v`
  - AIG: `student/work/ex204_ex299_frontend_breakthrough_20260614_1051/ex247-breakthrough-r4/ex247/aigs/ex247_r4_tail_direct_lowpred_min_abc_g_aig_frontend.aig`
  - Official log: `student/runs/float_fp8/ex204_ex299_frontend_breakthrough_20260614_1051/ex247-breakthrough-r4/ex247/logs/ex247_r4_tail_direct_lowpred_min_abc_g_aig_frontend.evaluate.py.log`
  - Shard summary: `student/frontend_campaigns/campaigns/ex204_ex299_frontend_breakthrough_20260614_1051/agent_summaries/ex247-breakthrough-r4.md`
- Nonwinning notes: full-word mux and class-split output reshaping added delay; zero-bucket structural comparator versions were area-competitive but too deep (`251/34/8534`, `252/35/8820`); `low_pat_case` was not equivalent.
- Next action: keep the direct tail-only bound table plus compact low residual; next search should try to recover delay from `26` without reintroducing full `bound_attr` table or full-output BDD.

## 2026-06-14 12:29:00 +0800 fp8-tail-transfer-r2

- Campaign: `student/frontend_campaigns/campaigns/ex204_ex299_frontend_continuation_20260614_1216/agent_shards/fp8-tail-transfer-r2/`.
- Frontend-only families tried: r4 tail-direct low residual as a 16-row truth case, low-step row mux, split special/exp-first region predicates, and r4/r5 output cone mix.
- Official `evaluate.py` rows: `4/4` equivalent. Improvements over current frontend `251/26/6526`:
  - `ex247_r2_lowpred_truth_case_abc_g_aig_frontend` `249/26/6474`, ADP improvement `52`.
  - `ex247_r2_lowpred_step_mux_abc_g_aig_frontend` `250/26/6500`, ADP improvement `26`.
- Reference ADP remains `2975`; delay stayed at `26`.
- Evidence: best Verilog `student/work/ex204_ex299_frontend_continuation_20260614_1216/fp8-tail-transfer-r2/ex247/verilog/ex247_r2_lowpred_truth_case_abc_g_aig_frontend.v`; AIG `student/work/ex204_ex299_frontend_continuation_20260614_1216/fp8-tail-transfer-r2/ex247/aigs/ex247_r2_lowpred_truth_case_abc_g_aig_frontend.aig`; official log `student/runs/float_fp8/ex204_ex299_frontend_continuation_20260614_1216/fp8-tail-transfer-r2/ex247/logs/ex247_r2_lowpred_truth_case_abc_g_aig_frontend.evaluate.py.log`.
- Next action: truth-case low residual is the new frontend handoff candidate for this shard; remaining gap is delay recovery from `26` without reintroducing the larger tail-table or full-output BDD path.

## 2026-06-14 13:00:55 +0800 fp8-output-plane-r3

- Campaign: `student/frontend_campaigns/campaigns/ex204_ex299_frontend_continuation_20260614_1216/agent_shards/fp8-output-plane-r3/`.
- Dossier: `student/work/ex204_ex299_frontend_continuation_20260614_1216/fp8-output-plane-r3/ex247/notes/high_level_dossier.md`.
- Frontend-only families tried:
  - Boolean low residual equations replacing the r2/r5 16-row lowpred truth case.
  - Boolean low residual plus final NaN/special/magnitude output-plane split.
- Official `evaluate.py` rows: `2/2` equivalent. Best observed: `ex247_r3_lowpred_boolean_residual` `255/26/6630`; follow-up `ex247_r3_boolean_final_planes` `258/29/7482`.
- Current frontend/reference used by this shard: `6474` / `2975`; improved frontend `0`; beats reference `0`.
- Evidence: shard CSV `student/frontend_campaigns/campaigns/ex204_ex299_frontend_continuation_20260614_1216/agent_shards/fp8-output-plane-r3/evaluation_results.csv`; best log `student/runs/float_fp8/ex204_ex299_frontend_continuation_20260614_1216/fp8-output-plane-r3/ex247/logs/ex247_r3_lowpred_boolean_residual.evaluate.py.log`.
- Next action: Booleanizing the low residual did not reduce the 26-level path and added area; do not repeat this Boolean residual or Boolean+final-plane split unchanged.
