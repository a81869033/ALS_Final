# ex266 Frontend Attempts

Semantics: unsigned 5x5 division, `low5 / high5`, divide-by-zero -> max.

Initial current best:
- `ex266_udiv_restoring`: 93/30/2790

Notes:
- Denominator case lowers delay but area dominates.
- Try quotient-bit formulas and denominator grouping.

## 2026-06-09 Update

Best verified frontend seed:

- `ex266_udiv_bdd_interleave_msb_synth_preset`: 152/12/1824, ratio 2.150943
  to reference ADP 848.

What changed:

- Reconfirmed exact unsigned `low5/high5` division with divide-by-zero
  saturation to `5'h1f`.
- MSB-interleaved BDD quotient classifier reduced ADP from the old restoring
  best (`93/30/2790`) to `152/12/1824`.
- Guarded direct division improved over restoring (`88/28/2464`) but BDD was
  still better by ADP.
- QMC/SOP and denominator-case-style sources were exact but area-heavy.

## 2026-06-09 Deep Follow-Up

First deep follow-up did not find a new best.  Current remained:

- `ex266_udiv_bdd_interleave_msb_synth_preset`: 152/12/1824.

Additional exact directions tried:

- Custom BDD order search reduced node count but synthesized to `146/13/1898`,
  worse by ADP.
- MTBDD word-level quotient classifier was close (`154/12/1848`) but did not
  beat the bit-BDD winner.
- Radix-4 divider lowered area but delay was too high (`123/18/2214`).
- Reciprocal-table multiply with one-step correction, leading-range threshold,
  high-bit BDD hybrids, residual hybrids, and low-delay flow checks all lost
  ADP.

## 2026-06-09 ex266-Centered Follow-Up

New best verified frontend seed:

- `ex266_udiv_bdd_perbit_interleave_msb_synth_preset`: 150/12/1800, ratio
  2.122642 to reference ADP 848.

What changed:

- Rewrote the BDD classifier as independent per-output BDD cones.  This
  removed source-level cross-bit sharing; Yosys found a same-delay but slightly
  smaller AIG than the shared BDD (`150/12/1800` vs `152/12/1824`).

Additional exact structures tried and rejected:

- Binary-search quotient/product tests: low area but long product/compare path
  (`113/38/4294` best).
- High-bit hand formulas (`q4/q3/q2`) plus low-bit BDD: exact but worse than
  the full per-bit BDD.
- Denominator interval case classifiers: delay as low as `11`, but area over
  `225` made ADP worse.
- Compact radix-4 digit flags: area dropped to `128`, but delay rose to `20`.
- Complemented-edge BDDs: node count improved, but synthesized delay became
  `13`; best was `147/13/1911`.
- High-bit residual subtract plus low serial/parallel classifier: low area
  (`97`) but residual path delay stayed high (`26`).
- Fully parallel `q>=k` threshold network: exact but very large
  (`520/25/13000`).
- Small BDD QoR-order probe: no order beat per-bit interleave after synthesis.

Current blocker:

- The remaining gap to reference `106/8/848` is mainly delay.  Current BDD
  forms give delay `12`; arithmetic/residual forms get area near or below
  reference but delay `20+`.  A future breakthrough likely needs a shallow
  shared multi-output quotient classifier, not another serial divider or broad
  threshold table.

## 2026-06-09 Shallow Shared Classifier Follow-Up

New best verified frontend seed:

- `ex266_udiv_ex266_cof_bhi2_a4_bitbdd_wordmux_synth_preset_d18`:
  148/10/1480, ratio 1.745283 to reference ADP 848.

Key structure:

- Use selector `{b[4:3], a[4]}` to split the 10-input division truth table into
  eight cofactors.
- Inside each cofactor, generate local per-output BDD classifiers over the
  remaining bits.
- Reassemble each cofactor into a 5-bit word and use one shared word mux for
  the final quotient, instead of five independent output-bit mux trees.

Why this worked:

