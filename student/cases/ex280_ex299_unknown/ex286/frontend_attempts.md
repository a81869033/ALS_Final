# ex286 Frontend Attempts

## Current Best

- Current best frontend: `ex286_unknown_symcof_interleave_f00_bits_0_12_1_10_onehot_group_abc_g_aig`, area `1346`, delay `15`, ADP `20190`.
- Reference: ADP `2376`.
- Gap: `8.50x` reference ADP.

## Already Tried

- Tried generic unknown variants: `value_case`, `expr_default_exception`, `high_split_default`, `low_split_default`, `rotate_high_split_default`, `rotate_low_split_default`, `decision_tree_greedy`.
- Top results: `rotate_low_split_default:26110`; `rotate_high_split_default:40976`; `decision_tree_greedy:41154`; `low_split_default:51488`; `high_split_default:111622`.
- Algebraic/ANF/Davio/support-LUT candidates exist under `student/work/reverse_unknown_algebraic_20260603_2305_algebraic_safe/ex286`, but they are not the current tracked best.
- 2026-06-08 diagnostic shared-BDD run: official `evaluate.py` OK; interleave BDD was `1494/20/29880`, worse than current rotated-low split.
- 2026-06-08 current structural synthflow run: official `evaluate.py` OK for all variants; `abc_g_aig` improved to `1860/13/24180`.
- 2026-06-08 symmetry-canonical BDD run: exact `swap_in_4_5` canonical key was verified with official `evaluate.py`; best was `1436/18/25848`. Area improved, but delay made ADP worse than current.
- 2026-06-08 symmetry-BDD synthflow run: official `evaluate.py` OK; `abc_g_aig` reached `1435/17/24395`, a near miss but still worse than current by `215` ADP.
- 2026-06-08 secondary symmetry-BDD synthflow run: official `evaluate.py` OK; `abc_d20/21/22` stayed at `25848`, and `abc_fast`, `abc_g_simple`, `abc_g_and_mux`, `synth_preset_noabc` were worse.
- 2026-06-08 tight symmetry-BDD delay-target run: official `evaluate.py` OK for best `1435/17/24395`; `abc -D 13..17` and `abc -g aig -D 13..17` reproduced the same near miss and did not beat current `1860/13/24180`.
- 2026-06-08 structural/symmetry bit-hybrid run: official `evaluate.py` OK; raw best `primary_7` was `1867/14/26138`. Limited synthflow on the best and all raw rows reached `1864/13/24232`, still 52 ADP worse than current.
- 2026-06-09 symmetry cofactor class-onehot run: applying the ex280-ex284 cofactor/class-onehot source rewrite to the exact `swap_in_4_5` canonical key produced new current best `1474/16/23584` (`interleave_f10_k4`), improving previous current by `596` ADP.
- 2026-06-09 symmetry cofactor order smoke: `reverse`, `natural`, and `sym_first` top-4/5/6 rows were official exact but much worse; best was `5281/18/95058`.
- 2026-06-09 multi-pair symmetry diagnostic found exact input symmetries `(4,5)` and `(6,7)`.
- 2026-06-09 multi-pair symmetry cofactor class-onehot run: canonicalizing both pairs was official exact; raw best `1449/16/23184`, and limited `abc_g_aig` improved current to `1447/15/21705`.
- 2026-06-09 explicit pair-state outer-bit selectors, canonical case table with invalid-key `x`, raw multi-pair BDD, direct ANF low-support bit extraction, and hand-structured custom BDD orders were all official exact where applicable but worse.
- 2026-06-09 popcount semantic diagnostic: verified `popcount(out) == popcount(in)` for all `8192` truth rows. This points to a conservative token-routing / controlled-swap style structure. Pure compare-exchange is rejected because the function is not bitwise monotone; transferred mux-coordinate degree-2/3 solved zero bits; weighted-sum best matched only `62/8192`; quadratic-at-origin residual BDD grew from `837` to `2236` nodes; popcount-layer BDD node sum was `7968`, worse than raw.
- 2026-06-09 popcount-repair smoke: skipping cofactor bit 2 and deriving it as `popcount(in) == popcount(other_out)+1` was official exact, but `1534/24/36816` was much worse than current. The conservation law should not be used as a late repair predicate.
- 2026-06-09 conservative-routing diagnostics: no exact `total_count + interval_count` output-bit predicates; no direct width embedding into ex287; greedy sort/controlled-swap/controlled-compare recovery reduced mismatch only from `47682` to `40568` after 50 gates, not seed-worthy.
- 2026-06-09 k4 selector search: exhaustive node-count scan found outer bits `(0,1,9,10)` with `1687` group nodes versus default `2291`, but official replay was worse (`1473/18/26514` raw, `1471/17/25007` after `abc_g_aig`). Node count alone is not enough; mux/selector delay dominates.
- 2026-06-09 bounded token-routing diagnostics: global rotation/reflection, radius<=4 local line/ring rules, prefix-balance transducers with lookahead<=6, and rank-context maps all had large conflicts; no exact compact token-routing RTL form was found.
- 2026-06-09 nested selector-tree mux replay of the current multi-pair cofactor source was official exact but worse (`1472/18/26496`).
- 2026-06-09 `synth_preset` replay of selector `(0,1,9,10)` was official exact but worse (`1425/16/22800`) than current `21705`.
- 2026-06-09 low-weight/semantic probes rejected weighted data-dependent rotate, low-degree one-hot position polynomial, hidden unate comparator polarity, and key-domain PLA/DC as large-drop structures for this family.
- 2026-06-09 popcount-layer diagnostic: layer outputs are many-to-one but not small canonical placements; middle layers still have hundreds of unique outputs (`w6/w7` each `417`). No output pair implication/equality constraints were found.
- 2026-06-09 pair-count MDD source treated exact symmetry pairs as true ternary variables instead of binary `(OR,AND)` key bits. Official replay was exact, but much worse; best raw `reverse` was `1733/21/36393`, and limited `synth_preset` improved only to `1651/20/33020`.
- 2026-06-09 conservative big-jump diagnostic: output-state insertion recurrence is not exact (`natural` order has `1355` conflicts); small-slot matching/parking is not compact (`cap8` still fails `2367/8192` rows); generalized input/output permutation symmetry gives only the known input-invariant swaps `(4,5)` and `(6,7)`; layer-rank identity/reverse/bit-reverse maps match only tiny fractions; independent 4-bit block scatter misses `8069/8192` rows; simple prefix/suffix count transport tops out at `5073/8192`. ABC `dsd -rv; strash` on direct truth is `5283/24`, much worse than current.
- 2026-06-09 pair-interaction diagnostic: two-hot output matrices have some low-rank bits (`4/6/8/10`), but two-hot behavior is not determined by the one-hot output-slot pair (`31` slot-pair conflicts). Degree-2 polynomials implied by zero/one/two-hot rows match only about half the full table, and residual BDDs for edge bits are larger than raw bit BDDs. This is not a seed-worthy large-drop structure.
- 2026-06-09 raw shared-BDD with ABC DSD/sifting-derived variable order `8:0:9:1:10:11:12:7:2:4:5:6:3` was official exact but much worse: `1938/21/40698` versus current `1447/15/21705`.
- 2026-06-09 Fredkin-greedy diagnostic after pair canonicalization reduced bit score from `47770` to `36788`, but exact row mismatches stayed near full-table scale (`8100` to `8014` of `8192`) after 18 improving controlled-swap gates; no Verilog seed was emitted.
- 2026-06-09 top-k/layer diagnostic: simple top-k score families were very weak; best full-table match was only `84/8192`. Complement/reverse duality was also not exact (`38/8192` best tested variant).
- 2026-06-09 conservation-law diagnostic: mod `2/3/5/7` linear invariant nullity was `1`; the only linear conserved quantity is global popcount, so independent block/lane conservation is not the missing structure.
- 2026-06-09 count-coordinate diagnostic: prefix/suffix/interval count predicates solved no output bits; best matches were only about `5216/8192`, so this is not a compact selected-bit source.
- 2026-06-09 cross-width embedding diagnostic: ex286 into ex287 found only output bits 6/7 as direct fixed-bit restrictions; too little structure for a source transfer.
- 2026-06-09 low-delay symcof replay: `interleave_f10_k6` was exact and reached `1807/13/23491` after `abc_g_aig`, but still worse than current `21705`. D14-D17 tied the same row.
- 2026-06-09 scan residual diagnostic: prefix residual classes compressed mostly by known pair symmetries and output many-to-one behavior, not a small scan/transducer state space. A center order looked smaller in residual counts but exact symcof replay was far worse.
- 2026-06-09 center-order symcof replay: custom order `6,5,7,4,8,3,9,2,10,1,11,0,12` was official exact for 12/12 rows, but best was only `7346/18/132228`.
- 2026-06-09 LTF diagnostic: raw and pair-canonical linear-threshold features solved no output bits; best match was only `5031/8192` (`bit5 raw01`), too weak for threshold RTL.
- 2026-06-09 parking/preference diagnostic: static greedy parking/open-addressing using one-hot home slots, two-hot preference slots, multiple token orders, and reverse/rotate output transforms was far from exact. Best full-row match was only `145/8192` (`reverse`, `pair_freq`, identity), bit match ratio `0.557223`, so no RTL seed was emitted.
- 2026-06-09 bucket-count classifier: output is exactly determined by `8` one-hot-derived bucket counts plus selector bits `raw3:raw10:xor6_7` (`15`-bit key, `4608` mapped keys). The flat exact `case(key)` RTL was official exact, but area exploded; best limited synthflow row was `13081/21/274701`, far worse than current. Keep the count-key decomposition as a clue, but do not reuse the flat table emitter.
- 2026-06-09 bucket-count table decomposition follow-up: invalid-key `default x` and per-output-bit table emitters were official exact but still area-explosive. Best `case_defaultx` was `13222/21/277662`; `perbit_defaultx` was `21576/20/431520`. The next attempt must decompose the count-key function, not change the table wrapper.
- 2026-06-09 bucket-key BDD: shared BDD over the exact bucket-count key domain found best `selectors_first` order with `3616` nodes and official exact `4244/23/97612` after `abc_g_aig`. This is much smaller than flat table but still `4.50x` worse than current ADP.
- 2026-06-09 bucket-key formula diagnostic: primitive count/selector predicates solved no output bits, depth-4 greedy primitive trees solved no bits, and key-domain ANF had `3112..12042` terms with max degree up to `15`. No seed emitted.
- 2026-06-09 bucket-key sampled cube-cover diagnostic: invalid-key don't-care expansion found sampled cubes covering up to `144` on-keys with `5` literals, giving lower-bound cube counts `16..17`. This is not a complete cover and no seed was emitted; it only suggests an optimized exact cover could be checked later.
- 2026-06-09 split-domain duality diagnostic: tested ex289-like half-domain self-reductions over complement/reverse/input split transforms and output complement/reverse/pair-swap transforms. Best was only `32/2048` matches (`split7`, `reverse_comp_except_split`, identity), no exact relation. ex289 sanity in the same run passed.
- 2026-06-09 bucket-count LTF diagnostic: over exact bucket counts, selected disambiguation bits, and pairwise count differences, perceptron training solved no output bits; best was bit 8 with `4805/8192` matches. No seed emitted.
- 2026-06-09 bucket field-support greedy diagnostic: all output bits become exact only after essentially the full bucket/selector field set (`11` fields, `4608` keys). This rejects a small field-support split of the exact bucket-key function.
- 2026-06-09 parity-repair smoke: replacing output bit 0 by the exact conservation-parity identity was official exact, but delay exploded; result `1422/24/34128` is worse than current `1447/15/21705`.
- 2026-06-09 cofactored pair-count MDD diagnostic: best row was `reverse k3`, `8` classes, `3719` MDD nodes, larger than the current cofactor BDD path (`2291` group nodes). No seed emitted.
- 2026-06-09 semantic big-jump diagnostic: iterative application has many nontrivial cycles, so it is not a normalizer; prefix-threshold BDDs were much larger (`10682` nodes vs `2291` direct nodes); slot arithmetic still matched only `62/8192`; direct ABC `read_truth -xf` sanity after simple rewriting was not reference-scale (`11289/27 -> 8697/22`).
- 2026-06-09 pair-sort beam diagnostic: depth-8 beam-64 search over conservative pair-sort/comparator primitives ended at `44074` bit mismatches and `8154/8192` full-row mismatches. This rejects small unconditioned comparator networks as the missing compact structure.
- 2026-06-09 rank/linear diagnostic: GF(2) input/output relation nullity was `1`, so only global parity is available for XOR repair. Best layer rank-affine relation was weak (`14/1287` on layer 5).
- 2026-06-09 cofactor ANF diagnostic: current cofactor groups have `10948` total ANF terms, per-group `553..847`, max bit `111` terms, max degree `8`. This is too large to replace BDD groups with ANF.
- 2026-06-09 low-support key-BDD selected-bit hybrid: emitted bits `5/6/7` from one shared BDD over the canonical symmetry key and skipped them in the class-onehot cofactor groups. The source was official exact, and limited `abc_g_aig` replay was `1453/15/21795`, a near miss but still worse than current `1447/15/21705`. This is not a large-drop structure.
- 2026-06-09 bucket top-k score diagnostic: trained score-and-top-k models over exact bucket counts/selectors. Linear counts/selectors matched only `90/8192` rows, and a short quadratic smoke matched only `286/8192`; no RTL seed emitted.
- 2026-06-09 delta insertion diagnostic: adding input bit 6/7 has only `22` unique output deltas, but output-only insertion still has many conflicts; best output-key conflict count was `266`, and best delta BDD node count was `821`. No compact token-insertion recurrence was found.
- 2026-06-09 streaming prefix diagnostic: tested natural/reverse/center/onehot-slot input/output orders with lookahead up to `6`. No row determined even the first output prefix exactly; best majority row was `onehot_slot->onehot_slot+L6` with `0.892447` majority ratio and `2021` worst conflicts. No FSM/transducer RTL seed emitted.
- 2026-06-09 transform ANF residual diagnostic: tested raw, pair-key, prefix/suffix natural/reverse/onehot-slot coordinate transforms with degree `1/2/3` ANF extraction. No low-degree exact bits were found, and best residual/raw BDD node ratio was `1.000000`, so no hybrid RTL seed was emitted.
- 2026-06-09 finite collision/algebra diagnostic: hidden labels such as `home_mod3`, `home_occ`, and exact-symmetry labels can memorize all two-hot rows (`78/78`), but the shared pair-correction XOR superposition matches only `370/8192` full rows with bit accuracy `0.547589`. Symmetric modular affine pair rules are weaker (`8/78` best). No RTL seed emitted.
- 2026-06-09 static-feature controlled-swap diagnostic: stronger sampled smoke using raw-bit, symmetry-pair, bucket/prefix/suffix count controls remained weak. After 12 greedy mux-swap layers, best sample mismatch was `1301/1352` from identity and `1326/1352` from pair-canonical start. Earlier full-table ex286 smoke was also weak (`8025/8192` and `7987/8192` after 8 layers), so no RTL seed emitted.
- 2026-06-09 bucket-count prefix/layout diagnostic: tested whether exact bucket counts plus selectors form a histogram-to-output layout using bucket/output orders and selector-controlled offsets. Best was only `69/8192` rows (`bucket_segment`, `slot_asc`, `onehot_slots_first`) with bit match `0.545936`, so no layout RTL seed emitted.
- 2026-06-09 Gray-layer order diagnostic: tested BRGC-filtered, bit-reversed Gray, and related same-popcount layer orders with per-layer shift/affine/direct rank transforms. Best was only `103/8192` rows (`affine`, `value->value`) with bit match `0.554162`; no rank-successor RTL seed emitted.
- 2026-06-09 input/output coordinate ANF diagnostic: added output-coordinate transforms on top of input prefix/suffix/Gray transforms to check for ex280-ex284-style low-degree coordinate collapse. Best was only `1/13` exact transformed bits at degree <=4 (`raw->suffix_onehot`), with `17665` total ANF terms; no compressor RTL seed emitted.
- 2026-06-09 bucket-count collision-relaxation diagnostic: treated exact one-hot home bucket counts as initial occupancy and tested parking carry, binary carry, balanced nearest parking, and line/cycle sandpile rules with selector-specific policies. Best was only `130/8192` rows, bit match `0.555457`; no relaxation RTL seed emitted.
- 2026-06-09 image/canonical representative diagnostic: output image has `2233` unique values; exact bucket-key class output is in its own input class only `82/4608` classes, and best min/max representative model matches only `60/4608` classes. This rejects simple canonical representative selection over exact bucket-key classes.
- 2026-06-09 exact bucket-key multi-valued MDD diagnostic: treated the exact bucket counts and selectors as true multi-valued variables instead of binary-encoded key bits. Full-order/policy scan found best `bit_shared/reuse_mode/domain_asc` with `1710` nonterminal nodes, max width `430`, `2` terminals, and `4608` mapped keys. This is smaller than flat key tables but not compact enough for a large ADP drop from current `21705`; no RTL seed emitted.
- 2026-06-09 global token-slot matching diagnostic: tested maximum-weight assignment using weights learned from one-hot, two-hot, and low3 rows. Even on the weight<=3 gate, best was only `54/378` rows (`low3_freq`, home bonus `16`, home order, low tie, identity output), so learned matching/preference assignment is not the missing conservative-routing structure. No RTL seed emitted.
- 2026-06-09 fixed-popcount slice polynomial diagnostic: checked whether each output bit is a low-degree GF(2) polynomial on each Hamming-weight layer. Degree<=3 solved only `104/182` layer-bits; degree<=4 improved to `130/182` by covering boundary layers, but central layers `w6` and `w7` had `0/13` exact output bits even with feature rank `715`. No slice-polynomial RTL seed emitted.
- 2026-06-09 arbitrary output-linear ANF diagnostic: word-level Mobius/nullspace over output linear combinations found low-degree coordinates beyond global parity. Degree<=4 nullity is `4/13`, with mod-4 lane parity masks `0x1111:0x222:0x444:0x888` and term counts `74:95:67:85`. This is a real semantic clue, but only four coordinates, not a full output basis.
- 2026-06-09 lane-parity repair wrapper smoke: skipped one current-source output bit per mod-4 lane and reconstructed it from the degree<=4 lane parity coordinate plus other same-lane base outputs. All three wrappers were official exact, but ADP worsened badly: low `2041/22/44902`, middle `2040/22/44880`, high `2070/23/47610` vs current `1447/15/21705`. Do not expand this wrapper form.
- 2026-06-09 lane-parity semantic feature-span diagnostic: tested whether the mod-4 output lane parity targets can be expressed more cheaply from input lane parity, home-lane counts, raw pair signals, bucket count bits, or bucket selector bits. Degree 1/2 broad features and degree 3 smaller features solved zero lane targets, so no cheap replacement for the direct ANF cone was found.
- 2026-06-09 output-linear high-degree ANF diagnostic: nullity grows to `8/13` at degree<=8 with mod-8-like masks, but term counts are large (`281..382`), so direct coordinate emission is not a source.
- 2026-06-09 corrected image-constraint and adjacent-pair orientation diagnostic: output image has no degree 1/2 constraints and only `4` degree-3 constraints. Adjacent output-pair shared orientation is not exact for ex286 (`608` conflicts), and pair-count+orientation encoding increases raw shared-BDD nodes `837 -> 1336`.
- 2026-06-09 component-wise adjacent-pair orientation diagnostic: degree-3 image constraints define components `(0,4)`, `(1,3,5)`, and `(2)` over adjacent output pairs. Component-wise orientation encoding is exact (`0` conflicts), but raw shared-BDD nodes still increase `837 -> 1417`, so it is not a seed-worthy source.
- 2026-06-09 component pair-field split diagnostic: exact component encoding separates into pair-count fields and orientation bits. Pair-count BDD nodes dominate (`1179`) versus orientation (`335`), and max support remains full-width (`13/13`). This means the exact orientation structure is real but does not remove the hard part; no Verilog seed emitted.
- 2026-06-09 affine complement-duality diagnostic: tested `f(P(~x)) = Q(~f(x))` with base affine/rotate/reverse bit-index P/Q candidates. Best was only `42/184` low-weight sample and `140/8192` full rows (`id|aff12_2`). Pair-composed exact-sample hashing with known input-pair symmetries had no low-weight exact hit. No half-domain RTL seed emitted.
- 2026-06-09 bucket moment-coordinate diagnostic: greedy scalar moments re-encoded the exact bucket key with `moment_quad:oddmask:selmix_m4:sel2`, exact `8192/8192`, but still used `4608` keys. Prefix/modulo vector families were not exact. No RTL seed emitted because this is not smaller than the existing exact bucket-key table route.
- 2026-06-09 output pair-count linear diagnostic: tested adjacent output pair-count targets over mod 101 against counts, selectors, prefix coordinates, selector products, count quadratics, and count indicators. All `49/49` target/family systems were inconsistent; no compact count-linear source for the pair-count bottleneck was found.
- 2026-06-09 output pair-count tiny piecewise diagnostic: bounded min/max/clamp/sum-clip single/two-coordinate checks found zero exact formulas; best was pair_count_6 using `sc1_4:sc3_5` at only `5771/8192`. No comparator-style pair-count RTL seed emitted.
- 2026-06-09 output pair-count cumulative transport diagnostic: prefix-capacity/window transport over exact bucket counts plus selector offsets found no exact formula; best was `prefix_capacity`, bucket `asc`, pair `asc`, offset `zero`, only `241/8192`. No RTL seed emitted.

