# Run Naming

For the full run workflow, required files, and cleanup rules, see
`student/docs/experiment_run_workflow.md`.

Use this format for every future run:

```text
<cases>_<stage>_<method>_<YYYYMMDD_HHMM>
```

Examples:

```text
ex280_frontend_bdd_20260605_1430
ex280_ex299_frontend_algebraic_20260605_1510
ex200_ex219_frontend_bf16_semantic_20260605_1600
ex280_backend_abc9_deepsyn_20260605_1700
```

Required directories for a run:

```text
student/work/<run_id>/
  exNNN/
    verilog/
    aigs/
    logs/
student/runs/<domain>/<run_id>/
  MANIFEST.md
  results/
```

Required result files:

- `candidates.csv`: all verified candidates from this run.
- `best.csv`: one best row per case, or one row for a single-case run.
- `summary.csv`: aggregate comparison when available.
- `history.csv`: backend iteration history when applicable.

Required CSV columns for frontend Verilog runs:

```text
case,candidate_id,hypothesis,variant,verilog_path,aig_path,verified_truth,equivalent,area,delay,adp,notes
```

Required CSV columns for backend runs:

```text
case,candidate_id,parent_id,source,tool_chain,aig_path,area,delay,adp,equivalent,runtime_sec,notes
```

Do not leave round-specific intermediate CSVs directly in `student/results/`.
Move them under `student/archive/<cleanup_or_run_name>/` after extracting the
best/current result into `student/runs/.../results/`.
