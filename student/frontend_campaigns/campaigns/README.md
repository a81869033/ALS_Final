# Campaign Result Directories

Create one subdirectory per frontend campaign:

```text
<run_id>/
  MANIFEST.md
  task_assignments.md
  results/
    candidates.csv
    best_improvements.csv
    failed_hypotheses.csv
    simulation_results.csv
    evaluation_results.csv
    shared_structure_report.csv
```

Keep bulky Verilog, AIG, and logs in `student/work/<run_id>`.
