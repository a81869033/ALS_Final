# Round12 Task Assignments

Run ID: `ex200_ex299_frontend_refgap_round12_20260612_2015`

Shared rules for every shard:
- Read `AGENTS.md`, `student/docs/experiment_run_workflow.md`,
  `student/frontend_campaigns/GOAL.md`, `introduction.md`,
  `student/frontend_campaigns/FRONTEND_PROGRESS.md`, `search_state.csv`,
  `frontend_best_registry.csv`, `current_frontend_gap.csv`,
  `method_judgments.csv`, `manual_judgments.csv`, `hypothesis_bank.csv`,
  then only assigned case indexes and linked notes.
- Do not update global registry/search-state/current-gap files.
- Write only under the assigned `<run_id>/<agent_id>/<case>/` work/run paths
  and the assigned shard/summary paths.
- Official success requires repo `evaluate.py`; `iverilog` is debug only.
- Do not repeat `do_not_repeat_as_is` or low-value signatures unless the
  high-level description, representation, sharing strategy, or synth flow is
  materially different.

## routing-r12

Cases: `ex286`, `ex287`, `ex285`, `ex288`

Goal: find a compact exact routing/normalizer representation for the worst
unknown gaps. Try at least one concrete Verilog candidate or a small diagnostic
that identifies a new descriptor basis; avoid replaying rank/colex/bucket,
symcof, token-count, and old ex280-special families unchanged.

## state-r12

Cases: `ex297`, `ex299`, `ex295`, `ex294`

Goal: lower the cyclic/state family ADP using a representation that is not the
round10/round11 symbol-plane split replay. Prioritize local descriptor sharing,
cofactor banks, GF(2)/ANF residuals, and lower-delay output grouping.

## fp8-bound-r12

Cases: `ex247`, `ex246`, `ex244`, `ex240`

Goal: beat the FP8 boundary-region rows, especially `ex247` ADP `8349`,
`ex246` ADP `7502`, and `ex244` ADP `10234`. Explore shared exponent-delta,
round/saturate predicates, and output grouping rather than direct low-magnitude
attribute replay.

## fp8-resid-r12

Cases: `ex241`, `ex242`, `ex245`, `ex248`, `ex249`, `ex253`

Goal: attack FP8 residual/conversion cases not covered by `fp8-bound-r12`.
Produce at least one official candidate or precise blocker; do not only scope
cases without generation.

## mixed-r12

Cases: `ex225`, `ex223`, `ex224`, `ex218`, `ex204`, `ex274`, `ex266`, `ex276`

Goal: cover high-gap FP16/BF16/integer cases with non-replay ideas. For FP
cases, use semantic residuals and shared field decode; for integer cases, use
shared arithmetic structure or quotient/sqrt classifier variants.
