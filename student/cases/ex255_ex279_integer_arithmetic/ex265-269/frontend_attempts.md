# ex265-ex269 Frontend Attempts

Batch scope: unsigned division with divide-by-zero saturation.

Initial verified semantics from existing integer seeds:

- `ex265`: low4 / high4, divide-by-zero -> max
- `ex266`: low5 / high5, divide-by-zero -> max
- `ex267`: low6 / high6, divide-by-zero -> max
- `ex268`: low7 / high7, divide-by-zero -> max
- `ex269`: low8 / high8, divide-by-zero -> max

Existing variants include direct division, restoring division, and denominator-
specialized cases.  Future work should inspect quotient-bit predicates,
denominator grouped tables, threshold comparators, reciprocal-style classifiers,
and shallow divide-by-zero guard placement.

## 2026-06-09 Deep Frontend Run

Run/result locations:

- `student/runs/integer/ex265_ex267_frontend_udiv_bdd_20260609_0755/results/`
- `student/runs/integer/ex265_ex267_frontend_udiv_bdd_greedy_20260609_0845/results/`
- `student/runs/integer/ex265_ex269_frontend_udiv_guard_fast_20260609_0815/results/`
- `student/runs/integer/ex268_ex269_frontend_udiv_split_shift_20260609_0825/results/`
- `student/runs/integer/ex268_ex269_frontend_udiv_lz_range_20260609_0915/results/`

Current best after `student/scripts/update_current_best_by_case.py`:

| Case | Best candidate | Area | Delay | ADP | Ref ADP | Ratio | Previous ADP |
| --- | --- | ---: | ---: | ---: | ---: | ---: | ---: |
| ex265 | `ex265_udiv_bdd_b_msb_abc_g_aig` | 66 | 8 | 528 | 322 | 1.639752 | 640 |
| ex266 | `ex266_udiv_bdd_interleave_msb_synth_preset` | 152 | 12 | 1824 | 848 | 2.150943 | 2790 |
| ex267 | `ex267_udiv_radix4_top3_shift_wreduce_abc_g_aig` | 196 | 25 | 4900 | 2651 | 1.848359 | 6360 |
| ex268 | `ex268_udiv_denom_lz_range_direct_synth_preset` | 199 | 53 | 10547 | 7446 | 1.416465 | 13847 |
| ex269 | `ex269_udiv_radix4_shift_subtract_wreduce_abc_g_aig` | 380 | 41 | 15580 | 11760 | 1.324830 | 24492 |

Methods that improved QoR:

- Exact BDD quotient classifiers for ex265-ex267.  The useful orders were
  divisor-MSB first, MSB interleave, and a greedy adjacent-swap refinement.
- Guarded direct division and small-divisor fast paths improved the wider
  cases over the original semantic seeds.
- Shift-subtract improved ex269 over direct/restoring.
- Radix-4 quotient digit selection improved ex267 and ex269 by cutting serial
  quotient stages.  ex269 moved inside 1.5x reference.
- Divisor-leading-range direct split produced the ex268 best by narrowing the
  quotient width on high-divisor branches.

Methods tried and rejected:

- Full BDD for ex268/ex269: exact and low delay but too area-heavy.
- Broad threshold quotient classifiers and denominator-split threshold trees:
  exact after fixing 2N-bit multiplication width, but area dominated ADP.
- Low-divisor constant smallcase, low-branch BDD, and low-branch restoring:
  exact but worse than the range/direct or shift-subtract winners.
- Per-bit QMC/SOP for ex265/ex266: exact but unfactored area was too high.
- Delay-target synthflow replay on top sources: no new best beyond the source
  rewrites above.

## 2026-06-09 ex266/ex267/ex269 Deep Follow-Up

Additional run/result locations:

