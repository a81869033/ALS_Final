# ex280-ex284 Layered ANF/Davio

Created: 2026-06-08 22:22 +0800

## Hypothesis

The `ex280-ex284` functions have degree-4 ANF with a visible low-degree
linear/quadratic skeleton.  A source form that emits low-degree terms as shared
product/XOR logic and only sends the higher-degree residual through a shared
Davio DAG might reduce area or delay versus the previous whole-polynomial
Davio source.

## Scope

- Cases: `ex280`, `ex281`, `ex282`, `ex283`, `ex284`
- Transform: `identity`
- Low-degree thresholds: `1`, `2`, `3`
- Residual order: `best_residual`
- Generator: `student/generators/unknown_anf_layered_davio_search.py`
- Work directory: `student/work/ex280_ex284_frontend_layered_anf_davio_20260608_2228/`

## Results

- Candidates: `results/candidates.csv`
- Best per case: `results/best.csv`
- Summary: `results/summary.csv`
- Generator evaluate check: `results/evaluate_check.csv`
- Official replay: `results/evaluate_replay.csv`
- Best AIG copies for this run only: `best_aigs/`

All 15 emitted candidates were truth-model exact, synthesized, equivalent, and
officially replayed through `evaluate.py` (`15/15 OK`).  No candidate beat the
current best for any case.

Best ADPs:

- `ex280`: `1198/27/32346`
- `ex281`: `1501/29/43529`
- `ex282`: `1699/33/56067`
- `ex283`: `2059/35/72065`
- `ex284`: `2315/39/90285`

## Conclusion

Separating the low-degree ANF skeleton is not the missing large-improvement
structure.  The residual Davio graph still dominates delay and area, and higher
thresholds increase area faster than they reduce delay.  Do not expand this
same layered ANF/Davio family without a materially different recurrence or
field-basis hypothesis.
