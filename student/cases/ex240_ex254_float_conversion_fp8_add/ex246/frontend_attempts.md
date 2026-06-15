# ex246 Frontend Attempts

Function hypothesis: E5M2FN packed FP8 multiply, high byte * low byte.

Reference row: area/delay/ADP/score = `187/15/2805/4207.5`.

Current known best:
`ex246_semantic_mul_product_dc_seed12_set11to10_synth_preset_aig`,
`341/22/7502`, ratio `2.674510`.

## Attempt Log

- 2026-06-08: exact semantic match for E5M2FN multiply with RNE, sign xor,
  and canonical `8'h7f` NaN.
- Tried and excluded:
  - nested `exp_sum/product` table: exact, best `408/23/9384`.
  - hand-written product leading-bit normalizer: exact but delay around 38-41.
  - semantic-key BDD and full-output BDD: exact but larger.
  - sig-pair class without multiplier: exact but did not beat product class.
- Best structure: product-class exponent-offset formula.  The 3-bit product
  selects a dominant exponent offset/mantissa class plus exact underflow and
  saturation boundary exceptions.
- 2026-06-08 deeper pass: unreachable 3-bit product codes are exact
  don't-cares.  Random and neighbor product-code completions showed that this
  is a real synthesis lever, not just a table variant.  Seed12-family
  completions lowered both area and delay; official `evaluate.py` replay on
  the selected AIG is `OK 341/22/7502`.
- Tried and excluded in the deeper pass:
  - fixed low/high/nearest completions: exact, best `341/23/7843`.
  - random completions seeds 0-119: found seed12-family `341/22/7502`; later
    seeds found lower area `340` only with delay `23`, so ADP was worse.
  - single swaps from seed12 to seed72: exact but collapsed to `340/23/7820`.
  - single-neighbor changes around seed12: many tied `341/22/7502`; none
    improved ADP.
  - full synthflow on the seed12 source: `synth_preset_aig` stayed best.
- Follow-up random seeds 120-299 all exact but did not beat seed12-family.
  Best in that range was seed132 at `343/22/7546`; low-area seed228 reached
  `340/23/7820`.  This suggests product-code completion alone has mostly
  saturated; a future improvement needs either a source rewrite that lowers
  delay on a `340/23`-style seed or a different multiply-core representation.
- 2026-06-08 high-impact structure pass:
  - direct sigpair classifier SOP plus small-mag SOP was exact but worse:
    `426/25/10650`.
  - two-level nested sig mux was exact but much worse: best `628/28/17584`.
  - grouped identical case blocks preserved exactness but hurt QoR:
    `351/24/8424`.
- 2026-06-08 small-pattern/logcode follow-up:
  - product qclass + 2-bit underflow pattern reduced area to `309` but delay
    rose to `33`, so ADP was worse (`309/33/10197`).
  - case-inside small-pattern and bound-smallpat rewrites were exact but did
    not preserve the current best delay; bests were `371/24/8904` and
    `338/30/10140`.
  - log-code normal/subnormal semantic RTL was exact and reached delay `21`,
    but area was too high (`455/21/9555`).
  - normal/subnormal split attribute RTL was rechecked and remained worse:
    `514/24/12336`.
  These results suggest current Yosys/ABC sharing depends on the flat product
  case shape; the next large jump likely needs a genuinely different arithmetic
  encoding, not another sigpair/product mux rewrite.
- 2026-06-08 ex250 product-factoring transfer check:
  - Replaced `sig3(am) * sig3(bm)` with a 3-bit significand product-code table,
    then reused the seed12 product-class don't-care completion.  This was exact
    and lowered delay to 21, but area rose; best `364/21/7644`, so it did not
    beat the current `341/22/7502`.
  - Case attributes did not change the result.  Repeating the same source with
    low-area seed228 completion was also exact but worse: best `369/22/8118`.
  - Conclusion: the ex250 magnitude/sign factoring idea partially transfers to
    ex246 as a delay-reduction near miss, but the extra 3-bit product-code table
    costs more area than the saved multiplier logic.  Do not rerun this exact
    product-code variant unless a new way to share or compress the table is
    found.

