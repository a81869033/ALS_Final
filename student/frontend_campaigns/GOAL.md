# Frontend Improvement Campaign Goal

This file is the detailed operating spec for future sessions/subagents working
on frontend seed improvement.

## Objective

Find better frontend seeds for cases whose current frontend/high-level RTL is
still far from `reference_result.csv`. The goal is to beat the senior baseline,
not just produce small improvements. Focus on deriving the simplest correct
high-level description per case, then generating diverse Verilog
representations with shared structures that synthesize to lower ADP.

## Required Multi-Agent Execution

Do not run this campaign as a single-threaded manual search. The next session
must immediately split the work across multiple subagents, unless the user
explicitly asks for a single-case/manual run.

Recommended initial split:

- `fp16-agent`: `ex223`, `ex224`, `ex225`
- `float-fp8-agent`: `ex240`, `ex241`, `ex242`, `ex244-ex249`, `ex253`
- `unknown-a-agent`: `ex280-ex289`
- `unknown-b-agent`: `ex290-ex299`
- `integer-agent`: `ex256`, `ex260`, `ex261`, `ex266`, `ex270`, `ex276`,
  `ex277`
- `bf16-agent`: `ex200`, `ex204`, `ex205`

If agent budget is limited, start with 4 agents by merging `bf16-agent` into
the lowest-load agent and merging all unknown cases into one agent. If agent
budget is larger, split by individual case clusters.

The coordinator session must:

1. Assign each subagent a disjoint case list and a campaign output directory.
2. Tell each subagent to read only the relevant case index/notes first.
3. Require each subagent to check prior methods before generating code.
4. Require at least two different hypothesis families per assigned case unless
   a first attempt already beats reference.
5. Collect subagent summaries in `task_assignments.md` and campaign CSVs.
6. Run or verify official `evaluate.py` results before accepting any claimed
   improvement.
7. Rebuild the frontend campaign index after merging subagent outputs.

Subagents must not write to the same candidate/log filenames. Use paths scoped
by `<run_id>/<agent_id>/<case>/...`.

## First Files To Read

Read in this order:

1. `AGENTS.md`
2. `student/docs/experiment_run_workflow.md`
3. `student/frontend_campaigns/FRONTEND_PROGRESS.md`
4. `student/frontend_campaigns/search_state.csv`
5. Assigned `student/frontend_campaigns/case_index/exNNN.md`
6. Only then open relevant `case_notes_paths` from the case index.

Do not scan all of `student/runs`, `student/work`, or large CSVs at startup.
Use filtered reads for one case or one `method_signature`.

## Source Of Truth

- `reference_result.csv`: senior baseline to beat.
- `benchmarks/exNNN.truth`: functional truth.
- Official `evaluate.py`: final equivalence/QoR authority.
- `student/frontend_campaigns/frontend_best_registry.csv`: current best known
  frontend seed per case.
- `student/frontend_campaigns/current_frontend_gap.csv`: current best
  frontend/backend/reference comparison.
- `student/frontend_campaigns/method_judgments.csv`: grouped prior method
  outcomes and reuse policies.
- `student/frontend_campaigns/manual_judgments.csv`: manual overrides for
  automatic judgments.
- `student/frontend_campaigns/hypothesis_bank.csv`: proposed/running/tested
  hypotheses.

## Priority

Start from active/queued high-gap cases in `search_state.csv`.

Current operating priority is the worst `frontend_best_adp / reference_adp`
ratio in `frontend_best_registry.csv`. Before launching a new search round,
sort by this frontend/reference ratio and assign the worst cases first. Do not
spend capacity on lower-ratio cases while high-ratio cases still lack a
defensible new high-level hypothesis, unless the user explicitly redirects.

High frontend priority currently includes:

- `fp16`: `ex223`, `ex224`, `ex225`
- `float_fp8`: `ex240`, `ex241`, `ex242`, `ex244`, `ex245`, `ex246`,
  `ex247`, `ex248`, `ex249`, `ex253`
- `unknown`: `ex280-ex299`
- `integer`: `ex256`, `ex260`, `ex261`, `ex266`, `ex270`, `ex276`, `ex277`
- `bf16`: `ex200`, `ex204`, `ex205`

Medium frontend priority includes:

- `bf16`: `ex201`, `ex203`, `ex218`
- `integer`: `ex255`, `ex257`, `ex258`, `ex259`, `ex263`, `ex264`,
  `ex267`, `ex268`, `ex273`, `ex274`, `ex278`, `ex279`

Do not spend frontend time first on already-beat or backend-close cases unless
the user explicitly redirects.

## Function Clues

Treat senior/PPT descriptions as strong priors, not constraints.

Also read `introduction.md` before new frontend-search campaigns. Use it as a
methodology checklist, especially: reverse-engineer the truth table into a
semantic function first, use structured Verilog rather than direct truth-table
expansion where possible, exploit floating-point field structure, use
algorithmic RTL for integer arithmetic, and use class/rotation/split/decision
structures for unknown families. Do not copy it blindly; every attempt still
needs a case-specific hypothesis, representation, sharing strategy, and
official verification.

