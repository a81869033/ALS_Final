# ex281 Frontend Attempts

## Current Best

- Current best frontend: `ex281_prefix_parity_reduce_full_clamp_basic_abc_g_aig`, area `161`, delay `34`, ADP `5474`.
- Reference: ADP `2336`.
- Gap: `2.63x` reference ADP.

## Already Tried

- Tried generic unknown variants: `value_case`, `expr_default_exception`, `high_split_default`, `low_split_default`, `rotate_high_split_default`, `rotate_low_split_default`, `decision_tree_greedy`.
- Top results: `rotate_low_split_default:41225`; `rotate_high_split_default:54706`; `low_split_default:59800`; `high_split_default:92017`; `expr_default_exception:119899`.
- Algebraic/ANF/Davio/support-LUT candidates exist under `student/work/reverse_unknown_algebraic_20260603_2305_algebraic_safe/ex281`, but they are not the current tracked best.
- 2026-06-08 ANF/Davio interleave check: official `evaluate.py` OK; raw `1478/27/39906`, synthflow `1171/27/31617`, both worse than shared-BDD synthflow.
- 2026-06-08 transformed-key BDD check: official `evaluate.py` OK; best `bit_reverse_interleave` was `1351/23/31073`, worse than shared-BDD synthflow `25476`.
- 2026-06-08 cofactor-BDD source rewrite: official `evaluate.py` OK; best one-bit cofactor was `high1` at `1153/23/26519`, slightly lower area but worse ADP than shared-BDD synthflow.
- 2026-06-08 width-minus-one split/default recovery: official `evaluate.py` OK; best recovered row `rotate1_low12` was `15456/19/293664`, far worse than current.
- 2026-06-08 MTBDD diagnostic: direct vector-valued interleave MTBDD had `7289` nodes versus `511` scalar shared-BDD nodes, so no seed was emitted.
- 2026-06-08 split/BDD grouped-bit hybrid: official replay OK; limited synthflow best was `1676/22/36872`, worse than shared-BDD synthflow.
- 2026-06-08 interleave shared-BDD run: official `evaluate.py` OK; new run-level best `1179/23/27117`; kept in run/work artifacts pending final class seed curation.
- 2026-06-08 BDD synthflow run: official `evaluate.py` OK for all variants; `synth_preset` improved to `1158/22/25476`; kept in run/work artifacts pending final class seed curation.
- 2026-06-08 selected-bit BDD run: official `evaluate.py` OK for `support8`/`support10`; best was `1252/24/30048`, worse than BDD synthflow.
- 2026-06-08 prefix/suffix parity ANF: exact, but direct prefix ANF was `2344/37/86728`; limited synthflow best `1813/36/65268`, rejected.
- 2026-06-08 prefix parity transformed-key BDD: exact and low-area. Linear prefix key reached `919/37/34003` after synthflow; reduction-XOR key improved raw/synthflow to `932/33/30756`.
- 2026-06-08 raw/shared-BDD plus prefix-reduce bit-hybrid pilot was exact but worse; best `primary_4_5_6_7_8_9_10_11_12` was `1216/23/27968`.
- 2026-06-08 prefix-key top-k cofactor BDD found the new best. Top4 raw first beat current (`851/29/24679`), top6 raw improved to `901/26/23426`, and limited `abc_g_aig` synthflow produced `858/24/20592`.
- 2026-06-08 prefix-key AC/canonical/per-bit follow-ups: AC `phi+h` synthflow best was `1025/34/34850`; canonical cofactor reproduced the current score (`858/24/20592`); per-bit endpoint synthflow best was `902/31/27962`, all no better than current.
- 2026-06-08 one-hot prefix-key cofactor mux: exact top5/top6 plus limited synthflow; best was `882/27/23814`, worse than current.
- 2026-06-08 raw identity ANF/Davio confirmed degree-4 structure but synthflow best was `1171/27/31617`, worse than current.
- 2026-06-08 inner BDD order, top7/top8, and filtered synthflow checks were exact but did not beat current; best inner-order synthflow stayed `889/26/23114`.
- 2026-06-08 class-level one-hot, class-SOP, classcase, and classonehottree mux factoring were exact but still worse. Best classonehot synthflow was `859/27/23193`; classonehottree synthflow reached `854/27/23058`; best classsop synthflow was `880/25/22000`; classcase raw best was `941/30/28230`.
- 2026-06-08 split-factorized prefix-key ANF was exact and officially replayed, but best was `1984/27/53568`, worse than current.
- 2026-06-08 classonehot low-bit ANF override was exact and officially replayed, but best low4 row was `1382/27/37314`, worse than current.
- 2026-06-08 reverse-output `5*x` residual diagnostics showed no compact correction: integer `5*x` raised residual degree, carryless `5*x` remained raw-sized, and high-zero slice matched only `6/64` points.
- 2026-06-08 layered ANF/Davio low-degree skeleton split was exact and officially replayed. Best row `identity_deg1_best_residual` was `1501/29/43529`, worse than current; low-degree separation did not reduce the residual Davio bottleneck.
- 2026-06-08 top6 class-rule canonicalization was exact and officially replayed. Best row `classrulescase_endpoint_rev` was `910/30/27300`, worse than current `858/24/20592`; compact class predicates did not remove the cofactor/mux bottleneck.
- 2026-06-08 masked word-pattern ANF over prefix-key relative offsets was exact and officially replayed, but synthesized to `3634/27/98118`, far worse than current; full masked vector-stencil expansion is area-heavy.
- 2026-06-08 full prefix-key Davio was exact and officially replayed. Best-residual order was `812/40/32480`; endpoint_rev improved to `803/33/26499`, still worse than current. It preserves low area but loses too much delay.
- 2026-06-08 narrow prefix-Davio synthflow replay was official `evaluate.py` OK for all rows. `abc_g_aig` improved endpoint_rev to `683/33/22539`, still worse than current `858/24/20592`; area is lower, but delay remains too high.
- 2026-06-08 prefix-Davio low-degree threshold split (`deg1/2/3`) was exact and officially replayed. Best raw was `deg1 endpoint_rev` at `807/33/26631`; narrow synthflow improved it to `700/33/23100`, still worse than full-Davio synthflow and current.
- 2026-06-08 grouped prefix-Davio output order was exact and officially replayed. Best after `abc_g_aig` was `deg0 high4 depth` at `780/30/23400`, lower area than current but worse ADP because delay stayed high.
- 2026-06-09 high-leverage semantic diagnostic emitted no seed. Elementary-symmetric prefix/suffix scan solved zero bits; local edge/range scan still left `393` residual monomials in the tested grammar; shifted-key word AND/XOR basis, fixed-polarity RM, one-direction prefix-state scan, ABC DSD, and `5*x` correction did not show an exact compact structure.
- 2026-06-09 mux-coordinate hybrid found the first large-drop structure. Degree-2 mux-coordinate ANF solves bits `0,1,2,3,4,5,6,7,8,10`; residual bits `9,11,12` use Davio. Raw best was `482/32/15424`; limited `abc_g_aig` improved to `404/32/12928`.
- 2026-06-09 full-width mux-coordinate extension removed residual Davio entirely. Flat full-coordinate `abc_g_aig` reached `362/29/10498`; grouped pair factorization with `full_clamp_grouped` reached raw `231/31/7161` and current `201/31/6231` after `abc_g_aig`. Delay-target `abc_g_aig_d18..d21` tied plain `abc_g_aig`.
- 2026-06-09 refined grouped follow-ups: simplified full-clamp coordinate branches reached current best `205/30/6150` after `abc_g_aig`, trading a little area for one less delay level. Incremental keychain simplified was exact but worse (`223/35/7805`). Delay targets tied plain `abc_g_aig`.
- 2026-06-09 shared quadratic compressor: exact pair-matrix decomposition into products of linear forms `(xor mc) & (xor mc)`. Raw best was `176/34/5984`; limited `abc_g_aig` improved to new current best `161/34/5474`, ratio `2.34x` reference. Delay-target `abc_g_aig_d18..d21` tied plain `abc_g_aig`.

