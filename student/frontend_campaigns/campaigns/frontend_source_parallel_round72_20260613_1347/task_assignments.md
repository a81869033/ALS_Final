# frontend_source_parallel_round72_20260613_1347 Task Assignments

All shard work is frontend/source-only. Do not run backend portfolios or standalone AIG optimization. Official equivalence/QoR claims require repo `evaluate.py`.

## sub-fp8-worst-micro-r72

Tool agent: `019ebf88-a1f4-74f3-9d92-0d0c1c4139bf` (`Dirac`)

Cases: `ex244`, `ex246`, `ex247`, `ex249`

Focus:
- Avoid r64-r71 classifier, codearith, formula, microcode, descriptor, direct cancellation, interval, copy-preserve, explicit-sat/product-zero/lowpat/raw-exp, keycase/bit-predicate residual, lexcmp/maxmin, local product, delta8 compare, and expdiff gap predicate signatures as-is.
- Try micro rewrites that are smaller than round71: single output-cone replacement, comparator polarity sharing, one carry/normalize predicate, or small mux factoring over current source.

## sub-fp8-mid-micro-r72

Tool agent: `019ebf88-a368-7692-9b98-e96c42fde745` (`Anscombe`)

Cases: `ex240`, `ex241`, `ex245`

Focus:
- `ex242` is excluded at launch because latest gap ratio is below 1.5.
- Avoid r67-r71 descriptor/output-cluster/formula/selected low-bit overlay/copy-preserve/cofactor/residual/outputsplit/caseattrs families as-is.
- Try single-bit or two-bit local replacements only if source stays near current size: shared sign/exp decode, one guard/round predicate, or exact output cone replacement.

## sub-unknown-micro-r72

Tool agent: `019ebf88-a445-7b93-9464-e221b9cb01e0` (`Ampere`)

Cases: `ex285`, `ex288`, `ex297`, `ex299`

Focus:
- Avoid local-rule/treefact/symcof/key-BDD replay, r66 cube-default as-is, r68 phase/selected-cell, r69 copy/output-plane hybrid, r70 cube residual/bitmix/shared-cmp, and r71 onehot-boundary or `sel==0` identity-bypass wrapper as-is.
- For `ex297`/`ex299`, extend the successful idea only with materially different selector cells: alternate selector constants, output-cell subsets, or shared predicate polarity changes, always bounded and source-only.
- For `ex285`/`ex288`, use tiny local bypass or boundary predicates only if they can beat current area/delay; avoid source-size expansion.

## sub-fp16-int-micro-r72

Tool agent: `019ebf88-a653-7170-bf44-63aaf19149c9` (`Linnaeus`)

Cases: `ex223`, `ex225`, `ex260`, `ex266`

Focus:
- Avoid low13/low14/low11 nested/sparse/compact-special FP16 rows, Baugh-Wooley carry-select, signed weighted rows, cofactor-wordmux, one-hot quotient interval, case-constant, const-divisor, wordpatch/highpred, Booth, abs-quadrant, subtract-prefix, binary-threshold, currentbase small-special/signbit formula, high-BDD, and top-compare signatures as-is.
- Try very small local source replacements: one FP16 special predicate, one sign/exponent output cone, one integer carry/correction predicate, or one quotient bit predicate. Stop immediately if QoR is worse by more than 50 percent.

## Required Inputs Before Code

Every worker must read:
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
- assigned `student/frontend_campaigns/case_index/exNNN.md`
- relevant case notes under `student/cases/`

## Shard Deliverables

Each shard must write:
- `student/frontend_campaigns/campaigns/frontend_source_parallel_round72_20260613_1347/agent_shards/<agent_id>/candidates.csv`
- `best_improvements.csv`
- `failed_hypotheses.csv`
- `simulation_results.csv`
- `evaluation_results.csv`
- `shared_structure_report.csv`
- `student/frontend_campaigns/campaigns/frontend_source_parallel_round72_20260613_1347/agent_summaries/<agent_id>.md`

Each per-case output must be scoped under:
- `student/work/frontend_source_parallel_round72_20260613_1347/<agent_id>/<case>/`
- `student/runs/<domain>/frontend_source_parallel_round72_20260613_1347/<agent_id>/<case>/`

Subagents must not edit `prompt_log.md`, global registry/state/manual/hypothesis CSVs, `student/results`, or seed bundles. Put proposed global updates in shard CSVs/summaries.
