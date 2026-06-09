# ex283 Frontend Attempts

## Current Best

- Current best frontend: `ex283_prefix_parity_reduce_full_clamp_simplified_basic_abc_g_aig`, area `181`, delay `36`, ADP `6516`.
- Reference: ADP `3168`.
- Gap: `2.51x` reference ADP.

## Already Tried

- Tried generic unknown variants: `value_case`, `expr_default_exception`, `high_split_default`, `low_split_default`, `rotate_high_split_default`, `rotate_low_split_default`, `decision_tree_greedy`.
- Top results: `rotate_high_split_default:99640`; `rotate_low_split_default:111520`; `low_split_default:130504`; `high_split_default:231506`; `expr_default_exception:303885`.
- Algebraic/ANF/Davio/support-LUT candidates exist under `student/work/reverse_unknown_algebraic_20260603_2305_algebraic_safe/ex283`, but they are not the current tracked best.
- 2026-06-08 ANF/Davio interleave check: official `evaluate.py` OK; raw `1992/34/67728`, synthflow `1584/34/53856`, both worse than shared-BDD synthflow.
- 2026-06-08 transformed-key BDD check: official `evaluate.py` OK; best `bit_reverse_interleave` was `1847/27/49869`, worse than shared-BDD synthflow `38844`.
- 2026-06-08 cofactor-BDD source rewrite: official `evaluate.py` OK; best one-bit cofactor was `high1` at `1624/27/43848`, worse than shared-BDD synthflow.
- 2026-06-08 width-minus-one split/default recovery: official `evaluate.py` OK for completed rows; best recovered row `rotate0_low14` was `58241/22/1281302`, far worse than current.
- 2026-06-08 MTBDD diagnostic: direct vector-valued interleave MTBDD had `28788` nodes versus `672` scalar shared-BDD nodes, so no seed was emitted.
- 2026-06-08 split/BDD grouped-bit hybrid: official replay OK; limited synthflow best was `2361/25/59025`, worse than shared-BDD synthflow.
- 2026-06-08 interleave shared-BDD run: official `evaluate.py` OK; new run-level best `1638/27/44226`; kept in run/work artifacts pending final class seed curation.
- 2026-06-08 BDD synthflow run: official `evaluate.py` OK for all variants; `abc_g_aig` improved to `1494/26/38844`; kept in run/work artifacts pending final class seed curation.
- 2026-06-08 selected-bit BDD run: official `evaluate.py` OK for `support8`/`support10`; best was `1654/27/44658`, worse than BDD synthflow.
- 2026-06-08 prefix/suffix parity ANF: exact, but direct prefix ANF was `3125/41/128125`; limited synthflow best `2382/41/97662`, rejected.
- 2026-06-08 prefix parity transformed-key BDD: exact and low-area. Linear prefix key reached `1245/43/53535` after synthflow; reduction-XOR key reached `1266/39/49374`.
- 2026-06-08 prefix-key top-k cofactor BDD found the new best. Top5 raw first reached `1176/33/38808`; top6 raw improved to `1173/32/37536`; limited `abc_g_aig` synthflow produced `1133/32/36256`.
- 2026-06-08 prefix-key AC/canonical/per-bit follow-ups: AC `phi+h` synthflow best was `1363/39/53157`; canonical cofactor reproduced the top-k score (`1133/32/36256`); per-bit endpoint synthflow best was `1207/36/43452`.
- 2026-06-08 one-hot prefix-key cofactor mux found the new best. Raw top6 one-hot lowered delay to `30` but area rose (`1246/30/37380`); limited `abc_g_aig` recovered area enough for `1189/30/35670`, beating prior current by `586` ADP.
- 2026-06-08 raw identity ANF/Davio confirmed degree-4 structure but synthflow best was `1584/34/53856`, worse than cofactor rows.
- 2026-06-08 inner-order matrix and filtered synthflow were exact but did not beat one-hot current; best filtered row was `1110/33/36630`.
- 2026-06-08 class-level one-hot mux factoring found a new current best. Raw `top6 classonehot endpoint` was already `1145/31/35495`; limited `abc_g_aig` synthflow improved it to `1107/31/34317`, beating the prior `35670` by `1353` ADP.
- 2026-06-08 class-SOP selector minimization was exact but worse after synthflow (`1124/34/38216`). Classcase raw best was `1222/32/39104`; classonehottree synthflow reached `1092/32/34944`, also worse than classonehot.
- 2026-06-08 split-factorized prefix-key ANF was exact and officially replayed, but best was `2671/30/80130`, worse than current.
- 2026-06-08 classonehot low-bit ANF override was exact and officially replayed, but best low4 row was `1629/30/48870`, worse than current.
- 2026-06-08 reverse-output `5*x` residual diagnostics showed no compact correction: integer `5*x` raised residual degree, carryless `5*x` remained raw-sized, and high-zero slice matched only `7/128` points.
- 2026-06-08 layered ANF/Davio low-degree skeleton split was exact and officially replayed. Best row `identity_deg1_best_residual` was `2059/35/72065`, worse than current; low-degree separation did not reduce the residual Davio bottleneck.
- 2026-06-08 top6 class-rule canonicalization was exact and officially replayed. Best row `classrulesonehot_endpoint_rev` was `1128/37/41736`, worse than current `1107/31/34317`; compact class predicates did not remove the cofactor/mux bottleneck.
- 2026-06-08 masked word-pattern ANF over prefix-key relative offsets was exact and officially replayed, but synthesized to `4438/30/133140`, far worse than current; full masked vector-stencil expansion is area-heavy.
- 2026-06-08 full prefix-key Davio was exact and officially replayed. Best-residual order was `1049/46/48254`; endpoint_rev improved to `1034/35/36190`. Narrow synthflow then made `abc_g_aig` a new current best at `851/35/29785`, beating classonehot current by `4532` ADP.
- 2026-06-08 prefix-Davio low-degree threshold split (`deg1/2/3`) was exact and officially replayed. Best raw was `deg1 endpoint_rev` at `1043/39/40677`; narrow synthflow improved it to `872/39/34008`, still worse than full-Davio current.
- 2026-06-08 Davio/classonehot selected-bit hybrids were exact and officially replayed. Raw best was high bits `8..14` at `1171/32/37472`; `abc_g_aig` best was bits `11..14` at `1005/33/33165`, still worse than active Davio current.
- 2026-06-08 grouped prefix-Davio output order was exact and officially replayed. Best after `abc_g_aig` was `deg0 perbit depth` at `929/36/33444`, lower delay but worse ADP than full-Davio current because area increased.
- 2026-06-09 high-leverage semantic diagnostic emitted no seed. Elementary-symmetric prefix/suffix scan solved zero bits; local edge/range scan still left `735` residual monomials in the tested grammar; shifted-key word AND/XOR basis, fixed-polarity RM, one-direction prefix-state scan, ABC DSD, and `5*x` correction did not show an exact compact structure.
- 2026-06-09 mux-coordinate hybrid found the first large-drop structure. Degree-2 mux-coordinate ANF solves bits `0,1,2,3,4,5,6,7,8,9,10,12`; residual bits `11,13,14` use Davio. Raw best was `494/36/17784`; limited `abc_g_aig` improved to `405/36/14580`.
- 2026-06-09 full-width mux-coordinate extension removed residual Davio entirely. Flat full-coordinate `abc_g_aig` reached `378/37/13986`; grouped pair factorization with `full_clamp_grouped` reached raw `284/35/9940` and current `236/35/8260` after `abc_g_aig`. Delay-target `abc_g_aig_d18..d21` tied plain `abc_g_aig`.
- 2026-06-09 refined grouped follow-ups: simplified full-clamp coordinate branches reached current best `227/35/7945` after `abc_g_aig`. Incremental keychain simplified was exact but worse (`245/37/9065`). Delay targets tied plain `abc_g_aig`.
- 2026-06-09 shared quadratic compressor: exact pair-matrix decomposition into products of linear forms `(xor mc) & (xor mc)`. Raw best was `190/36/6840`; limited `abc_g_aig` improved to new current best `181/36/6516`, ratio `2.06x` reference. Delay-target `abc_g_aig_d18..d21` tied plain `abc_g_aig`.