## 2026-06-12 Round9 routing-r9

- method_signature: `ex286|hamming_weight_preserving_lossy_routing_normalizer|collision_path_ballot_descriptor|shared_home_collision_path_state|no_synth|blocked_before_verilog|full_word`
- official result: `BLOCKED_NO_VERILOG`; no official `evaluate.py` candidate was run because the dossier found no materially new exact compact descriptor to emit as Verilog.
- paths:
  - dossier: `student/work/ex200_ex299_frontend_refgap_round9_20260612_1851/routing-r9/ex286/high_level_dossier.md`
  - failed shard: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round9_20260612_1851/agent_shards/routing-r9/failed_hypotheses.csv`
  - evaluation shard: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round9_20260612_1851/agent_shards/routing-r9/evaluation_results.csv`
  - summary: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round9_20260612_1851/agent_summaries/routing-r9.md`
- outcome: Dossier confirmed the conservative Hamming-weight-preserving lossy-routing hypothesis and considered a collision-path / ballot-style shared descriptor. Low-weight sanity did not expose an exact path rule: one-hot-home OR/XOR matched only `62/8192` rows, with no exact central Hamming-weight layers. Emitting an exact fallback would repeat rejected bucket/table or cofactor/symcof families, so no Verilog was generated.
- next action: Treat ex286 as blocked for this round unless a genuinely new nonlinear hidden-state basis appears. Do not continue with table/rank/colex/bucket/cofactor/symcof/Fredkin/token-count/lane-parity variants without a materially different high-level descriptor.

## 2026-06-12 Round9 routing-r9 checkpoint restart

- dossier: `student/work/ex200_ex299_frontend_refgap_round9_20260612_1851/routing-r9/ex286/notes/high_level_dossier.md`
- planned hypotheses:
  - `ex286|hamming_weight_preserving_lossy_routing_normalizer|round9_shared_cofactor_mux|new_selector_basis_output_grouping|official_evaluate|pair_canonical_shared_roots|full_word_grouped_outputs`
  - `ex286|hamming_weight_preserving_lossy_routing_normalizer|round9_anf_shared_roots|shared_monomial_output_groups|official_evaluate|gf2_residual_shared_terms|grouped_outputs`
- official result: pending at dossier time; no Verilog had been emitted before this entry.
- outcome: Dossier keeps the conservative routing hypothesis but commits this restart to two materially different candidate families: changed shared cofactor/BDD-style mux factoring and GF(2)/ANF shared roots.
- next action: Generate and officially evaluate ex286 candidates first, then record equivalent/non-equivalent and QoR rows in the routing-r9 shard.

## 2026-06-12 Round9 routing-r9 coordinator correction

- method_signature: `ex286|hamming_weight_preserving_lossy_routing_normalizer|collision_path_ballot_descriptor|shared_home_collision_path_state|no_synth|blocked_before_verilog|full_word`
- official result: `BLOCKED_NO_VERILOG` for the new collision-path / ballot-style descriptor; no counted successful candidate has an official `evaluate.py` log.
- non-counted artifacts:
  - repeated symcof debug artifacts exist under `student/work/ex200_ex299_frontend_refgap_round9_20260612_1851/routing-r9/ex286/` with generator-reported equivalent rows `1449/16/23184`, `1501/16/24016`, and `1479/17/25143`; they are worse than current frontend ADP `20190`, repeat the rejected symcof/cofactor family, and have no official `evaluate.py` log path, so they are excluded from `candidates.csv` and `evaluation_results.csv`.
  - interrupted split-ANF artifacts exist for `identity`, `bit_reverse`, and partial `prefix_parity_reduce`; they have no official `evaluate.py` log and are excluded from counted candidate rows.
- paths:
  - dossier: `student/work/ex200_ex299_frontend_refgap_round9_20260612_1851/routing-r9/ex286/notes/high_level_dossier.md`
  - non-counted debug rows: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round9_20260612_1851/agent_shards/routing-r9/failed_hypotheses.csv`
  - summary: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round9_20260612_1851/agent_summaries/routing-r9.md`
- outcome: The coordinator correction resolves the prior inconsistency: Verilog/AIG artifacts exist for ex286, but they are repeated or interrupted debug artifacts, not official Round9 successful candidates.
- next action: Ignore these ex286 debug artifacts for registry merge unless someone reruns them through official `evaluate.py` with logs and a materially new high-level descriptor; do not continue symcof/ANF wrapper variants unchanged.

## 2026-06-12 Round10 coordinator-paircount-anf

- method_signature: `ex286|hamming_weight_preserving_lossy_routing_normalizer|paircount_linear_anf_basis_diag|component_pair_count_output_linear_basis|no_synth|blocked_before_verilog|encoded_paircount_coordinates`
- official result: `BLOCKED_NO_VERILOG`; no official `evaluate.py` candidate was run because the diagnostic did not produce a complete low-cost RTL source.
- paths:
  - dossier: `student/work/ex200_ex299_frontend_refgap_round10_20260612_1911/coordinator-paircount-anf/ex286/notes/high_level_dossier.md`
  - summary CSV: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round10_20260612_1911/agent_shards/coordinator-paircount-anf/diagnostics/paircount_linear_anf_summary.csv`
  - basis CSV: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round10_20260612_1911/agent_shards/coordinator-paircount-anf/diagnostics/paircount_linear_anf_basis.csv`
  - failed shard: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round10_20260612_1911/agent_shards/coordinator-paircount-anf/failed_hypotheses.csv`