- Plain shared BDD: `152/12/1824`.
- Per-output BDD: `150/12/1800`.
- `b[4:3]` cofactor bit-BDD: `147/12/1764`.
- `{b[4:3], a[4:3]}` cofactor bit-BDD: `152/11/1672`.
- `{b[4:3], a[4]}` cofactor bit-BDD with shared word mux: `148/10/1480`.

Additional exact directions tried in this pass:

- Word-level MTBDD cofactors by `b` high bits: exact and close, but best
  `151/12/1812` did not beat bit-level cofactor.
- More aggressive selectors such as `{b[4:3],a[4:3]}` and
  `{b[4:2],a[4:3]}` reduced local depth but increased mux/group area.
- Low divisor-bit selectors such as `{b[4],b[2]}` were exact but worse; the
  useful selector is magnitude-oriented, not arbitrary divisor-low-bit split.
- Complemented-edge local BDDs and explicit balanced mux trees both lost ADP.
- Limited frontend synthflow replay tied the same `148/10/1480` result.

Current blocker:

- The best source now has a real shallow shared classifier shape, but still
  misses reference delay `8` and area `106`.  Further progress likely needs
  deriving algebraic/shared predicates inside the `{b[4:3],a[4]}` cofactors,
  rather than adding more selector bits.

## 2026-06-09 Selected-Bit Hybrid Follow-Up

Additional run/result location:

- `student/runs/integer/ex266_ex276_frontend_highgap_struct2_20260609_1750/results/`

Tested:

- Top1/top2 selected-bit hybrids using the current cheap selector
  `{b[4:3],a[4]}` for low quotient bits and deeper selectors
  `{b[4:3],a[4:3]}` or `{b[4:2],a[4]}` for high quotient bits.

Result:

- No new best.  The closest row was `udiv_ex266_hybrid_top1_a43` at
  `142/11/1562`: lower area than current best, but one extra delay level makes
  ADP worse than `148/10/1480`.
- This suggests the current ex266 gap is not solved by selected high-bit
  deeper cofactors; future work needs a genuinely smaller delay-10 or delay-9
  shared classifier.

## 2026-06-12 mixed-r12 official row

Run ID: `ex200_ex299_frontend_refgap_round12_20260612_2015`, agent `mixed-r12`.

- Method signature: `ex266|unsigned_division_restore_compare_chain|restoring_compare_subtract_chain|shared_shifted_divisor_comparisons_and_remainders|yosys_abc_g_aig|unsigned_low5_high5_div_dbz_sat|quotient_bits_msb_to_lsb`.
- Verilog: `student/work/ex200_ex299_frontend_refgap_round12_20260612_2015/mixed-r12/ex266/verilog/ex266_udiv_restore_cmp_chain.v`.
- AIG: `student/work/ex200_ex299_frontend_refgap_round12_20260612_2015/mixed-r12/ex266/synthflow/ex266/aigs/ex266_restore_cmp_chain_abc_g_aig.aig`.
- Official `evaluate.py`: equivalent, `90/27/2430`; log `student/work/ex200_ex299_frontend_refgap_round12_20260612_2015/mixed-r12/ex266/logs/ex266_restore_cmp_chain_abc_g_aig.evaluate.py.log`.
- Outcome: nonwinning. The chain proves a lower-area quotient structure is possible, but delay 27 is the blocker; future work must parallelize quotient decisions instead of serial remainder refinement.

## 2026-06-12 integer-struct-r16 official rows

Run ID: `ex200_ex299_frontend_refgap_round16_20260612_2233`, agent `integer-struct-r16`.

