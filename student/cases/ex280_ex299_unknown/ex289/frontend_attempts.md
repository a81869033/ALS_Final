# ex289 Frontend Attempts

## Current Best

- Current best frontend: `ex289_unknown_duality_symcof_split2_f10_bits_0_1_12_13_onehot_group_xor_abc_g_aig`, area `1047`, delay `19`, ADP `19893`.
- Reference: ADP `13620`.
- Gap: `1.46x` reference ADP; this is within the `1.5x` target (`20430`).

## Already Tried

- Tried generic unknown variants: `value_case`, `expr_default_exception`, `high_split_default`, `low_split_default`, `rotate_high_split_default`, `rotate_low_split_default`, `decision_tree_greedy`.
- Top results: `decision_tree_greedy:46263`; `rotate_high_split_default:50220`; `rotate_low_split_default:50220`; `low_split_default:125580`; `high_split_default:459984`.
- Algebraic/ANF/Davio/support-LUT candidates exist under `student/work/reverse_unknown_algebraic_20260603_2305_algebraic_safe/ex289`, but they are not the current tracked best.
- 2026-06-08 diagnostic shared-BDD run: official `evaluate.py` OK; interleave BDD improved to `1767/23/40641`.
- 2026-06-08 BDD synthflow run: official `evaluate.py` OK for all variants; `abc_g_aig` improved to `1737/23/39951`.
- 2026-06-08 symmetry-canonical BDD run: exact `swap_in_4_5` canonical key was verified with official `evaluate.py`; `interleave_f00` improved current best to `1818/21/38178`.
- 2026-06-08 symmetry-BDD synthflow run: official `evaluate.py` OK; `synth_preset` improved current best again to `1733/21/36393`.
- 2026-06-08 secondary symmetry-BDD synthflow run: official `evaluate.py` OK; all tested delay/gate-set variants were worse than `synth_preset`.
- 2026-06-08 split/symmetry grouped-bit hybrid: official replay OK; grouped rotate-split high-bit overrides on the symmetry-BDD source were exact, but best was `2567/21/53907`, worse than current.
- 2026-06-09 symmetry cofactor class-onehot run: transferred the ex280-ex284 cofactor/class-onehot source rewrite to the `swap_in_4_5` canonical key. Official `evaluate.py` OK; new current best `1755/19/33345` (`interleave_f00_k4`), improving previous current by `3048` ADP.
- 2026-06-09 symmetry cofactor order smoke: `reverse`, `natural`, and `sym_first` orders were official exact but far worse; best was `17936/22/394592`.
- 2026-06-09 multi-pair symmetry diagnostic found exact input symmetries `(4,5)`, `(6,7)`, `(8,9)`, and `(10,11)`, but multi-pair cofactor rows did not beat the single-pair cofactor current.
- 2026-06-09 limited synthflow on the single-pair cofactor source: `abc_g_aig` improved current to `1745/18/31410`.
- 2026-06-09 case-mux source style reduced raw area but did not improve current after `abc_g_aig`; best case-mux synthflow was `1719/19/32661`.
- 2026-06-09 raw multi-pair BDD was official exact but worse.
- 2026-06-09 popcount semantic diagnostic: verified `popcount(out) == popcount(in)` for all `65536` truth rows. This points to a conservative token-routing / controlled-swap style structure. Pure compare-exchange is rejected because the function is not bitwise monotone; transferred mux-coordinate degree-2/3 solved zero bits; weighted-sum best matched only `145/65536`; quadratic-at-origin residual BDD grew from `1131` to `4681` nodes; popcount-layer BDD node sum was `16069`, worse than raw.
- 2026-06-09 conservative-routing diagnostics: no exact `total_count + interval_count` output-bit predicates, all output bits have full support, and the previous-width direct embedding check from ex288 failed. This rejects simple local/count-boundary recurrences in the raw order.
- 2026-06-09 selector cofactor run: outer bits `(0,1,12,13)` with case mux was official exact and improved raw ADP to `1435/21/30135`. Limited `abc_g_aig` replay was exact and produced new current best `1428/19/27132`, improving previous current `31410` by `4278` ADP. `abc_g_aig_d18` and `abc_g_aig_d20` tied plain `abc_g_aig`.
- 2026-06-09 k3 selector follow-up: outer bits `(0,1,12)` were official exact but much worse (`1821/22/40062` case, `1859/24/44616` onehot). Do not shrink this selector source to k3.
- 2026-06-09 selector01 scan: among all k4 selectors containing `(0,1)`, `(0,1,12,13)` remains the best by diagnostic node count (`3402` nodes), so no adjacent k4 selector in that scoped family is a better next candidate.
- 2026-06-09 bounded token-routing diagnostics: global rotation/reflection, radius<=4 local line/ring rules, prefix-balance transducers with lookahead<=6, and rank-context maps all had large conflicts; no exact compact token-routing RTL form was found.
- 2026-06-09 nested selector-tree mux replay of the selector source was official exact but worse (`1489/23/34247` for explicit selector).
- 2026-06-09 multi-pair selector transfer combined exact pairs `(4,5),(6,7),(8,9),(10,11)` with selector `(0,1,12,13)`. Raw best was exact `1401/21/29421`; limited synthflow found new best `1325/19/25175` with `synth_preset`, improving prior current `27132` by `1957` ADP but still above the 1.5x target `20430`.
- 2026-06-09 low-weight/semantic probes rejected weighted data-dependent rotate, low-degree one-hot position polynomial, and hidden unate comparator polarity as large-drop structures.
- 2026-06-09 popcount-layer diagnostic: layer outputs are many-to-one but not small canonical placements; central layer `w8` still has `1193` unique outputs. No output pair implication/equality constraints were found.
- 2026-06-09 correct four-pair pair-count MDD `reverse` was official exact but much worse (`1903/21/39963`), so ternary pair-count MDD does not beat the current multi-pair selector.
- 2026-06-09 conservative big-jump diagnostic: output-state insertion recurrence is not exact (`natural` order has `11588` conflicts); small-slot matching/parking is not compact (`cap8` still fails `36694/65536` rows, including a two-hot row); generalized symmetry gives only the known invariant swaps `(4,5)`, `(6,7)`, `(8,9)`, `(10,11)`; simple layer-rank maps match only tiny fractions; independent 4-bit block scatter misses `65251/65536` rows; simple prefix/suffix count transport tops out at `34807/65536`.
- 2026-06-09 pair-interaction diagnostic: two-hot output matrices have several low-rank bits (`2/4/6/7/8/10/11/14`), but two-hot behavior is not determined by the one-hot output-slot pair (`70` slot-pair conflicts). Degree-2-from-low-weight formulas match only about half the full table, and checked residual BDDs are larger than raw bit BDDs. No seed was emitted.
- 2026-06-09 top-k/layer diagnostic: simple top-k score families were not promising. After ex286-ex288 full-table failures, ex289 sample-only tiny top-k matched only `54/604` sampled rows in the best family.
- 2026-06-09 complement/reverse duality diagnostic found an exact ex289-only symmetry: `f(~x) = ~reverse(f(x))` for all `65536/65536` rows. This does not hold for ex286-ex288.
- 2026-06-09 duality half-BDD source was exact but still worse: best raw `1176/24/28224`, and limited synthflow reached `1114/23/25622`.
- 2026-06-09 duality plus multi-pair symmetry cofactor/class-onehot source was exact and produced a new current best after limited `abc_g_aig`: `1115/22/24530`, improving previous `25175` by `645` ADP. It is still above the `1.5x` target `20430`.
- 2026-06-09 duality+symcof selector follow-up tested `(0,1,12,13,14)`, `(0,1,2,12,13)`, `(0,1,11,12,13)`, and `(0,1,13,14)` with `f00/f10`; all rows were exact, but best after synthflow was `1331/19/25289`, worse than the new current.
- 2026-06-09 duality split-bit rewrite: using split bit 2 instead of MSB for the representative half-domain was exact and much better. Raw split2 `(0,1,12,13)` reached `1097/21/23037`; limited `abc_g_aig` produced new current best `1046/20/20920`, only `490` ADP above the `1.5x` target `20430`.
- 2026-06-09 split2 follow-ups: selected-bit hybrid with the old low-delay source was exact but area-heavy (`26588` best raw); selector/policy sweep and mux/share checks found no better row; split-bit matrix confirmed split2 is the best tested split.
- 2026-06-09 split2 order/share sweep: after fixing the duality symcof generator to actually emit `group/global` share styles, `interleave` remained the only competitive inner order. `reverse`, `natural`, and `sym_first` were exact but much worse; best raw stayed `f00 onehot group/global` at `1097/21/23037`, with `f10 case` near at `1100/21/23100`.
- 2026-06-09 XOR-form duality wrapper: rewriting the split2 wrapper as `rep = in ^ dual` and `out = selected_base ^ dual` exposed a lower-delay `f10 onehot` source. Raw `f10 onehot xor` was exact at `1101/20/22020`; limited `abc_g_aig` replay produced new current best `1047/19/19893`, passing the `1.5x` target.
- 2026-06-09 semantic big-jump diagnostic: iterative application has many nontrivial cycles, so it is not a normalizer; slot arithmetic still matched only `145/65536`; treating ex289 as a 4-variable truth-table input transform under the 384 NPN input phase/permutation transforms covered only `3678/65536` rows, so NPN canonicalization is not the hidden structure.
- 2026-06-09 rank/linear diagnostic: GF(2) input/output relation nullity was `1`, so only global parity is available for XOR repair. Best layer rank-affine relation was weak (`20/8008` on layer 10).
- 2026-06-09 finite collision/algebra diagnostic: hidden labels such as `home_occ` can memorize all two-hot rows (`120/120`), but the shared pair-correction XOR superposition matches only `2001/65536` full rows with bit accuracy `0.546066`. Symmetric modular affine pair rules are weaker (`14/120` best). This does not replace the known split2 complement/reverse duality structure.
- 2026-06-09 static-feature controlled-swap sampled diagnostic: raw-bit, symmetry-pair, bucket/prefix/suffix count controls did not produce a strong routing lead. After 12 greedy mux-swap layers, best sample mismatch was `1562/1594` from identity and `1557/1594` from pair-canonical start. This does not replace the known split2 complement/reverse duality structure.
- 2026-06-09 bucket-count prefix/layout diagnostic: tested whether exact bucket counts plus selectors form a histogram-to-output layout using bucket/output orders and selector-controlled offsets. Best was only `150/65536` rows (`bucket_segment`, `slot_desc`, `onehot_slots_rev_first`) with bit match `0.528376`. This does not replace the known split2 complement/reverse duality structure.
- 2026-06-09 Gray-layer order diagnostic: tested BRGC-filtered, bit-reversed Gray, and related same-popcount layer orders with per-layer shift/affine/direct rank transforms. Best was only `194/65536` rows (`affine`, `rev_gray_value->gray_value`) with bit match `0.529182`. This does not replace the known split2 complement/reverse duality structure.
- 2026-06-09 input/output coordinate ANF diagnostic: narrow ex289 follow-up checked raw input with raw/reverse/prefix/suffix/onehot output-coordinate transforms for ex280-ex284-style low-degree collapse. Best was only `1/16` exact transformed bits at degree <=4 (`raw->prefix_natural`), with `93244` total ANF terms. This does not replace the known split2 complement/reverse duality structure.
- 2026-06-09 bucket-count collision-relaxation diagnostic: treated exact one-hot home bucket counts as initial occupancy and tested parking carry, binary carry, balanced nearest parking, and line/cycle sandpile rules with selector-specific policies. Best was only `177/65536` rows, bit match `0.538828`. This does not replace the known split2 complement/reverse duality structure.
- 2026-06-09 image/canonical representative diagnostic: output image has `7045` unique values; exact bucket-key class output is in its own input class only `162/20736` classes, and best min/max representative model matches only `141/20736` classes. This does not replace the known split2 complement/reverse duality structure.
- 2026-06-09 exact bucket-key multi-valued MDD diagnostic: treated the exact bucket counts and selectors as true multi-valued variables instead of binary-encoded key bits. Full-order/policy scan found best `bit_shared/reuse_mode/entropy_desc` with `4898` nonterminal nodes, max width `1404`, `2` terminals, and `20736` mapped keys. This is much larger than the current split2 duality+symcof source and does not improve the already-in-target `19893` ADP path; no RTL seed emitted.
- 2026-06-09 global token-slot matching diagnostic: tested maximum-weight assignment using weights learned from one-hot, two-hot, and low3 rows. Even on the weight<=3 gate, best was only `101/697` rows (`low3_freq`, home bonus `16`, home order, low tie, identity output), so learned matching/preference assignment is not the missing conservative-routing structure. This does not replace the split2 complement/reverse duality source. No RTL seed emitted.
- 2026-06-09 fixed-popcount slice polynomial diagnostic: checked whether each output bit is a low-degree GF(2) polynomial on each Hamming-weight layer. Degree<=3 solved only `128/272` layer-bits; degree<=4 improved to `160/272` by covering boundary layers, but central layer `w8` had `0/16` exact output bits even with feature rank `1820`. This does not replace the split2 complement/reverse duality source; no RTL seed emitted.
- 2026-06-09 arbitrary output-linear ANF diagnostic: word-level Mobius/nullspace over output linear combinations found degree<=4 nullity `4/16`, with clean mod-4 lane parity masks `0x1111:0x2222:0x4444:0x8888` and term counts `108:154:98:132`. This is a semantic clue, but it does not replace the current split2 duality source.
- 2026-06-09 lane-parity semantic feature-span diagnostic: tested whether the mod-4 output lane parity targets can be expressed more cheaply from input lane parity, home-lane counts, raw pair signals, bucket count bits, or bucket selector bits. Degree 1/2 broad features and degree 3 smaller features solved zero lane targets. This does not replace the split2 duality source.
- 2026-06-09 output-linear high-degree ANF diagnostic: nullity grows to `8/16` at degree<=8 with clean mod-8 masks, but term counts are large (`534..704`), so direct coordinate emission is not competitive with split2 duality.
- 2026-06-09 corrected image-constraint and adjacent-pair orientation diagnostic: output image has no degree 1/2 constraints and `28` degree-3 constraints. These constraints show all mixed adjacent output pairs share one orientation bit, exact over the full table. However, pair-count+orientation encoding increases raw shared-BDD nodes `1131 -> 1206`, and current split2 duality remains better.
- 2026-06-09 component-wise adjacent-pair orientation diagnostic: all adjacent output pairs are one component, matching the global orientation result. Encoding remains exact but increases raw shared-BDD nodes `1131 -> 1206`, so no RTL seed emitted.
- 2026-06-09 component pair-field split diagnostic: the global orientation bit is cheap (`41` BDD nodes), but pair-count fields still cost `1172` nodes with full support (`16/16`). This is much weaker than the current split2 duality + symcof XOR source and was not emitted as RTL.
- 2026-06-09 affine complement-duality diagnostic: base affine/rotate/reverse P/Q search correctly rediscovered the known exact `id|reverse` relation (`274/274` low-weight, `65536/65536` full). Pair-composed exact-sample hashing also found exact known-pair-swap-equivalent variants, consistent with existing input pair symmetries. This is sanity evidence only; no new seed emitted because split2 duality+symcof XOR remains current.
- 2026-06-09 bucket moment-coordinate diagnostic: greedy scalar moments `oddmask:moment_revlin:selmix_m4:selmix_m3:sel2` were exact (`65536/65536`) but still required `20480` keys, only slightly below the exact bucket-key class count and far weaker than the current split2 duality source. Prefix/modulo vector families were not exact.
- 2026-06-09 output pair-count linear diagnostic: mod-101 affine/quadratic/count-indicator checks over adjacent output pair counts had zero exact hits (`0/56`). This does not replace the current split2 duality source or make pair-count/orientation encoding seed-worthy.
- 2026-06-09 output pair-count tiny piecewise diagnostic: bounded min/max/clamp/sum-clip checks had zero exact formulas. Best was pair_count_0 with `mn2_4:mx2_4`, only `34957/65536`, and does not compete with split2 duality.
- 2026-06-09 output pair-count cumulative transport diagnostic: prefix-capacity/window transport over exact bucket counts plus selector offsets found no exact formula; best was `prefix_capacity`, bucket `asc`, pair `asc_rot4`, offset `zero`, only `1074/65536`. This does not compete with split2 duality.

