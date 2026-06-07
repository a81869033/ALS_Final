# ex225_frontend_fp16_packed_shallow_20260607_1325

Stage: frontend packed-table check.

Scope: `ex225`.

Purpose:
- Replace the 16-bit table output with a packed table containing only
  non-overridden bits.

Outcome:
- Exact but worse: `269077` ADP before synthflow.  Manual packing appears to
  break useful sharing from the original procedural table.

Results:
- `student/runs/fp16/ex225_frontend_fp16_packed_shallow_20260607_1325/results/candidates.csv`
- `student/runs/fp16/ex225_frontend_fp16_packed_shallow_20260607_1325/results/best.csv`