- Method signature: `ex266|cofactored_quotient_thresholds_can_replace_local_BDD_truth_cubes|bhi2+a4_cofactor_threshold-comparator_word_mux|shared_constant-multiple_comparator_tree_per_quotient_word_cofactor|yosys_abc_g_aig|unsigned_low5_high5_div_dbz_sat|whole_quotient_word`.
- Verilog: `student/work/ex200_ex299_frontend_refgap_round16_20260612_2233/integer-struct-r16/ex266/verilog/ex266_r16_cof_bhi2_a4_threshold_wordmux.v`.
- AIG: `student/work/ex200_ex299_frontend_refgap_round16_20260612_2233/integer-struct-r16/ex266/aigs/ex266_r16_cof_bhi2_a4_threshold_wordmux_abc_g_aig.aig`.
- Official `evaluate.py`: equivalent, `331/20/6620`; log `student/work/ex200_ex299_frontend_refgap_round16_20260612_2233/integer-struct-r16/ex266/logs/ex266_r16_cof_bhi2_a4_threshold_wordmux_abc_g_aig.evaluate.py.log`.
- Outcome: nonwinning. Replacing the local BDD cubes inside the known `{b[4:3],a[4]}` word-mux shape with quotient-threshold comparator trees is exact but far too large and deep versus the current `148/10/1480` frontend. A deeper `bhi3+a4` threshold cofactor also lost (`321/28/8988` best), so this path should not be repeated without a much smaller local predicate derivation.

## 2026-06-12 integer-near-r18 official row

Run ID: `ex200_ex299_frontend_refgap_round18_20260612_2321`, agent `integer-near-r18`.

- Method signature: `ex266|udiv_quotient_digit_recurrence|trial_subtract_borrow_prefix|shared_shifted_divisor_trial_subtract_remainder_chain|yosys_abc_g_and|unsigned_low5_high5_divide_dbz_sat|quotient_word`.
- Verilog: `student/work/ex200_ex299_frontend_refgap_round18_20260612_2321/integer-near-r18/ex266/verilog/ex266_udiv_trialborrow_prefix.v`.
- AIG: `student/work/ex200_ex299_frontend_refgap_round18_20260612_2321/integer-near-r18/ex266/aigs/ex266.aig`.
- Official `evaluate.py`: equivalent, `96/31/2976`; log `student/work/ex200_ex299_frontend_refgap_round18_20260612_2321/integer-near-r18/ex266/logs/ex266_udiv_trialborrow_prefix.evaluate.log`.
- Outcome: nonwinning. The borrow-out quotient digit recurrence is materially different from the round16 cofactored threshold word-mux, but the serial accepted-remainder chain is too deep. Do not repeat unchanged; any future divider recurrence needs parallel/shared quotient selection rather than five dependent subtract stages.

## 2026-06-12 integer-existing-r19 checkpoint row

Run ID: `ex200_ex299_frontend_refgap_round19_20260612_2346`, agent `integer-existing-r19`.

- Method signature: `ex266|cofactor_wordmux_onehot_source_flow_probe|bhi2_a4_local_BDD_groups_with_masked_onehot_word_mux|explicit_onehot_group_masks_and_no_internal_abc_flow|yosys_noabc_aigmap|unsigned_low5_high5_divide_dbz_sat|quotient_word`.
- Verilog: `student/work/ex200_ex299_frontend_refgap_round19_20260612_2346/integer-existing-r19/ex266/verilog/ex266_udiv_cof_bhi2_a4_wordmux_keep_noabc.v`.
- AIG: `student/work/ex200_ex299_frontend_refgap_round19_20260612_2346/integer-existing-r19/ex266/official_eval/ex266_udiv_cof_bhi2_a4_wordmux_keep_noabc/ex266.aig`.
- Official `evaluate.py`: equivalent, `217/18/3906`; log `student/work/ex200_ex299_frontend_refgap_round19_20260612_2346/integer-existing-r19/ex266/logs/ex266_udiv_cof_bhi2_a4_wordmux_keep_noabc.evaluate.py.log`.
- Outcome: nonwinning. Copying the current `{b[4:3],a[4]}` local-BDD wordmux source, rewriting the final selector as one-hot masked ORs, and skipping Yosys internal ABC produced much worse QoR than `148/10/1480`. Do not repeat this one-hot/no-ABC probe unchanged.

## 2026-06-13 mixed-r25 official rows

Run ID: `ex200_ex299_frontend_refgap_round25_20260613_0506`, agent `mixed-r25`.

- Dossier: `student/work/ex200_ex299_frontend_refgap_round25_20260613_0506/mixed-r25/ex266/notes/dossier.md`.
- Official rows:
  - `ex266_r25_int_highgap_udiv_ex266_hybrid_top2_b2a4_synth_preset_d10`: `148/11/1628`.
  - `ex266_r25_int_highgap_udiv_cof_bhi2_bmid2_a_hi3_wordmux_abc_g_aig`: `303/11/3333`.