- 2026-06-12 Round9 fp8-core-r9 pre-candidate dossier:
  - Dossier path:
    `student/work/ex200_ex299_frontend_refgap_round9_20260612_1851/fp8-core-r9/ex246/notes/high_level_dossier.md`.
  - Reconfirmed suspected operation before Verilog: E5M2FN packed multiply,
    high byte times low byte, with sign xor, canonical NaN, RNE rounding,
    underflow, and max-finite saturation.
  - Planned hypotheses:
    `ex246|E5M2FN packed multiply|product threshold normalizer|shared special-case shell exponent-sum product and RNE threshold predicates|pending_official_evaluate|exact_e5m2fn_mul_high_times_low|threshold_quantized_magnitude`
    and
    `ex246|E5M2FN packed multiply|semantic-key cofactor residual logic|shared special-case shell with exponent-sum/product cofactors|pending_official_evaluate|exact_e5m2fn_mul_high_times_low|cofactored_output_bits`.
  - Outcome: planned only; no Round9 Verilog candidate had been generated at
    the time of this note.
  - Next action: generate and officially evaluate both materially different
    families, then append result paths and ADP.

- 2026-06-12 Round9 fp8-core-r9 evaluated results:
  - Shard CSVs:
    `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round9_20260612_1851/agent_shards/fp8-core-r9/candidates.csv`,
    `evaluation_results.csv`, `failed_hypotheses.csv`, and
    `shared_structure_report.csv`.
  - `ex246|E5M2FN packed multiply|product threshold normalizer|shared special-case shell sign xor exponent sum product and RNE threshold predicates|yosys_synth_preset_aig_official_evaluate|exact_e5m2fn_mul_high_times_low|threshold_quantized_magnitude`:
    official `evaluate.py` OK, `387/36/13932`, no improvement over frontend
    ADP `7502`.  Verilog:
    `student/work/ex200_ex299_frontend_refgap_round9_20260612_1851/fp8-core-r9/ex246/verilog/ex246_semantic_mul_threshold_norm.v`;
    AIG:
    `student/work/ex200_ex299_frontend_refgap_round9_20260612_1851/fp8-core-r9/ex246/aigs/ex246_semantic_mul_threshold_norm_synth_preset_aig.aig`;
    log:
    `student/work/ex200_ex299_frontend_refgap_round9_20260612_1851/fp8-core-r9/ex246/logs/ex246_semantic_mul_threshold_norm_synth_preset_aig.official_evaluate.log`.
  - `ex246|E5M2FN packed multiply|semantic-key cofactor residual logic|shared special-case shell with exponent-sum/product-key output cofactors|yosys_synth_preset_aig_official_evaluate|exact_e5m2fn_mul_high_times_low|cofactored_output_bits`:
    official `evaluate.py` OK, `386/26/10036`, no improvement over frontend
    ADP `7502`.  Verilog:
    `student/work/ex200_ex299_frontend_refgap_round9_20260612_1851/fp8-core-r9/ex246/verilog/ex246_semantic_mul_key_bdd_exp_then_product.v`;
    AIG:
    `student/work/ex200_ex299_frontend_refgap_round9_20260612_1851/fp8-core-r9/ex246/aigs/ex246_semantic_mul_key_bdd_exp_then_product_synth_preset_aig.aig`;
    log:
    `student/work/ex200_ex299_frontend_refgap_round9_20260612_1851/fp8-core-r9/ex246/logs/ex246_semantic_mul_key_bdd_exp_then_product_synth_preset_aig.official_evaluate.log`.
  - Outcome: evaluated no improvement. Threshold form is too deep; cofactor
    form is exact but loses the compact sharing of the product-class seed12
    source.  Next action: future work should seek a lower-area delay-21/22
    product representation rather than another product-code completion sweep.

