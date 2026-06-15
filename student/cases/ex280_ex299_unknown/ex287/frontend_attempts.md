# ex287 Frontend Attempts

## Current Best

- Current best frontend: `ex287_interleave_f00_k5_abc_g_aig`, area `1832`, delay `15`, ADP `27480`.
- Reference: ADP `5782`.
- Gap: `4.75x` reference ADP.

## Already Tried

- Tried generic unknown variants: `value_case`, `expr_default_exception`, `high_split_default`, `low_split_default`, `rotate_high_split_default`, `rotate_low_split_default`, `decision_tree_greedy`.
- Top results: `decision_tree_greedy:34827`; `rotate_high_split_default:35790`; `rotate_low_split_default:35790`; `low_split_default:104754`; `value_case:210254`.
- Algebraic/ANF/Davio/support-LUT candidates exist under `student/work/reverse_unknown_algebraic_20260603_2305_algebraic_safe/ex287`, but they are not the current tracked best.
- 2026-06-08 diagnostic shared-BDD run: official `evaluate.py` OK; interleave BDD was `1829/21/38409`, worse than current decision tree.
- 2026-06-08 current structural synthflow run: official `evaluate.py` OK for all variants; `synth_preset` improved to `1743/18/31374`.
- 2026-06-08 symmetry-canonical BDD run: exact `swap_in_4_5` canonical key was verified with official `evaluate.py`; best was `1768/19/33592`, close but worse than current.
- 2026-06-08 symmetry-BDD synthflow run: official `evaluate.py` OK; `synth_preset` improved current best to `1723/18/31014`.
- 2026-06-08 secondary symmetry-BDD synthflow run: official `evaluate.py` OK; all tested delay/gate-set variants were worse than `synth_preset`.
- 2026-06-08 selected-bit hybrid run: replacing one output bit at a time from the symmetry-BDD source with the structural decision-tree source was exact for recovered rows `primary_0..6`, but best was only `1814/19/34466`; the sweep was stopped before `primary_7` because all completed rows regressed.
- 2026-06-09 symmetry cofactor class-onehot run: top-3/4/5 interleave cofactor/class-onehot rows were official exact; best `interleave_f00_k4` was `1755/18/31590`, close but worse than current `1723/18/31014`.
- 2026-06-09 multi-pair symmetry diagnostic found exact input symmetries `(4,5)`, `(6,7)`, and `(8,9)`.
- 2026-06-09 multi-pair symmetry cofactor class-onehot run: official exact; raw best `1845/15/27675`, and limited `abc_g_aig` improved current to `1832/15/27480`.
- 2026-06-09 raw multi-pair BDD and direct ANF low-support bit extraction were official exact but worse; ANF extraction had very high delay.
- 2026-06-09 popcount semantic diagnostic: verified `popcount(out) == popcount(in)` for all `16384` truth rows. This points to a conservative token-routing / controlled-swap style structure. Pure compare-exchange is rejected because the function is not bitwise monotone; transferred mux-coordinate degree-2/3 solved zero bits; weighted-sum best matched only `58/16384`; quadratic-at-origin residual BDD grew from `1088` to `2781` nodes; popcount-layer BDD node sum was `10785`, worse than raw.
- 2026-06-09 conservative-routing diagnostics: no exact `total_count + interval_count` output-bit predicates, most output bits have full support, and there is no direct width embedding into ex288. This keeps the conservative/token-routing clue alive but rejects simple count-boundary or one-bit recurrence forms.
- 2026-06-09 selector transfer check: outer bits `(0,1,10,11)` reduced diagnostic nodes relative to k4 default, but official replay was `1648/18/29664`, worse than current `1832/15/27480`.
- 2026-06-09 bounded token-routing diagnostics: global rotation/reflection, radius<=4 local line/ring rules, prefix-balance transducers with lookahead<=6, and rank-context maps all had large conflicts; no exact compact token-routing RTL form was found.
- 2026-06-09 nested selector-tree mux replay of the current multi-pair cofactor source was official exact but worse (`1847/18/33246`).
- 2026-06-09 `synth_preset` replay of selector `(0,1,10,11)` was official exact but worse (`1699/18/30582`) than current `27480`.
- 2026-06-09 low-weight/semantic probes rejected weighted data-dependent rotate, low-degree one-hot position polynomial, and hidden unate comparator polarity as large-drop structures.
- 2026-06-09 popcount-layer diagnostic: layer outputs are many-to-one but not small canonical placements; middle layers have `427/445/422` unique outputs for `w6/w7/w8`. No output pair implication/equality constraints were found.
- 2026-06-09 pair-count MDD source was official exact but worse. Two-pair smoke best was `2468/21/51828`; correct three-pair `reverse` improved to `1771/20/35420`, and limited `synth_preset` reached only `1723/19/32737`, still worse than current.
- 2026-06-09 conservative big-jump diagnostic: output-state insertion recurrence is not exact (`natural` order has `2237` conflicts); small-slot matching/parking is not compact (`cap8` still fails `4798/16384` rows); generalized symmetry gives only the known invariant swaps `(4,5)`, `(6,7)`, `(8,9)`; simple layer-rank maps match only tiny fractions; independent 4-bit block scatter misses `16242/16384` rows; simple prefix/suffix count transport tops out at `9297/16384`.
- 2026-06-09 pair-interaction diagnostic: two-hot output matrices have some low-rank bits (`2/4/6/8/10`), but two-hot behavior is not determined by the one-hot output-slot pair (`47` slot-pair conflicts). Degree-2-from-low-weight formulas match only about half the full table, and checked residual BDDs are larger than raw bit BDDs. No seed was emitted.
- 2026-06-09 top-k/layer diagnostic: simple top-k score families were very weak; best full-table match was only `107/16384`. Complement/reverse duality was not exact (`464/16384` best tested variant).
- 2026-06-09 conservation-law diagnostic: mod `2/3/5/7` linear invariant nullity was `1`; the only linear conserved quantity is global popcount, so independent block/lane conservation is not the missing structure.
- 2026-06-09 count-coordinate diagnostic: prefix/suffix/interval count predicates solved no output bits; best matches were about `10432/16384`, not strong enough for selected-bit RTL.
- 2026-06-09 cross-width embedding diagnostic: ex287 into ex288 found only output bit 7 as a direct fixed-bit restriction; too little structure for source transfer.
- 2026-06-09 low-delay symcof replay: `interleave_f00_k6` was exact and reached `2077/14/29078` after `abc_g_aig`, worse than current `27480`. D14-D17 tied the same row.
- 2026-06-09 scan residual diagnostic: prefix residual classes compressed mostly by known pair symmetries and output many-to-one behavior, not a small scan/transducer state space. Center order looked smaller in mid-prefix counts but exact replay was far worse.
- 2026-06-09 center-order symcof replay: custom order `6,7,5,8,4,9,3,10,2,11,1,12,0,13` was official exact for 12/12 rows, but best was only `12142/20/242840`.
- 2026-06-09 LTF diagnostic: raw and pair-canonical linear-threshold features solved no output bits; best match was only `9875/16384` (`bit7 rawpm`), too weak for threshold RTL.
- 2026-06-09 parking/preference diagnostic: static greedy parking/open-addressing using one-hot home slots, two-hot preference slots, multiple token orders, and reverse/rotate output transforms was far from exact. Best full-row match was only `117/16384` (`home_reverse`, `pair_freq`, identity), bit match ratio `0.539873`, so no RTL seed was emitted.
- 2026-06-09 bucket-count classifier: output is exactly determined by `7` one-hot-derived bucket counts plus selector bits `xor6_7:xor8_9:raw13:raw12` (`16`-bit key, `6912` mapped keys). The flat exact `case(key)` RTL was official exact, but area exploded; best limited synthflow row was `20131/23/463013`, far worse than current. Keep the count-key decomposition as a clue, but do not reuse the flat table emitter.
- 2026-06-09 bucket-count table decomposition follow-up: invalid-key `default x` and per-output-bit table emitters were official exact but still area-explosive. Best `case_defaultx` was `20106/24/482544`; `perbit_defaultx` was `35587/22/782914`. The next attempt must decompose the count-key function, not change the table wrapper.
- 2026-06-09 bucket-key BDD: shared BDD over the exact bucket-count key domain found best `selectors_first` order with `6322` nodes and official exact `7852/27/212004` after `abc_g_aig`. This is much smaller than flat table but still `7.71x` worse than current ADP.
- 2026-06-09 bucket-key formula diagnostic: primitive count/selector predicates solved no output bits, depth-4 greedy primitive trees solved no bits, and key-domain ANF had `17088..29876` terms with max degree up to `16`. No seed emitted.
- 2026-06-09 bucket-key sampled cube-cover diagnostic: invalid-key don't-care expansion found sampled cubes covering up to `192` on-keys with `5` literals, giving lower-bound cube counts `18..48`. This is not a complete cover and no seed was emitted; it only suggests an optimized exact cover could be checked later.
- 2026-06-09 split-domain duality diagnostic: tested ex289-like half-domain self-reductions over complement/reverse/input split transforms and output complement/reverse/pair-swap transforms. Best was only `228/8192` matches (`split0`, `comp_all`, identity), no exact relation. ex289 sanity in the same run passed.
- 2026-06-09 bucket-count LTF diagnostic: over exact bucket counts, selected disambiguation bits, and pairwise count differences, perceptron training solved no output bits; best was bit 5 with `9045/16384` matches. No seed emitted.
- 2026-06-09 bucket field-support greedy diagnostic: all output bits become exact only after essentially the full bucket/selector field set (`11` fields, `6912` keys). This rejects a small field-support split of the exact bucket-key function.
- 2026-06-09 cofactored pair-count MDD diagnostic: best row was `reverse k6`, `56` classes, `4711` MDD nodes, not a promising reduction relative to the current cofactor BDD path. No seed emitted.
- 2026-06-09 semantic big-jump diagnostic: iterative application has many nontrivial cycles, so it is not a normalizer; prefix-threshold BDDs were much larger (`17602` nodes vs `3872` direct nodes); slot arithmetic still matched only `58/16384`.
- 2026-06-09 rank/linear diagnostic: GF(2) input/output relation nullity was `1`, so only global parity is available for XOR repair. Layer rank-affine scans found no strong relation.
- 2026-06-09 cofactor ANF diagnostic: current cofactor groups have `12916` total ANF terms, per-group `293..553`, max bit `85` terms, max degree `8`. This is too large to replace BDD groups with ANF.
- 2026-06-09 low-support key-BDD selected-bit hybrid: emitted bits `6/7` from one shared BDD over the canonical symmetry key and skipped them in the class-onehot cofactor groups. The source was official exact, but limited `abc_g_aig` replay was `1856/15/27840`, worse than current `1832/15/27480`.
- 2026-06-09 bucket top-k score diagnostic: trained score-and-top-k models over exact bucket counts/selectors. Best full diagnostic matched only `87/16384` rows, so no comparator/top-k RTL seed was emitted.
- 2026-06-09 delta insertion diagnostic: adding input bit 6/7 has only `26` unique output deltas, but output-only insertion remains conflicted; best output-key conflict count was `388`, and best delta BDD node count was `1103`. No compact token-insertion recurrence was found.
- 2026-06-09 streaming prefix diagnostic: tested natural/reverse/center/onehot-slot input/output orders with lookahead up to `6`. No row determined even the first output prefix exactly; best majority row was `onehot_slot->reverse+L6` with `0.777745` majority ratio and `7298` worst conflicts. No FSM/transducer RTL seed emitted.
- 2026-06-09 transform ANF residual diagnostic: tested raw, pair-key, prefix/suffix natural/reverse/onehot-slot coordinate transforms with degree `1/2/3` ANF extraction. No low-degree exact bits were found, and best residual/raw BDD node ratio was only `0.999890`, too small to justify RTL emission.
- 2026-06-09 finite collision/algebra diagnostic: hidden labels such as `home_mod8`, `home_occ`, and exact-symmetry labels can memorize all two-hot rows (`91/91`), but the shared pair-correction XOR superposition matches only `604/16384` full rows with bit accuracy `0.560268`. Symmetric modular affine pair rules are weaker (`9/91` best). No RTL seed emitted.
- 2026-06-09 static-feature controlled-swap sampled diagnostic: raw-bit, symmetry-pair, bucket/prefix/suffix count controls did not produce a strong routing lead. After 12 greedy mux-swap layers, best sample mismatch was `1386/1436` from identity and `1390/1436` from pair-canonical start. No RTL seed emitted.
- 2026-06-09 bucket-count prefix/layout diagnostic: tested whether exact bucket counts plus selectors form a histogram-to-output layout using bucket/output orders and selector-controlled offsets. Best was only `71/16384` rows (`bucket_segment`, `slot_asc`, `onehot_slots_first`) with bit match `0.536682`, so no layout RTL seed emitted.
- 2026-06-09 Gray-layer order diagnostic: tested BRGC-filtered, bit-reversed Gray, and related same-popcount layer orders with per-layer shift/affine/direct rank transforms. Best was only `121/16384` rows (`affine`, `rev_brgc_index->rev_brgc_index`) with bit match `0.536726`; no rank-successor RTL seed emitted.
- 2026-06-09 input/output coordinate ANF diagnostic: added output-coordinate transforms on top of input prefix/suffix/Gray transforms to check for ex280-ex284-style low-degree coordinate collapse. Best was only `1/14` exact transformed bits at degree <=4 (`raw->prefix_natural`), with `30801` total ANF terms; no compressor RTL seed emitted.
- 2026-06-09 bucket-count collision-relaxation diagnostic: treated exact one-hot home bucket counts as initial occupancy and tested parking carry, binary carry, balanced nearest parking, and line/cycle sandpile rules with selector-specific policies. Best was only `97/16384` rows, bit match `0.552080`; no relaxation RTL seed emitted.
- 2026-06-09 image/canonical representative diagnostic: output image has `2609` unique values; exact bucket-key class output is in its own input class only `107/6912` classes, and best min/max representative model matches only `93/6912` classes. This rejects simple canonical representative selection over exact bucket-key classes.
- 2026-06-09 exact bucket-key multi-valued MDD diagnostic: treated the exact bucket counts and selectors as true multi-valued variables instead of binary-encoded key bits. Full-order/policy scan found best `word/reuse_first/domain_asc` with `3198` nonterminal nodes, max width `1919`, `2609` terminals, and `6912` mapped keys. This is not a compact factored source for moving current `27480` toward `1.5x` reference; no RTL seed emitted.
- 2026-06-09 global token-slot matching diagnostic: tested maximum-weight assignment using weights learned from one-hot, two-hot, and low3 rows. Even on the weight<=3 gate, best was only `66/470` rows (`low3_freq`, home bonus `16`, home order, low tie, identity output), so learned matching/preference assignment is not the missing conservative-routing structure. No RTL seed emitted.
- 2026-06-09 fixed-popcount slice polynomial diagnostic: checked whether each output bit is a low-degree GF(2) polynomial on each Hamming-weight layer. Degree<=3 solved only `112/210` layer-bits; degree<=4 improved to `140/210` by covering boundary layers, but central layer `w7` had `0/14` exact output bits even with feature rank `1001`. No slice-polynomial RTL seed emitted.
- 2026-06-09 arbitrary output-linear ANF diagnostic: word-level Mobius/nullspace over output linear combinations found degree<=4 nullity `4/14`, with mod-4 lane parity masks `0x1111:0x2222:0x444:0x888` and term counts `80:102:71:91`. This is a semantic clue, but the ex286 wrapper smoke showed the direct lane-repair source form is too expensive, so no ex287 RTL was emitted.
- 2026-06-09 lane-parity semantic feature-span diagnostic: tested whether the mod-4 output lane parity targets can be expressed more cheaply from input lane parity, home-lane counts, raw pair signals, bucket count bits, or bucket selector bits. Degree 1/2 broad features and degree 3 smaller features solved zero lane targets, so no cheap replacement for the direct ANF cone was found.
- 2026-06-09 output-linear high-degree ANF diagnostic: nullity grows to `8/14` at degree<=8 with mod-8-like masks, but term counts are large (`281..454`), so direct coordinate emission is not a source.
- 2026-06-09 corrected image-constraint and adjacent-pair orientation diagnostic: output image has no degree 1/2 constraints and `21` degree-3 constraints. These constraints show all mixed adjacent output pairs share one orientation bit, exact over the full table. However, pair-count+orientation encoding only reduces raw shared-BDD nodes `1088 -> 1031`, too small for the required ADP drop.
- 2026-06-09 component-wise adjacent-pair orientation diagnostic: all adjacent output pairs are one component, matching the global orientation result. Encoding remains exact but only shrinks raw shared-BDD nodes `1088 -> 1031`, so no RTL seed emitted.
- 2026-06-09 component pair-field split diagnostic: the global orientation bit is very cheap (`35` BDD nodes), but pair-count fields are still the real cost (`998` BDD nodes) and retain full support (`14/14`). This rejects standalone pair-count/orientation encoding as a route from current `4.75x` reference gap to the target.
- 2026-06-09 affine complement-duality diagnostic: base affine/rotate/reverse P/Q search found a stronger near relation than the hand-written reverse scan but still far from exact. Best `id|aff13_1` was `76/212` low-weight sample and `4252/16384` full rows. Known-pair-composed exact-sample hashing found no low-weight exact hit, so no ex289-style half-domain seed was emitted.
- 2026-06-09 bucket moment-coordinate diagnostic: greedy scalar moments `moment_quad:oddmask:selmix_m4:selmix_m3:sel2` were exact (`16384/16384`) but required `6912` keys. Prefix/modulo vector families were not exact. This is not a compact arithmetic decoder.
- 2026-06-09 output pair-count linear diagnostic: mod-101 affine checks over counts, selectors, prefix coordinates, selector products, count quadratics, and count indicators solved zero adjacent pair-count targets (`0/49` target/family exact). No pair-count RTL seed emitted.
- 2026-06-09 output pair-count tiny piecewise diagnostic: bounded min/max/clamp/sum-clip checks solved zero pair-count targets; best was pair_count_6 with `mx2_4:mn2_4`, only `9430/16384`. No seed emitted.
- 2026-06-09 output pair-count cumulative transport diagnostic: prefix-capacity/window transport over exact bucket counts plus selector offsets found no exact formula; best was `prefix_capacity`, bucket `asc`, pair `asc_rot4`, offset `zero`, only `528/16384`. No RTL seed emitted.