- Shard rows: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round25_20260613_0506/agent_shards/mixed-r25/candidates.csv` and `evaluation_results.csv`.
- Outcome: both rows are official equivalent but nonwinning versus current frontend `148/10/1480`. The top2 b2/a4 hybrid keeps area but adds one level; the mixed b-mid selector is too large. Next action should find a delay-9/10 local classifier inside the existing `{b[4:3],a[4]}` word mux, not add more selector bits.

## 2026-06-13 mixed-r26 official rows

Run ID: `ex200_ex299_frontend_refgap_round26_20260613_0539`, agent `mixed-r26`.

- Dossier: `student/work/ex200_ex299_frontend_refgap_round26_20260613_0539/mixed-r26/ex266/notes/dossier.md`.
- Official rows:
  - `ex266_r26_int_highgap_udiv_ex266_hybrid_top1_b2a4_synth_preset_d10`: `148/11/1628`.
  - `ex266_r26_int_highgap_udiv_cof_bhi2_blo1_a_hi1_wordmux_abc_g_aig`: `182/12/2184`.
  - `ex266_r26_int_highgap_udiv_ex266_hybrid_top1_a43_synth_preset_d10`: `142/11/1562`.
- Shard rows: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round26_20260613_0539/agent_shards/mixed-r26/candidates.csv` and `evaluation_results.csv`.
- Outcome: all rows are official equivalent but nonwinning versus frontend `148/10/1480`. The top1-a43 row lowers area but adds one delay level; low-divisor selector is too large. Future work should target a delay-10-or-better local classifier inside the existing word-mux structure.

## 2026-06-13 sub-integer-r74 official rows

Run ID: `frontend_source_parallel_round74_20260613_1439`, agent `sub-integer-r74`.

- `ex266_r74_qthreshold_ladder`: descending shared `q*b` threshold ladder; official `evaluate.py` equivalent, `656/41/26896`.
- `ex266_r74_divisor_case_const`: divisor-keyed constant quotient arms; official `evaluate.py` equivalent, `244/13/3172`.
- Shard rows: `student/frontend_campaigns/campaigns/frontend_source_parallel_round74_20260613_1439/agent_shards/sub-integer-r74/candidates.csv`.
- Logs: `student/work/frontend_source_parallel_round74_20260613_1439/sub-integer-r74/ex266/logs/`.
- Outcome: both are nonwinning versus current frontend `148/10/1480`. This reinforces that broad threshold/product tests and divisor-action cases do not recover the compact local classifier inside the `{b[4:3], a[4]}` word-mux structure.

## 2026-06-13 sub-integer-r75 official rows

Run ID: `frontend_source_parallel_round75_20260613_1507`, agent `sub-integer-r75`.

- Dossier: `student/work/frontend_source_parallel_round75_20260613_1507/sub-integer-r75/ex266/notes/dossier.md`.
- Families:
  - `{b[4:3],a[4]}` cofactor local classifier variants with complemented/tree wordmux implementations.
  - Radix-4 top-two shift/subtract quotient recurrence.
  - Narrow shift/subtract quotient recurrence.
- Method signatures are recorded in `student/frontend_campaigns/campaigns/frontend_source_parallel_round75_20260613_1507/agent_shards/sub-integer-r75/candidates.csv`.
- Official rows:
  - `ex266_udiv_ex266_cof_bhi2_a4_comp_wordmux_abc_g_aig`: `153/12/1836`.
  - `ex266_udiv_ex266_cof_bhi2_a4_comp_wordmux_synth_preset_d10`: `148/11/1628`.
  - `ex266_udiv_ex266_cof_bhi2_a4_tree_wordmux_abc_g_aig`: `155/12/1860`.
  - `ex266_udiv_ex266_cof_bhi2_a4_tree_wordmux_synth_preset_d10`: `148/12/1776`.
  - `ex266_udiv_radix4_top2_shift_abc_g_aig`: `136/23/3128`.
  - `ex266_udiv_radix4_top2_shift_synth_preset_d10`: `140/23/3220`.
  - `ex266_udiv_shift_subtract_narrow_abc_g_aig`: `89/28/2492`.
  - `ex266_udiv_shift_subtract_narrow_synth_preset_d10`: `88/28/2464`.
