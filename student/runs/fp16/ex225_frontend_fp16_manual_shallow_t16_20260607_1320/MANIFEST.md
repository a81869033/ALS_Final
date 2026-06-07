# ex225_frontend_fp16_manual_shallow_t16_20260607_1320

Stage: frontend threshold fallback check.

Scope: `ex225`.

Purpose:
- Test threshold `16` for the manual bit14 plus bitvec12/9 structure, forcing
  the two 20-run exponent groups into local tables.

Outcome:
- Exact but worse: `278520` ADP before synthflow.

Results:
- `student/runs/fp16/ex225_frontend_fp16_manual_shallow_t16_20260607_1320/results/candidates.csv`
- `student/runs/fp16/ex225_frontend_fp16_manual_shallow_t16_20260607_1320/results/best.csv`
