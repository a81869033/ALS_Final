# ABC ST Baseline

Generated on 2026-05-31.

This baseline uses the starter ABC flow in `student/optimizer.py`:

```bash
python3 student/optimizer.py --output baselines/abc_st/aigs
```

For each `benchmarks/exNNN.truth`, the flow runs:

```abc
read_truth -xf benchmarks/exNNN.truth; st; write_aiger -s baselines/abc_st/aigs/exNNN.aig
```

Evaluation command:

```bash
python3 evaluate.py --output baselines/abc_st/aigs
```

Results:

- Equivalent cases: 100/100
- Total ADP: 180343842

Files:

- `aigs/`: baseline AIG files.
- `evaluate.txt`: full `evaluate.py` report.
- `scores.csv`: machine-readable per-case score table.
