# Experiment Run Workflow

This is the canonical workflow for benchmark reverse-engineering and backend
optimization runs. Future AI sessions should follow this layout so generated
Verilog, AIG, logs, and CSV results remain traceable.

## Directory Roles

Use these directories consistently:

- `student/runs/`: human-facing registry. Start here when looking for a past
  run.
- `student/work/`: large generated artifacts such as Verilog, AIG, logs, and
  per-case manifests.
- `student/results/`: active high-value CSV files only, such as current merged
  candidates, current best files, and baseline summaries.
- `student/archive/`: old round-specific or intermediate files that should not
  clutter active directories but should not be deleted.
- `student/seeds/`: small git-tracked Verilog/AIG bundles for current best or
  otherwise high-value seeds that should be available from a fresh clone.
- `student/cases/`: case-by-case notes, especially failed hypotheses and
  things that should not be repeated blindly.
- `student/scripts/`: runnable launchers, search scripts, and collection tools.
- `student/generators/`: candidate Verilog generation code.
- `student/frontends/`: truth parsing, simulation/equivalence, Yosys synth, and
  reverse-engineering helpers.
- `student/backends/`: ABC, ABC9, MockTurtle, CULS, and E-Syn wrappers.
- `student/tools/`: installed third-party tools. Do not manually clean this
  unless the user explicitly asks.

## Scripts vs. Generators

Use this rule when organizing helper code:

- Put code in `student/generators/` when its primary purpose is to emit
  benchmark-specific candidate Verilog/RTL seeds. It may also synthesize,
  evaluate, and write run CSVs as part of the generation flow.
- Put code in `student/scripts/` when it launches runs, diagnoses truth
  structure, collects results, verifies CSVs, curates seed bundles, writes
  dossiers, or resynthesizes already-existing Verilog/AIG seeds.
- Put reusable truth parsing, simulation/equivalence, Yosys wrappers, and
  shared frontend APIs in `student/frontends/`.

When another session is actively working on a benchmark family, do not
reorganize that family's dirty files, generated work trees, seed bundles, or
shared CSV/index rows until that session finishes or the user explicitly asks.

## Run Naming

Every new experiment run must have a stable run ID:

```text
<cases>_<stage>_<method>_<YYYYMMDD_HHMM>
```

Examples:

```text
ex280_frontend_bdd_20260605_1430
ex280_ex299_frontend_algebraic_20260605_1510
ex200_ex219_frontend_bf16_semantic_20260605_1600
ex280_backend_abc9_deepsyn_20260605_1700
```

The `stage` should usually be one of:

- `frontend`: truth table to Verilog/AIG seed generation.
- `backend`: optimization of an existing AIG/Verilog seed.
- `baseline`: fixed reference flow.
- `collect`: result aggregation or manifest collection.

## Required Run Layout

For each run, create both a work directory and a registry directory:

```text
student/work/<run_id>/
  exNNN/
    verilog/
    aigs/
    logs/
    manifest.json

student/runs/<domain>/<run_id>/
  MANIFEST.md
  results/
    candidates.csv
    best.csv
    summary.csv
    history.csv
```

`<domain>` should be one of:

- `baseline`
- `bf16`
- `fp16`
- `integer`
- `unknown`
- another clear benchmark family if a new category appears

Do not place generated Verilog directly in `student/results/` or `output/`.
`output/` is only for final submission artifacts.

## Frontend Verilog Runs

A frontend run searches for truth-table-equivalent Verilog seeds. It may use
semantic RTL, structural factoring, BDDs, ANF/Davio, case splitting, or other
methods.

Expected artifacts:

```text
student/work/<run_id>/exNNN/verilog/*.v
student/work/<run_id>/exNNN/aigs/*.aig
student/work/<run_id>/exNNN/logs/*.log
student/work/<run_id>/exNNN/manifest.json
student/runs/<domain>/<run_id>/MANIFEST.md
student/runs/<domain>/<run_id>/results/candidates.csv
student/runs/<domain>/<run_id>/results/best.csv
student/runs/<domain>/<run_id>/results/summary.csv
```

`candidates.csv` should include every verified candidate. Required columns:

```text
case,candidate_id,hypothesis,variant,verilog_path,aig_path,verified_truth,equivalent,area,delay,adp,notes
```