- outcome: Component pair-count encoded output-linear ANF exposes only a partial low-degree basis. Pair-count-only nullity reaches `4/13` by degree 6 (`0x141:0x444:0x888:0x1050`, terms `156:38:19:133`), which is a semantic clue but not enough to replace the hard pair-count fields.
- next action: Do not repeat partial pair-count coordinate repair. Continue only with a complete nonlinear basis or a constructive shared pair-count generator.

## Do Not Repeat Blindly

- Rotated low split is no longer current, but remains the low-delay comparison source.
- Do not repeat the tested interleave BDD order without a source rewrite.
- Pair symmetry is real, but the tested canonical-key BDD order is delay-dominated; do not repeat it without a different source form.
- Symmetry-BDD synthflow is close but still delay-dominated; next attempt must reduce delay, not area.
- Do not repeat secondary symmetry-BDD synthflow variants `abc_d20/21/22`, `abc_fast`, `abc_g_simple`, `abc_g_and_mux`, or `synth_preset_noabc`.
- Do not repeat tight symmetry-BDD ABC delay targets `D13..D17` on the same `f10`/`f00`/`zero` BDD sources; they stay at delay 17+ and do not improve ADP.
- Do not repeat the exact structural split plus symmetry-BDD bit-hybrid family using primary bits 5/6/7; exact but no row beat current after `abc_g_aig`/`synth_preset` checks.
- Do not repeat non-interleave symmetry cofactor orders; they are area-explosive even after class-onehot factoring.
- Do not repeat pair-state outer-bit selectors or direct ANF selected-bit extraction as tested; both increase ADP substantially.
- Do not repeat raw multi-pair BDD or hand-structured pair-first BDD orders as tested; cofactor class-onehot plus `abc_g_aig` dominates.
- Do not spend time on direct high split or full case-table variants without a new reason.
- Do not repeat the tested mux-coordinate/quadratic transfer, direct weighted modular sum, quadratic-origin residual BDD, elementary CA sample, combinadic rank map, or popcount-layer BDD forms. The next plausible large-drop path is a non-monotone conservative token-routing / controlled-swap model.
- Do not repeat popcount-repair on top of the cofactor/BDD source as tested; exact but delay-heavy.
- Do not repeat ex286 selector `(0,1,9,10)` with the same onehot/case source and `abc_g_aig`; exact but worse than current.
- Do not repeat ex286 selector `(0,1,9,10)` with `synth_preset`; exact but still worse.
- Do not repeat nested selector-tree mux for the current cofactor source; exact but delay worsened.
- Do not repeat bounded local/FSM token-routing, weighted rotate, one-hot position polynomial, hidden-unate comparator, or PLA/DC forms without a new coordinate transform.
- Do not repeat pair-count MDD in the tested orders or simple `abc_g_aig`/`synth_preset` replay; exact but worse than current.
- Do not repeat output-mask-only insertion recurrences, small candidate-slot matching/parking, generalized swap/output-permutation symmetry scans, simple layer-rank maps, independent 4-bit block scatter, simple prefix/suffix count transport, or direct ABC DSD strash for ex286; the diagnostic run rejects all as reference-scale structures.
- Do not repeat simple two-hot pair-slot interaction, degree-2-from-low-weight residual BDD, raw ABC-order shared BDD, or greedy Fredkin/controlled-swap composition as tested; none showed a path to current-scale or reference-scale ADP.
- Do not repeat simple top-k score selection or complement/reverse duality for ex286 as tested; both were far from exact.
- Do not pursue independent block/lane conservation for ex286 without a nonlinear hidden-state idea; only global popcount is linearly conserved.
- Do not repeat count-coordinate single predicates, narrow cross-width direct embedding, or low-delay `f10_k6` synthflow/D-target replay for ex286 as tested; exact but worse or too weak.
- Do not repeat center-order residual/symcof replay for ex286 as tested; residual compression did not translate to BDD/cofactor QoR.
- Do not repeat single-layer LTF/comparator predicates over raw or pair-canonical features for ex286 as tested; no bit was near exact.
- Do not repeat static one-hot/two-hot preference-list parking or open-addressing models for ex286 as tested; they are much farther from exact than seed-worthy.
- Do not repeat flat bucket-count key case-table RTL for ex286; exact but `12.66x` worse than current ADP. Only revisit if the count-key table is structurally decomposed.
- Do not repeat bucket-count `default x` or per-bit key table emitters for ex286; both are exact but worse than the already bad flat table.
- Do not repeat straightforward shared BDD over the bucket-count key for ex286 as tested; selectors-first was best but still far worse than current.
- Do not repeat shallow primitive count/selector formulas, depth-4 greedy primitive trees, or direct key-domain ANF for ex286 as tested.
- Do not rerun the naive full Python cube-cover implementation for ex286; it was too slow. If revisiting cube covers, use a bitset-optimized exact cover.
- Do not pursue tested ex289-style split-domain duality wrappers for ex286; no transform was close to exact.
- Do not repeat simple linear-threshold/comparator formulas over bucket-count semantic features for ex286 as tested.
- Do not repeat bucket field-support split, conservation parity repair, cofactored pair-count MDD, prefix-threshold BDD, slot arithmetic/rotate, iterative normalizer, or direct ABC truth-strash sanity as tested for ex286; all failed to expose the reference-scale structure.
- Do not repeat small unconditioned pair-sort/comparator beam or layer-rank affine maps for ex286 as tested.
- Do not repeat direct ANF emission of the current cofactor groups for ex286; term count is too high.
- Do not broaden low-support key-BDD selected-bit hybrids for ex286 without a stronger sharing idea; the exact `5/6/7` row only reached `21795`, worse than current by `90` ADP.
- Do not pursue simple bucket-count score/top-k routing for ex286 as tested; even quadratic count/selector scores were far from exact.
- Do not pursue output-only token insertion recurrence for ex286 as tested; low unique deltas on symmetry-pair bits do not remove output-state conflicts.
- Do not pursue small-lookahead streaming prefix/transducer RTL for ex286 as tested; output prefix determinism fails even with onehot-slot order and lookahead 6.
- Do not pursue low-degree ANF residual hybrids for ex286 under the tested raw/pair-key/prefix/suffix transforms; residual BDDs did not shrink.
- Do not pursue layer-wise combination-rank/unrank transforms for ex286 as tested; the best layer-rank match was only `14/1287`, with zero exact layers and central Johnson-neighborhood average output distance `5.151`.
- Do not pursue direct ABC PLA/DC minimization of the exact compact bucket key for ex286; even key-to-output only reached `4374/15/65610` after `espresso; bdd; sop; fx; strash; dc2`, before adding bucket counter/key logic.
- ABC single-bit exact-synthesis smoke did not produce a candidate. Single-line bit truth extraction works, but ABC `exact` supports only `2..8` variables and aborts on 13-input ex286 bits; direct multi-output `bdd/sop/fx` extraction was `2560/15`, worse than current.
- Do not pursue shallow bucket collision/carry formulas for ex286 as tested; single primitives and top-80 two-primitive XOR/AND/OR combinations solved zero output bits, with best bit match only `5397/8192`.
- Do not pursue direct interval-run relocation/superposition for ex286 as tested; next-combination, interval OR/XOR, modular multiply, reversed-domain multiply, and rotate variants were far from exact. Best row match was only `142/8192`.
- Do not pursue simple ex289 restriction/projection transfer for ex286 as tested; order-preserving input embeddings with constants and ordered or one-hot-inferred output projections had zero survivors after zero/one-hot/two-hot sample pruning.
- Do not pursue direct barrel-permutation models for ex286 as tested; fixed rotations, bit-reversal rotations, rotate-by-popcount, and small-control rotates were far from exact. Best row match was only `82/8192`.
- Do not pursue finite pair-collision algebra or modular affine pair rules for ex286 as tested; two-hot memorization does not extend to full-table exactness.
- Do not pursue static-feature controlled-swap networks for ex286 with the tested raw/pair/count controls; sampled and full-table smokes stayed near full-table mismatch.
- Do not pursue simple bucket-count histogram/prefix layout for ex286 as tested; exact count-key structure does not reduce to contiguous/rotated thermometer placement.
- Do not pursue BRGC/bit-reversed Gray same-popcount layer successor or small affine rank transforms for ex286 as tested.
- Do not pursue the tested prefix/suffix/Gray input-output coordinate ANF forms for ex286; only one transformed bit becomes low-degree and the remaining terms stay large.
- Do not pursue simple bucket-count collision relaxation/chip-firing for ex286 as tested; even selector-specific policies are far from exact.
- Do not pursue bucket-key min/max canonical representative selection for ex286 as tested; most outputs are not even members of their exact input class.
- Do not pursue exact bucket-key multi-valued MDD emission for ex286 as tested; best graph is still `1710` nodes / width `430`, so it is not the missing reference-scale structure.
- Do not pursue global token-slot maximum matching learned from low-weight behavior for ex286 as tested; it fails on weight<=3 rows.
- Do not pursue degree<=4 fixed-popcount slice-polynomial RTL for ex286 as tested; the central layers have zero exact output bits.
- Do not repeat the simple mod-4 lane parity repair wrapper for ex286; exact but the degree<=4 ANF cone more than doubles ADP.
- Do not repeat lane-parity feature-span formulas over the tested semantic feature sets for ex286; no lane target was exact up to the tested degrees.
- Do not pursue adjacent output-pair orientation encoding for ex286; the orientation hypothesis has `608` conflicts and encoded BDD nodes increase.
- Do not pursue component-wise adjacent output-pair orientation encoding for ex286 as tested; exact but BDD nodes increase.
- Do not pursue component pair-count/orientation field split for ex286 as tested; the exact split leaves full-support pair-count fields as the dominant cost.
- Do not pursue affine/index complement-permutation duality wrappers for ex286 as tested; the expanded exact-sample gate found no candidate and the best base full match was only `140/8192`.
- Do not pursue bucket moment/residue key re-encoding for ex286 as tested; exactness still needs `4608` keys.
- Do not pursue affine/quadratic/count-indicator formulas for ex286 adjacent output pair counts as tested; all finite-field systems were inconsistent.
- Do not pursue tiny min/max/clamp/sum-clip pair-count formulas for ex286 as tested; best match is only `5771/8192`.
- Do not pursue cumulative capacity/window transport for ex286 adjacent pair counts as tested; best match is only `241/8192`.

