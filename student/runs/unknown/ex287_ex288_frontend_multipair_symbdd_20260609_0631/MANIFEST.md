# ex287_ex288_frontend_multipair_symbdd_20260609_0631

- Run ID: `ex287_ex288_frontend_multipair_symbdd_20260609_0631`
- Scope: `ex287, ex288`
- Work dir: `student/work/ex287_ex288_frontend_multipair_symbdd_20260609_0631/`
- Results dir: `student/runs/unknown/ex287_ex288_frontend_multipair_symbdd_20260609_0631/results/`
- Purpose: Raw multi-pair symmetry BDD for ex287/ex288. Exact but worse than cofactor/current.

## Results

See `results/candidates.csv`, `results/best.csv`, `results/summary.csv`, and `results/evaluate_check.csv`.

```csv
case,candidate_id,hypothesis,variant,verilog_path,aig_path,area,delay,adp,items,notes
ex287,ex287_unknown_symbdd_interleave_f10,unknown_symmetry_canonical_bdd,interleave_f10,student/work/ex287_ex288_frontend_multipair_symbdd_20260609_0631/ex287/verilog/ex287_unknown_symbdd_interleave_f10.v,student/work/ex287_ex288_frontend_multipair_symbdd_20260609_0631/ex287/aigs/ex287_unknown_symbdd_interleave_f10.aig,1759,18,31662,"pairs=4:5,6:7,8:9; order=interleave; invalid_policy=f10; bdd_nodes=1088; hash=a4f939e3e2a6",unknown symmetry-canonical shared-BDD seed
ex288,ex288_unknown_symbdd_interleave_f10,unknown_symmetry_canonical_bdd,interleave_f10,student/work/ex287_ex288_frontend_multipair_symbdd_20260609_0631/ex288/verilog/ex288_unknown_symbdd_interleave_f10.v,student/work/ex287_ex288_frontend_multipair_symbdd_20260609_0631/ex288/aigs/ex288_unknown_symbdd_interleave_f10.aig,1956,20,39120,"pairs=4:5,6:7,8:9; order=interleave; invalid_policy=f10; bdd_nodes=1170; hash=d66e469102fa",unknown symmetry-canonical shared-BDD seed
```