## Do Not Repeat Blindly

- Generic split and rotation split have already been tried.
- Shared-BDD plus synthflow improved area/delay, but gap remains too large for backend-only work; next focus should be source rewrite, selected low-support bits, or semantic classifier.
- Direct low-support LUT overrides were worse; selected-bit work needs a different source form.
- Plain ANF/Davio interleave and basic synthflow are exact but delay-dominated; do not repeat without a different decomposition.
- Do not repeat `gray`/`ungray`/`bit_reverse` transformed-key BDD for this case without a materially different source rewrite.
- Do not repeat simple one-bit `low1`/`high1`/`center1` cofactor-BDD; exact but did not reduce delay enough.
- Do not repeat width-minus-one split/default variants such as `rotate0_low12` or `rotate1_low12`; exact but area exploded.
- Do not repeat direct vector-valued MTBDD without a different reduction/root-grouping idea; diagnostic node count was much larger than scalar shared-BDD.
- Do not repeat grouped rotated-split high-bit overrides on the shared-BDD source; raw and limited synthflow rows were exact but worse than current.
- Do not repeat direct prefix/suffix parity ANF or plain/reduction parity-key BDD; top-k prefix-key cofactor BDD dominates them.
- Do not repeat the raw/shared-BDD plus prefix-reduce bit-hybrid pilot groups from `ex281_ex284_frontend_bdd_prefix_raw_bit_hybrid_20260608_1758`; exact but worse than key-cofactor BDD.
- Do not repeat generic AC `phi+h`, per-bit endpoint BDD, or top5/top6 one-hot mux as tested; exact but worse than current. Canonical cofactor is only a tie with the existing top-k source.
- Do not repeat raw identity ANF/Davio, top7/top8, classonehot/classsop, classcase, or classonehottree rows as tested; exact but still worse than `858/24/20592`.
- Do not repeat floor/ceil split-factorized ANF or classonehot low4/low5 ANF override as tested; both were exact but much worse.
- Do not pursue `reverse(out) = 5*x + small correction`; residual diagnostics did not simplify.
- Do not repeat identity layered ANF/Davio thresholds `1/2/3`; exact but worse than current.
- Do not repeat top6 class-rule canonicalization as tested; exact but worse than current.
- Do not repeat full masked word-pattern ANF over all prefix-key relative offsets; exact but much worse.
- Do not repeat full prefix-key Davio endpoint/best-residual orders as default standalone RTL; `abc_g_aig` is the useful flow, but the best row still misses current.
- Do not repeat uniform prefix-Davio threshold split for ex281; exact but worse than full-Davio `abc_g_aig`.
- Do not repeat grouped-Davio broad grid for ex281 unless adding a materially different order/group source; current prefix-key cofactor remains better.
- Do not repeat the 2026-06-09 big-structure diagnostics as tested: pure elementary-symmetric scan, edge-fixed local range scan, simple shifted-key word ops, fixed global RM polarity, one-direction prefix-state scan, ABC direct DSD, or `5*x` correction.
- Do not repeat bilinear-rank split ANF or all-bit degree-3 mux-coordinate ANF as tested; exact but worse than the degree-2 mux-coordinate hybrid.
- Do not repeat residual-Davio mux-coordinate hybrid or flat full-coordinate emit as active sources; grouped full-clamp factorization dominates both for this case.
- Do not repeat direct/balanced XOR emit, dual high/low grouping, or keychain simplified for ex281 as tested; reduce+simplified is the active refined source.
- Reduce+simplified grouped full-clamp is now superseded by shared quadratic compressor; keep it only as a comparison/fallback source.
- Prefix-key cofactor BDD is now superseded as current best; keep it only as a comparison source.