## Sources

- `student/results/unknown_candidates_current_summary.csv`
- `student/results/unknown_candidates_current_best.csv`

## 2026-06-12 Round10 unknown-top-r10

- Dossier: `student/work/ex200_ex299_frontend_refgap_round10_20260612_1911/unknown-top-r10/ex286/notes/high_level_dossier.md`.
- High-level description: 13-bit Hamming-weight-preserving lossy routing/normalizer; no constant outputs; exact input swap symmetries `(4,5)` and `(6,7)`; current frontend is still multi-pair symcof/bitset probe scale.
- Families tried:
  - `lane_component_shared_bdd`: exact shared BDD with mod-4 lane/component input order and one global node pool.
  - `mod8_output_linear_anf_residual_bdd`: exact GF(2) mod-8 output-linear parity coordinates with shared monomial bank plus residual BDD roots.
- Method signatures:
  - `ex286|hamming_weight_preserving_lossy_routing_normalizer|lane_component_shared_bdd|mod4_lane_order_single_node_pool|yosys_abc_g_aig|abc_xf_official_evaluate|lane_grouped_output_roots`
  - `ex286|hamming_weight_preserving_lossy_routing_normalizer|mod8_output_linear_anf_residual_bdd|shared_monomial_bank_plus_residual_roots|yosys_abc_g_aig|exact_output_linear_coordinates|mod8_lane_reconstruction`
