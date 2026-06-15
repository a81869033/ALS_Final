# ex260 Frontend Attempts

Semantics: signed 4x4 multiply, `signed(low4) * signed(high4)`.

Initial current best:
- `ex260_smul_abs_sign`: 109/19/2071

Notes:
- Compare sign/magnitude against direct signed multiply and explicit correction
  terms for negative operands.

## 2026-06-09 Result

Current best verified frontend seed:

- `ex260_smul_baugh_wooley_wallace_rev_hcla4_abc_g_aig`
- Verilog: `student/work/ex260_ex264_frontend_smul_order_edge_start_20260609_0605/ex260/verilog/ex260_smul_baugh_wooley_wallace_rev_hcla4.v`
- AIG: `student/work/ex260_ex264_frontend_smul_order_edge_start_20260609_0605/ex260/aigs/ex260_smul_baugh_wooley_wallace_rev_hcla4_abc_g_aig.aig`
- QoR: `88/13/1144`, reference ADP `657`, ratio `1.741248`

Attempts:

- Verified semantics: two's-complement `signed(low4) * signed(high4)`.
- Baugh-Wooley Wallace + hybrid CLA from bit 4 improved the old `abs_sign`
  seed from `109/19/2071` to `92/13/1196`.
- Reverse compressor item order combined with hCLA4 improved further to
  `88/13/1144`.
- Booth serial/parallel, Baugh order variants, hCLA start sweep, split-half
  2+2, exact ANF, full case table, and truth-direct AIG were exact or
  diagnostic but worse.
- Follow-up serial column carry-state, minimized carry SOP, full QMC per-bit
  SOP, and QMC selected high-bit override were exact but worse.  QMC high-bit
  override could lower delay on some rows, but the area increase lost ADP.

Open:

- Still outside 1.5x reference.  Further improvement likely needs a
  true shared multi-output 4x4 compressor network beyond per-bit SOP/table
  factoring.

## 2026-06-09 ex260 Deep Follow-Up

Additional exact runs:

- `ex260_ex263_frontend_smul_constfa_signbit_20260609_0638`
- `ex260_ex263_frontend_smul_order_pfx_refine_20260609_0640`
- `ex260_ex263_frontend_smul_counter4_smoke_20260609_0642`
- `ex260_ex263_frontend_smul_corr_order_20260609_0649`
- `ex260_ex263_frontend_smul_unsigned_core_highcorr_20260609_0654`
- `ex260_frontend_smul_shared_bdd_20260609_0658`
- `ex260_ex263_frontend_smul_modcarry_20260609_0703`
- `ex260_ex263_frontend_smul_direct_retry_20260609_0707`
- `ex260_frontend_smul_handmerge_20260609_0710`
- `ex260_ex263_frontend_smul_signcase_core_20260609_0714`

New directions tried and rejected:

- Constant-aware full-adder simplification and sign-bit override did not beat
  `88/13/1144`; sign-bit override increased cost.
- Segment-prefix starts `pfx1..4` tied or worsened the reverse+hCLA4 source.
- Exact 4-input column counters were area-heavy; best ex260 row was about
  `93/13/1209`.
- Correction/sign-aware item ordering (`corrfirst`, `corrlast`, `signfirst`,
  `signlast`, `corrzip`) tied the current best at best and often added area.
- Unsigned `(n-1)x(n-1)` core plus high sign-correction was exact but delay
  rose to 17+; branch-by-sign `signcase` was worse.
- Shared multi-output BDD reduced delay to 11-12 on some rows, but area rose to
  179+, so ADP regressed.
- Modulo-only final carry drop tied or worsened current best, suggesting Yosys
  already removes the unused overflow carry or that it is not the bottleneck.
- Hand-written sparse low-carry/final-merge source stayed at area 88 but delay
  rose to 14, so the current hCLA4 form maps better.

Current best remains:

- `ex260_smul_baugh_wooley_wallace_rev_hcla4_abc_g_aig`
- QoR: `88/13/1144`, reference ADP `657`, ratio `1.741248`

## 2026-06-09 Alternative Semantic Replay

Additional run/result location:

- `student/runs/integer/ex260_frontend_smul_alt_replay_20260609_1812/results/`

Tested:

- Sign/magnitude direct and Wallace variants.
- Signed small case and case-by-`b` constant multiply.
- Shared BDD variants with outside/interleave orders.

Result:

- No new best.  The lowest-delay row was `case_b_signed_const` at `190/9/1710`;
  delay improved versus current `13`, but area was too high.
- Current `88/13/1144` remains the best ADP.  The open problem is still a
  genuinely shallow and shared 4x4 signed compressor, not sign/magnitude,
  constant-case, or BDD replacement.

## 2026-06-12 integer-struct-r16 official rows

Run ID: `ex200_ex299_frontend_refgap_round16_20260612_2233`, agent `integer-struct-r16`.

- Method signature: `ex260|reverse_hybrid_prefix_may_shorten_the_signed_4x4_final_merge|Baugh-Wooley_Wallace_reverse_order_with_reverse_hybrid_CLA4|shared_signed_partial_products_and_final_prefix_generate/propagate_network|yosys_synth_preset_d9|signed_low4_high4_multiply|full_product_word`.
- Verilog: `student/work/ex200_ex299_frontend_refgap_round16_20260612_2233/integer-struct-r16/ex260/verilog/ex260_r16_baugh_wooley_wallace_rev_rhcla4.v`.
- AIG: `student/work/ex200_ex299_frontend_refgap_round16_20260612_2233/integer-struct-r16/ex260/aigs/ex260_r16_baugh_wooley_wallace_rev_rhcla4_synth_preset_d9.aig`.
- Official `evaluate.py`: equivalent, `87/14/1218`; log `student/work/ex200_ex299_frontend_refgap_round16_20260612_2233/integer-struct-r16/ex260/logs/ex260_r16_baugh_wooley_wallace_rev_rhcla4_synth_preset_d9.evaluate.py.log`.
- Outcome: nonwinning. Reverse hybrid prefix saved one area node versus current `88/13/1144` but added one delay level. The 4-input counter variant also lost (`92/14/1288` best). This confirms the ex260 bottleneck is still a delay-13-to-9 final/compressor sharing problem, not a simple prefix orientation or wider counter replacement.

## 2026-06-12 integer-near-r18 official row

Run ID: `ex200_ex299_frontend_refgap_round18_20260612_2321`, agent `integer-near-r18`.

- Method signature: `ex260|signed_correction_factored_shallow|unsigned_3x3_core_plus_twos_complement_correction|shared_sign_correction_rows_and_one_shallow_sum|yosys_abc_g_and|signed_low4_high4_multiply|product_word`.
- Verilog: `student/work/ex200_ex299_frontend_refgap_round18_20260612_2321/integer-near-r18/ex260/verilog/ex260_smul_factored_correction_shallow.v`.
- AIG: `student/work/ex200_ex299_frontend_refgap_round18_20260612_2321/integer-near-r18/ex260/aigs/ex260.aig`.
- Official `evaluate.py`: equivalent, `102/17/1734`; log `student/work/ex200_ex299_frontend_refgap_round18_20260612_2321/integer-near-r18/ex260/logs/ex260_smul_factored_correction_shallow.evaluate.log`.
- Outcome: nonwinning. Factoring the signed product into a 3x3 unsigned core plus two two's-complement correction rows avoids the banned Baugh-Wooley RHCLA/Dadda replay, but the correction-adder path is still much worse than current `88/13/1144`. Do not repeat this exact correction-sum form without a materially shallower merge.

## 2026-06-12 integer-existing-r19 checkpoint row

Run ID: `ex200_ex299_frontend_refgap_round19_20260612_2346`, agent `integer-existing-r19`.

- Method signature: `ex260|signed_lowmerge_explicit_source_flow_probe|Baugh-Wooley_rev_hCLA4_with_explicit_low_carry|explicit_low_nibble_carry_and_no_internal_abc_flow|yosys_noabc_aigmap|signed_low4_high4_multiply|product_word`.
- Verilog: `student/work/ex200_ex299_frontend_refgap_round19_20260612_2346/integer-existing-r19/ex260/verilog/ex260_smul_bw_rev_hcla4_explicit_lowcarry_noabc.v`.
- AIG: `student/work/ex200_ex299_frontend_refgap_round19_20260612_2346/integer-existing-r19/ex260/official_eval/ex260_smul_bw_rev_hcla4_explicit_lowcarry_noabc/ex260.aig`.
- Official `evaluate.py`: equivalent, `113/15/1695`; log `student/work/ex200_ex299_frontend_refgap_round19_20260612_2346/integer-existing-r19/ex260/logs/ex260_smul_bw_rev_hcla4_explicit_lowcarry_noabc.evaluate.py.log`.
- Outcome: nonwinning. Copying the current best source, making the low carry chain explicit, and skipping Yosys internal ABC worsened both area and delay versus `88/13/1144`. Do not repeat this explicit low-carry/no-ABC probe unchanged.