## Do Not Repeat Blindly

- Current generic variants are all much worse than reference.
- Shared-BDD plus `abc_g_aig` gives a large area reduction but still high delay; prioritize mux-depth reduction, selected bit formulas, or semantic identification.
- Direct low-support LUT overrides were worse; selected-bit work needs a different source form.
- Plain ANF/Davio interleave and basic synthflow are exact but delay-dominated; do not repeat without a different decomposition.
- Do not repeat `gray`/`ungray`/`bit_reverse` transformed-key BDD for this case without a materially different source rewrite.
- Do not repeat simple one-bit `low1`/`high1`/`center1` cofactor-BDD; exact but duplicated BDD area dominated.
- Do not repeat width-minus-one split/default variants such as `rotate0_low14`; exact completed rows were area-dominated.
- Do not repeat direct vector-valued MTBDD without a different reduction/root-grouping idea; diagnostic node count was much larger than scalar shared-BDD.
- Do not repeat grouped rotated-split high-bit overrides on the shared-BDD source; raw and limited synthflow rows were exact but worse than current.
- Do not repeat direct prefix/suffix parity ANF or plain/reduction parity-key BDD; top-k prefix-key cofactor BDD dominates them.
- Do not repeat generic AC `phi+h`, canonical case-mux sharing, per-bit endpoint BDD, raw identity ANF/Davio, top7/top8, or the same one-hot rows.
- Classonehot is no longer active best after prefix-Davio `abc_g_aig`; keep it as a lower-delay/high-area comparison point. Class-SOP selector minimization, classcase, and classonehottree were exact but worse.
- Do not repeat floor/ceil split-factorized ANF or classonehot low4/low5 ANF override as tested; both were exact but much worse.
- Do not pursue `reverse(out) = 5*x + small correction`; residual diagnostics did not simplify.
- Do not repeat identity layered ANF/Davio thresholds `1/2/3`; exact but worse than current.
- Do not repeat top6 class-rule canonicalization as tested; exact but worse than current.
- Do not repeat full masked word-pattern ANF over all prefix-key relative offsets; exact but much worse.
- Do not repeat full prefix-key Davio endpoint/best-residual orders under default synthesis; `abc_g_aig` is the active useful flow. Future work should target Davio delay, not another identical flow.
- Do not repeat uniform prefix-Davio threshold split for ex283; exact but worse than full-Davio `abc_g_aig`.
- Do not repeat simple Davio/classonehot selected-bit hybrids for ex283; they can lower delay but area overhead remains worse than current.
- Do not repeat broad grouped-Davio grid for ex283 without a lower-area grouping idea; full-Davio endpoint_rev remains current.
- Do not repeat the 2026-06-09 big-structure diagnostics as tested: pure elementary-symmetric scan, edge-fixed local range scan, simple shifted-key word ops, fixed global RM polarity, one-direction prefix-state scan, ABC direct DSD, or `5*x` correction.
- Do not repeat bilinear-rank split ANF or all-bit degree-3 mux-coordinate ANF as tested; exact but worse than the degree-2 mux-coordinate hybrid.
- Do not repeat residual-Davio mux-coordinate hybrid or flat full-coordinate emit as active sources; grouped full-clamp factorization dominates both for this case.
- Do not repeat direct/balanced XOR emit, dual high/low grouping, or keychain simplified for ex283 as tested; reduce+simplified is the active refined source.
- Reduce+simplified grouped full-clamp is now superseded by shared quadratic compressor; keep it only as a comparison/fallback source.
- Prefix-Davio endpoint_rev is now superseded as current best; use it only as a residual/reference source.

## Sources

- `student/results/unknown_candidates_current_summary.csv`
- `student/results/unknown_candidates_current_best.csv`