- Official results: both `evaluate.py` OK. Lane BDD `5023/21/105483`; mod8 ANF residual `4489/178/799042`.
- Paths: candidates `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round10_20260612_1911/agent_shards/unknown-top-r10/candidates.csv`; logs under `student/work/ex200_ex299_frontend_refgap_round10_20260612_1911/unknown-top-r10/ex286/logs/`.
- Outcome: no improvement over current frontend `20190`. The mod8 coordinate family confirms shared monomial reuse cuts residual BDD roots but creates unusable delay.
- Next action: keep ex286 blocked on a new nonlinear hidden-state descriptor; do not continue lane-BDD, output-linear ANF repair, bucket/table, symcof/cofactor, rank/colex, Fredkin, token-count, or lane-parity variants unchanged.

## 2026-06-12 Round12 routing-r12 checkpoint

- Dossier: `student/work/ex200_ex299_frontend_refgap_round12_20260612_2015/routing-r12/ex286/notes/high_level_dossier.md`.
- High-level description: 13-bit Hamming-weight-preserving lossy routing/normalizer; exact popcount preservation confirmed; known input swap symmetries `(4,5)` and `(6,7)` used only to choose a collision-first variable order.
- Representation family: `routing_delta_shared_bdd`, modeling `delta = input ^ output` as one shared reduced BDD node pool and reconstructing `out = input ^ delta`. This tests movement/change state directly rather than another output-root BDD, bucket/count/rank/colex table, symcof/cofactor mux, lane-parity repair, or Fredkin replay.
- Method signature: `ex286|hamming_weight_preserving_lossy_routing_normalizer|routing_delta_shared_bdd|collision_first_delta_node_pool|yosys_abc_g_aig|official_evaluate_delta_reconstruction|full_word_delta_xor`.
- Official `evaluate.py` result: `OK`, area `6385`, delay `21`, ADP `134085`; equivalent but far worse than current frontend `20190`.
  - Verilog: `student/work/ex200_ex299_frontend_refgap_round12_20260612_2015/routing-r12/ex286/verilog/ex286_routing_delta_shared_bdd_collision_first.v`
  - AIG: `student/work/ex200_ex299_frontend_refgap_round12_20260612_2015/routing-r12/ex286/aigs/ex286_routing_delta_shared_bdd_collision_first_abc_g_aig.aig`
  - Official evaluate log: `student/work/ex200_ex299_frontend_refgap_round12_20260612_2015/routing-r12/ex286/logs/ex286_routing_delta_shared_bdd_collision_first_abc_g_aig.official_evaluate.log`
  - Shard CSVs: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round12_20260612_2015/agent_shards/routing-r12/`
- Diagnostic evidence: exact delta descriptor has `3629` shared BDD nodes, `3040` unique deltas, and delta popcount histogram `w0:82;w2:607;w4:2084;w6:3062;w8:1920;w10:420;w12:17`.
- Outcome: no improvement; record as `equivalent_but_no_improvement`. Only revisit delta-BDD if a new nonlinear state basis reduces the delta node pool or creates shared arithmetic movement logic.

## 2026-06-12 Round13 unknown-routing-r13 checkpoint

- Dossier: `student/work/ex200_ex299_frontend_refgap_round13_20260612_2045/unknown-routing-r13/ex286/notes/high_level_dossier.md`.
- Method signature: `ex286|hamming_weight_preserving_lossy_routing_normalizer|round13_assignment_rank_descriptor_probe|home_slot_pair_delta_and_rank_select_diagnostics|no_synth|blocked_before_verilog|full_word`.
- Official result: `BLOCKED_NO_VERILOG`; no Verilog/AIG was emitted because the checkpoint diagnostics did not expose a compact exact source distinct from rejected table/cofactor/delta families.
- Diagnostic evidence:
  - Hamming-weight preservation remains exact (`0/8192` mismatches); exact input swaps are `(4,5)` and `(6,7)`.
  - Compact assignment network rows are far from exact: one-hot home OR/XOR matched `62/8192`, and two-hot pair-delta XOR superposition matched `370/8192`.
  - Shared rank/select descriptors are also far from exact: best layer-wise global shift matched `99/8192`.
  - Small semantic home-count descriptor becomes exact only after selecting `raw2;raw1;raw8`, expanding to `4608` keys. This is a table/cofactor-scale descriptor, not a compact routing network.
- Shard CSVs: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round13_20260612_2045/agent_shards/unknown-routing-r13/`.
- Outcome: first-case checkpoint completed as a precise diagnostic-backed blocker, materially different from the round12 collision-first delta-BDD blocker.
- Next action: continue to `ex287` only if the coordinator wants this agent to broaden again; do not emit the exact `4608`-key descriptor as Verilog.