## Do Not Repeat Blindly

- Duality split2 + multi-pair selector `(0,1,12,13)` with `f10 onehot xor` wrapper plus `abc_g_aig` is current best. The older `f00 onehot` split2 row, MSB-split duality source, and multi-pair selector `synth_preset` rows are superseded.
- Shared-BDD plus synthflow remains close, but delay is still high.
- Do not repeat secondary symmetry-BDD synthflow variants `abc_d20/21/22`, `abc_fast`, `abc_g_simple`, `abc_g_and_mux`, or `synth_preset_noabc`.
- Do not repeat grouped rotate-split high-bit overrides on the symmetry-BDD source; exact but worse than current.
- Do not repeat non-interleave symmetry cofactor orders; they are area-explosive even when exact.
- Do not repeat raw multi-pair BDD as tested; it lowers no active metric enough to matter.
- Do not repeat case-mux style as tested; lower area was offset by delay and ADP stayed worse than current.
- Future work should search for semantic output sharing or compact class predicates before backend tuning.
- Do not repeat the tested mux-coordinate/quadratic transfer, direct weighted modular sum, quadratic-origin residual BDD, elementary CA sample, combinadic rank map, or popcount-layer BDD forms. The next plausible large-drop path is a non-monotone conservative token-routing / controlled-swap model.
- Do not repeat simple `total_count + interval_count` predicates or direct width insert/delete embedding as tested.
- Do not repeat `abc_g_aig_d18/d20` on the selector `(0,1,12,13)` case source; they tied plain `abc_g_aig`.
- Do not repeat k3 selector `(0,1,12)` in the same source form.
- Do not repeat nested selector-tree mux for the selector source; exact but delay worsened.
- Do not repeat bounded local/FSM token-routing, weighted rotate, one-hot position polynomial, or hidden-unate comparator forms without a new coordinate transform.
- Do not repeat pair-count MDD in the tested `reverse` form; exact but much worse than current.
- Do not repeat output-mask-only insertion recurrences, small candidate-slot matching/parking, generalized swap/output-permutation symmetry scans, simple layer-rank maps, independent 4-bit block scatter, or simple prefix/suffix count transport for ex289; all failed as large-drop structures.
- Do not repeat simple two-hot pair-slot interaction or degree-2-from-low-weight residual BDD as tested; both failed to expose a large-drop source form.
- Do not repeat simple top-k score selection for ex289 as tested; sample evidence was weak after ex286-ex288 full-table failures.
- Do not repeat raw duality half-BDD, MSB-split duality+symcof, tested alternate duality+symcof selectors, or selected-bit hybrid with the old low-delay source without a new delay/area sharing idea; exact but worse than the new current.
- Do not repeat split2 `reverse`/`natural`/`sym_first` inner orders or `f10 case` synthflow as tested; all were exact but worse than `f10 onehot xor`.
- Do not repeat iterative normalizer, slot arithmetic/rotate, or 4-variable NPN input-transform canonicalization as tested for ex289; all failed as explanations of the current good source.
- Do not repeat layer-rank affine maps for ex289 as tested.
- Do not pursue broader layer-wise combination-rank/unrank transforms for ex289 as tested; despite exact split2 duality, the best simple rank transform matched only `20/1820` and had zero exact layers.
- Do not pursue direct interval-run relocation/superposition for ex289 as tested; next-combination, interval OR/XOR, modular multiply, reversed-domain multiply, and rotate variants were far from exact. Best row match was only `368/65536`.
- Do not pursue direct barrel-permutation models for ex289 as tested; fixed rotations, bit-reversal rotations, rotate-by-popcount, and small-control rotates were far from exact. Best row match was only `162/65536`.
- Do not pursue finite pair-collision algebra or modular affine pair rules for ex289 as tested; two-hot memorization does not extend to full-table exactness, unlike the separate split2 duality wrapper.
- Do not pursue static-feature controlled-swap networks for ex289 with the tested raw/pair/count controls; sampled mismatch stayed near full sample size, unlike the separate split2 duality wrapper.
- Do not pursue simple bucket-count histogram/prefix layout for ex289 as tested; exact count-key structure does not reduce to contiguous/rotated thermometer placement, unlike the separate split2 duality wrapper.
- Do not pursue BRGC/bit-reversed Gray same-popcount layer successor or small affine rank transforms for ex289 as tested; unlike the separate split2 duality wrapper, they are far from exact.
- Do not pursue the tested prefix/suffix/Gray output-coordinate ANF forms for ex289; only one transformed bit becomes low-degree, unlike the separate split2 duality wrapper.
- Do not pursue simple bucket-count collision relaxation/chip-firing for ex289 as tested; even selector-specific policies are far from exact, unlike the separate split2 duality wrapper.
- Do not pursue exact bucket-key multi-valued MDD emission for ex289 as tested; best graph is `4898` nodes / width `1404`, much worse structurally than the split2 duality route.
- Do not pursue global token-slot maximum matching learned from low-weight behavior for ex289 as tested; it fails on weight<=3 rows and is weaker than split2 duality.
- Do not pursue degree<=4 fixed-popcount slice-polynomial RTL for ex289 as tested; the central layer has zero exact output bits.
- Do not expand the simple mod-4 lane parity repair wrapper to ex289 without a cheaper shared parity implementation; ex286 smoke was exact but much worse, and ex289 already has a stronger split2-duality path.
- Do not repeat lane-parity feature-span formulas over the tested semantic feature sets for ex289; no lane target was exact up to the tested degrees.
- Do not pursue adjacent output-pair orientation encoding as a standalone ex289 source; exact but encoded BDD nodes increase and split2 duality is already stronger.
- Do not pursue component-wise adjacent output-pair orientation encoding for ex289 as tested; exact but encoded BDD nodes increase.
- Do not pursue component pair-count/orientation field split for ex289 as tested; orientation is cheap but pair-count generation remains full-support and split2 duality already dominates.
- Do not repeat affine/index complement-permutation duality discovery for ex289; it rediscovers known `id|reverse` plus input-pair-swap-equivalent relations and does not improve the active split2 XOR wrapper.
- Do not pursue bucket moment/residue key re-encoding for ex289 as tested; exactness still needs `20480` keys and is dominated by split2 duality.
- Do not pursue affine/quadratic/count-indicator formulas for ex289 adjacent output pair counts as tested; all finite-field systems were inconsistent.
- Do not pursue tiny min/max/clamp/sum-clip pair-count formulas for ex289 as tested; best match is only `34957/65536`.
- Do not pursue bucket-key min/max canonical representative selection for ex289 as tested; most outputs are not even members of their exact input class, unlike the separate split2 duality wrapper.
- Do not pursue cumulative capacity/window transport for ex289 adjacent pair counts as tested; best match is only `1074/65536`, far weaker than the current split2 duality wrapper.

## Sources

- `student/results/unknown_candidates_current_summary.csv`
- `student/results/unknown_candidates_current_best.csv`