- `student/runs/integer/ex266_ex267_ex269_frontend_udiv_radix_shift_20260609_1110/results/`
- `student/runs/integer/ex266_ex267_ex269_frontend_udiv_mixed_radix_20260609_1140/results/`
- `student/runs/integer/ex266_ex267_ex269_frontend_udiv_mtbdd_20260609_1100/results/`
- `student/runs/integer/ex266_ex267_ex269_frontend_udiv_hybrid_hibdd_20260609_1010/results/`
- `student/runs/integer/ex266_ex267_ex269_frontend_udiv_lz_threshold_20260609_1040/results/`
- `student/runs/integer/ex266_ex267_frontend_udiv_bdd_search_order_20260609_1210/results/`

New results:

- `ex266`: no new best.  Current remains BDD interleave `152/12/1824`.
- `ex267`: radix-4/mixed-radix quotient digit selection improved best to
  `196/25/4900`.
- `ex269`: radix-4 quotient digit selection improved best to `380/41/15580`,
  beating the previous shift-subtract/hybrid result and entering 1.5x
  reference.

Follow-up methods tried and rejected:

- Fixed-point reciprocal table plus exact one-step correction: exact, but
  multiplier/table/correction path was much too large and slow.
- MTBDD word-level quotient classifier: exact and structurally clean, but did
  not beat bit-BDD for ex266/ex267 and was too large for ex269.
- Custom BDD order search: reduced BDD node count, but the extra delay level
  lost ADP after synthesis.
- High-bit BDD plus low-width direct/residual division: slightly improved
  ex269 before radix-4, but did not beat radix-4.
- Leading-range threshold: low delay, but comparator area dominated.
- Narrow-remainder radix, radix-8, mixed-radix, and low-delay Yosys flow checks:
  exact, but no ADP improvement over the listed winners.

## 2026-06-09 ex266-Centered Follow-Up

Additional run/result locations:

- `student/runs/integer/ex266_ex267_ex269_frontend_udiv_binary_search_20260609_1240/results/`
- `student/runs/integer/ex266_frontend_udiv_formula_interval_20260609_0840/results/`
- `student/runs/integer/ex266_ex267_ex269_frontend_udiv_compact_radix_20260609_0845/results/`
- `student/runs/integer/ex266_frontend_udiv_perbit_bdd_20260609_0850/results/`
- `student/runs/integer/ex266_frontend_udiv_perbit_bitopt_20260609_0858/results/`
- `student/runs/integer/ex266_frontend_udiv_threshold_retry_20260609_0902/results/`
- `student/runs/integer/ex266_frontend_udiv_perbit_flow_probe_20260609_0910/results/`
- `student/runs/integer/ex266_frontend_udiv_comp_bdd_20260609_0918/results/`
- `student/runs/integer/ex266_frontend_udiv_comp_perbit_bdd_20260609_0922/results/`
- `student/runs/integer/ex266_frontend_udiv_resid_shift_20260609_0928/results/`
- `student/runs/integer/ex266_frontend_udiv_resid_parallel_20260609_0935/results/`
- `student/runs/integer/ex266_frontend_udiv_parallel_threshold_20260609_0942/results/`
- `student/runs/integer/ex267_frontend_udiv_perbit_comp_bdd_20260609_0948/results/`
- `student/runs/integer/ex269_frontend_udiv_comp_bdd_probe_20260609_0952/results/`
- `student/runs/integer/ex266_frontend_udiv_bdd_qor_orders_20260609_0958/results/`

New current best rows after refreshing `student/results/current_best_by_case.csv`:

| Case | Best candidate | Area | Delay | ADP | Ref ADP | Ratio | Previous ADP |
| --- | --- | ---: | ---: | ---: | ---: | ---: | ---: |
| ex266 | `ex266_udiv_bdd_perbit_interleave_msb_synth_preset` | 150 | 12 | 1800 | 848 | 2.122642 | 1824 |
| ex267 | `ex267_udiv_bdd_perbit_search_best_synth_preset` | 321 | 15 | 4815 | 2651 | 1.816296 | 4900 |
| ex269 | `ex269_udiv_radix4_shift_subtract_wreduce_abc_g_aig` | 380 | 41 | 15580 | 11760 | 1.324830 | 15580 |

