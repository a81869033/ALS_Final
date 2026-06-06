# Results Directory

`student/results/` is for active, high-value CSV files only:

- current merged candidate CSVs
- current best CSVs
- baseline summaries
- small metadata files

Do not keep every round or trial CSV here. After a run is summarized, move
round-specific files into:

```text
student/archive/<cleanup_or_run_name>/results/
```

For finding Verilog candidates, start from:

```text
student/runs/index.md
```
