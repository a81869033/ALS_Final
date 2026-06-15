# ex286_ex287_frontend_structural_decomp_20260614_2320

Run ID: `ex286_ex287_frontend_structural_decomp_20260614_2320`

Purpose: frontend-only structural decomposition search for `ex286` and `ex287`.

Inputs:
- Truth files: `benchmarks/ex286.truth`, `benchmarks/ex287.truth`
- Case indexes: `student/frontend_campaigns/case_index/ex286.md`, `student/frontend_campaigns/case_index/ex287.md`
- Case notes: `student/cases/ex280_ex299_unknown/ex286/frontend_attempts.md`, `student/cases/ex280_ex299_unknown/ex287/frontend_attempts.md`
- Senior clues: `introduction.md`, `ref/IWLS26_presentation.pdf`, `ref/新錄音 20.txt`

Scope:
- Frontend Verilog/AIG only.
- Official success requires repo `evaluate.py` equivalent result with area, delay, ADP, Verilog path, AIG path, and log path.
- No backend portfolio or post-AIG optimization runs.
- No updates to `student/seeds/`.

Current frontend targets:
- `ex286`: beat `20190` ADP from `ex286_frontend_symcof_bitset_probe_20260612_1820`.
- `ex287`: beat `26880` ADP from `ex223_ex299_frontend_parallel_deep_20260614_0943`.

Hypothesis focus:
- Decompose the Hamming-weight-preserving lossy-routing truth tables into a compact nonlinear state or decision graph.
- Avoid unchanged symcof/cofactor selector replay, bucket/key table replay, plain residual BDD, lane-parity repair, and tested popcount/rank/count-coordinate blockers.

Artifacts:
- Work directory: `student/work/ex286_ex287_frontend_structural_decomp_20260614_2320/`
- Campaign directory: `student/frontend_campaigns/campaigns/ex286_ex287_frontend_structural_decomp_20260614_2320/`
- Per-agent shards: `agent_shards/<agent_id>/`

Result summary:
- `ex287` new frontend best: `ex287_orientbdd_keycof_k6_b2_b3_f00_abc_g_aig`, official `evaluate.py` OK at `1645/15/24675`, improving old frontend `26880` by `2205` ADP.
- `ex286` no new frontend best; best campaign result only tied existing `20190`.
- Merged CSVs: `results/candidates.csv`, `results/evaluation_results.csv`, `results/best_improvements.csv`, `results/failed_hypotheses.csv`, `results/shared_structure_report.csv`.