## 2026-06-13 mixed-r25 official rows

Run ID: `ex200_ex299_frontend_refgap_round25_20260613_0506`, agent `mixed-r25`.

- Dossier: `student/work/ex200_ex299_frontend_refgap_round25_20260613_0506/mixed-r25/ex260/notes/dossier.md`.
- Official rows:
  - `ex260_r25_signed_mul_baugh_wooley_wallace_outside_rhcla3_abc_g_aig`: `93/14/1302`.
  - `ex260_r25_signed_mul_baugh_wooley_wallace_rev_pfx3_abc_g_aig`: `88/14/1232`.
- Shard rows: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round25_20260613_0506/agent_shards/mixed-r25/candidates.csv` and `evaluation_results.csv`.
- Outcome: both rows are official equivalent but nonwinning versus current frontend `88/13/1144`. The rev-pfx3 row preserves area 88 but loses one level, confirming the remaining gap is not solved by simple final-prefix orientation. Next action should search for a genuinely delay-12 or lower compressor/final-merge representation, not more Baugh-Wooley prefix sweeps.

## 2026-06-13 mixed-r26 official rows

Run ID: `ex200_ex299_frontend_refgap_round26_20260613_0539`, agent `mixed-r26`.

- Dossier: `student/work/ex200_ex299_frontend_refgap_round26_20260613_0539/mixed-r26/ex260/notes/dossier.md`.
- Official rows:
  - `ex260_r26_signed_mul_baugh_wooley_wallace_rev_hcla4_abc_g_gates`: `90/13/1170`.
  - `ex260_r26_signed_mul_baugh_wooley_wallace_outside_hcla1_signbit_abc_g_aig`: `97/14/1358`.
  - `ex260_r26_signed_mul_baugh_wooley_wallace_rev_hcla4_synth_preset_d9`: `88/16/1408`.
- Shard rows: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round26_20260613_0539/agent_shards/mixed-r26/candidates.csv` and `evaluation_results.csv`.
- Outcome: all rows are official equivalent but nonwinning versus frontend `88/13/1144`. Gate-flow current-source recut is close but +2 area, and preset d9 preserves area but adds three levels. Next action remains a genuinely shorter shared compressor/final-merge, not another simple Baugh-Wooley flow sweep.

## 2026-06-13 sub-integer-r74 official rows

Run ID: `frontend_source_parallel_round74_20260613_1439`, agent `sub-integer-r74`.

- `ex260_r74_digit2_signed_recompose`: signed 2-bit digit decomposition with shifted cross products; official `evaluate.py` equivalent, `101/21/2121`.
- `ex260_r74_sign_offset_fold`: unsigned low3 product plus folded sign-bit offset correction; official `evaluate.py` equivalent, `82/22/1804`.
- Shard rows: `student/frontend_campaigns/campaigns/frontend_source_parallel_round74_20260613_1439/agent_shards/sub-integer-r74/candidates.csv`.
- Logs: `student/work/frontend_source_parallel_round74_20260613_1439/sub-integer-r74/ex260/logs/`.
- Outcome: both rows are materially different from the current Baugh-Wooley prefix replay, but both are delay-heavy and nonwinning versus current frontend `88/13/1144`. The offset form reduces area to 82 but confirms the missing structure is a shallower shared signed 4x4 compressor/final merge, not algebraic sign correction.

## 2026-06-13 sub-integer-r75 official rows

Run ID: `frontend_source_parallel_round75_20260613_1507`, agent `sub-integer-r75`.

- Dossier: `student/work/frontend_source_parallel_round75_20260613_1507/sub-integer-r75/ex260/notes/dossier.md`.
- Families:
  - Baugh-Wooley partial-product compressor with carry-select final merge groups 2/3/4.
  - Radix-4 Booth rows with shared recoder, CSA, and CLA final merge.
