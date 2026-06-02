# Tool Status

This file records tool availability and setup decisions for the local machine.

## Host Check

- System `python3`: 3.6.8.
- Conda `python`: 3.13.12 before creating the project tool env.
- System `abc`, `yosys`, `iverilog`, `cargo`, `nvcc`: not found.
- CUDA modulefiles are not available through `module load cuda/...` on this host.
- `cmake`: 3.26.5.
- `gcc` / `g++`: 8.5.0.
- `make`, `git`: found.

## Installed / Staged Tools

### ABC / ABC9

- Original `student/abc` did not run on this machine because it required newer GLIBC/GLIBCXX and `libreadline.so.8`.
- Built Berkeley ABC locally under `student/tools/abc/src` with:

```bash
make ABC_USE_NO_READLINE=1 -j8
```

- Replaced top-level `student/abc` with the compatible build.
- Saved the original incompatible binary as `student/tools/abc/original_abc_incompatible`.
- Verified:

```bash
./student/abc -c 'read_truth -xf benchmarks/ex200.truth; st; write_aiger -s /tmp/ex200_from_abc.aig; ps'
python3 student/optimizer.py --case ex200
python3 evaluate.py --case ex200
```

`evaluate.py --case ex200` reports `OK`, area `18311`, delay `36`, ADP `659196`.

ABC9 commands are available inside the same ABC binary and should be wrapped later as backend flows.

### Project Conda Tool Environment

Created a local environment at:

```text
student/tools/conda-env
```

Installed:

- Python 3.10.20
- Yosys 0.65
- Rust/Cargo 1.96.0
- CUDA `nvcc` 12.5.82 plus CUDA runtime/development libraries
- Python packages needed by E-Syn smoke tests: `sympy`, `z3-solver`, `pyyaml`, `tqdm`, `ply`, `networkx`, `pydot<4`

Use tools through explicit paths or prepend the env to `PATH`:

```bash
PATH=/home/b10507053/ALS_Final_Project/student/tools/conda-env/bin:$PATH
```

Verified:

```bash
student/tools/conda-env/bin/yosys -V
student/tools/conda-env/bin/cargo --version
student/tools/conda-env/bin/nvcc --version
student/tools/conda-env/bin/python -c 'import sympy, z3, yaml, tqdm, ply, networkx, pydot'
```

### MockTurtle

- Cloned `https://github.com/lsils/mockturtle` into `student/tools/mockturtle/src`.
- Configured and built examples in `student/tools/mockturtle/build`:

```bash
cmake -S student/tools/mockturtle/src -B student/tools/mockturtle/build -DMOCKTURTLE_BUILD_EXAMPLES=ON -DMOCKTURTLE_BUILD_TESTS=OFF -DMOCKTURTLE_BUILD_EXPERIMENTS=OFF
cmake --build student/tools/mockturtle/build --parallel 4
```

- Verified by running the built `cut_enumeration` example from the source example directory.
- Added a project AIG-in/AIG-out runner:

```text
student/tools/mockturtle/mockturtle_aig_runner.cpp
student/tools/mockturtle/build_mockturtle_runner.sh
student/tools/mockturtle/bin/mockturtle_aig_runner
```

The runner supports `resub`, `balance`, `resub_balance`, and `balance_resub`.
Rebuild it with:

```bash
student/tools/mockturtle/build_mockturtle_runner.sh
```

Verified:

```bash
python3 -m student.backends.mockturtle_flow --status
python3 -m student.backends.mockturtle_flow \
  --smoke-ex200 \
  --work-dir /tmp/mockturtle_cli_smoke \
  --flow resub_balance \
  --timeout 120
```

`--smoke-ex200` reports `equivalent=1`, area `13482`, delay `25`,
ADP `337050` for `mockturtle_resub_balance`.

### E-Syn

- Cloned `https://github.com/Gy-Hu/E-Syn` branch `new` into `student/tools/esyn/src`.
- Built these Rust components with the local conda Rust/Cargo:
  - `s-converter`
  - `e-rewriter`
  - `alpha_utils/circuitparser`
  - `alpha_utils/infix2lisp`
  - `alpha_utils/lisp2infix`
- Linked E-Syn's expected `abc/abc` path to the compatible `student/abc`.

Local compatibility patches applied inside `student/tools/esyn/src/e-rewriter`:

- Removed the old `xgboost` Rust crate because its native binding generation fails with the current Rust/clang combination.
- Replaced the XGBoost-based candidate score with a simple local heuristic using expression size/depth/operator counts.
- Removed the unused `egg` `lp` feature to avoid requiring the missing native `CbcSolver` library.

Verified E-Syn wrapper:

```bash
python3 -m student.backends.esyn_flow --status
python3 -m student.backends.esyn_flow --smoke --work-dir /tmp/esyn_wrapper_smoke --timeout 60
python3 -m student.backends.esyn_flow \
  --rewrite '(* a (+ b (! b)))' \
  --format sexpr \
  --work-dir /tmp/esyn_wrapper_rewrite \
  --timeout 60
```

`--smoke` completes on `(a * b)` and produces 30
`test_data_beta_runner/output_from_egg*.txt` expression candidates.
The rewrite test simplifies `(* a (+ b (! b)))` to first candidate `a`.

E-Syn is now usable as an expression-level rewriting stage. The backend wrapper
also exposes a first EQN seed generator:

```bash
python3 -m student.backends.esyn_flow \
  --seed-smoke \
  --aig baselines/abc_st/aigs/ex200.aig \
  --truth benchmarks/ex200.truth \
  --abc student/abc \
  --work-dir /tmp/esyn_seed_smoke \
  --top-n 3 \
  --max-outputs 1
```

`student.backends.esyn_flow.esyn_seed_candidates_from_eqn(...)` depends on a
separate `student.backends.esyn_eqn` module for EQN read/write and output
S-expression conversion. When that parser module is unavailable, `--seed-smoke`
reports `seed_smoke: unavailable` without a traceback. The implemented safe
mode is per-output single replacement: run E-Syn on one output expression, take
the first top-N unique rewrites, synthesize each one-output replacement to AIG
with ABC, deduplicate by AIG hash, then call `evaluate_aig()`. Whole-vector
replacement remains disabled until the parser/reconstruction contract is
verified.

### CULS

- Cloned `https://github.com/cuhk-eda/CULS` into `student/tools/culs/src`.
- Initialized its ABC submodule.
- System `nvcc` and CUDA modulefiles are not available, so CUDA 12.5 `nvcc` was installed in the local conda tool environment.
- Configured and built standalone CULS:

```bash
PATH=/home/b10507053/ALS_Final_Project/student/tools/conda-env/bin:$PATH \
CUDAToolkit_ROOT=/home/b10507053/ALS_Final_Project/student/tools/conda-env \
cmake -S student/tools/culs/src -B student/tools/culs/build \
  -DCMAKE_CUDA_COMPILER=/home/b10507053/ALS_Final_Project/student/tools/conda-env/bin/nvcc

cmake --build student/tools/culs/build --parallel 4
```

- Built binary:

```text
student/tools/culs/build/gpuls
```

- Verified outside the filesystem sandbox, where CUDA devices are visible:

```bash
student/tools/culs/build/gpuls \
  -c "read baselines/abc_st/aigs/ex200.aig; ps; resyn2; ps; write /tmp/culs_stage1_ex200_host.aig"

install -D /tmp/culs_stage1_ex200_host.aig /tmp/culs_stage1_eval/ex200.aig
python3 evaluate.py --case ex200 --output /tmp/culs_stage1_eval
```

`evaluate.py` reports `OK`, area `11861`, delay `20`, ADP `237220` for the CULS smoke output.

Wrapper diagnostics:

```bash
python3 -m student.backends.culs_flow --probe
python3 -m student.backends.culs_flow --smoke-ex200 --work-dir /tmp/culs_smoke
```

Note: running `gpuls` inside the sandbox segfaulted before optimization because the sandbox does not expose the NVIDIA device/runtime state. Run CULS directly in the shell, or use non-sandbox execution from Codex when GPU access is required.

## Script Compatibility Fixes

- Updated `student/optimizer.py` and `evaluate.py` so they run under system Python 3.6.8.
- Behavior is unchanged; changes only avoid newer Python syntax and `subprocess.run(text=True)`.

## Git / Submission Note

Large downloaded tools and build outputs are ignored in `.gitignore` to avoid another GitHub large-file push failure. They exist locally for development, but final reproducibility should eventually use setup scripts or documented clone/build commands instead of committing full tool checkouts and conda environments.