## 2026-06-12 Round9 routing-r9

- method_signature: `ex287|hamming_weight_preserving_lossy_routing_normalizer|collision_path_ballot_descriptor|shared_home_collision_path_state|no_synth|blocked_before_verilog|full_word`
- official result: `BLOCKED_NO_VERILOG`; no official `evaluate.py` candidate was run because the dossier found no materially new exact compact descriptor to emit as Verilog.
- paths:
  - dossier: `student/work/ex200_ex299_frontend_refgap_round9_20260612_1851/routing-r9/ex287/high_level_dossier.md`
  - failed shard: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round9_20260612_1851/agent_shards/routing-r9/failed_hypotheses.csv`
  - evaluation shard: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round9_20260612_1851/agent_shards/routing-r9/evaluation_results.csv`
  - summary: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round9_20260612_1851/agent_summaries/routing-r9.md`
- outcome: Dossier confirmed the conservative Hamming-weight-preserving lossy-routing hypothesis and considered a collision-path / ballot-style shared descriptor. Low-weight sanity did not expose an exact path rule: one-hot-home OR/XOR matched only `58/16384` rows and no rows from Hamming-weight layer 4 upward. Emitting an exact fallback would repeat rejected bucket/table or cofactor/symcof families, so no Verilog was generated.
- next action: Treat ex287 as blocked for this round unless a genuinely new nonlinear hidden-state basis appears. Do not continue with table/rank/colex/bucket/cofactor/symcof/Fredkin/token-count/lane-parity variants without a materially different high-level descriptor.

## 2026-06-12 Round9 routing-r9 checkpoint restart

- dossier: `student/work/ex200_ex299_frontend_refgap_round9_20260612_1851/routing-r9/ex287/notes/high_level_dossier.md`
- planned hypotheses:
  - `ex287|hamming_weight_preserving_lossy_routing_normalizer|round9_shared_cofactor_mux|new_selector_basis_output_grouping|official_evaluate|pair_canonical_shared_roots|full_word_grouped_outputs`
  - `ex287|hamming_weight_preserving_lossy_routing_normalizer|round9_anf_shared_roots|shared_monomial_output_groups|official_evaluate|gf2_residual_shared_terms|grouped_outputs`
- official result: pending at dossier time; no Verilog had been emitted before this entry.
- outcome: Dossier keeps the conservative routing hypothesis but commits this restart to two materially different candidate families after ex286: changed shared cofactor/BDD-style mux factoring and GF(2)/ANF shared roots.
- next action: Generate and officially evaluate ex287 candidates after the ex286 priority attempt, then record equivalent/non-equivalent and QoR rows in the routing-r9 shard.

## 2026-06-12 Round9 routing-r9 coordinator correction

- method_signature: `ex287|hamming_weight_preserving_lossy_routing_normalizer|collision_path_ballot_descriptor|shared_home_collision_path_state|no_synth|blocked_before_verilog|full_word`
- official result: `BLOCKED_NO_VERILOG`; no Verilog/AIG candidate was emitted for ex287 in this correction, and no official `evaluate.py` row is claimed.
- paths:
  - dossier: `student/work/ex200_ex299_frontend_refgap_round9_20260612_1851/routing-r9/ex287/notes/high_level_dossier.md`
  - failed shard: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round9_20260612_1851/agent_shards/routing-r9/failed_hypotheses.csv`
  - summary: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round9_20260612_1851/agent_summaries/routing-r9.md`
- outcome: The new collision-path / ballot-style descriptor remains blocked by the dossier and low-weight sanity checks. Unlike ex286, there are no ex287 non-counted symcof/ANF debug artifacts to reconcile.
- next action: Keep ex287 as a blocker for routing-r9 unless a genuinely new nonlinear hidden-state basis appears; do not replay symcof/cofactor, bucket, token-count, lane-parity, or ANF wrapper directions unchanged.

## 2026-06-12 Round10 coordinator-paircount-anf

- method_signature: `ex287|hamming_weight_preserving_lossy_routing_normalizer|paircount_linear_anf_basis_diag|component_pair_count_output_linear_basis|no_synth|blocked_before_verilog|encoded_paircount_coordinates`
- official result: `BLOCKED_NO_VERILOG`; no official `evaluate.py` candidate was run because the diagnostic did not produce a complete low-cost RTL source.
- paths:
  - dossier: `student/work/ex200_ex299_frontend_refgap_round10_20260612_1911/coordinator-paircount-anf/ex287/notes/high_level_dossier.md`
  - summary CSV: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round10_20260612_1911/agent_shards/coordinator-paircount-anf/diagnostics/paircount_linear_anf_summary.csv`
  - basis CSV: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round10_20260612_1911/agent_shards/coordinator-paircount-anf/diagnostics/paircount_linear_anf_basis.csv`
  - failed shard: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round10_20260612_1911/agent_shards/coordinator-paircount-anf/failed_hypotheses.csv`
