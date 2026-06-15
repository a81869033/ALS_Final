# Task Assignments

Run ID: `ex200_ex299_frontend_refgap_round9_20260612_1855`

| Agent | Cases | Write scope | Notes |
| --- | --- | --- | --- |
| `routing-r9` | `ex285`, `ex286`, `ex287`, `ex288` | `student/work/ex200_ex299_frontend_refgap_round9_20260612_1855/routing-r9/<case>/`, `student/runs/unknown/ex200_ex299_frontend_refgap_round9_20260612_1855/routing-r9/<case>/`, `agent_shards/routing-r9/` | Avoid round8 bitset/symcof replays; need materially different compact routing descriptor or exact blocker. |
| `fp8-r9` | `ex240`, `ex244`, `ex246`, `ex247` | `student/work/ex200_ex299_frontend_refgap_round9_20260612_1855/fp8-r9/<case>/`, `student/runs/float_fp8/ex200_ex299_frontend_refgap_round9_20260612_1855/fp8-r9/<case>/`, `agent_shards/fp8-r9/` | Start from ex247 8349, avoid unchanged round8 synth-flow replays. |
| `state-r9` | `ex292`, `ex294`, `ex295`, `ex297`, `ex299` | `student/work/ex200_ex299_frontend_refgap_round9_20260612_1855/state-r9/<case>/`, `student/runs/unknown/ex200_ex299_frontend_refgap_round9_20260612_1855/state-r9/<case>/`, `agent_shards/state-r9/` | First repair round8 synthesis failures, then official evaluate.py. |
| `mixed-r9` | `ex223`, `ex225`, `ex200`, `ex204`, `ex205`, `ex266`, `ex270`, `ex274` | `student/work/ex200_ex299_frontend_refgap_round9_20260612_1855/mixed-r9/<case>/`, domain-specific `student/runs/<domain>/ex200_ex299_frontend_refgap_round9_20260612_1855/mixed-r9/<case>/`, `agent_shards/mixed-r9/` | Avoid round8 equivalent non-improving source/synth-flow replays. |
| `coordinator-fp8-gap` | `ex245`, `ex249` | `student/work/ex200_ex299_frontend_refgap_round9_20260612_1855/coordinator-fp8-gap/<case>/` | Coordinator-side synth-flow replay for unassigned high-gap FP8 cases. |
