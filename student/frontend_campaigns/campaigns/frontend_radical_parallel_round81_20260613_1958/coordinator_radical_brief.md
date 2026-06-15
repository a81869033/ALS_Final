# Round81 Coordinator Radical Brief

This round should not spend most effort on source-boundary or spelling variants.
Every evaluated candidate should be tied to a materially different high-level
description, representation family, or sharing basis.

## Priority

Current-ratio `>1.5` cases excluding `ex286` and `ex287`:

- FP8 conversion: `ex247`, `ex246`, `ex244`, `ex249`, `ex241`, `ex240`, `ex245`
- Unknown: `ex297`, `ex299`, `ex285`, `ex288`
- Integer: `ex260`, `ex266`
- FP16: `ex225`, `ex223`

Frontend-ratio-only structural samples:

- `ex248`, `ex292`, `ex294`, `ex274`, `ex276`

## Required Difference From Recent Rounds

- FP8: do not repeat output regrouping, highfanout bitout, step-onehot,
  zero-product-bypass, or sat-delta-tail as the main idea. Try exact threshold
  and rounding predicate networks, class-decode output equations, or compact
  residuals over exponent bands.
- Unknown routing/global-state: do not repeat selected-bit hybrids, mod4 mirror
  cofactor as-is, route/keyBDD variants, or stride2 descriptor residuals.
  Try different descriptor bases or larger shared cofactor roots.
- Unknown rot2/cell: do not repeat pair89, adjacent celllocal bit clusters,
  hightail, or edge-quads. Try a symbol-transition descriptor, cyclic
  representative, or multi-output cofactor DAG.
- Integer: do not repeat keep/common-wire or compact boundary variants. Try
  materially different arithmetic structures.
- FP16: do not repeat output-boundary, special-constant, or hi6 residual
  variants. Try formula-oriented or interval/root factoring.

## Acceptance

Only official `evaluate.py` equivalent rows with area, delay, ADP, Verilog,
AIG, and log paths are candidate successes. Non-equivalent, synthesis-failed,
or skipped low-value directions should be recorded in `failed_hypotheses.csv`.