- `ex200-ex219`: BF16 unary ops
- `ex220-ex239`: FP16 unary ops, IEEE half, DAZ+FTZ
- `ex240-ex253`: FP16/BF16 to FP8 conversion variants
- `ex254`: FP8 addition
- `ex255-ex259`: unsigned N x N multiplier
- `ex260-ex264`: signed N x N multiplier
- `ex265-ex269`: unsigned divider with b=0 saturation
- `ex270-ex274`: unsigned squarer
- `ex275-ex279`: bit-by-bit restoring integer square root
- `ex280-ex284`: quartic GF(2) event generator + fixed 1 + z^-2 filter
- `ex285-ex289`: Hamming-weight-preserving lossy routing/normalizer
- `ex290-ex294`: global state/permutation-like transform with I + R^-2
- `ex295/ex297/ex299`: cyclic 2-bit-symbol rot2/cell descriptor family
- `ex296/ex298`: odd/open-boundary counterpart

If the clue does not explain the truth table or QoR, propose alternative
hypotheses.

## Required Workflow

For each assigned case:

1. Read the case index and case notes.
2. Check `method_judgments.csv` for prior low-value directions.
3. Build a high-level-description dossier before writing Verilog. The dossier
   must state the observed truth-table invariants, senior/PPT clue if any,
   `introduction.md` method clue if any, prior failed descriptions, and the
   simplest current semantic hypothesis. Save this in the campaign work tree
   and summarize it in the case's `frontend_attempts.md`.
4. Pick or add a hypothesis in `hypothesis_bank.csv`.
5. Define a precise `method_signature`:
   `case|high_level_hypothesis|representation|sharing|synth_flow|semantics|output_grouping`
6. Avoid signatures with `reuse_policy=do_not_repeat_as_is` unless the new
   attempt is materially different.
7. Build multiple materially different Verilog representation families for the
   same high-level hypothesis when practical. Examples include arithmetic RTL,
   shared decode plus residual tables, grouped/cofactored BDDs, GF(2)/ANF
   shared roots, split decision graphs, and output-grouped predicate networks.
   If only one family is attempted, document why other families are blocked.
8. Use `iverilog` simulation for quick debug where practical.
9. Run official `evaluate.py` before claiming success.
10. Record every attempt in the campaign CSVs.
11. Update the per-case documentation before finishing the case. At minimum,
    append a dated entry to the relevant `frontend_attempts.md` or case note
    with high-level description, representation family, sharing strategy,
    method_signature, official result, paths, outcome, and next action.
12. Update `hypothesis_bank.csv`, `search_state.csv`, and if needed
    `manual_judgments.csv`.
13. Re-run `python3 student/scripts/build_frontend_campaign_index.py`.

For multi-agent runs, the coordinator must merge subagent results only after
checking path uniqueness, method signatures, and official evaluation status.

## Diversity Requirements

Do not only tweak the current best. Maintain diversity:

- exploit: extend promising methods
- explore: try different representation families
- wildcard: test plausible non-PPT hypotheses

Compare per-output independent logic against shared multi-output logic when
possible. Shared intermediate structures are important for ADP.

Potential shared structures:

- shared special-case decode
- shared exponent/mantissa/sign decode
- shared rounding/saturation predicates
- shared partial products/compressor rows
- shared quotient/sqrt trial subtract signals
- shared comparators/prefix networks
- shared GF(2)/ANF monomials
- shared routing/permutation/cell descriptor state
- shared BDD/cofactor subfunctions

Representation attempts should be explicit and comparable. For each case, try
to separate these questions:

- What is the simplest semantic/high-level function?
- What intermediate values are naturally shared across outputs?
- Which output grouping exposes the most sharing?
- Which form gives lower area but longer delay, and which gives lower delay
  but higher area?

Record both winning and losing answers so future rounds do not rediscover the
same failure.

## Verification Standards

Never mark a candidate valid unless:

- It is equivalent by official `evaluate.py`.
- area, delay, and ADP are recorded.
- Verilog/AIG paths exist.
- logs or evidence paths are recorded.

`iverilog` is for debugging only. Passing simulation is not sufficient.

Non-equivalent candidates must be recorded as failed, not silently discarded.
Equivalent but worse candidates should still be recorded when they clarify a
method direction.

## Output Contract

For each new campaign use:

```text
student/frontend_campaigns/campaigns/<run_id>/
  MANIFEST.md
  task_assignments.md
  agent_summaries/
    <agent_id>.md
  results/
    candidates.csv
    best_improvements.csv
    failed_hypotheses.csv
    simulation_results.csv
    evaluation_results.csv
    shared_structure_report.csv
```

Large artifacts go to:

```text
student/work/<run_id>/<agent_id>/<case>/
student/runs/<domain>/<run_id>/<agent_id>/<case>/
```

Do not promote to `student/seeds` unless the user asks.

## CSV Maintenance

Update these when appropriate:

- `frontend_best_registry.csv`: new best frontend seed per case
- `search_state.csv`: status, assignment, next action
- `hypothesis_bank.csv`: hypothesis status
- `manual_judgments.csv`: override wrong automatic reuse policies
- per-case `frontend_attempts.md` or linked case note: human-readable attempt
  history and next-action guidance

Then rebuild:

```bash
python3 student/scripts/build_frontend_campaign_index.py
```

## Hard Constraints

- Follow `AGENTS.md`; append each prompt to `prompt_log.md`.
- Do not use the old ex280-special scripts.
- Do not claim success without official evaluation.
- Do not overwrite unrelated dirty work.
- Do not dump large logs/Verilog into chat; use summaries and paths.
- Do not repeat known low-value directions unchanged.
- Do not treat PPT descriptions as the only possible answer.
