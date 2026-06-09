# ex275-ex279 Frontend Attempts

Batch scope: integer square root.

Initial verified semantics from existing integer seeds:

- `ex275`: isqrt(x)
- `ex276`: isqrt(x)
- `ex277`: isqrt(x)
- `ex278`: isqrt(x)
- `ex279`: isqrt(x)

Main run set:

- `ex275_ex279_frontend_isqrt_structures_20260609_1551`
- `ex275_ex279_frontend_isqrt_radix_prefix_20260609_1551`
- `ex275_ex279_frontend_isqrt_radix_prio_bdd_20260609_1551`
- `ex275_ex279_frontend_isqrt_cofbdd_lowtarget_20260609_1551`
- `ex275_ex276_frontend_isqrt_prefix_bitwise_20260609_1551`
- `ex275_ex276_frontend_isqrt_support_reduced_20260609_1618`
- `ex275_ex276_frontend_isqrt_bdd_order_20260609_1618`
- `ex275_ex277_frontend_isqrt_prefix_delta_20260609_1618`
- `ex275_ex279_frontend_isqrt_new_structures_all_20260609_1618`
- `ex275_ex276_frontend_isqrt_shared_ge_20260609_1656`
- `ex275_ex276_frontend_isqrt_prefix_ge_tree_20260609_1656`
- `ex276_frontend_isqrt_mixed_prefix_bits_20260609_1656`
- `ex276_frontend_isqrt_prefix6_tree_20260609_1656`
- `ex276_frontend_isqrt_cofbdd_deeper_20260609_1656`
- `ex276_frontend_isqrt_prefix4_refine_low_20260609_1656`
- `ex276_frontend_isqrt_anfhi_p4ge_20260609_1656`
- `ex276_frontend_isqrt_lowbits_cofbdd_anfhi_20260609_1656`
- `ex275_ex276_frontend_isqrt_newbest_gateflow_20260609_1656`

Current verified frontend bests after refreshing
`student/results/current_best_by_case.csv`:

| Case | Best source | Area | Delay | ADP | Ref ADP | Ratio |
| --- | --- | ---: | ---: | ---: | ---: | ---: |
| ex275 | prefix5 shared-ge word-mux tree | 43 | 7 | 301 | 204 | 1.475490 |
| ex276 | prefix4 shared-ge bitwise classifier | 101 | 10 | 1010 | 632 | 1.598101 |
| ex277 | cofactor-4 reverse BDD word mux | 237 | 12 | 2844 | 1980 | 1.436364 |
| ex278 | prefix5 range classifier | 502 | 14 | 7028 | 5198 | 1.352058 |
| ex279 | radix-4 restoring-like digit sqrt | 334 | 42 | 14028 | 10952 | 1.280862 |

Useful structures found:

- All five truth tables exactly match unsigned `floor(isqrt(x))`; widths are
  8->4, 10->5, 12->6, 14->7, and 16->8.
- Prefix range/bitwise classifiers are the best shallow source for the smaller
  cases.  Later shared-boundary and word-tree rewrites improved the smaller
  cases further: ex275 now uses `prefix5_ge_tree_lsb`, while ex276 uses
  `prefix4_ge_bitwise`.
- Cofactored BDDs are useful around ex277, where a high-prefix split plus local
  reverse-order BDDs beats both plain prefix range and full-output BDD.
- Wider ex278/ex279 benefit more from algorithmic structures: prefix5 range for
  ex278 and radix-4 digit sqrt for ex279.

Exact but rejected directions:

- Direct trial-square loops, restoring radix-2, threshold chains, threshold XOR,
  bit interval OR, full small case tables, full shared BDDs, and broad prefix
  range sweeps.
- Radix-8/radix-16 and priority digit selection: lower stage count sometimes
  helped delay, but area grew or ADP lost.
- Support-reduced per-bit formulas using the fact that `out[k]` ignores the
  lowest `2*k` input bits; exact but lost sharing across output bits.
- One-hot prefix decode, high-bit hand formulas plus low-bit BDD, alternative
  BDD orders, QM/SOP covers, thermometer popcount, limited gate/synthflow
  checks, and `base + small delta` prefix buckets.
- Additional ex275/ex276 deep checks: mixed prefix4/prefix5 bit hybrids,
  support/ANF high-bit formulas plus prefix4 low bits, prefix4 low-bucket
  refinement, prefix6 tree/bitwise classifiers, deeper cofactor BDDs,
  selected low-bit cofactor BDD plus ANF high bits, and limited gateflow replay
  on the new winners.

Remaining gaps:

- ex275 is now within 1.5x reference.  ex276 is still outside 1.5x reference.
  The current evidence says more comparator/range/prefix variants are unlikely
  to make a large jump; future ex276 improvement probably needs either a
  genuinely different shared multi-output classifier or a hand-minimized
  Boolean network that preserves cross-bit sharing better than the tested
  BDD/SOP/ANF forms.

## 2026-06-09 ex276 Threshold-Toggle Follow-Up

Additional run/result location:

- `student/runs/integer/ex266_ex276_frontend_highgap_struct2_20260609_1750/results/`

No new best was found.  Direct square-threshold toggle formulas and shared
`ge(q*q)` wires were exact but worse; best was `130/11/1430`.  This rules out
the simple threshold-XOR family as the missing ex276 structure.