- outcome: Component pair-count encoded output-linear ANF exposes more partial structure than ex286 but still no complete basis. Pair-count-only nullity reaches `6/14` by degree 6 (`0x141:0x282:0x444:0x888:0x1050:0x20a0`, terms `134:83:38:19:124:65`), leaving too many hard full-support fields.
- next action: Do not repeat partial pair-count coordinate repair. Continue only with a complete nonlinear basis or a constructive shared pair-count generator.

## Do Not Repeat Blindly

- Decision tree and rotated split are close, but both are still far from reference.
- Do not repeat the tested interleave BDD order without a source rewrite.
- Symmetry-canonical BDD plus synthflow is current best; natural/sym_first pair-BDD orders were much worse.
- Do not repeat secondary symmetry-BDD synthflow variants `abc_d20/21/22`, `abc_fast`, `abc_g_simple`, `abc_g_and_mux`, or `synth_preset_noabc`.
- Do not repeat single-bit structural decision-tree overrides on the symmetry-BDD source; recovered exact rows `primary_0..6` were all worse than current best.
- Do not repeat the tested interleave top-3/4/5 symmetry cofactor class-onehot rows without a different sharing strategy; exact but slightly worse than current.
- Do not repeat raw multi-pair BDD or direct ANF selected-bit extraction as tested; cofactor class-onehot plus `abc_g_aig` dominates.
- Try to find common substructure shared across outputs instead of another full decision tree.
- Do not repeat the tested mux-coordinate/quadratic transfer, direct weighted modular sum, quadratic-origin residual BDD, elementary CA sample, combinadic rank map, or popcount-layer BDD forms. The next plausible large-drop path is a non-monotone conservative token-routing / controlled-swap model.
- Do not repeat simple `total_count + interval_count` predicates or direct width insert/delete embedding as tested.
- Do not repeat selector `(0,1,10,11)` in the same source form; lower node count did not improve ADP.
- Do not repeat selector `(0,1,10,11)` with `synth_preset`; exact but still worse.
- Do not repeat nested selector-tree mux for the current cofactor source; exact but delay worsened.
- Do not repeat bounded local/FSM token-routing, weighted rotate, one-hot position polynomial, or hidden-unate comparator forms without a new coordinate transform.
- Do not repeat pair-count MDD in the tested orders or simple `abc_g_aig`/`synth_preset` replay; exact but worse than current.
- Do not repeat output-mask-only insertion recurrences, small candidate-slot matching/parking, generalized swap/output-permutation symmetry scans, simple layer-rank maps, independent 4-bit block scatter, or simple prefix/suffix count transport for ex287; all failed as large-drop structures.
- Do not repeat simple two-hot pair-slot interaction or degree-2-from-low-weight residual BDD as tested; both failed to expose a large-drop source form.
- Do not repeat simple top-k score selection or complement/reverse duality for ex287 as tested; both were far from exact.
- Do not pursue independent block/lane conservation for ex287 without a nonlinear hidden-state idea; only global popcount is linearly conserved.
- Do not repeat count-coordinate single predicates, narrow cross-width direct embedding, or low-delay `f00_k6` synthflow/D-target replay for ex287 as tested; exact but worse or too weak.
- Do not repeat center-order residual/symcof replay for ex287 as tested; residual compression did not translate to BDD/cofactor QoR.
- Do not repeat single-layer LTF/comparator predicates over raw or pair-canonical features for ex287 as tested; no bit was near exact.
- Do not repeat static one-hot/two-hot preference-list parking or open-addressing models for ex287 as tested; they are much farther from exact than seed-worthy.
- Do not repeat flat bucket-count key case-table RTL for ex287; exact but `16.85x` worse than current ADP. Only revisit if the count-key table is structurally decomposed.
- Do not repeat bucket-count `default x` or per-bit key table emitters for ex287; both are exact but worse than the already bad flat table.
- Do not repeat straightforward shared BDD over the bucket-count key for ex287 as tested; selectors-first was best but still far worse than current.
- Do not repeat shallow primitive count/selector formulas, depth-4 greedy primitive trees, or direct key-domain ANF for ex287 as tested.
- Do not rerun the naive full Python cube-cover implementation for ex287; it was too slow. If revisiting cube covers, use a bitset-optimized exact cover.
- Do not pursue tested ex289-style split-domain duality wrappers for ex287; no transform was close to exact.
- Do not repeat simple linear-threshold/comparator formulas over bucket-count semantic features for ex287 as tested.
- Do not repeat bucket field-support split, cofactored pair-count MDD, prefix-threshold BDD, slot arithmetic/rotate, or iterative normalizer as tested for ex287; all failed to expose the reference-scale structure.
- Do not repeat layer-rank affine maps for ex287 as tested.
- Do not repeat direct ANF emission of the current cofactor groups for ex287; term count is too high.
- Do not broaden low-support key-BDD selected-bit hybrids for ex287 as tested; exact bits `6/7` duplicated enough logic to regress ADP.
- Do not pursue simple bucket-count score/top-k routing for ex287 as tested; row matches stayed at tiny fractions of the truth table.
- Do not pursue output-only token insertion recurrence for ex287 as tested; low unique deltas on symmetry-pair bits do not translate to an exact compact update rule.
- Do not pursue small-lookahead streaming prefix/transducer RTL for ex287 as tested; output prefix determinism fails under all tested order/lookahead pairs.
- Do not pursue low-degree ANF residual hybrids for ex287 under the tested raw/pair-key/prefix/suffix transforms; residual BDDs did not meaningfully shrink.
- Do not pursue layer-wise combination-rank/unrank transforms for ex287 as tested; the best layer-rank match was only `15/2002`, with zero exact layers and central Johnson-neighborhood average output distance `5.340`.
- Do not pursue shallow bucket collision/carry formulas for ex287 as tested; single primitives and top-80 two-primitive XOR/AND/OR combinations solved zero output bits, with best bit match only `11040/16384`.
- Do not pursue direct interval-run relocation/superposition for ex287 as tested; next-combination, interval OR/XOR, modular multiply, reversed-domain multiply, and rotate variants were far from exact. Best row match was only `183/16384`.
- Do not pursue simple ex289 restriction/projection transfer for ex287 as tested; order-preserving input embeddings with constants and ordered or one-hot-inferred output projections had zero survivors after zero/one-hot/two-hot sample pruning.
- Do not pursue direct barrel-permutation models for ex287 as tested; fixed rotations, bit-reversal rotations, rotate-by-popcount, and small-control rotates were far from exact. Best row match was only `107/16384`.
- Do not pursue finite pair-collision algebra or modular affine pair rules for ex287 as tested; two-hot memorization does not extend to full-table exactness.
- Do not pursue static-feature controlled-swap networks for ex287 with the tested raw/pair/count controls; sampled mismatch stayed near full sample size.
- Do not pursue simple bucket-count histogram/prefix layout for ex287 as tested; exact count-key structure does not reduce to contiguous/rotated thermometer placement.
- Do not pursue BRGC/bit-reversed Gray same-popcount layer successor or small affine rank transforms for ex287 as tested.
- Do not pursue the tested prefix/suffix/Gray input-output coordinate ANF forms for ex287; only one transformed bit becomes low-degree and the remaining terms stay large.
- Do not pursue simple bucket-count collision relaxation/chip-firing for ex287 as tested; even selector-specific policies are far from exact.
- Do not pursue exact bucket-key multi-valued MDD emission for ex287 as tested; best graph is still `3198` nodes / width `1919`, with thousands of word terminals.
- Do not pursue global token-slot maximum matching learned from low-weight behavior for ex287 as tested; it fails on weight<=3 rows.
- Do not pursue degree<=4 fixed-popcount slice-polynomial RTL for ex287 as tested; the central layer has zero exact output bits.
- Do not expand the simple mod-4 lane parity repair wrapper to ex287 without a cheaper shared parity implementation; ex286 smoke was exact but much worse.
- Do not repeat lane-parity feature-span formulas over the tested semantic feature sets for ex287; no lane target was exact up to the tested degrees.
- Do not pursue adjacent output-pair orientation encoding as a standalone ex287 source; exact but raw BDD node reduction is only about `5%`.
- Do not pursue component-wise adjacent output-pair orientation encoding for ex287 as tested; it is the same small `5%` node reduction.
- Do not pursue component pair-count/orientation field split for ex287 as tested; orientation is cheap but pair-count generation remains full-support and dominant.
- Do not pursue affine/index complement-permutation duality wrappers for ex287 as tested; the best base relation was only `4252/16384`, and the pair-composed exact-sample gate had no hit.
- Do not pursue bucket moment/residue key re-encoding for ex287 as tested; exactness still needs `6912` keys.
- Do not pursue affine/quadratic/count-indicator formulas for ex287 adjacent output pair counts as tested; all finite-field systems were inconsistent.
- Do not pursue tiny min/max/clamp/sum-clip pair-count formulas for ex287 as tested; best match is only `9430/16384`.
- Do not pursue bucket-key min/max canonical representative selection for ex287 as tested; most outputs are not even members of their exact input class.
- Do not pursue cumulative capacity/window transport for ex287 adjacent pair counts as tested; best match is only `528/16384`.