## 2026-06-12 Round17 unknown-flow-r17 hard checkpoint

- Method signature: `ex286|hamming_weight_preserving_lossy_routing_normalizer|pair_transducer_and_invariant_selector_probe|shared_local_pair_state_and_weight_selectors|no_synth|blocked_before_verilog|full_word`.

## 2026-06-13 Targeted Symcof Mux Probe r25

- Campaign: `student/frontend_campaigns/campaigns/ex286_frontend_targeted_symcof_mux_probe_20260613_0403/`.
- High-level description: unchanged exact Hamming-weight-preserving lossy
  routing/normalizer with known input swap symmetries `(4,5)` and `(6,7)`.
  This probe stayed within the current symmetry-cofactor family but changed
  class mux style, BDD group sharing, and a small set of outer-bit selectors.
- Method family:
  `ex286|hamming_weight_preserving_lossy_routing_normalizer|symcof_outer_bitset_*|known_pair_symmetry_key_and_class_mux_bdd_share|yosys_abc_g_aig_official_evaluate|exact_popcount_preserving_unknown|full_word_class_mux`.
- Official `evaluate.py` coverage: 16/16 rows were `OK`. Best observed row
  was `ex286_r25_symcof_f00_bits_0_12_1_10_onehot_global_abc_g_aig`,
  `1346/15/20190`, which ties the current frontend best but does not improve.
  Verilog:
  `student/work/ex286_frontend_targeted_symcof_mux_probe_20260613_0403/local-ex286-symcof/ex286/verilog/ex286_r25_symcof_f00_bits_0_12_1_10_onehot_global_abc_g_aig.v`;
  AIG:
  `student/work/ex286_frontend_targeted_symcof_mux_probe_20260613_0403/local-ex286-symcof/ex286/aigs/ex286_r25_symcof_f00_bits_0_12_1_10_onehot_global_abc_g_aig.aig`;
  log:
  `student/work/ex286_frontend_targeted_symcof_mux_probe_20260613_0403/local-ex286-symcof/ex286/logs/ex286_r25_symcof_f00_bits_0_12_1_10_onehot_global_abc_g_aig.evaluate.py.log`.
- Outcome: no frontend improvement. Case/tree muxes increased delay or area;
  global sharing sometimes reduced area to `1333..1336` but delay rose to
  `18..19`. Selector permutations such as `0:1:10:12` and `12:0:1:10`
  stayed near but above current (`20415` and `20445`). Do not repeat this
  local mux/share/selector neighborhood unless paired with a new hidden-state
  basis outside the current symcof source.
- Official result: `BLOCKED_NO_CANDIDATE`; no Verilog/AIG candidate was emitted, so no `evaluate.py` row is claimed.
- Evidence:
  - Diagnostic report: `student/work/ex200_ex299_frontend_refgap_round17_20260612_2300/unknown-flow-r17/ex286/diagnostics/ex286_compact_routing_probe.md`
  - Diagnostic CSV: `student/work/ex200_ex299_frontend_refgap_round17_20260612_2300/unknown-flow-r17/ex286/diagnostics/ex286_compact_routing_probe.csv`
  - Shard CSVs: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round17_20260612_2300/agent_shards/unknown-flow-r17/`
- Diagnostic outcome: Hamming-weight preservation is exact over `8192/8192` rows and exact input swaps are `(4,5)` and `(6,7)`. The best pair-transducer probe (`outside_in_pair_scan_step_6`) still has `198` conflict keys and only `5950/8192` majority rows. Compact invariant selectors become exact only with `8192` keys, which is table-scale.
- Next action: do not broaden this agent until the coordinator accepts the ex286 blocked checkpoint; future ex286 progress needs a genuinely new nonlinear compact state, not table/BDD/cofactor/rank/colex/round16 descriptor replay.

## 2026-06-12 Round18 unknown-flow-r18 checkpoint

- method_signature: `ex286|hamming_weight_preserving_lossy_routing_normalizer|round18_benes_fredkin_layer_flow_screen|shared_compare_swap_predicates_and_token_layers|no_synth|blocked_before_verilog|full_word`
- official result: `BLOCKED_NO_CANDIDATE`; no Verilog/AIG was emitted, so no `evaluate.py` row is claimed.
- paths:
  - dossier: `student/work/ex200_ex299_frontend_refgap_round18_20260612_2321/unknown-flow-r18/ex286/notes/high_level_dossier.md`
  - blocker evidence: `student/work/ex200_ex299_frontend_refgap_round18_20260612_2321/unknown-flow-r18/ex286/diagnostics/ex286_round18_blocker.md`
  - shard CSVs: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round18_20260612_2321/agent_shards/unknown-flow-r18/`
- outcome: After `ex287` blocked, round18 continued to `ex286` and screened the requested Benes/Fredkin-style layer-local token-flow direction without replaying the round17 compact transducer. The blocker is that controlled-swap evidence remains far from exact: greedy Fredkin mismatches only improved to `8014/8192`, static-feature controlled-swap sampled mismatch stayed `1301/1352`, and round17's best transducer still had `198` conflict keys. Exact fallback selectors remain table-scale (`4608` to `8192` keys).
- next action: Progress needs a new nonlinear compact routing state before any swap-network RTL. Do not continue with small static controlled-swap, round17 compact transducer, bucket/key, rank/colex, symcof/cofactor, or lane-parity repair variants unchanged.

## 2026-06-13 02:50:51 +0800 Round22 unknown-a-r22

