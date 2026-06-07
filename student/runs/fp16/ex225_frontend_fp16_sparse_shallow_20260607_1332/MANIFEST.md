# ex225_frontend_fp16_sparse_shallow_20260607_1332

Stage: frontend sparse-decoder check.

Scope: `ex225`.

Purpose:
- Hand-compress the bitvec12/9 sign-exp decoder by using default `2'b11` and
  listing only non-default constants and range groups.

Outcome:
- Exact but worse: `278064` ADP before synthflow.

Results:
- `student/runs/fp16/ex225_frontend_fp16_sparse_shallow_20260607_1332/results/candidates.csv`
- `student/runs/fp16/ex225_frontend_fp16_sparse_shallow_20260607_1332/results/best.csv`