Some existing frontend CSVs use `hypothesis/function_guess` instead of
`hypothesis`.  Treat this as an accepted alias when collecting or reviewing
existing runs; new scripts may keep either spelling as long as manifests and
summaries are clear.

The `verilog_path` and `aig_path` must point to real files after the run is
finished. If files are moved into `archive/`, update the CSV or leave a
manifest note with the new location.

`best.csv` should contain one row per case with the current best candidate from
that run.

`summary.csv` should compare current best ADP against `reference_result.csv`
when possible.

## Backend Optimization Runs

A backend run starts from one or more verified seeds and applies ABC, ABC9,
MockTurtle, CULS, E-Syn, or hybrid tool chains.

Expected artifacts:

```text
student/work/<run_id>/exNNN/round_*/...
student/runs/<domain>/<run_id>/MANIFEST.md
student/runs/<domain>/<run_id>/results/history.csv
student/runs/<domain>/<run_id>/results/best.csv
student/work/best/<run_id>.aig
```

`history.csv` records all generated backend candidates. Required columns:

```text
case,candidate_id,parent_id,source,tool_chain,aig_path,area,delay,adp,equivalent,runtime_sec,notes
```

`best.csv` records the best result from the backend run.

If a backend run produces a new best result worth keeping, preserve a stable
copy under `student/work/best/`.

## Git-Tracked Seed Bundles

`student/work/` may contain large generated trees and can be ignored by git.
Do not create `student/seeds/<domain>/..._current` bundles for a partial batch
while the larger benchmark class is still incomplete.  During per-batch
frontend exploration, keep verified candidates in `student/runs/<domain>/...`
and bulky artifacts in `student/work/...`.  Copy curated files into
`student/seeds/` only after the whole class is complete, or when the user
explicitly asks for seed-bundle curation.

When a completed class has current best Verilog/AIG files that future sessions
should be able to use from a fresh clone, copy only those curated files into:

```text
student/seeds/<domain>/<run_id>/
  MANIFEST.md
  exNNN/
    verilog/
    aigs/
```

The matching `best.csv` should point to `student/seeds/...` paths.  Full
candidate pools can remain in `student/work/` or `student/archive/` when they
are too large or low-value to track directly.

## MANIFEST.md Requirements

Every run must have a human-readable manifest:

```markdown
# <Run ID>

Run ID: `<run_id>`

Purpose: <what this run tried>

Inputs:
- Truth files:
- Seed Verilog/AIG:
- Generator/script:

Artifacts:
- Work directory:
- Candidates/history CSV:
- Best CSV:
- Best AIG/Verilog:

Methods tried:
- ...

Best result:
- case:
- candidate_id:
- area:
- delay:
- ADP:
- equivalent:

Notes:
- Known limitations, failed hypotheses, timeout behavior, or follow-up work.
```

For multi-case runs, the best result can point to `best.csv` instead of listing
every case manually.

## Result Cleanup Rules

Keep `student/results/` small and current:

- Keep current merged CSVs.
- Keep current best CSVs.
- Keep baseline summaries.
- Do not keep every round-specific CSV there.

After a long run:

1. Copy or move durable result CSVs into
   `student/runs/<domain>/<run_id>/results/`.
2. Add or update `MANIFEST.md`.
3. Add the run to `student/runs/index.md`.
4. Move round-specific intermediate CSVs and stale work directories into
   `student/archive/<cleanup_or_run_name>/`.
5. Preserve current best AIGs under `student/work/best/` only when they are
   useful as future seeds or references.
6. Remove project-code `__pycache__` directories, but do not clean
   `student/tools/` unless asked.

## Where To Look First

When another session needs previous work:

1. Read `student/runs/index.md`.
2. Open the matching `student/runs/<domain>/<run_id>/MANIFEST.md`.
3. Use `results/best.csv` to find best candidates.
4. Use `results/candidates.csv` or `history.csv` for all candidates.
5. Use `student/cases/<group>/exNNN/frontend_attempts.md` before repeating a
   case-specific search.

## Current Important Entrypoints

- `student/runs/index.md`: table of current known runs.
- `student/runs/RUN_NAMING.md`: compact naming rules.
- `student/cases/ex280_ex299_unknown/`: case notes for ex280-ex299.
- `student/work/best/`: preserved best AIGs for future seeds.
- `student/archive/cleanup_20260605/`: archived ex280 backend intermediate
  rounds from the 20260605 cleanup.
