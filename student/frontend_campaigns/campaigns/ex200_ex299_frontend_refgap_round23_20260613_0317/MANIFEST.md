# ex200_ex299_frontend_refgap_round23_20260613_0317

Run ID: `ex200_ex299_frontend_refgap_round23_20260613_0317`

Purpose: continue after round22 produced no frontend-best improvements. This round is limited to materially new high-level descriptions or representation families for the remaining largest frontend/reference gaps.

Inputs:
- Round22 merged results: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round22_20260613_0218/results/`
- Current gap table: `student/frontend_campaigns/current_frontend_gap.csv`
- Current frontend registry: `student/frontend_campaigns/frontend_best_registry.csv`
- Prior judgments: `student/frontend_campaigns/method_judgments.csv`, `student/frontend_campaigns/manual_judgments.csv`
- Case indexes and notes for assigned cases.

Artifacts:
- Work directory: `student/work/ex200_ex299_frontend_refgap_round23_20260613_0317/`
- Campaign directory: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round23_20260613_0317/`
- Agent shards: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round23_20260613_0317/agent_shards/<agent_id>/`

Coordinator constraints:
- No seed-bundle updates.
- Official candidate success requires repo `evaluate.py` equivalence and complete Verilog/AIG/evaluate-log paths.
- Avoid source-identical tie-current replays from round22.
- A blocker must include concrete diagnostic evidence, not just a prose refusal.
