# ex282 Frontend Attempts

## Current Best

- Current best frontend: `ex282_prefix_parity_full_clamp_simplified_basic_abc_g_aig`, area `176`, delay `36`, ADP `6336`.
- Reference: ADP `2704`.
- Gap: `2.46x` reference ADP.

## Already Tried

- Tried generic unknown variants: `value_case`, `expr_default_exception`, `high_split_default`, `low_split_default`, `rotate_high_split_default`, `rotate_low_split_default`, `decision_tree_greedy`.
- Top results: `rotate_high_split_default:59382`; `rotate_low_split_default:59382`; `low_split_default:111048`; `high_split_default:146181`; `expr_default_exception:180500`.
- Algebraic/ANF/Davio/support-LUT candidates exist under `student/work/reverse_unknown_algebraic_20260603_2305_algebraic_safe/ex282`, but they are not the current tracked best.
- 2026-06-08 ANF/Davio interleave check: official `evaluate.py` OK; raw `1634/31/50654`, synthflow `1323/31/41013`, both worse than shared-BDD synthflow.
- 2026-06-08 transformed-key BDD check: official `evaluate.py` OK; best `bit_reverse_interleave` was `1592/25/39800`, worse than shared-BDD synthflow `31512`.
- 2026-06-08 cofactor-BDD source rewrite: official `evaluate.py` OK; best one-bit cofactor was `low1` at `1397/24/33528`, worse than shared-BDD synthflow.
- 2026-06-08 width-minus-one split/default recovery: official `evaluate.py` OK; best recovered row `rotate1_low13` was `31058/20/621160`, far worse than current.
- 2026-06-08 MTBDD diagnostic: direct vector-valued interleave MTBDD had `14490` nodes versus `591` scalar shared-BDD nodes, so no seed was emitted.
- 2026-06-08 split/BDD grouped-bit hybrid: official replay OK; limited synthflow best was `1896/22/41712`, worse than shared-BDD synthflow.
- 2026-06-08 interleave shared-BDD run: official `evaluate.py` OK; new run-level best `1404/25/35100`; kept in run/work artifacts pending final class seed curation.
- 2026-06-08 BDD synthflow run: official `evaluate.py` OK for all variants; `abc_g_aig` improved to `1313/24/31512`; kept in run/work artifacts pending final class seed curation.
- 2026-06-08 selected-bit BDD run: official `evaluate.py` OK for `support8`/`support10`; best was `1391/25/34775`, worse than BDD synthflow.
- 2026-06-08 prefix/suffix parity ANF: exact, but direct prefix ANF was `2820/40/112800`; limited synthflow best `2147/39/83733`, rejected.
- 2026-06-08 prefix parity transformed-key BDD: exact and low-area. Linear prefix key reached `1071/38/40698` after synthflow; reduction-XOR key reached `1088/35/38080`.
- 2026-06-08 prefix-key top-k cofactor BDD: exact and close but did not beat current. Top6 raw was `1020/32/32640`; limited synthflow best was `1021/31/31651`, only 139 ADP worse than current `31512`.
- 2026-06-08 top7 and custom six-bit selector follow-ups were exact but worse. Best custom selector was `bits_0_13_1_2_11_12` at `980/35/34300`; extra gate-set/noabc/flatten synthflow on top6 did not improve beyond `31651`.
- 2026-06-08 prefix-key AC/canonical/per-bit follow-ups: AC `phi+h` synthflow best was `1206/36/43416`; canonical cofactor matched the top-k near miss (`1021/31/31651`); per-bit endpoint synthflow best was `1089/34/37026`.
- 2026-06-08 one-hot prefix-key cofactor mux found the new best. Raw top6 one-hot was `1064/32/34048`; limited `synth_preset` reduced it to `1028/29/29812`, beating the prior shared-BDD current `31512` by `1700` ADP.
- 2026-06-08 raw identity ANF/Davio confirmed degree-4 structure but synthflow best was `1323/31/41013`, worse than cofactor rows.
- 2026-06-08 inner-order matrix showed endpoint_rev was not enough by itself; best filtered synthflow was `971/32/31072`, worse than one-hot current.
- 2026-06-08 class-level one-hot mux factoring found a new current best. Raw `top6 classonehot endpoint_rev` was `1001/30/30030`; limited `abc_g_aig` synthflow improved it to `958/30/28740`, beating the prior `29812` by `1072` ADP.
- 2026-06-08 class-SOP selector minimization was exact and improved old current to `985/30/29550`, but did not beat classonehot. Classcase raw best was `1094/30/32820`; classonehottree synthflow reached `983/30/29490`, also worse than classonehot.
- 2026-06-08 split-factorized prefix-key ANF was exact and officially replayed, but best was `2471/31/76601`, worse than current.
- 2026-06-08 classonehot low-bit ANF override was exact and officially replayed, but best low4 row was `1541/30/46230`, worse than current.
- 2026-06-08 reverse-output `5*x` residual diagnostics showed no compact correction: integer `5*x` raised residual degree, carryless `5*x` remained raw-sized, and high-zero slice matched only `7/128` points.
- 2026-06-08 layered ANF/Davio low-degree skeleton split was exact and officially replayed. Best row `identity_deg1_best_residual` was `1699/33/56067`, worse than current; low-degree separation did not reduce the residual Davio bottleneck.
- 2026-06-08 top6 class-rule canonicalization was exact and officially replayed. Best row `classrulesonehot_endpoint_rev` was `1020/32/32640`, worse than current `958/30/28740`; compact class predicates did not remove the cofactor/mux bottleneck.
- 2026-06-08 masked word-pattern ANF over prefix-key relative offsets was exact and officially replayed, but synthesized to `4050/28/113400`, far worse than current; full masked vector-stencil expansion is area-heavy.
- 2026-06-08 full prefix-key Davio was exact and officially replayed. Best-residual order was `882/42/37044`; endpoint_rev improved to `911/35/31885`. Narrow synthflow then made `abc_g_aig` a new current best at `761/35/26635`, beating classonehot current by `2105` ADP.
- 2026-06-08 prefix-Davio low-degree threshold split (`deg1/2/3`) was exact and officially replayed. Best raw was `deg1 endpoint_rev` at `927/35/32445`; narrow synthflow tied current at `761/35/26635`, so degree-1 split adds no benefit for ex282.
- 2026-06-08 Davio/classonehot selected-bit hybrids were exact and officially replayed. Raw best was high bits `8..13` at `992/32/31744`; `abc_g_aig` best was top bits `12..13` at `797/35/27895`, still worse than active Davio current.
- 2026-06-08 grouped prefix-Davio output order was exact and officially replayed. `deg0 high4 depth + abc_g_aig` reached new current best `765/33/25245`, improving full-Davio current by `1390` ADP via a 2-level delay reduction.
- 2026-06-09 high-leverage semantic diagnostic emitted no seed. Elementary-symmetric prefix/suffix scan solved zero bits; local edge/range scan still left `544` residual monomials in the tested grammar; shifted-key word AND/XOR basis, fixed-polarity RM, one-direction prefix-state scan, ABC DSD, and `5*x` correction did not show an exact compact structure.
- 2026-06-09 mux-coordinate hybrid found the first large-drop structure. Degree-2 mux-coordinate ANF solves bits `0,1,2,3,4,5,6,7,8,9,11`; residual bits `10,12,13` use Davio. Raw best was `512/34/17408`; limited `abc_g_aig` improved to `405/34/13770`.
- 2026-06-09 full-width mux-coordinate extension removed residual Davio entirely. Flat full-coordinate `abc_g_aig` reached `318/31/9858`; grouped pair factorization with `full_clamp_grouped` reached raw `257/31/7967` and current `215/31/6665` after `abc_g_aig`. Delay-target `abc_g_aig_d18..d21` tied plain `abc_g_aig`.
- 2026-06-09 refined grouped follow-ups: simplified coordinate and keychain simplified were exact but worse after `abc_g_aig` (`7524` and `7161` ADP). Direct/balanced XOR emit and dual high/low grouping were also exact but worse on smoke cases. Keep original grouped full-clamp as active for ex282.
- 2026-06-09 shared quadratic compressor: exact pair-matrix decomposition into products of linear forms `(xor mc) & (xor mc)`. Raw rows did not beat grouped best until synthflow (`6876` raw best), but limited `abc_g_aig` improved to new current best `176/36/6336`, ratio `2.34x` reference. Delay-target `abc_g_aig_d18..d21` tied plain `abc_g_aig`.