## Sources

- `student/results/unknown_candidates_current_summary.csv`
- `student/results/unknown_candidates_current_best.csv`

## 2026-06-12 Round10 unknown-top-r10

- Dossier: `student/work/ex200_ex299_frontend_refgap_round10_20260612_1911/unknown-top-r10/ex287/notes/high_level_dossier.md`.
- High-level description: 14-bit Hamming-weight-preserving lossy routing/normalizer; no constant outputs; exact input swap symmetries `(4,5)`, `(6,7)`, `(8,9)`; current frontend remains multi-pair symcof/cofactor.
- Families tried:
  - `lane_component_shared_bdd`: exact shared BDD with mod-4 lane/component input order and one global node pool.
  - `mod8_output_linear_anf_residual_bdd`: exact GF(2) mod-8 output-linear parity coordinates with shared monomial bank plus residual BDD roots.
- Method signatures:
  - `ex287|hamming_weight_preserving_lossy_routing_normalizer|lane_component_shared_bdd|mod4_lane_order_single_node_pool|yosys_abc_g_aig|abc_xf_official_evaluate|lane_grouped_output_roots`
  - `ex287|hamming_weight_preserving_lossy_routing_normalizer|mod8_output_linear_anf_residual_bdd|shared_monomial_bank_plus_residual_roots|yosys_abc_g_aig|exact_output_linear_coordinates|mod8_lane_reconstruction`
