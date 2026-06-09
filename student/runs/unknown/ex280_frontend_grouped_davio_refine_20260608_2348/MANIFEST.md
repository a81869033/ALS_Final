# ex280 Grouped Davio Refinement

Created: 2026-06-08 23:48 +0800

## Hypothesis

The grouped-Davio near miss for `ex280` may depend on the output group size and
whether the group order is selected by node count or depth.  This run refines
only `ex280` with `highN`, `splitN`, and `lowN` group modes.

## Scope

- Case: `ex280`
- Transform: `prefix_parity_reduce`
- Thresholds: `0`, `1`
- Group modes: `high2..high7`, `split2..split7`, `low2..low5`, `perbit`
- Order metrics: `node`, `depth`
- Generator: `student/generators/unknown_anf_grouped_davio_search.py`
- Work directory: `student/work/ex280_frontend_grouped_davio_refine_20260608_2348/`

## Results

- Candidates: `results/candidates.csv`
- Best per case: `results/best.csv`
- Summary: `results/summary.csv`
- Generator evaluate check: `results/evaluate_check.csv`
- Official replay: `results/evaluate_replay.csv`
- Best AIG copies for this run only: `best_aigs/`

All 68 emitted candidates were equivalent and officially replayed through
`evaluate.py` (`68/68 OK`).  No raw candidate beat current.

Best raw ADP:

- `ex280`: `722/27/19494`

## Conclusion

Raw group-size refinement did not win, but the `deg1 high4 node` source was
structurally promising and was carried to the narrow `abc_g_aig` synthflow.