- Logs: `student/work/frontend_source_parallel_round75_20260613_1507/sub-integer-r75/ex266/logs/`.
- Outcome: all rows are official `evaluate.py` equivalent but nonwinning versus frontend `148/10/1480` and current overall `1296`. Complemented/tree wordmux variants either kept area and added delay or added area; algorithmic recurrence variants had low area but excessive delay. Next action should derive smaller local cofactor predicates inside the existing selector rather than repeat broad threshold or serial recurrence families.

## 2026-06-13 sub-integer-r76 official rows

Run ID: `frontend_source_parallel_round76_20260613_1706`, agent `sub-integer-r76`.

- Dossier: `student/work/frontend_source_parallel_round76_20260613_1706/sub-integer-r76/ex266/notes/dossier.md`.
- Families:
  - Denominator high-region quotient comparator prefixes with shared shifted-divisor thresholds.
  - Decision tree over `b[4:3]` and `a[4:3]` with low-bit residual quotient cells.
- Best r76 row: `ex266_r76_hi_cell_residual_lut_synth_preset_d10` official `148/11/1628`; outcome: nonwinning versus frontend `1480` and current `1296`.
- Shard rows: `student/frontend_campaigns/campaigns/frontend_source_parallel_round76_20260613_1706/agent_shards/sub-integer-r76/candidates.csv` and `student/frontend_campaigns/campaigns/frontend_source_parallel_round76_20260613_1706/agent_shards/sub-integer-r76/evaluation_results.csv`.
- Logs: `student/work/frontend_source_parallel_round76_20260613_1706/sub-integer-r76/ex266/logs`.
- Next action: The official rows did not change the known target unless noted above; continue searching for a smaller delay-9/10 local quotient classifier, not r75 wordmux spelling changes or serial recurrence forms.

## 2026-06-13 sub-integer-source-r77 official rows

Run ID: `frontend_source_parallel_round77_20260613_1733`, agent `sub-integer-source-r77`.

- Dossier: `student/work/frontend_source_parallel_round77_20260613_1733/sub-integer-source-r77/ex266/notes/dossier.md`.
- Families:
  - Current `{b[4:3],a[4]}` low-denominator cofactor cells plus high-denominator compare residuals.
  - Grouped restoring trial-subtract residual boundaries for quotient-bit assigns.
- Best r77 row: `ex266_r77_hi_compare_residual_abc_g_aig` official `188/12/2256`; outcome: nonwinning versus frontend `1480` and current `1296`.
- Shard rows: `student/frontend_campaigns/campaigns/frontend_source_parallel_round77_20260613_1733/agent_shards/sub-integer-source-r77/candidates.csv` and `student/frontend_campaigns/campaigns/frontend_source_parallel_round77_20260613_1733/agent_shards/sub-integer-source-r77/evaluation_results.csv`.
- Logs: `student/work/frontend_source_parallel_round77_20260613_1733/sub-integer-source-r77/ex266/logs`.
- Next action: Continue searching for a compact delay-9/10 local quotient classifier; do not repeat r75 wordmux spelling or r76 high-cell residual table as-is.

## 2026-06-14 arith-unary-r2 continuation

Run ID: `ex204_ex299_frontend_continuation_20260614_1216`, agent `arith-unary-r2`.

- Families tested: low-denominator cofactor bit-BDD wordmux variants; radix-4 compact digit, denominator leading-zero smallcase, and parallel-threshold quotient source forms.
- Official best from this shard: `ex266_udiv_cof_bhi1_ahi1_bitbdd_wordmux_synth_preset_d10` at `144/11/1584`.
- Outcome: all rows were official equivalent but nonwinning versus frontend `148/10/1480`; the non-cofactor radix-4 best was `128/20/2560`.
