# Round65 Task Assignments

Global constraints:
- Frontend/source-only only.
- Do not run backend portfolios.
- Do not run standalone ABC/AIG remap/post-processing. ABC is allowed only inside Yosys RTL synthesis and official `evaluate.py`.
- Do not use old ex280-specific search scripts.
- Do not update `prompt_log.md`.
- Do not update coordinator-owned global registry/state CSVs directly; write proposed rows in shard CSVs and summaries.
- Use disjoint outputs under `student/work/frontend_source_parallel_round65_20260613_1029/<agent_id>/<case>/`, `student/runs/<domain>/frontend_source_parallel_round65_20260613_1029/<agent_id>/<case>/`, and `student/frontend_campaigns/campaigns/frontend_source_parallel_round65_20260613_1029/agent_shards/<agent_id>/`.
- Record official `evaluate.py` area/delay/ADP and real Verilog/AIG/log paths for every candidate.

Required reads before RTL:
- `AGENTS.md`
- `student/docs/experiment_run_workflow.md`
- `student/frontend_campaigns/GOAL.md`
- `student/frontend_campaigns/FRONTEND_PROGRESS.md`
- `student/frontend_campaigns/search_state.csv`
- `student/frontend_campaigns/frontend_best_registry.csv`
- `student/frontend_campaigns/current_frontend_gap.csv`
- `student/frontend_campaigns/method_judgments.csv`
- `student/frontend_campaigns/manual_judgments.csv`
- `student/frontend_campaigns/hypothesis_bank.csv`
- `introduction.md`
- `ref/新錄音 20.txt`
- Assigned case indexes and notes
- Round64 summaries for overlapping cases

## sub-fp8-hypot-classifier-r65

Agent: `019ebed0-fbc2-7ac3-9e4d-f9d81e1d1244` (`Copernicus`)

Cases: `ex244`, `ex249`

Current frontend/reference:
- `ex244`: `9120 / 4272`
- `ex249`: `4342 / 2079`

Direction:
- Avoid r64 ratio/squared-ratio/sqmin/siggap threshold families unchanged.
- Try exact compact classifier structures over reachable semantic states: shared min/max exponent class, saturation/zero shell, and small per-output Boolean classifiers derived from reachable `(gap,max_sig,min_sig)` or squared-ratio bins.
- Reject classifiers if cube/predicate count becomes table-sized.

## sub-fp8-codearith-r65

Agent: `019ebed1-4413-7a41-849a-0b5ba9c6a58a` (`Hypatia`)

Cases: `ex246`, `ex247`

Current frontend/reference:
- `ex246`: `6888 / 2805`
- `ex247`: `7291 / 2975`

Direction:
- Avoid r64 zone lattice, r63 bitplane/boundary-low SOP, r62 product/qclass smallpat, and old seed replay.
- Try code-arithmetic encodings: product/quotient in log-magnitude code, signed biased exponent microcode, quotient reciprocal nibble code, and exact Boolean classifiers for only the rounding/saturation boundary bits.
- Favor lower area even if delay remains 22-28; current bottleneck is ADP area overhead.

## sub-unk285-localrule-r65

Agent: `019ebed1-9b2f-7320-93ec-f84d37b65557` (`Confucius`)

Cases: `ex285`

Current frontend/reference:
- `ex285`: `11033 / 5499`

Direction:
- Avoid decision-tree flow probes, BDD/cofactor repeats, pairfield/twopair residual tables, cube cover, and r64 no-table smoke formulas unchanged.
- Try exact local-rule screens for Hamming-weight layers: small swap network descriptors, popcount-window movement, reversible/local majority movement, and monotone layer transition predicates.
- Emit RTL only if exactness screen is strong and residual is small; otherwise record blocker evidence.

## sub-unklarge-rule-r65

Agent: `019ebed2-260b-7650-8151-80ddb5be9eef` (`Kierkegaard`)

Cases: `ex297`, `ex299`

Current frontend/reference:
- `ex297`: `554958 / 225900`
- `ex299`: `2317740 / 1013807`

Direction:
- Avoid r64 compact recurrence state with huge default-key tables, r63 compression helper trees, adjhist distance2 RTL timeout, BDD orders, and rot2 canonical replay.
- Try non-table local rules over 2-bit symbols: radius-1/radius-2 cellular update, ring conservation descriptors, cyclic prefix state, and sparse exception-free formulas. Screen exactness before emitting RTL.
- Do not emit table-sized Verilog.