- 2026-06-12 Round12 fp8-bound-r12 checkpoint result:
  - Tested method_signature `ex246|E5M2FN packed multiply|product-low-first semantic-key BDD output grouping|shared sign xor exponent sum and product-key BDD roots|yosys_synth_preset_aig_official_evaluate|exact_e5m2fn_mul_high_times_low|product_low_to_exp_output_bits`.
  - Official `evaluate.py` result: `OK 595/31/18445`, no improvement over
    current frontend ADP `7502`.
  - Paths: Verilog
    `student/work/ex200_ex299_frontend_refgap_round12_20260612_2015/fp8-bound-r12/ex246/verilog/ex246_semantic_mul_key_bdd_product_low_then_exp.v`;
    AIG
    `student/work/ex200_ex299_frontend_refgap_round12_20260612_2015/fp8-bound-r12/ex246/aigs/ex246_semantic_mul_key_bdd_product_low_then_exp_synth_preset_aig.aig`;
    official log
    `student/work/ex200_ex299_frontend_refgap_round12_20260612_2015/fp8-bound-r12/ex246/logs/ex246_semantic_mul_key_bdd_product_low_then_exp_synth_preset_aig.official_evaluate.log`.
  - Diagnostic: product-low-first output-bit BDD grouping destroys the compact
    seed12 product-class sharing; do not repeat this key ordering unchanged.

- 2026-06-12 Round18 fp8-source-r18 checkpoint:
  - status: `BLOCKED_NO_CANDIDATE`.
  - evidence: `student/work/ex200_ex299_frontend_refgap_round18_20260612_2321/fp8-source-r18/ex246/notes/round18_checkpoint_blocked_no_candidate.md`.
  - shard CSVs: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round18_20260612_2321/agent_shards/fp8-source-r18/`.
  - summary: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round18_20260612_2321/agent_summaries/fp8-source-r18.md`.
  - outcome: no new materially distinct source was ready before checkpoint, and no official `evaluate.py` row is claimed. Moved immediately to `ex247` per checkpoint instruction.
  - next action: build a fresh product-class source sharing exponent-sum, significand product, rounding/sticky, underflow, and saturation predicates with only compact residual boundary tables. Do not replay round16 threshold/sigpair/sigprod/grouped/direct-residual families or the round17 blocker-only pattern.

## 2026-06-13 Round22 float-fp8-r22 completion checkpoint

- Candidate: `ex246_r22_product_seed12_replay`.
- method_signature: `ex246|E5M2FN packed multiply|round22 product-class seed12 replay|shared sign xor exponent sum significand product and product_mag class decode|yosys_synth_flatten_abc_g_aig_official_evaluate|exact_e5m2fn_mul_high_times_low|product_class_magnitude_outputs`.
- Official `evaluate.py` result: `OK 341/22/7502`; improved frontend `0`; beats reference `0`.
- Paths: Verilog `student/work/ex200_ex299_frontend_refgap_round22_20260613_0218/float-fp8-r22/ex246/verilog/ex246_r22_product_seed12_replay.v`; AIG `student/work/ex200_ex299_frontend_refgap_round22_20260613_0218/float-fp8-r22/ex246/aigs/ex246_r22_product_seed12_replay.aig`; official log `student/work/ex200_ex299_frontend_refgap_round22_20260613_0218/float-fp8-r22/ex246/logs/ex246_r22_product_seed12_replay.official_evaluate.log`; diagnostic `student/work/ex200_ex299_frontend_refgap_round22_20260613_0218/float-fp8-r22/ex246/notes/round22_ex246_diagnostic.md`.
- Outcome: equivalent but low-value; it ties the current frontend best and remains above reference ADP `2805`. Future ex246 work should avoid product-code completion replay and seek a genuinely new arithmetic encoding or lower-area delay-21/22 representation.

## 2026-06-13 Targeted Probe r24

- Campaign: `student/frontend_campaigns/campaigns/ex246_ex247_frontend_targeted_probe_20260613_0351/`.
- Tested two materially source-level variants around the exact E5M2FN multiply
  hypothesis:
  - `ex246|E5M2FN packed multiply|seed12 unreachable product effective-map before reachable product-class decode|shared sign exponent significand product effective-map and product-class magnitude|multi_yosys_official_evaluate|exact_e5m2fn_mul_high_times_low|effective_product_class_magnitude`.
  - `ex246|E5M2FN packed multiply|parallel-case seed12 product-class magnitude table|shared sign exponent significand product and parallel product-class magnitude decode|multi_yosys_official_evaluate|exact_e5m2fn_mul_high_times_low|parallel_product_class_magnitude`.
