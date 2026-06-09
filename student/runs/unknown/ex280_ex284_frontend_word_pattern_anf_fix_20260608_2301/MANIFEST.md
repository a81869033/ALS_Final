# ex280-ex284 Masked Word-Pattern ANF

Created: 2026-06-08 23:01 +0800

## Hypothesis

The prefix-key ANF terms may be compact as word-level shift/rotate/AND/XOR
features.  For each ANF monomial, this run records the offsets of its input
variables relative to the output bit.  Equal offset patterns are emitted once
as a rotated-key word AND, masked to the output bit positions where that
pattern occurs, then XORed into the result.

This tests whether `ex280-ex284` are closer to a vector stencil than to
independent bit equations.

## Scope

- Cases: `ex280`, `ex281`, `ex282`, `ex283`, `ex284`
- Transform: `prefix_parity_reduce`
- Generator: `student/generators/unknown_word_pattern_anf_search.py`
- Work directory: `student/work/ex280_ex284_frontend_word_pattern_anf_fix_20260608_2301/`

## Results

- Candidates: `results/candidates.csv`
- Best per case: `results/best.csv`
- Summary: `results/summary.csv`
- Generator evaluate check: `results/evaluate_check.csv`
- Official replay: `results/evaluate_replay.csv`
- Best AIG copies for this run only: `best_aigs/`

All 5 emitted candidates were truth-model exact, synthesized, equivalent, and
officially replayed through `evaluate.py` (`5/5 OK`).  No candidate beat the
current best for any case.

Best ADPs:

- `ex280`: `3103/28/86884`
- `ex281`: `3634/27/98118`
- `ex282`: `4050/28/113400`
- `ex283`: `4438/30/133140`
- `ex284`: `4996/30/149880`

## Conclusion

Relative offset patterns exist, but the masked word-level representation is
not a compact AIG source.  It reduces the number of syntactic ANF groups versus
per-bit monomials, yet the many masked word AND/XOR features synthesize to far
larger area than the prefix-key cofactor BDD family.  Do not repeat this
masked word-pattern ANF source form without a much smaller selected pattern
set or a different word-level recurrence.
