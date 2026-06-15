# frontend_gt15_deepstruct_round97_20260614_0724

Run ID: `frontend_gt15_deepstruct_round97_20260614_0724`

Purpose: continue frontend-only optimization for the remaining BF16 cases and
`ex286`/`ex287` whose best frontend ADP is still above `1.5x` reference after
round96. This round emphasizes deeper high-level description repair and
structural RTL/decision-graph searches rather than local source tweaks.

Targets:

| case | frontend A/D/ADP | ref ADP | ratio | target ADP for <1.5x | need improvement |
| --- | --- | ---: | ---: | ---: | ---: |
| ex204 | 1536/16/24576 | 15180 | 1.618972 | 22769 | 1807 |
| ex205 | 4444/16/71104 | 47128 | 1.508742 | 70691 | 413 |
| ex216 | 444/13/5772 | 3357 | 1.719392 | 5035 | 737 |
| ex218 | 457/13/5941 | 3222 | 1.843886 | 4832 | 1109 |
| ex219 | 658/14/9212 | 5640 | 1.633333 | 8459 | 753 |
| ex286 | 1346/15/20190 | 2376 | 8.497475 | 3563 | 16627 |
| ex287 | 1826/15/27390 | 5782 | 4.737115 | 8672 | 18718 |

Rules:
- Frontend only. No backend portfolio, post-AIG remap, or backend seed usage.
- Official success requires repo `evaluate.py` equivalent with real
  Verilog/AIG/evaluate-log paths.
- Use `student/frontend_campaigns/frontend_best_registry.csv` as the frontend
  source of truth.
- Do not use old ex280-specific search scripts.
- Avoid method signatures marked `do_not_repeat_as_is` unless the high-level
  description, representation, sharing, or output grouping materially changes.
- Do not promote files into `student/seeds`.

Artifacts:
- `student/frontend_campaigns/campaigns/frontend_gt15_deepstruct_round97_20260614_0724/`
- `student/work/frontend_gt15_deepstruct_round97_20260614_0724/<agent_id>/<case>/`
- `student/runs/<domain>/frontend_gt15_deepstruct_round97_20260614_0724/<agent_id>/<case>/`

Status:
- Completed. Pause after this batch per user request.
