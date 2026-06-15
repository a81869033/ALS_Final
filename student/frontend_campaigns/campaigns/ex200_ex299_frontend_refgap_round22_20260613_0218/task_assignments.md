# Task Assignments: ex200_ex299_frontend_refgap_round22_20260613_0218

| agent_id | agent_path | cases | status |
| --- | --- | --- | --- |
| fp16-r22 | 019ebd12-769e-77c0-8ad7-ff2438315445 | ex223, ex224, ex225 | completed; blocker shard merged |
| bf16-r22 | 019ebd12-7883-7d62-a25c-1ff8936c59b4 | ex200, ex204, ex205, ex218 | completed; candidate/blocker shard merged |
| float-fp8-r22 | 019ebd12-7a3c-7a82-aff7-6fbad174dbe9 | ex244, ex246, ex247 | completed partial; candidate/tie shard merged |
| float-fp8-remain-r22 | 019ebd35-e63b-70d2-8bf9-b5d2f905f8b4 | ex240, ex241, ex242, ex245, ex248, ex249, ex253 | completed; blocker shard merged |
| integer-r22 | 019ebd12-7cb0-7b61-8d03-f79f557399ca | ex256, ex260, ex261, ex266, ex270, ex276, ex277 | completed; candidate/blocker shard merged |
| unknown-a-r22 | 019ebd12-7e6a-7771-ae0d-47cf493cab1c | ex280, ex281, ex282, ex283, ex284, ex285, ex286, ex287, ex288, ex289 | completed; blocker shard merged |
| unknown-b-r22 | 019ebd12-82cb-7220-8582-75462e1b00e7 | ex290, ex291, ex292, ex294, ex295, ex296, ex297, ex298, ex299 | completed; blocker shard merged |

Coordinator focus:
- Worst gaps first: `ex286`, `ex287`, `ex247`, `ex246`, `ex297`, `ex299`, `ex285`, `ex244`, `ex240`, `ex245`, `ex241`, `ex242`.
- Per-agent case lists are disjoint.
- Output paths must be scoped by `<run_id>/<agent_id>/<case>/`.
