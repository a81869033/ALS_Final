# frontend_decision_structural_round92_20260614_0055

Run ID: `frontend_decision_structural_round92_20260614_0055`

Purpose: frontend-only decision-graph and structural-RTL search for the
remaining `frontend_best_adp / reference_adp > 1.5` cases, excluding
`ex286` and `ex287` per user direction.

Motivation:
- Rounds 87-91 produced mostly equivalent but nonwinning variants.
- Round91 showed simple output-cone mixing is not enough.
- This round requires compact shared decision nodes and structural RTL
  generated from the current high-level description, or a revised
  high-level description when the current one is too table-like.

Rules:
- Frontend/source only. No backend portfolio, backend remap, or post-AIG
  optimization.
- Official equivalence/QoR is repo `evaluate.py`.
- `candidates.csv` and `evaluation_results.csv` may contain only real official
  attempts with existing Verilog/AIG/log paths.
- Planned rows belong in `active_methods.csv`; blockers belong in
  `failed_hypotheses.csv`.
- Do not edit `prompt_log.md`, seed bundles, global registries, backend
  scripts, or unrelated dirty files.

Required representation families:
- Compact decision graph with shared predicate/node bus.
- Structural RTL using shared exponent/mantissa/sign, arithmetic, routing,
  state, or selector descriptors.
- Output-grouped residual tables only when the residual is demonstrably smaller
  than prior table-sized descriptors.

Results:
- Merged candidate rows: 8 official `evaluate.py` equivalent frontend attempts.
- Best improvements: 0.
- Failed/blocker rows: 16.
- Shared-structure rows: 10.
- Merge sanity: `missing_paths=0`, `duplicate_method_signatures=0`.

Official attempts:
- `ex247_r92_bound_nodebus_grouped`: `372/26/9672`
- `ex246_r92_product_nodebus_grouped`: `346/31/10726`
- `ex249_r92_rawexp_topconvert_nodes`: `192/29/5568`
- `ex241_r92_product_affine_decision`: `710/34/24140`
- `ex245_r92_unified_active_decision`: `665/36/23940`
- `ex260_r92_bitweight_pairrows_abc_g_aig`: `105/17/1785`
- `ex266_r92_top2_residual_low3_abc_g_aig`: `100/31/3100`
- `ex285_r92_global_parity_repair_bit0`: `824/25/20600`

Best result:
- No frontend best changed. The tested decision-graph/structural RTL variants
  were equivalent but worse than the existing frontend bests.
