# Project Structure Cleanup 2026-06-10

Purpose: record the project-structure audit and the conservative cleanup rules
used while another session was actively editing unknown `ex280`-`ex299`.

## Findings

- `student/scripts/` contains launchers, diagnostics, collectors, curators,
  verifiers, and synthflow helpers. Outside the active unknown work, no file had
  a clear primary ownership as a Verilog candidate generator.
- `student/generators/` contains benchmark-specific candidate emitters. No
  non-generator Python file was identified there during the audit.
- `student/work/` is the largest generated-artifact tree and contains many old
  pre-workflow `reverse_*` directories. These should not be moved until all
  references in run manifests, seed CSVs, and `student/runs/index.md` are
  updated.
- `student/results/` should stay focused on active high-value CSVs. Logs and
  old round-specific CSVs should be archived only after reference checks.
- `student/runs/index.md` is useful but incomplete relative to all manifest
  directories. Regenerating or auditing it should be a separate focused task.

## Actions In This Pass

- Clarified directory ownership in `student/README.md`,
  `student/scripts/README.md`, `student/generators/README.md`, and
  `student/docs/experiment_run_workflow.md`.
- Initially left active unknown/ex280-ex299 paths untouched. After the unknown
  run finished, moved unknown candidate-emitting diagnostic/probe tools from
  `student/scripts/` to `student/generators/` and updated manifest/script path
  references.
- Moved non-unknown logs from `student/results/logs/` into
  `student/archive/cleanup_20260610/results_logs/`.
- Left root-level integer result CSVs in place because existing historical rows
  and old work directories still reference them.

## Unknown Cleanup Status

The unknown `ex280`-`ex299` session has finished.  Candidate-emitting unknown
tools now live in `student/generators/`; pure diagnostics and launch/curation
helpers remain in `student/scripts/`.

Verification after the move:

- 67 unknown generator scripts parsed successfully without writing pycache.
- References to the moved `student/scripts/unknown_*.py` paths were updated;
  no stale references to moved script paths were found in unknown runs,
  generators, scripts, docs, or case notes.
- Generated `__pycache__` from the syntax check was removed.

Still be conservative with unknown outputs unless intentionally curating that
completed class:

- Keep run records under `student/runs/unknown/`.
- Keep bulky generated artifacts under `student/work/ex28*`,
  `student/work/ex29*`, `student/work/reverse_unknown*`, or archive.
- Keep curated unknown backend-start candidates under `student/seeds/unknown/`.
- Leave unknown root result CSVs in `student/results/` until the next explicit
  result-CSV cleanup pass.

## Classification Rule

- `student/generators/`: primary candidate Verilog/RTL emitters.
- `student/scripts/`: launch, diagnose, collect, verify, curate, dossier, and
  synthflow utilities.
- `student/frontends/`: shared truth/equivalence/synthesis APIs used by both.

## Safe Follow-Up Queue

- Add or regenerate missing non-unknown run manifests before moving old work
  directories.
- Audit `student/runs/index.md` from existing manifests, preserving historical
  rows that point to archive-only runs.
- Keep `student/results/logs/` free of new non-unknown logs; place future
  run-level logs under `student/work/<run_id>/.../logs/` or archive them.
- Consider archiving stale root-level integer result CSVs only after all
  manifests and seed bundles point at curated integer run/seed CSVs.
