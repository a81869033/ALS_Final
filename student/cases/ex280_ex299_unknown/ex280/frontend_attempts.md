# ex280 Frontend Attempts

## Current Best

- Current best frontend: `ex280_prefix_parity_reduce_full_clamp_basic_abc_g_aig`, area `152`, delay `31`, ADP `4712`.
- Prior best after backend search: area `820`, delay `21`, ADP `17220`.
- Reference: area `161`, delay `15`, ADP `2415`.
- Gap after shared quadratic compressor synthflow: `1.95x` reference ADP.
- 2026-06-08 interleave shared-BDD check: `977/21/20517`, official `evaluate.py` OK, not better than `ex280_sift_449`.

## Already Tried

- Generic unknown structural seeds: `value_case`, `expr_default_exception`, `high_split_default`, `low_split_default`, `rotate_high_split_default`, `rotate_low_split_default`, `decision_tree_greedy`.
- Generic best from that batch: `rotate_high_split_default`, area `1392`, delay `15`, ADP `20880`.
- Shared BDD orders: `natural`, `reverse`, `ex280_sift_449`, `ex280_sift_alt`, plus targeted pair orders.
- Targeted BDD/Davio pair orders: best targeted structure was `bdd_pair_399a`, area `1049`, delay `22`, ADP `23078`; Davio variants were worse.
- Algebraic/ANF/Davio/support-LUT candidates were generated under `student/work/reverse_unknown_algebraic_20260603_2305_algebraic_safe/ex280`.
- ECA search: searched elementary cellular automata style transitions, no exact semantic hit.
- GF/power-map style search: tried finite-field-like power-map hypothesis, no exact hit.
- 2026-06-08 diagnostic run found low-support bits 0/1 and a compact interleave BDD order, but the emitted interleave BDD was slightly worse than the existing sift BDD.
- 2026-06-08 selected-bit BDD run: official `evaluate.py` OK for `support8`/`support10`; best was `1029/22/22638`, worse than prior BDD.
- 2026-06-08 ANF/Davio/support-LUT check: official `evaluate.py` OK; best was `anf_davio_interleave` at `1143/25/28575`, worse than prior BDD.
- 2026-06-08 prefix/suffix parity ANF: exact, but best direct prefix ANF was `1935/34/65790`; limited synthflow best `1514/34/51476`, rejected as delay/area dominated.
- 2026-06-08 prefix parity transformed-key BDD: exact and low-area. Linear prefix key best `772/32/24704` after synthflow; reduction-XOR key improved to `796/29/23084`.
- 2026-06-08 prefix-key top-k cofactor BDD: exact. Best was top6 plus `abc_g_aig` at `731/25/18275`, closer than prior frontend BDD but still worse than archived backend current `820/21/17220`. Top7 regressed to `1019/33/33627`.
- 2026-06-08 prefix-key AC/canonical/per-bit follow-ups: generic `phi+h` AC best after synthflow was `865/29/25085`; canonical cofactor reproduced top-k (`731/25/18275`); per-bit endpoint BDD synthflow best was `753/28/21084`, all worse than current.
- 2026-06-08 one-hot prefix-key cofactor mux: exact; all top5/top6 rows plus `abc_g_aig`/`synth_preset` were checked. Best was `769/25/19225`, worse than top6 cofactor and archived backend current.
- 2026-06-08 endpoint-pair FSM and tree mux smoke checks were exact but rejected: FSM was `8749/85/743665`, tree muxes were `839/28/23492` and `873/27/23571`.
- 2026-06-08 raw identity ANF/Davio confirmed algebraic degree 4, but best limited synthflow was only `929/25/23225`; useful as semantic evidence, not as a seed.
- 2026-06-08 inner BDD order and filtered synthflow checks found a better frontend near miss: top6 onehot endpoint_rev reached `753/24/18072`, still worse than archived current `17220`.
- 2026-06-08 top7/top8 and non-prefix selector checks were exact but worse. Best non-prefix row was `0_1_3_8_9` at `1578/24/37872`, so the BDD-node selector metric was rejected.
- 2026-06-08 class-level one-hot, class-SOP, classcase, and classonehottree mux factoring were exact but did not beat current. Best classonehot synthflow was `729/25/18225`; classonehottree synthflow reached `726/25/18150`; best classsop synthflow was `743/25/18575`; classcase raw best was `803/25/20075`.
- 2026-06-08 semantic/source diagnostics rejected simple bit-reversed elementary CA and sparse GF(2) power maps for this case; no exact seed was emitted from those diagnostics.
- 2026-06-08 high=0 half-width carryless/integer multiplication diagnostics and sampled fixed local recurrence checks did not find an exact compact semantic formula.
- 2026-06-08 reverse-output `5*x` residual diagnostics showed no compact correction: integer `5*x` raised residual degree, carryless `5*x` remained raw-sized, and high-zero slice matched only `6/64` points.
- 2026-06-08 split-factorized prefix-key ANF was exact and officially replayed, but best was `1756/28/49168`, worse than current.
- 2026-06-08 classonehot low-bit ANF override was exact and officially replayed, but best low4 row was `1217/27/32859`, worse than current.
- 2026-06-08 custom inner BDD order `[3,7,8,4,5,6]` for top6 classonehot was exact and officially replayed, but raw `858/27/23166` was worse than current.
- 2026-06-08 layered ANF/Davio low-degree skeleton split was exact and officially replayed. Best row `identity_deg1_best_residual` was `1198/27/32346`, worse than current; low-degree separation did not reduce the residual Davio bottleneck.
- 2026-06-08 top6 class-rule canonicalization was exact and officially replayed. Best row `classrulesonehot_endpoint_rev` was `780/25/19500`, still worse than archived current `17220`; compact class predicates did not remove the cofactor/mux bottleneck.
- 2026-06-08 masked word-pattern ANF over prefix-key relative offsets was exact and officially replayed, but synthesized to `3103/28/86884`, far worse than current; full masked vector-stencil expansion is area-heavy.
- 2026-06-08 full prefix-key Davio was exact and officially replayed. Best-residual order reached `703/36/25308`; endpoint_rev improved to `696/31/21576`, still worse than archived current. This is a low-area/high-delay structural signal, not a standalone seed.
- 2026-06-08 narrow prefix-Davio synthflow replay was official `evaluate.py` OK for all rows. `abc_g_aig` improved endpoint_rev to `602/31/18662`, a lower-area near miss but still worse than archived current `17220`.
- 2026-06-08 prefix-Davio low-degree threshold split (`deg1/2/3`) was exact and officially replayed. Best raw was `deg1 endpoint_rev` at `742/31/23002`; narrow synthflow improved it to `622/31/19282`, still worse than full-Davio synthflow and archived current.
- 2026-06-08 grouped prefix-Davio order was exact and officially replayed. Broad grouped run found `deg1 split4 depth + abc_g_aig` at `643/27/17361`, only `141` ADP worse than archived current. Ex280-only group-size refinement then found the new current best `deg1 high4 node + abc_g_aig` at `623/27/16821`, beating archived current by `399` ADP.
- 2026-06-09 high-leverage semantic diagnostic emitted no seed. Elementary-symmetric prefix/suffix scan solved zero bits; local edge/range scan still left `279` residual monomials; shifted-key word AND/XOR basis had no exact solution; fixed-polarity RM random best only changed `932 -> 924` terms; output reverse did not reduce word-pattern count; prefix-state residual count grew to `668` at k=10; ABC DSD gave no useful decomposition; `5*x`/shift-add variants matched only a few points.
- 2026-06-09 mux-coordinate hybrid found the first large-drop structure. `mc[i] = key[i] ? (key[n-2-i] ^ key[n-1-i]) : key[i+1]` plus boundary key bits makes output bits `0,1,2,3,4,5,6,7,9` degree-2 over `mc`; residual bits `8,10,11` use Davio. Raw best was `436/30/13080`; limited `abc_g_aig` improved to `357/30/10710`.
- 2026-06-09 full-width mux-coordinate extension removed the residual Davio bits. Flat full-coordinate degree-2 replay was exact; `full_mod + abc_g_aig` reached `301/25/7525`. Grouped pair factorization rewrote shared pair terms as `mc[b] & xor(group)`; `full_clamp_grouped` raw was `221/28/6188`, and `abc_g_aig` reached current best `195/28/5460`. Delay-target `abc_g_aig_d18..d21` tied plain `abc_g_aig`.
- 2026-06-09 refined grouped follow-ups: direct/balanced XOR emit and dual high/low grouping were exact but worse. Simplifying full-clamp coordinate branches to raw input bits reached `186/29/5394` after `abc_g_aig`; using incremental `prefix_parity` key emission with the same simplified coordinate reached current best `185/29/5365`. Delay targets tied plain `abc_g_aig`.
- 2026-06-09 shared quadratic compressor: decomposed the exact mux-coordinate pair matrix into shared products of linear forms `(xor mc) & (xor mc)`. Raw best was `162/31/5022`; limited `abc_g_aig` improved to new current best `152/31/4712`. Delay-target `abc_g_aig_d18..d21` tied plain `abc_g_aig`.
- 2026-06-09 rank compressor: low-rank decomposition is exact and lowered some raw delay, but area was too high. Best rank raw was `222/30/6660`; tiny `abc_g_aig` replay improved to `196/30/5880`, still worse than active compressor.
- 2026-06-09 direct-XOR compressor smoke: direct reduction-XOR emission for linear forms was exact. Best raw was `212/30/6360`; one row reached delay `27` but area `239`, so ADP stayed worse than active compressor.