- Method signatures are recorded in `student/frontend_campaigns/campaigns/frontend_source_parallel_round75_20260613_1507/agent_shards/sub-integer-r75/candidates.csv`.
- Official rows:
  - `ex260_smul_baugh_wooley_wallace_csel2_abc_g_aig`: `92/15/1380`.
  - `ex260_smul_baugh_wooley_wallace_csel2_synth_preset_d13`: `91/14/1274`.
  - `ex260_smul_baugh_wooley_wallace_csel3_abc_g_aig`: `90/16/1440`.
  - `ex260_smul_baugh_wooley_wallace_csel3_synth_preset_d13`: `91/14/1274`.
  - `ex260_smul_baugh_wooley_wallace_csel4_abc_g_aig`: `94/13/1222`.
  - `ex260_smul_baugh_wooley_wallace_csel4_synth_preset_d13`: `95/15/1425`.
  - `ex260_smul_booth_radix4_csa_cla_abc_g_aig`: `102/16/1632`.
  - `ex260_smul_booth_radix4_csa_cla_synth_preset_d13`: `102/16/1632`.
- Logs: `student/work/frontend_source_parallel_round75_20260613_1507/sub-integer-r75/ex260/logs/`.
- Outcome: all rows are official `evaluate.py` equivalent but nonwinning versus frontend `88/13/1144` and current overall `1066`. Carry-select final handling did not reduce delay below 13 and added area; Booth remained area/delay worse. Next action should avoid further carry-select group sweeps unless the compressor rows themselves change materially.

## 2026-06-13 sub-integer-r76 official rows

Run ID: `frontend_source_parallel_round76_20260613_1706`, agent `sub-integer-r76`.

- Dossier: `student/work/frontend_source_parallel_round76_20260613_1706/sub-integer-r76/ex260/notes/dossier.md`.
- Families:
  - Sign-preconditioned high-operand shifted rows with one shared final negate/correction.
  - Two's-complement weighted partial rows with explicit shared 3:2 carry-save slice before the negative sign row.
- Best r76 row: `ex260_r76_weighted_rows_csa_reuse_synth_preset_d13` official `117/15/1755`; outcome: nonwinning versus frontend `1144` and current `1066`.
- Shard rows: `student/frontend_campaigns/campaigns/frontend_source_parallel_round76_20260613_1706/agent_shards/sub-integer-r76/candidates.csv` and `student/frontend_campaigns/campaigns/frontend_source_parallel_round76_20260613_1706/agent_shards/sub-integer-r76/evaluation_results.csv`.
- Logs: `student/work/frontend_source_parallel_round76_20260613_1706/sub-integer-r76/ex260/logs`.
- Next action: The official rows did not change the known target unless noted above; continue looking for a shallower shared signed 4x4 compressor/final-merge source rather than repeating Baugh-Wooley carry-select or r75 Booth CSA forms.

## 2026-06-13 sub-integer-source-r77 official rows

Run ID: `frontend_source_parallel_round77_20260613_1733`, agent `sub-integer-source-r77`.

- Dossier: `student/work/frontend_source_parallel_round77_20260613_1733/sub-integer-source-r77/ex260/notes/dossier.md`.
- Families:
  - Current Baugh-Wooley source with explicit common sign-correction buses, grouped partial products, and named high carry wires.
  - Small low-bit ANF/common-monomial helper with current high-bit compressor/carry structure.
- Best r77 row: `ex260_r77_bw_boundary_cse_abc_g_aig` official `87/16/1392`; outcome: nonwinning versus frontend `1144` and current `1066`.
- Shard rows: `student/frontend_campaigns/campaigns/frontend_source_parallel_round77_20260613_1733/agent_shards/sub-integer-source-r77/candidates.csv` and `student/frontend_campaigns/campaigns/frontend_source_parallel_round77_20260613_1733/agent_shards/sub-integer-source-r77/evaluation_results.csv`.
- Logs: `student/work/frontend_source_parallel_round77_20260613_1733/sub-integer-source-r77/ex260/logs`.
- Next action: Results here should be used as source-boundary evidence only; avoid repeating r75 carry-select/Booth or r76 weighted-row families unchanged.

## 2026-06-14 arith-unary-r2 continuation

Run ID: `ex204_ex299_frontend_continuation_20260614_1216`, agent `arith-unary-r2`.

- Families tested: Baugh-Wooley column arithmetic, direct signed multiply, Booth radix-4 CSA/CLA, and signed-constant case source forms.
- Official best from this shard: `ex260_smul_booth_radix4_csa_cla_abc_g_aig` at `102/16/1632`.
- Outcome: all rows were official equivalent but nonwinning versus frontend `92/12/1104`; Baugh-Wooley column arithmetic had lower area but delay `31` (`80/31/2480`).
