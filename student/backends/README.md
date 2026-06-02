# Backends

Backend candidate transformers live here:

- ABC and ABC9 wrappers
- MockTurtle wrappers
- CULS wrappers
- E-Syn seed-generation wrappers
- budgeted hybrid flow definitions

Implemented Stage 1 entry points:

- `abc9_flow.abc9_candidate(case, parent, truth, work_dir, abc, timeout=60)`
- `culs_flow.culs_resyn2_candidate(case, parent, truth, work_dir, culs_bin, abc, timeout=120)`
- `mockturtle_flow.discover_runner()`
- `esyn_flow.discover_paths()`

MockTurtle and E-Syn currently expose discovery/skeleton code only. They raise
`NotImplementedError` until a project-specific AIG-in/AIG-out runner or full
AIG/EQN conversion flow is defined.
