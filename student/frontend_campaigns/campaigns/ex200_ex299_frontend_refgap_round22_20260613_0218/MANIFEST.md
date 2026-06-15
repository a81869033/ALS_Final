# ex200_ex299_frontend_refgap_round22_20260613_0218

Run ID: `ex200_ex299_frontend_refgap_round22_20260613_0218`

Purpose: continue frontend high-gap search after round21, prioritizing cases still far from `reference_result.csv` with new high-level descriptions and shared-structure RTL rather than replaying low-value method signatures.

Inputs:
- Truth files: `benchmarks/exNNN.truth`
- Current frontend registry: `student/frontend_campaigns/frontend_best_registry.csv`
- Current gap index: `student/frontend_campaigns/current_frontend_gap.csv`
- Prior search state: `student/frontend_campaigns/search_state.csv`
- Case indexes: `student/frontend_campaigns/case_index/exNNN.md`

Artifacts:
- Campaign directory: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round22_20260613_0218/`
- Work directory: `student/work/ex200_ex299_frontend_refgap_round22_20260613_0218/`
- Domain run directories: `student/runs/<domain>/ex200_ex299_frontend_refgap_round22_20260613_0218/`
- Agent shards: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round22_20260613_0218/agent_shards/<agent_id>/`
- Agent summaries: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round22_20260613_0218/agent_summaries/<agent_id>.md`
- Merged results: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round22_20260613_0218/results/`

Methods required:
- Start from the simplest defensible high-level description for each case.
- Try at least two materially different hypothesis families unless the first candidate beats reference.
- Favor shared decode, exponent/mantissa/sign logic, rounding/saturation predicates, partial products, GF(2)/ANF monomials, routing/state descriptors, and BDD/cofactor subfunctions.
- Use `iverilog` only for debug; official validity and QoR must come from repo `evaluate.py`.

Coordinator notes:
- Do not write partial `student/seeds` bundles.
- Do not use the old ex280-only search script.
- Do not repeat method signatures marked `do_not_repeat_as_is` or low-value unless the high-level description, representation, sharing, or synth flow materially differs.
