# ex286_frontend_multipair_symbdd_20260609_0631

- Run ID: `ex286_frontend_multipair_symbdd_20260609_0631`
- Scope: `ex286`
- Work dir: `student/work/ex286_frontend_multipair_symbdd_20260609_0631/`
- Results dir: `student/runs/unknown/ex286_frontend_multipair_symbdd_20260609_0631/results/`
- Purpose: Raw multi-pair symmetry BDD for ex286. Exact but worse than cofactor class-onehot.

## Results

See `results/candidates.csv`, `results/best.csv`, `results/summary.csv`, and `results/evaluate_check.csv`.

```csv
case,candidate_id,hypothesis,variant,verilog_path,aig_path,area,delay,adp,items,notes
ex286,ex286_unknown_symbdd_interleave_f00,unknown_symmetry_canonical_bdd,interleave_f00,student/work/ex286_frontend_multipair_symbdd_20260609_0631/ex286/verilog/ex286_unknown_symbdd_interleave_f00.v,student/work/ex286_frontend_multipair_symbdd_20260609_0631/ex286/aigs/ex286_unknown_symbdd_interleave_f00.aig,1442,18,25956,"pairs=4:5,6:7; order=interleave; invalid_policy=f00; bdd_nodes=820; hash=f4235f0bfcbc",unknown symmetry-canonical shared-BDD seed
```