What improved:

- `ex266`: per-output BDDs removed cross-bit sharing and let Yosys produce a
  slightly smaller same-delay AIG (`150/12/1800`) than the shared interleave
  BDD (`152/12/1824`).
- `ex267`: per-output BDD with the searched order traded area for a much
  shorter path (`321/15/4815`), slightly beating the radix-4 source by ADP.

Additional exact directions tried and rejected:

- Binary-search quotient construction using product or shift-add product
  tests: exact but delay-heavy; ex266 best in that family was `113/38/4294`.
- ex266 high-bit hand formulas plus low-bit shared/per-bit BDD: exact but did
  not beat full per-bit BDD.
- ex266 denominator interval classifier: lower delay (`11`) but area expanded
  past `225`, so ADP lost.
- Compact radix digit selection: saved area on some cases but increased the
  critical path; ex269 compact radix was `364/46/16744`, worse than current.
- Complemented-edge shared/per-bit BDD: node count dropped, but synthesized
  delay rose to `13`; best ex266 was `147/13/1911`.
- Residual high-bit divider rewrites: high quotient bits were hand-derived,
  then low bits were computed by serial shift or parallel thresholds.  These
  reached low area (`97/26/2522`) but did not solve the residual delay.
- Fully parallel quotient-threshold network for ex266: exact but area-heavy
  (`520/25/13000`).
- Small BDD QoR-order probe: shape changes did not beat per-bit interleave.

Current interpretation:

- ex266 still appears to need a genuinely different shallow multi-output
  quotient classifier to approach reference `106/8/848`; repeated BDD order,
  threshold, residual, and radix source rewrites have not exposed it.
- ex267 has two useful seed families worth preserving for later backend work:
  low-area radix-4 (`196/25/4900`) and lower-delay per-bit BDD
  (`321/15/4815`).

## 2026-06-09 ex266 Shallow Shared Classifier

Additional run/result locations:

- `student/runs/integer/ex266_frontend_udiv_cofactor_mtbdd_20260609_1042/results/`
- `student/runs/integer/ex266_frontend_udiv_cofactor_mtbdd_fix_20260609_1050/results/`
- `student/runs/integer/ex266_frontend_udiv_cofactor_bitbdd_20260609_1058/results/`
- `student/runs/integer/ex266_frontend_udiv_cofactor_mixed_selector_20260609_1108/results/`
- `student/runs/integer/ex266_frontend_udiv_selector_probe_20260609_1118/results/`
- `student/runs/integer/ex266_frontend_udiv_cofactor_wordmux_20260609_1128/results/`
- `student/runs/integer/ex266_frontend_udiv_deeper_wordmux_20260609_1138/results/`
- `student/runs/integer/ex266_frontend_udiv_cofactor_comp_wordmux_20260609_1148/results/`
- `student/runs/integer/ex266_frontend_udiv_cofactor_tree_wordmux_20260609_1158/results/`
- `student/runs/integer/ex266_frontend_udiv_best_wordmux_flow_20260609_1204/results/`

New current best:

| Case | Best candidate | Area | Delay | ADP | Ref ADP | Ratio | Previous ADP |
| --- | --- | ---: | ---: | ---: | ---: | ---: | ---: |
| ex266 | `ex266_udiv_ex266_cof_bhi2_a4_bitbdd_wordmux_synth_preset_d18` | 148 | 10 | 1480 | 848 | 1.745283 | 1800 |

Main a-ha:

- A better ex266 structure is a shallow shared classifier:
  `{b[4:3], a[4]}` selects eight magnitude cofactors; each cofactor uses local
  per-output BDD classifiers; the five local bits are reassembled and selected
  through one shared word mux.
- This improved ex266 from `150/12/1800` to `148/10/1480`.

Rejected refinements:

- MTBDD cofactors by `b` high bits were close but did not beat bit-level
  cofactors.
