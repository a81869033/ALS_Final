# ex200-ex219 BF16 Current

Run ID: `ex200_ex219_current`

Purpose: current merged BF16 frontend Verilog candidate set and best-result
lookup for `ex200`-`ex219`.

Inputs:

- Latest curated BF16 frontend runs:
  - `ex200_frontend_bf16_semantic_20260605_0748`
  - `ex201_ex204_frontend_semantic_continue_20260605_1732`
  - `ex205_ex209_frontend_bf16_semantic_20260606_0946`
  - `ex210_ex214_frontend_bf16_semantic_20260606_1315`
  - `ex215_ex219_frontend_bf16_deep2_20260606_1726`

Artifacts:

- Best CSV: `student/runs/bf16/ex200_ex219_current/results/best.csv`
- Candidates CSV: `student/runs/bf16/ex200_ex219_current/results/candidates.csv`
- Summary CSV: `student/runs/bf16/ex200_ex219_current/results/summary.csv`
- Human progress summary: `student/cases/ex200_ex219_bf16/CURRENT_PROGRESS.md`
- Git-tracked current best seeds:
  `student/seeds/bf16/ex200_ex219_current/`

Main current work directories:

- `student/work/ex200_frontend_bf16_semantic_20260605_0748/`
- `student/work/ex201_ex204_frontend_semantic_continue_20260605_1732/`
- `student/work/ex205_ex209_frontend_bf16_semantic_20260606_0946/`
- `student/work/ex210_ex214_frontend_bf16_semantic_20260606_1315/`
- `student/work/ex215_ex219_frontend_bf16_deep2_20260606_1726/`

Notes:

- This is a merged registry run, not a new synthesis run.
- `best.csv` contains one current best row per BF16 case and points to the
  git-tracked seed bundle.
- `candidates.csv` contains curated verified candidates from the latest active
  BF16 frontend runs.  Non-best rows may still point to local ignored
  `student/work/` artifacts.
- Earlier broad-search and low-value intermediate work remains under
  `student/archive/` and older run manifests for traceability.