## Sources

- `student/results/unknown_candidates_current_summary.csv`
- `student/results/unknown_candidates_current_best.csv`

## 2026-06-12 19:33 +0800 Round10 unknown-gf-r10

- Dossier: `student/work/ex200_ex299_frontend_refgap_round10_20260612_1911/unknown-gf-r10/ex281/notes/high_level_dossier.md`
- Method signature: `ex281|quartic_gf2_event_filter|small_roots_kept_monomial_bank|kept_shared_root_product_and_linear_form_bank|yosys_abc_g_aig|exact_full_clamp_mux_coordinate_degree2|grouped_output_xor_from_preserved_monomial_bank`
- Candidate: `student/work/ex200_ex299_frontend_refgap_round10_20260612_1911/unknown-gf-r10/ex281/verilog/ex281_r10_kept_gf2_monomial_bank.v`
- AIG: `student/work/ex200_ex299_frontend_refgap_round10_20260612_1911/unknown-gf-r10/ex281/aigs/ex281_r10_kept_gf2_monomial_bank_abc_g_aig.aig`
- Official evaluate.py log: `student/work/ex200_ex299_frontend_refgap_round10_20260612_1911/unknown-gf-r10/ex281/logs/ex281_r10_kept_gf2_monomial_bank_abc_g_aig.evaluate.log`
- Result: equivalent, area `189`, delay `29`, ADP `5481`; does not beat campaign frontend `3328` or reference `2336`.
- Outcome: delay improved, but area cost from preserving the existing shared monomial bank dominates.
- Next action: avoid repeating this `keep`-preserved small-root bank unchanged; search for a smaller cofactored product basis or grouped-output correction that keeps delay low without duplicating area.

## 2026-06-13 02:50:51 +0800 Round22 unknown-a-r22

- method_signature: `ex281|quartic_gf2_event_filter|raw_low_degree_anf_and_simple_equivariance_screen|shared_monomial_bank_or_rotation_recurrence|no_synth|blocked_before_verilog|full_word`
- official result: `BLOCKED_NO_CANDIDATE`; no Verilog/AIG was emitted, so no `evaluate.py` row is claimed.
- evidence: `student/work/ex200_ex299_frontend_refgap_round22_20260613_0218/unknown-a-r22/ex281/diagnostics/ex281_round22_screen.md`
- shard CSVs: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round22_20260613_0218/agent_shards/unknown-a-r22/`
- outcome: screened raw/shared low-degree ANF monomial bank and simple rotation/reverse structural recurrence; raw ANF remains degree 4 with 3339 terms, and best simple equivariance covers only 136/8192 rows.
- next action: do not emit another raw ANF/equivariance source; ex281 needs a materially different compressor/basis than the prior shared quadratic compressor.
