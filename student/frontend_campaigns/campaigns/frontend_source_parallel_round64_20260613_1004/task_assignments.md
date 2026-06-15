# Round64 Task Assignments

Run ID: `frontend_source_parallel_round64_20260613_1004`

Global constraints for every shard:
- Frontend/source-only search. Do not run backend portfolios.
- Do not run standalone ABC/AIG remap/post-processing outside Yosys RTL synthesis and official `evaluate.py`.
- Do not use old ex280-specific search scripts.
- Do not update `prompt_log.md`.
- Do not overwrite or revert other sessions' dirty work.
- Use disjoint outputs under `student/work/frontend_source_parallel_round64_20260613_1004/<agent_id>/<case>/`, `student/runs/<domain>/frontend_source_parallel_round64_20260613_1004/<agent_id>/<case>/`, and `student/frontend_campaigns/campaigns/frontend_source_parallel_round64_20260613_1004/agent_shards/<agent_id>/`.
- Only claim success for official `evaluate.py` equivalent rows with complete area, delay, ADP, Verilog path, AIG path, and evaluate log path.
- Record non-equivalent, blocked, and low-value hypotheses in shard CSVs.
- Try at least two materially different hypothesis families per case unless the first candidate beats the reference.

Required files before generating RTL:
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
- Assigned `case_index/exNNN.md` files and their listed case notes

## sub-fp8-add-alt-r64

Agent: `019ebebb-7a93-77b3-98c0-839556129cdf` (`James`)

Cases: `ex244`, `ex249`

Direction:
- Avoid replaying max-eff BDD, gapcofactor, delta-bit saturation sharing, raw-exp output-bit grouping, delta-inc, or limited-carry variants unchanged.
- Try new semantic coordinates for hypot-like structures: squared-magnitude threshold classes, ratio-of-min-to-max bins, compact leading-class predicates, and output-bit PLA/cube cover only when the shared predicate basis is small.
- Look for shared max/min, exponent-gap, saturation, rounding, and delta predicates that reduce area without increasing delay past current best.

## sub-fp8-muldiv-alt-r64

Agent: `019ebebb-f63d-74f1-b290-4468c69c440a` (`Erdos`)

Cases: `ex246`, `ex247`

Direction:
- Avoid product seed replay, sigpair round predicates, product-class smallpat, qclass smallpat, quotient-region split, selected-bit residual cofactor, and boundary-low SOP variants unchanged.
- Try alternative arithmetic encodings: log-domain exponent/mantissa class split, reciprocal-table multiply for division, compact quotient/product boundary lattices, and output-bit PLA/cube covers from reachable semantic states.
- Prefer representations that share sign/exponent/special-case shell and compact rounding/saturation predicates across all output bits.

## sub-mixed-diffroute-r64

Agent: `019ebebc-4cf5-7a53-ba06-69f08e7e0f44` (`Epicurus`)

Cases: `ex240`, `ex285`

Direction:
- `ex240`: avoid branch-pack split norm, r61 formula/gapcase/active gating, active-region magnitude tables, broad BDD fallback, and current source flow probes. Try one-hot leading-zero bucket normalizers, separate sign/magnitude selected-output factoring, and compact cancellation predicates that reduce muxing.
- `ex285`: avoid cube cover, single-pair orbit, nonlinear mixed residual, two-pair selector residual tables, pairfield BDD, and decision-tree synth-flow probes unchanged. Try a true nonlinear movement recurrence or small shared state descriptor for central Hamming-weight layers.

## sub-unklarge-alt-r64

Agent: `019ebebc-e6e4-7bb1-a37c-789c9f3ce647` (`Hilbert`)

Cases: `ex297`, `ex299`

Direction:
- Avoid broad BDD orders, rot2 canonical replay, rotation representative BDD replay, adjhist distance2 descriptor residual RTL that times out, and r63 tree/helper compression paths that still require huge override/default tables.
- Try non-table structural hypotheses: 2-bit-symbol local transition recurrence, ring/cyclic cell descriptor with shared update rules, sparse exception-free state descriptors, and cofactor screens that reject oversized forms before emitting RTL.
- Do not emit Verilog if estimated generated source remains table-sized. Record the blocker with descriptor sizes and next action.
