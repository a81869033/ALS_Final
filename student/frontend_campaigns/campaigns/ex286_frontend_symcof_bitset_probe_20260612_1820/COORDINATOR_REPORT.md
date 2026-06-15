# Coordinator Report: ex286_frontend_symcof_bitset_probe_20260612_1820

Status: merged and validated.

Validation:
- Official `evaluate.py` candidate rows: 5
- Accepted frontend improvements: 2 rows beat the previous ex286 frontend best; best row is kept in registry by index rebuild.
- Success rows missing paths: 0 expected; all AIG/evaluate logs were produced under `student/work/ex286_frontend_symcof_bitset_probe_20260612_1820`.

Accepted Improvements:
- `ex286`: 21705 -> 20190 with `ex286_unknown_symcof_interleave_f00_bits_0_12_1_10_onehot_group_abc_g_aig` (1346/15/20190), reference 2376.
- Secondary non-best improvement: `f10_bits_0_12_1_10` reached 20340.

Interpretation:
- Round6 blockers were too broad: a small explicit outer-bitset change in the existing multi-pair symmetry cofactor family still had headroom.
- This does not solve the reference gap, but it materially improves the largest frontend gap case and gives a concrete local neighborhood to continue.

Artifacts:
- Candidates: `student/frontend_campaigns/campaigns/ex286_frontend_symcof_bitset_probe_20260612_1820/results/candidates.csv`
- Best improvements: `student/frontend_campaigns/campaigns/ex286_frontend_symcof_bitset_probe_20260612_1820/results/best_improvements.csv`