## Do Not Repeat Blindly

- Re-running generic split/rotation/tree templates is unlikely to close the gap.
- Re-running backend only is not the active path here; frontend grouped-Davio now beats the archived backend current.
- Do not repeat direct low-support selected-bit LUT overrides without a different source rewrite.
- Do not repeat plain ANF/Davio/support-LUT algebraic RTL without a different decomposition; exact but worse than BDD.
- Do not repeat direct prefix/suffix parity ANF or plain parity-key BDD; top-k prefix-key cofactor BDD dominates them.
- Do not repeat top7 prefix-key cofactor for this case without a different mux/source form; it was exact but worse than top6.
- Do not repeat generic AC `phi+h`, canonical case-mux sharing, per-bit endpoint BDD, or top5/top6 one-hot mux as tested; all were exact but worse.
- Do not repeat endpoint-pair FSM, tree2/tree3 mux, raw identity ANF/Davio, top7/top8, non-prefix five-bit selector, classonehot, classsop, classcase, or classonehottree rows as tested; all exact but worse than archived current.
- Do not repeat floor/ceil split-factorized ANF or classonehot low4/low5 ANF override as tested; both were exact but much worse.
- Do not expand small custom inner-order tweaks; the best ex280 node-count order did not map to AIG improvement.
- Do not pursue `reverse(out) = 5*x + small correction`; residual diagnostics did not simplify.
- Do not repeat identity layered ANF/Davio thresholds `1/2/3`; exact but worse than current.
- Do not repeat top6 class-rule canonicalization as tested; exact but worse than current.
- Do not repeat full masked word-pattern ANF over all prefix-key relative offsets; exact but much worse.
- Do not repeat full prefix-key Davio endpoint/best-residual orders as default standalone RTL; `abc_g_aig` is the useful flow, but the best row still misses current.
- Do not repeat uniform prefix-Davio threshold split for ex280; exact but worse than full-Davio `abc_g_aig`.
- Do not repeat the same broad grouped-Davio grid for ex280. Future work should refine around `deg1 high4 node`, not restart from cofactor/classonehot.
- Do not repeat the 2026-06-09 big-structure diagnostics as tested: pure elementary-symmetric scan, edge-fixed local range scan, simple shifted-key word ops, fixed global RM polarity, one-direction prefix-state scan, ABC direct DSD, or `5*x` correction.
- Do not repeat bilinear-rank split ANF or all-bit degree-3 mux-coordinate ANF as tested; exact but much worse than the degree-2 mux-coordinate hybrid.
- Grouped prefix-Davio and the residual-Davio mux-coordinate hybrid are now superseded as current best; use them only as comparison sources.
- Do not repeat flat full-width mux-coordinate emit as the active source; grouped full-clamp factorization dominates it for this case.
- Do not repeat direct/balanced XOR emit or dual high/low grouping as tested; exact but worse. Keychain simplified is the active ex280 variant.
- Keychain simplified/grouped full-clamp is now superseded by shared quadratic compressor; keep it only as a comparison/fallback source.
- Do not repeat naive rank decomposition for ex280 without a better basis/correction-sharing strategy; exact but worse than active compressor.
- Do not repeat direct-XOR compressor linear-form emission as tested; exact but area-heavy.
- Need a new semantic or much stronger structural hypothesis.

## Sources

- `student/results/unknown_candidates_current_summary.csv`
- `student/results/target_ex280_bdd_eval_best.csv`
- `student/results/target_ex280_structure_best.csv`
- `student/runs/unknown/ex280_backend_opt_20260604/results/best.csv`
- `student/archive/cleanup_20260605/ex280_backend_intermediate/results/ex280_backend_search_post_delay_mock_best.csv`
