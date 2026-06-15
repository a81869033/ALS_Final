# ex284 Frontend Attempts

## Current Best

- Current best frontend: `ex284_prefix_parity_full_clamp_basic_abc_g_aig`, area `200`, delay `39`, ADP `7800`.
- Reference: ADP `4240`.
- Gap: `2.03x` reference ADP.

## Already Tried

- Tried generic unknown variants: `value_case`, `expr_default_exception`, `high_split_default`, `low_split_default`, `rotate_high_split_default`, `rotate_low_split_default`, `decision_tree_greedy`.
- Top results: `rotate_high_split_default:96620`; `rotate_low_split_default:96620`; `low_split_default:253092`; `high_split_default:358656`; `expr_default_exception:455242`.
- Algebraic/ANF/Davio/support-LUT candidates exist under `student/work/reverse_unknown_algebraic_20260603_2305_algebraic_safe/ex284`, but they are not the current tracked best.
- 2026-06-08 ANF/Davio interleave check: official `evaluate.py` OK; raw `2198/38/83524`, synthflow `1749/38/66462`, both worse than shared-BDD synthflow.
- 2026-06-08 transformed-key BDD check: official `evaluate.py` OK; best `bit_reverse_interleave` was `2103/29/60987`, worse than shared-BDD synthflow `50083`.
- 2026-06-08 cofactor-BDD source rewrite: official `evaluate.py` OK; best one-bit cofactor was `low1` at `1832/29/53128`, worse than shared-BDD synthflow.
- 2026-06-08 width-minus-one split/default was not continued to a completed ex284 AIG because the same family was already catastrophically worse for ex281-ex283.
- 2026-06-08 MTBDD diagnostic: direct vector-valued interleave MTBDD had `57156` nodes versus `758` scalar shared-BDD nodes, so no seed was emitted.
- 2026-06-08 split/BDD grouped-bit hybrid: official replay OK; limited synthflow best was `2224/27/60048`, worse than shared-BDD synthflow.
- 2026-06-08 interleave shared-BDD run: official `evaluate.py` OK; new run-level best `1826/29/52954`; kept in run/work artifacts pending final class seed curation.
- 2026-06-08 BDD synthflow run: official `evaluate.py` OK for all variants; `abc_g_aig` improved to `1727/29/50083`; kept in run/work artifacts pending final class seed curation.
- 2026-06-08 selected-bit BDD run: official `evaluate.py` OK for `support8`/`support10`; best was `1977/29/57333`, worse than BDD synthflow.
- 2026-06-08 prefix/suffix parity ANF: exact, but direct prefix ANF was `3517/44/154748`; limited synthflow best `2725/43/117175`, rejected.
- 2026-06-08 prefix parity transformed-key BDD: exact and low-area. Linear prefix key reached `1431/45/64395` after synthflow; reduction-XOR key reached `1459/38/55442`.
- 2026-06-08 prefix-key top-k cofactor BDD found the new best. Top5 raw reached `1342/37/49654`; limited `abc_g_aig` synthflow produced `1303/36/46908`. Top6 regressed to `1353/40/54120`.
- 2026-06-08 prefix-key AC/canonical/per-bit follow-ups: AC `phi+h` synthflow best was `1571/42/65982`; canonical cofactor reproduced the current score (`1303/36/46908`); per-bit endpoint synthflow best was `1341/42/56322`.
- 2026-06-08 one-hot prefix-key cofactor mux: exact top5/top6 plus all-row limited synthflow. Best was top5 `abc_g_aig` at `1310/36/47160`, only `252` ADP worse than current, but still no new best.
- 2026-06-08 raw identity ANF/Davio confirmed degree-4 structure but synthflow best was `1749/38/66462`, worse than cofactor rows.
- 2026-06-08 inner BDD order matrix found the first new win: `top6 onehot endpoint_rev` raw `1276/36/45936`; limited `abc_g_aig` synthflow improved to `1227/35/42945`.
- 2026-06-08 top7/top8 were exact but worse, so wider outer selectors were rejected.
- 2026-06-08 class-level one-hot mux factoring improved again. Limited `abc_g_aig` synthflow on `top6 classonehot endpoint_rev` reached `1184/36/42624`, beating the prior `46908` by `4284` ADP and superseding the inner-order win.
- 2026-06-08 class-SOP selector minimization was exact but worse after synthflow (`1256/35/43960`). Classcase raw best was `1367/37/50579`; classonehottree synthflow reached `1249/36/44964`, also worse than classonehot.
- 2026-06-08 split-factorized prefix-key ANF was exact and officially replayed, but best was `3251/31/100781`, worse than current.
- 2026-06-08 classonehot low-bit ANF override was exact and officially replayed, but best low4 row was `1793/34/60962`, worse than current.
- 2026-06-08 reverse-output `5*x` residual diagnostics showed no compact correction: integer `5*x` raised residual degree, carryless `5*x` remained raw-sized, and high-zero slice matched only `8/256` points.
- 2026-06-08 split/classonehot bit hybrid was exact and officially replayed, but best selected high-bit row was `1642/33/54186`, worse than current `1184/36/42624`.
- 2026-06-08 layered ANF/Davio low-degree skeleton split was exact and officially replayed. Best row `identity_deg1_best_residual` was `2315/39/90285`, worse than current; low-degree separation did not reduce the residual Davio bottleneck.
- 2026-06-08 top6 class-rule canonicalization was exact and officially replayed. Best row `classrulesonehot_endpoint_rev` was `1261/37/46657`, worse than current `1184/36/42624`; compact class predicates did not remove the cofactor/mux bottleneck.
- 2026-06-08 masked word-pattern ANF over prefix-key relative offsets was exact and officially replayed, but synthesized to `4996/30/149880`, far worse than current; full masked vector-stencil expansion is area-heavy.
- 2026-06-08 full prefix-key Davio was exact and officially replayed. Best-residual order was `1097/44/48268`; endpoint order reached `1099/42/46158`. Narrow synthflow then made `abc_g_aig` a new current best at `921/42/38682`, beating classonehot current by `3942` ADP.
- 2026-06-08 prefix-Davio low-degree threshold split (`deg1/2/3`) was exact and officially replayed. Best raw was `deg1 endpoint_rev` at `1142/39/44538`; narrow synthflow improved it to the new current best `969/39/37791`, trading area for a 3-level delay reduction versus full-Davio `abc_g_aig`.
- 2026-06-08 Davio/classonehot selected-bit hybrids were exact and officially replayed. Raw high-half classonehot replacement reached lower delay `1255/34/42670`, but area dominated. `abc_g_aig` best was bits `12..15` at `1003/39/39117`, still worse than active degree-1 Davio current.
- 2026-06-08 grouped prefix-Davio output order was exact and officially replayed. Best after `abc_g_aig` was `deg0 high4 depth` at `921/42/38682`, worse than active degree-1 threshold current.
- 2026-06-09 high-leverage semantic diagnostic emitted no seed. Elementary-symmetric prefix/suffix scan solved zero bits; local edge/range scan still left `962` residual monomials in the tested grammar; shifted-key word AND/XOR basis had no exact solution; fixed-polarity RM did not improve over baseline `1964` terms; output reverse did not reduce word-pattern count; prefix-state residual count reached `958` at k=10 and `11999` at k=15; ABC DSD gave no useful decomposition; `5*x`/shift-add variants matched only a few points.
- 2026-06-09 mux-coordinate hybrid found the first large-drop structure. Degree-2 mux-coordinate ANF solves bits `0,1,2,3,4,5,6,7,8,9,10,11,13`; residual bits `12,14,15` use Davio. Raw best was `518/41/21238`; limited `abc_g_aig` improved to `434/41/17794`.
- 2026-06-09 full-width mux-coordinate extension removed residual Davio entirely. Flat full-coordinate `abc_g_aig` reached `429/35/15015`; grouped pair factorization with `full_clamp_grouped` reached raw `289/37/10693` and current `247/37/9139` after `abc_g_aig`. Delay-target `abc_g_aig_d18..d21` tied plain `abc_g_aig`.
- 2026-06-09 refined grouped follow-ups: simplified coordinate with reduction key was exact but worse (`259/36/9324`). Incremental keychain plus simplified coordinate reached current best `233/37/8621` after `abc_g_aig`. Delay targets tied plain `abc_g_aig`.
- 2026-06-09 shared quadratic compressor: exact pair-matrix decomposition into products of linear forms `(xor mc) & (xor mc)`. Raw best was `215/39/8385`; limited `abc_g_aig` improved to new current best `200/39/7800`, ratio `1.84x` reference. Delay-target `abc_g_aig_d18..d21` tied plain `abc_g_aig`.
- 2026-06-09 rank compressor: low-rank decomposition is exact but area-heavy. Best rank raw was `308/36/11088`; tiny `abc_g_aig` replay improved to `257/36/9252`, still worse than active compressor.
- 2026-06-09 direct-XOR compressor smoke: direct reduction-XOR emission for linear forms was exact but worse. Best raw was `267/40/10680`, so it was not expanded.

