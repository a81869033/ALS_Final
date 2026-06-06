# Run Registry

This directory is the entry point for experiment outputs that should remain
easy to find.

Each run gets one stable directory:

```text
student/runs/<domain>/<run_id>/
  MANIFEST.md
  results/
    candidates.csv
    best.csv
    summary.csv
    history.csv
```

Large generated files stay in `student/work/` unless the run is small. The
manifest must point to the matching work directory, generator, script, and
result CSV files.

Use `student/runs/index.md` first when looking for a previous Verilog run.

For the full workflow and required files for future runs, read:

```text
student/docs/experiment_run_workflow.md
```
