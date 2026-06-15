# ex200_ex299_frontend_refgap_round21_20260613_0040

Run ID: `ex200_ex299_frontend_refgap_round21_20260613_0040`

Purpose: continue after round20 produced no frontend-best improvements. Focus on high-gap cases not effectively advanced by round20 first-case checkpoints.

Inputs:
- Truth files: `benchmarks/exNNN.truth`
- Registry/gap files: `student/frontend_campaigns/frontend_best_registry.csv`, `student/frontend_campaigns/current_frontend_gap.csv`
- Case indexes and linked case notes for assigned cases

Artifacts:
- Campaign directory: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round21_20260613_0040/`
- Work directory: `student/work/ex200_ex299_frontend_refgap_round21_20260613_0040/`
- Domain run directories: `student/runs/<domain>/ex200_ex299_frontend_refgap_round21_20260613_0040/`

Validation:
- Official `evaluate.py` is the only accepted equivalence/QoR source.
- Success rows must include Verilog, AIG, and evaluate-log paths.

