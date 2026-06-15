# Round11 Task Assignments

Run ID: `ex200_ex299_frontend_refgap_round11_20260612_1944`

| agent_id | cases | focus | status |
|---|---|---|---|
| `routing-r11` (`019ebba8-2bb6-7240-bef0-4b336ce1216a`, Kepler) | `ex286`, `ex287` | nonlinear hidden-state basis or constructive pair-count generator; no wrapper repeats | running |
| `state-r11` (`019ebba8-2cdc-78a3-a538-819aa0769040`, Pauli) | `ex295`, `ex297`, `ex299` | exploit symbol-plane split into lower-delay state/cell recurrence or compressed descriptor | running |
| `fp8-r11` (`019ebba8-2d54-7fa3-9bd7-b5cb9068114d`, Bernoulli) | `ex244`, `ex246`, `ex247`, `ex240` | beat close FP8 boundary-region rows, especially `ex247` current `8349` | running |
| `mixed-r11` (`019ebba8-2dff-7900-8bbb-549b8eeac6cf`, Ohm) | `ex225`, `ex223`, `ex204`, `ex260` | near-miss FP16/BF16/integer residual and sharing only | running |
| `fp8-extra-r11` (`019ebbaf-1c0a-7cd2-beb3-25c101ed02f9`, Schrodinger) | `ex241`, `ex249`, `ex245`, `ex242` | non-overlapping FP8 high-gap cases with shared decode/rounding focus | running |
| `integer-extra-r11` (`019ebbaf-1d71-74a3-9cbe-eaf4c3f3115e`, Franklin) | `ex266`, `ex256`, `ex276`, `ex277` | non-overlapping integer divider/mul/sqrt high-gap cases | running |

All agents must write only under scoped paths:
- `student/work/ex200_ex299_frontend_refgap_round11_20260612_1944/<agent_id>/<case>/`
- `student/runs/<domain>/ex200_ex299_frontend_refgap_round11_20260612_1944/<agent_id>/<case>/`
- `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round11_20260612_1944/agent_shards/<agent_id>/`
- `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round11_20260612_1944/agent_summaries/<agent_id>.md`