- Official `evaluate.py` coverage: 12/12 ex246 candidate/synth rows were `OK`.
  Best observed row was
  `ex246_r24_product_parallel_seed12_synth_preset_aig`, `341/22/7502`,
  with Verilog
  `student/work/ex246_ex247_frontend_targeted_probe_20260613_0351/local-targeted/ex246/verilog/ex246_r24_product_parallel_seed12_synth_preset_aig.v`,
  AIG
  `student/work/ex246_ex247_frontend_targeted_probe_20260613_0351/local-targeted/ex246/aigs/ex246_r24_product_parallel_seed12_synth_preset_aig.aig`,
  and official log
  `student/work/ex246_ex247_frontend_targeted_probe_20260613_0351/local-targeted/ex246/logs/ex246_r24_product_parallel_seed12_synth_preset_aig.evaluate.py.log`.
- Outcome: no frontend improvement. Effective-product indirection worsened to
  `355/24/8520` at best, while the parallel-case seed12 table only reproduced
  the current `341/22/7502` best. Do not repeat product effective-map or
  parallel-case seed12 source forms unless the high-level product/rounding
  decomposition changes substantially.

## 2026-06-13 Round25 fp8-r25

- Campaign: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round25_20260613_0506/agent_shards/fp8-r25/`.
- Tested method family: `ex246|E5M2FN packed multiply|direct low-boundary product attributes without seed12 completion|shared sign exponent product boundary attrs and direct low mags|yosys_multi_official_evaluate|exact_e5m2fn_mul_high_times_low|direct_low_boundary_product_output`.
- Official `evaluate.py` rows: `0/2` OK.
- Outcome: no equivalent candidate; see shard `evaluation_results.csv` and logs.
- Next action: `debug official non-equivalence before any QoR claim`.

## 2026-06-13 Round25 fp8-worst-r25

- Campaign: `student/frontend_campaigns/campaigns/ex240_ex299_frontend_gt2_round25_20260613_0531/agent_shards/fp8-worst-r25/`.
- Families tested:
  - truth-derived shared ROBDD over interleaved high/low FP8 operand bits;
  - current frontend-best source replay with alternate Yosys/AIG mapping.
- Official `evaluate.py` rows: `3/3` OK.
- Best observed: `ex246_resynth_abc_g_aig`, `354/24/8496`; worse than current frontend `341/22/7502` and reference `2805`.
- BDD fallback: `998/21/20958`; delay is acceptable but area is far too high.
- Paths: summary `student/frontend_campaigns/campaigns/ex240_ex299_frontend_gt2_round25_20260613_0531/agent_summaries/fp8-worst-r25.md`; evaluation CSV `student/frontend_campaigns/campaigns/ex240_ex299_frontend_gt2_round25_20260613_0531/agent_shards/fp8-worst-r25/evaluation_results.csv`; dossier `student/work/ex240_ex299_frontend_gt2_round25_20260613_0531/fp8-worst-r25/ex246/notes/high_level_dossier.md`.
- Outcome: no frontend improvement. Next action is a new product/rounding encoding beyond seed12 product-code completion and source replay.


## 2026-06-13 Round26 fp8-r26

- Campaign: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round26_20260613_0539/agent_shards/fp8-r26/`.
- Best official candidate in this shard: `` `//`.
- Current frontend baseline used by this worker: `7502`; reference ADP `2805`.
- Outcome: improved frontend `0`; beats reference `0`.
- Evidence: ``.
- Next action: Debug non-equivalence or choose a different representation family.


## 2026-06-13 Round26 fp8-r26