- method_signature: `ex286|hamming_weight_preserving_lossy_routing_normalizer|compact_pair_state_and_lane_count_descriptor_screen|shared_pair_descriptors_and_lane_count_state|no_synth|blocked_before_verilog|full_word`
- official result: `BLOCKED_NO_CANDIDATE`; no Verilog/AIG was emitted, so no `evaluate.py` row is claimed.
- evidence: `student/work/ex200_ex299_frontend_refgap_round22_20260613_0218/unknown-a-r22/ex286/diagnostics/ex286_round22_screen.md`
- shard CSVs: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round22_20260613_0218/agent_shards/unknown-a-r22/`
- outcome: screened compact pair-state controlled routing and lane/count normalizer descriptors. Popcount preservation is exact, but pair-state exactness needs 4608 keys and compact lane/count majority reaches only 1217/8192 rows.
- next action: do not emit a key-table/cofactor repeat; ex286 needs a new nonlinear routing state before candidate generation.

## 2026-06-13 04:24:00 +0800 targeted symcof inner-BDD order probe

- campaign: `student/frontend_campaigns/campaigns/ex286_frontend_inner_order_probe_20260613_0424/`
- high-level description: unchanged 13-bit Hamming-weight-preserving lossy routing/normalizer with exact input swap symmetries `(4,5)` and `(6,7)`.
- hypothesis family: keep current explicit outer-bit symcof partition `0:12:1:10`, but reorder the inner BDD variables so class cofactors share fewer nodes. This is materially different from the previous mux/share/selector neighborhood because the outer partition is fixed and only the inner BDD order changes.
- pre-synth diagnostic: current interleave inner order has `2257` group BDD nodes; `outside_in` order `11:2:9:3:8:4:7:5:6` reduced that to `2151`; `sym_last` order `2:3:8:9:11:4:5:6:7` reduced it to `2200`.
- official `evaluate.py` results: 4/4 equivalent, no frontend improvement.
  - best row: `ex286_r26_symcof_f00_bits_0_12_1_10_inner_outside_in_onehot_abc_g_aig` at `1349/16/21584`, worse than current frontend `1346/15/20190` and reference `198/12/2376`.
  - case-mux and `sym_last` variants were worse: `21648`, `22816`, `23008` ADP.
- paths:
  - candidates: `student/frontend_campaigns/campaigns/ex286_frontend_inner_order_probe_20260613_0424/results/candidates.csv`
  - best Verilog from this probe: `student/work/ex286_frontend_inner_order_probe_20260613_0424/local-ex286-innerorder/ex286/verilog/ex286_r26_symcof_f00_bits_0_12_1_10_inner_outside_in_onehot_abc_g_aig.v`
  - best AIG from this probe: `student/work/ex286_frontend_inner_order_probe_20260613_0424/local-ex286-innerorder/ex286/aigs/ex286_r26_symcof_f00_bits_0_12_1_10_inner_outside_in_onehot_abc_g_aig.aig`
  - best evaluate log from this probe: `student/work/ex286_frontend_inner_order_probe_20260613_0424/local-ex286-innerorder/ex286/logs/ex286_r26_symcof_f00_bits_0_12_1_10_inner_outside_in_onehot_abc_g_aig.evaluate.py.log`
- outcome: lower BDD node count did not translate to ADP because Yosys/ABC increased critical delay from `15` to `16`. Do not repeat plain inner-order tuning around outer bits `0:12:1:10`; only revisit if paired with a delay-reducing class mux or a different hidden-state basis.

## 2026-06-13 05:27:00 +0800 Round25 unknown-sym-r25

- Campaign shard: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round25_20260613_0506/agent_shards/unknown-sym-r25/`.
- Dossier: `student/work/ex200_ex299_frontend_refgap_round25_20260613_0506/unknown-sym-r25/ex286/notes/high_level_dossier.md`.
- High-level description: 13-bit Hamming-weight-preserving lossy routing/normalizer with known input swap symmetries `(4,5)` and `(6,7)`.
- Families tried:
  - `fixed_popcount_layer_decision_forest`: shared popcount decoder plus per-weight exact decision forests.
  - `input_xor_delta_coordinate_shared_bdd`: shared BDD for `out ^ in`, reconstructing `out = in ^ delta`.
  - `output_gray_coordinate_shared_bdd`: shared BDD for output Gray coordinates, reconstructing with prefix XOR.
- Method signatures:
  - `ex286|hamming_weight_preserving_lossy_routing_normalizer|fixed_popcount_layer_decision_forest|shared_popcount_layer_decoder_and_layer_trees|yosys_abc_g_aig|official_evaluate|full_word_layer_forest`
  - `ex286|hamming_weight_preserving_lossy_routing_normalizer|input_xor_delta_coordinate_shared_bdd|single_delta_bdd_node_pool_pair_late_order|yosys_abc_g_aig|official_evaluate|delta_xor_reconstruction`
  - `ex286|hamming_weight_preserving_lossy_routing_normalizer|output_gray_coordinate_shared_bdd|single_gray_bdd_node_pool_pair_late_order|yosys_abc_g_aig|official_evaluate|gray_prefix_xor_reconstruction`
- Official `evaluate.py` results: 3/3 equivalent, no frontend improvement. Results were `10763/34/365942`, `2748/20/54960`, and `2715/42/114030`; best was `ex286_r25_delta_shared_bdd_pair_late`, still worse than current frontend `20190` and reference `2376`.
- Paths: Verilog/AIG/logs under `student/work/ex200_ex299_frontend_refgap_round25_20260613_0506/unknown-sym-r25/ex286/`; summary rows in the campaign shard CSVs.
- Outcome: the tested fixed-popcount layer forest and transformed-coordinate BDD families are exact but not close to current, confirming that simple popcount layering or `out^in`/Gray coordinate transforms do not expose the reference-scale structure. Do not repeat unchanged; a future attempt needs a new nonlinear hidden state beyond symcof, delta-BDD, and layer-tree forms.


## 2026-06-13 05:39:00 +0800 Round26 unknown-sym-r26