- Official results: both `evaluate.py` OK. Lane BDD `9363/23/215349`; mod8 ANF residual `5743/204/1171572`.
- Paths: candidates `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round10_20260612_1911/agent_shards/unknown-top-r10/candidates.csv`; logs under `student/work/ex200_ex299_frontend_refgap_round10_20260612_1911/unknown-top-r10/ex287/logs/`.
- Outcome: no improvement over current frontend `27480`. Component/lane BDD order is much worse, and output-linear ANF coordinates are exact but delay-dominated.
- Next action: require a genuinely new nonlinear hidden-state basis before more ex287 Verilog; do not replay pair-count/orientation, bucket-key, lane parity, symcof/cofactor, or ANF wrapper directions unchanged.

## 2026-06-12 Round18 unknown-flow-r18 checkpoint

- method_signature: `ex287|hamming_weight_preserving_lossy_routing_normalizer|round18_partial_descriptor_exact_correction_screen|layer_local_token_descriptor_plus_compact_correction|no_synth|blocked_before_verilog|full_word`
- official result: `BLOCKED_NO_CANDIDATE`; no Verilog/AIG was emitted, so no `evaluate.py` row is claimed.
- paths:
  - dossier: `student/work/ex200_ex299_frontend_refgap_round18_20260612_2321/unknown-flow-r18/ex287/notes/high_level_dossier.md`
  - blocker evidence: `student/work/ex200_ex299_frontend_refgap_round18_20260612_2321/unknown-flow-r18/ex287/diagnostics/ex287_round18_blocker.md`
  - shard CSVs: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round18_20260612_2321/agent_shards/unknown-flow-r18/`
- outcome: The intended partial routing descriptor plus compact exact correction path remains blocked because exact correction collapses to known key-table/MDD/BDD/cofactor or ANF-wrapper scale. Evidence includes `6912` exact bucket keys, `3198` exact bucket-key MDD nodes with width `1919`, and recent official exact lane/ANF alternatives at ADP `215349` and `1171572`.
- next action: Continue only with a genuinely new nonlinear hidden-state basis; do not replay bucket/key tables, pair-symmetry BDD/cofactors, rank/colex descriptors, movement-edge/output-gray BDDs, compact transducer blockers, or lane/ANF wrappers unchanged.

## 2026-06-13 02:50:51 +0800 Round22 unknown-a-r22

- method_signature: `ex287|hamming_weight_preserving_lossy_routing_normalizer|compact_pair_state_and_lane_count_descriptor_screen|shared_pair_descriptors_and_lane_count_state|no_synth|blocked_before_verilog|full_word`
- official result: `BLOCKED_NO_CANDIDATE`; no Verilog/AIG was emitted, so no `evaluate.py` row is claimed.
- evidence: `student/work/ex200_ex299_frontend_refgap_round22_20260613_0218/unknown-a-r22/ex287/diagnostics/ex287_round22_screen.md`
- shard CSVs: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round22_20260613_0218/agent_shards/unknown-a-r22/`
- outcome: screened compact pair-state controlled routing and lane/count normalizer descriptors. Popcount preservation is exact, but pair-state exactness needs 6912 keys and compact lane/count majority reaches only 2213/16384 rows.
- next action: do not emit a key-table/cofactor repeat; ex287 needs a new nonlinear routing state before candidate generation.

