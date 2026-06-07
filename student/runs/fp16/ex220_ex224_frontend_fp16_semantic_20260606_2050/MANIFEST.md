# ex220_ex224_frontend_fp16_semantic_20260606_2050

Run ID: `ex220_ex224_frontend_fp16_semantic_20260606_2050`

Purpose: targeted FP16 ex220-ex224 semantic/structural frontend seed search.
This run used prior FP16 structural seeds as evidence, then tested a small
curated set of source-level rewrites for exp/log-family cases.

Inputs:
- Truth files: `benchmarks/ex220.truth` through `benchmarks/ex224.truth`
- Prior evidence: `student/runs/fp16/ex220_ex239_semantic_20260604/results/`
- Generator/script: `student/generators/fp16_ex220_ex224_frontend.py`

Artifacts:
- Work directory: `student/work/ex220_ex224_frontend_fp16_semantic_20260606_2050/`
- Candidates CSV: `student/runs/fp16/ex220_ex224_frontend_fp16_semantic_20260606_2050/results/candidates.csv`
- Best CSV: `student/runs/fp16/ex220_ex224_frontend_fp16_semantic_20260606_2050/results/best.csv`
- Summary CSV: `student/runs/fp16/ex220_ex224_frontend_fp16_semantic_20260606_2050/results/summary.csv`
- Metadata CSV: `student/runs/fp16/ex220_ex224_frontend_fp16_semantic_20260606_2050/results/metadata.csv`
- Official recheck CSV: `student/runs/fp16/ex220_ex224_frontend_fp16_semantic_20260606_2050/results/evaluate_check.csv`
- Best AIG copies: `student/work/ex220_ex224_frontend_fp16_semantic_20260606_2050/best/`

Methods tried:
- `ex220`/`ex221`/`ex222`: exp-family exponent/mantissa pair tables,
  positive-domain default tables, sign-exp-mant tables, and semantic
  exponent-delta field decomposition.
- `ex223`/`ex224`: log-family sign-exp-mant baseline, split sign/exp table,
  exp/mant pair table, positive-domain default table, semantic exponent-delta
  fields, hand-written negative/special shell, positive-only field split,
  positive base/delta kernel, mantissa-zero fastpath, and limited run-range
  compression.

Best result:
- See `results/best.csv`.
- `ex220`: `exp_mant_pair_case`, area/delay/ADP `10754/22/236588`.
- `ex221`: `exp_mant_pair_case`, area/delay/ADP `6974/22/153428`.
- `ex222`: `positive_default_exp_mant_case`, area/delay/ADP `10615/22/233530`.
- `ex223`: `sign_exp_mant_case`, area/delay/ADP `11164/23/256772`.
- `ex224`: `sign_exp_mant_case`, area/delay/ADP `6332/21/132972`.

Verification:
- Every candidate in `candidates.csv` has `verified_truth=1` and
  `equivalent=1`.
- `student/scripts/verify_variant_csv.py` ran `evaluate.py` over all 32
  equivalent candidates; `evaluate_check.csv` reports `official_eval_ok=32/32`.

Cleanup:
- The active work directory keeps only the 32 curated candidates, per-case
  manifests, logs for those candidates, and best AIG copies.
- Earlier broad-generator leftovers that were not listed in this run's CSV
  were moved to
  `student/archive/cleanup_20260606/ex220_ex224_fp16_curated_20260606_2050/extra_unlisted_work/`.

Notes:
- The real semantic hypotheses are confirmed at the function-family level:
  `exp`, `exp2`, `exp10`, `log`, and `log2`, with FP16 special handling
  visible in the truth tables.
- The new hand-written log/log2 special-shell and positive-kernel rewrites were
  exact but did not beat the existing sign-exp-mant structural source after
  Yosys AIG synthesis.
- The limited run-range compression direction should not be expanded for these
  log cases; it created long comparator chains and much worse ADP.