- `{b[4:3],a[4:3]}` reached delay 10/11 variants but used more area than
  `{b[4:3],a[4]}`.
- Adding more selector bits lowered local BDD depth but group/mux area erased
  the gain.
- Complemented-edge cofactors, explicit balanced mux tree, and low divisor-bit
  selectors were exact but worse.

## 2026-06-09 Cofactor Word-Mux Transfer

Additional run/result locations:

- `student/runs/integer/ex265_ex267_frontend_udiv_cofactor_transfer_20260609_1222/results/`
- `student/runs/integer/ex268_ex269_frontend_udiv_cofactor_transfer_smoke_20260609_1232/results/`

Current best updates after refreshing `student/results/current_best_by_case.csv`:

| Case | Best candidate | Area | Delay | ADP | Ref ADP | Ratio | Previous ADP |
| --- | --- | ---: | ---: | ---: | ---: | ---: | ---: |
| ex265 | `ex265_udiv_cof_bhi3_ahi1_bitbdd_wordmux_synth_preset` | 63 | 8 | 504 | 322 | 1.565217 | 528 |
| ex267 | `ex267_udiv_cof_bhi3_ahi1_bitbdd_wordmux_synth_preset` | 326 | 14 | 4564 | 2651 | 1.721614 | 4815 |
| ex268 | unchanged `ex268_udiv_denom_lz_range_direct_synth_preset` | 199 | 53 | 10547 | 7446 | 1.416465 | 10547 |
| ex269 | unchanged `ex269_udiv_radix4_shift_subtract_wreduce_abc_g_aig` | 380 | 41 | 15580 | 11760 | 1.324830 | 15580 |

Transfer lesson:

- The cofactor bit-BDD shared word-mux structure transfers well to small/mid
  dividers.  For ex265 and ex267, selector `bhi3+ahi1` was best in the tested
  set and improved both ADP rows.
- For ex268/ex269, the same structure gives shallow delay (`16` and `20`) but
  area explodes (`744` and `1663`), so it is not an active seed for wider
  dividers.  Those cases should stay on divisor-range/radix arithmetic sources
  unless a much more compact cofactor representation is found.

## 2026-06-09 High-Gap Selector Hybrid Follow-Up

Additional run/result locations:

- `student/runs/integer/ex266_ex267_ex276_frontend_highgap_struct_20260609_1732/results/`
- `student/runs/integer/ex267_frontend_udiv_highgap_flow_replay_20260609_1745/results/`
- `student/runs/integer/ex266_ex267_frontend_udiv_deeper_selector_20260609_1750/results/`
- `student/runs/integer/ex267_frontend_udiv_deepest_selector_20260609_1755/results/`
- `student/runs/integer/ex267_frontend_udiv_hybrid_topbits_20260609_1800/results/`
- `student/runs/integer/ex267_frontend_udiv_hybrid_top2_flow_20260609_1805/results/`

Current best update after refreshing `student/results/current_best_by_case.csv`:

| Case | Best candidate | Area | Delay | ADP | Ref ADP | Ratio | Previous ADP |
| --- | --- | ---: | ---: | ---: | ---: | ---: | ---: |
| ex267 | `ex267_udiv_hybrid_top2_deep_abc_g_aig` | 340 | 12 | 4080 | 2651 | 1.539042 | 4564 |

What worked:

- A deeper magnitude selector for local quotient cofactors (`bhi3+a_hi2`,
  then `bhi4+a_hi2`/`bhi3+bmid1+a_hi2`) reduced delay from 14 to 12.
- Full deepest selector reached delay 11 but paid too much area.  The winning
  source uses the deeper selector only on the top two quotient bits and keeps
  lower bits on the cheaper selector.

What did not work:

- ex266 did not improve; the same deeper selector variants increased area
  without reducing delay below the current 148/10/1480 row.
- Flow replay on the winning ex267 source tied the best; the improvement is
  from source structure, not a Yosys/ABC delay-target accident.