- Campaign: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round26_20260613_0539/agent_shards/fp8-r26/`.
- Best official candidate in this shard: `ex246_r26_qclass_seed12_synth_preset_aig` `371/24/8904`.
- Current frontend baseline used by this worker: `7502`; reference ADP `2805`.
- Outcome: improved frontend `0`; beats reference `0`.
- Evidence: `student/work/ex200_ex299_frontend_refgap_round26_20260613_0539/fp8-r26/ex246/logs/ex246_r26_qclass_seed12_synth_preset_aig.evaluate.py.log`.
- Next action: Try a new high-level representation; do not repeat this r26 source as-is.

## 2026-06-13 Round60 sub-ex246-ex247-r60

- Campaign: `student/frontend_campaigns/campaigns/frontend_source_parallel_round60_20260613_0825/`.
- Recording-guided frontend-only/source-only mixed RTL tried: shared product/sigpair rounding predicates beyond product-code replay and direct field decode.
- Official `evaluate.py` rows: `4/4` equivalent for ex246.
- Best observed: `ex246_r60_sigpair_round_predicates_default`, `440/28/12320`.
- Current frontend best remains `328/21/6888`; reference `2805`.
- Evidence: `student/frontend_campaigns/campaigns/frontend_source_parallel_round60_20260613_0825/agent_shards/sub-ex246-ex247-r60/evaluation_results.csv`.
- Outcome: no frontend-best improvement. Do not repeat sigpair round predicates unchanged; next attempt needs a genuinely new product/rounding encoding or compact selected-bit residual.

## 2026-06-13 Round62 sub-fp8-muldiv-r62

- Campaign: `student/frontend_campaigns/campaigns/frontend_source_parallel_round62_20260613_0907/`.
- Source-only families tried: product-class small residual pattern and semantic-key cofactor output grouping.
- Official `evaluate.py` rows: `4/4` equivalent for ex246.
- Best observed: `ex246_r62_product_class_smallpat_semantic_synth_preset_aig`, `371/24/8904`.
- Current frontend best remains `328/21/6888`; reference `2805`.
- Evidence: `student/frontend_campaigns/campaigns/frontend_source_parallel_round62_20260613_0907/agent_shards/sub-fp8-muldiv-r62/evaluation_results.csv`.
- Outcome: no frontend-best improvement. Do not repeat product-class smallpat semantic source unchanged; next useful direction is a lower-area delay-21/22 product representation.


## 2026-06-13 Round64 sub-fp8-muldiv-alt-r64

- Campaign: `student/frontend_campaigns/campaigns/frontend_source_parallel_round64_20260613_1004/`.
- method_signature: `ex246|E5M2FN packed multiply|product zone lattice|shared product boundaries and packed low residual magnitudes|yosys_rtl_official_evaluate|exact_e5m2fn_mul_high_times_low|product_zone_lattice|synth_preset_aig`.
- Official result: `OK 350/32/11200`; improved frontend `no`; beats reference `no`.
- Paths: Verilog `student/work/frontend_source_parallel_round64_20260613_1004/sub-fp8-muldiv-alt-r64/ex246/verilog/ex246_r64_product_zone_lattice.v`; AIG `student/work/frontend_source_parallel_round64_20260613_1004/sub-fp8-muldiv-alt-r64/ex246/aigs/ex246_r64_product_zone_lattice_synth_preset_aig.aig`; log `student/work/frontend_source_parallel_round64_20260613_1004/sub-fp8-muldiv-alt-r64/ex246/logs/ex246_r64_product_zone_lattice_synth_preset_aig.evaluate.py.log`.
- Next action: keep the exact result as a recorded non-winning source-only family; move to a different high-level decomposition unless the coordinator wants to mine this lattice for a smaller shared residual.


## 2026-06-13 Round65 sub-fp8-codearith-r65

- Campaign: `student/frontend_campaigns/campaigns/frontend_source_parallel_round65_20260613_1029/`.
- Source-only code-arithmetic families tried for `ex246`; official `evaluate.py` was the only acceptance check.
- Best observed: `ex246_r65_mul_boundary_residual_sop_synth_preset_aig` `359/31/11129`.
- Current frontend/reference used by this shard: `6888` / `2805`.
- Outcome: no frontend-best improvement; beats reference `no`.
- Evidence: shard evaluation CSV `student/frontend_campaigns/campaigns/frontend_source_parallel_round65_20260613_1029/agent_shards/sub-fp8-codearith-r65/evaluation_results.csv`; dossier `student/work/frontend_source_parallel_round65_20260613_1029/sub-fp8-codearith-r65/ex246/notes/high_level_dossier.md`.
- Next action: keep as recorded source-only evidence; do not repeat unchanged without a new code or residual decomposition.

## 2026-06-13 14:51 +0800 Round74 sub-fp8-muldiv-r74

- Campaign: `student/frontend_campaigns/campaigns/frontend_source_parallel_round74_20260613_1439/`.
- Tested two source-only exact table families for the E5M2FN packed multiply hypothesis:
  - `ex246|E5M2FN packed multiply high byte times low byte|sigpair plus exponent-sum exact magnitude table|shared sign xor effective exponent and 3-bit significand pair keys|repo_yosys_frontend_default|official_evaluate|full_word`.
  - `ex246|E5M2FN packed multiply high byte times low byte|split exponent and mantissa tables over product/exponent key|shared product and exponent-sum with separated output clusters|repo_yosys_frontend_default|official_evaluate|exp_mant_split`.
- Official `evaluate.py` rows: `2/2` equivalent. Best observed: `ex246_r74_sigpair_exp_mag_table` `553/19/10507`.
- Current frontend/reference used by this shard: `6888` / `2805`.
- Outcome: no frontend-best improvement; beats reference `no`.
- Evidence: shard CSV `student/frontend_campaigns/campaigns/frontend_source_parallel_round74_20260613_1439/agent_shards/sub-fp8-muldiv-r74/evaluation_results.csv`; best log `student/work/frontend_source_parallel_round74_20260613_1439/sub-fp8-muldiv-r74/ex246/logs/ex246_r74_sigpair_exp_mag_table.evaluate.py.log`.
- Next action: this lowered delay to 19 but area dominated; future work needs a lower-area delay-21/22 product representation rather than broad sigpair/exp tables.

## 2026-06-13 15:07 +0800 Round75 sub-fp8-worst-r75

- Campaign: `student/frontend_campaigns/campaigns/frontend_source_parallel_round75_20260613_1507/`.
- Dossier: `student/work/frontend_source_parallel_round75_20260613_1507/sub-fp8-worst-r75/ex246/notes/high_level_dossier.md`.
- Source-only families tried: selected output-cluster grafts from alternate exact source families, keeping the compact semantic shell and rebuilding complementary PO clusters before Yosys.
- Official `evaluate.py` equivalent rows: `2/4`.
- Best observed: `ex246_r75_shell_mant2_cluster` `355/24/8520`.
- Current frontend/reference used by this shard: `6888` / `2805`.
- Outcome: no frontend-best improvement.
- Evidence: shard CSV `student/frontend_campaigns/campaigns/frontend_source_parallel_round75_20260613_1507/agent_shards/sub-fp8-worst-r75/evaluation_results.csv`.
- Next action: avoid repeating these exact output-cluster grafts; useful follow-up needs a genuinely smaller shared predicate or shorter semantic shell.


## 2026-06-13 17:23:44 +0800 Round76 sub-fp8-worst-r76

- Campaign: `frontend_source_parallel_round76_20260613_1706`.
- Dossier: `student/work/frontend_source_parallel_round76_20260613_1706/sub-fp8-worst-r76/ex246/notes/high_level_dossier.md`.
- Source-only families tried:
  - `ex246_r76_field_pair_product_case`: `ex246|E5M2FN_multiply_can_be_represented_by_signed_magnitude_field_pair|one_vector_case_over_sign-xor_and_two_7-bit_magnitudes|shared_sign_xor_and_magnitude-pair_descriptor|repo_yosys_frontend_default|exact_e5m2fn_mul_high_times_low|full_word`.
  - `ex246_r76_exp_sum_sigprod_desc`: `ex246|E5M2FN_multiply_output_is_driven_by_exponent_sum_and_significand_product|one_vector_case_over_special_flags_exponent-sum_and_sig-product|shared_special_shell_sign_xor_exponent_sum_and_product_descriptor|repo_yosys_frontend_default|exact_e5m2fn_mul_high_times_low|full_word`.
- Best official candidate: `ex246_r76_exp_sum_sigprod_desc` `1394/32/44608`.
- Current frontend/reference used by this shard: `6888` / `2805`.
- Outcome: frontend improvement `0`; beats reference `0`.
- Evidence: shard CSV `student/frontend_campaigns/campaigns/frontend_source_parallel_round76_20260613_1706/agent_shards/sub-fp8-worst-r76/evaluation_results.csv`.
- Next action: do not expand these descriptor tables further if they remain area dominated; look for smaller boundary formulas.

## 2026-06-13 17:44:36 +0800 Round77 sub-fp8-worst-source-r77

- Campaign: `frontend_source_parallel_round77_20260613_1733`.
- Dossier: `student/work/frontend_source_parallel_round77_20260613_1733/sub-fp8-worst-source-r77/ex246/notes/high_level_dossier.md`.
- Source-only families tried: current-best source copy control, selective `keep` on product/exp semantic wires, assign-vs-case output mux rewrite, and flattenable boundary-core wrapper.
- Official `evaluate.py` rows: `4/4` equivalent.
- Best official candidate: `ex246_r77_keep_semantic_wires`, `351/24/8424`.
- method_signature: `ex246|E5M2FN_packed_multiply_high_byte_times_low_byte|selective_keep_semantic_wires|semantic_decode/product/boundary_wires_marked_keep|repo_yosys_frontend_default|official_evaluate|full_word`.
- Current frontend/reference used by this shard: `6888` / `2805`.
- Outcome: frontend improvement `0`; beats reference `0`.
- Evidence: shard CSV `student/frontend_campaigns/campaigns/frontend_source_parallel_round77_20260613_1733/agent_shards/sub-fp8-worst-source-r77/evaluation_results.csv`; best log `student/work/frontend_source_parallel_round77_20260613_1733/sub-fp8-worst-source-r77/ex246/ex246_r77_keep_semantic_wires/logs/ex246_r77_keep_semantic_wires.evaluate.py.log`.
- Next action: selective `keep` helped relative to this shard's source-copy control but remains above current frontend; future work needs a lower-area delay-21/22 product representation, not output mux style.

## 2026-06-14 12:29:00 +0800 fp8-tail-transfer-r2

- Campaign: `student/frontend_campaigns/campaigns/ex204_ex299_frontend_continuation_20260614_1216/agent_shards/fp8-tail-transfer-r2/`.
- Frontend-only families tried: seed12 product-tail direct attributes, product low-residual overlay, and current/tail output cone mix.
- Official `evaluate.py` rows: `3/3` equivalent. Best observed: `ex246_r2_tail_product_attr_direct_abc_g_aig_frontend` `371/31/11501`.
- Current frontend/reference used by this shard: `7502` / `2805`; improved frontend `0`; beats reference `0`.
- Evidence: `student/work/ex204_ex299_frontend_continuation_20260614_1216/fp8-tail-transfer-r2/ex246/verilog/ex246_r2_tail_product_attr_direct_abc_g_aig_frontend.v`, `student/work/ex204_ex299_frontend_continuation_20260614_1216/fp8-tail-transfer-r2/ex246/aigs/ex246_r2_tail_product_attr_direct_abc_g_aig_frontend.aig`, `student/runs/float_fp8/ex204_ex299_frontend_continuation_20260614_1216/fp8-tail-transfer-r2/ex246/logs/ex246_r2_tail_product_attr_direct_abc_g_aig_frontend.evaluate.py.log`.
- Next action: do not repeat product-tail attr, low-overlay, or current/tail cone mix unchanged; ex246 still needs a genuinely lower-area delay-21/22 product representation.

## 2026-06-14 13:00:25 +0800 fp8-source-compress-r3

- Campaign: `student/frontend_campaigns/campaigns/ex204_ex299_frontend_continuation_20260614_1216/agent_shards/fp8-source-compress-r3/`.
- Frontend-only families tried: seed12 product-class source recoded as product-major `exp_sum` output windows, and seed12 output-plane predicates over shared `exp_sum/product`.
- Official `evaluate.py` rows: `2/2` equivalent. Best observed: `ex246_r3_seed12_output_plane_bits_abc_g_aig` `465/24/11160`.
- Current frontend/reference used by this shard: `7502` / `2805`; improved frontend `0`; beats reference `0`.
- Evidence: Verilog `student/work/ex204_ex299_frontend_continuation_20260614_1216/fp8-source-compress-r3/ex246/verilog/ex246_r3_seed12_output_plane_bits_abc_g_aig.v`; AIG `student/work/ex204_ex299_frontend_continuation_20260614_1216/fp8-source-compress-r3/ex246/aigs/ex246_r3_seed12_output_plane_bits_abc_g_aig.aig`; log `student/runs/float_fp8/ex204_ex299_frontend_continuation_20260614_1216/fp8-source-compress-r3/ex246/logs/ex246_r3_seed12_output_plane_bits_abc_g_aig.evaluate.py.log`.
- Next action: do not repeat product-major output windows or output-plane seed12 predicates unchanged; both lose the compact area/delay balance of the seed12 current best.