## Do Not Repeat Blindly

- High/low split, rotated split, and simple exception encoding are already covered.
- Shared-BDD plus `abc_g_aig` is the best exact frontend seed so far but delay dominates; next work should reduce mux depth or replace selected bits with compact formulas.
- Direct low-support LUT overrides were worse; selected-bit work needs a different source form.
- Plain ANF/Davio interleave and basic synthflow are exact but delay-dominated; do not repeat without a different decomposition.
- Do not repeat `gray`/`ungray`/`bit_reverse` transformed-key BDD for this case without a materially different source rewrite.
- Do not repeat simple one-bit `low1`/`high1`/`center1` cofactor-BDD; exact but area increased without improving delay.
- Do not repeat width-minus-one split/default variants such as `rotate0_low13` or `rotate1_low13`; exact but area exploded.
- Do not repeat direct vector-valued MTBDD without a different reduction/root-grouping idea; diagnostic node count was much larger than scalar shared-BDD.
- Do not repeat grouped rotated-split high-bit overrides on the shared-BDD source; raw and limited synthflow rows were exact but worse than current.
- Do not repeat direct prefix/suffix parity ANF or plain/reduction parity-key BDD; top-k prefix-key cofactor BDD dominates them.
- Do not repeat top7 or the tested custom six-bit selector sets without a different mux/source form.
- Do not repeat generic AC `phi+h`, canonical case-mux sharing, per-bit endpoint BDD, raw identity ANF/Davio, top7/top8, or the same one-hot mux rows.
- Classonehot is no longer active best after prefix-Davio `abc_g_aig`; keep it as a lower-delay/high-area comparison point. Revisit selector factoring only if combining it with the Davio low-area source or a materially different class predicate.
- Do not repeat floor/ceil split-factorized ANF or classonehot low4/low5 ANF override as tested; both were exact but much worse.
- Do not pursue `reverse(out) = 5*x + small correction`; residual diagnostics did not simplify.
- Do not repeat identity layered ANF/Davio thresholds `1/2/3`; exact but worse than current.
- Do not repeat top6 class-rule canonicalization as tested; exact but worse than current.
- Do not repeat full masked word-pattern ANF over all prefix-key relative offsets; exact but much worse.
- Do not repeat full prefix-key Davio endpoint/best-residual orders under default synthesis; `abc_g_aig` is the active useful flow. Future work should target Davio delay, not another identical flow.
- Do not repeat uniform prefix-Davio threshold split for ex282; after `abc_g_aig` it only ties full-Davio current.
- Do not repeat simple Davio/classonehot selected-bit hybrids for ex282; they can lower delay but area overhead remains worse than current.
- Do not repeat broad grouped-Davio grid for ex282; active row is `deg0 high4 depth`, and follow-up should refine around that source.
- Do not repeat the 2026-06-09 big-structure diagnostics as tested: pure elementary-symmetric scan, edge-fixed local range scan, simple shifted-key word ops, fixed global RM polarity, one-direction prefix-state scan, ABC direct DSD, or `5*x` correction.
- Do not repeat bilinear-rank split ANF or all-bit degree-3 mux-coordinate ANF as tested; exact but worse than the degree-2 mux-coordinate hybrid.
- Do not repeat residual-Davio mux-coordinate hybrid or flat full-coordinate emit as active sources; grouped full-clamp factorization dominates both for this case.
- Do not switch ex282 to simplified or keychain simplified without a new source rewrite; both exact variants lost ADP.
- Original grouped full-clamp is now superseded by shared quadratic compressor after `abc_g_aig`; use it only as a lower-delay comparison source.
- Grouped prefix-Davio is now superseded as current best; use it only as a residual/reference source.

## Sources

- `student/results/unknown_candidates_current_summary.csv`
- `student/results/unknown_candidates_current_best.csv`