## 2026-06-13 04:07:00 +0800 targeted symcof selector/mux probe

- campaign: `student/frontend_campaigns/campaigns/ex287_frontend_targeted_symcof_mux_probe_20260613_0407/`
- official result: 22/22 candidates passed repo `evaluate.py`; no iverilog-only success was claimed.
- best frontend update: `ex287_r25_symcof_f00_bits_13_0_1_12_2_onehot_group_abc_g_aig` improved frontend best from `1832/15/27480` to `1826/15/27390`, still far above reference `413/14/5782`.
- second useful point: `ex287_r25_symcof_f00_k4_onehot_group_abc_g_aig` reached `1714/16/27424`, showing lower area is possible but delay rises enough to lose to the selector-reordered k5 variant.
- paths:
  - Verilog: `student/work/ex287_frontend_targeted_symcof_mux_probe_20260613_0407/local-ex287-symcof/ex287/verilog/ex287_r25_symcof_f00_bits_13_0_1_12_2_onehot_group_abc_g_aig.v`
  - AIG: `student/work/ex287_frontend_targeted_symcof_mux_probe_20260613_0407/local-ex287-symcof/ex287/aigs/ex287_r25_symcof_f00_bits_13_0_1_12_2_onehot_group_abc_g_aig.aig`
  - evaluate log: `student/work/ex287_frontend_targeted_symcof_mux_probe_20260613_0407/local-ex287-symcof/ex287/logs/ex287_r25_symcof_f00_bits_13_0_1_12_2_onehot_group_abc_g_aig.evaluate.py.log`
  - results: `student/frontend_campaigns/campaigns/ex287_frontend_targeted_symcof_mux_probe_20260613_0407/results/candidates.csv`
