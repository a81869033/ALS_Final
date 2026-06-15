# Round10 Task Assignments

Run ID: `ex200_ex299_frontend_refgap_round10_20260612_1911`

All agents must write only under paths scoped by:

- `student/work/ex200_ex299_frontend_refgap_round10_20260612_1911/<agent_id>/<case>/`
- `student/runs/<domain>/ex200_ex299_frontend_refgap_round10_20260612_1911/<agent_id>/<case>/`
- `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round10_20260612_1911/agent_shards/<agent_id>/`

Assignments:

| agent_id | cases | focus | status |
|---|---|---|---|
| `unknown-top-r10` (`019ebb8a-b50c-77c1-be64-747561b84b9b`, Carson) | `ex286`, `ex287`, `ex285`, `ex288`, `ex289` | routing/normalizer class descriptors; move beyond lossy pair count by exact subfield/cofactor sharing | running |
| `unknown-state-r10` (`019ebb8a-b60f-70a1-bfd7-527faadd001d`, Euclid) | `ex295`, `ex296`, `ex297`, `ex298`, `ex299`, `ex290`, `ex292`, `ex294` | cyclic 2-bit-symbol/cell state descriptors, anchor deltas, open-boundary variants | running |
| `fp8-r10` (`019ebb8a-b6fa-79e3-8428-ce0b439098e9`, Anscombe) | `ex240`, `ex241`, `ex242`, `ex244`, `ex245`, `ex246`, `ex247`, `ex248`, `ex249`, `ex253` | FP8 conversion boundary-region muxes and shared decode, avoiding do-not-repeat synth-flow replays | running |
| `mixed-r10` (`019ebb8a-b79d-7c83-ba25-ee220d82cb4c`, Hubble) | `ex223`, `ex224`, `ex225`, `ex200`, `ex204`, `ex205`, `ex256`, `ex260`, `ex261`, `ex266`, `ex270`, `ex276`, `ex277` | FP16/BF16 residual structures and integer shared arithmetic/control RTL | running |
| `unknown-gf-r10` (`019ebb92-0cd5-7dc1-9f85-d317484fa1b7`, Galileo) | `ex280`, `ex281`, `ex282`, `ex283`, `ex284`, `ex291` | GF(2)/event-filter and lower-gap state cases; search only if materially different from old ex280-special scripts | running |
| `coordinator` | `ex286`, `ex287` | targeted local diagnostic/probe if subagents are still running | active |

Merge checklist:
- Verify official `evaluate.py` rows before accepting improvements.
- Check duplicate `(case, method_signature)`.
- Check success rows have existing Verilog, AIG, and log paths.
- Update registry/search state only for official frontend best improvements.
- Re-run `python3 student/scripts/build_frontend_campaign_index.py`.
