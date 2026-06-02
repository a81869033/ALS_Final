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
- `culs_flow.probe_culs(culs_bin, timeout=10)`
- `mockturtle_flow.discover_runner()`
- `mockturtle_flow.mockturtle_candidate(case, parent, truth, work_dir, abc, runner=None, timeout=120, flow="resub_balance")`
- `esyn_flow.discover_paths()`
- `esyn_flow.tool_status(root=None)`
- `esyn_flow.esyn_expression_candidates(input_expr, work_dir, input_format="sexpr", root=None, timeout=360)`
- `esyn_flow.run_expression_smoke(work_dir, root=None, timeout=60)`
- `esyn_flow.esyn_seed_candidates_from_eqn(eqn_path, truth, abc, work_dir, case=None, parent_id=None, top_n=3, root=None, timeout=300, synth_timeout=60, eval_timeout=60, mode="per-output")`

CULS diagnostics:

```bash
python3 -m student.backends.culs_flow --probe
python3 -m student.backends.culs_flow --smoke-ex200 --work-dir /tmp/culs_smoke
```

`--probe` only checks that `gpuls` exists and can start. `--smoke-ex200` runs
`read; resyn2; write` on `baselines/abc_st/aigs/ex200.aig` and evaluates the
generated AIG. If `--probe` passes but `--smoke-ex200` segfaults or times out,
the wrapper reports CUDA/GPU runtime as unavailable instead of accepting a stale
or missing output file.

MockTurtle diagnostics:

```bash
python3 -m student.backends.mockturtle_flow --status
python3 -m student.backends.mockturtle_flow --smoke-ex200 --work-dir /tmp/mockturtle_smoke
```

The project runner is `student/tools/mockturtle/bin/mockturtle_aig_runner`.
It accepts AIGER input/output and supports `resub`, `balance`,
`resub_balance`, and `balance_resub` flows. Rebuild it with:

```bash
student/tools/mockturtle/build_mockturtle_runner.sh
```

E-Syn diagnostics:

```bash
python3 -m student.backends.esyn_flow --status
python3 -m student.backends.esyn_flow --smoke --work-dir /tmp/esyn_smoke
python3 -m student.backends.esyn_flow \
  --seed-smoke \
  --aig baselines/abc_st/aigs/ex200.aig \
  --truth benchmarks/ex200.truth \
  --abc student/abc \
  --work-dir /tmp/esyn_seed_smoke \
  --top-n 3 \
  --max-outputs 1
```

E-Syn is usable for expression-in/expression-out Boolean rewriting. The staged
binary contract is:

1. input S-expression file using E-Syn operators `*`, `+`, `!`, and `&`
2. `e-rewriter <input-sexpr-file> <unused-output-file>`
3. working directory must contain `out_dot/`, `graph_info/`,
   `test_data_beta_runner/`, and `graph_info.py`
4. outputs are written as `test_data_beta_runner/output_from_egg*.txt`

The wrapper runs E-Syn with `student/tools/conda-env/bin` prepended to `PATH`
because `graph_info.py` needs `networkx` and `pydot`.

E-Syn seed candidate generation now has a conservative EQN entry point. It
depends on `student.backends.esyn_eqn` for EQN read/write and output
S-expression conversion. If that module is unavailable, the library raises
`EsynContractError` and `--seed-smoke` reports `seed_smoke: unavailable`
without a traceback.

The first seed mode is `per-output`: for each output, run E-Syn on that output
expression, take the first `top_n` unique rewrites, write a new EQN with exactly
one output replaced, synthesize it to AIG with ABC, deduplicate by AIG hash, and
evaluate with `evaluate_aig()`. Whole-vector replacement is still disabled to
avoid combinatorial explosion.

Required parser contract:

`AIG/Verilog-synthesized AIG -> EQN -> stable PI/PO mapping -> output S-expression -> E-Syn rewrite ->
single-output EQN replacement -> ABC AIG synthesis -> evaluate.py CEC`.
