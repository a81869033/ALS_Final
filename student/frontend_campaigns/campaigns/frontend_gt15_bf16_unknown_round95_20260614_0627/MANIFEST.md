# frontend_gt15_bf16_unknown_round95_20260614_0627

Run ID: `frontend_gt15_bf16_unknown_round95_20260614_0627`

Purpose: continue frontend-only search until BF16 cases and `ex286`/`ex287`
frontend ADP ratios are below `1.5x` reference. This round targets only the
remaining `>1.5x` frontend rows after round94.

Targets:

| case | frontend ADP | ref ADP | ratio | target ADP for <1.5x | need improvement |
| --- | ---: | ---: | ---: | ---: | ---: |
| ex204 | 24576 | 15180 | 1.618972 | 22769 | 1807 |
| ex205 | 71104 | 47128 | 1.508742 | 70691 | 413 |
| ex214 | 3707 | 2424 | 1.529290 | 3635 | 72 |
| ex216 | 5772 | 3357 | 1.719392 | 5035 | 737 |
| ex218 | 5941 | 3222 | 1.843886 | 4832 | 1109 |
| ex219 | 9212 | 5640 | 1.633333 | 8459 | 753 |
| ex286 | 20190 | 2376 | 8.497475 | 3563 | 16627 |
| ex287 | 27390 | 5782 | 4.737115 | 8672 | 18718 |

Rules:
- Frontend only. No backend portfolio, post-AIG remap, or backend seed usage.
- Official success requires repo `evaluate.py` equivalent with real
  Verilog/AIG/evaluate-log paths.
- Avoid method signatures marked `do_not_repeat_as_is` unless the high-level
  description, representation, sharing, or output grouping materially changes.
- Do not promote files into `student/seeds`.

Artifacts:
- `student/frontend_campaigns/campaigns/frontend_gt15_bf16_unknown_round95_20260614_0627/`
- `student/work/frontend_gt15_bf16_unknown_round95_20260614_0627/<agent_id>/<case>/`
- `student/runs/<domain>/frontend_gt15_bf16_unknown_round95_20260614_0627/<agent_id>/<case>/`

Status:
- Running.