## Do Not Repeat Blindly

- Rotation split ties for best, but still far from reference.
- Shared-BDD plus `abc_g_aig` is now the best exact frontend seed but delay is high; next work should seek a lower-depth source form or semantic classifier.
- Direct low-support LUT overrides were worse; selected-bit work needs a different source form.
- Plain ANF/Davio interleave and basic synthflow are exact but delay-dominated; do not repeat without a different decomposition.
- Do not repeat `gray`/`ungray`/`bit_reverse` transformed-key BDD for this case without a materially different source rewrite.
- Do not repeat simple one-bit `low1`/`high1`/`center1` cofactor-BDD; exact but did not improve delay and increased area.
- Do not spend more time on width-minus-one split/default for this family unless there is a new compression idea; ex281-ex283 completed rows were area-dominated.
- Do not repeat direct vector-valued MTBDD without a different reduction/root-grouping idea; diagnostic node count was much larger than scalar shared-BDD.
- Do not repeat grouped rotated-split high-bit overrides on the shared-BDD source; raw and limited synthflow rows were exact but worse than current.
- Do not repeat direct prefix/suffix parity ANF or plain/reduction parity-key BDD; top-k prefix-key cofactor BDD dominates them.
- Do not repeat top6 for this case without a different selector/mux source form; top5 was better.
- Do not repeat generic AC `phi+h`, canonical case-mux sharing, per-bit endpoint BDD, raw identity ANF/Davio, or top7/top8 as tested.
- Classonehot is no longer active best after prefix-Davio `abc_g_aig`; keep it as a lower-delay/high-area comparison point. Class-SOP, classcase, and classonehottree were exact but worse, and the old top5/top6 one-hot rows are superseded.
- Do not repeat floor/ceil split-factorized ANF or classonehot low4/low5 ANF override as tested; both were exact but much worse.
- Do not expand rotate-high split/classonehot selected-bit hybrids as tested; exact but worse.
- Do not repeat identity layered ANF/Davio thresholds `1/2/3`; exact but worse than current.
- Do not repeat top6 class-rule canonicalization as tested; exact but worse than current.
- Do not repeat full masked word-pattern ANF over all prefix-key relative offsets; exact but much worse.
- Do not repeat full prefix-key Davio endpoint/best-residual orders under default synthesis; `abc_g_aig` is the active useful flow. Future work should target Davio delay, not another identical flow.
- Do not repeat uniform prefix-Davio threshold split beyond the accepted ex284 `deg1 endpoint_rev` row; degree2/degree3 area grows too quickly.
- Do not repeat simple Davio/classonehot selected-bit hybrids for ex284; high-bit replacement lowers delay, but the area tradeoff is worse than degree-1 Davio current.
- Do not repeat broad grouped-Davio grid for ex284; degree-1 endpoint_rev remains better.
- Do not repeat the 2026-06-09 big-structure diagnostics as tested: pure elementary-symmetric scan, edge-fixed local range scan, simple shifted-key word ops, fixed global RM polarity, one-direction prefix-state scan, ABC direct DSD, or `5*x` correction.
- Do not repeat bilinear-rank split ANF or all-bit degree-3 mux-coordinate ANF as tested; exact but worse than the degree-2 mux-coordinate hybrid.
- Do not repeat residual-Davio mux-coordinate hybrid or flat full-coordinate emit as active sources; grouped full-clamp factorization dominates both for this case.
- Do not repeat direct/balanced XOR emit or dual high/low grouping as tested; exact but worse. Keychain simplified is the active ex284 variant.
- Keychain simplified/grouped full-clamp is now superseded by shared quadratic compressor; keep it only as a comparison/fallback source.
- Do not repeat naive rank decomposition for ex284 without a better basis/correction-sharing strategy; exact but worse than active compressor.
- Do not repeat direct-XOR compressor linear-form emission as tested; exact but area-heavy.
- Prefix-Davio degree-1 endpoint_rev is now superseded as current best; use it only as a residual/reference source.

## Sources

- `student/results/unknown_candidates_current_summary.csv`
- `student/results/unknown_candidates_current_best.csv`

## 2026-06-13 02:50:51 +0800 Round22 unknown-a-r22

- method_signature: `ex284|quartic_gf2_event_filter|raw_low_degree_anf_and_simple_equivariance_screen|shared_monomial_bank_or_rotation_recurrence|no_synth|blocked_before_verilog|full_word`
- official result: `BLOCKED_NO_CANDIDATE`; no Verilog/AIG was emitted, so no `evaluate.py` row is claimed.
- evidence: `student/work/ex200_ex299_frontend_refgap_round22_20260613_0218/unknown-a-r22/ex284/diagnostics/ex284_round22_screen.md`
- shard CSVs: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round22_20260613_0218/agent_shards/unknown-a-r22/`
- outcome: screened raw/shared low-degree ANF monomial bank and simple rotation/reverse structural recurrence; raw ANF remains degree 4 with 7732 terms, and best simple equivariance covers only 4642/65536 rows.
- next action: do not emit another raw ANF/equivariance source; ex284 needs a materially different compressor/basis than the prior shared quadratic compressor.
