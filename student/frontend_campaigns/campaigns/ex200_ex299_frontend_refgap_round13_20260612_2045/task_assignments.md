# Round13 Task Assignments

Run ID: `ex200_ex299_frontend_refgap_round13_20260612_2045`

Coordinator setup time: `2026-06-12 20:45 +0800`

Common requirements:
- Read `AGENTS.md`, `student/docs/experiment_run_workflow.md`, `student/frontend_campaigns/GOAL.md`, `introduction.md`, `student/frontend_campaigns/FRONTEND_PROGRESS.md`, `search_state.csv`, `frontend_best_registry.csv`, `current_frontend_gap.csv`, `method_judgments.csv`, `manual_judgments.csv`, `hypothesis_bank.csv`, assigned case indexes, and relevant case notes before candidates.
- Use only shard-scoped output paths under this run ID.
- Do not use the old ex280-special script.
- Do not update global registry/search state directly.
- Record all official `evaluate.py` rows and blockers in shard CSVs.

Assignments:

| Agent | Cases | Primary target |
| --- | --- | --- |
| `fp8-tight-r13` | `ex247`, `ex246`, `ex244`, `ex240`, `ex241`, `ex249` | Replace boundary/table replay with shared threshold, exponent-delta, and rounding predicate structures. |
| `fp-bf-r13` | `ex225`, `ex223`, `ex224`, `ex200`, `ex204`, `ex205` | Build semantic residual dossiers for high-gap FP16/BF16 unary cases without source-copy or nested-low replay. |
| `integer-delay-r13` | `ex260`, `ex266`, `ex276`, `ex256`, `ex261`, `ex270`, `ex277` | Reduce depth for arithmetic forms that already reduce area, using prefix/CSA/carry-save sharing. |
| `unknown-routing-r13` | `ex286`, `ex287`, `ex285`, `ex288`, `ex289` | Re-derive routing/normalizer semantics from invariants and test compact coordinate/assignment representations. |
| `unknown-state-r13` | `ex297`, `ex299`, `ex295`, `ex296`, `ex298`, `ex290`, `ex292`, `ex294` | Replace local-context residual replay with lower-delay state/cell/cofactor descriptors. |

Spawned agents:

| Agent | Runtime agent id | Nickname |
| --- | --- | --- |
| `fp8-tight-r13` | `019ebbe2-568c-77a2-bc0b-ffc66706fb78` | Volta |
| `fp-bf-r13` | `019ebbe2-5925-7720-80d1-3c6a66fb0502` | Kierkegaard |
| `integer-delay-r13` | `019ebbe2-5af8-7a00-bee9-24e34ef36d8c` | Planck |
| `unknown-routing-r13` | `019ebbe2-5bfb-72f2-a6e8-87e458263f54` | Fermat |
| `unknown-state-r13` | `019ebbe2-5ffd-7ac0-ba7e-a17a777ef578` | Nash |

Follow-up agents:

| Agent | Runtime agent id | Nickname |
| --- | --- | --- |
| `fp8-follow-r13` | `019ebc0d-20d0-73f1-bc55-cc217e1325fc` | Huygens |
| `fpbf-follow-r13` | `019ebc0d-21b7-75a2-9b49-b3c571e32804` | Maxwell |
| `integer-follow-r13` | `019ebc0d-2266-7133-9cef-7cf6c19ca719` | Halley |
| `unknown-follow-r13` | `019ebc0d-237d-7490-92ee-ccee38dbe740` | Bohr |