- Campaign shard: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round26_20260613_0539/agent_shards/unknown-sym-r26/`.
- Dossier: `student/work/ex200_ex299_frontend_refgap_round26_20260613_0539/unknown-sym-r26/ex286/notes/high_level_dossier.md`.
- Families tried:
  - `component_pairfield_shared_bdd`: adjacent-pair count/orientation encoded output with one shared BDD node pool.
  - `component_pairfield_split_bdd`: same descriptor with separate count and orientation BDD node pools.
  - `hidden_order_local_rule_screen`: no-synth blocker unless local-rule conflicts disappear.
- Best official candidate: `ex286_r26_pairfield_shared_bdd` at `2308/21/48468`; evaluate log `student/work/ex200_ex299_frontend_refgap_round26_20260613_0539/unknown-sym-r26/ex286/logs/ex286_r26_pairfield_shared_bdd.evaluate.py.log`.
- Hidden-order screen: best full exact bits `0`, conflicts `37855`, evidence `student/work/ex200_ex299_frontend_refgap_round26_20260613_0539/unknown-sym-r26/ex286/diagnostics/ex286_hidden_order_local_screen.csv`.
- Outcome: no success is claimed unless `evaluate.py` candidate rows beat the frontend/reference columns in the shard CSVs.

## 2026-06-14 09:57:48 +0800 unknown-ex286-agent

- Campaign shard: `student/frontend_campaigns/campaigns/ex223_ex299_frontend_parallel_deep_20260614_0943/agent_shards/unknown-ex286-agent/`.
- Dossier: `student/work/ex223_ex299_frontend_parallel_deep_20260614_0943/unknown-ex286-agent/ex286/notes/high_level_dossier.md`.
- High-level description: 13-bit Hamming-weight-preserving lossy routing/normalizer; exact bucket/selector guardrail is real but remains table-scale. This run avoided current symcof selector/inner-order replay and tested two bucket-descriptor source forms.
- Families tried:
  - `bucket_count_cover_sop`: shared home-bucket counters plus selector wires and invalid-key cube-cover SOP terms.
  - `bucket_class_decision_dag`: shared home-bucket counters plus a reduced full-word descriptor MTBDD.
- Method signatures:
  - `ex286|hamming_weight_preserving_lossy_routing_normalizer|bucket_count_cover_sop_selectors_first|shared_home_bucket_counters_invalid_key_cube_cover|yosys_abc_g_aig|abc_xf_official_evaluate|per_output_cover_terms`
  - `ex286|hamming_weight_preserving_lossy_routing_normalizer|bucket_class_mtbdd_selectors_then_counts|shared_home_bucket_counters_fullword_descriptor_dag|yosys_abc_g_aig|abc_xf_official_evaluate|full_word_mtbdd_leaves`
- Official `evaluate.py` results: 2/2 equivalent, no frontend improvement.
  - `ex286_bucket_count_cover_sop_selectors_first`: `7012/16/112192`, evaluate log `student/work/ex223_ex299_frontend_parallel_deep_20260614_0943/unknown-ex286-agent/ex286/logs/ex286_bucket_count_cover_sop_selectors_first.evaluate.py.log`.
  - `ex286_bucket_class_mtbdd_selectors_then_counts`: `3736/22/82192`, evaluate log `student/work/ex223_ex299_frontend_parallel_deep_20260614_0943/unknown-ex286-agent/ex286/logs/ex286_bucket_class_mtbdd_selectors_then_counts.evaluate.py.log`.
- Outcome: no new frontend best; `best_improvements.csv` is header-only. Do not repeat bucket count covers, key table/BDD/MTBDD, or current symcof selector neighborhoods unchanged. A future attempt needs a new nonlinear routing state or recurrence that avoids the `4608`-key bucket guardrail scale before RTL emission.

## 2026-06-14 12:32:04 +0800 unknown-hard-r4

- Campaign shard: `student/frontend_campaigns/campaigns/ex204_ex299_frontend_continuation_20260614_1216/agent_shards/unknown-hard-r4/`.
- Dossier: `student/work/ex204_ex299_frontend_continuation_20260614_1216/unknown-hard-r4/ex286/notes/high_level_dossier.md`.
- High-level description: 13-bit Hamming-weight-preserving lossy routing/normalizer with exact input swap symmetries `(4,5)` and `(6,7)`. This run avoided unchanged symcof/onehot and raw `out^in` delta replay by screening non-identity source descriptors.
- Families tried:
  - `routing_residual_shared_bdd`: reconstruct `out = base(in) ^ residual(in)` with one shared residual BDD node pool. Best screened base was `paircanon_rotl1`, order `outside_in`, `1460` residual BDD nodes.
  - `boundary_layer_residual_bypass`: exact low/high Hamming-weight boundary source decode plus middle-layer residual BDD. Best screened base was `paircanon_rotl1`, order `outside_in`, boundary `1`, `1589` residual BDD nodes.
- Method signatures:
  - `ex286|hamming_weight_preserving_lossy_routing_normalizer|routing_residual_shared_bdd|base_paircanon_rotl1_order_outside_in_nodes_1460|yosys_abc_g_aig|official_evaluate_residual_reconstruction|full_word_residual_xor`
  - `ex286|hamming_weight_preserving_lossy_routing_normalizer|boundary_layer_residual_bypass|base_paircanon_rotl1_order_outside_in_nodes_1589|yosys_abc_g_aig|official_evaluate_residual_reconstruction|boundary_source_decode_plus_middle_residual`
- Official `evaluate.py` results: 2/2 equivalent, no frontend improvement.
  - `ex286_r4_routing_residual_shared_bdd_paircanon_rotl1_outside_in_all_rows_abc_g_aig`: `2757/21/57897`.
  - `ex286_r4_boundary_layer_residual_bypass_paircanon_rotl1_outside_in_middle_bdd_edge1_abc_g_aig`: `3151/31/97681`.
- Paths: Verilog/AIG/logs under `student/work/ex204_ex299_frontend_continuation_20260614_1216/unknown-hard-r4/ex286/`; shard CSVs under the campaign shard above.
- Outcome: no official improvement over current frontend `1346/15/20190`. Do not repeat non-identity paircanonical residual BDD or boundary-layer residual bypass unchanged; the source decode adds delay/area and still does not expose the missing compact nonlinear routing state.

## 2026-06-14 12:50:02 +0800 unknown-hard-r5

- Campaign shard: `student/frontend_campaigns/campaigns/ex204_ex299_frontend_continuation_20260614_1216/agent_shards/unknown-hard-r5/`.
- Dossier: `student/work/ex204_ex299_frontend_continuation_20260614_1216/unknown-hard-r5/ex286/notes/high_level_dossier.md`.
- Families tried: current-best source full-word case compression, bounded selector-minimized pair-key class BDD word case, output-plane XOR-mask source reuse, and restricted hard-bit residual selector table. This avoided r4 paircanon residual BDD and boundary-layer bypass.
- Official `evaluate.py` results: 4/4 equivalent, no frontend improvement. Best row was `ex286_r5_current_source_word_case_abc_g_aig` at `1364/15/20460`, versus current frontend `1346/15/20190`. Other rows were `33192`, `33192`, and `55252` ADP.
- Paths: Verilog/AIG/logs under `student/work/ex204_ex299_frontend_continuation_20260614_1216/unknown-hard-r5/ex286/`; run summary under `student/runs/unknown/ex204_ex299_frontend_continuation_20260614_1216/unknown-hard-r5/ex286/`.
- Outcome: no new frontend best. The full-word case rewrite is near but larger than the existing onehot source; selector `1_3_9` and restricted residual tables are exact but area/delay dominated.

## 2026-06-14 23:20:22 +0800 structural-decomp ex286 follow-up

- Campaign: `student/frontend_campaigns/campaigns/ex286_ex287_frontend_structural_decomp_20260614_2320/`.
- Families tried: rot5/state shared BDD, low11 default-xor correction, onehot route superposition, selector/case recuts, exact bucket-key cube cover, adjacent-pair component orientation encoded BDD, symmetry-key encoded cofactor BDD, two-hot collision-lift residuals, and output-image/Hamming-weight reconstruction.
- Official best in this campaign: current-source recut tied the existing frontend best at `1346/15/20190`; no new ex286 best was found.
- Best materially new exact rows were still worse: `ex286_orientbdd_keycof_k4_f11_abc_g_aig` at `2071/17/35207`, `ex286_orientbdd_keycof_k4_f00_abc_g_aig` at `2107/18/37926`, and `ex286_r3_image_popcount_skip4` at `1487/27/40149`.
- Paths: merged campaign rows in `student/frontend_campaigns/campaigns/ex286_ex287_frontend_structural_decomp_20260614_2320/results/evaluation_results.csv`.
- Do not repeat unchanged: exact bucket-key cube cover, component orientation encoded BDD/cofactor, two-hot XOR-superposition or pair-collision residual BDD, and image-field reconstruction through popcount recovery. Ex286 still needs a different hidden-state basis than the ex287 global adjacent-pair orientation clue.

## 2026-06-14 23:20 structural-decomp follow-up

- New frontend best: `ex286_linhyb_sweep_raw_3_5_6_8_f00_global_abc_g_aig` official evaluate.py OK, area/delay/ADP `1338/15/20070`.
- Source Verilog: `student/work/ex286_ex287_frontend_structural_decomp_20260614_2320/coordinator-ex286-linear-hybrid/ex286/verilog/ex286_linhyb_sweep_raw_3_5_6_8_f00_global.v`
- Source AIG: `student/work/ex286_ex287_frontend_structural_decomp_20260614_2320/coordinator-ex286-linear-hybrid/ex286/aigs/ex286_linhyb_sweep_raw_3_5_6_8_f00_global_abc_g_aig.aig`
- Evaluate log: `student/work/ex286_ex287_frontend_structural_decomp_20260614_2320/coordinator-ex286-linear-hybrid/ex286/logs/ex286_linhyb_sweep_raw_3_5_6_8_f00_global_abc_g_aig.evaluate.py.log`
- Method: selective output-linear/raw-coordinate hybrid over the hamming-weight-preserving routing normalizer; preserve the previous symcof/cofactor source for hard outputs and replace selected cheap output coordinates with a shared cofactored BDD bank.
- Result: small improvement over prior frontend best `20190` by `120` ADP. Broad orient-kx, full output-linear basis, truth-keybdd, and outer-BDD variants did not beat this; future work should target the selector/critical-path structure rather than resweeping nearby raw-bit subsets.