- outcome: selector bit reordering inside the existing multi-pair symcof family gives a small but real official improvement; case/cascade/tree mux and global BDD-share variants do not close the reference gap.
- next action: do not repeat the tested `f00/f10`, `k4/k5/k6`, case/tree/onehot, group/global, or listed selector permutations unchanged. Continue only with a new nonlinear routing-state basis or a way to share cofactor logic across selector classes without reintroducing delay.

## 2026-06-13 05:27:00 +0800 Round25 unknown-sym-r25

- Campaign shard: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round25_20260613_0506/agent_shards/unknown-sym-r25/`.
- Dossier: `student/work/ex200_ex299_frontend_refgap_round25_20260613_0506/unknown-sym-r25/ex287/notes/high_level_dossier.md`.
- High-level description: 14-bit Hamming-weight-preserving lossy routing/normalizer with known input swap symmetries `(4,5)`, `(6,7)`, and `(8,9)`.
- Families tried:
  - `fixed_popcount_layer_decision_forest`: shared popcount decoder plus per-weight exact decision forests.
  - `input_xor_delta_coordinate_shared_bdd`: shared BDD for `out ^ in`, reconstructing `out = in ^ delta`.
  - `output_gray_coordinate_shared_bdd`: shared BDD for output Gray coordinates, reconstructing with prefix XOR.
- Method signatures:
  - `ex287|hamming_weight_preserving_lossy_routing_normalizer|fixed_popcount_layer_decision_forest|shared_popcount_layer_decoder_and_layer_trees|yosys_abc_g_aig|official_evaluate|full_word_layer_forest`
  - `ex287|hamming_weight_preserving_lossy_routing_normalizer|input_xor_delta_coordinate_shared_bdd|single_delta_bdd_node_pool_pair_late_order|yosys_abc_g_aig|official_evaluate|delta_xor_reconstruction`
  - `ex287|hamming_weight_preserving_lossy_routing_normalizer|output_gray_coordinate_shared_bdd|single_gray_bdd_node_pool_pair_late_order|yosys_abc_g_aig|official_evaluate|gray_prefix_xor_reconstruction`
- Official `evaluate.py` results: 3/3 equivalent, no frontend improvement. Results were `9244/36/332784`, `4126/25/103150`, and `3795/45/170775`; best was `ex287_r25_delta_shared_bdd_pair_late`, still worse than current frontend `27390` and reference `5782`.
- Paths: Verilog/AIG/logs under `student/work/ex200_ex299_frontend_refgap_round25_20260613_0506/unknown-sym-r25/ex287/`; summary rows in the campaign shard CSVs.
- Outcome: all three non-symcof representations are exact but too large or too deep. Do not repeat unchanged; future ex287 work still needs a new hidden-state/source-sharing idea rather than popcount layer trees or transformed-coordinate BDDs.


## 2026-06-13 05:39:00 +0800 Round26 unknown-sym-r26

- Campaign shard: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round26_20260613_0539/agent_shards/unknown-sym-r26/`.
- Dossier: `student/work/ex200_ex299_frontend_refgap_round26_20260613_0539/unknown-sym-r26/ex287/notes/high_level_dossier.md`.
- Families tried:
  - `component_pairfield_shared_bdd`: adjacent-pair count/orientation encoded output with one shared BDD node pool.
  - `component_pairfield_split_bdd`: same descriptor with separate count and orientation BDD node pools.
  - `hidden_order_local_rule_screen`: no-synth blocker unless local-rule conflicts disappear.
- Best official candidate: `ex287_r26_pairfield_split_bdd` at `1591/21/33411`; evaluate log `student/work/ex200_ex299_frontend_refgap_round26_20260613_0539/unknown-sym-r26/ex287/logs/ex287_r26_pairfield_split_bdd.evaluate.py.log`.
- Hidden-order screen: best full exact bits `0`, conflicts `86961`, evidence `student/work/ex200_ex299_frontend_refgap_round26_20260613_0539/unknown-sym-r26/ex287/diagnostics/ex287_hidden_order_local_screen.csv`.
- Outcome: no success is claimed unless `evaluate.py` candidate rows beat the frontend/reference columns in the shard CSVs.

## 2026-06-14 12:32:04 +0800 unknown-hard-r4

- Campaign shard: `student/frontend_campaigns/campaigns/ex204_ex299_frontend_continuation_20260614_1216/agent_shards/unknown-hard-r4/`.
- Dossier: `student/work/ex204_ex299_frontend_continuation_20260614_1216/unknown-hard-r4/ex287/notes/high_level_dossier.md`.
- High-level description: 14-bit Hamming-weight-preserving lossy routing/normalizer with exact input swap symmetries `(4,5)`, `(6,7)`, and `(8,9)`. This run avoided unchanged k4 vector-case and unchanged symcof/onehot signatures by screening non-identity source descriptors.
- Families tried:
  - `routing_residual_shared_bdd`: reconstruct `out = base(in) ^ residual(in)` with one shared residual BDD node pool. Best screened base was `paircanon`, order `outside_in`, `2078` residual BDD nodes.
  - `boundary_layer_residual_bypass`: exact low/high Hamming-weight boundary source decode plus middle-layer residual BDD. Best screened base was `paircanon`, order `pairlate`, boundary `1`, `2246` residual BDD nodes.
- Method signatures:
  - `ex287|hamming_weight_preserving_lossy_routing_normalizer|routing_residual_shared_bdd|base_paircanon_order_outside_in_nodes_2078|yosys_abc_g_aig|official_evaluate_residual_reconstruction|full_word_residual_xor`
  - `ex287|hamming_weight_preserving_lossy_routing_normalizer|boundary_layer_residual_bypass|base_paircanon_order_pairlate_nodes_2246|yosys_abc_g_aig|official_evaluate_residual_reconstruction|boundary_source_decode_plus_middle_residual`
- Official `evaluate.py` results: 2/2 equivalent, no frontend improvement.
  - `ex287_r4_routing_residual_shared_bdd_paircanon_outside_in_all_rows_abc_g_aig`: `3845/23/88435`.
  - `ex287_r4_boundary_layer_residual_bypass_paircanon_pairlate_middle_bdd_edge1_abc_g_aig`: `4154/36/149544`.
- Paths: Verilog/AIG/logs under `student/work/ex204_ex299_frontend_continuation_20260614_1216/unknown-hard-r4/ex287/`; shard CSVs under the campaign shard above.
- Outcome: no official improvement over current frontend `1680/16/26880`. Do not repeat non-identity paircanonical residual BDD or boundary-layer residual bypass unchanged; both remain much worse than the k4 vector-case frontend best and do not reveal a compact source-sharing basis.

## 2026-06-14 12:50:02 +0800 unknown-hard-r5

- Campaign shard: `student/frontend_campaigns/campaigns/ex204_ex299_frontend_continuation_20260614_1216/agent_shards/unknown-hard-r5/`.
- Dossier: `student/work/ex204_ex299_frontend_continuation_20260614_1216/unknown-hard-r5/ex287/notes/high_level_dossier.md`.
- Families tried: bounded selector-minimized pair-key class BDD word case, output-plane XOR-mask source reuse, and restricted hard-bit residual selector table. Current `deep_k4_vector_case_plain` was not repeated.
- Official `evaluate.py` results: 3/3 equivalent, no frontend improvement. Best rows were selector-min and XOR-reuse at `3260/18/58680`, versus current frontend `1680/16/26880`; restricted residual was `5340/20/106800`.
- Paths: Verilog/AIG/logs under `student/work/ex204_ex299_frontend_continuation_20260614_1216/unknown-hard-r5/ex287/`; run summary under `student/runs/unknown/ex204_ex299_frontend_continuation_20260614_1216/unknown-hard-r5/ex287/`.
- Outcome: no new frontend best. Selector `3_5_11` and hard-bit residual factoring are exact but still much larger than the k4 vector-case source.

## 2026-06-14 23:20:22 +0800 structural-decomp ex287 breakthrough

- Campaign: `student/frontend_campaigns/campaigns/ex286_ex287_frontend_structural_decomp_20260614_2320/`.
- Successful high-level description: output image is encoded as adjacent-pair count fields plus one global orientation bit, then computed through the known symmetry-canonical key and a k6 cofactor shared BDD. A fixed decoder reconstructs the original 14-bit output.
- New frontend best: `ex287_orientbdd_keycof_k6_b2_b3_f00_abc_g_aig` official `evaluate.py` OK at `1645/15/24675`, improving the previous frontend `1680/16/26880` by `2205` ADP (`8.203125%`).
- Paths:
  - Verilog: `student/work/ex286_ex287_frontend_structural_decomp_20260614_2320/coordinator-orientbdd-r1/ex287/verilog/ex287_orientbdd_keycof_k6_b2_b3_f00.v`
  - AIG: `student/work/ex286_ex287_frontend_structural_decomp_20260614_2320/coordinator-orientbdd-r1/ex287/aigs/ex287_orientbdd_keycof_k6_b2_b3_f00_abc_g_aig.aig`
  - evaluate log: `student/work/ex286_ex287_frontend_structural_decomp_20260614_2320/coordinator-orientbdd-r1/ex287/logs/ex287_orientbdd_keycof_k6_b2_b3_f00_abc_g_aig.evaluate.py.log`
  - merged results: `student/frontend_campaigns/campaigns/ex286_ex287_frontend_structural_decomp_20260614_2320/results/best_improvements.csv`
- Important near-misses: k4 encoded cofactor `1517/18/27306`, k5 extra-bit variants `1623/17/27591` and `1635/17/27795`, and raw encoded BDD `1577/22/34694`.
- Do not repeat unchanged: full key cube cover, raw encoded BDD, pair-orientation reconstruction through Hamming-weight popcount, two-hot XOR-superposition collision lift, and k4/k5 encoded cofactor rows. Continue from k6/k7 encoded cofactor or reduce the fixed decoder/outer mux area.

## 2026-06-14 23:20 orientation-follow-up

- New frontend best: `ex287_orientfollow_k7_b2_b3_b11_f11_case_direct_abc_g_aig` official evaluate.py OK, area/delay/ADP `1697/14/23758`.
- Source Verilog: `student/work/ex286_ex287_frontend_structural_decomp_20260614_2320/subagent-ex287-orient-followup/ex287/verilog/ex287_orientfollow_k7_b2_b3_b11_f11_case_direct.v`
- Source AIG: `student/work/ex286_ex287_frontend_structural_decomp_20260614_2320/subagent-ex287-orient-followup/ex287/aigs/ex287_orientfollow_k7_b2_b3_b11_f11_case_direct_abc_g_aig.aig`
- Evaluate log: `student/work/ex286_ex287_frontend_structural_decomp_20260614_2320/subagent-ex287-orient-followup/ex287/logs/ex287_orientfollow_k7_b2_b3_b11_f11_case_direct_abc_g_aig.evaluate.py.log`
- Method: output-image adjacent-pair count/component orientation encoder with symmetry key `k7_b2_b3_b11`, f11 cofactor BDD policy, case selector, direct decoder.
- Result: improved from `24675` to `23758` ADP by reducing delay to 14. Near-best alternatives include the k6 f11 case/direct family at `23895` and k7 factored at `23996`; next work should reduce selector/decoder area without giving back the delay level.
